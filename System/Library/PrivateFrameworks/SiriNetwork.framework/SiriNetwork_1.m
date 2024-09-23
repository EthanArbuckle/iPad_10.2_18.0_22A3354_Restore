uint64_t outlined init with take of ConnectionInterfaceReport?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_0_44()
{
  Swift::String v0;

  v0._countAndFlagsBits = 8236;
  v0._object = (void *)0xE200000000000000;
  String.append(_:)(v0);
}

void OUTLINED_FUNCTION_5_23(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_7_19()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_8_20(Swift::String a1)
{
  String.append(_:)(a1);
}

void OUTLINED_FUNCTION_9_21(unint64_t a1@<X8>)
{
  unint64_t v1;

  STACK[0x2D8] = a1;
  STACK[0x2E0] = v1;
}

void Data.init(copying:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for DispatchData();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_0();
  outlined init with copy of DispatchData?(a1, (uint64_t)v5);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    outlined destroy of DispatchData?(a1);
    outlined destroy of DispatchData?((uint64_t)v5);
  }
  else
  {
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(v1, v5, v6);
    v8 = DispatchData.count.getter();
    v11 = MEMORY[0x24956C944](v8);
    v12 = v9;
    MEMORY[0x24BDAC7A8](v11);
    *(_QWORD *)&v10[-16] = v1;
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    outlined destroy of DispatchData?(a1);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  }
  OUTLINED_FUNCTION_10_4();
}

const __CFData *Data.init(fromCFData:)(const __CFData *result)
{
  const __CFData *v1;

  if (result)
  {
    v1 = result;
    if (CFDataGetBytePtr(result))
    {
      CFDataGetLength(v1);
      Data.append(_:count:)();
    }

    return 0;
  }
  return result;
}

uint64_t closure #1 in Data.init(copying:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for DispatchData();
  lazy protocol witness table accessor for type DispatchData and conformance DispatchData();
  result = DataProtocol.copyBytes(to:)();
  *a1 = result;
  return result;
}

void Data.init(instance:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  const void *v13;
  CFTypeID v14;
  const __CFData *v15;
  uint64_t v16;
  CFDataRef v17;
  __int128 v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  v9 = type metadata accessor for DispatchData();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_45();
  if ((swift_dynamicCast() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_45();
    if ((swift_dynamicCast() & 1) != 0)
    {
      OUTLINED_FUNCTION_2_28((uint64_t)v8, 0);
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v1, v8, v9);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v6, v1, v9);
      OUTLINED_FUNCTION_2_28((uint64_t)v6, 0);
      Data.init(copying:)((uint64_t)v6);
      v12 = v11;
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v9);
      if (v12 >> 60 != 15)
        goto LABEL_12;
    }
    else
    {
      OUTLINED_FUNCTION_2_28((uint64_t)v8, 1);
      outlined destroy of DispatchData?((uint64_t)v8);
    }
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v13 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    v14 = CFGetTypeID(v13);
    swift_unknownObjectRelease();
    if (v14 == CFDataGetTypeID())
    {
      OUTLINED_FUNCTION_0_45();
      type metadata accessor for CFDataRef(0);
      swift_dynamicCast();
      v15 = v17;
      if (CFDataGetBytePtr(v17))
      {
        v18 = xmmword_246F725C0;
        CFDataGetLength(v15);
        Data.append(_:count:)();
      }

    }
  }
LABEL_12:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  OUTLINED_FUNCTION_10_4();
}

uint64_t outlined destroy of DispatchData?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of DispatchData?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchData?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in Data.init(copying:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in Data.init(copying:)(a1);
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

_QWORD *sub_246F490F4@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  _QWORD *v12;

  v7 = v4;
  LOWORD(v8) = a1;
  BYTE2(v8) = BYTE2(a1);
  HIBYTE(v8) = BYTE3(a1);
  v9 = BYTE4(a1);
  v10 = BYTE5(a1);
  v11 = BYTE6(a1);
  result = v3(&v12, &v7, (char *)&v7 + BYTE6(a1));
  if (!v2)
    result = v12;
  v6 = v8 | ((unint64_t)v9 << 32) | ((unint64_t)v10 << 40) | ((unint64_t)v11 << 48);
  *v1 = v7;
  v1[1] = v6;
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchData and conformance DispatchData()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    v1 = type metadata accessor for DispatchData();
    result = MEMORY[0x24956DF70](MEMORY[0x24BDCF7E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_45()
{
  uint64_t v0;
  uint64_t v1;

  return outlined init with copy of Any(v0, v1 - 96);
}

uint64_t OUTLINED_FUNCTION_2_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

id ConnectionMetrics.snConnectionMetrics.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SEL *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  Class isa;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  Class v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212[89];
  int v213;
  char v214;
  uint64_t v215;
  char v216;
  uint64_t v217;
  uint64_t v218;
  char v219;
  char v220;
  uint64_t v221;
  char v222;
  char v223;
  char v224;
  char v225;
  char v226;
  char v227;
  uint64_t v228;
  char v229;
  char v230;
  char v231;
  char v232;
  char v233;
  _QWORD __dst[180];
  _BYTE v235[720];

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  outlined init with take of ConnectionSnapshotReport?(v0 + 568, (uint64_t)v235, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  v5 = *(_QWORD *)(v0 + 1296);
  v148 = *(_QWORD *)(v0 + 1288);
  v152 = *(_QWORD *)(v0 + 1304);
  v6 = *(_QWORD *)(v0 + 1312);
  v136 = *(_QWORD *)(v0 + 1320);
  v7 = *(double *)(v0 + 1336);
  LODWORD(v160) = *(unsigned __int8 *)(v0 + 1328);
  HIDWORD(v160) = *(unsigned __int8 *)(v0 + 1344);
  v8 = *(double *)(v0 + 1352);
  v9 = *(_QWORD *)(v0 + 1376);
  HIDWORD(v132) = *(_DWORD *)(v0 + 1384);
  HIDWORD(v156) = *(unsigned __int8 *)(v0 + 1388);
  v10 = *(double *)(v0 + 1392);
  LODWORD(v164) = *(unsigned __int8 *)(v0 + 1360);
  HIDWORD(v164) = *(unsigned __int8 *)(v0 + 1400);
  v11 = *(double *)(v0 + 1408);
  v140 = *(_QWORD *)(v0 + 1424);
  v144 = *(_QWORD *)(v0 + 1368);
  LODWORD(v168) = *(unsigned __int8 *)(v0 + 1416);
  HIDWORD(v168) = *(unsigned __int8 *)(v0 + 1432);
  v12 = objc_msgSend(objc_allocWithZone((Class)SNConnectionMetrics), sel_init);
  if (*(_QWORD *)(v3 + 16))
  {
    v13 = memcpy(__dst, (const void *)(v3 + 32), 0x599uLL);
    v14 = (void *)ConnectionMetrics.snConnectionMetrics.getter(v13);
    OUTLINED_FUNCTION_3_24((uint64_t)v14, sel_setRemoteMetrics_);

  }
  if (v2[2])
  {
    specialized _arrayForceCast<A, B>(_:)((uint64_t)v2);
    Array._bridgeToObjectiveC()();
    v15 = OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_2_29(v15, sel_setConnectionMethodHistory_);

  }
  if (v4)
  {
    v16 = (void *)MEMORY[0x24956D034](v1, v4);
    OUTLINED_FUNCTION_3_24((uint64_t)v16, sel_setPolicyId_);

  }
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v235, (uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  v17 = _s11SiriNetwork24ConnectionSnapshotReportVSgWOg((uint64_t)__dst);
  v25 = (SEL *)&selRef_carrierBundleChange_;
  if ((_DWORD)v17 == 1)
  {
LABEL_62:
    if (!v9)
      goto LABEL_64;
    goto LABEL_63;
  }
  OUTLINED_FUNCTION_4_24(v17, v18, v19, v20, v21, v22, v23, v24, v127, v132, v136, v140, v144, v148, v152, v156, v160, v164, v168,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212[0]);
  outlined retain of ConnectionSnapshotReport((uint64_t)__dst);
  v26 = ConnectionSnapshotReport.netConnectionSnapshot.getter();
  OUTLINED_FUNCTION_3_24((uint64_t)v26, sel_setConnectionSnapshot_);

  OUTLINED_FUNCTION_4_24(v27, v28, v29, v30, v31, v32, v33, v34, v128, v133, v137, v141, v145, v149, v153, v157, v161, v165, v169,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212[0]);
  v35 = ConnectionSnapshotReport.netDebugConnectionSnapshot.getter();
  OUTLINED_FUNCTION_3_24((uint64_t)v35, sel_setDebugConnectionSnapshot_);

  v36 = (void *)MEMORY[0x24956D034](__dst[1], __dst[2]);
  OUTLINED_FUNCTION_3_24((uint64_t)v36, sel_setProviderStyle_);

  v37 = (void *)MEMORY[0x24956D034](__dst[3], __dst[4]);
  OUTLINED_FUNCTION_3_24((uint64_t)v37, sel_setSnapshotTriggerReason_);

  OUTLINED_FUNCTION_10_18(v38, (uint64_t)&v213, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v39 = _s11SiriNetwork010ConnectionB6ReportVSgWOg((uint64_t)&v213);
  if ((_DWORD)v39 != 1)
  {
    if (v215)
    {
      OUTLINED_FUNCTION_12_16(v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of ConnectionNetworkReport?);
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_7_20();
    }
    OUTLINED_FUNCTION_10_18(v39, (uint64_t)v212, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
    outlined retain of ConnectionNetworkReport((uint64_t)v212);
    if (v221)
    {
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_7_20();
    }
    if (v218)
    {
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_7_20();
    }
    v47 = OUTLINED_FUNCTION_0_32();
    v48 = OUTLINED_FUNCTION_0_6(v47, sel_initWithBool_);
    OUTLINED_FUNCTION_3_24((uint64_t)v48, sel_setIsCaptive_);

    if ((v231 & 1) == 0)
    {
      v50 = OUTLINED_FUNCTION_0_32();
      v51 = OUTLINED_FUNCTION_5_24(v50);
      OUTLINED_FUNCTION_3_24((uint64_t)v51, sel_setRssi_);

    }
    if ((v232 & 1) == 0)
    {
      v52 = OUTLINED_FUNCTION_0_32();
      v53 = OUTLINED_FUNCTION_5_24(v52);
      OUTLINED_FUNCTION_3_24((uint64_t)v53, sel_setSnr_);

    }
    if ((v233 & 1) == 0)
    {
      v54 = OUTLINED_FUNCTION_0_32();
      v55 = OUTLINED_FUNCTION_5_24(v54);
      OUTLINED_FUNCTION_3_24((uint64_t)v55, sel_setCca_);

    }
    if ((v214 & 1) == 0)
    {
      v56 = OUTLINED_FUNCTION_0_32();
      v57 = OUTLINED_FUNCTION_0_6(v56, sel_initWithUnsignedInt_);
      OUTLINED_FUNCTION_3_24((uint64_t)v57, sel_setAttemptCount_);

    }
    if ((v230 & 1) == 0)
    {
      v58 = OUTLINED_FUNCTION_0_32();
      v59 = OUTLINED_FUNCTION_5_24(v58);
      OUTLINED_FUNCTION_3_24((uint64_t)v59, sel_setTimeUntilFirstByteRead_);

    }
    if ((v222 & 1) == 0)
    {
      v60 = OUTLINED_FUNCTION_0_32();
      v61 = OUTLINED_FUNCTION_6_17(v60);
      OUTLINED_FUNCTION_3_24((uint64_t)v61, sel_setDnsResolutionTime_);

    }
    if ((v223 & 1) == 0)
    {
      v62 = OUTLINED_FUNCTION_0_32();
      v63 = OUTLINED_FUNCTION_6_17(v62);
      OUTLINED_FUNCTION_3_24((uint64_t)v63, sel_setConnectionStartTimeToDNSResolutionTimeMsec_);

    }
    if (v228)
    {
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_7_20();
    }
    if ((v227 & 1) == 0)
    {
      v64 = OUTLINED_FUNCTION_0_32();
      v65 = OUTLINED_FUNCTION_6_17(v64);
      OUTLINED_FUNCTION_3_24((uint64_t)v65, sel_setTlsHandshakeTimeMsec_);

    }
    if ((v224 & 1) == 0)
    {
      v66 = OUTLINED_FUNCTION_0_32();
      v67 = OUTLINED_FUNCTION_6_17(v66);
      OUTLINED_FUNCTION_3_24((uint64_t)v67, sel_setConnectionEstablishmentTimeMsec_);

    }
    if ((v225 & 1) == 0)
    {
      v68 = OUTLINED_FUNCTION_0_32();
      v69 = OUTLINED_FUNCTION_6_17(v68);
      OUTLINED_FUNCTION_3_24((uint64_t)v69, sel_setConnectionStartTimeToConnectionEstablishmentTimeMsec_);

    }
    if ((v226 & 1) == 0)
    {
      v70 = OUTLINED_FUNCTION_0_32();
      v71 = OUTLINED_FUNCTION_6_17(v70);
      OUTLINED_FUNCTION_3_24((uint64_t)v71, sel_setConnectionStartTimeToTLSHandshakeTimeMsec_);

    }
    if (v217)
    {
      OUTLINED_FUNCTION_4_15();
      OUTLINED_FUNCTION_7_20();
    }
    if ((v216 & 1) == 0)
    {
      v72 = OUTLINED_FUNCTION_0_32();
      v73 = OUTLINED_FUNCTION_5_24(v72);
      OUTLINED_FUNCTION_3_24((uint64_t)v73, sel_setSignalStrengthBars_);

    }
    if ((v229 & 1) == 0)
    {
      v74 = OUTLINED_FUNCTION_0_32();
      v75 = OUTLINED_FUNCTION_5_24(v74);
      OUTLINED_FUNCTION_3_24((uint64_t)v75, sel_setTimeUntilOpen_);

    }
    v25 = (SEL *)&selRef_carrierBundleChange_;
    if ((v219 & 1) == 0)
    {
      v76 = OUTLINED_FUNCTION_0_32();
      v77 = OUTLINED_FUNCTION_0_6(v76, sel_initWithUnsignedInt_);
      OUTLINED_FUNCTION_3_24((uint64_t)v77, sel_setConnectedSubflowCount_);

    }
    v39 = OUTLINED_FUNCTION_12_16(v49, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of ConnectionNetworkReport?);
    if ((v220 & 1) == 0)
    {
      v78 = OUTLINED_FUNCTION_0_32();
      v79 = OUTLINED_FUNCTION_0_6(v78, sel_initWithUnsignedInt_);
      OUTLINED_FUNCTION_3_24((uint64_t)v79, sel_setConnectedSubflowCount_);

    }
  }
  OUTLINED_FUNCTION_4_24(v39, v40, v41, v42, v43, v44, v45, v46, v129, v134, v138, v142, v146, v150, v154, v158, v162, v166, v170,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212[0]);
  v80 = *(_QWORD *)(ConnectionSnapshotReport.flowNetworkInterfaceType.getter() + 16);
  v81 = swift_bridgeObjectRelease();
  if (v80)
  {
    OUTLINED_FUNCTION_4_24(v81, v82, v83, v84, v85, v86, v87, v88, v130, v135, v139, v143, v147, v151, v155, v159, v163, v167, v171,
      v172,
      v173,
      v174,
      v175,
      v176,
      v177,
      v178,
      v179,
      v180,
      v181,
      v182,
      v183,
      v184,
      v185,
      v186,
      v187,
      v188,
      v189,
      v190,
      v191,
      v192,
      v193,
      v194,
      v195,
      v196,
      v197,
      v198,
      v199,
      v200,
      v201,
      v202,
      v203,
      v204,
      v205,
      v206,
      v207,
      v208,
      v209,
      v210,
      v211,
      v212[0]);
    v89 = ConnectionSnapshotReport.flowNetworkInterfaceType.getter();
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v89);
    OUTLINED_FUNCTION_45();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v91 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_24(v91, sel_setFlowNetworkInterfaceType_);

  }
  OUTLINED_FUNCTION_4_24(v81, v82, v83, v84, v85, v86, v87, v88, v130, v135, v139, v143, v147, v151, v155, v159, v163, v167, v171,
    v172,
    v173,
    v174,
    v175,
    v176,
    v177,
    v178,
    v179,
    v180,
    v181,
    v182,
    v183,
    v184,
    v185,
    v186,
    v187,
    v188,
    v189,
    v190,
    v191,
    v192,
    v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212[0]);
  v92 = *(_QWORD *)(ConnectionSnapshotReport.tcpInfoMetricsByInterfaceName.getter() + 16);
  v93 = swift_bridgeObjectRelease();
  if (v92)
  {
    OUTLINED_FUNCTION_4_24(v93, v94, v95, v96, v97, v98, v99, v100, v131, v132, v136, v140, v144, v148, v152, v156, v160, v164, v168,
      v172,
      v173,
      v174,
      v175,
      v176,
      v177,
      v178,
      v179,
      v180,
      v181,
      v182,
      v183,
      v184,
      v185,
      v186,
      v187,
      v188,
      v189,
      v190,
      v191,
      v192,
      v193,
      v194,
      v195,
      v196,
      v197,
      v198,
      v199,
      v200,
      v201,
      v202,
      v203,
      v204,
      v205,
      v206,
      v207,
      v208,
      v209,
      v210,
      v211,
      v212[0]);
    ConnectionSnapshotReport.tcpInfoMetricsByInterfaceName.getter();
    type metadata accessor for SNConnectionTCPInfoMetrics();
    Dictionary._bridgeToObjectiveC()();
    v101 = OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_2_29(v101, sel_setTCPInfoMetricsByInterfaceName_);

  }
  if ((__dst[47] & 1) == 0)
  {
    v102 = *(double *)&__dst[45];
    v103 = objc_msgSend(OUTLINED_FUNCTION_0_32(), sel_initWithUnsignedInt_, LODWORD(__dst[46]));
    OUTLINED_FUNCTION_2_29((uint64_t)v103, sel_setPingCount_);

    v25 = (SEL *)objc_msgSend(OUTLINED_FUNCTION_0_32(), sel_initWithDouble_, v102);
    OUTLINED_FUNCTION_2_29((uint64_t)v25, sel_setMeanPing_);

    v104 = OUTLINED_FUNCTION_0_32();
    v105 = OUTLINED_FUNCTION_0_6(v104, sel_initWithUnsignedInt_);
    OUTLINED_FUNCTION_3_24((uint64_t)v105, sel_setUnacknowledgedPingCount_);

  }
  OUTLINED_FUNCTION_10_18(v93, (uint64_t)v212, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v106 = _s11SiriNetwork010ConnectionB6ReportVSgWOg((uint64_t)v212);
  if ((_DWORD)v106 != 1)
  {
    v107 = v212[13];
    OUTLINED_FUNCTION_10_18(v106, (uint64_t)&v172, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
    outlined retain of ConnectionNetworkReport((uint64_t)&v172);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v107);
    Dictionary._bridgeToObjectiveC()();
    v108 = OUTLINED_FUNCTION_45();
    v109 = OUTLINED_FUNCTION_12_16(v108, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of ConnectionNetworkReport?);
    OUTLINED_FUNCTION_2_29(v109, sel_setSubflowSwitchCounts_);

  }
  v110 = __dst[87];
  if (LOBYTE(__dst[87]) == 4)
  {
    OUTLINED_FUNCTION_11_18();
    v25 = (SEL *)&selRef_carrierBundleChange_;
    if (!v9)
      goto LABEL_64;
LABEL_63:
    v116 = (void *)MEMORY[0x24956D034](v144, v9);
    OUTLINED_FUNCTION_3_24((uint64_t)v116, sel_setWifiChannelInfo_);

    goto LABEL_64;
  }
  ConnectionQualityReport.symptomsBasedNetworkQuality.getter(__dst[87]);
  v112 = *(_QWORD *)(v111 + 16);
  swift_bridgeObjectRelease();
  v25 = (SEL *)&selRef_carrierBundleChange_;
  if (v112)
  {
    ConnectionQualityReport.symptomsBasedNetworkQuality.getter(v110);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v113);
    swift_bridgeObjectRelease();
    v114 = Dictionary._bridgeToObjectiveC()().super.isa;
    v115 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_24(v115, sel_setSymptomsBasedNetworkQuality_);
    OUTLINED_FUNCTION_11_18();

    goto LABEL_62;
  }
  OUTLINED_FUNCTION_11_18();
  if (v9)
    goto LABEL_63;
LABEL_64:
  if ((v156 & 0x100000000) == 0)
  {
    v117 = objc_msgSend(OUTLINED_FUNCTION_0_32(), sel_initWithUnsignedInt_, HIDWORD(v132));
    OUTLINED_FUNCTION_3_24((uint64_t)v117, sel_setSimSubscriptions_);

  }
  if (v5)
  {
    v118 = (void *)MEMORY[0x24956D034](v148, v5);
    OUTLINED_FUNCTION_3_24((uint64_t)v118, sel_setConnectionEdgeID_);

  }
  if (v6)
  {
    v119 = (void *)MEMORY[0x24956D034](v152, v6);
    OUTLINED_FUNCTION_3_24((uint64_t)v119, sel_setConnectionEdgeType_);

  }
  if ((v160 & 1) == 0)
  {
    v120 = objc_msgSend(OUTLINED_FUNCTION_0_32(), sel_initWithUnsignedLongLong_, v136);
    OUTLINED_FUNCTION_3_24((uint64_t)v120, sel_setConnectionFallbackReason_);

  }
  if ((v160 & 0x100000000) == 0)
  {
    v121 = objc_msgSend(OUTLINED_FUNCTION_0_32(), v25[333], v7);
    OUTLINED_FUNCTION_3_24((uint64_t)v121, sel_setConnectionDelay_);

  }
  if ((v164 & 1) == 0)
  {
    v122 = objc_msgSend(OUTLINED_FUNCTION_0_32(), v25[333], v8);
    OUTLINED_FUNCTION_3_24((uint64_t)v122, sel_setFirstTxByteDelay_);

  }
  if ((v164 & 0x100000000) == 0)
  {
    v123 = objc_msgSend(OUTLINED_FUNCTION_0_32(), v25[333], v10);
    OUTLINED_FUNCTION_3_24((uint64_t)v123, sel_setIdsLastMessageDelay_);

  }
  if ((v168 & 1) == 0)
  {
    v124 = objc_msgSend(OUTLINED_FUNCTION_0_32(), v25[333], v11);
    OUTLINED_FUNCTION_3_24((uint64_t)v124, sel_setIdsLastSocketDelay_);

  }
  if ((v168 & 0x100000000) == 0)
  {
    v125 = objc_msgSend(OUTLINED_FUNCTION_0_32(), sel_initWithUnsignedLongLong_, v140);
    OUTLINED_FUNCTION_3_24((uint64_t)v125, sel_setIdsLastSocketOpenError_);

  }
  return v12;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
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
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      outlined init with take of Any(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t type metadata accessor for SNConnectionTCPInfoMetrics()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SNConnectionTCPInfoMetrics;
  if (!lazy cache variable for type metadata for SNConnectionTCPInfoMetrics)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SNConnectionTCPInfoMetrics);
  }
  return result;
}

uint64_t _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v8 = *(_BYTE *)(a1 + 312);
  v6 = *(_OWORD *)(a1 + 272);
  v7 = *(_OWORD *)(a1 + 288);
  v4 = *(_OWORD *)(a1 + 240);
  v5 = *(_OWORD *)(a1 + 256);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    *(_QWORD *)(a1 + 304),
    v8);
  return a1;
}

id OUTLINED_FUNCTION_2_29(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void *OUTLINED_FUNCTION_4_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t __dst)
{
  return memcpy(&__dst, &STACK[0x5A0], 0x2C8uLL);
}

id OUTLINED_FUNCTION_5_24(void *a1)
{
  uint64_t v1;
  double v2;

  return objc_msgSend(a1, (SEL)(v1 + 2742), v2);
}

id OUTLINED_FUNCTION_6_17(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(a1, (SEL)(v2 + 140), v1);
}

void OUTLINED_FUNCTION_7_20()
{
  JUMPOUT(0x24956D034);
}

uint64_t OUTLINED_FUNCTION_10_18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return outlined init with take of ConnectionSnapshotReport?(v3, a2, a3);
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return outlined release of ConnectionSnapshotReport?((uint64_t)&STACK[0xB40]);
}

uint64_t OUTLINED_FUNCTION_12_16(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  uint64_t v2;

  return _s11SiriNetwork010ConnectionB6ReportVSgWOsTm_0(v2, a2);
}

uint64_t dispatch thunk of SessionObject.internalAceId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SessionObject.internalAceId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SessionObject.internalAceId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of SessionObject.internalRefId.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SessionObject.serializedAceData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SessionObject.bufferingAllowedDuringActiveSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SessionObject.isRetryable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of SessionObject.isRestartable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of SessionObject.isProvisional()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of SessionObject.logDiagnostics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of SessionObject.sessionRequestId()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of SessionObject.setSessionRequestId(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 112))();
}

uint64_t dispatch thunk of SessionObject.supportedByLocalSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of SessionObject.supportedByRemoteLimitedSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

void ZlibDataCompressor.init()()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v1 = swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 128) = v1;
  *(_DWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_DWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_DWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  OUTLINED_FUNCTION_1();
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  v2 = deflateInit_((z_streamp)(v0 + 16), 9, "1.2.12", 112);
  swift_endAccess();
  if (v2)
    swift_release();
  OUTLINED_FUNCTION_4();
}

void ZlibDataCompressor.deinit()
{
  uint64_t v0;

  MEMORY[0x24956E018](*(_QWORD *)(v0 + 128), -1, -1);
  OUTLINED_FUNCTION_1();
  deflateEnd((z_streamp)(v0 + 16));
  swift_endAccess();
  OUTLINED_FUNCTION_4();
}

uint64_t ZlibDataCompressor.__deallocating_deinit()
{
  ZlibDataCompressor.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ZlibDataCompressor()
{
  return objc_opt_self();
}

uint64_t ZlibDataCompressor.compressedDataForData(_:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    __asm { BR              X9 }
  return 0;
}

uint64_t closure #1 in ZlibDataCompressor.compressedDataForData(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, __int128 *a3@<X8>)
{
  unint64_t v6;
  int v7;
  const void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  _BYTE __dst[14];
  unsigned __int8 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    swift_beginAccess();
    *(_QWORD *)(a2 + 16) = a1;
  }
  v6 = Data.count.getter();
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_25;
  v7 = v6;
  if (HIDWORD(v6))
    goto LABEL_25;
  swift_beginAccess();
  *(_DWORD *)(a2 + 24) = v7;
  v26 = xmmword_246F725C0;
  v8 = *(const void **)(a2 + 128);
  while (1)
  {
    swift_beginAccess();
    *(_QWORD *)(a2 + 40) = v8;
    *(_DWORD *)(a2 + 48) = 0x2000;
    v9 = deflate((z_streamp)(a2 + 16), 2);
    swift_endAccess();
    if (v9 > 1)
      break;
    v10 = *(unsigned int *)(a2 + 48);
    if ((_DWORD)v10 == 0x2000)
    {
      v11 = 0;
      v12 = 0xC000000000000000;
    }
    else
    {
      v13 = 0x2000 - v10;
      if (v10 >> 1 >= 0xFF9)
      {
        memset(__dst, 0, sizeof(__dst));
        v25 = -(char)v10;
        memcpy(__dst, v8, v13);
        v11 = *(_QWORD *)__dst;
        v12 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v25 << 48);
      }
      else
      {
        type metadata accessor for __DataStorage();
        swift_allocObject();
        v11 = v13 << 32;
        v12 = __DataStorage.init(bytes:length:)() | 0x4000000000000000;
      }
    }
    if (*((_QWORD *)&v26 + 1) >> 60 != 15)
      Data.append(_:)();
    result = outlined consume of Data._Representation(v11, v12);
    if (v9 || *(_DWORD *)(a2 + 48))
    {
      *a3 = v26;
      return result;
    }
  }
  if (!*(_QWORD *)(a2 + 64))
  {
    __break(1u);
LABEL_25:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v15 = String.init(cString:)();
  v17 = v16;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.siriNetwork);
  swift_bridgeObjectRetain();
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    *(_QWORD *)__dst = v22;
    *(_DWORD *)v21 = 67109378;
    swift_beginAccess();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v21 + 8) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, (uint64_t *)__dst);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246EC7000, v19, v20, "DataCompressor - Compression: Deflate finished with unexpected status %d %s", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v22, -1, -1);
    MEMORY[0x24956E018](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  outlined consume of Data?(v26, *((unint64_t *)&v26 + 1));
  v26 = xmmword_246F725D0;
  swift_beginAccess();
  lazy protocol witness table accessor for type DataCompressorError and conformance DataCompressorError();
  swift_allocError();
  *v23 = v9;
  swift_willThrow();
  return outlined consume of Data?(v26, *((unint64_t *)&v26 + 1));
}

uint64_t protocol witness for DataCompressing.compressedDataForData(_:) in conformance ZlibDataCompressor(uint64_t a1, unint64_t a2)
{
  return ZlibDataCompressor.compressedDataForData(_:)(a1, a2);
}

uint64_t _ss15withUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_A13Et_sAC_p10Foundation4DataVSgTg5015_s10Foundation4h18V06InlineB0V15withB33BytesyxxSWKXEKlFxSWKXEfU_ACSg_TG5SWxsAC_pRi_zRi0_zlyAIIsgyrzo_SiTf1nnc_n021_s11SiriNetwork18ZlibH64CompressorC010compressedd3ForD0y10Foundation0D0VSgAHKFAHSWKXEfU_0V7Network0xhY0CAHTf1nncn_n@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, __int128 *a6@<X8>)
{
  uint64_t v9;
  __int16 v10;
  char v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = BYTE2(a2);
  v12 = BYTE3(a2);
  v13 = BYTE4(a2);
  v14 = BYTE5(a2);
  closure #1 in ZlibDataCompressor.compressedDataForData(_:)((uint64_t)&v9, a3, a6);
  swift_release();
  return outlined consume of Data._Representation(a4, a5);
}

uint64_t OUTLINED_FUNCTION_0_46@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  return specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(a1, a2, v3, v4, v5, a3);
}

void *ConnectionPreparationReport.netDebugConnectionStatePreparationSnapshot.getter()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  uint64_t __dst[37];
  uint64_t v38;

  v2 = *v0;
  v1 = (void *)v0[1];
  v3 = v0[3];
  v4 = *((unsigned __int8 *)v0 + 33);
  v5 = *((unsigned __int8 *)v0 + 34);
  v6 = *((unsigned __int8 *)v0 + 35);
  v34 = *((unsigned __int8 *)v0 + 36);
  v7 = v0[42];
  v35 = v0[43];
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952B8]), sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    if (v1)
      v1 = (void *)MEMORY[0x24956D034](v2, v1);
    objc_msgSend(v9, sel_setConnectionInfo_, v1);

    if (v3)
    {
      OUTLINED_FUNCTION_4_11();
      v11 = v9;
      static NetworkAnalytics.netPathStatus(from:)();
      objc_msgSend(v11, sel_setStatus_, v12);

    }
  }
  objc_msgSend(v9, sel_setIsConstrained_, v5);
  objc_msgSend(v9, sel_setIsExpensive_, v4);
  objc_msgSend(v9, sel_setHasIpv4_, v6);
  v36 = v9;
  objc_msgSend(v9, sel_setHasIpv6_, v34);
  v13 = *(_QWORD *)(v7 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v38 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v15 = v13 - 1;
    for (i = 32; ; i += 296)
    {
      memcpy(__dst, (const void *)(v7 + i), 0x121uLL);
      v17 = objc_allocWithZone(MEMORY[0x24BE95328]);
      outlined retain of ConnectionInterfaceReport((uint64_t)__dst);
      v18 = objc_msgSend(v17, sel_init);
      if (v18)
      {
        v19 = __dst[0];
        v20 = __dst[1];
        v21 = v18;
        outlined bridged method (mbgnn) of @objc NETSchemaNETPathInterface.name.setter(v19, v20, v21);

        objc_msgSend(v21, sel_setIndex_, HIDWORD(__dst[4]));
        OUTLINED_FUNCTION_4_11();
        v22 = v21;
        static NetworkAnalytics.netPathType(from:)();
        objc_msgSend(v22, sel_setType_, v23);

        outlined release of ConnectionInterfaceReport((uint64_t)__dst);
        v24 = v22;
        MEMORY[0x24956D118]();
        if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

        if (!v15)
        {
LABEL_15:
          OUTLINED_FUNCTION_6_1();
          if (v36)
            outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(v38, v36, &lazy cache variable for type metadata for NETSchemaNETPathInterface, 0x24BE95328, (SEL *)&selRef_setPathInterfaces_);
          else
            swift_bridgeObjectRelease();
          v14 = MEMORY[0x24BEE4AF8];
          break;
        }
      }
      else
      {
        objc_msgSend(0, sel_setIndex_, HIDWORD(__dst[4]));
        outlined release of ConnectionInterfaceReport((uint64_t)__dst);
        if (!v15)
          goto LABEL_15;
      }
      --v15;
    }
  }
  v25 = *(_QWORD *)(v35 + 16);
  if (v25)
  {
    __dst[0] = v14;
    swift_bridgeObjectRetain();
    v26 = (unsigned int *)(v35 + 52);
    do
    {
      v28 = *(v26 - 1);
      v27 = *v26;
      v29 = objc_allocWithZone(MEMORY[0x24BE952F0]);
      swift_bridgeObjectRetain();
      v30 = objc_msgSend(v29, sel_init);
      if (v30)
      {
        v31 = v30;
        objc_msgSend(v30, sel_setPort_, v28);
        OUTLINED_FUNCTION_4_11();
        objc_msgSend(v31, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v27));
        OUTLINED_FUNCTION_6_1();
        v32 = v31;
        MEMORY[0x24956D118]();
        if (*(_QWORD *)((__dst[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((__dst[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();

      }
      else
      {
        OUTLINED_FUNCTION_6_1();
      }
      v26 += 6;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    if (v36)
      outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(__dst[0], v36, &lazy cache variable for type metadata for NETSchemaNETEndpoint, 0x24BE952F0, (SEL *)&selRef_setPathGateways_);
    else
      swift_bridgeObjectRelease();
  }
  return v36;
}

void outlined bridged method (mbgnn) of @objc NETSchemaNETPathInterface.name.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)MEMORY[0x24956D034]();
  objc_msgSend(a3, sel_setName_, v4);

}

void outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured.pathGateways.setter(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  Class isa;

  type metadata accessor for CTServiceDescriptor(0, a3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a5, isa);

}

uint64_t static BackgroundConnectionError.errorDomain.getter()
{
  uint64_t v0;

  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  v0 = static BackgroundConnectionError.errorDomain;
  OUTLINED_FUNCTION_8_21();
  return v0;
}

uint64_t static BackgroundConnectionError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  static BackgroundConnectionError.errorDomain = a1;
  qword_257662DD8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static BackgroundConnectionError.errorDomain.modify())()
{
  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t BackgroundConnectionError.errorCode.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_246F4B138 + 4 * byte_246F75430[*(unsigned __int8 *)(v0 + 32)]))(2);
}

uint64_t sub_246F4B138()
{
  return 0;
}

uint64_t sub_246F4B140()
{
  return 3;
}

uint64_t sub_246F4B148()
{
  return 7;
}

uint64_t sub_246F4B150@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v7;

  v2 = v1[1];
  v3 = v1[2] | v1[3];
  if (!(v3 | a1 | v2))
    return 1;
  v4 = v3 | v2;
  if (a1 == 1 && v4 == 0)
    return 4;
  if (a1 == 2 && !v4)
    return 5;
  if (v4)
    v7 = 0;
  else
    v7 = a1 == 3;
  if (v7)
    return 6;
  else
    return 8;
}

uint64_t BackgroundConnectionError.errorUserInfo.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v1 = *v0;
  switch(*((_BYTE *)v0 + 32))
  {
    case 0:
      v3 = (void *)v0[1];
      v4 = v0[2];
      v5 = v0[3];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_246F75540;
      v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v8 = MEMORY[0x24BEE1768];
      *(_QWORD *)(inited + 32) = v7;
      *(_QWORD *)(inited + 40) = v9;
      *(_QWORD *)(inited + 72) = v8;
      *(_QWORD *)(inited + 48) = v1;
      *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(_QWORD *)(inited + 88) = v10;
      type metadata accessor for CFStringRef(0);
      *(_QWORD *)(inited + 120) = v11;
      swift_bridgeObjectRetain();
      if (v3)
        v12 = (uint64_t)v3;
      else
        v12 = MEMORY[0x24956D034](0, 0xE000000000000000);
      *(_QWORD *)(inited + 96) = v12;
      *(_QWORD *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(_QWORD *)(inited + 136) = v13;
      *(_QWORD *)(inited + 168) = MEMORY[0x24BEE0D00];
      if (v5)
        v14 = v4;
      else
        v14 = 0;
      v15 = 0xE000000000000000;
      if (v5)
        v15 = v5;
      *(_QWORD *)(inited + 144) = v14;
      *(_QWORD *)(inited + 152) = v15;
      v16 = v3;
      result = Dictionary.init(dictionaryLiteral:)();
      break;
    case 1:
    case 2:
    case 3:
      result = BackgroundConnectionError.shouldSkipIDSOrTuscanyUserInfo(_:_:)(*(_BYTE *)v0 & 1, BYTE1(v1) & 1);
      break;
    default:
      result = Dictionary.init(dictionaryLiteral:)();
      break;
  }
  return result;
}

uint64_t BackgroundConnectionError.shouldSkipIDSOrTuscanyUserInfo(_:_:)(char a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  v12 = Dictionary.init(dictionaryLiteral:)();
  v4 = MEMORY[0x24BEE1328];
  if ((a1 & 1) != 0)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v4;
    v10[0] = 1;
    specialized Dictionary.subscript.setter((uint64_t)v10, v5, v6);
  }
  if ((a2 & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v4;
    v10[0] = 1;
    specialized Dictionary.subscript.setter((uint64_t)v10, v7, v8);
  }
  return v12;
}

void static BackgroundConnectionError.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_246F4B47C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  int v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v27;

  if (!v9)
  {
    if (v2 != v1)
    {
      OUTLINED_FUNCTION_5_25(v1, v4);
      OUTLINED_FUNCTION_3_28();
      OUTLINED_FUNCTION_1_33();
      v19 = v1;
LABEL_15:
      v20 = v4;
      v21 = v3;
      v22 = v0;
      v23 = 0;
      goto LABEL_9;
    }
    if (v7)
    {
      if (v4)
      {
        type metadata accessor for CFStringRef(0);
        v11 = v4;
        OUTLINED_FUNCTION_5_25(v2, v4);
        OUTLINED_FUNCTION_3_28();
        lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
        v12 = v7;
        v13 = static _CFObject.== infix(_:_:)();

        if ((v13 & 1) == 0)
        {

LABEL_14:
          OUTLINED_FUNCTION_1_33();
          v19 = v2;
          goto LABEL_15;
        }
LABEL_18:
        if (v5)
        {
          if (v0)
          {
            if (v6 == v3 && v5 == v0)
            {
              OUTLINED_FUNCTION_7_21();
              OUTLINED_FUNCTION_8_21();

              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_4_25();
              OUTLINED_FUNCTION_13_16();
              OUTLINED_FUNCTION_10_2();
            }
            else
            {
              v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
              OUTLINED_FUNCTION_7_21();
              OUTLINED_FUNCTION_8_21();

              OUTLINED_FUNCTION_1_33();
              OUTLINED_FUNCTION_4_25();
              OUTLINED_FUNCTION_13_16();
              OUTLINED_FUNCTION_10_2();
              if ((v27 & 1) == 0)
                return 0;
            }
            return 1;
          }
          OUTLINED_FUNCTION_7_21();

          OUTLINED_FUNCTION_1_33();
          OUTLINED_FUNCTION_10_19(v2, v4, v3);
          swift_bridgeObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_8_21();

          OUTLINED_FUNCTION_10_19(v2, v7, v6);
          OUTLINED_FUNCTION_4_25();
          if (!v0)
            return 1;
        }
        OUTLINED_FUNCTION_10_2();
        return 0;
      }
    }
    else if (!v4)
    {
      OUTLINED_FUNCTION_5_25(v2, 0);
      outlined copy of BackgroundConnectionError(v2, 0, v6, v5, 0);
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_5_25(v2, v4);
    OUTLINED_FUNCTION_3_28();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v10 = v7;
  v14 = OUTLINED_FUNCTION_9_22();
  outlined copy of BackgroundConnectionError(v14, v15, v16, v17, v18);
  outlined consume of BackgroundConnectionError(v2, v7, v6, v5, v8);
  v19 = OUTLINED_FUNCTION_9_22();
LABEL_9:
  outlined consume of BackgroundConnectionError(v19, v20, v21, v22, v23);
  return 0;
}

id outlined copy of BackgroundConnectionError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  id result;

  if (!a5)
  {
    swift_bridgeObjectRetain();
    return a2;
  }
  return result;
}

uint64_t protocol witness for Error._domain.getter in conformance BackgroundConnectionError()
{
  lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();
  return Error<>._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance BackgroundConnectionError()
{
  lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();
  return Error<>._code.getter();
}

uint64_t destroy for BackgroundConnectionError(uint64_t a1)
{
  return outlined consume of BackgroundConnectionError(*(_QWORD *)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  outlined copy of BackgroundConnectionError(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  outlined copy of BackgroundConnectionError(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(void **)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  outlined consume of BackgroundConnectionError(v8, v9, v10, v11, v12);
  return a1;
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

uint64_t assignWithTake for BackgroundConnectionError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(void **)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  outlined consume of BackgroundConnectionError(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundConnectionError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFC && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 4)
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

uint64_t storeEnumTagSinglePayload for BackgroundConnectionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for BackgroundConnectionError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t destructiveInjectEnumTag for BackgroundConnectionError(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundConnectionError()
{
  return &type metadata for BackgroundConnectionError;
}

uint64_t OUTLINED_FUNCTION_0_47(uint64_t a1)
{
  return outlined consume of BackgroundConnectionError(a1, 0, 0, 0, 4);
}

uint64_t OUTLINED_FUNCTION_1_33()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  return outlined consume of BackgroundConnectionError(v0, v3, v2, v1, 0);
}

uint64_t OUTLINED_FUNCTION_2_30()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_3_28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  return outlined copy of BackgroundConnectionError(v0, v3, v2, v1, 0);
}

uint64_t OUTLINED_FUNCTION_4_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  return outlined consume of BackgroundConnectionError(v1, v3, v2, v0, 0);
}

id OUTLINED_FUNCTION_5_25(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  return outlined copy of BackgroundConnectionError(a1, a2, v3, v2, 0);
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_21()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_19(uint64_t a1, void *a2, uint64_t a3)
{
  return outlined consume of BackgroundConnectionError(a1, a2, a3, 0, 0);
}

uint64_t OUTLINED_FUNCTION_13_16()
{
  return swift_bridgeObjectRelease_n();
}

void specialized RawRepresentable<>.hashValue.getter(char a1)
{
  OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_94_3(qword_246F75818[a1]);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized RawRepresentable<>.hashValue.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_258(v0);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_259();
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_151_2(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized RawRepresentable<>.hashValue.getter(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_94_3(a1 + 1);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  OUTLINED_FUNCTION_34_7();
  OUTLINED_FUNCTION_94_3(a1);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized RawRepresentable<>._rawHashValue(seed:)()
{
  OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_259();
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_258(v0);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_151_2(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_94_3(qword_246F75818[a2]);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, unsigned __int8 a2)
{
  OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_94_3(a2 + 1);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

{
  OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_94_3(a2);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

void specialized Set.contains(_:)(unsigned __int8 a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  char v18;

  if (*(_QWORD *)(a2 + 16))
  {
    v3 = a1;
    v4 = OUTLINED_FUNCTION_114_1();
    OUTLINED_FUNCTION_151_2(v4, v5, v6, v7, v8, v9, v10, v11, v17, v18);
    v12 = OUTLINED_FUNCTION_103_2() & ~(-1 << *(_BYTE *)(a2 + 32));
    if (((*(_QWORD *)(a2 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0
      && *(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v12) != v3)
    {
      OUTLINED_FUNCTION_147_1();
      if ((v15 & 1) != 0)
      {
        do
        {
          if (*(unsigned __int8 *)(v13 + v14) == v3)
            break;
          OUTLINED_FUNCTION_147_1();
        }
        while ((v16 & 1) != 0);
      }
    }
  }
}

void specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::UInt64 v4;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  if ((a2 & 0xC000000000000001) != 0)
  {
    OUTLINED_FUNCTION_16_2();
    __CocoaSet.contains(_:)();
    OUTLINED_FUNCTION_14();
  }
  else if (*(_QWORD *)(a2 + 16))
  {
    OUTLINED_FUNCTION_114_1();
    v4 = NWConnection.identifier.getter();
    Hasher._combine(_:)(v4);
    v5 = OUTLINED_FUNCTION_103_2();
    v6 = -1 << *(_BYTE *)(a2 + 32);
    v7 = v5 & ~v6;
    OUTLINED_FUNCTION_116_1();
    if ((v8 & 1) != 0)
    {
      OUTLINED_FUNCTION_139_0();
      NWConnection.identifier.getter();
      v9 = OUTLINED_FUNCTION_246();
      OUTLINED_FUNCTION_140_0();
      if (v2 != v9)
      {
        v10 = ~v6;
        v11 = (v7 + 1) & v10;
        OUTLINED_FUNCTION_116_1();
        if ((v12 & 1) != 0)
        {
          do
          {
            OUTLINED_FUNCTION_139_0();
            NWConnection.identifier.getter();
            v13 = OUTLINED_FUNCTION_246();
            OUTLINED_FUNCTION_140_0();
            if (v2 == v13)
              break;
            v11 = (v11 + 1) & v10;
            OUTLINED_FUNCTION_116_1();
          }
          while ((v14 & 1) != 0);
        }
      }
    }
  }
}

BOOL specialized Set.contains(_:)(const void *a1, uint64_t a2)
{
  Swift::Int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  BOOL v17;
  _OWORD v19[4];
  uint64_t v20;
  char v21;
  __int128 v22;
  char v23;
  uint64_t v24;
  char v25;
  char v26;
  _BYTE v27[120];

  OUTLINED_FUNCTION_114_2(v27, a1);
  if (*(_QWORD *)(a2 + 16)
    && (OUTLINED_FUNCTION_114_2(v19, a1),
        Hasher.init(_seed:)(),
        ConnectionPolicyRoute.hash(into:)(),
        v4 = OUTLINED_FUNCTION_103_2(),
        v5 = -1 << *(_BYTE *)(a2 + 32),
        v6 = v4 & ~v5,
        ((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    v7 = ~v5;
    do
    {
      OUTLINED_FUNCTION_139_1();
      v9 = v8[1];
      v19[0] = *v8;
      v19[1] = v9;
      v10 = v8[3];
      v19[2] = v8[2];
      v19[3] = v10;
      v20 = v11;
      v21 = v12;
      v22 = v8[5];
      v23 = v13;
      v24 = v14;
      v25 = v15;
      v26 = v16;
      v17 = static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)v19, (uint64_t)v27);
      if (v17)
        break;
      v6 = (v6 + 1) & v7;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    return 0;
  }
  return v17;
}

void specialized BackgroundConnectionProtocol.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  _BYTE v3[520];

  OUTLINED_FUNCTION_28(v3, (const void *)(v1 + 40));
  ConnectionConfiguration.hash(into:)(a1);
  OUTLINED_FUNCTION_85();
}

SiriNetwork::ConnectionState_optional __swiftcall ConnectionState.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3)
    LOBYTE(rawValue) = 3;
  return (SiriNetwork::ConnectionState_optional)rawValue;
}

void protocol witness for Hashable.hashValue.getter in conformance ConnectionState()
{
  unsigned __int8 *v0;

  specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance ConnectionState(uint64_t a1)
{
  unsigned __int8 *v1;

  specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriNetwork::ConnectionState_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ConnectionState@<W0>(Swift::Int *a1@<X0>, SiriNetwork::ConnectionState_optional *a2@<X8>)
{
  SiriNetwork::ConnectionState_optional result;

  result.value = ConnectionState.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ConnectionState(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = ConnectionMethod.rawValue.getter(*v1);
  OUTLINED_FUNCTION_3();
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance PingStatus@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.intersection(_:) in conformance PingStatus(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = specialized OptionSet.intersection(_:)(*a1, *v2);
  OUTLINED_FUNCTION_3();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance PingStatus(uint64_t *a1)
{
  return specialized OptionSet<>.formUnion(_:)(*a1);
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance PingStatus(uint64_t *a1)
{
  return specialized OptionSet<>.formIntersection(_:)(*a1);
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance PingStatus(uint64_t *a1)
{
  uint64_t *v1;

  return specialized SetAlgebra.isSubset(of:)(*a1, *v1);
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance PingStatus(uint64_t *a1)
{
  uint64_t *v1;

  return specialized SetAlgebra.isSuperset(of:)(*a1, *v1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance PingStatus(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t (*BackgroundConnection.communicationProtocol.modify())()
{
  swift_beginAccess();
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t BackgroundConnection.connectionAnalysisInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v4;

  if (*(_QWORD *)(v1 + 1080))
  {
    OUTLINED_FUNCTION_83_3();
    OUTLINED_FUNCTION_236_0();
    OUTLINED_FUNCTION_218_0();
    return swift_unknownObjectRelease();
  }
  else
  {
    v4 = type metadata accessor for ConnectionAnalysisInfo();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v4);
  }
}

uint64_t BackgroundConnection.init(connectionConfiguration:connectionQueue:networkManager:networkAnalytics:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v10[65];

  OUTLINED_FUNCTION_28(v10, a1);
  *(_QWORD *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v4 + 1121) = 0u;
  *(_OWORD *)(v4 + 1096) = 0u;
  *(_OWORD *)(v4 + 1112) = 0u;
  *(_OWORD *)(v4 + 1080) = 0u;
  *(_OWORD *)(v4 + 1160) = 0u;
  *(_DWORD *)(v4 + 1184) = 0;
  *(_WORD *)(v4 + 1188) = 0;
  *(_OWORD *)(v4 + 1192) = 0u;
  *(_OWORD *)(v4 + 1208) = 0u;
  *(_OWORD *)(v4 + 1224) = 0u;
  *(_BYTE *)(v4 + 1240) = 1;
  *(_QWORD *)(v4 + 1248) = 0;
  OUTLINED_FUNCTION_28((void *)(v4 + 40), a1);
  OUTLINED_FUNCTION_28((void *)(v4 + 560), a1);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 1152) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v4 + 1176) = a4;
  *(_QWORD *)(v4 + 1144) = a3;
  outlined retain of ConnectionConfiguration(v10);
  return v4;
}

id *BackgroundConnection.deinit()
{
  id *v0;
  _QWORD v2[65];
  _QWORD v3[65];

  OUTLINED_FUNCTION_214_0();
  outlined destroy of weak ConnectionProviderDelegate?((uint64_t)(v0 + 2));

  OUTLINED_FUNCTION_28(v2, v0 + 5);
  outlined release of ConnectionConfiguration(v2);
  OUTLINED_FUNCTION_28(v3, v0 + 70);
  outlined release of ConnectionConfiguration(v3);
  swift_unknownObjectRelease();
  outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)(v0 + 137), (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t BackgroundConnection.__deallocating_deinit()
{
  BackgroundConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BackgroundConnection()
{
  return objc_opt_self();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BackgroundConnection.start()()
{
  _BYTE *v0;

  v0[1136] = 0;
  v0[138] = v0[658];
  v0[136] = v0[656];
  BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(SiriNetwork_ConnectionMethod_unknown, 1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(SiriNetwork::ConnectionMethod proposedFallbackMethod, Swift::Bool allowFallbackToNewMethod)
{
  Swift::Int v2;
  Swift::Int v3;
  uint64_t v6;
  os_log_type_t v7;
  _DWORD *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  Swift::Int v16;
  Swift::Int v17;
  os_log_type_t v18;
  _DWORD *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  SiriNetwork::ConnectionMethod v38;
  char v39;
  os_log_type_t v40;
  _DWORD *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  void (*v49)(Swift::Int, _UNKNOWN **);
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  __int128 v67;
  uint64_t v68;
  char v69;
  char v70;
  char v71;
  char v72;
  BOOL v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t (*v77)(__int128 *, id, void *, void *, uint64_t, uint64_t);
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(_QWORD *, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  void (*v85)(__int128 *__return_ptr, uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  char v100;
  char v101;
  char v102;
  uint64_t v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  char v116;
  char v117;
  char v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *__src;
  int v129;
  unsigned int v130;
  id v131;
  __int16 v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  uint64_t v168[12];
  char v169;
  _BYTE v170[15];
  BOOL v171;
  _BYTE v172[31];
  uint64_t v173;
  _BYTE v174[168];
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  _BYTE v185[116];
  uint64_t v186;
  __int128 v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  char v199;
  char v200;
  char v201;
  id v202;
  BOOL v203;
  char v204;
  char v205;
  uint64_t v206;
  char v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char v216;
  char v217;
  uint64_t v218;
  char v219;
  uint64_t v220;
  char v221;
  uint64_t v222;
  char v223;
  uint64_t v224;
  char v225;
  uint64_t v226;
  char v227;
  uint64_t v228;
  char v229;
  uint64_t v230;
  char v231;
  char v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  __int16 v257;
  char v258;
  char v259;
  __int128 v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  char v271;
  char v272;
  char v273;
  char v274;
  id v275;
  BOOL v276;
  char v277;
  char v278;
  uint64_t v279;
  char v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  char v289;
  char v290;
  uint64_t v291;
  char v292;
  uint64_t v293;
  char v294;
  uint64_t v295;
  char v296;
  uint64_t v297;
  char v298;
  uint64_t v299;
  char v300;
  uint64_t v301;
  char v302;
  uint64_t v303;
  char v304;
  char v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  __int16 v330;
  char v331;
  char v332;
  _BYTE v333[116];
  _BYTE v334[168];
  _OWORD v335[2];
  _QWORD v336[2];
  char v337;
  _BYTE __dst[96];
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  char v345;
  _BYTE v346[15];
  char v347;
  _BYTE v348[39];
  _BYTE v349[168];
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  _OWORD v355[8];
  _BYTE v356[24];
  uint64_t v357;
  _BYTE v358[536];

  v3 = v2;
  siri_kdebug_trace_0();
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriNetwork);
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_209_0();
  v7 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_106(v7))
  {
    v8 = (_DWORD *)OUTLINED_FUNCTION_2_2();
    *(_QWORD *)&v339 = OUTLINED_FUNCTION_2_2();
    *v8 = 136315650;
    OUTLINED_FUNCTION_1_4();
    __asm { BR              X10 }
  }

  OUTLINED_FUNCTION_43_5();
  objc_msgSend(*(id *)(v2 + 1144), sel_updateNetworkPerformanceFeed);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
  objc_msgSend(v10, sel_systemUptime);
  v12 = v11;

  *(_QWORD *)(v2 + 1200) = v12;
  if (*(double *)(v2 + 1192) <= 0.0)
    *(_QWORD *)(v2 + 1192) = v12;
  *(_QWORD *)(v2 + 1208) = 0;
  v13 = *(_QWORD *)(v2 + 1224);
  v14 = __CFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
  {
    __break(1u);
    JUMPOUT(0x246F4DAA8);
  }
  *(_QWORD *)(v2 + 1224) = v15;
  v16 = *(unsigned __int8 *)(v2 + 1136);
  if (!*(_BYTE *)(v2 + 1136))
  {
    if ((*(_BYTE *)(v2 + 138) & 1) == 0)
    {
      LOBYTE(v260) = *(_BYTE *)(v2 + 168);
      LOBYTE(v187) = *(_BYTE *)(v2 + 256);
      LOBYTE(v168[0]) = *(_BYTE *)(v2 + 272);
      v334[0] = *(_BYTE *)(v2 + 288);
      v333[0] = *(_BYTE *)(v2 + 304);
      __dst[0] = *(_BYTE *)(v2 + 320);
      v356[0] = *(_BYTE *)(v2 + 336);
      LOBYTE(v335[0]) = *(_BYTE *)(v2 + 352);
      v345 = *(_BYTE *)(v2 + 136);
      v346[0] = *(_BYTE *)(v2 + 137);
      v346[2] = *(_BYTE *)(v2 + 139);
      *(_QWORD *)&v346[7] = *(_QWORD *)(v2 + 144);
      v347 = *(_BYTE *)(v2 + 152);
      v348[0] = *(_BYTE *)(v2 + 153);
      v348[1] = *(_BYTE *)(v2 + 154);
      *(_QWORD *)&v348[7] = *(_QWORD *)(v2 + 160);
      v348[15] = v260;
      v349[48] = *(_BYTE *)(v2 + 240);
      v349[49] = *(_BYTE *)(v2 + 241);
      *(_QWORD *)&v349[56] = *(_QWORD *)(v2 + 248);
      v349[64] = v187;
      *(_QWORD *)&v349[72] = *(_QWORD *)(v2 + 264);
      v349[80] = v168[0];
      *(_QWORD *)&v349[88] = *(_QWORD *)(v2 + 280);
      v349[96] = v334[0];
      *(_QWORD *)&v349[104] = *(_QWORD *)(v2 + 296);
      v349[112] = v333[0];
      *(_QWORD *)&v349[120] = *(_QWORD *)(v2 + 312);
      v349[128] = __dst[0];
      *(_QWORD *)&v349[136] = *(_QWORD *)(v2 + 328);
      v349[144] = v356[0];
      *(_QWORD *)&v349[152] = *(_QWORD *)(v2 + 344);
      v349[160] = v335[0];
      v349[161] = *(_BYTE *)(v2 + 353);
      v21 = *(_OWORD *)(v2 + 520);
      v22 = *(_OWORD *)(v2 + 536);
      LOWORD(v355[7]) = *(_WORD *)(v2 + 552);
      BYTE2(v355[7]) = *(_BYTE *)(v2 + 554);
      v23 = *(_OWORD *)(v2 + 360);
      v24 = *(_OWORD *)(v2 + 376);
      v25 = *(_OWORD *)(v2 + 392);
      v26 = *(_OWORD *)(v2 + 408);
      v27 = *(_OWORD *)(v2 + 424);
      v28 = *(_OWORD *)(v2 + 440);
      v29 = *(_OWORD *)(v2 + 456);
      v30 = *(_OWORD *)(v2 + 472);
      v31 = *(_OWORD *)(v2 + 488);
      v32 = *(_OWORD *)(v2 + 504);
      BYTE3(v355[7]) = *(_BYTE *)(v2 + 555);
      v33 = *(_OWORD *)(v2 + 56);
      v339 = *(_OWORD *)(v2 + 40);
      v340 = v33;
      v34 = *(_OWORD *)(v2 + 88);
      v341 = *(_OWORD *)(v2 + 72);
      v342 = v34;
      v35 = *(_OWORD *)(v2 + 120);
      v343 = *(_OWORD *)(v2 + 104);
      v344 = v35;
      v36 = *(_OWORD *)(v2 + 192);
      *(_OWORD *)&v348[23] = *(_OWORD *)(v2 + 176);
      *(_OWORD *)v349 = v36;
      v37 = *(_OWORD *)(v2 + 224);
      *(_OWORD *)&v349[16] = *(_OWORD *)(v2 + 208);
      *(_OWORD *)&v349[32] = v37;
      v350 = v23;
      v351 = v24;
      v352 = v25;
      v353 = v26;
      v354 = v27;
      v355[0] = v28;
      v346[1] = 0;
      v355[1] = v29;
      v355[2] = v30;
      v355[3] = v31;
      v355[4] = v32;
      v355[5] = v21;
      v355[6] = v22;
      v17 = 0;
      goto LABEL_17;
    }
    proposedFallbackMethod = SiriNetwork_ConnectionMethod_network;
LABEL_18:
    *(_BYTE *)(v2 + 1136) = proposedFallbackMethod;
    goto LABEL_20;
  }
  if (allowFallbackToNewMethod)
  {
    if (proposedFallbackMethod == SiriNetwork_ConnectionMethod_unknown)
    {
      OUTLINED_FUNCTION_28(&v339, (const void *)(v2 + 40));
      v17 = v16;
LABEL_17:
      ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)&v339, v17);
      proposedFallbackMethod = v38;
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_209_0();
  v18 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_106(v18))
  {
    v19 = (_DWORD *)OUTLINED_FUNCTION_2_2();
    *(_QWORD *)&v339 = OUTLINED_FUNCTION_2_2();
    *v19 = 136315138;
    OUTLINED_FUNCTION_1_4();
    __asm { BR              X10 }
  }

  OUTLINED_FUNCTION_43_5();
  proposedFallbackMethod = *(_BYTE *)(v2 + 1136);
LABEL_20:
  if (proposedFallbackMethod == SiriNetwork_ConnectionMethod_peer && *(_BYTE *)(v2 + 137) == 1)
  {
    OUTLINED_FUNCTION_163_2();
    specialized Set._Variant.insert(_:)(&v260, 2);
    swift_endAccess();
    v2 = *(unsigned __int8 *)(v2 + 1136);
    OUTLINED_FUNCTION_28(&v339, (const void *)(v3 + 40));
    ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)&v339, v2);
    *(_BYTE *)(v3 + 1136) = v39;
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_209_0();
  v40 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_106(v40))
  {
    v41 = (_DWORD *)OUTLINED_FUNCTION_2_2();
    *(_QWORD *)&v339 = OUTLINED_FUNCTION_2_2();
    *v41 = 136315138;
    OUTLINED_FUNCTION_1_4();
    __asm { BR              X10 }
  }

  OUTLINED_FUNCTION_43_5();
  v43 = ConnectionMethod.communicationProtocolClass(for:)(*(_QWORD *)(v3 + 48));
  v45 = v44;
  v46 = (uint64_t *)OUTLINED_FUNCTION_6();
  v47 = (uint64_t)(v46 + 2);
  v48 = *(void **)(v3 + 32);
  v49 = *(void (**)(Swift::Int, _UNKNOWN **))(v45 + 8);
  v46[5] = v43;
  v46[6] = v45;
  v95 = v46;
  __swift_allocate_boxed_opaque_existential_1(v46 + 2);
  OUTLINED_FUNCTION_139_0();
  v93 = v48;
  v49(v3, &protocol witness table for BackgroundConnection);
  outlined init with copy of RPCOspreyConnectionProtocol(v47, (uint64_t)&v339);
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)&v339, (uint64_t)&v260, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  OUTLINED_FUNCTION_163_2();
  outlined assign with take of CommunicationProtocol?((uint64_t)&v260, v3 + 1096);
  swift_endAccess();
  v98 = v3 + 1096;
  outlined init with copy of NetworkConnectionProtocol?(v3 + 1096, (uint64_t)v356, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v357)
  {
    outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v356, (uint64_t)&v339);
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v356, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    v50 = *((_QWORD *)&v340 + 1);
    v51 = v341;
    __swift_project_boxed_opaque_existential_1(&v339, *((uint64_t *)&v340 + 1));
    (*(void (**)(BOOL, uint64_t, uint64_t))(v51 + 88))(*(_BYTE *)(v3 + 1136) != 0, v50, v51);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v339);
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v356, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  OUTLINED_FUNCTION_28(&v339, (const void *)(v3 + 40));
  v151 = *((_QWORD *)&v340 + 1);
  v122 = v341;
  v123 = v340;
  v152 = *((_QWORD *)&v341 + 1);
  v153 = *((_QWORD *)&v342 + 1);
  v120 = v343;
  v121 = v342;
  v154 = *((_QWORD *)&v343 + 1);
  v167 = *((_QWORD *)&v344 + 1);
  v166 = *(id *)&v346[7];
  v127 = *(_QWORD *)v349;
  v164 = *(_QWORD *)&v349[8];
  v126 = *(_QWORD *)&v349[16];
  v165 = *(_QWORD *)&v349[24];
  v124 = v344;
  v125 = *(_QWORD *)&v349[32];
  v142 = *((_QWORD *)&v355[1] + 1);
  v143 = *((_QWORD *)&v355[0] + 1);
  v148 = *(_QWORD *)&v355[2];
  v149 = *(_QWORD *)&v355[1];
  v146 = *(_QWORD *)&v355[3];
  v147 = *((_QWORD *)&v355[2] + 1);
  v145 = *((_QWORD *)&v355[3] + 1);
  v140 = *(_QWORD *)&v355[5];
  v141 = *(_QWORD *)&v355[4];
  v138 = *(_QWORD *)&v355[6];
  v139 = *((_QWORD *)&v355[5] + 1);
  v133 = *((_QWORD *)&v355[6] + 1);
  v134 = *((_QWORD *)&v355[4] + 1);
  v132 = v355[7];
  v150 = *(_QWORD *)&v349[40];
  v52 = v350;
  v137 = v351;
  v135 = v350;
  v136 = *((_QWORD *)&v351 + 1);
  v53 = v352;
  v54 = v353;
  v157 = v354;
  v55 = *(_QWORD *)&v355[0];
  v144 = *(_QWORD *)&v355[0];
  v155 = *((_QWORD *)&v354 + 1);
  memcpy(__dst, (const void *)(v3 + 40), sizeof(__dst));
  v337 = v345;
  v336[0] = *(_QWORD *)v346;
  *(_QWORD *)((char *)v336 + 7) = *(_QWORD *)&v346[7];
  v335[0] = *(_OWORD *)v348;
  *(_OWORD *)((char *)v335 + 15) = *(_OWORD *)&v348[15];
  memcpy(v334, v349, sizeof(v334));
  memcpy(v333, v355, sizeof(v333));
  __src = (_QWORD *)v3;
  v129 = *(unsigned __int8 *)(v3 + 1136);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_12_6();
  swift_bridgeObjectRetain();
  v56 = v166;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ConnectionPolicyRoute?(v55, v143);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v57 = v166;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ConnectionPolicyRoute?(v144, v143);
  outlined retain of ConnectionConfiguration(&v339);
  if (v129)
  {
    v58 = *((_QWORD *)&v53 + 1);
    v59 = v53;
    v61 = *((_QWORD *)&v54 + 1);
    v60 = v54;
    v62 = v157;
    v63 = v155;
    v64 = *((_QWORD *)&v52 + 1);
  }
  else
  {
    outlined consume of ConnectionPolicy?(v135, *((uint64_t *)&v52 + 1), v137, v136, v53, *((uint64_t *)&v53 + 1), v54, *((uint64_t *)&v54 + 1), v157, v155);
    v135 = 0;
    v136 = 0;
    v64 = 0;
    v137 = 0;
    v59 = 0;
    v58 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v63 = 0;
  }
  v65 = v346[1];
  v163 = v64;
  v162 = v59;
  v161 = v58;
  v160 = v60;
  v159 = v61;
  v158 = v62;
  v156 = v63;
  if ((v346[1] & 1) != 0)
  {
    v66 = v345;
  }
  else
  {
    v66 = 1;
    v337 = 1;
  }
  v67 = v339;
  v100 = v346[0];
  v101 = v346[2];
  v130 = v348[0];
  v104 = v348[1];
  v103 = *(_QWORD *)&v348[7];
  v102 = v348[15];
  v68 = *(_QWORD *)&v348[23];
  v117 = v349[48];
  v116 = v349[49];
  v115 = *(_QWORD *)&v349[56];
  v114 = v349[64];
  v113 = *(_QWORD *)&v349[72];
  v112 = v349[80];
  v111 = *(_QWORD *)&v349[88];
  v110 = v349[96];
  v69 = v349[112];
  v108 = *(_QWORD *)&v349[120];
  v109 = *(_QWORD *)&v349[104];
  v70 = v349[128];
  v71 = v349[144];
  v106 = *(_QWORD *)&v349[152];
  v107 = *(_QWORD *)&v349[136];
  v72 = v349[160];
  v105 = v349[161];
  v119 = BYTE2(v355[7]);
  v73 = *(_BYTE *)(v3 + 1136) == 3;
  v118 = BYTE3(v355[7]);
  v96 = ConnectionMethod.providerClass(for:)(v339);
  v97 = v74;
  v271 = v66;
  v282 = 0x4056800000000000;
  v92 = v70;
  v298 = v69;
  v300 = v70;
  v91 = v72;
  v302 = v71;
  v304 = v72;
  v260 = v67;
  v261 = v123;
  v262 = v151;
  v263 = v122;
  v264 = v152;
  v265 = v121;
  v266 = v153;
  v267 = v120;
  v268 = v154;
  v269 = v124;
  v270 = v167;
  v272 = v100;
  v273 = v65;
  v274 = v101;
  v275 = v166;
  v276 = v73;
  v277 = v130;
  v278 = v104;
  v279 = v103;
  v280 = v102;
  v281 = v68;
  v283 = v127;
  v284 = v164;
  v285 = v126;
  v286 = v165;
  v287 = v125;
  v288 = v150;
  v289 = v117;
  v290 = v116;
  v291 = v115;
  v292 = v114;
  v293 = v113;
  v294 = v112;
  v295 = v111;
  v296 = v110;
  v297 = v109;
  v299 = v108;
  v301 = v107;
  v303 = v106;
  v305 = v105;
  v306 = v135;
  v307 = v163;
  v308 = v137;
  v309 = v136;
  v310 = v162;
  v311 = v161;
  v312 = v160;
  v313 = v159;
  v314 = v62;
  v315 = v156;
  v316 = v144;
  v317 = v143;
  v318 = v149;
  v319 = v142;
  v320 = v148;
  v321 = v147;
  v322 = v146;
  v323 = v145;
  v324 = v141;
  v325 = v134;
  v326 = v140;
  v327 = v139;
  v328 = v138;
  v329 = v133;
  v330 = v132;
  v331 = v119;
  v332 = v118;
  outlined retain of ConnectionConfiguration(&v260);
  outlined consume of ConnectionPolicyRoute?(v144, v143);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_28(&v187, &v260);
  v75 = (void *)__src[143];
  v76 = (void *)__src[147];
  v77 = *(uint64_t (**)(__int128 *, id, void *, void *, uint64_t, uint64_t))(v97 + 448);
  v78 = v75;
  v79 = v77(&v187, v93, v75, v76, v96, v97);
  __src[135] = v79;
  __src[136] = v97;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v186 = 0;
  outlined init with copy of NetworkConnectionProtocol?(v98, (uint64_t)&v187, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v189)
  {
    outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)&v187, (uint64_t)v168);
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)&v187, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    v80 = v168[3];
    v81 = v168[4];
    __swift_project_boxed_opaque_existential_1(v168, v168[3]);
    v99 = (void *)(*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v81 + 96))(&v186, v130, v80, v81);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v168);
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)&v187, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    v99 = 0;
  }
  v82 = *(void (**)(_QWORD *, _UNKNOWN **, uint64_t, uint64_t))(v97 + 128);
  OUTLINED_FUNCTION_139_0();
  OUTLINED_FUNCTION_152_0();
  v82(__src, &protocol witness table for BackgroundConnection, v96, v97);
  swift_unknownObjectRelease();
  v83 = MEMORY[0x24956E090](__src + 2);
  if (v83)
  {
    v84 = v83;
    v85 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v97 + 168);
    OUTLINED_FUNCTION_152_0();
    v85(&v187, v96, v97);
    swift_unknownObjectRelease();
    specialized Connection.willStartConnection(_:type:)((uint64_t)__src, v187, v84);
    swift_unknownObjectRelease();
  }
  v94 = OUTLINED_FUNCTION_6();
  swift_weakInit();
  v187 = v67;
  v188 = v123;
  v190 = v122;
  v192 = v121;
  v194 = v120;
  v195 = v154;
  v196 = v124;
  v189 = v151;
  v191 = v152;
  v193 = v153;
  v197 = v167;
  v198 = v337;
  v199 = v100;
  v200 = v65;
  v201 = v101;
  v202 = v166;
  v203 = v73;
  v204 = v130;
  v205 = v104;
  v206 = v103;
  v207 = v102;
  v208 = v68;
  v209 = 0x4056800000000000;
  v210 = v127;
  v211 = v164;
  v212 = v126;
  v213 = v165;
  v214 = v125;
  v215 = v150;
  v216 = v117;
  v217 = v116;
  v218 = v115;
  v219 = v114;
  v220 = v113;
  v221 = v112;
  v222 = v111;
  v223 = v110;
  v225 = v69;
  v224 = v109;
  v226 = v108;
  v227 = v92;
  v229 = v71;
  v228 = v107;
  v230 = v106;
  v231 = v91;
  v232 = v105;
  v233 = v135;
  v234 = v163;
  v235 = v137;
  v236 = v136;
  v237 = v162;
  v238 = v161;
  v239 = v160;
  v240 = v159;
  v241 = v158;
  v242 = v156;
  v243 = v144;
  v244 = v143;
  v245 = v149;
  v246 = v142;
  v247 = v148;
  v248 = v147;
  v249 = v146;
  v250 = v145;
  v251 = v141;
  v252 = v134;
  v253 = v140;
  v254 = v139;
  v255 = v138;
  v256 = v133;
  v257 = v132;
  v258 = v119;
  v259 = v118;
  OUTLINED_FUNCTION_28(v358, &v187);
  v131 = v99;
  swift_unknownObjectRetain_n();
  OUTLINED_FUNCTION_139_0();
  swift_retain();
  outlined retain of ConnectionConfiguration(&v187);
  v86 = v79;
  outlined consume of ConnectionPolicyRoute?(v144, v143);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v87 = v186;
  v88 = (_QWORD *)OUTLINED_FUNCTION_6();
  v88[2] = v94;
  v88[3] = v86;
  v88[4] = v97;
  v88[5] = v95;
  OUTLINED_FUNCTION_28(v88 + 6, v358);
  v88[71] = v99;
  v88[72] = v87;
  (*(void (**)(void *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 456))(v99, partial apply for specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:), v88, v96, v97, v89, v90);

  swift_release();
  swift_release();
  swift_unknownObjectRelease_n();
  memcpy(v168, __dst, sizeof(v168));
  v169 = v337;
  *(_QWORD *)v170 = v336[0];
  *(_QWORD *)&v170[7] = *(_QWORD *)((char *)v336 + 7);
  v171 = v73;
  *(_OWORD *)v172 = v335[0];
  *(_OWORD *)&v172[15] = *(_OWORD *)((char *)v335 + 15);
  v173 = 0x4056800000000000;
  memcpy(v174, v334, sizeof(v174));
  v175 = v135;
  v176 = v163;
  v177 = v137;
  v178 = v136;
  v179 = v162;
  v180 = v161;
  v181 = v160;
  v182 = v159;
  v183 = v158;
  v184 = v156;
  memcpy(v185, v333, sizeof(v185));
  outlined release of ConnectionConfiguration(v168);
  swift_release();
}

void specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  unint64_t v13;
  void *v14;
  char v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  char v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ObjectType;
  void (*v48)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint8_t *bufa;
  uint8_t *bufb;
  uint64_t v67;
  void *v68;
  uint8_t *v69;
  _QWORD v70[3];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  unint64_t v74;
  void *v75;

  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 24);
  v67 = *(_QWORD *)(a1 + 16);
  v68 = *(void **)a1;
  v14 = *(void **)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 40);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v17 = Strong;
    v61 = v14;
    v62 = v12;
    siri_kdebug_trace_0();
    v18 = *(_QWORD *)(v17 + 1080);
    if (v18 && (v19 = *(_QWORD *)(v17 + 1088), v20 = swift_getObjectType(), v18 == a3))
    {
      if ((v15 & 1) != 0)
      {
        v26 = v67;
        v25 = v68;
        v27 = v61;
        v73[0] = v68;
        v73[1] = v62;
        v73[2] = v67;
        v74 = v13;
        v75 = v61;
        outlined copy of NetworkConnectionError(v68, v62, v67, v13, v61);
        if (AFDeviceSupportsSiriUOD() && (v13 & 0xF000000000000000) == 0x1000000000000000)
        {
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v28 = type metadata accessor for Logger();
          __swift_project_value_buffer(v28, (uint64_t)static Logger.siriNetwork);
          outlined copy of NetworkConnectionError(v68, v62, v67, v13, v61);
          outlined copy of NetworkConnectionError(v68, v62, v67, v13, v61);
          v29 = Logger.logObject.getter();
          v30 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v29, v30))
          {
            v31 = (uint8_t *)swift_slowAlloc();
            v32 = (_QWORD *)swift_slowAlloc();
            bufa = v31;
            *(_DWORD *)v31 = 138412290;
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            swift_allocError();
            outlined init with take of NetworkConnectionError((uint64_t)v73, v33);
            outlined copy of NetworkConnectionError(v68, v62, v67, v13, v61);
            v70[0] = _swift_stdlib_bridgeErrorToNSError();
            v26 = v67;
            v25 = v68;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *v32 = v70[0];
            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v67, v13, v61, 1);
            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v67, v13, v61, 1);
            _os_log_impl(&dword_246EC7000, v29, v30, "Background Connection - Provider: Connection failed. Error: (%@), but device support UOD.", bufa, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            swift_arrayDestroy();
            MEMORY[0x24956E018](v32, -1, -1);
            MEMORY[0x24956E018](bufa, -1, -1);
          }
          else
          {
            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v67, v13, v61, 1);
            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v67, v13, v61, 1);
          }

          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          v57 = (void *)swift_allocError();
          outlined init with take of NetworkConnectionError((uint64_t)v73, v58);
          outlined copy of NetworkConnectionError(v25, v62, v26, v13, v61);
          BackgroundConnection.didEncounterError(_:)(v57);
          outlined consume of Result<(), NetworkConnectionError>(v25, v62, v26, v13, v61, 1);

          *(_BYTE *)(v17 + 1187) = 0;
        }
        else
        {
          if (*(_QWORD *)(v17 + 1080))
          {
            v46 = *(_QWORD *)(v17 + 1088);
            ObjectType = swift_getObjectType();
            v48 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v46 + 184);
            swift_unknownObjectRetain();
            v49 = ObjectType;
            v25 = v68;
            v48(0, 0, v49, v46);
            swift_unknownObjectRelease();
          }
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v50 = type metadata accessor for Logger();
          __swift_project_value_buffer(v50, (uint64_t)static Logger.siriNetwork);
          outlined copy of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);
          swift_retain();
          outlined copy of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);
          swift_retain();
          v51 = Logger.logObject.getter();
          v52 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v51, v52))
          {
            v53 = swift_slowAlloc();
            bufb = (uint8_t *)swift_slowAlloc();
            v69 = bufb;
            *(_DWORD *)v53 = 136315394;
            outlined init with take of NetworkConnectionError((uint64_t)v73, (uint64_t)v70);
            outlined copy of NetworkConnectionError(v25, v62, v67, v13, v61);
            v54 = String.init<A>(describing:)();
            v70[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v55, (uint64_t *)&v69);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            v26 = v67;
            swift_bridgeObjectRelease();
            outlined consume of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);
            outlined consume of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);
            *(_WORD *)(v53 + 12) = 1024;
            v56 = *(unsigned __int8 *)(v17 + 1186);
            swift_release();
            LODWORD(v70[0]) = v56;
            v27 = v61;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            _os_log_impl(&dword_246EC7000, v51, v52, "Background Connection - Provider. Connection failed. Error: %s. Connection was Cancelled: %{BOOL}d", (uint8_t *)v53, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x24956E018](bufb, -1, -1);
            MEMORY[0x24956E018](v53, -1, -1);

          }
          else
          {
            swift_release();
            outlined consume of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);
            outlined consume of Result<(), NetworkConnectionError>(v25, v62, v67, v13, v61, 1);

            swift_release();
          }
          if ((*(_BYTE *)(v17 + 1186) & 1) == 0)
          {
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            v59 = (void *)swift_allocError();
            outlined init with take of NetworkConnectionError((uint64_t)v73, v60);
            swift_allocObject();
            swift_beginAccess();
            swift_weakLoadStrong();
            swift_weakInit();
            outlined copy of NetworkConnectionError(v68, v62, v26, v13, v27);
            swift_release();
            outlined copy of Result<(), NetworkConnectionError>(v68, v62, v26, v13, v27, 1);
            swift_retain();
            outlined copy of Result<(), NetworkConnectionError>(v68, v62, v26, v13, v27, 1);
            swift_retain();
            specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
            swift_release();
            swift_release();
            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v26, v13, v27, 1);
            swift_release();

            outlined consume of Result<(), NetworkConnectionError>(v68, v62, v26, v13, v27, 1);
            return;
          }
          outlined consume of Result<(), NetworkConnectionError>(v68, v62, v26, v13, v27, 1);
        }
      }
      else
      {
        v34 = v20;
        v35 = a5 + 16;
        v36 = swift_getObjectType();
        v37 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v19 + 184);
        swift_unknownObjectRetain();
        v37(0, 0, v36, v19);
        swift_unknownObjectRelease();
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v38 = type metadata accessor for Logger();
        __swift_project_value_buffer(v38, (uint64_t)static Logger.siriNetwork);
        v39 = Logger.logObject.getter();
        v40 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_246EC7000, v39, v40, "Background Connection - Provider. Connection ready.", v41, 2u);
          MEMORY[0x24956E018](v41, -1, -1);
        }

        swift_beginAccess();
        outlined init with copy of RPCOspreyConnectionProtocol(v35, (uint64_t)v73);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
        type metadata accessor for CommunicationProtocolAce();
        if (swift_dynamicCast())
        {
          v42 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 544))(v34, a4);
          v43 = 5.0;
          if ((v42 & 1) == 0)
          {
            v43 = 7.0;
            if (*(_BYTE *)(v17 + 1136) == 3)
            {
              v43 = *(double *)(a6 + 120);
              if (*(_BYTE *)(a6 + 128))
                v43 = -1.0;
            }
          }
          CommunicationProtocolAce.scheduleAceHeaderTimeout(withInterval:)(v43);
          swift_release();
        }
        swift_beginAccess();
        outlined init with copy of NetworkConnectionProtocol?(v17 + 1096, (uint64_t)v73, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
        if (v74)
        {
          outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v73, (uint64_t)v70);
          outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v73, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
          v44 = v71;
          v45 = v72;
          __swift_project_boxed_opaque_existential_1(v70, v71);
          (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 104))(a7, a8, *(unsigned __int8 *)(v17 + 153), v44, v45);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
        }
        else
        {
          outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v73, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
        }
        BackgroundConnection.setupReadHandlerOnProvider()();
        BackgroundConnection.networkProviderDidOpen()();
      }
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v21 = type metadata accessor for Logger();
      __swift_project_value_buffer(v21, (uint64_t)static Logger.siriNetwork);
      v22 = Logger.logObject.getter();
      v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_246EC7000, v22, v23, "Background Connection - Provider. Connection open ignored for stale connection.", v24, 2u);
        MEMORY[0x24956E018](v24, -1, -1);
        swift_release();

        return;
      }

    }
    swift_release();
  }
}

uint64_t closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  os_log_type_t type;
  _QWORD *v21;
  uint64_t v22;

  v5 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (v4 >> 1 != 0xFFFFFFFF || v6 >= 2)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v11 = type metadata accessor for Logger();
      __swift_project_value_buffer(v11, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      v12 = Logger.logObject.getter();
      v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = swift_slowAlloc();
        v21 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v14 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        type = v13;
        *v15 = v5;
        v15[1] = v4;
        v15[2] = v7;
        v15[3] = v6;
        v15[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        v16 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v21 = v16;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v14 + 12) = 2112;
        swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v17);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
        v22 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v21[1] = v22;
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        _os_log_impl(&dword_246EC7000, v12, type, "Background Connection - Fallback: Callback to Completion with error %@ for Open Connection error (%@)", (uint8_t *)v14, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24956E018](v21, -1, -1);
        MEMORY[0x24956E018](v14, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      }

      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v18 = (void *)swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v19);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      BackgroundConnection.didEncounterError(_:)(v18);

      BackgroundConnection.cancel()();
    }
    return swift_release();
  }
  return result;
}

void BackgroundConnection.startSecondaryConnection()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t (*v16)(_QWORD *, id, void *, id);
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD, void (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_class *v32;
  objc_class *v33;
  objc_class *v34;
  objc_class *v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  char v47;
  uint64_t v48;
  char v49;
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
  uint64_t v75;
  __int16 v76;
  char v77;
  char v78;
  char v79;
  uint64_t v80;
  objc_class *v81;
  objc_class *v82;
  objc_class *v83;
  objc_class *v84;
  objc_class *v85;
  objc_class *v86;
  _QWORD v87[12];
  char v88;
  char v89;
  char v90;
  char v91;
  uint64_t v92;
  char v93;
  char v94;
  char v95;
  int v96;
  char v97;
  uint64_t v98;
  char v99;
  _BYTE v100[7];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  char v110;
  int v111;
  __int16 v112;
  uint64_t v113;
  char v114;
  _BYTE v115[7];
  uint64_t v116;
  char v117;
  _BYTE v118[7];
  uint64_t v119;
  char v120;
  _BYTE v121[7];
  uint64_t v122;
  char v123;
  _BYTE v124[7];
  uint64_t v125;
  char v126;
  _BYTE v127[7];
  uint64_t v128;
  char v129;
  _BYTE v130[7];
  uint64_t v131;
  char v132;
  char v133;
  int v134;
  __int16 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  __int16 v160;
  char v161;
  char v162;
  int v163;
  __int16 v164;
  char v165;
  _BYTE v166[7];
  char v167;
  _BYTE v168[7];
  char v169;
  _BYTE v170[7];
  char v171;
  _BYTE v172[7];
  char v173;
  _BYTE v174[7];
  char v175;
  _BYTE v176[7];
  char v177;
  int v178;
  __int16 v179;
  _BYTE v180[7];
  char v181;
  int v182;
  char v183;
  objc_class *v184;
  objc_class *v185;
  objc_class *v186;
  objc_class *v187;
  objc_class *v188;
  objc_class *v189;
  objc_class *v190;
  objc_class *v191;
  objc_class *v192;
  objc_class *v193;
  objc_class *v194;
  objc_class *v195;
  char v196;
  char v197;
  char v198;
  uint64_t v199;
  char v200;
  char v201;
  uint64_t v202;
  char v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  char v213;
  uint64_t v214;
  char v215;
  uint64_t v216;
  char v217;
  uint64_t v218;
  char v219;
  uint64_t v220;
  char v221;
  uint64_t v222;
  char v223;
  uint64_t v224;
  char v225;
  uint64_t v226;
  char v227;
  char v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  __int16 v253;
  char v254;
  char v255;
  NSObject v256[12];
  char v257;
  char v258;
  char v259;
  char v260;
  uint64_t v261;
  char v262;
  char v263;
  char v264;
  uint64_t v265;
  char v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  char v275;
  char v276;
  uint64_t v277;
  char v278;
  uint64_t v279;
  char v280;
  uint64_t v281;
  char v282;
  uint64_t v283;
  char v284;
  uint64_t v285;
  char v286;
  uint64_t v287;
  char v288;
  uint64_t v289;
  char v290;
  char v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  __int16 v316;
  char v317;
  char v318;
  uint64_t v319;
  uint64_t v320;

  OUTLINED_FUNCTION_48_2();
  v319 = v1;
  v320 = v2;
  if (!*(_BYTE *)(v0 + 1184))
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v3, (uint64_t)static Logger.siriNetwork);
    v4 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_1_23(v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v5 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v256, (os_log_type_t)&v184, "Background Connection - Provider. Secondary connection started.", v5);
      OUTLINED_FUNCTION_0_4();
    }

    ConnectionMethod.providerClass(for:)(*(_QWORD *)(v0 + 40));
    v80 = v6;
    OUTLINED_FUNCTION_28(&v184, (const void *)(v0 + 40));
    v81 = v184;
    v82 = v185;
    v83 = v186;
    v84 = v187;
    v85 = v188;
    v86 = v189;
    v7 = v193;
    v8 = v195;
    v9 = v204;
    v10 = v205;
    v171 = v221;
    v284 = v221;
    v169 = v223;
    v286 = v223;
    v167 = v225;
    v288 = v225;
    v290 = v227;
    v165 = v227;
    v181 = v203;
    v266 = v203;
    v177 = v215;
    v278 = v215;
    v175 = v217;
    v280 = v217;
    v173 = v219;
    v282 = v219;
    v11 = *(_BYTE *)(v0 + 656);
    v256[0].isa = v184;
    v256[1].isa = v185;
    v256[2].isa = v186;
    v256[3].isa = v187;
    v256[4].isa = v188;
    v256[5].isa = v189;
    v32 = v190;
    v33 = v191;
    v256[6].isa = v190;
    v256[7].isa = v191;
    v34 = v192;
    v256[8].isa = v192;
    v256[9].isa = v193;
    v35 = v194;
    v256[10].isa = v194;
    v256[11].isa = v195;
    v28 = v11;
    v257 = v11;
    v44 = v196;
    v45 = v197;
    v258 = v196;
    v259 = v197;
    v46 = v198;
    v47 = v201;
    v260 = v198;
    v50 = v199;
    v261 = v199;
    v262 = 0;
    v49 = v200;
    v263 = v200;
    v264 = v201;
    v48 = v202;
    v265 = v202;
    v267 = v204;
    v268 = v205;
    v42 = v207;
    v43 = v206;
    v269 = v206;
    v270 = v207;
    v40 = v209;
    v41 = v208;
    v271 = v208;
    v272 = v209;
    v38 = v211;
    v39 = v210;
    v273 = v210;
    v274 = v211;
    v36 = v213;
    v37 = v212;
    v275 = v212;
    v276 = v213;
    v12 = v214;
    v277 = v214;
    v13 = v216;
    v279 = v216;
    v31 = v218;
    v281 = v218;
    v29 = v222;
    v30 = v220;
    v283 = v220;
    v285 = v222;
    v27 = v224;
    v287 = v224;
    v51 = v226;
    v289 = v226;
    v77 = v228;
    v291 = v228;
    v62 = v229;
    v292 = v229;
    v73 = v230;
    v293 = v230;
    v61 = v231;
    v294 = v231;
    v72 = v232;
    v295 = v232;
    v60 = v233;
    v296 = v233;
    v71 = v234;
    v297 = v234;
    v59 = v235;
    v298 = v235;
    v70 = v236;
    v299 = v236;
    v58 = v237;
    v300 = v237;
    v69 = v238;
    v301 = v238;
    v57 = v239;
    v302 = v239;
    v68 = v240;
    v303 = v240;
    v56 = v241;
    v304 = v241;
    v67 = v242;
    v305 = v242;
    v55 = v243;
    v306 = v243;
    v66 = v244;
    v307 = v244;
    v54 = v245;
    v308 = v245;
    v65 = v246;
    v309 = v246;
    v53 = v247;
    v310 = v247;
    v64 = v248;
    v311 = v248;
    v52 = v249;
    v312 = v249;
    v63 = v250;
    v313 = v250;
    v74 = v251;
    v75 = v252;
    v314 = v251;
    v315 = v252;
    v76 = v253;
    v316 = v253;
    v78 = v254;
    v317 = v254;
    v79 = v255;
    v318 = v255;
    OUTLINED_FUNCTION_28(v87, v256);
    v14 = *(void **)(v0 + 1144);
    v15 = *(void **)(v0 + 1176);
    v16 = *(uint64_t (**)(_QWORD *, id, void *, id))(v80 + 448);
    v17 = *(id *)(v0 + 32);
    v18 = v15;
    outlined retain of ConnectionConfiguration(&v184);
    outlined retain of ConnectionConfiguration(v256);
    v19 = v14;
    *(_QWORD *)(v0 + 1160) = v16(v87, v17, v14, v18);
    *(_QWORD *)(v0 + 1168) = v80;
    swift_unknownObjectRelease();
    if (*(_QWORD *)(v0 + 1160))
    {
      v20 = v12;
      v21 = *(_QWORD *)(v0 + 1168);
      v22 = OUTLINED_FUNCTION_131_0();
      v23 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v21 + 128);
      OUTLINED_FUNCTION_78_1();
      v24 = OUTLINED_FUNCTION_16_2();
      v23(v24, &protocol witness table for BackgroundConnection, v22, v21);
      *(_BYTE *)(v0 + 1184) = 1;
      v25 = OUTLINED_FUNCTION_6();
      swift_weakInit();
      v26 = *(void (**)(_QWORD, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v21 + 456);
      OUTLINED_FUNCTION_139_0();
      v26(0, partial apply for closure #1 in BackgroundConnection.startSecondaryConnection(), v25, v22, v21);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_140_0();
      v87[0] = v81;
      v87[1] = v82;
      v87[2] = v83;
      v87[3] = v84;
      v87[4] = v85;
      v87[5] = v86;
      v87[6] = v32;
      v87[7] = v33;
      v87[8] = v34;
      v87[9] = v7;
      v87[10] = v35;
      v87[11] = v8;
      v88 = v28;
      v89 = v44;
      v90 = v45;
      v91 = v46;
      v92 = v50;
      v94 = v49;
      v95 = v47;
      v98 = v48;
      v103 = v43;
      v104 = v42;
      v105 = v41;
      v106 = v40;
      v107 = v39;
      v108 = v38;
      v109 = v37;
      v110 = v36;
      v113 = v20;
      v116 = v13;
      v119 = v31;
      v122 = v30;
      v125 = v29;
      v128 = v27;
      *(_DWORD *)v100 = *(_DWORD *)v180;
      v111 = v178;
      *(_DWORD *)&v115[3] = *(_DWORD *)&v176[3];
      *(_DWORD *)v115 = *(_DWORD *)v176;
      *(_DWORD *)v118 = *(_DWORD *)v174;
      *(_DWORD *)&v121[3] = *(_DWORD *)&v172[3];
      *(_DWORD *)v121 = *(_DWORD *)v172;
      *(_DWORD *)v124 = *(_DWORD *)v170;
      *(_DWORD *)v127 = *(_DWORD *)v168;
      *(_DWORD *)v130 = *(_DWORD *)v166;
      v96 = v182;
      v97 = v183;
      v99 = v181;
      *(_DWORD *)&v100[3] = *(_DWORD *)&v180[3];
      v112 = v179;
      v114 = v177;
      v117 = v175;
      *(_DWORD *)&v118[3] = *(_DWORD *)&v174[3];
      v120 = v173;
      v123 = v171;
      *(_DWORD *)&v124[3] = *(_DWORD *)&v170[3];
      v126 = v169;
      *(_DWORD *)&v127[3] = *(_DWORD *)&v168[3];
      v129 = v167;
      *(_DWORD *)&v130[3] = *(_DWORD *)&v166[3];
      v93 = 0;
      v101 = v9;
      v102 = v10;
      v131 = v51;
      v132 = v165;
      v133 = v77;
      v134 = v163;
      v135 = v164;
      v136 = v62;
      v137 = v73;
      v138 = v61;
      v139 = v72;
      v140 = v60;
      v141 = v71;
      v142 = v59;
      v143 = v70;
      v144 = v58;
      v145 = v69;
      v146 = v57;
      v147 = v68;
      v148 = v56;
      v149 = v67;
      v150 = v55;
      v151 = v66;
      v152 = v54;
      v153 = v65;
      v154 = v53;
      v155 = v64;
      v156 = v52;
      v157 = v63;
      v158 = v74;
      v159 = v75;
      v160 = v76;
      v161 = v78;
      v162 = v79;
      outlined release of ConnectionConfiguration(v87);
      OUTLINED_FUNCTION_140_0();
    }
    else
    {
      outlined release of ConnectionConfiguration(v256);
    }
  }
  OUTLINED_FUNCTION_63_2();
}

void closure #1 in BackgroundConnection.startSecondaryConnection()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  char v10;
  uint64_t Strong;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(void **)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v12 = Strong;
    siri_kdebug_trace_0();
    if ((*(_BYTE *)(v12 + 1188) & 1) != 0)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v13 = type metadata accessor for Logger();
      __swift_project_value_buffer(v13, (uint64_t)static Logger.siriNetwork);
      v14 = Logger.logObject.getter();
      v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_246EC7000, v14, v15, "Background Connection - Provider. Secondary connection ignored. Primary connection viable.", v16, 2u);
        MEMORY[0x24956E018](v16, -1, -1);
      }

      BackgroundConnection.cancelSecondaryConnection()();
LABEL_8:
      swift_release();
      return;
    }
    if ((v10 & 1) != 0)
    {
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v17 = type metadata accessor for Logger();
      __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
      v18 = Logger.logObject.getter();
      v19 = static os_log_type_t.error.getter();
      v42 = v18;
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v41 = swift_slowAlloc();
        v47 = v9;
        v48 = v41;
        *(_DWORD *)v20 = 136315138;
        v40 = v20 + 4;
        v43 = (uint64_t)v5;
        v44 = v6;
        v45 = v7;
        v46 = v8;
        outlined copy of NetworkConnectionError(v5, v6, v7, v8, v9);
        v21 = String.init<A>(describing:)();
        v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v48);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        v23 = v42;
        _os_log_impl(&dword_246EC7000, v42, v19, "Background Connection - Provider. Secondary connection failed. Error: %s", v20, 0xCu);
        v24 = v41;
        swift_arrayDestroy();
        MEMORY[0x24956E018](v24, -1, -1);
        MEMORY[0x24956E018](v20, -1, -1);

      }
      else
      {
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
        outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);

      }
      BackgroundConnection.cancelSecondaryConnection()();
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v35 = (void *)swift_allocError();
      *v36 = v5;
      v36[1] = v6;
      v36[2] = v7;
      v36[3] = v8;
      v36[4] = v9;
      v37 = (void *)swift_allocError();
      *(_QWORD *)(v38 + 8) = 0;
      *(_QWORD *)(v38 + 16) = 0;
      *(_QWORD *)v38 = v35;
      *(_OWORD *)(v38 + 24) = xmmword_246F736B0;
      outlined copy of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
      v39 = v35;
      BackgroundConnection.didEncounterError(_:)(v37);
      swift_release();

      outlined consume of Result<(), NetworkConnectionError>(v5, v6, v7, v8, v9, 1);
    }
    else
    {
      *(_BYTE *)(v12 + 1184) = 2;
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v25 = type metadata accessor for Logger();
      __swift_project_value_buffer(v25, (uint64_t)static Logger.siriNetwork);
      v26 = Logger.logObject.getter();
      v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_246EC7000, v26, v27, "Background Connection - Provider. Secondary connection ready.", v28, 2u);
        MEMORY[0x24956E018](v28, -1, -1);
      }

      v29 = MEMORY[0x24956E090](v12 + 16);
      if (!v29)
        goto LABEL_8;
      v30 = v29;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v31 = (void *)swift_allocError();
      *(_QWORD *)(v32 + 8) = 0;
      *(_QWORD *)(v32 + 16) = 0;
      *(_QWORD *)v32 = 0;
      *(_OWORD *)(v32 + 24) = xmmword_246F736F0;
      v33 = type metadata accessor for ConnectionAnalysisInfo();
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v33);
      v34 = swift_retain();
      specialized Connection.didEncounterError(_:error:analysisInfo:)(v34, v31, (uint64_t)v4, v30);
      swift_unknownObjectRelease();
      swift_release_n();
      outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v4, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);

    }
  }
}

void BackgroundConnection.cancelSecondaryConnection()()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t ObjectType;

  if (*(_QWORD *)(v0 + 1160))
  {
    v2 = v0;
    v3 = *(_QWORD *)(v0 + 1168);
    v4 = one-time initialization token for siriNetwork;
    OUTLINED_FUNCTION_236_0();
    if (v4 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v5, (uint64_t)static Logger.siriNetwork);
    v6 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_27_0(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v7 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v4, v1, "Background Connection - Provider. Secondary connection cancelled.", v7);
      OUTLINED_FUNCTION_0_4();
    }

    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v3 + 472))(ObjectType, v3);
    OUTLINED_FUNCTION_23_6();
    *(_QWORD *)(v2 + 1160) = 0;
    *(_QWORD *)(v2 + 1168) = 0;
    swift_unknownObjectRelease();
    *(_BYTE *)(v2 + 1184) = 0;
    *(_BYTE *)(v2 + 1189) = 0;
  }
  OUTLINED_FUNCTION_10_4();
}

Swift::Void __swiftcall BackgroundConnection.updateActiveBackgroundConnectionWithSecondary()()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  _OWORD *v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
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
  uint64_t ObjectType;
  double v19;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[24];
  uint64_t v43;

  v2 = v0;
  v3 = (_OWORD *)(v0 + 1080);
  OUTLINED_FUNCTION_214_0();
  v4 = *(NSObject **)(v0 + 1080);
  *v3 = v3[5];
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_5_16();
  *(_QWORD *)(v2 + 1168) = 0;
  *((_QWORD *)v3 + 10) = 0;
  swift_unknownObjectRelease();
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v5, (uint64_t)static Logger.siriNetwork);
  v6 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_1_23(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_8_0(&dword_246EC7000, v4, v1, "Background Connection - Provider. Secondary connection active.", v7);
    OUTLINED_FUNCTION_0_4();
  }

  v8 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_62_3(v8, (uint64_t)v42, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v43)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
    OUTLINED_FUNCTION_243();
    v16 = OUTLINED_FUNCTION_237_0();
    if ((v16 & 1) != 0)
    {
      if (*(_QWORD *)v3)
      {
        v17 = *(_QWORD *)(v2 + 1088);
        ObjectType = swift_getObjectType();
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v17 + 544))(ObjectType, v17) & 1) != 0)
          v19 = 5.0;
        else
          v19 = 7.0;
        swift_unknownObjectRetain();
        CommunicationProtocolAce.scheduleAceHeaderTimeout(withInterval:)(v19);
        OUTLINED_FUNCTION_140_0();
        v16 = swift_unknownObjectRelease();
      }
      else
      {
        v16 = OUTLINED_FUNCTION_140_0();
      }
    }
  }
  else
  {
    OUTLINED_FUNCTION_112_0(v9, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v10, v11, v12, v13, v14, v15, v37, v38, v39);
  }
  OUTLINED_FUNCTION_62_3(v16, (uint64_t)v42, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v43)
  {
    v27 = OUTLINED_FUNCTION_56_3(v20);
    OUTLINED_FUNCTION_112_0(v27, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v28, v29, v30, v31, v32, v33, v37, v38, v39);
    v34 = v40;
    v35 = v41;
    OUTLINED_FUNCTION_160_1(&v38, v40);
    v36 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(v35 + 104))(0, 0, *(unsigned __int8 *)(v2 + 153), v34, v35);
    OUTLINED_FUNCTION_184_0(v36);
  }
  else
  {
    OUTLINED_FUNCTION_112_0(v20, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v21, v22, v23, v24, v25, v26, v37, v38, v39);
  }
  BackgroundConnection.setupReadHandlerOnProvider()();
  BackgroundConnection.networkProviderDidOpen()();
  *(_BYTE *)(v2 + 1184) = 0;
  *(_WORD *)(v2 + 1188) = 1;
}

void BackgroundConnection.networkProviderDidOpen()()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  char v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t __dst[52];
  _BYTE v33[104];
  _QWORD v34[50];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[100];
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_48_2();
  v38 = v2;
  v39 = v3;
  if ((*(_BYTE *)(v1 + 1185) & 1) != 0)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_5_1();
    v30 = OUTLINED_FUNCTION_3_1(v4, (uint64_t)static Logger.siriNetwork);
    v5 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_157_1(v5, v6, v7, v8, v9, v10, v11, v12, v30))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v13 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v31, v0, "Background Connection - Provider. Provider ready received when it is already ready.", v13);
      OUTLINED_FUNCTION_0_4();
    }

  }
  else
  {
    v14 = v1;
    siri_kdebug_trace_0();
    *(_BYTE *)(v1 + 1185) = 1;
    *(_BYTE *)(v1 + 1188) = 1;
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
    objc_msgSend(v15, sel_systemUptime);
    v17 = v16;

    *(_QWORD *)(v14 + 1208) = v17;
    v18 = OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_66_2(v18, (uint64_t)v34, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v34[3])
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v34, (uint64_t)__dst);
      outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v34, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      v19 = __dst[3];
      v20 = __dst[4];
      __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
      v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 168))(v19, v20);
      OUTLINED_FUNCTION_184_0(v21);
    }
    else
    {
      outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v34, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    }
    v22 = *(double *)(v14 + 1208);
    v23 = *(double *)(v14 + 1200);
    v24 = MEMORY[0x24956E090](v14 + 16);
    if (v24)
    {
      v25 = v24;
      if (*(_QWORD *)(v14 + 1080))
      {
        v26 = v22 - v23;
        OUTLINED_FUNCTION_131_0();
        OUTLINED_FUNCTION_78_1();
        OUTLINED_FUNCTION_218_0();
        v27 = v33[103];
        OUTLINED_FUNCTION_28(v34, (const void *)(v14 + 40));
        v28 = v36;
        if (v36 == 1)
        {
          v29 = 0;
          v28 = 0;
        }
        else
        {
          v29 = (void *)v35;
          memcpy(__dst, (const void *)(v14 + 40), 0x190uLL);
          __dst[50] = v35;
          __dst[51] = v36;
          memcpy(v33, v37, 0x64uLL);
          outlined retain of ConnectionConfiguration(v34);
          OUTLINED_FUNCTION_47_3();
          outlined release of ConnectionConfiguration(__dst);
        }
        specialized Connection.didOpenConnectionType(_:type:routeId:delay:)(v14, v27, v29, v28, v25, v26);
        OUTLINED_FUNCTION_23_6();
        OUTLINED_FUNCTION_5_16();
        OUTLINED_FUNCTION_6_4();
      }
      else
      {
        OUTLINED_FUNCTION_23_6();
      }
    }
    BackgroundConnection.tryToWriteBufferedOutputData(with:)(0, 0);
    OUTLINED_FUNCTION_63_2();
  }
}

void BackgroundConnection.sendData(_:with:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD v23[4];

  outlined init with copy of Any(a1, (uint64_t)v23);
  Data.init(instance:)(v23);
  if (v8 >> 60 == 15)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v9, (uint64_t)static Logger.siriNetwork);
    v10 = OUTLINED_FUNCTION_58();
    if (OUTLINED_FUNCTION_7_0(v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v3, (os_log_type_t)v3, "Background Connection - Writter. Error, data nil", v11);
      OUTLINED_FUNCTION_0_4();
    }

    if (a2)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_124_1(v12, 6);
      *(_OWORD *)(v13 + 24) = xmmword_246F72F10;
      v14 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_203(v14, v15);
      *(_OWORD *)(v16 + 24) = xmmword_246F72F20;
      a2();
      OUTLINED_FUNCTION_36_2();
    }
  }
  else
  {
    v17 = v7;
    v18 = v8;
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_5_1();
    v20 = __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
    outlined copy of Data._Representation(v17, v18);
    Logger.logObject.getter();
    v21 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_61(v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v22 = 134217984;
      v23[0] = Data.count.getter();
      OUTLINED_FUNCTION_137_2();
      OUTLINED_FUNCTION_134_0();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v20, v4, "Background Connection - Writter. Send %ld bytes", v22);
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_134_0();

    BackgroundConnection.bufferGeneralData(data:)();
    BackgroundConnection.tryToWriteBufferedOutputData(with:)((uint64_t)a2, a3);
    OUTLINED_FUNCTION_134_0();
  }
  OUTLINED_FUNCTION_251();
}

void BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1, char a2, void (*a3)(void), uint64_t a4)
{
  char v4;
  os_log_type_t v5;
  char v6;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  unint64_t v34;
  os_log_type_t v35;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  os_log_type_t v153;
  uint8_t *v154;
  uint64_t v155;
  os_log_type_t v156;
  uint8_t *v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  _QWORD *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  os_log_type_t v181;
  uint8_t *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  os_log_type_t v188;
  int v189;
  uint8_t *v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  os_log_type_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  void (*v248)(_QWORD);
  uint64_t v249;
  void (*v250)(void);
  uint64_t v251;
  void (*v252)(void);
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  id v276[3];
  unint64_t v277;
  uint64_t v278;

  v6 = v4;
  v278 = *MEMORY[0x24BDAC8D0];
  v276[0] = 0;
  v11 = objc_msgSend(a1, sel_serializedAceDataError_, v276);
  v12 = v276[0];
  if (!v11)
  {
    v254 = a4;
    v28 = v276[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v239 = (id)_convertErrorToNSError(_:)();
    v29 = objc_msgSend(v239, sel_domain);
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v32 = v31;

    if (v30 == 0xD00000000000001CLL && v32 == 0x8000000246F79390)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
      OUTLINED_FUNCTION_44_1();
      if ((v76 & 1) == 0)
        goto LABEL_18;
    }
    if (!objc_msgSend(v239, sel_code))
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v152 = OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_3_1(v152, (uint64_t)static Logger.siriNetwork);
      v153 = OUTLINED_FUNCTION_35_0();
      if (OUTLINED_FUNCTION_122_0(v153))
      {
        v154 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        *(_WORD *)v154 = 0;
        OUTLINED_FUNCTION_8_0(&dword_246EC7000, v32, (os_log_type_t)v30, "Background Connection - sendCommand. Got invalid error from Objective-C", v154);
        OUTLINED_FUNCTION_0_4();
      }

      if (a3)
        ((void (*)(_QWORD))a3)(0);
      goto LABEL_38;
    }
LABEL_18:
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v77 = OUTLINED_FUNCTION_5_1();
    v78 = __swift_project_value_buffer(v77, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_167_2();
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_167_2();
    Logger.logObject.getter();
    v79 = OUTLINED_FUNCTION_58();
    if (OUTLINED_FUNCTION_60(v79))
    {
      v80 = OUTLINED_FUNCTION_2_2();
      v81 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      v276[0] = (id)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v80 = 136315394;
      OUTLINED_FUNCTION_49_3();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
      v82 = OUTLINED_FUNCTION_130_1();
      OUTLINED_FUNCTION_120_1(v82, v83, v84, v85, v86, v87, v88, v89, v200, v210, v216, v224, v231, (uint64_t)v239, (uint64_t)a3, v254, v261, (uint64_t)a1, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (uint64_t)v276[0]);
      OUTLINED_FUNCTION_38_7();
      OUTLINED_FUNCTION_21_11();
      swift_bridgeObjectRelease();
      *(_WORD *)(v80 + 12) = 2112;
      OUTLINED_FUNCTION_167_2();
      v268 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_38_7();
      *v81 = v268;
      OUTLINED_FUNCTION_81_4();
      OUTLINED_FUNCTION_81_4();
      _os_log_impl(&dword_246EC7000, v78, (os_log_type_t)a3, "Background Connection - sendCommand. Error sending %s, error: %@", (uint8_t *)v80, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_21_11();
    OUTLINED_FUNCTION_81_4();
    OUTLINED_FUNCTION_81_4();

    if (a3)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v95 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_203(v95, v96);
      *(_OWORD *)(v97 + 24) = xmmword_246F72F20;
      OUTLINED_FUNCTION_167_2();
      ((void (*)(uint64_t))a3)(v95);
      OUTLINED_FUNCTION_81_4();

      goto LABEL_48;
    }
LABEL_38:
    OUTLINED_FUNCTION_81_4();

    return;
  }
  v13 = v11;
  v277 = type metadata accessor for OS_dispatch_data();
  v276[0] = v13;
  v14 = v12;
  Data.init(instance:)(v276);
  if (v16 >> 60 != 15)
  {
    v33 = v15;
    v34 = v16;
    v35 = v6 + 72;
    v36 = OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_62_3(v36, (uint64_t)v276, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v277)
    {
      OUTLINED_FUNCTION_119_2(v37, v38, v39, v40, v41, v42, v43, v44, v200, v210, v216, v224, v231, (uint64_t)v238, (uint64_t)a3, v253, v261, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (char)v276[0]);
      v45 = OUTLINED_FUNCTION_239_0();
      OUTLINED_FUNCTION_95_2(v45, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v46, v47, v48, v49, v50, v51, v201, v211, v217, v225, v232, (uint64_t)v240, v247, v255, v262, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (char)v276[0]);
      OUTLINED_FUNCTION_160_1(&v268, v271);
      v52 = OUTLINED_FUNCTION_157_0();
      v54 = v53(v52);
      v62 = OUTLINED_FUNCTION_139(v54, v55, v56, v57, v58, v59, v60, v61, v202);
      if ((a2 & 1) != 0)
      {
LABEL_12:
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v63 = OUTLINED_FUNCTION_5_1();
        v64 = __swift_project_value_buffer(v63, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data?(v33, v34);
        OUTLINED_FUNCTION_49_3();
        outlined copy of Data?(v33, v34);
        OUTLINED_FUNCTION_49_3();
        Logger.logObject.getter();
        v65 = OUTLINED_FUNCTION_35_0();
        if (OUTLINED_FUNCTION_14_5(v64))
        {
          v66 = OUTLINED_FUNCTION_2_2();
          v276[0] = (id)OUTLINED_FUNCTION_2_2();
          *(_DWORD *)v66 = 136315394;
          v268 = (uint64_t)a1;
          OUTLINED_FUNCTION_49_3();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
          v67 = OUTLINED_FUNCTION_130_1();
          v268 = OUTLINED_FUNCTION_120_1(v67, v68, v69, v70, v71, v72, v73, v74, v203, v212, v218, v226, v233, (uint64_t)v241, (uint64_t)v248, a4, v263, v268, v269,
                   v270,
                   v271,
                   v272,
                   v273,
                   v274,
                   v275,
                   (uint64_t)v276[0]);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_21_11();
          swift_bridgeObjectRelease();
          *(_WORD *)(v66 + 12) = 2048;
          OUTLINED_FUNCTION_157_0();
          v75 = Data.count.getter();
          OUTLINED_FUNCTION_17_14();
          v268 = v75;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_17_14();
          _os_log_impl(&dword_246EC7000, v64, v65, "Background Connection - sendCommand. Buffering %s of size %ld, more commands are comming.", (uint8_t *)v66, 0x16u);
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_0_4();
        }
        OUTLINED_FUNCTION_17_14();
        OUTLINED_FUNCTION_21_11();
        OUTLINED_FUNCTION_17_14();

        if (v248)
          v248(0);
        goto LABEL_50;
      }
    }
    else
    {
      v98 = OUTLINED_FUNCTION_239_0();
      OUTLINED_FUNCTION_95_2(v98, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v99, v100, v101, v102, v103, v104, v200, v210, v216, v224, v231, (uint64_t)v238, (uint64_t)a3, v253, v261, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (char)v276[0]);
      if ((a2 & 1) != 0)
        goto LABEL_12;
    }
    OUTLINED_FUNCTION_62_3(v62, (uint64_t)v276, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v277)
    {
      v113 = OUTLINED_FUNCTION_119_2(v105, v106, v107, v108, v109, v110, v111, v112, v203, v212, v218, v226, v233, (uint64_t)v241, (uint64_t)v248, v256, v263, v268, v269,
               v270,
               v271,
               v272,
               v273,
               v274,
               v275,
               (char)v276[0]);
      OUTLINED_FUNCTION_95_2(v113, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v114, v115, v116, v117, v118, v119, v204, v213, v219, v227, v234, (uint64_t)v242, v249, v257, v264, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (char)v276[0]);
      v120 = v271;
      v121 = v272;
      v12 = __swift_project_boxed_opaque_existential_1(&v268, v271);
      v122 = (*(uint64_t (**)(uint64_t, uint64_t))(v121 + 136))(v120, v121);
      v124 = v123;
      v131 = OUTLINED_FUNCTION_139(v122, v123, v125, v126, v127, v128, v129, v130, v205);
      if (v124 >> 60 != 15)
      {
        OUTLINED_FUNCTION_62_3(v131, (uint64_t)v276, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
        if (v277)
        {
          v140 = OUTLINED_FUNCTION_119_2(v132, v133, v134, v135, v136, v137, v138, v139, v206, v214, v220, v228, v235, (uint64_t)v243, (uint64_t)v250, v258, v265, v268, v269,
                   v270,
                   v271,
                   v272,
                   v273,
                   v274,
                   v275,
                   (char)v276[0]);
          OUTLINED_FUNCTION_95_2(v140, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v141, v142, v143, v144, v145, v146, v207, v215, v221, v229, v236, (uint64_t)v244, v251, v259, v266, v268, v269,
            v270,
            v271,
            v272,
            v273,
            v274,
            v275,
            (char)v276[0]);
          v147 = (void *)v122;
          v148 = v271;
          v149 = v272;
          OUTLINED_FUNCTION_160_1(&v268, v271);
          v245 = v147;
          v150 = v147;
          v35 = OS_LOG_TYPE_DEFAULT;
          v151 = (*(uint64_t (**)(void *, unint64_t, uint64_t, uint64_t))(v149 + 192))(v150, v124, v148, v149);
          v173 = v172;
          v237 = (void *)v151;
          OUTLINED_FUNCTION_139(v151, v172, v174, v175, v176, v177, v178, v179, v208);
          if (v173 >> 60 != 15)
          {
            v230 = v124;
            outlined copy of Data._Representation((uint64_t)v237, v173);
            if (one-time initialization token for siriNetwork != -1)
              swift_once();
            v260 = a4;
            v187 = OUTLINED_FUNCTION_5_1();
            OUTLINED_FUNCTION_75_3(v187, (uint64_t)static Logger.siriNetwork);
            Logger.logObject.getter();
            v188 = OUTLINED_FUNCTION_35_0();
            v189 = v188;
            if (os_log_type_enabled(v12, v188))
            {
              HIDWORD(v222) = v189;
              v190 = (uint8_t *)OUTLINED_FUNCTION_2_2();
              v276[0] = (id)OUTLINED_FUNCTION_2_2();
              *(_DWORD *)v190 = 136315138;
              v268 = (uint64_t)a1;
              OUTLINED_FUNCTION_49_3();
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
              v191 = OUTLINED_FUNCTION_130_1();
              OUTLINED_FUNCTION_120_1(v191, v192, v193, v194, v195, v196, v197, v198, v209, (uint64_t)(v190 + 4), v222, v230, (uint64_t)v237, (uint64_t)v245, (uint64_t)v252, v260, v267, v268, v269,
                v270,
                v271,
                v272,
                v273,
                v274,
                v275,
                (uint64_t)v276[0]);
              OUTLINED_FUNCTION_197_1();
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              OUTLINED_FUNCTION_21_11();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_30_0(&dword_246EC7000, v12, v223, "Background Connection - sendCommand. Sending %s and any buffered command.", v190);
              OUTLINED_FUNCTION_20_1();
              OUTLINED_FUNCTION_0_4();
            }

            OUTLINED_FUNCTION_21_11();
            v277 = MEMORY[0x24BDCDDE8];
            v276[0] = v237;
            v276[1] = (id)v173;
            v199 = (_QWORD *)OUTLINED_FUNCTION_6();
            v199[2] = a1;
            v199[3] = v252;
            v199[4] = v260;
            outlined copy of Data?((uint64_t)v237, v173);
            OUTLINED_FUNCTION_49_3();
            OUTLINED_FUNCTION_256();
            BackgroundConnection.sendData(_:with:)((uint64_t)v276, (void (*)(void))partial apply for closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:), (uint64_t)v199);
            OUTLINED_FUNCTION_198_1();
            OUTLINED_FUNCTION_17_14();
            OUTLINED_FUNCTION_198_1();
            OUTLINED_FUNCTION_16_16();
            outlined consume of Data?((uint64_t)v245, v124);
            OUTLINED_FUNCTION_17_14();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v276);
            return;
          }
        }
        else
        {
          OUTLINED_FUNCTION_95_2(v132, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v134, v135, v136, v137, v138, v139, v206, v214, v220, v228, v235, (uint64_t)v243, (uint64_t)v250, v258, v265, v268, v269,
            v270,
            v271,
            v272,
            v273,
            v274,
            v275,
            (char)v276[0]);
        }
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v180 = OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_3_1(v180, (uint64_t)static Logger.siriNetwork);
        v181 = OUTLINED_FUNCTION_58();
        if (OUTLINED_FUNCTION_1_23(v181))
        {
          v182 = (uint8_t *)OUTLINED_FUNCTION_2_2();
          *(_WORD *)v182 = 0;
          OUTLINED_FUNCTION_8_0(&dword_246EC7000, v12, v35, "Background Connection - Writter. Error compressing data: nil data", v182);
          OUTLINED_FUNCTION_0_4();
        }

        if (v252)
        {
          lazy protocol witness table accessor for type BackgroundConnectionError and conformance BackgroundConnectionError();
          v183 = OUTLINED_FUNCTION_11_2();
          *(_QWORD *)v184 = 3;
          *(_QWORD *)(v184 + 8) = 0;
          *(_QWORD *)(v184 + 16) = 0;
          *(_QWORD *)(v184 + 24) = 0;
          *(_BYTE *)(v184 + 32) = 4;
          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          v92 = OUTLINED_FUNCTION_11_2();
          *(_QWORD *)(v185 + 8) = 0;
          *(_QWORD *)(v185 + 16) = 0;
          *(_QWORD *)v185 = v183;
          *(_OWORD *)(v185 + 24) = xmmword_246F72F20;
          v252();
          v186 = OUTLINED_FUNCTION_161_1();
          outlined consume of Data?(v186, v124);
          OUTLINED_FUNCTION_17_14();
          goto LABEL_24;
        }
        v170 = OUTLINED_FUNCTION_161_1();
        v171 = v124;
LABEL_51:
        outlined consume of Data?(v170, v171);
        OUTLINED_FUNCTION_17_14();
        return;
      }
    }
    else
    {
      OUTLINED_FUNCTION_95_2(v105, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v107, v108, v109, v110, v111, v112, v203, v212, v218, v226, v233, (uint64_t)v241, (uint64_t)v248, v256, v263, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (char)v276[0]);
    }
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v155 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_75_3(v155, (uint64_t)static Logger.siriNetwork);
    Logger.logObject.getter();
    v156 = OUTLINED_FUNCTION_58();
    if (OUTLINED_FUNCTION_14_5(v12))
    {
      v157 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v276[0] = (id)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v157 = 136315138;
      v268 = (uint64_t)a1;
      OUTLINED_FUNCTION_49_3();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
      v158 = OUTLINED_FUNCTION_130_1();
      OUTLINED_FUNCTION_120_1(v158, v159, v160, v161, v162, v163, v164, v165, v206, v214, v220, v228, v235, (uint64_t)v243, (uint64_t)v250, a4, v265, v268, v269,
        v270,
        v271,
        v272,
        v273,
        v274,
        v275,
        (uint64_t)v276[0]);
      OUTLINED_FUNCTION_197_1();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_21_11();
      OUTLINED_FUNCTION_10_2();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v12, v156, "Background Connection - sendCommand. Error sending %s, error: connection does not have buffered out pudata to write", v157);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_21_11();
    if (!v250)
    {
LABEL_50:
      v170 = OUTLINED_FUNCTION_157_0();
      goto LABEL_51;
    }
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    v166 = OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_124_1(v167, 6);
    *(_OWORD *)(v168 + 24) = xmmword_246F72F10;
    v95 = OUTLINED_FUNCTION_11_2();
    *(_QWORD *)(v169 + 8) = 0;
    *(_QWORD *)(v169 + 16) = 0;
    *(_QWORD *)v169 = v166;
    *(_OWORD *)(v169 + 24) = xmmword_246F72F20;
    v250();
    OUTLINED_FUNCTION_17_14();
    OUTLINED_FUNCTION_17_14();
LABEL_48:
    v94 = (void *)v95;
    goto LABEL_49;
  }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_75_3(v17, (uint64_t)static Logger.siriNetwork);
  Logger.logObject.getter();
  v18 = OUTLINED_FUNCTION_58();
  if (OUTLINED_FUNCTION_27_0(v18))
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    v276[0] = (id)OUTLINED_FUNCTION_2_2();
    *(_DWORD *)v19 = 136315138;
    OUTLINED_FUNCTION_49_3();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    v20 = OUTLINED_FUNCTION_130_1();
    v268 = OUTLINED_FUNCTION_120_1(v20, v21, v22, v23, v24, v25, v26, v27, v200, v210, v216, v224, v231, (uint64_t)v238, v246, a4, v261, (uint64_t)a1, v269,
             v270,
             v271,
             v272,
             v273,
             v274,
             v275,
             (uint64_t)v276[0]);
    OUTLINED_FUNCTION_247();
    OUTLINED_FUNCTION_21_11();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_30_0(&dword_246EC7000, v12, v5, "Background Connection - sendCommand. Error sending %s, error: serialization error, ace data nil", v19);
    OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_0_4();
  }

  OUTLINED_FUNCTION_21_11();
  if (a3)
  {
    lazy protocol witness table accessor for type AceSerializationError and conformance AceSerializationError();
    v90 = OUTLINED_FUNCTION_11_2();
    *(_OWORD *)v91 = xmmword_246F75560;
    *(_BYTE *)(v91 + 16) = 3;
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    v92 = OUTLINED_FUNCTION_11_2();
    *(_QWORD *)(v93 + 8) = 0;
    *(_QWORD *)(v93 + 16) = 0;
    *(_QWORD *)v93 = v90;
    *(_OWORD *)(v93 + 24) = xmmword_246F72F20;
    a3();
LABEL_24:
    v94 = (void *)v92;
LABEL_49:

  }
}

void closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1, uint64_t a2, void (*a3)(void *))
{
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)static Logger.siriNetwork);
    swift_unknownObjectRetain();
    v6 = a1;
    swift_unknownObjectRetain();
    v7 = a1;
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v8, v9))
    {
      swift_unknownObjectRelease_n();

LABEL_12:
      if (!a3)
        return;
      goto LABEL_13;
    }
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v23 = v12;
    *(_DWORD *)v10 = 136315394;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    v13 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v15 = a1;
    v22 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v11 = v22;

    _os_log_impl(&dword_246EC7000, v8, v9, "Background Connection - sendCommand. Error sending %s and any buffered command, error: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v11, -1, -1);
    swift_arrayDestroy();
    v16 = v12;
LABEL_10:
    MEMORY[0x24956E018](v16, -1, -1);
    MEMORY[0x24956E018](v10, -1, -1);
    goto LABEL_12;
  }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
  swift_unknownObjectRetain_n();
  v8 = Logger.logObject.getter();
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v18))
  {
    v10 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v23 = v19;
    *(_DWORD *)v10 = 136315138;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
    v20 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246EC7000, v8, v18, "Background Connection - sendCommand. %s and any buffered command sent", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    v16 = v19;
    goto LABEL_10;
  }

  swift_unknownObjectRelease_n();
  if (!a3)
    return;
LABEL_13:
  a3(a1);
}

uint64_t BackgroundConnection.sendCommands(_:with:)()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_48_2();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  if (!(v0 >> 62))
  {
    v6 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_16_0();
    v8 = v6;
    v17 = v6;
    if (v6)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_0();
  v17 = _CocoaArrayWrapper.endIndex.getter();
  if (!v17)
    return swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_0();
  v8 = _CocoaArrayWrapper.endIndex.getter();
  result = swift_bridgeObjectRelease();
LABEL_3:
  v9 = __OFSUB__(v8, 1);
  v10 = v8 - 1;
  if (v9)
  {
    __break(1u);
  }
  else if (v17 >= 1)
  {
    v11 = 0;
    v12 = v5 & 0xC000000000000001;
    v13 = v5;
    do
    {
      if (v12)
      {
        v14 = MEMORY[0x24956D43C](v11, v5);
      }
      else
      {
        v14 = *(_QWORD *)(v5 + 8 * v11 + 32);
        OUTLINED_FUNCTION_152_0();
      }
      v15 = (_QWORD *)OUTLINED_FUNCTION_6();
      v15[2] = v4;
      v15[3] = v2;
      v15[4] = v14;
      outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v4);
      v16 = (void *)OUTLINED_FUNCTION_152_0();
      BackgroundConnection.sendCommand(_:moreComing:with:)(v16, v10 != v11, (void (*)(void))partial apply for closure #1 in BackgroundConnection.sendCommands(_:with:), (uint64_t)v15);
      swift_unknownObjectRelease();
      swift_release();
      ++v11;
      v5 = v13;
    }
    while (v17 != v11);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall BackgroundConnection.cancel()()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 1186) & 1) != 0
    || (OUTLINED_FUNCTION_214_0(), *(_BYTE *)(v0 + 1186) = 1, (v1 = MEMORY[0x24956E090](v0 + 16)) == 0))
  {
    OUTLINED_FUNCTION_23_1();
  }
  else
  {
    specialized Connection.didClose(_:)(v0, v1);
    OUTLINED_FUNCTION_23_6();
    *(_QWORD *)(v0 + 24) = 0;
    swift_unknownObjectWeakAssign();
  }
}

void BackgroundConnection.barrier(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_66_2(v4, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol);
    OUTLINED_FUNCTION_243();
    if ((OUTLINED_FUNCTION_237_0() & 1) != 0)
    {
      CommunicationProtocolAce.barrier(with:)(a1, a2);
      swift_release();
    }
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  OUTLINED_FUNCTION_251();
}

void BackgroundConnection.didEncounterError(_:)(void *a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_0();
  v8 = v7 - v6;
  if ((*(_BYTE *)(v1 + 1187) & 1) != 0)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_5_1();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_92_3();
    OUTLINED_FUNCTION_92_3();
    v23 = Logger.logObject.getter();
    v10 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_97_2(v23))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v12 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v11 = 138412290;
      OUTLINED_FUNCTION_92_3();
      v13 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_221_0(v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v12 = v13;
      OUTLINED_FUNCTION_63_3();
      OUTLINED_FUNCTION_63_3();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v23, v10, "Background Connection - Provider: Did encounter error %@, but it is not going to be reported because a more recent error was already reported.", v11);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_63_3();
    OUTLINED_FUNCTION_63_3();

  }
  else
  {
    v14 = (_BYTE *)(v1 + 1187);
    v15 = MEMORY[0x24956E090](v1 + 16);
    if (v15)
    {
      v16 = v15;
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v17 = OUTLINED_FUNCTION_5_1();
      v18 = __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
      OUTLINED_FUNCTION_92_3();
      OUTLINED_FUNCTION_92_3();
      Logger.logObject.getter();
      v19 = OUTLINED_FUNCTION_58();
      if (OUTLINED_FUNCTION_61(v19))
      {
        v20 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        v22 = (_QWORD *)OUTLINED_FUNCTION_2_2();
        *(_DWORD *)v20 = 138412290;
        OUTLINED_FUNCTION_92_3();
        v21 = _swift_stdlib_bridgeErrorToNSError();
        OUTLINED_FUNCTION_221_0(v21);
        OUTLINED_FUNCTION_137_2();
        *v22 = v21;
        OUTLINED_FUNCTION_63_3();
        OUTLINED_FUNCTION_63_3();
        OUTLINED_FUNCTION_30_0(&dword_246EC7000, v18, v2, "Background Connection - Provider: Did encounter error %@", v20);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_0_4();
      }
      OUTLINED_FUNCTION_63_3();
      OUTLINED_FUNCTION_63_3();

      BackgroundConnection.connectionAnalysisInfo.getter(v8);
      specialized Connection.didEncounterError(_:error:analysisInfo:)(v3, a1, v8, v16);
      swift_unknownObjectRelease();
      outlined destroy of RPCOspreyConnectionProtocol?(v8, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
    }
    *v14 = 1;
  }
}

void BackgroundConnection.didEncounterIntermediateError(_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_48_2();
  v3 = *(_QWORD *)(v0 + 1080);
  if (v3)
  {
    v4 = v0;
    v5 = v2;
    v6 = *(_QWORD *)(v0 + 1088);
    v7 = one-time initialization token for siriNetwork;
    swift_unknownObjectRetain();
    if (v7 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_5_1();
    v9 = __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    Logger.logObject.getter();
    v10 = OUTLINED_FUNCTION_58();
    if (OUTLINED_FUNCTION_61(v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v12 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v11 = 138412290;
      OUTLINED_FUNCTION_104_1();
      v14 = OUTLINED_FUNCTION_115_2();
      OUTLINED_FUNCTION_137_2();
      *v12 = v14;
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v9, v1, "Background Connection - Provider: Did encounter error %@", v11);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_36_2();

    v13 = OUTLINED_FUNCTION_164();
    specialized BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(v3, v5, v4, v13, v6);
    OUTLINED_FUNCTION_3_6();
  }
  OUTLINED_FUNCTION_17_5();
}

void BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;

  if (*(_QWORD *)(v1 + 1080))
  {
    v3 = *(_QWORD *)(v1 + 1088);
    v4 = OUTLINED_FUNCTION_131_0();
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 472);
    OUTLINED_FUNCTION_78_1();
    v5(v4, v3);
    OUTLINED_FUNCTION_5_16();
  }
  v6 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_66_2(v6, (uint64_t)v29, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v30)
  {
    v14 = OUTLINED_FUNCTION_56_3(v7);
    OUTLINED_FUNCTION_112_0(v14, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v15, v16, v17, v18, v19, v20, v24, v25, v26);
    v21 = v27;
    v22 = v28;
    OUTLINED_FUNCTION_160_1(&v25, v27);
    v23 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v22 + 144))(a1 & 1, v21, v22);
    OUTLINED_FUNCTION_184_0(v23);
  }
  else
  {
    OUTLINED_FUNCTION_112_0(v7, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v8, v9, v10, v11, v12, v13, v24, v25, v26);
  }
  *(_WORD *)(v1 + 1185) = 0;
  *(_BYTE *)(v1 + 1187) = 0;
  siri_kdebug_trace_0();
  OUTLINED_FUNCTION_60_1();
}

Swift::String __swiftcall BackgroundConnection.getConnectionMethod()()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Swift::String result;
  _BYTE v13[520];
  _QWORD v14[65];

  v2 = *(_BYTE *)(v0 + 1136);
  OUTLINED_FUNCTION_28(v14, (const void *)(v0 + 40));
  OUTLINED_FUNCTION_28(v13, (const void *)(v0 + 40));
  if (*(_QWORD *)(v0 + 1080))
  {
    v3 = OUTLINED_FUNCTION_83_3();
    v4 = *(uint64_t (**)(uint64_t))(v1 + 280);
    OUTLINED_FUNCTION_213_0();
    OUTLINED_FUNCTION_236_0();
    v5 = v4(v3);
    OUTLINED_FUNCTION_23_6();
  }
  else
  {
    OUTLINED_FUNCTION_213_0();
    v5 = 0;
  }
  ConnectionMethod.connectionMethodDescription(connectionConfiguration:isMPTCP:)((uint64_t)v13, v5 & 1, v2);
  v7 = v6;
  v9 = v8;
  outlined release of ConnectionConfiguration(v14);
  v10 = v7;
  v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t BackgroundConnection.getConnectionMetrics(connectionMethodHistory:with:)(uint64_t a1)
{
  NSObject *v1;
  uint8_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(int *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64x2_t *v18;
  uint64_t v19;
  os_log_type_t v20;
  _WORD *v21;
  objc_class *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL *v29;
  _BYTE *v30;
  uint64_t v31;
  char v32;
  double v33;
  void *v34;
  id v35;
  id v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  float64x2_t v40;
  double v41;
  char v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  float64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  Class v62;
  Class v63;
  Class v64;
  uint64_t v65;
  void (*v66)(uint64_t, Class);
  char v67;
  uint64_t v68;
  __int128 v69;
  __n128 *v70;
  __int128 v71;
  __n128 *v72;
  __int128 v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t);
  char v79;
  uint64_t v80;
  __int128 v81;
  __n128 *v82;
  __int128 v83;
  __n128 *v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t *, uint64_t (*)(uint64_t), uint64_t, uint64_t, Class);
  int v92;
  int v93;
  int v94;
  int v95;
  __int16 v96;
  int v97;
  int v98;
  uint64_t result;
  uint64_t v100;
  __int128 v101;
  __n128 v102;
  __int128 v103;
  __int128 v104;
  __n128 v105;
  __n128 v106;
  __int128 v107;
  __int128 v108;
  __n128 v109;
  __n128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  __n128 v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  char v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  char v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  char v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  int v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  char v144;
  uint64_t v145;
  uint64_t v146;
  char v147;
  char v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  __int128 v159;
  float64_t v160;
  uint64_t v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  void (*v166)(int *);
  uint64_t v167;
  float64x2_t v168;
  float64_t v169;
  uint64_t v170;
  NSObject *v171;
  Class v172;
  __int128 v173;
  Class isa;
  uint64_t v175;
  uint64_t v176;
  int v177;
  char v178;
  __int16 v179;
  char v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  char v184;
  _BYTE v185[7];
  uint64_t v186;
  uint64_t v187;
  __int128 v188;
  __int128 v189;
  int v190;
  char v191;
  __int16 v192;
  char v193;
  int v194;
  char v195;
  __int16 v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  _BYTE v203[7];
  uint64_t v204;
  char v205;
  _BYTE v206[7];
  uint64_t v207;
  char v208;
  _BYTE v209[7];
  uint64_t v210;
  char v211;
  _BYTE v212[7];
  uint64_t v213;
  char v214;
  _BYTE v215[7];
  uint64_t v216;
  char v217;
  _BYTE v218[7];
  uint64_t v219;
  uint64_t v220;
  double v221;
  char v222;
  _BYTE v223[7];
  double v224;
  char v225;
  char v226;
  int v227;
  __int16 v228;
  float64_t v229;
  char v230;
  _BYTE v231[7];
  float64_t v232;
  char v233;
  _BYTE v234[7];
  double v235;
  char v236;
  uint64_t v237;
  char v238;
  uint64_t v239;
  __int128 v240;
  uint64_t v241;
  int v242;
  char v243;
  __int128 v244;
  __int128 v245;
  uint64_t v246;
  _BYTE v247[376];
  __n128 v248;
  __int128 v249;
  __n128 v250;
  __int128 v251;
  __n128 v252;
  uint64_t v253;
  uint64_t v254;
  _BYTE v255[728];
  __int128 v256;
  uint64_t v257;
  uint64_t v258;
  char v259;
  uint64_t v260;
  char v261;
  uint64_t v262;
  char v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  char v267;
  uint64_t v268;
  char v269;
  uint64_t v270;
  char v271;
  uint64_t v272;
  char v273;
  _BYTE v274[357];
  uint64_t v275;
  char v276;
  uint64_t v277;
  __int128 v278;
  uint64_t v279;
  int v280;
  char v281;
  __int128 v282;
  __int128 v283;
  uint64_t v284;
  _BYTE v285[376];
  __n128 v286;
  __int128 v287;
  __n128 v288;
  __int128 v289;
  __n128 v290;
  uint64_t v291;
  uint64_t v292;
  _BYTE v293[728];
  __int128 v294;
  uint64_t v295;
  uint64_t v296;
  char v297;
  uint64_t v298;
  char v299;
  uint64_t v300;
  char v301;
  uint64_t v302;
  uint64_t v303;
  int v304;
  char v305;
  uint64_t v306;
  char v307;
  uint64_t v308;
  char v309;
  uint64_t v310;
  char v311;
  _BYTE v312[320];
  _BYTE v313[296];
  int v314;
  __int128 v315;
  uint64_t v316;
  uint64_t v317;
  _QWORD v318[42];
  char v319;
  _QWORD v320[39];
  int v321;
  uint64_t v322;
  _BYTE v323[712];
  _BYTE v324[736];
  _QWORD v325[3];
  uint64_t v326;
  uint64_t v327;
  _QWORD v328[40];
  _BYTE v329[320];
  uint64_t v330[40];
  char v331;
  _DWORD v332[6];
  uint64_t v333;
  uint64_t v334;
  _QWORD v335[43];
  _QWORD v336[39];
  int v337;
  uint64_t v338;
  uint64_t v339;
  char v340;
  uint64_t v341;
  __int128 v342;
  uint64_t v343;
  int v344;
  char v345;
  __int128 v346;
  __int128 v347;
  uint64_t v348;
  _BYTE v349[360];
  __n128 v350[6];
  uint64_t v351;
  uint64_t v352;
  _BYTE v353[712];
  __int128 v354;
  __int128 v355;
  uint64_t v356;
  uint64_t v357;
  char v358;
  uint64_t v359;
  char v360;
  uint64_t v361;
  char v362;
  uint64_t v363;
  uint64_t v364;
  int v365;
  char v366;
  uint64_t v367;
  char v368;
  uint64_t v369;
  char v370;
  uint64_t v371;
  char v372;
  _BYTE v373[360];
  _BYTE v374[712];
  uint64_t v375;
  char v376;
  uint64_t v377;
  __int128 v378;
  uint64_t v379;
  int v380;
  char v381;
  __int128 v382;
  __int128 v383;
  uint64_t v384;
  _BYTE v385[376];
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  _QWORD v392[90];
  __int128 v393;
  __int128 v394;
  uint64_t v395;
  char v396;
  uint64_t v397;
  char v398;
  uint64_t v399;
  char v400;
  __int128 v401;
  int v402;
  char v403;
  uint64_t v404;
  char v405;
  uint64_t v406;
  char v407;
  uint64_t v408;
  char v409;
  _BYTE v410[320];
  _BYTE v411[296];
  int v412;
  uint64_t v413;
  unint64_t v414;
  uint64_t v415;
  unint64_t v416;
  _QWORD v417[43];
  _QWORD v418[39];
  int v419;
  void *v420;

  v6 = MEMORY[0x24BDAC7A8](a1);
  v7 = v1;
  v9 = v8;
  v166 = v10;
  v170 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WiFiRecord?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1_0();
  v167 = v13 - v12;
  v14 = (uint64_t *)type metadata accessor for WiFiRecord(0);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1_0();
  v18 = (int64x2_t *)(v17 - v16);
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v19, (uint64_t)static Logger.siriNetwork);
  v20 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_61(v20))
  {
    v21 = (_WORD *)OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_98_1(v21);
    OUTLINED_FUNCTION_8_0(&dword_246EC7000, v1, (os_log_type_t)v4, "Background Connection - Provider: Get Connection Metrics.", v2);
    OUTLINED_FUNCTION_0_4();
  }

  if (v1[154].isa == (Class)-1)
  {
    __break(1u);
  }
  else
  {
    v164 = (uint64_t)v14;
    v153 = v9;
    v14 = &v375;
    v3 = v328;
    OUTLINED_FUNCTION_211();
    v1[154].isa = v22;
    _s11SiriNetwork27ConnectionPreparationReportVSgWOi0_(v373);
    _s11SiriNetwork24ConnectionSnapshotReportVSgWOi0_(v374);
    LOBYTE(v1) = 1;
    v376 = 1;
    v5 = MEMORY[0x24BEE4AF8];
    v375 = 0;
    v377 = MEMORY[0x24BEE4AF8];
    v378 = 0u;
    v379 = MEMORY[0x24BEE4AF8];
    v380 = 0;
    v381 = 1;
    v382 = 0u;
    v383 = 0u;
    v384 = 0;
    _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v373, (uint64_t)v385, &demangling cache variable for type metadata for ConnectionPreparationReport?);
    *(_OWORD *)&v385[360] = 0u;
    v386 = 0u;
    v387 = 0u;
    v388 = 0u;
    v389 = 0u;
    v390 = 0u;
    v391 = 0u;
    _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v374, (uint64_t)v392, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
    v392[89] = v5;
    v393 = 0u;
    v394 = 0u;
    v395 = 0;
    v396 = 1;
    v397 = 0;
    v398 = 1;
    v399 = 0;
    v400 = 1;
    v401 = 0u;
    v402 = 0;
    v403 = 1;
    v404 = 0;
    v405 = 1;
    v406 = 0;
    v407 = 1;
    v408 = 0;
    v409 = 1;
    OUTLINED_FUNCTION_22_1(&v339, &v375);
    _s11SiriNetwork010ConnectionB6ReportVSgWOi0_(v410);
    _s11SiriNetwork25ConnectionInterfaceReportVSgWOi0_(v411);
    if (one-time initialization token for sharedNetworkAnalytics == -1)
      goto LABEL_7;
  }
  swift_once();
LABEL_7:
  v23 = (void *)static NetworkAnalytics.sharedNetworkAnalytics;
  v412 = 0;
  v413 = 0;
  v414 = 0xE000000000000000;
  v415 = 0;
  v416 = 0xE000000000000000;
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v410, (uint64_t)v417, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v417[41] = 0;
  v417[40] = 0;
  *((_BYTE *)v14 + 2432) = (_BYTE)v1;
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v411, (uint64_t)v418, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v418[37] = v5;
  v418[38] = v5;
  v419 = 4;
  v420 = v23;
  OUTLINED_FUNCTION_33_2(v332, &v412);
  *(_BYTE *)(v4 + 95) = (_BYTE)v1;
  *(_BYTE *)(v4 + 91) = (_BYTE)v1;
  *(_BYTE *)(v4 + 87) = (_BYTE)v1;
  *(_BYTE *)(v4 + 79) = (_BYTE)v1;
  *(_BYTE *)(v4 + 71) = (_BYTE)v1;
  *(_BYTE *)(v4 + 63) = (_BYTE)v1;
  *(_BYTE *)(v4 + 55) = (_BYTE)v1;
  *(_BYTE *)(v4 + 47) = (_BYTE)v1;
  *(_BYTE *)(v4 + 39) = (_BYTE)v1;
  *(_BYTE *)(v4 + 31) = (_BYTE)v1;
  *(_BYTE *)(v4 + 23) = (_BYTE)v1;
  *(_BYTE *)(v4 + 15) = (_BYTE)v1;
  *(_BYTE *)(v4 + 7) = (_BYTE)v1;
  v24 = 0.0;
  v25 = *(double *)&v7[151].isa;
  v26 = *(double *)&v7[149].isa;
  v27 = 0.0;
  *((_BYTE *)v3 + 960) = (_BYTE)v1;
  if (v26 < v25)
  {
    v27 = v25 - v26;
    *(_BYTE *)(v4 + 31) = 0;
  }
  v28 = *(double *)&v7[152].isa;
  if (v26 < v28)
  {
    v24 = v28 - v26;
    *(_BYTE *)(v4 + 23) = 0;
  }
  isa = v7[153].isa;
  if ((unint64_t)isa >> 32)
    goto LABEL_35;
  v29 = (BOOL *)(v3 + 33);
  *(_BYTE *)(v4 + 99) = 0;
  v171 = v7;
  v30 = v7[143].isa;
  if (v30)
  {
    v31 = *(_QWORD *)&v30[OBJC_IVAR___SNNetworkManagerInternal_carrierName + 8];
    v175 = *(_QWORD *)&v30[OBJC_IVAR___SNNetworkManagerInternal_carrierName];
    v32 = v30[OBJC_IVAR___SNNetworkManagerInternal_lastSignalStrength + 8];
    v33 = 0.0;
    if ((v32 & 1) == 0)
    {
      v33 = (double)*(uint64_t *)&v30[OBJC_IVAR___SNNetworkManagerInternal_lastSignalStrength];
      *(_BYTE *)(v4 + 95) = 0;
    }
    v34 = *(void **)&v30[OBJC_IVAR___SNNetworkManagerInternal_networkWiFiManager];
    OUTLINED_FUNCTION_12_6();
    v35 = v34;
    v36 = v23;
    v37 = v30;
    NetworkWiFiManager.getWiFiRecord()(v167);

    if (__swift_getEnumTagSinglePayload(v167, 1, v164) == 1)
    {
      outlined destroy of RPCOspreyConnectionProtocol?(v167, &demangling cache variable for type metadata for WiFiRecord?);
      LOBYTE(v30) = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0uLL;
      v41 = 0.0;
      v42 = 1;
    }
    else
    {
      outlined init with take of WiFiRecord(v167, (uint64_t)v18);
      *(_BYTE *)(v4 + 7) = 0;
      v168 = vcvtq_f64_s64(*v18);
      *(_BYTE *)(v4 + 15) = 0;
      v41 = (double)v18[1].i64[0];
      *((_BYTE *)v3 + 960) = 0;
      LOBYTE(v30) = v18[3].i8[8];
      v45 = v18[2].i64[1];
      v38 = v18[3].i64[0];
      OUTLINED_FUNCTION_4_15();
      outlined destroy of WiFiRecord((uint64_t)v18);
      swift_bridgeObjectRelease();
      v40 = v168;
      v39 = v45;
      v42 = 0;
    }
    v44 = v175;
  }
  else
  {
    v43 = v23;
    v38 = 0;
    v39 = 0;
    v31 = 0;
    v44 = 0;
    v40 = 0uLL;
    v33 = 0.0;
    v42 = 1;
    v41 = 0.0;
    v32 = 1;
  }
  LODWORD(v328[0]) = (_DWORD)isa;
  BYTE4(v328[0]) = 0;
  v328[1] = v44;
  v328[2] = v31;
  *(double *)&v328[3] = v33;
  LOBYTE(v328[4]) = v32;
  v161 = v39;
  v162 = v38;
  v328[5] = v39;
  v328[6] = v38;
  *(_OWORD *)(v3 + 7) = 0u;
  *(_OWORD *)(v3 + 9) = 0u;
  *((_BYTE *)v3 + 92) = 1;
  LODWORD(v328[11]) = 0;
  LODWORD(v328[12]) = 0;
  *((_BYTE *)v3 + 100) = 1;
  v328[13] = MEMORY[0x24BEE4B00];
  memset(&v328[14], 0, 24);
  *((_BYTE *)v3 + 136) = 1;
  *((_BYTE *)v3 + 152) = 1;
  v328[18] = 0;
  v328[20] = 0;
  *((_BYTE *)v3 + 168) = 1;
  *((_BYTE *)v3 + 184) = 1;
  v328[22] = 0;
  v328[24] = 0;
  *((_BYTE *)v3 + 200) = 1;
  *((_BYTE *)v3 + 216) = 1;
  v328[26] = 0;
  v328[28] = 0;
  v328[29] = 0;
  *((_BYTE *)v3 + 248) = v26 >= v25;
  *(double *)&v328[30] = v27;
  *(double *)&v328[32] = v24;
  *v29 = v26 >= v28;
  *((_BYTE *)v3 + 265) = (_BYTE)v30;
  v46 = v40.f64[0];
  v29[16] = v42;
  v328[36] = *(_QWORD *)&v40.f64[1];
  v29[32] = v42;
  v169 = v40.f64[1];
  v328[34] = *(_QWORD *)&v40.f64[0];
  *(double *)&v328[38] = v41;
  v29[48] = v42;
  memcpy(v329, v328, 0x139uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v329);
  OUTLINED_FUNCTION_42_2((uint64_t)v335, (uint64_t)v330);
  outlined retain of ConnectionNetworkReport((uint64_t)v328);
  outlined release of ConnectionNetworkReport?(v330);
  OUTLINED_FUNCTION_42_2((uint64_t)v329, (uint64_t)v335);
  v47 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_66_2(v47, (uint64_t)v325, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  v48 = v326;
  v165 = v31;
  v176 = v44;
  v163 = (char)v30;
  v160 = v46;
  if (v326)
  {
    v49 = v327;
    __swift_project_boxed_opaque_existential_1(v325, v326);
    v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49);
  }
  else
  {
    v50 = 0;
  }
  outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v325, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  v51 = ConnectionPingInfoReport.init(pingInfo:)(v50);
  v53 = v52;
  v335[40] = v51;
  v335[41] = v52;
  v55 = v54 & 1;
  *(_BYTE *)(v4 + 479) = v54 & 1;
  v56 = v332[0];
  v154 = *(_OWORD *)(v4 + 111);
  v157 = v333;
  v57 = v334;
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v335, (uint64_t)v312, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v336, (uint64_t)v313, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v58 = v336[37];
  v59 = v336[38];
  v60 = v337;
  v61 = v338;
  v314 = v56;
  v315 = v154;
  v316 = v157;
  v317 = v57;
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v312, (uint64_t)v318, (uint64_t *)&demangling cache variable for type metadata for ConnectionNetworkReport?);
  v318[40] = v51;
  v318[41] = v53;
  v319 = v55;
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v313, (uint64_t)v320, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  v320[37] = v58;
  v320[38] = v59;
  v321 = v60;
  v322 = v61;
  OUTLINED_FUNCTION_33_2(v323, &v314);
  destructiveProjectEnumData for ConnectionConfigurationError(v323);
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v353, (uint64_t)v324, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  outlined retain of ConnectionSnapshotReport((uint64_t)&v314);
  outlined release of ConnectionSnapshotReport?((uint64_t)v324);
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v323, (uint64_t)v353, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_44_1();
  v341 = v170;
  v62 = v171[154].isa;
  if ((unint64_t)v62 >> 32)
  {
LABEL_35:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v344 = (int)v171[154].isa;
    v345 = 0;
    v63 = v171[135].isa;
    OUTLINED_FUNCTION_211();
    if (v63
      && (v64 = v171[136].isa,
          v65 = OUTLINED_FUNCTION_131_0(),
          v66 = (void (*)(uint64_t, Class))*((_QWORD *)v64 + 65),
          OUTLINED_FUNCTION_78_1(),
          v66(v65, v64),
          OUTLINED_FUNCTION_5_16(),
          v171[135].isa))
    {
      v172 = v171[136].isa;
      v67 = v340;
      v101 = v342;
      v68 = v339;
      v100 = v343;
      v117 = v347;
      v119 = v346;
      v115 = v348;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v349, (uint64_t)v274, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v109 = OUTLINED_FUNCTION_230_0(v350);
      v111 = v69;
      v105 = OUTLINED_FUNCTION_227_0(v70);
      v107 = v71;
      v102 = OUTLINED_FUNCTION_226(v72);
      v103 = v73;
      v74 = v351;
      v113 = v352;
      v155 = v355;
      v158 = v354;
      v149 = v357;
      v151 = v356;
      v147 = v358;
      v145 = v359;
      v143 = v360;
      v141 = v361;
      v139 = v362;
      v135 = v364;
      v137 = v363;
      v133 = v365;
      v131 = v366;
      v129 = v367;
      v127 = v368;
      v125 = v369;
      v123 = v370;
      v121 = v371;
      v75 = v372;
      v275 = v68;
      v276 = v67;
      v278 = v101;
      v277 = v170;
      v279 = v100;
      v280 = (int)v62;
      v281 = 0;
      v282 = v119;
      v283 = v117;
      v284 = v115;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v274, (uint64_t)v285, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      *(_OWORD *)&v285[360] = v111;
      v286 = v109;
      v287 = v107;
      v288 = v105;
      v289 = v103;
      v290 = v102;
      v291 = v74;
      v292 = v113;
      OUTLINED_FUNCTION_252(v76, (uint64_t)v293, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      *(_OWORD *)&v293[712] = v158;
      v294 = v155;
      v295 = v151;
      v296 = v149;
      v297 = v147;
      v298 = v145;
      v299 = v143;
      v300 = v141;
      v301 = v139;
      v302 = v137;
      v303 = v135;
      v304 = v133;
      v305 = v131;
      v306 = v129;
      v307 = v127;
      v308 = v125;
      v309 = v123;
      v310 = v121;
      v311 = v75;
      OUTLINED_FUNCTION_22_1(&v237, &v275);
      if (v166)
      {
        v77 = OUTLINED_FUNCTION_6();
        v58 = v153;
        *(_QWORD *)(v77 + 16) = v166;
        *(_QWORD *)(v77 + 24) = v153;
        v78 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ();
      }
      else
      {
        v78 = 0;
        v77 = 0;
        v58 = v153;
      }
      v90 = OUTLINED_FUNCTION_131_0();
      v91 = (void (*)(uint64_t *, uint64_t (*)(uint64_t), uint64_t, uint64_t, Class))*((_QWORD *)v172 + 66);
      OUTLINED_FUNCTION_78_1();
      outlined retain of ConnectionMetrics((uint64_t)&v275);
      outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?((uint64_t)v166);
      v91(&v237, v78, v77, v90, v172);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v78);
      OUTLINED_FUNCTION_5_16();
      OUTLINED_FUNCTION_22_1(&v177, &v237);
      outlined release of ConnectionMetrics((uint64_t)&v177);
      OUTLINED_FUNCTION_211();
    }
    else if (v166)
    {
      v79 = v340;
      v104 = v342;
      v58 = v339;
      v80 = v343;
      v122 = v347;
      v124 = v346;
      v120 = v348;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v349, (uint64_t)v274, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v114 = OUTLINED_FUNCTION_230_0(v350);
      v116 = v81;
      v110 = OUTLINED_FUNCTION_227_0(v82);
      v112 = v83;
      v106 = OUTLINED_FUNCTION_226(v84);
      v108 = v85;
      v86 = v351;
      v118 = v352;
      v173 = v354;
      v159 = v355;
      v87 = v356;
      v156 = v357;
      v152 = v358;
      v150 = v359;
      v148 = v360;
      v146 = v361;
      v144 = v362;
      v140 = v364;
      v142 = v363;
      v138 = v365;
      v136 = v366;
      v134 = v367;
      v132 = v368;
      v130 = v369;
      v128 = v370;
      v126 = v371;
      v88 = v372;
      v237 = v58;
      OUTLINED_FUNCTION_211();
      v238 = v79;
      v240 = v104;
      v239 = v170;
      v241 = v80;
      v242 = (int)v62;
      v243 = 0;
      v244 = v124;
      v245 = v122;
      v246 = v120;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v274, (uint64_t)v247, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      *(_OWORD *)&v247[360] = v116;
      v248 = v114;
      v249 = v112;
      v250 = v110;
      v251 = v108;
      v252 = v106;
      v253 = v86;
      v254 = v118;
      OUTLINED_FUNCTION_252(v89, (uint64_t)v255, (uint64_t *)&demangling cache variable for type metadata for ConnectionSnapshotReport?);
      *(_OWORD *)&v255[712] = v173;
      v256 = v159;
      v257 = v87;
      v258 = v156;
      v259 = v152;
      v260 = v150;
      v261 = v148;
      v262 = v146;
      v263 = v144;
      v264 = v142;
      v265 = v140;
      v266 = v138;
      v267 = v136;
      v268 = v134;
      v269 = v132;
      v270 = v130;
      v271 = v128;
      v272 = v126;
      v273 = v88;
      OUTLINED_FUNCTION_22_1(&v275, &v237);
      destructiveProjectEnumData for ConnectionConfigurationError(&v275);
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)&v275, (uint64_t)&v177, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
      outlined retain of ConnectionMetrics((uint64_t)&v237);
      v166(&v177);
      outlined release of ConnectionMetrics((uint64_t)&v237);
    }
    v177 = (int)isa;
    v178 = *(_BYTE *)(v58 + 99);
    v179 = *(_WORD *)(v58 + 96);
    v180 = *(_BYTE *)(v58 + 98);
    v181 = v176;
    v182 = v165;
    v183 = v33;
    v184 = *(_BYTE *)(v58 + 95);
    *(_DWORD *)v185 = *(_DWORD *)v274;
    *(_DWORD *)&v185[3] = *(_DWORD *)&v274[3];
    v186 = v161;
    v187 = v162;
    v190 = 0;
    v189 = 0u;
    v188 = 0u;
    v191 = *(_BYTE *)(v58 + 91);
    v192 = *(_WORD *)(v58 + 88);
    v193 = *(_BYTE *)(v58 + 90);
    v194 = 0;
    v195 = *(_BYTE *)(v58 + 87);
    v196 = *(_WORD *)(v58 + 84);
    v197 = *(_BYTE *)(v58 + 86);
    v198 = MEMORY[0x24BEE4B00];
    v199 = 0;
    v200 = 0;
    v201 = 0;
    v202 = *(_BYTE *)(v58 + 79);
    *(_DWORD *)&v203[3] = *(_DWORD *)(v58 + 75);
    *(_DWORD *)v203 = *(_DWORD *)(v58 + 72);
    v204 = 0;
    v205 = *(_BYTE *)(v58 + 71);
    *(_DWORD *)&v206[3] = *(_DWORD *)(v58 + 67);
    *(_DWORD *)v206 = *(_DWORD *)(v58 + 64);
    v207 = 0;
    v208 = *(_BYTE *)(v58 + 63);
    *(_DWORD *)v209 = *(_DWORD *)(v58 + 56);
    *(_DWORD *)&v209[3] = *(_DWORD *)(v58 + 59);
    v210 = 0;
    v211 = *(_BYTE *)(v58 + 55);
    v92 = *(_DWORD *)(v58 + 48);
    *(_DWORD *)&v212[3] = *(_DWORD *)(v58 + 51);
    *(_DWORD *)v212 = v92;
    v213 = 0;
    v214 = *(_BYTE *)(v58 + 47);
    v93 = *(_DWORD *)(v58 + 40);
    *(_DWORD *)&v215[3] = *(_DWORD *)(v58 + 43);
    *(_DWORD *)v215 = v93;
    v216 = 0;
    v217 = *(_BYTE *)(v58 + 39);
    v94 = *(_DWORD *)(v58 + 32);
    *(_DWORD *)&v218[3] = *(_DWORD *)(v58 + 35);
    *(_DWORD *)v218 = v94;
    v220 = 0;
    v219 = 0;
    v221 = v27;
    v222 = *(_BYTE *)(v58 + 31);
    v95 = *(_DWORD *)(v58 + 24);
    *(_DWORD *)&v223[3] = *(_DWORD *)(v58 + 27);
    *(_DWORD *)v223 = v95;
    v224 = v24;
    v225 = *(_BYTE *)(v58 + 23);
    v226 = v163;
    v96 = *(_WORD *)(v58 + 21);
    v227 = *(_DWORD *)(v58 + 17);
    v228 = v96;
    v229 = v160;
    v230 = *(_BYTE *)(v58 + 15);
    v97 = *(_DWORD *)(v58 + 11);
    *(_DWORD *)v231 = *(_DWORD *)(v58 + 8);
    *(_DWORD *)&v231[3] = v97;
    v232 = v169;
    v233 = *(_BYTE *)(v58 + 7);
    v98 = *(_DWORD *)(v58 + 3);
    *(_DWORD *)v234 = *(_DWORD *)v58;
    *(_DWORD *)&v234[3] = v98;
    v235 = v41;
    v236 = v331;
    outlined release of ConnectionNetworkReport((uint64_t)&v177);
    OUTLINED_FUNCTION_33_2(&v237, v332);
    outlined release of ConnectionSnapshotReport((uint64_t)&v237);
    OUTLINED_FUNCTION_22_1(&v275, &v339);
    return outlined release of ConnectionMetrics((uint64_t)&v275);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(uint64_t a1)
{
  const void *v1;
  void (*v2)(_BYTE *);
  void (*v3)(_BYTE *);
  const void *v4;
  _BYTE v6[1440];
  _BYTE __dst[1440];
  _BYTE v8[1440];

  v1 = (const void *)MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  memcpy(__dst, v1, 0x599uLL);
  memcpy(v8, v4, 0x599uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v8);
  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v8, (uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
  outlined retain of ConnectionMetrics((uint64_t)__dst);
  v3(v6);
  return outlined release of ConnectionMetrics((uint64_t)__dst);
}

Swift::Void __swiftcall BackgroundConnection.probeConnection()()
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
  _BYTE v23[24];
  uint64_t v24;

  OUTLINED_FUNCTION_48();
  outlined init with copy of NetworkConnectionProtocol?(v0 + 1096, (uint64_t)v23, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v24)
  {
    v8 = OUTLINED_FUNCTION_56_3(v1);
    OUTLINED_FUNCTION_112_0(v8, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v9, v10, v11, v12, v13, v14, v18, v19, v20);
    v15 = v21;
    v16 = v22;
    __swift_project_boxed_opaque_existential_1(&v19, v21);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 160))(v15, v16);
    OUTLINED_FUNCTION_184_0(v17);
  }
  else
  {
    OUTLINED_FUNCTION_112_0(v1, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v2, v3, v4, v5, v6, v7, v18, v19, v20);
  }
  OUTLINED_FUNCTION_180_2();
}

void specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  Swift::Int v8;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _DWORD *v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  double v31;
  double v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  int v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)();
  uint64_t v69;
  uint64_t v70;
  int v71;
  void *__src;
  uint64_t v73;
  id v74;
  _QWORD *v75;
  int v76;
  _QWORD v77[65];
  uint64_t v78;
  _QWORD __dst[67];

  __dst[65] = *MEMORY[0x24BDAC8D0];
  v8 = *(unsigned __int8 *)(a2 + 1136);
  __src = (void *)(a2 + 40);
  memcpy(__dst, (const void *)(a2 + 40), 0x204uLL);
  v73 = a3;
  swift_retain();
  v9 = a4;
  ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, v8);
  v11 = v10;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.siriNetwork);
  swift_retain_n();
  v13 = a1;
  swift_retain();
  v14 = a1;
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.default.getter();
  v74 = a1;
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    __dst[0] = swift_slowAlloc();
    *v17 = 136315650;
    __asm { BR              X10 }
  }
  swift_release_n();

  swift_release();
  v18 = 0.0;
  if (!(_BYTE)v11)
  {
    if (*(_BYTE *)(a2 + 1136) == 1 && *(_BYTE *)(a2 + 139) == 1)
    {
      v19 = a1;
      if (*(_BYTE *)(a2 + 138) == 1)
      {
        v20 = a1;
        v21 = a1;
        v22 = Logger.logObject.getter();
        v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = a4;
          v25 = (uint8_t *)swift_slowAlloc();
          v26 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v25 = 138412290;
          if (v74)
          {
            v27 = v74;
            v28 = _swift_stdlib_bridgeErrorToNSError();
            __dst[0] = v28;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
          }
          else
          {
            __dst[0] = 0;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            v28 = 0;
          }
          *v26 = v28;

          _os_log_impl(&dword_246EC7000, v22, v23, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v25, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x24956E018](v26, -1, -1);
          MEMORY[0x24956E018](v25, -1, -1);
          a4 = v24;
        }
        else
        {

        }
        memcpy(__dst, __src, 0x204uLL);
        ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)__dst, 0);
        v11 = v36;
        *(_BYTE *)(a2 + 138) = 0;
        goto LABEL_27;
      }
      v11 = 0;
      if (!AFHasCellularData() || !a1)
        goto LABEL_27;
      swift_getErrorValue();
      v29 = a1;
      if (!Error.sn_isNetworkDown()())
      {

        v11 = 0;
        goto LABEL_27;
      }
      v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
      objc_msgSend(v30, sel_systemUptime);
      v32 = v31;

      if (v32 - *(double *)(a2 + 1192) <= 30.0)
      {
        v37 = a1;
        v38 = a1;
        v39 = Logger.logObject.getter();
        v40 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = (uint8_t *)swift_slowAlloc();
          v75 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v41 = 138412290;
          v42 = v74;
          v43 = _swift_stdlib_bridgeErrorToNSError();
          __dst[0] = v43;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *v75 = v43;

          _os_log_impl(&dword_246EC7000, v39, v40, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.", v41, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x24956E018](v75, -1, -1);
          MEMORY[0x24956E018](v41, -1, -1);
        }
        else
        {

        }
        memcpy(__dst, __src, 0x204uLL);
        memcpy(v77, __src, 0x204uLL);
        outlined retain of ConnectionConfiguration(__dst);
        ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)v77, 0);
        v11 = v71;

        outlined release of ConnectionConfiguration(__dst);
        v18 = 1.0;
        goto LABEL_27;
      }
      v33 = Logger.logObject.getter();
      v34 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_246EC7000, v33, v34, "Background Connection - Fallback: Ran out of time waiting for network to become available.", v35, 2u);
        MEMORY[0x24956E018](v35, -1, -1);

      }
      else
      {

      }
    }
    v11 = 0;
  }
LABEL_27:
  swift_beginAccess();
  outlined init with copy of NetworkConnectionProtocol?(a2 + 1096, (uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  v44 = __dst[3];
  v76 = v11;
  if (__dst[3])
  {
    v45 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 16))(v44, v45);
    v48 = v47;
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v48 >> 60 != 15)
    {
      outlined consume of Data?(v46, v48);
      if ((_BYTE)v11)
      {
        BackgroundConnection.canFallBackFromError(_:)((uint64_t)v74);
        v50 = v49;
        goto LABEL_33;
      }
    }
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  v50 = 0;
LABEL_33:
  swift_retain_n();
  v51 = Logger.logObject.getter();
  v52 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v51, v52))
  {

    swift_release_n();
    goto LABEL_42;
  }
  v53 = swift_slowAlloc();
  v54 = swift_slowAlloc();
  v78 = v54;
  *(_DWORD *)v53 = 67109378;
  LODWORD(__dst[0]) = v50 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v53 + 8) = 2080;
  outlined init with copy of NetworkConnectionProtocol?(a2 + 1096, (uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  v55 = __dst[3];
  if (__dst[3])
  {
    v56 = a4;
    v57 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 16))(v55, v57);
    v59 = v58;
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v59 >> 60 != 15)
    {
      __dst[0] = v55;
      __dst[1] = v59;
      v61 = String.init<A>(describing:)();
      v60 = v62;
      a4 = v56;
      goto LABEL_41;
    }
    a4 = v56;
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)__dst, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    v59 = 0xF000000000000000;
  }
  outlined consume of Data?(v55, v59);
  v60 = 0xE800000000000000;
  v61 = 0x6566617320746F4ELL;
LABEL_41:
  __dst[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v60, &v78);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_246EC7000, v51, v52, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s", (uint8_t *)v53, 0x12u);
  swift_arrayDestroy();
  MEMORY[0x24956E018](v54, -1, -1);
  MEMORY[0x24956E018](v53, -1, -1);

LABEL_42:
  if ((v50 & 1) != 0)
  {
    swift_retain();
    v63 = a4;
    specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v76, v74, a2, v73, a4, v18);
    swift_release();

  }
  else
  {
    v64 = Logger.logObject.getter();
    v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_246EC7000, v64, v65, "Background Connection - Fallback: No fallback available.", v66, 2u);
      MEMORY[0x24956E018](v66, -1, -1);
    }

    v68 = BackgroundConnection.communicationProtocol.modify();
    v69 = *(_QWORD *)(v67 + 24);
    if (v69)
    {
      v70 = *(_QWORD *)(v67 + 32);
      __swift_mutable_project_boxed_opaque_existential_1(v67, *(_QWORD *)(v67 + 24));
      (*(void (**)(_QWORD, unint64_t, uint64_t, uint64_t))(v70 + 24))(0, 0xF000000000000000, v69, v70);
    }
    ((void (*)(_QWORD *, _QWORD))v68)(__dst, 0);
    __dst[2] = 0;
    __dst[0] = 9;
    __dst[1] = 0;
    *(_OWORD *)&__dst[3] = xmmword_246F72F10;
    closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)((uint64_t)__dst, v73, a4);
    swift_release();

  }
  swift_release();

}

void specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)()
{
  void *v0;
  os_log_type_t v1;
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  char v21;
  os_log_type_t v22;
  _WORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  void *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
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
  NSObject *v51;
  os_log_type_t v52;
  _WORD *v53;
  uint64_t (*v54)();
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  os_log_type_t v67;
  uint8_t *v68;
  _QWORD *v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  unint64_t v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  const void *v81;
  uint64_t (*v82)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);
  uint64_t (*v83)(unint64_t *, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  os_log_type_t v86;
  uint8_t *v87;
  _QWORD v88[66];
  _QWORD v89[3];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  OUTLINED_FUNCTION_48_2();
  v92 = v4;
  v93 = v5;
  OUTLINED_FUNCTION_188_2();
  v91 = *MEMORY[0x24BDAC8D0];
  v6 = v2[1136];
  v81 = (const void *)(v7 + 40);
  OUTLINED_FUNCTION_28(v89, (const void *)(v7 + 40));
  v85 = (uint64_t)v0;
  v8 = OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_162_1(v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
  OUTLINED_FUNCTION_249();
  v10 = v9;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_5_1();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriNetwork);
  OUTLINED_FUNCTION_176_1();
  OUTLINED_FUNCTION_28_6();
  swift_retain();
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_107_0();
  v12 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_106((os_log_type_t)v12))
  {
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
    v89[0] = OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_91_2(4.8152e-34);
    __asm { BR              X10 }
  }
  OUTLINED_FUNCTION_219();
  OUTLINED_FUNCTION_10_20();
  OUTLINED_FUNCTION_10_20();

  OUTLINED_FUNCTION_34_0();
  if (v10 == OS_LOG_TYPE_DEFAULT)
  {
    if (v2[1136] == 1 && v2[139] == 1)
    {
      if (v2[138] == 1)
      {
        OUTLINED_FUNCTION_28_6();
        OUTLINED_FUNCTION_28_6();
        OUTLINED_FUNCTION_107_0();
        v14 = OUTLINED_FUNCTION_80();
        if (OUTLINED_FUNCTION_179_0(v14))
        {
          v15 = (uint8_t *)OUTLINED_FUNCTION_2_2();
          v16 = (_QWORD *)OUTLINED_FUNCTION_2_2();
          *(_DWORD *)v15 = 138412290;
          if (v3)
          {
            v17 = v3;
            v18 = _swift_stdlib_bridgeErrorToNSError();
            v89[0] = v18;
            OUTLINED_FUNCTION_32_2();
          }
          else
          {
            v89[0] = 0;
            OUTLINED_FUNCTION_32_2();
            v18 = 0;
          }
          *v16 = v18;
          OUTLINED_FUNCTION_174_2();
          OUTLINED_FUNCTION_174_2();
          OUTLINED_FUNCTION_30_0(&dword_246EC7000, v6, v1, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v15);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_0_4();
        }
        OUTLINED_FUNCTION_10_20();
        OUTLINED_FUNCTION_10_20();

        OUTLINED_FUNCTION_28(v89, v81);
        OUTLINED_FUNCTION_182_0((uint64_t)v89);
        v10 = v66;
        v2[138] = 0;
        goto LABEL_21;
      }
      v10 = OS_LOG_TYPE_DEFAULT;
      if (!AFHasCellularData() || !v3)
        goto LABEL_21;
      OUTLINED_FUNCTION_178_2();
      OUTLINED_FUNCTION_28_6();
      if (OUTLINED_FUNCTION_255())
      {
        v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
        -[NSObject systemUptime](v19, sel_systemUptime);

        OUTLINED_FUNCTION_235_0();
        if (!(!v21 & v20))
        {
          OUTLINED_FUNCTION_28_6();
          OUTLINED_FUNCTION_28_6();
          OUTLINED_FUNCTION_107_0();
          v67 = OUTLINED_FUNCTION_80();
          if (OUTLINED_FUNCTION_97_2(v19))
          {
            v68 = (uint8_t *)OUTLINED_FUNCTION_2_2();
            v69 = (_QWORD *)OUTLINED_FUNCTION_2_2();
            OUTLINED_FUNCTION_145_0((int)v69, v70, v71, v72, v73, v74, v75, v76, 5.7779e-34, v79, v80, (uint64_t)v81, (uint64_t)v82, (uint64_t)v83, v84, v85, v3);
            v77 = _swift_stdlib_bridgeErrorToNSError();
            OUTLINED_FUNCTION_54_2(v77);
            *v69 = v12;
            OUTLINED_FUNCTION_10_20();
            OUTLINED_FUNCTION_10_20();
            OUTLINED_FUNCTION_30_0(&dword_246EC7000, v19, v67, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.", v68);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            OUTLINED_FUNCTION_20_1();
            OUTLINED_FUNCTION_0_4();
          }
          OUTLINED_FUNCTION_10_20();
          OUTLINED_FUNCTION_10_20();

          OUTLINED_FUNCTION_28(v89, v81);
          OUTLINED_FUNCTION_28(v88, v81);
          outlined retain of ConnectionConfiguration(v89);
          OUTLINED_FUNCTION_182_0((uint64_t)v88);
          v10 = v78;
          OUTLINED_FUNCTION_10_20();
          outlined release of ConnectionConfiguration(v89);
          goto LABEL_21;
        }
        OUTLINED_FUNCTION_107_0();
        v22 = OUTLINED_FUNCTION_80();
        if (OUTLINED_FUNCTION_9_13(v22))
        {
          v23 = (_WORD *)OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_98_1(v23);
          OUTLINED_FUNCTION_8_0(&dword_246EC7000, v19, v86, "Background Connection - Fallback: Ran out of time waiting for network to become available.", v87);
          OUTLINED_FUNCTION_0_4();
        }
        OUTLINED_FUNCTION_10_20();

      }
      else
      {
        OUTLINED_FUNCTION_10_20();
      }
    }
    v10 = OS_LOG_TYPE_DEFAULT;
  }
LABEL_21:
  v24 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_62_3(v24, (uint64_t)v89, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v90)
  {
    v26 = OUTLINED_FUNCTION_135_2(v89);
    v28 = v27;
    OUTLINED_FUNCTION_70_3(v26, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    OUTLINED_FUNCTION_234_0();
    if (!(!v21 & v20))
    {
      outlined consume of Data?(v26, v28);
      if (v10)
      {
        OUTLINED_FUNCTION_241();
        v30 = v29;
        goto LABEL_27;
      }
    }
  }
  else
  {
    OUTLINED_FUNCTION_70_3(v25, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  v30 = 0;
LABEL_27:
  OUTLINED_FUNCTION_59_0();
  v31 = (void *)OUTLINED_FUNCTION_107_0();
  v32 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_187_1(v32))
  {
    v33 = OUTLINED_FUNCTION_2_2();
    v88[65] = OUTLINED_FUNCTION_2_2();
    v34 = OUTLINED_FUNCTION_53_3(1.5047e-36);
    *(_WORD *)(v33 + 8) = 2080;
    OUTLINED_FUNCTION_62_3(v34, (uint64_t)v89, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v90)
    {
      v36 = OUTLINED_FUNCTION_125_2(v89);
      v38 = v37;
      OUTLINED_FUNCTION_70_3(v36, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      OUTLINED_FUNCTION_234_0();
      if (!(!v21 & v20))
      {
        v89[0] = v36;
        v89[1] = v38;
        String.init<A>(describing:)();
        OUTLINED_FUNCTION_231();
        goto LABEL_35;
      }
      OUTLINED_FUNCTION_231();
    }
    else
    {
      OUTLINED_FUNCTION_70_3(v35, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    }
    v39 = OUTLINED_FUNCTION_144_1();
LABEL_35:
    v40 = OUTLINED_FUNCTION_172_1(v39);
    OUTLINED_FUNCTION_86_4(v40);
    OUTLINED_FUNCTION_20_13();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_166_2(&dword_246EC7000, v41, v10, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s");
    OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_0_4();
  }

  OUTLINED_FUNCTION_20_13();
  if ((v30 & 1) != 0)
  {
    v42 = OUTLINED_FUNCTION_16_2();
    OUTLINED_FUNCTION_162_1(v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    OUTLINED_FUNCTION_68_0(v43, v44, v45, v46, v47, v48, v49, v50, v79, v80, (uint64_t)v81, v82);
  }
  else
  {
    v51 = OUTLINED_FUNCTION_107_0();
    v52 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_13(v52))
    {
      v53 = (_WORD *)OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_98_1(v53);
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v51, v10, "Background Connection - Fallback: No fallback available.", v2 + 1096);
      OUTLINED_FUNCTION_0_4();
    }

    v54 = OUTLINED_FUNCTION_250();
    if (*(_QWORD *)(v55 + 24))
    {
      OUTLINED_FUNCTION_171_2((uint64_t)v54, v55);
      OUTLINED_FUNCTION_88_3();
    }
    OUTLINED_FUNCTION_248();
    OUTLINED_FUNCTION_224();
    OUTLINED_FUNCTION_67_3((__n128)xmmword_246F72F10, v56, v57, v58, v59, v60, v61, v62, v63, v79, v80, (uint64_t)v81, (uint64_t)v82, v83, v84, v85);
  }
  v64 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_162_1(v64, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
  v65 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_162_1(v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
  OUTLINED_FUNCTION_63_2();
}

{
  void *v0;
  os_log_type_t v1;
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  os_log_type_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  char v21;
  os_log_type_t v22;
  _WORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  void *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _WORD *v52;
  uint64_t (*v53)();
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  os_log_type_t v63;
  os_log_type_t v64;
  uint8_t *v65;
  _QWORD *v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  unint64_t v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  const void *v78;
  uint64_t (*v79)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);
  uint64_t (*v80)(unint64_t *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  os_log_type_t v83;
  uint8_t *v84;
  _QWORD v85[66];
  _QWORD v86[3];
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  OUTLINED_FUNCTION_48_2();
  v89 = v5;
  v90 = v6;
  OUTLINED_FUNCTION_188_2();
  v88 = *MEMORY[0x24BDAC8D0];
  v7 = v2[1136];
  v78 = (const void *)(v8 + 40);
  OUTLINED_FUNCTION_28(v86, (const void *)(v8 + 40));
  v82 = (uint64_t)v0;
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_103_3();
  OUTLINED_FUNCTION_249();
  v10 = v9;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_5_1();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriNetwork);
  OUTLINED_FUNCTION_176_1();
  OUTLINED_FUNCTION_28_6();
  swift_retain();
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_107_0();
  v12 = OUTLINED_FUNCTION_35_0();
  if (OUTLINED_FUNCTION_106((os_log_type_t)v12))
  {
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
    v86[0] = OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_91_2(4.8152e-34);
    __asm { BR              X10 }
  }
  OUTLINED_FUNCTION_219();
  OUTLINED_FUNCTION_10_20();
  OUTLINED_FUNCTION_10_20();

  OUTLINED_FUNCTION_34_0();
  if (v10 == OS_LOG_TYPE_DEFAULT)
  {
    if (v2[1136] == 1 && v2[139] == 1)
    {
      if (v2[138] == 1)
      {
        OUTLINED_FUNCTION_28_6();
        OUTLINED_FUNCTION_28_6();
        OUTLINED_FUNCTION_107_0();
        v14 = OUTLINED_FUNCTION_80();
        if (OUTLINED_FUNCTION_179_0(v14))
        {
          v15 = (uint8_t *)OUTLINED_FUNCTION_2_2();
          v16 = (_QWORD *)OUTLINED_FUNCTION_2_2();
          *(_DWORD *)v15 = 138412290;
          if (v3)
          {
            v17 = v3;
            v18 = _swift_stdlib_bridgeErrorToNSError();
            v86[0] = v18;
            OUTLINED_FUNCTION_32_2();
          }
          else
          {
            v86[0] = 0;
            OUTLINED_FUNCTION_32_2();
            v18 = 0;
          }
          *v16 = v18;
          OUTLINED_FUNCTION_174_2();
          OUTLINED_FUNCTION_174_2();
          OUTLINED_FUNCTION_30_0(&dword_246EC7000, v7, v1, "Background Connection - Fallback: Resetting connection method on error (%@). Trying Peer now.", v15);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_0_4();
        }
        OUTLINED_FUNCTION_10_20();
        OUTLINED_FUNCTION_10_20();

        OUTLINED_FUNCTION_28(v86, v78);
        OUTLINED_FUNCTION_182_0((uint64_t)v86);
        v10 = v63;
        v2[138] = 0;
        goto LABEL_21;
      }
      v10 = OS_LOG_TYPE_DEFAULT;
      if (!AFHasCellularData() || !v3)
        goto LABEL_21;
      OUTLINED_FUNCTION_178_2();
      OUTLINED_FUNCTION_28_6();
      if (OUTLINED_FUNCTION_255())
      {
        v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
        -[NSObject systemUptime](v19, sel_systemUptime);

        OUTLINED_FUNCTION_235_0();
        if (!(!v21 & v20))
        {
          OUTLINED_FUNCTION_28_6();
          OUTLINED_FUNCTION_28_6();
          OUTLINED_FUNCTION_107_0();
          v64 = OUTLINED_FUNCTION_80();
          if (OUTLINED_FUNCTION_97_2(v19))
          {
            v65 = (uint8_t *)OUTLINED_FUNCTION_2_2();
            v66 = (_QWORD *)OUTLINED_FUNCTION_2_2();
            OUTLINED_FUNCTION_145_0((int)v66, v67, v68, v69, v70, v71, v72, v73, 5.7779e-34, v76, v77, (uint64_t)v78, (uint64_t)v79, (uint64_t)v80, v81, v82, v3);
            v74 = _swift_stdlib_bridgeErrorToNSError();
            OUTLINED_FUNCTION_54_2(v74);
            *v66 = v12;
            OUTLINED_FUNCTION_10_20();
            OUTLINED_FUNCTION_10_20();
            OUTLINED_FUNCTION_30_0(&dword_246EC7000, v19, v64, "Background Connection - Fallback: Resetting connection method on error (%@) while waiting for cellular.", v65);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            OUTLINED_FUNCTION_20_1();
            OUTLINED_FUNCTION_0_4();
          }
          OUTLINED_FUNCTION_10_20();
          OUTLINED_FUNCTION_10_20();

          OUTLINED_FUNCTION_28(v86, v78);
          OUTLINED_FUNCTION_28(v85, v78);
          outlined retain of ConnectionConfiguration(v86);
          OUTLINED_FUNCTION_182_0((uint64_t)v85);
          v10 = v75;
          OUTLINED_FUNCTION_10_20();
          outlined release of ConnectionConfiguration(v86);
          goto LABEL_21;
        }
        OUTLINED_FUNCTION_107_0();
        v22 = OUTLINED_FUNCTION_80();
        if (OUTLINED_FUNCTION_9_13(v22))
        {
          v23 = (_WORD *)OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_98_1(v23);
          OUTLINED_FUNCTION_8_0(&dword_246EC7000, v19, v83, "Background Connection - Fallback: Ran out of time waiting for network to become available.", v84);
          OUTLINED_FUNCTION_0_4();
        }
        OUTLINED_FUNCTION_10_20();

      }
      else
      {
        OUTLINED_FUNCTION_10_20();
      }
    }
    v10 = OS_LOG_TYPE_DEFAULT;
  }
LABEL_21:
  v24 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_62_3(v24, (uint64_t)v86, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v87)
  {
    v26 = OUTLINED_FUNCTION_135_2(v86);
    v28 = v27;
    OUTLINED_FUNCTION_70_3(v26, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    OUTLINED_FUNCTION_234_0();
    if (!(!v21 & v20))
    {
      outlined consume of Data?(v26, v28);
      if (v10)
      {
        OUTLINED_FUNCTION_241();
        v30 = v29;
        goto LABEL_27;
      }
    }
  }
  else
  {
    OUTLINED_FUNCTION_70_3(v25, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  v30 = 0;
LABEL_27:
  OUTLINED_FUNCTION_59_0();
  v31 = (void *)OUTLINED_FUNCTION_107_0();
  v32 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_187_1(v32))
  {
    v33 = OUTLINED_FUNCTION_2_2();
    v85[65] = OUTLINED_FUNCTION_2_2();
    v34 = OUTLINED_FUNCTION_53_3(1.5047e-36);
    *(_WORD *)(v33 + 8) = 2080;
    OUTLINED_FUNCTION_62_3(v34, (uint64_t)v86, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v87)
    {
      v36 = OUTLINED_FUNCTION_125_2(v86);
      v38 = v37;
      OUTLINED_FUNCTION_70_3(v36, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      OUTLINED_FUNCTION_234_0();
      if (!(!v21 & v20))
      {
        v86[0] = v36;
        v86[1] = v38;
        String.init<A>(describing:)();
        OUTLINED_FUNCTION_231();
        goto LABEL_35;
      }
      OUTLINED_FUNCTION_231();
    }
    else
    {
      OUTLINED_FUNCTION_70_3(v35, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    }
    v39 = OUTLINED_FUNCTION_144_1();
LABEL_35:
    v40 = OUTLINED_FUNCTION_172_1(v39);
    OUTLINED_FUNCTION_86_4(v40);
    OUTLINED_FUNCTION_20_13();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_166_2(&dword_246EC7000, v41, v10, "Background Connection - Fallback: Can fallback %{BOOL}d. Buffer: %s");
    OUTLINED_FUNCTION_20_1();
    OUTLINED_FUNCTION_0_4();
  }

  OUTLINED_FUNCTION_20_13();
  if ((v30 & 1) != 0)
  {
    OUTLINED_FUNCTION_16_2();
    v42 = OUTLINED_FUNCTION_103_3();
    OUTLINED_FUNCTION_68_0((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49, v76, v77, (uint64_t)v78, v79);
  }
  else
  {
    v50 = OUTLINED_FUNCTION_107_0();
    v51 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_13(v51))
    {
      v52 = (_WORD *)OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_98_1(v52);
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v50, v10, "Background Connection - Fallback: No fallback available.", v2 + 1096);
      OUTLINED_FUNCTION_0_4();
    }

    v53 = OUTLINED_FUNCTION_250();
    if (*(_QWORD *)(v54 + 24))
    {
      OUTLINED_FUNCTION_171_2((uint64_t)v53, v54);
      OUTLINED_FUNCTION_88_3();
    }
    OUTLINED_FUNCTION_248();
    OUTLINED_FUNCTION_224();
    OUTLINED_FUNCTION_67_3((__n128)xmmword_246F72F10, v55, v56, v57, v58, v59, v60, v61, v62, v76, v77, (uint64_t)v78, (uint64_t)v79, v80, v81, v82);
  }
  OUTLINED_FUNCTION_14();

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_63_2();
}

void specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(int a1, void *a2, uint64_t a3, uint64_t a4, void *a5, double a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  char v26;
  Swift::Bool v27;
  Swift::Int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD aBlock[6];

  LODWORD(v56) = a1;
  v11 = type metadata accessor for DispatchWorkItemFlags();
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = type metadata accessor for DispatchQoS();
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v50 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = type metadata accessor for DispatchTime();
  v48 = *(_QWORD *)(v49 - 8);
  v14 = MEMORY[0x24BDAC7A8](v49);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v47 = (char *)&v46 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  *(_QWORD *)(v18 + 24) = a5;
  v57 = a4;
  swift_retain();
  v58 = a5;
  v19 = a5;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = v18;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    v25 = v24;
    v18 = v23;
    MEMORY[0x24956E018](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(_BYTE *)(a3 + 1136), *(_QWORD *)(a3 + 1152));
  if ((v26 & 1) != 0)
  {
    v27 = 0;
  }
  else if (a2)
  {
    v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    v29 = a2;
    specialized Set._Variant.insert(_:)(&v59, v28);
    swift_endAccess();
    swift_getErrorValue();
    v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));

  }
  else
  {
    v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  v30 = swift_allocObject();
  swift_weakInit();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v30;
  v32 = v56;
  *(_BYTE *)(v31 + 24) = v56;
  *(_BYTE *)(v31 + 25) = v27;
  *(_QWORD *)(v31 + 32) = partial apply for closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:);
  *(_QWORD *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    v43 = v32;
    swift_retain();
    v44 = v58;
    swift_retain();
    v45 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v45, v43);
    swift_release();
    swift_release();
  }
  else
  {
    v56 = v18;
    swift_retain();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v35 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_246EC7000, v33, v34, "Background Connection - Fallback: Delaying start %f.", v35, 0xCu);
      MEMORY[0x24956E018](v35, -1, -1);
    }

    v46 = *(_QWORD *)(a3 + 32);
    static DispatchTime.now()();
    v36 = v47;
    MEMORY[0x24956CFC8](v16, a6);
    v37 = *(void (**)(char *, uint64_t))(v48 + 8);
    v38 = v49;
    v37(v16, v49);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_23_0;
    v39 = _Block_copy(aBlock);
    swift_retain();
    v40 = v50;
    static DispatchQoS.unspecified.getter();
    v59 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v41 = v51;
    v42 = v55;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D22C](v36, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v40, v53);
    v37(v36, v38);
    swift_release();
  }
  swift_release();
  swift_release();

}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  char v26;
  Swift::Bool v27;
  Swift::Int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  SiriNetwork::ConnectionMethod v32;
  char v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  void *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  SiriNetwork::ConnectionMethod v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  _QWORD aBlock[6];

  LODWORD(v59) = a1;
  v11 = type metadata accessor for DispatchWorkItemFlags();
  v57 = *(_QWORD *)(v11 - 8);
  v58 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for DispatchQoS();
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for DispatchTime();
  v51 = *(_QWORD *)(v52 - 8);
  v14 = MEMORY[0x24BDAC7A8](v52);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v50 = (char *)&v49 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  *(_QWORD *)(v18 + 24) = a5;
  v60 = a4;
  swift_retain();
  v61 = a5;
  v19 = a5;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = v18;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    v25 = v24;
    v18 = v23;
    MEMORY[0x24956E018](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(_BYTE *)(a3 + 1136), *(_QWORD *)(a3 + 1152));
  if ((v26 & 1) != 0)
  {
    v27 = 0;
  }
  else if (a2)
  {
    v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    v29 = a2;
    specialized Set._Variant.insert(_:)(&v62, v28);
    swift_endAccess();
    swift_getErrorValue();
    v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));

  }
  else
  {
    v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  v30 = swift_allocObject();
  swift_weakInit();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v30;
  v32 = (char)v59;
  *(_BYTE *)(v31 + 24) = v59;
  v33 = v27;
  *(_BYTE *)(v31 + 25) = v33;
  *(_QWORD *)(v31 + 32) = partial apply for closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:);
  *(_QWORD *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    v44 = v60;
    v45 = v32;
    swift_retain();
    v46 = v61;
    v47 = v61;
    swift_retain();
    v48 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v48, v45, v33, v44, v46);
    swift_release();
    swift_release();
  }
  else
  {
    v59 = v18;
    swift_retain();
    v34 = Logger.logObject.getter();
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v36 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_246EC7000, v34, v35, "Background Connection - Fallback: Delaying start %f.", v36, 0xCu);
      MEMORY[0x24956E018](v36, -1, -1);
    }

    v49 = *(_QWORD *)(a3 + 32);
    static DispatchTime.now()();
    v37 = v50;
    MEMORY[0x24956CFC8](v16, a6);
    v38 = *(void (**)(char *, uint64_t))(v51 + 8);
    v39 = v52;
    v38(v16, v52);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_141;
    v40 = _Block_copy(aBlock);
    swift_retain();
    v41 = v53;
    static DispatchQoS.unspecified.getter();
    v62 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v42 = v54;
    v43 = v58;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D22C](v37, v41, v42, v40);
    _Block_release(v40);
    swift_release();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
    v38(v37, v39);
    swift_release();
  }
  swift_release();
  swift_release();

}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  char v26;
  Swift::Bool v27;
  Swift::Int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  void *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  _QWORD aBlock[6];

  LODWORD(v59) = a1;
  v11 = type metadata accessor for DispatchWorkItemFlags();
  v57 = *(_QWORD *)(v11 - 8);
  v58 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for DispatchQoS();
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for DispatchTime();
  v51 = *(_QWORD *)(v52 - 8);
  v14 = MEMORY[0x24BDAC7A8](v52);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v50 = (char *)&v49 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  *(_QWORD *)(v18 + 24) = a5;
  v60 = a4;
  swift_retain();
  v61 = a5;
  v19 = a5;
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
  v21 = Logger.logObject.getter();
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = v18;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v21, v22, "Background Connection - Fallback: Fallback after delay %f.", v24, 0xCu);
    v25 = v24;
    v18 = v23;
    MEMORY[0x24956E018](v25, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(_BYTE *)(a3 + 1136), *(_QWORD *)(a3 + 1152));
  if ((v26 & 1) != 0)
  {
    v27 = 0;
  }
  else if (a2)
  {
    v28 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    v29 = a2;
    specialized Set._Variant.insert(_:)(&v62, v28);
    swift_endAccess();
    swift_getErrorValue();
    v27 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));

  }
  else
  {
    v27 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  v30 = swift_allocObject();
  swift_weakInit();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v30;
  v32 = v59;
  *(_BYTE *)(v31 + 24) = v59;
  v33 = v27;
  *(_BYTE *)(v31 + 25) = v33;
  *(_QWORD *)(v31 + 32) = partial apply for closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider();
  *(_QWORD *)(v31 + 40) = v18;
  if (a6 <= 0.0)
  {
    v44 = v60;
    v45 = v32;
    swift_retain();
    v46 = v61;
    v47 = v61;
    swift_retain();
    v48 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v48, v45, v33, v44, v46);
    swift_release();
    swift_release();
  }
  else
  {
    v59 = v18;
    swift_retain();
    v34 = Logger.logObject.getter();
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v36 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_246EC7000, v34, v35, "Background Connection - Fallback: Delaying start %f.", v36, 0xCu);
      MEMORY[0x24956E018](v36, -1, -1);
    }

    v49 = *(_QWORD *)(a3 + 32);
    static DispatchTime.now()();
    v37 = v50;
    MEMORY[0x24956CFC8](v16, a6);
    v38 = *(void (**)(char *, uint64_t))(v51 + 8);
    v39 = v52;
    v38(v16, v52);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_58;
    v40 = _Block_copy(aBlock);
    swift_retain();
    v41 = v53;
    static DispatchQoS.unspecified.getter();
    v62 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v42 = v54;
    v43 = v58;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D22C](v37, v41, v42, v40);
    _Block_release(v40);
    swift_release();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
    v38(v37, v39);
    swift_release();
  }
  swift_release();
  swift_release();

}

void specialized BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(int a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5, double a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  char v25;
  Swift::Bool v26;
  Swift::Int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  NSObject *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD aBlock[6];

  LODWORD(v57) = a1;
  v11 = type metadata accessor for DispatchWorkItemFlags();
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for DispatchQoS();
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v51 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = type metadata accessor for DispatchTime();
  v49 = *(_QWORD *)(v50 - 8);
  v14 = MEMORY[0x24BDAC7A8](v50);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v48 = (char *)&v47 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  outlined init with take of NetworkConnectionError((uint64_t)a5, v18 + 24);
  v58 = a4;
  swift_retain();
  v59 = a5;
  outlined retain of NetworkConnectionError(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = v18;
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v20, v21, "Background Connection - Fallback: Fallback after delay %f.", v23, 0xCu);
    v24 = v23;
    v18 = v22;
    MEMORY[0x24956E018](v24, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(_BYTE *)(a3 + 1136), *(_QWORD *)(a3 + 1152));
  if ((v25 & 1) != 0)
  {
    v26 = 0;
  }
  else if (a2)
  {
    v27 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    v28 = a2;
    specialized Set._Variant.insert(_:)(&v60, v27);
    swift_endAccess();
    swift_getErrorValue();
    v26 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));

  }
  else
  {
    v26 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  v29 = swift_allocObject();
  swift_weakInit();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v29;
  v31 = v57;
  *(_BYTE *)(v30 + 24) = v57;
  v32 = v26;
  *(_BYTE *)(v30 + 25) = v32;
  *(_QWORD *)(v30 + 32) = partial apply for closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:);
  *(_QWORD *)(v30 + 40) = v18;
  if (a6 <= 0.0)
  {
    v43 = v58;
    v44 = v31;
    swift_retain();
    v45 = v59;
    outlined retain of NetworkConnectionError(v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    swift_retain();
    v46 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v46, v44, v32, v43, v45);
    swift_release();
    swift_release();
  }
  else
  {
    v57 = v18;
    swift_retain();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v35 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_246EC7000, v33, v34, "Background Connection - Fallback: Delaying start %f.", v35, 0xCu);
      MEMORY[0x24956E018](v35, -1, -1);
    }

    v47 = *(_QWORD *)(a3 + 32);
    static DispatchTime.now()();
    v36 = v48;
    MEMORY[0x24956CFC8](v16, a6);
    v37 = *(void (**)(char *, uint64_t))(v49 + 8);
    v38 = v50;
    v37(v16, v50);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_129_0;
    v39 = _Block_copy(aBlock);
    swift_retain();
    v40 = v51;
    static DispatchQoS.unspecified.getter();
    v60 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v41 = v52;
    v42 = v56;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D22C](v36, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v40, v54);
    v37(v36, v38);
    swift_release();
  }
  swift_release();
  swift_release();
  outlined retain of NetworkConnectionError(v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
}

{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  char v25;
  Swift::Bool v26;
  Swift::Int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  NSObject *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD aBlock[6];

  LODWORD(v57) = a1;
  v11 = type metadata accessor for DispatchWorkItemFlags();
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for DispatchQoS();
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v51 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = type metadata accessor for DispatchTime();
  v49 = *(_QWORD *)(v50 - 8);
  v14 = MEMORY[0x24BDAC7A8](v50);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v48 = (char *)&v47 - v17;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a4;
  outlined init with take of NetworkConnectionError((uint64_t)a5, v18 + 24);
  v58 = a4;
  swift_retain();
  v59 = a5;
  outlined retain of NetworkConnectionError(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = v18;
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    *(double *)aBlock = a6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v20, v21, "Background Connection - Fallback: Fallback after delay %f.", v23, 0xCu);
    v24 = v23;
    v18 = v22;
    MEMORY[0x24956E018](v24, -1, -1);
  }

  swift_beginAccess();
  specialized Set.contains(_:)(*(_BYTE *)(a3 + 1136), *(_QWORD *)(a3 + 1152));
  if ((v25 & 1) != 0)
  {
    v26 = 0;
  }
  else if (a2)
  {
    v27 = *(unsigned __int8 *)(a3 + 1136);
    swift_beginAccess();
    v28 = a2;
    specialized Set._Variant.insert(_:)(&v60, v27);
    swift_endAccess();
    swift_getErrorValue();
    v26 = Error.isFallbackConnectionMethodRetryable(for:)(*(SiriNetwork::ConnectionMethod *)(a3 + 1136));

  }
  else
  {
    v26 = 1;
  }
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(1);
  v29 = swift_allocObject();
  swift_weakInit();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v29;
  v31 = v57;
  *(_BYTE *)(v30 + 24) = v57;
  v32 = v26;
  *(_BYTE *)(v30 + 25) = v32;
  *(_QWORD *)(v30 + 32) = partial apply for closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider();
  *(_QWORD *)(v30 + 40) = v18;
  if (a6 <= 0.0)
  {
    v43 = v58;
    v44 = v31;
    swift_retain();
    v45 = v59;
    outlined retain of NetworkConnectionError(v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    swift_retain();
    v46 = swift_retain();
    specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(v46, v44, v32, v43, v45);
    swift_release();
    swift_release();
  }
  else
  {
    v57 = v18;
    swift_retain();
    v33 = Logger.logObject.getter();
    v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v35 = 134217984;
      *(double *)aBlock = a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_246EC7000, v33, v34, "Background Connection - Fallback: Delaying start %f.", v35, 0xCu);
      MEMORY[0x24956E018](v35, -1, -1);
    }

    v47 = *(_QWORD *)(a3 + 32);
    static DispatchTime.now()();
    v36 = v48;
    MEMORY[0x24956CFC8](v16, a6);
    v37 = *(void (**)(char *, uint64_t))(v49 + 8);
    v38 = v50;
    v37(v16, v50);
    aBlock[4] = partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:);
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_47;
    v39 = _Block_copy(aBlock);
    swift_retain();
    v40 = v51;
    static DispatchQoS.unspecified.getter();
    v60 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    v41 = v52;
    v42 = v56;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D22C](v36, v40, v41, v39);
    _Block_release(v39);
    swift_release();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v42);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v40, v54);
    v37(v36, v38);
    swift_release();
  }
  swift_release();
  swift_release();
  outlined retain of NetworkConnectionError(v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
}

void specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, SiriNetwork::ConnectionMethod a2, char a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246EC7000, v9, v10, "Background Connection - Fallback: Start new connection.", v11, 2u);
      MEMORY[0x24956E018](v11, -1, -1);
    }

    BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a2, (a3 & 1) == 0);
    if (v12)

    swift_beginAccess();
    swift_weakLoadStrong();
    swift_release();
    swift_release();
  }
  swift_release();

}

void specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(NSObject *a1, uint64_t a2)
{
  os_log_type_t v2;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;

  v4 = a1 + 2;
  OUTLINED_FUNCTION_48();
  if (OUTLINED_FUNCTION_164_2())
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v5, (uint64_t)static Logger.siriNetwork);
    v6 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_61(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v7 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v4, v2, "Background Connection - Fallback: Start new connection.", v7);
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_107_1();
    if (a2)
      OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_164_2();
    OUTLINED_FUNCTION_140_0();
    OUTLINED_FUNCTION_34_0();
  }
  OUTLINED_FUNCTION_140_0();
  OUTLINED_FUNCTION_63_3();
  OUTLINED_FUNCTION_109_2();
}

void specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  os_log_type_t v5;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;

  v8 = a1 + 2;
  OUTLINED_FUNCTION_48();
  if (OUTLINED_FUNCTION_164_2())
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v9, (uint64_t)static Logger.siriNetwork);
    v10 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_61(v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v8, v5, "Background Connection - Fallback: Start new connection.", v11);
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_107_1();
    if (a2)
      OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_164_2();
    OUTLINED_FUNCTION_140_0();
    OUTLINED_FUNCTION_34_0();
  }
  OUTLINED_FUNCTION_140_0();
  outlined retain of NetworkConnectionError(a5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
  OUTLINED_FUNCTION_109_2();
}

uint64_t specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(uint64_t a1, SiriNetwork::ConnectionMethod a2, char a3, void (*a4)(__int128 *))
{
  uint64_t result;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246EC7000, v9, v10, "Background Connection - Fallback: Start new connection.", v11, 2u);
      MEMORY[0x24956E018](v11, -1, -1);
    }

    BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a2, (a3 & 1) == 0);
    if (v12)

    v13 = xmmword_246F75570;
    v15 = 0;
    v16 = 0;
    v14 = 0;
    a4(&v13);
    return swift_release();
  }
  return result;
}

void BackgroundConnection.canFallBackFromError(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(v1 + 1080))
  {
    v4 = OUTLINED_FUNCTION_83_3();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 496))(a1, v4, v2);
  }
  OUTLINED_FUNCTION_23_1();
}

Swift::Void __swiftcall BackgroundConnection.setSendPings(_:)(Swift::Bool a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v2 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_66_2(v2, (uint64_t)&v14, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v15)
  {
    outlined init with take of RPCOspreyConnectionProtocol(&v14, (uint64_t)v16);
    v3 = v17;
    v4 = v18;
    OUTLINED_FUNCTION_160_1(v16, v17);
    v5 = (*(uint64_t (**)(Swift::Bool, uint64_t, uint64_t))(v4 + 152))(a1, v3, v4);
    OUTLINED_FUNCTION_139(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)&v14, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  }
  OUTLINED_FUNCTION_180_2();
}

void closure #1 in BackgroundConnection.connectionProvider(_:received:)(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  os_log_type_t v25;
  uint8_t *v26;
  os_log_type_t v27;
  uint8_t *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  os_log_type_t v36;
  _QWORD *v37;
  uint8_t *v38;
  void *v39;
  __int128 v40;
  unint64_t v41;
  void *v42;

  v6 = a1 + 16;
  OUTLINED_FUNCTION_48();
  v7 = OUTLINED_FUNCTION_133_1();
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)(v7 + 1080);
    if (!v9 || v9 != a2)
      goto LABEL_4;
    OUTLINED_FUNCTION_164();
    OUTLINED_FUNCTION_175_1();
    if (OUTLINED_FUNCTION_183_2())
    {
      type metadata accessor for BackgroundConnection();
      v10 = OUTLINED_FUNCTION_220_0();
      if (!v10)
        swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
    }
    OUTLINED_FUNCTION_48();
    v11 = OUTLINED_FUNCTION_133_1();
    v12 = v11;
    if (v10)
    {
      if (!v11)
      {
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_16_16();
LABEL_58:
        swift_unknownObjectRelease();
        goto LABEL_5;
      }
      OUTLINED_FUNCTION_5_16();
      swift_release();
      if (v12 != v10)
      {
        OUTLINED_FUNCTION_3_6();
LABEL_4:
        swift_release();
        goto LABEL_5;
      }
    }
    else if (v11)
    {
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_16_16();
      goto LABEL_4;
    }
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_5_1();
    v14 = __swift_project_value_buffer(v13, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v18 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v17 = 138412290;
      if (a4)
      {
        OUTLINED_FUNCTION_104_1();
        v19 = OUTLINED_FUNCTION_115_2();
        OUTLINED_FUNCTION_106_2();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        OUTLINED_FUNCTION_217_0();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v19 = 0;
      }
      *v18 = v19;
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v15, v16, "Background Connection - Provider: Error (%@)", v17);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_36_2();

    if (*(_BYTE *)(v8 + 1186) == 1)
    {
      OUTLINED_FUNCTION_104_1();
      OUTLINED_FUNCTION_104_1();
      Logger.logObject.getter();
      v20 = OUTLINED_FUNCTION_35_0();
      if (OUTLINED_FUNCTION_106(v20))
      {
        v21 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        v22 = (_QWORD *)OUTLINED_FUNCTION_2_2();
        *(_DWORD *)v21 = 138412290;
        if (a4)
        {
          OUTLINED_FUNCTION_104_1();
          v23 = OUTLINED_FUNCTION_115_2();
          OUTLINED_FUNCTION_106_2();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
        }
        else
        {
          OUTLINED_FUNCTION_217_0();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v23 = 0;
        }
        *v22 = v23;
        OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_30_0(&dword_246EC7000, v14, v20, "Background Connection - Provider: Error (%@). Connection was Cancelled, none action is required", v21);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_0_4();
      }
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();

      goto LABEL_57;
    }
    if (!a4)
    {
      Logger.logObject.getter();
      v27 = OUTLINED_FUNCTION_35_0();
      if (OUTLINED_FUNCTION_7_0(v27))
      {
        v28 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        *(_WORD *)v28 = 0;
        OUTLINED_FUNCTION_8_0(&dword_246EC7000, v14, OS_LOG_TYPE_DEFAULT, "Background Connection - Provider: Closing provider connection without error", v28);
        OUTLINED_FUNCTION_0_4();
      }

      BackgroundConnection.cancel()();
      goto LABEL_57;
    }
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    if ((OUTLINED_FUNCTION_132_2() & 1) != 0)
    {
      if (v41 >> 60 == 10 && !v42)
      {
        v24 = v41 == 0xA000000000000000 && v39 == (void *)7;
        if (v24 && v40 == 0)
        {
          Logger.logObject.getter();
          v25 = OUTLINED_FUNCTION_35_0();
          if (OUTLINED_FUNCTION_27_0(v25))
          {
            v26 = (uint8_t *)OUTLINED_FUNCTION_2_2();
            *(_WORD *)v26 = 0;
            OUTLINED_FUNCTION_8_0(&dword_246EC7000, v14, v6, "Background Connection - Provider: Closing provider connection without error because it was stale", v26);
            OUTLINED_FUNCTION_0_4();
          }

          BackgroundConnection.cancel()();
LABEL_56:
          OUTLINED_FUNCTION_36_2();
LABEL_57:
          OUTLINED_FUNCTION_16_16();
          goto LABEL_58;
        }
      }
      outlined consume of NetworkConnectionError(v39, v40, *((uint64_t *)&v40 + 1), v41, v42);
    }
    if (AFDeviceSupportsSiriUOD())
    {
      OUTLINED_FUNCTION_104_1();
      if ((OUTLINED_FUNCTION_132_2() & 1) != 0)
      {
        if (v41 >> 60 == 1)
        {
          OUTLINED_FUNCTION_103_3();
          OUTLINED_FUNCTION_103_3();
          Logger.logObject.getter();
          v29 = OUTLINED_FUNCTION_35_0();
          if (OUTLINED_FUNCTION_27_0(v29))
          {
            v36 = v6;
            v30 = (uint8_t *)OUTLINED_FUNCTION_2_2();
            v37 = (_QWORD *)OUTLINED_FUNCTION_2_2();
            v38 = v30;
            *(_DWORD *)v30 = 138412290;
            lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
            OUTLINED_FUNCTION_11_2();
            *(_QWORD *)v31 = v39;
            *(_OWORD *)(v31 + 8) = v40;
            *(_QWORD *)(v31 + 24) = v41;
            *(_QWORD *)(v31 + 32) = v42;
            OUTLINED_FUNCTION_103_3();
            v32 = _swift_stdlib_bridgeErrorToNSError();
            OUTLINED_FUNCTION_106_2();
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *v37 = v32;
            outlined consume of NetworkConnectionError(v39, v40, *((uint64_t *)&v40 + 1), v41, v42);
            OUTLINED_FUNCTION_27_9();
            OUTLINED_FUNCTION_30_0(&dword_246EC7000, v14, v36, "Background Connection - Provider: Error (%@), but device support UOD.", v38);
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            OUTLINED_FUNCTION_20_1();
            OUTLINED_FUNCTION_0_4();
          }
          outlined consume of NetworkConnectionError(v39, v40, *((uint64_t *)&v40 + 1), v41, v42);
          OUTLINED_FUNCTION_27_9();

          lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
          v34 = (void *)OUTLINED_FUNCTION_11_2();
          *(_QWORD *)v35 = v39;
          *(_OWORD *)(v35 + 8) = v40;
          *(_QWORD *)(v35 + 24) = v41;
          *(_QWORD *)(v35 + 32) = v42;
          OUTLINED_FUNCTION_103_3();
          BackgroundConnection.didEncounterError(_:)(v34);
          OUTLINED_FUNCTION_36_2();
          OUTLINED_FUNCTION_27_9();
          OUTLINED_FUNCTION_3_6();
          OUTLINED_FUNCTION_81_4();
          *(_BYTE *)(v8 + 1187) = 0;
          goto LABEL_4;
        }
        OUTLINED_FUNCTION_27_9();
      }
    }
    v33 = OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_133_1();
    OUTLINED_FUNCTION_157_0();
    swift_weakInit();
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_122();
    specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)(a4, v8, v33, a4);
    swift_release();
    OUTLINED_FUNCTION_36_2();
    goto LABEL_56;
  }
LABEL_5:
  OUTLINED_FUNCTION_80_3();
}

uint64_t closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  os_log_type_t type;
  id v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[5];

  v5 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v10 = result;
    if (v4 >> 1 != 0xFFFFFFFF || v6 >= 2)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v12 = type metadata accessor for Logger();
      __swift_project_value_buffer(v12, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      v13 = a3;
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      v14 = a3;
      v15 = Logger.logObject.getter();
      v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = swift_slowAlloc();
        v36 = a3;
        v18 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v17 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        type = v16;
        *v19 = v5;
        v19[1] = v4;
        v19[2] = v7;
        v19[3] = v6;
        v19[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        v20 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v18 = v20;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v17 + 12) = 2112;
        v21 = v36;
        v40[0] = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v22 = v18;
        a3 = v36;
        v22[1] = v40[0];

        _os_log_impl(&dword_246EC7000, v15, type, "Background Connection - Fallback: Callback to Completion with error %@ for provider error (%@)", (uint8_t *)v17, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24956E018](v22, -1, -1);
        MEMORY[0x24956E018](v17, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);

      }
      swift_beginAccess();
      outlined init with copy of NetworkConnectionProtocol?(v10 + 1096, (uint64_t)v40, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      if (v40[3])
      {
        outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v40, (uint64_t)v37);
        outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v40, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
        v23 = v38;
        v24 = v39;
        __swift_project_boxed_opaque_existential_1(v37, v38);
        v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 184))(v23, v24);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
        if ((v25 & 1) != 0)
        {
          v26 = a3;
          v27 = a3;
          v28 = Logger.logObject.getter();
          v29 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v28, v29))
          {
            v30 = (uint8_t *)swift_slowAlloc();
            v31 = swift_slowAlloc();
            v40[0] = v31;
            *(_DWORD *)v30 = 136315138;
            v37[0] = a3;
            v32 = a3;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
            v33 = String.init<A>(describing:)();
            v37[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, v40);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_246EC7000, v28, v29, "Background Connection - Provider: Error during request: %s", v30, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24956E018](v31, -1, -1);
            MEMORY[0x24956E018](v30, -1, -1);
          }
          else
          {

          }
          BackgroundConnection.didEncounterError(_:)(a3);
        }
      }
      else
      {
        outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v40, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      }
      BackgroundConnection.cancel()();
    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(uint64_t a1, uint64_t a2, os_log_type_t a3, void *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_48();
  result = OUTLINED_FUNCTION_133_1();
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)(result + 1080);
    if (!v9 || v9 != a2)
      return swift_release();
    OUTLINED_FUNCTION_164();
    OUTLINED_FUNCTION_175_1();
    v10 = OUTLINED_FUNCTION_183_2();
    if (v10)
    {
      a3 = v10;
      type metadata accessor for BackgroundConnection();
      v11 = OUTLINED_FUNCTION_220_0();
      if (!v11)
        swift_unknownObjectRelease();
    }
    else
    {
      v11 = 0;
    }
    OUTLINED_FUNCTION_48();
    v12 = OUTLINED_FUNCTION_133_1();
    v13 = v12;
    if (v11)
    {
      if (!v12)
      {
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_16_16();
        return swift_unknownObjectRelease();
      }
      OUTLINED_FUNCTION_5_16();
      OUTLINED_FUNCTION_34_0();
      if (v13 != v11)
      {
        OUTLINED_FUNCTION_3_6();
        return swift_release();
      }
    }
    else if (v12)
    {
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_16_16();
      return swift_release();
    }
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_5_1();
    v15 = __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v19 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v18 = 138412290;
      if (a4)
      {
        OUTLINED_FUNCTION_104_1();
        v20 = OUTLINED_FUNCTION_115_2();
        OUTLINED_FUNCTION_122_2();
      }
      else
      {
        OUTLINED_FUNCTION_122_2();
        v20 = 0;
      }
      *v19 = v20;
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v16, v17, "Background Connection - Provider: Intermediate Error (%@)", v18);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_36_2();

    if (*(_BYTE *)(v8 + 1186) == 1)
    {
      OUTLINED_FUNCTION_104_1();
      OUTLINED_FUNCTION_104_1();
      Logger.logObject.getter();
      v21 = OUTLINED_FUNCTION_35_0();
      if (OUTLINED_FUNCTION_106(v21))
      {
        v22 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        v23 = (_QWORD *)OUTLINED_FUNCTION_2_2();
        *(_DWORD *)v22 = 138412290;
        if (a4)
        {
          OUTLINED_FUNCTION_104_1();
          v24 = OUTLINED_FUNCTION_115_2();
          OUTLINED_FUNCTION_123_1();
        }
        else
        {
          OUTLINED_FUNCTION_123_1();
          v24 = 0;
        }
        *v23 = v24;
        OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_30_0(&dword_246EC7000, v15, v21, "Background Connection - Provider: Intermediate Error (%@). Connection was Cancelled, none action is required", v22);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_0_4();
      }
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();
LABEL_35:

LABEL_39:
      OUTLINED_FUNCTION_16_16();
      return swift_unknownObjectRelease();
    }
    if (!a4)
    {
      Logger.logObject.getter();
      v28 = OUTLINED_FUNCTION_35_0();
      if (OUTLINED_FUNCTION_7_0(v28))
      {
        v29 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        *(_WORD *)v29 = 0;
        OUTLINED_FUNCTION_8_0(&dword_246EC7000, v15, OS_LOG_TYPE_DEFAULT, "Background Connection - Provider: Intermediate Error nill", v29);
        OUTLINED_FUNCTION_0_4();
      }
      goto LABEL_35;
    }
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_104_1();
    Logger.logObject.getter();
    v25 = OUTLINED_FUNCTION_35_0();
    if (OUTLINED_FUNCTION_122_0(v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      v27 = (_QWORD *)OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v26 = 138412290;
      OUTLINED_FUNCTION_104_1();
      v33 = OUTLINED_FUNCTION_115_2();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v27 = v33;
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_36_2();
      OUTLINED_FUNCTION_30_0(&dword_246EC7000, v15, a3, "Background Connection - Provider: Intermediate Error (%@) forwarded.", v26);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_36_2();

    v30 = MEMORY[0x24956E090](v8 + 16);
    if (!v30)
    {
      OUTLINED_FUNCTION_36_2();
      goto LABEL_39;
    }
    v31 = v30;
    v32 = OUTLINED_FUNCTION_85_1();
    specialized Connection.didEncounterIntermediateError(_:error:)(v32, a4, v31);
    OUTLINED_FUNCTION_36_2();
    swift_release_n();
    OUTLINED_FUNCTION_3_6();
    return swift_unknownObjectRelease();
  }
  return result;
}

void BackgroundConnection.tryToWriteBufferedOutputData(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  _WORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  _WORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t ObjectType;
  _QWORD *v33;
  void (*v34)(uint64_t, unint64_t, void (*)(void *, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  _QWORD v68[3];
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[24];
  uint64_t v72;

  if (!*(_QWORD *)(v2 + 1080))
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1(v18, (uint64_t)static Logger.siriNetwork);
    v19 = OUTLINED_FUNCTION_58();
    if (OUTLINED_FUNCTION_7_0(v19))
    {
      v20 = (_WORD *)OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_98_1(v20);
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v2, OS_LOG_TYPE_DEFAULT, "Background Connection - Writter: No connection provider available.", v3);
      OUTLINED_FUNCTION_0_4();
    }

    if (a1)
    {
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v21 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_124_1(v22, 3);
      *(_OWORD *)(v23 + 24) = xmmword_246F72F10;
      v14 = (void *)OUTLINED_FUNCTION_11_2();
      v24[1] = 0;
      v24[2] = 0;
      *v24 = v21;
      OUTLINED_FUNCTION_72_3((__n128)xmmword_246F72F20, (uint64_t)v14, (uint64_t)v24);
      goto LABEL_15;
    }
    goto LABEL_36;
  }
  v6 = v2;
  v7 = (uint8_t *)(v2 + 1080);
  if ((*(_BYTE *)(v2 + 1186) & 1) == 0)
  {
    if (*(_BYTE *)(v2 + 1185) == 1)
    {
      v25 = *(_QWORD *)(v2 + 1088);
      v26 = OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_66_2(v26, (uint64_t)v71, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      if (v72)
      {
        outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v71, (uint64_t)v68);
        OUTLINED_FUNCTION_181_1();
        outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v71, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
        v27 = v69;
        v28 = v70;
        __swift_project_boxed_opaque_existential_1(v68, v69);
        v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 120))(v27, v28);
        v31 = v30;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v68);
        if (v31 >> 60 != 15)
        {
          siri_kdebug_trace_0();
          ObjectType = swift_getObjectType();
          v33 = (_QWORD *)OUTLINED_FUNCTION_6();
          v33[2] = v29;
          v33[3] = v31;
          v33[4] = a1;
          v33[5] = a2;
          v34 = *(void (**)(uint64_t, unint64_t, void (*)(void *, char), _QWORD *, uint64_t, uint64_t))(v25 + 504);
          OUTLINED_FUNCTION_201_0();
          OUTLINED_FUNCTION_201_0();
          OUTLINED_FUNCTION_256();
          v34(v29, v31, partial apply for closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:), v33, ObjectType, v25);
          OUTLINED_FUNCTION_96_1();
          OUTLINED_FUNCTION_34_0();
          OUTLINED_FUNCTION_146_0();
          OUTLINED_FUNCTION_96_1();
LABEL_36:
          OUTLINED_FUNCTION_80_3();
          return;
        }
      }
      else
      {
        OUTLINED_FUNCTION_181_1();
        outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v71, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      }
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v53 = OUTLINED_FUNCTION_5_1();
      __swift_project_value_buffer(v53, (uint64_t)static Logger.siriNetwork);
      OUTLINED_FUNCTION_59_0();
      v54 = Logger.logObject.getter();
      v55 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_14_5(v54))
      {
        v56 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        v68[0] = OUTLINED_FUNCTION_2_2();
        OUTLINED_FUNCTION_99_3(4.8149e-34);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ConnectionProviderProtocol?);
        v57 = OUTLINED_FUNCTION_205_0();
        OUTLINED_FUNCTION_263(v57, v58, v59, v60, v61, v62);
        OUTLINED_FUNCTION_112_1();
        OUTLINED_FUNCTION_20_13();
        OUTLINED_FUNCTION_44_1();
        OUTLINED_FUNCTION_30_0(&dword_246EC7000, v54, v55, "Background Connection - Writter: %s is open, but there is not buffered output data to write.", v56);
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_0_4();
      }

      OUTLINED_FUNCTION_20_13();
      if (!a1)
      {
LABEL_35:
        OUTLINED_FUNCTION_146_0();
        goto LABEL_36;
      }
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v63 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_124_1(v64, 6);
      *(_OWORD *)(v65 + 24) = xmmword_246F72F10;
      v66 = OUTLINED_FUNCTION_11_2();
      v67[1] = 0;
      v67[2] = 0;
      *v67 = v63;
      OUTLINED_FUNCTION_72_3((__n128)xmmword_246F72F20, v66, (uint64_t)v67);
      OUTLINED_FUNCTION_146_0();
      v52 = (void *)v66;
    }
    else
    {
      v35 = one-time initialization token for siriNetwork;
      OUTLINED_FUNCTION_181_1();
      if (v35 != -1)
        swift_once();
      v36 = OUTLINED_FUNCTION_5_1();
      __swift_project_value_buffer(v36, (uint64_t)static Logger.siriNetwork);
      OUTLINED_FUNCTION_59_0();
      v37 = Logger.logObject.getter();
      v38 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_14_5(v37))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_2_2();
        v68[0] = OUTLINED_FUNCTION_2_2();
        OUTLINED_FUNCTION_99_3(4.8149e-34);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for ConnectionProviderProtocol?);
        v40 = OUTLINED_FUNCTION_205_0();
        OUTLINED_FUNCTION_263(v40, v41, v42, v43, v44, v45);
        OUTLINED_FUNCTION_112_1();
        OUTLINED_FUNCTION_20_13();
        OUTLINED_FUNCTION_44_1();
        OUTLINED_FUNCTION_30_0(&dword_246EC7000, v37, v38, "Background Connection - Writter: %s is not opened", v39);
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_0_4();
      }

      OUTLINED_FUNCTION_20_13();
      if (!a1)
        goto LABEL_35;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_124_1(v46, 4);
      *(_OWORD *)(v47 + 24) = xmmword_246F72F10;
      v48 = OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_203(v48, v49);
      OUTLINED_FUNCTION_72_3((__n128)xmmword_246F72F20, v50, v51);
      OUTLINED_FUNCTION_146_0();
      v52 = (void *)v48;
    }

    goto LABEL_36;
  }
  v8 = one-time initialization token for siriNetwork;
  OUTLINED_FUNCTION_181_1();
  if (v8 != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v9, (uint64_t)static Logger.siriNetwork);
  v10 = OUTLINED_FUNCTION_58();
  if (OUTLINED_FUNCTION_27_0(v10))
  {
    v11 = (_WORD *)OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_98_1(v11);
    OUTLINED_FUNCTION_8_0(&dword_246EC7000, v8, v6, "Background Connection - Writter: Connection is cancelled", v7);
    OUTLINED_FUNCTION_0_4();
  }

  if (a1)
  {
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_124_1(v12, 1);
    *(_OWORD *)(v13 + 24) = xmmword_246F72F10;
    v14 = (void *)OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_203((uint64_t)v14, v15);
    OUTLINED_FUNCTION_72_3((__n128)xmmword_246F72F20, v16, v17);
    OUTLINED_FUNCTION_146_0();
LABEL_15:

    return;
  }
  swift_unknownObjectRelease();
}

void closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(void *a1, char a2, uint64_t a3, unint64_t a4, void (*a5)(void *))
{
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  id v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  unint64_t v33;
  void *v34;

  siri_kdebug_trace_0();
  if ((a2 & 1) == 0)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.siriNetwork);
    outlined copy of Data._Representation(a3, a4);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v13 = 134217984;
      Data.count.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      outlined consume of Data._Representation(a3, a4);
      _os_log_impl(&dword_246EC7000, v11, v12, "Background Connection - Writter: Wrote %ld bytes", v13, 0xCu);
      MEMORY[0x24956E018](v13, -1, -1);
    }
    else
    {
      outlined consume of Data._Representation(a3, a4);
    }

    if (a5)
      a5(0);
    return;
  }
  v14 = a1;
  v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (v33 >> 60 == 10 && !v34)
    {
      v16 = v33 == 0xA000000000000000 && v30 == (void *)1;
      if (v16 && v32 == 0)
      {
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v17 = type metadata accessor for Logger();
        __swift_project_value_buffer(v17, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data._Representation(a3, a4);
        v18 = Logger.logObject.getter();
        v19 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v18, v19))
        {
          outlined consume of Data._Representation(a3, a4);
          goto LABEL_29;
        }
        v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v20 = 134217984;
        Data.count.getter();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        outlined consume of Data._Representation(a3, a4);
        _os_log_impl(&dword_246EC7000, v18, v19, "Background Connection - Writter: Wrote %ld bytes failed because connection was cancelled", v20, 0xCu);
        v21 = v20;
        goto LABEL_27;
      }
    }
    outlined consume of NetworkConnectionError(v30, v32, *((uint64_t *)&v32 + 1), v33, v34);
  }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.siriNetwork);
  v23 = a1;
  v24 = a1;
  v18 = Logger.logObject.getter();
  v25 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v18, v25))
  {
    outlined consume of Result<(), Error>(a1, 1);
    outlined consume of Result<(), Error>(a1, 1);
    goto LABEL_29;
  }
  v26 = (uint8_t *)swift_slowAlloc();
  v27 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v26 = 138412290;
  v28 = a1;
  v31 = _swift_stdlib_bridgeErrorToNSError();
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *v27 = v31;
  outlined consume of Result<(), Error>(a1, 1);
  outlined consume of Result<(), Error>(a1, 1);
  _os_log_impl(&dword_246EC7000, v18, v25, "Background Connection - Writter: Error writing data %@", v26, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  swift_arrayDestroy();
  MEMORY[0x24956E018](v27, -1, -1);
  v21 = v26;
LABEL_27:
  MEMORY[0x24956E018](v21, -1, -1);
LABEL_29:

  if (a5)
  {
    v29 = a1;
    a5(a1);
    outlined consume of Result<(), Error>(a1, 1);
  }
  outlined consume of Result<(), Error>(a1, 1);
}

void BackgroundConnection.bufferGeneralData(data:)()
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
  _BYTE v22[24];
  uint64_t v23;

  v0 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_66_2(v0, (uint64_t)v22, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (v23)
  {
    v8 = OUTLINED_FUNCTION_56_3(v1);
    OUTLINED_FUNCTION_112_0(v8, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v9, v10, v11, v12, v13, v14, v17, v18, v19);
    v15 = v21;
    OUTLINED_FUNCTION_160_1(&v18, v20);
    v16 = OUTLINED_FUNCTION_142_1(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 112));
    OUTLINED_FUNCTION_184_0(v16);
  }
  else
  {
    OUTLINED_FUNCTION_112_0(v1, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?, v2, v3, v4, v5, v6, v7, v17, v18, v19);
  }
  OUTLINED_FUNCTION_60_1();
}

void BackgroundConnection.setupReadHandlerOnProvider()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD, _QWORD *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 1080);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 1088);
    swift_unknownObjectRetain();
    siri_kdebug_trace_0();
    ObjectType = swift_getObjectType();
    v4 = OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_133();
    v5 = (_QWORD *)OUTLINED_FUNCTION_6();
    v5[2] = v4;
    v5[3] = v1;
    v5[4] = v2;
    v6 = *(void (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(v2 + 512);
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_139_0();
    v6(partial apply for closure #1 in BackgroundConnection.setupReadHandlerOnProvider(), v5, ObjectType, v2);
    OUTLINED_FUNCTION_140_0();
    OUTLINED_FUNCTION_34_0();
    swift_unknownObjectRelease();
  }
}

void closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, unint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t Strong;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[5];

  siri_kdebug_trace_0();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v12 = *(_QWORD *)(Strong + 1080);
    if (!v12 || v12 != a6)
    {
LABEL_4:
      swift_release();
      return;
    }
    if (!a3
      || (v34[5] = a3,
          v13 = a3,
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error),
          (swift_dynamicCast() & 1) == 0))
    {
      if (a2 >> 60 == 15)
      {
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v21 = type metadata accessor for Logger();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.siriNetwork);
        v22 = Logger.logObject.getter();
        v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_246EC7000, v22, v23, "Background Connection - Reader: Reader called but it did not returned data.", v24, 2u);
          MEMORY[0x24956E018](v24, -1, -1);
        }

        swift_allocObject();
        swift_beginAccess();
        swift_weakLoadStrong();
        swift_weakInit();
        swift_release();
        v25 = a3;
        swift_retain();
        v26 = a3;
        swift_retain();
        specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
        swift_release();
        swift_release();

      }
      else
      {
        outlined copy of Data._Representation(a1, a2);
        if (one-time initialization token for siriNetwork != -1)
          swift_once();
        v27 = type metadata accessor for Logger();
        __swift_project_value_buffer(v27, (uint64_t)static Logger.siriNetwork);
        outlined copy of Data._Representation(a1, a2);
        v28 = Logger.logObject.getter();
        v29 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v30 = 134217984;
          v35[0] = Data.count.getter();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          outlined consume of Data?(a1, a2);
          _os_log_impl(&dword_246EC7000, v28, v29, "Background Connection - Reader: Read %ld bytes", v30, 0xCu);
          MEMORY[0x24956E018](v30, -1, -1);
        }
        else
        {
          outlined consume of Data?(a1, a2);
        }

        outlined copy of Data._Representation(a1, a2);
        BackgroundConnection.connectionHasBytesAvailable(_:)(a1, a2);
        v31 = outlined consume of Data?(a1, a2);
        if ((a4 & 1) != 0)
          BackgroundConnection.setupReadHandlerOnProvider()(v31);
        outlined consume of Data?(a1, a2);
      }
      goto LABEL_4;
    }
    outlined init with take of NetworkConnectionError((uint64_t)v34, (uint64_t)v35);
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)v35, v19);
      outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      v20 = _swift_stdlib_bridgeErrorToNSError();
      v34[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v18 = v20;
      outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_246EC7000, v15, v16, "Background Connection - Reader: Error. %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24956E018](v18, -1, -1);
      MEMORY[0x24956E018](v17, -1, -1);
    }
    else
    {
      outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
    }

    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    v32 = (void *)swift_allocError();
    outlined init with take of NetworkConnectionError((uint64_t)v35, v33);
    swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    swift_release();
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    swift_retain();
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    swift_retain();
    specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
    swift_release();
    swift_release();
    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
    swift_release();

    outlined retain of NetworkConnectionError(v35, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
  }
}

void closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t Strong;
  uint64_t v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[3];
  unint64_t v56;

  outlined init with take of NetworkConnectionError((uint64_t)a3, (uint64_t)&v54);
  v5 = v54;
  v7 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v10 = *(void **)(a1 + 32);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v12 = Strong;
    if (v6 >> 1 == 0xFFFFFFFF && v8 <= 1)
      goto LABEL_25;
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.siriNetwork);
    outlined copy of NetworkConnectionError?(v7, v6, v9, v8, v10);
    outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    outlined copy of NetworkConnectionError?(v7, v6, v9, v8, v10);
    outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    v49 = v5;
    if (os_log_type_enabled(v15, v16))
    {
      v48 = v12;
      v17 = swift_slowAlloc();
      v46 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412546;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      v47 = v15;
      swift_allocError();
      *v18 = v7;
      v18[1] = v6;
      v18[2] = v9;
      v18[3] = v8;
      v18[4] = v10;
      outlined copy of NetworkConnectionError(v7, v6, v9, v8, v10);
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v55[0] = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v46 = v19;
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      *(_WORD *)(v17 + 12) = 2112;
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v20);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      v21 = _swift_stdlib_bridgeErrorToNSError();
      v55[0] = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v46[1] = v21;
      v15 = v47;
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_246EC7000, v47, v16, "Background Connection - Fallback: Callback to Completion with error %@ for Read Handler error (%@)", (uint8_t *)v17, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24956E018](v46, -1, -1);
      v22 = v17;
      v12 = v48;
      MEMORY[0x24956E018](v22, -1, -1);
    }
    else
    {
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined consume of NetworkConnectionError?(v7, v6, v9, v8, v10);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
    }

    swift_beginAccess();
    outlined init with copy of NetworkConnectionProtocol?(v12 + 1096, (uint64_t)v55, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    if (v56)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v55, (uint64_t)v50);
      outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v55, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      v23 = v51;
      v24 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      LOBYTE(v23) = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 184))(v23, v24);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
      v25 = v49;
      if ((v23 & 1) != 0)
      {
        v26 = Logger.logObject.getter();
        v27 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_246EC7000, v26, v27, "Background Connection - Fallback: Read Error - mid request", v28, 2u);
          MEMORY[0x24956E018](v28, -1, -1);
        }

LABEL_28:
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        v44 = (void *)swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v45);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
        BackgroundConnection.didEncounterError(_:)(v44);
        swift_release();

        return;
      }
    }
    else
    {
      outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v55, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
      v25 = v49;
    }
    outlined init with take of NetworkConnectionError((uint64_t)a3, (uint64_t)v55);
    if (v56 >> 60 == 7)
    {
      v56 &= 0xFFFFFFFFFFFFFFFuLL;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v55, (uint64_t)v50, &demangling cache variable for type metadata for Error?);
      v29 = v25;
      v30 = v25;
      v31 = Logger.logObject.getter();
      v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v33 = 138412290;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        outlined init with take of NetworkConnectionError((uint64_t)a3, v35);
        v36 = v25;
        v37 = _swift_stdlib_bridgeErrorToNSError();
        v53 = v37;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v34 = v37;
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        _os_log_impl(&dword_246EC7000, v31, v32, "Background Connection - Fallback: Read Error - cancel (%@)", v33, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24956E018](v34, -1, -1);
        MEMORY[0x24956E018](v33, -1, -1);
      }
      else
      {
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
        outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      }

      BackgroundConnection.cancel()();
LABEL_25:
      swift_release();
      return;
    }
    outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v40 = 138412290;
      lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
      swift_allocError();
      outlined init with take of NetworkConnectionError((uint64_t)a3, v42);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of NetworkConnectionError);
      v43 = _swift_stdlib_bridgeErrorToNSError();
      v50[0] = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v41 = v43;
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      _os_log_impl(&dword_246EC7000, v38, v39, "Background Connection - Fallback: Read Error - error (%@)", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24956E018](v41, -1, -1);
      MEMORY[0x24956E018](v40, -1, -1);
    }
    else
    {
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
      outlined retain of NetworkConnectionError(a3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of NetworkConnectionError);
    }

    goto LABEL_28;
  }
}

void closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t Strong;
  uint64_t v10;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[10];

  v36[8] = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return;
  v10 = Strong;
  if (v4 >> 1 == 0xFFFFFFFF && v6 <= 1)
  {
LABEL_24:
    swift_release();
    return;
  }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.siriNetwork);
  outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
  v13 = a3;
  outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
  v14 = a3;
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v17 = 138412546;
    lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
    swift_allocError();
    *v18 = v5;
    v18[1] = v4;
    v18[2] = v7;
    v18[3] = v6;
    v18[4] = v8;
    outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
    v36[0] = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v32 = v36[0];
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    *(_WORD *)(v17 + 12) = 2112;
    if (a3)
    {
      v19 = a3;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      v36[0] = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      v36[0] = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v20 = 0;
    }
    v32[1] = v20;

    _os_log_impl(&dword_246EC7000, v15, v16, "Background Connection - Fallback: Callback to Completion with error %@ for Read Handler error (%@)", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v32, -1, -1);
    MEMORY[0x24956E018](v17, -1, -1);
  }
  else
  {
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
    outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);

  }
  swift_beginAccess();
  outlined init with copy of NetworkConnectionProtocol?(v10 + 1096, (uint64_t)v36, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  if (!v36[3])
  {
    outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v36, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
    goto LABEL_21;
  }
  outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v36, (uint64_t)v33);
  outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)v36, (uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  v21 = v34;
  v22 = v35;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 184))(v21, v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
  if ((v23 & 1) == 0)
  {
LABEL_21:
    v29 = Logger.logObject.getter();
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_246EC7000, v29, v30, "Background Connection - Fallback: Read Error - cancel", v31, 2u);
      MEMORY[0x24956E018](v31, -1, -1);
    }

    BackgroundConnection.cancel()();
    goto LABEL_24;
  }
  v24 = Logger.logObject.getter();
  v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_246EC7000, v24, v25, "Background Connection - Fallback: Read Error - mid request)", v26, 2u);
    MEMORY[0x24956E018](v26, -1, -1);
  }

  lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
  v27 = (void *)swift_allocError();
  *(_QWORD *)(v28 + 8) = 0;
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)v28 = 0;
  *(_OWORD *)(v28 + 24) = xmmword_246F736E0;
  BackgroundConnection.didEncounterError(_:)(v27);
  swift_release();

}

void BackgroundConnection.connectionHasBytesAvailable(_:)(uint64_t a1, unint64_t a2)
{
  os_log_type_t v2;
  uint64_t v3;
  os_log_type_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint8_t *v12;
  NSObject *v13;
  NSObject *v14;

  if (a2 >> 60 != 15)
    __asm { BR              X10 }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_5_1();
  v13 = OUTLINED_FUNCTION_3_1(v3, (uint64_t)static Logger.siriNetwork);
  v4 = static os_log_type_t.default.getter();
  if (OUTLINED_FUNCTION_157_1(v4, v5, v6, v7, v8, v9, v10, v11, v13))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    *(_WORD *)v12 = 0;
    OUTLINED_FUNCTION_8_0(&dword_246EC7000, v14, v2, "Background Connection - Reader: Connection does not have bytes available", v12);
    OUTLINED_FUNCTION_0_4();
  }

}

Swift::Bool __swiftcall BackgroundConnection.isUsingPeer()()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 1136) == 2;
}

Swift::Bool __swiftcall BackgroundConnection.isUsingPop()()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 1136) == 3;
}

Swift::Bool __swiftcall BackgroundConnection.isUsingFlorence()()
{
  uint64_t v0;
  Swift::Bool result;
  _BYTE v2[513];
  char v3;
  __int16 v4;
  _BYTE v5[408];
  uint64_t v6;
  char v7;
  __int16 v8;

  if (*(_BYTE *)(v0 + 1136) == 1)
  {
    OUTLINED_FUNCTION_28(v5, (const void *)(v0 + 40));
    if (v6 != 1)
    {
      memcpy(v2, (const void *)(v0 + 40), sizeof(v2));
      v3 = v7;
      v4 = v8;
      OUTLINED_FUNCTION_213_0();
      outlined release of ConnectionConfiguration(v2);
    }
  }
  OUTLINED_FUNCTION_23_1();
  return result;
}

Swift::Bool __swiftcall BackgroundConnection.isWifiOrCellularMaybeBetterThanCurrentStream()()
{
  char v0;

  v0 = AFDeviceSupportsWiFiLPASMode();
  return BackgroundConnection.logTcpInfoIndicatesPoorLinkQuality()() & v0;
}

Swift::Bool __swiftcall BackgroundConnection.shouldFallbackQuickly()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Bool result;

  if (*(_QWORD *)(v0 + 1080))
  {
    v1 = *(_QWORD *)(v0 + 1088);
    v2 = OUTLINED_FUNCTION_164();
    (*(void (**)(uint64_t, uint64_t))(v1 + 544))(v2, v1);
  }
  OUTLINED_FUNCTION_23_1();
  return result;
}

uint64_t BackgroundConnection.providerHeaderData(forceReconnect:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (!*(_QWORD *)(v1 + 1080))
    return 0;
  v4 = OUTLINED_FUNCTION_83_3();
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v2 + 552))(a1 & 1, v4, v2);
}

Swift::Bool __swiftcall BackgroundConnection.logTcpInfoIndicatesPoorLinkQuality()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  unint64_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __n128 *v13;
  __int128 v14;
  __n128 *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __n128 v30;
  unint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __n128 *v40;
  __int128 v41;
  __n128 *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __n128 v56;
  unint64_t *v57;
  unint64_t *v58;
  Swift::Bool result;
  uint64_t v60;
  __n128 v61;
  uint64_t v62;
  __n128 v63;
  __int128 v64;
  __int128 v65;
  __n128 v66;
  __n128 v67;
  __int128 v68;
  __int128 v69;
  __n128 v70;
  __n128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  unint64_t v90;
  _BYTE v91[5];
  unint64_t v92;
  _BYTE v93[5];
  unint64_t v94;
  char v95;
  int v96;
  unint64_t v97;
  unint64_t v98;
  _BYTE v99[5];
  unint64_t v100;
  _BYTE v101[5];
  unint64_t v102;
  _BYTE v103[5];
  unint64_t v104;
  unint64_t v105;
  __int128 v106;
  char v107[712];
  _BYTE v108[712];
  _BYTE v109[360];
  uint64_t v110;
  char v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  char v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  _BYTE v120[360];
  __int128 v121;
  __n128 v122;
  __int128 v123;
  __n128 v124;
  __int128 v125;
  __n128 v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[473];
  uint64_t v130;
  char v131;
  __int128 v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  unsigned __int8 v136;
  __int128 v137;
  __int128 v138;
  __n128 v139[6];
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE v144[720];

  ((void (*)())MEMORY[0x24BDAC7A8])();
  if (*(_QWORD *)(v0 + 1080))
  {
    v1 = *(_QWORD *)(v0 + 1088);
    v2 = OUTLINED_FUNCTION_164();
    v3 = *(void (**)(uint64_t, uint64_t))(v1 + 520);
    swift_unknownObjectRetain();
    v3(v2, v1);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v1 + 40))(&v130, v2, v1);
    OUTLINED_FUNCTION_42_2((uint64_t)&v142, (uint64_t)&v143);
    v4 = OUTLINED_FUNCTION_121_1();
    OUTLINED_FUNCTION_42_2((uint64_t)v4, (uint64_t)v144);
    if (_s11SiriNetwork24ConnectionSnapshotReportVSgWOg((uint64_t)v144) == 1)
    {
      OUTLINED_FUNCTION_3_6();
      v5 = v130;
      v6 = v131;
      v87 = v132;
      v7 = v133;
      v8 = v134;
      v9 = v135;
      LODWORD(v85) = v136;
      v79 = v138;
      v82 = v137;
      OUTLINED_FUNCTION_202_0();
      v76 = v10;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0(v11, (uint64_t)v129, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v71 = OUTLINED_FUNCTION_230_0(v139);
      v73 = v12;
      v67 = OUTLINED_FUNCTION_227_0(v13);
      v69 = v14;
      v63 = OUTLINED_FUNCTION_226(v15);
      v65 = v16;
      v17 = v140;
      v18 = v141;
      OUTLINED_FUNCTION_4_26();
      v110 = v5;
      v111 = v6;
      v112 = v87;
      v113 = v7;
      v114 = v8;
      v115 = v9;
      v116 = v85;
      v117 = v82;
      v118 = v79;
      v119 = v76;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v129, (uint64_t)v120, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v121 = v73;
      v122 = v71;
      v123 = v69;
      v124 = v67;
      v125 = v65;
      v126 = v63;
      v127 = v17;
      v128 = v18;
      v19 = OUTLINED_FUNCTION_121_1();
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v19, v20, v21);
      OUTLINED_FUNCTION_5_26(v22, v23, v24, v25, v26, v27, v28, v29, v60, v62, v63.n128_i64[0], v63.n128_i64[1], v65, *((uint64_t *)&v65 + 1), v67.n128_i64[0], v67.n128_i64[1], v69, *((uint64_t *)&v69 + 1), v71.n128_i64[0],
        v71.n128_i64[1],
        v73,
        *((uint64_t *)&v73 + 1),
        v76,
        v78,
        v79,
        *((uint64_t *)&v79 + 1),
        v82,
        *((uint64_t *)&v82 + 1),
        v84,
        v85,
        v87,
        *((uint64_t *)&v87 + 1),
        v89,
        v90,
        *(int *)v91,
        v91[4],
        v92,
        *(int *)v93,
        v93[4],
        v94,
        v95,
        v96,
        v97,
        v98,
        *(int *)v99,
        v99[4],
        v100,
        *(int *)v101,
        v101[4],
        v102,
        *(int *)v103,
        v103[4],
        v104,
        v105,
        v30,
        v106);
      outlined release of ConnectionMetrics((uint64_t)&v110);
    }
    else
    {
      v31 = OUTLINED_FUNCTION_121_1();
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v31, (uint64_t)v108, v32);
      v33 = v130;
      v34 = v131;
      v88 = v132;
      v35 = v133;
      v86 = v134;
      v36 = v135;
      LODWORD(v81) = v136;
      v77 = v138;
      v80 = v137;
      OUTLINED_FUNCTION_202_0();
      v74 = v37;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0(v38, (uint64_t)v109, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v70 = OUTLINED_FUNCTION_230_0(v139);
      v72 = v39;
      v66 = OUTLINED_FUNCTION_227_0(v40);
      v68 = v41;
      v61 = OUTLINED_FUNCTION_226(v42);
      v64 = v43;
      v44 = v140;
      v45 = v141;
      OUTLINED_FUNCTION_4_26();
      v110 = v33;
      v111 = v34;
      v112 = v88;
      v113 = v35;
      v114 = v86;
      v115 = v36;
      v116 = v81;
      v117 = v80;
      v118 = v77;
      v119 = v74;
      _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v109, (uint64_t)v120, &demangling cache variable for type metadata for ConnectionPreparationReport?);
      v121 = v72;
      v122 = v70;
      v123 = v68;
      v124 = v66;
      v125 = v64;
      v126 = v61;
      v127 = v44;
      v128 = v45;
      v46 = OUTLINED_FUNCTION_121_1();
      OUTLINED_FUNCTION_42_2((uint64_t)v46, v47);
      OUTLINED_FUNCTION_5_26(v48, v49, v50, v51, v52, v53, v54, v55, v61.n128_i64[0], v61.n128_i64[1], v64, *((uint64_t *)&v64 + 1), v66.n128_i64[0], v66.n128_i64[1], v68, *((uint64_t *)&v68 + 1), v70.n128_i64[0], v70.n128_i64[1], v72,
        *((uint64_t *)&v72 + 1),
        v74,
        v75,
        v77,
        *((uint64_t *)&v77 + 1),
        v80,
        *((uint64_t *)&v80 + 1),
        v81,
        v83,
        v84,
        v86,
        v88,
        *((uint64_t *)&v88 + 1),
        v89,
        v90,
        *(int *)v91,
        v91[4],
        v92,
        *(int *)v93,
        v93[4],
        v94,
        v95,
        v96,
        v97,
        v98,
        *(int *)v99,
        v99[4],
        v100,
        *(int *)v101,
        v101[4],
        v102,
        *(int *)v103,
        v103[4],
        v104,
        v105,
        v56,
        v106);
      v57 = OUTLINED_FUNCTION_121_1();
      OUTLINED_FUNCTION_42_2((uint64_t)v57, (uint64_t)v129);
      outlined retain of ConnectionSnapshotReport((uint64_t)v129);
      outlined release of ConnectionMetrics((uint64_t)&v110);
      OUTLINED_FUNCTION_33_2(v107, v108);
      ConnectionSnapshotReport.isPoorLinkQuality.getter();
      OUTLINED_FUNCTION_3_6();
      v58 = OUTLINED_FUNCTION_121_1();
      outlined release of ConnectionSnapshotReport?((uint64_t)v58);
    }
  }
  OUTLINED_FUNCTION_1_1();
  return result;
}

Swift::Void __swiftcall BackgroundConnection.updateFirstByteReadTime()()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
  objc_msgSend(v1, sel_systemUptime);
  v3 = v2;

  *(_QWORD *)(v0 + 1216) = v3;
}

Swift::Void __swiftcall BackgroundConnection.willStartConnection(with:)(Swift::OpaquePointer with)
{
  BackgroundConnection.willStartConnection(with:)();
}

void BackgroundConnection.fallbackToNextConnectionMethod(error:)()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_92_3();
  specialized BackgroundConnection.fallbackToNextConnectionMethodWithError(_:with:)();
  OUTLINED_FUNCTION_23_1();
}

void closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  os_log_type_t v23;
  uint64_t v24;

  v5 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v8 = *(void **)(a1 + 32);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (v4 >> 1 != 0xFFFFFFFF || v6 > 1)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v10 = type metadata accessor for Logger();
      __swift_project_value_buffer(v10, (uint64_t)static Logger.siriNetwork);
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      v11 = a3;
      outlined copy of NetworkConnectionError?(v5, v4, v7, v6, v8);
      v12 = a3;
      v13 = Logger.logObject.getter();
      v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v23 = v14;
        v15 = swift_slowAlloc();
        v22 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v15 = 138412546;
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        swift_allocError();
        *v16 = v5;
        v16[1] = v4;
        v16[2] = v7;
        v16[3] = v6;
        v16[4] = v8;
        outlined copy of NetworkConnectionError(v5, v4, v7, v6, v8);
        v24 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v22 = v24;
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        *(_WORD *)(v15 + 12) = 2112;
        if (a3)
        {
          v17 = a3;
          v18 = _swift_stdlib_bridgeErrorToNSError();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
        }
        else
        {
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v18 = 0;
        }
        v22[1] = v18;

        _os_log_impl(&dword_246EC7000, v13, v23, "Background Connection - Fallback: Callback to Completion with error %@ for error (%@)", (uint8_t *)v15, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24956E018](v22, -1, -1);
        MEMORY[0x24956E018](v15, -1, -1);
      }
      else
      {
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);
        outlined consume of NetworkConnectionError?(v5, v4, v7, v6, v8);

      }
      v19 = a3;
      if (!a3)
      {
        lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
        v19 = (void *)swift_allocError();
        *(_QWORD *)(v20 + 8) = 0;
        *(_QWORD *)(v20 + 16) = 0;
        *(_QWORD *)v20 = 9;
        *(_OWORD *)(v20 + 24) = xmmword_246F72F10;
      }
      v21 = a3;
      BackgroundConnection.didEncounterError(_:)(v19);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

uint64_t BackgroundConnection.connectionSendData(_:)(uint64_t a1, unint64_t a2)
{
  _QWORD v3[4];

  v3[3] = MEMORY[0x24BDCDDE8];
  v3[0] = a1;
  v3[1] = a2;
  outlined copy of Data._Representation(a1, a2);
  BackgroundConnection.sendData(_:with:)((uint64_t)v3, (void (*)(void))destructiveProjectEnumData for ConnectionConfigurationError, 0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

void BackgroundConnection.logSessionConnectionHttpHeaderCreated(httpHeader:)()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 1176);
  NetworkAnalytics.logSessionConnectionHttpHeaderCreated(_:)();

}

Swift::Void __swiftcall BackgroundConnection.didReceiveAceObject(aceObject:)(AceObject *aceObject)
{
  BackgroundConnection.willStartConnection(with:)();
}

void BackgroundConnection.willStartConnection(with:)()
{
  OUTLINED_FUNCTION_190_1();
}

void sub_246F5AA38(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    v1(v2, v3, a1);
    OUTLINED_FUNCTION_110_2();
  }
  else
  {
    OUTLINED_FUNCTION_23_1();
  }
}

void BackgroundConnection.didReceiveObject(_:)()
{
  OUTLINED_FUNCTION_190_1();
}

void sub_246F5AA78(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    specialized Connection.didReceiveObject(_:object:)(v2, v3, v1, a1);
    OUTLINED_FUNCTION_110_2();
  }
  else
  {
    OUTLINED_FUNCTION_23_1();
  }
}

void BackgroundConnection.hashValue.getter()
{
  _BYTE v0[72];

  OUTLINED_FUNCTION_34_7();
  specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)v0);
  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_4_7();
}

uint64_t storeEnumTagSinglePayload for ConnectionState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246F5AB1C + 4 * byte_246F75595[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246F5AB50 + 4 * byte_246F75590[v4]))();
}

uint64_t sub_246F5AB50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246F5AB58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246F5AB60);
  return result;
}

uint64_t sub_246F5AB6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246F5AB74);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246F5AB78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246F5AB80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConnectionState()
{
  return &type metadata for ConnectionState;
}

unint64_t lazy protocol witness table accessor for type ConnectionState and conformance ConnectionState()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState;
  if (!lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState)
  {
    result = MEMORY[0x24956DF70](&protocol conformance descriptor for ConnectionState, &type metadata for ConnectionState);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionState and conformance ConnectionState);
  }
  return result;
}

void protocol witness for BackgroundConnectionProtocol.connectionConfiguration.getter in conformance BackgroundConnection(void *a1@<X8>)
{
  uint64_t v1;
  const void *v3;
  _QWORD v4[65];

  v3 = (const void *)(v1 + 40);
  OUTLINED_FUNCTION_28(v4, v3);
  OUTLINED_FUNCTION_28(a1, v3);
  outlined retain of ConnectionConfiguration(v4);
  OUTLINED_FUNCTION_85();
}

void protocol witness for Hashable.hashValue.getter in conformance BackgroundConnection()
{
  BackgroundConnection.hashValue.getter();
}

_QWORD *protocol witness for Hashable.hash(into:) in conformance BackgroundConnection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = MEMORY[0x24956DF70](&protocol conformance descriptor for BackgroundConnection);
  return BackgroundConnectionProtocol.hash(into:)(a1, a2, v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BackgroundConnection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[72];

  Hasher.init(_seed:)();
  v3 = MEMORY[0x24956DF70](&protocol conformance descriptor for BackgroundConnection, a2);
  BackgroundConnectionProtocol.hash(into:)((uint64_t)v5, a2, v3);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance BackgroundConnection(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v5 = *a2;
  v6 = MEMORY[0x24956DF70](&protocol conformance descriptor for BackgroundConnection, a3);
  return static BackgroundConnectionProtocol.== infix(_:_:)(v4, v5, a3, v6);
}

void base witness table accessor for Equatable in BackgroundConnection(uint64_t a1, uint64_t a2)
{
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, a2, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
}

void instantiation function for generic protocol witness table for BackgroundConnection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider(&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, a2, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_13_9(a1);
  return _swift_stdlib_bridgeErrorToNSError();
}

void implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_13_9(a1);
  OUTLINED_FUNCTION_3();
}

{
  if (OUTLINED_FUNCTION_13_9(a1))
    _swift_stdlib_bridgeErrorToNSError();
  OUTLINED_FUNCTION_3();
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t specialized Set._Variant.insert(_:)(_BYTE *a1, Swift::Int a2)
{
  uint64_t *v2;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char v12;
  uint64_t v13;

  v5 = *v2;
  OUTLINED_FUNCTION_114_1();
  OUTLINED_FUNCTION_94_3(a2);
  v6 = OUTLINED_FUNCTION_103_2();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    v12 = OUTLINED_FUNCTION_173_1();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v8, v12);
    OUTLINED_FUNCTION_232_0(v13);
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }
  result = 0;
  LOBYTE(a2) = *(_BYTE *)(*(_QWORD *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t specialized Set._Variant.insert(_:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt64 v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
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
  uint64_t v39;

  OUTLINED_FUNCTION_165_1();
  OUTLINED_FUNCTION_158_2();
  if (v6)
  {
    Hasher.init(_seed:)();
    OUTLINED_FUNCTION_47_3();
    v9 = NWConnection.identifier.getter();
    Hasher._combine(_:)(v9);
    v10 = Hasher._finalize()();
    v11 = -1 << *(_BYTE *)(v3 + 32);
    v12 = v10 & ~v11;
    OUTLINED_FUNCTION_225_0();
    if ((v13 & 1) != 0)
    {
      OUTLINED_FUNCTION_170_1();
      NWConnection.identifier.getter();
      OUTLINED_FUNCTION_207_0();
      OUTLINED_FUNCTION_242();
      if (v5 == v4)
      {
LABEL_12:
        OUTLINED_FUNCTION_16_16();
        OUTLINED_FUNCTION_6_4();
        OUTLINED_FUNCTION_138_1();
        return 0;
      }
      v14 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v14;
        OUTLINED_FUNCTION_225_0();
        if ((v15 & 1) == 0)
          break;
        OUTLINED_FUNCTION_170_1();
        NWConnection.identifier.getter();
        OUTLINED_FUNCTION_207_0();
        OUTLINED_FUNCTION_242();
        if (v5 == v4)
          goto LABEL_12;
      }
    }
    OUTLINED_FUNCTION_6_4();
    v25 = OUTLINED_FUNCTION_173_1();
    OUTLINED_FUNCTION_233_0();
    v26 = OUTLINED_FUNCTION_85_1();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v26, v12, v25);
    *v2 = v27;
    goto LABEL_20;
  }
  if (v3 < 0)
    v7 = v3;
  else
    v7 = v3 & 0xFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_47_3();
  OUTLINED_FUNCTION_85_1();
  v8 = __CocoaSet.member(for:)();
  OUTLINED_FUNCTION_16_16();
  if (v8)
  {
    OUTLINED_FUNCTION_6_4();
    OUTLINED_FUNCTION_16_16();
    type metadata accessor for NWConnection();
    OUTLINED_FUNCTION_78_1();
    OUTLINED_FUNCTION_210_0();
    *v0 = v27;
    OUTLINED_FUNCTION_5_16();
    return 0;
  }
  result = __CocoaSet.count.getter();
  if (!__OFADD__(result, 1))
  {
    specialized _NativeSet.init(_:capacity:)(v7, result + 1, v17, v18, v19, v20, v21, v22, v27, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
      v39);
    v28 = v23;
    if (*(_QWORD *)(v23 + 24) <= *(_QWORD *)(v23 + 16))
    {
      OUTLINED_FUNCTION_85_1();
      specialized _NativeSet.resize(capacity:)();
      v24 = v28;
    }
    else
    {
      v24 = v23;
      OUTLINED_FUNCTION_85_1();
    }
    specialized _NativeSet._unsafeInsertNew(_:)();
    *v2 = v24;
LABEL_20:
    swift_bridgeObjectRelease();
    *v0 = v1;
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(char *a1, const void *a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  _BYTE v29[120];
  _OWORD __src[4];
  uint64_t v31;
  char v32;
  __int128 v33;
  char v34;
  uint64_t v35;
  char v36;
  char v37;

  OUTLINED_FUNCTION_114_2(v29, a2);
  v6 = *v2;
  OUTLINED_FUNCTION_114_2(__src, a2);
  Hasher.init(_seed:)();
  OUTLINED_FUNCTION_47_3();
  ConnectionPolicyRoute.hash(into:)();
  Hasher._finalize()();
  OUTLINED_FUNCTION_229_0();
  if (((*(_QWORD *)(v6 + 56 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
  {
    v8 = ~v7;
    while (1)
    {
      OUTLINED_FUNCTION_139_1();
      __src[0] = *v9;
      __src[1] = v9[1];
      __src[2] = v9[2];
      __src[3] = v9[3];
      v31 = v10;
      v32 = v11;
      v33 = v9[5];
      v34 = v12;
      v35 = v13;
      v36 = v14;
      v37 = v15;
      if (static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)__src, (uint64_t)v29))
        break;
      v3 = (v3 + 1) & v8;
      if (((*(_QWORD *)(v6 + 56 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) == 0)
        goto LABEL_5;
    }
    OUTLINED_FUNCTION_6_4();
    outlined release of ConnectionPolicyRoute((uint64_t)a2);
    v18 = *(_QWORD *)(*v2 + 48) + 120 * v3;
    v19 = *(_QWORD *)(v18 + 40);
    v20 = *(_QWORD *)(v18 + 64);
    v21 = *(_BYTE *)(v18 + 72);
    v23 = *(_QWORD *)(v18 + 80);
    v22 = *(_QWORD *)(v18 + 88);
    v24 = *(_BYTE *)(v18 + 96);
    v25 = *(_QWORD *)(v18 + 104);
    v26 = *(_BYTE *)(v18 + 112);
    v27 = *(_BYTE *)(v18 + 113);
    *(_QWORD *)a1 = *(_QWORD *)v18;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v18 + 8);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(v18 + 24);
    *((_QWORD *)a1 + 5) = v19;
    *((_OWORD *)a1 + 3) = *(_OWORD *)(v18 + 48);
    *((_QWORD *)a1 + 8) = v20;
    a1[72] = v21;
    *((_QWORD *)a1 + 10) = v23;
    *((_QWORD *)a1 + 11) = v22;
    a1[96] = v24;
    *((_QWORD *)a1 + 13) = v25;
    a1[112] = v26;
    a1[113] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_15();
    return 0;
  }
  else
  {
LABEL_5:
    OUTLINED_FUNCTION_6_4();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_114_2(__src, v29);
    v28 = *v2;
    *v2 = 0x8000000000000000;
    outlined retain of ConnectionPolicyRoute((uint64_t)__src);
    specialized _NativeSet.insertNew(_:at:isUnique:)(__src, v3, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_114_2(a1, __src);
    return 1;
  }
}

void specialized Set._Variant.insert(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  char v30;
  uint64_t v31;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[65];

  OUTLINED_FUNCTION_158_2();
  if (v5)
  {
    Hasher.init(_seed:)();
    OUTLINED_FUNCTION_47_3();
    specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)v51);
    Hasher._finalize()();
    OUTLINED_FUNCTION_229_0();
    if (((*(_QWORD *)(v3 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
    {
      v9 = ~v8;
      while (1)
      {
        OUTLINED_FUNCTION_28(v51, (const void *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v4) + 40));
        OUTLINED_FUNCTION_28(&v29, (const void *)(v1 + 40));
        if (static ConnectionConfiguration.== infix(_:_:)((uint64_t)v51, (uint64_t)&v29))
          break;
        v4 = (v4 + 1) & v9;
        if (((*(_QWORD *)(v3 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) == 0)
          goto LABEL_11;
      }
      OUTLINED_FUNCTION_16_16();
      OUTLINED_FUNCTION_6_4();
      OUTLINED_FUNCTION_138_1();
      goto LABEL_20;
    }
LABEL_11:
    OUTLINED_FUNCTION_6_4();
    v10 = OUTLINED_FUNCTION_173_1();
    v51[0] = *v2;
    *v2 = 0x8000000000000000;
    v11 = OUTLINED_FUNCTION_85_1();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v11, v4, v10, v12, v13, v14, v15, v16);
    *v2 = v51[0];
    goto LABEL_19;
  }
  if (v3 < 0)
    v6 = v3;
  else
    v6 = v3 & 0xFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_47_3();
  OUTLINED_FUNCTION_85_1();
  v7 = __CocoaSet.member(for:)();
  OUTLINED_FUNCTION_16_16();
  if (v7)
  {
    OUTLINED_FUNCTION_6_4();
    OUTLINED_FUNCTION_16_16();
    v29 = v7;
    type metadata accessor for BackgroundConnection();
    OUTLINED_FUNCTION_78_1();
    OUTLINED_FUNCTION_210_0();
    *v0 = v51[0];
    OUTLINED_FUNCTION_5_16();
LABEL_20:
    OUTLINED_FUNCTION_1_1();
    return;
  }
  v17 = __CocoaSet.count.getter();
  if (!__OFADD__(v17, 1))
  {
    v18 = specialized _NativeSet.init(_:capacity:)(v6, v17 + 1);
    v51[0] = v18;
    v19 = *(_QWORD *)(v18 + 16);
    if (*(_QWORD *)(v18 + 24) <= v19)
    {
      v21 = v19 + 1;
      OUTLINED_FUNCTION_85_1();
      specialized _NativeSet.resize(capacity:)(v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39,
        v40,
        v41,
        v42,
        v43,
        v44,
        v45,
        v46,
        v47,
        v48,
        v49,
        v50);
      v20 = v51[0];
    }
    else
    {
      v20 = v18;
      OUTLINED_FUNCTION_85_1();
    }
    specialized _NativeSet._unsafeInsertNew(_:)();
    *v2 = v20;
LABEL_19:
    swift_bridgeObjectRelease();
    *v0 = v1;
    goto LABEL_20;
  }
  __break(1u);
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  __int128 v14;
  uint64_t v16;
  _BYTE v17[40];

  v3 = v2;
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 40);
  OUTLINED_FUNCTION_9_10();
  v8 = AnyHashable._rawHashValue(seed:)(v7);
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      outlined init with copy of AnyHashable(*(_QWORD *)(v6 + 48) + 40 * v10, (uint64_t)v17);
      v12 = MEMORY[0x24956D3DC](v17, a2);
      outlined destroy of AnyHashable((uint64_t)v17);
      if ((v12 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    outlined destroy of AnyHashable(a2);
    outlined init with copy of AnyHashable(*(_QWORD *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    v13 = OUTLINED_FUNCTION_173_1();
    outlined init with copy of AnyHashable(a2, (uint64_t)v17);
    OUTLINED_FUNCTION_233_0();
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v17, v10, v13);
    OUTLINED_FUNCTION_232_0(v16);
    v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v14;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

void specialized _NativeSet.resize(capacity:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt64 v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  char v18;

  OUTLINED_FUNCTION_165_1();
  OUTLINED_FUNCTION_156_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  v6 = OUTLINED_FUNCTION_108_1();
  if (*(_QWORD *)(v1 + 16))
  {
    OUTLINED_FUNCTION_26_8();
    v0 = 0;
    if (!v3)
      goto LABEL_4;
LABEL_3:
    OUTLINED_FUNCTION_159_2();
    while (1)
    {
      OUTLINED_FUNCTION_114_1();
      v9 = NWConnection.identifier.getter();
      Hasher._combine(_:)(v9);
      OUTLINED_FUNCTION_103_2();
      OUTLINED_FUNCTION_100_0();
      if (v10)
      {
        OUTLINED_FUNCTION_21_5();
        while (++v13 != v14 || (v12 & 1) == 0)
        {
          v15 = v13 == v14;
          if (v13 == v14)
            v13 = 0;
          v12 |= v15;
          if (*(_QWORD *)(v5 + 8 * v13) != -1)
          {
            OUTLINED_FUNCTION_20_8();
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_23_4();
LABEL_25:
      OUTLINED_FUNCTION_39_6(v11);
      if (v3)
        goto LABEL_3;
LABEL_4:
      v7 = v0 + 1;
      if (__OFADD__(v0, 1))
        goto LABEL_33;
      if (v7 >= v4)
        goto LABEL_27;
      ++v0;
      if (!v2[v7])
      {
        v0 = v7 + 1;
        if (v7 + 1 >= v4)
          goto LABEL_27;
        if (!v2[v0])
        {
          v8 = v7 + 2;
          if (v8 >= v4)
          {
LABEL_27:
            OUTLINED_FUNCTION_16_16();
            OUTLINED_FUNCTION_155_2();
            if (v17 ^ v18 | v10)
              *v2 = -1 << v16;
            else
              OUTLINED_FUNCTION_128_2(v16);
            *(_QWORD *)(v1 + 16) = 0;
            break;
          }
          if (!v2[v8])
          {
            while (1)
            {
              v0 = v8 + 1;
              if (__OFADD__(v8, 1))
                goto LABEL_34;
              if (v0 >= v4)
                goto LABEL_27;
              ++v8;
              if (v2[v0])
                goto LABEL_15;
            }
          }
          v0 = v8;
        }
      }
LABEL_15:
      OUTLINED_FUNCTION_208();
    }
  }
  OUTLINED_FUNCTION_16_16();
  *(_QWORD *)v0 = v6;
  OUTLINED_FUNCTION_79_2();
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  Swift::UInt v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    if (!v9)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + i);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v17);
      result = Hasher._finalize()();
      v18 = -1 << *(_BYTE *)(v4 + 32);
      v19 = result & ~v18;
      v20 = v19 >> 6;
      if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          v24 = v20 == v23;
          if (v20 == v23)
            v20 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            v21 = __clz(__rbit64(~v25)) + (v20 << 6);
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
      v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v21) = v17;
      ++*(_QWORD *)(v4 + 16);
      if (v9)
        goto LABEL_6;
LABEL_7:
      v14 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v14 >= v10)
        goto LABEL_32;
      v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        v5 = v14 + 1;
        if (v14 + 1 >= v10)
          goto LABEL_32;
        v15 = v6[v5];
        if (!v15)
        {
          v5 = v14 + 2;
          if (v14 + 2 >= v10)
            goto LABEL_32;
          v15 = v6[v5];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              v26 = 1 << *(_BYTE *)(v2 + 32);
              if (v26 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v26 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v26;
              v1 = v0;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                v5 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v5 >= v10)
                  goto LABEL_32;
                v15 = v6[v5];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v5 = v16;
          }
        }
      }
LABEL_20:
      v9 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

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
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
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
      v18 = *(_QWORD *)(v2 + 48) + 40 * i;
      v29 = *(_OWORD *)v18;
      v30 = *(_OWORD *)(v18 + 16);
      v31 = *(_QWORD *)(v18 + 32);
      result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
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
      v27 = *(_QWORD *)(v4 + 48) + 40 * v22;
      *(_OWORD *)v27 = v29;
      *(_OWORD *)(v27 + 16) = v30;
      *(_QWORD *)(v27 + 32) = v31;
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
              v1 = v0;
              v28 = 1 << *(_BYTE *)(v2 + 32);
              if (v28 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v28 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v28;
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

unint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
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
  uint64_t *v26;
  _QWORD *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  v2 = static _SetStorage.resize(original:capacity:move:)();
  v3 = v2;
  if (*(_QWORD *)(v1 + 16))
  {
    v4 = 1 << *(_BYTE *)(v1 + 32);
    v27 = (_QWORD *)(v1 + 56);
    if (v4 < 64)
      v5 = ~(-1 << v4);
    else
      v5 = -1;
    v6 = v5 & *(_QWORD *)(v1 + 56);
    v28 = (unint64_t)(v4 + 63) >> 6;
    v29 = v2 + 56;
    v30 = v1;
    result = swift_retain();
    v8 = 0;
    if (!v6)
      goto LABEL_7;
LABEL_6:
    v39 = (v6 - 1) & v6;
    v40 = v8;
    v9 = __clz(__rbit64(v6)) | (v8 << 6);
    v10 = v30;
    while (1)
    {
      v15 = *(_QWORD *)(v10 + 48) + 120 * v9;
      v17 = *(_QWORD *)v15;
      v16 = *(_QWORD *)(v15 + 8);
      v19 = *(_QWORD *)(v15 + 16);
      v18 = *(_QWORD *)(v15 + 24);
      v21 = *(_QWORD *)(v15 + 32);
      v20 = *(_QWORD *)(v15 + 40);
      v22 = *(_QWORD *)(v15 + 56);
      v38 = *(_QWORD *)(v15 + 48);
      v23 = *(_QWORD *)(v15 + 64);
      v37 = *(_BYTE *)(v15 + 72);
      v35 = *(_QWORD *)(v15 + 88);
      v36 = *(_QWORD *)(v15 + 80);
      v34 = *(_BYTE *)(v15 + 96);
      v33 = *(_QWORD *)(v15 + 104);
      v31 = *(_BYTE *)(v15 + 113);
      v32 = *(_BYTE *)(v15 + 112);
      Hasher.init(_seed:)();
      ConnectionPolicyRoute.hash(into:)();
      Hasher._finalize()();
      result = _HashTable.nextHole(atOrAfter:)();
      *(_QWORD *)(v29 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      v24 = *(_QWORD *)(v3 + 48) + 120 * result;
      *(_QWORD *)v24 = v17;
      *(_QWORD *)(v24 + 8) = v16;
      *(_QWORD *)(v24 + 16) = v19;
      *(_QWORD *)(v24 + 24) = v18;
      *(_QWORD *)(v24 + 32) = v21;
      *(_QWORD *)(v24 + 40) = v20;
      *(_QWORD *)(v24 + 48) = v38;
      *(_QWORD *)(v24 + 56) = v22;
      *(_QWORD *)(v24 + 64) = v23;
      *(_BYTE *)(v24 + 72) = v37;
      *(_QWORD *)(v24 + 80) = v36;
      *(_QWORD *)(v24 + 88) = v35;
      *(_BYTE *)(v24 + 96) = v34;
      *(_QWORD *)(v24 + 104) = v33;
      *(_BYTE *)(v24 + 112) = v32;
      *(_BYTE *)(v24 + 113) = v31;
      ++*(_QWORD *)(v3 + 16);
      v6 = v39;
      v8 = v40;
      if (v39)
        goto LABEL_6;
LABEL_7:
      v11 = v8 + 1;
      v10 = v30;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v11 >= v28)
        goto LABEL_23;
      v12 = v27[v11];
      v13 = v8 + 1;
      if (!v12)
      {
        v13 = v8 + 2;
        if (v8 + 2 >= v28)
          goto LABEL_23;
        v12 = v27[v13];
        if (!v12)
        {
          v13 = v8 + 3;
          if (v8 + 3 >= v28)
            goto LABEL_23;
          v12 = v27[v13];
          if (!v12)
          {
            v14 = v8 + 4;
            if (v8 + 4 >= v28)
            {
LABEL_23:
              swift_release();
              v25 = 1 << *(_BYTE *)(v30 + 32);
              if (v25 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v25 + 63) >> 6, v27);
              else
                *v27 = -1 << v25;
              *(_QWORD *)(v30 + 16) = 0;
              break;
            }
            v12 = v27[v14];
            if (!v12)
            {
              while (1)
              {
                v13 = v14 + 1;
                if (__OFADD__(v14, 1))
                  goto LABEL_29;
                if (v13 >= v28)
                  goto LABEL_23;
                v12 = v27[v13];
                ++v14;
                if (v12)
                  goto LABEL_20;
              }
            }
            v13 = v8 + 4;
          }
        }
      }
LABEL_20:
      v39 = (v12 - 1) & v12;
      v40 = v13;
      v9 = __clz(__rbit64(v12)) + (v13 << 6);
    }
  }
  result = swift_release();
  *v26 = v3;
  return result;
}

void specialized _NativeSet.resize(capacity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  char v49;
  char v50;

  OUTLINED_FUNCTION_165_1();
  a29 = v36;
  a30 = v37;
  OUTLINED_FUNCTION_156_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  v38 = OUTLINED_FUNCTION_108_1();
  if (*(_QWORD *)(v31 + 16))
  {
    OUTLINED_FUNCTION_26_8();
    v30 = 0;
    if (!v33)
      goto LABEL_4;
LABEL_3:
    OUTLINED_FUNCTION_159_2();
    while (1)
    {
      OUTLINED_FUNCTION_114_1();
      specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)&a10);
      OUTLINED_FUNCTION_103_2();
      OUTLINED_FUNCTION_100_0();
      if (v42)
      {
        OUTLINED_FUNCTION_21_5();
        while (++v45 != v46 || (v44 & 1) == 0)
        {
          v47 = v45 == v46;
          if (v45 == v46)
            v45 = 0;
          v44 |= v47;
          if (*(_QWORD *)(v35 + 8 * v45) != -1)
          {
            OUTLINED_FUNCTION_20_8();
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_23_4();
LABEL_27:
      OUTLINED_FUNCTION_39_6(v43);
      if (v33)
        goto LABEL_3;
LABEL_4:
      v39 = v30 + 1;
      if (__OFADD__(v30, 1))
        goto LABEL_35;
      if (v39 >= v34)
        goto LABEL_29;
      v40 = v32[v39];
      ++v30;
      if (!v40)
      {
        v30 = v39 + 1;
        if (v39 + 1 >= v34)
          goto LABEL_29;
        v40 = v32[v30];
        if (!v40)
        {
          v30 = v39 + 2;
          if (v39 + 2 >= v34)
            goto LABEL_29;
          v40 = v32[v30];
          if (!v40)
          {
            v41 = v39 + 3;
            if (v41 >= v34)
            {
LABEL_29:
              OUTLINED_FUNCTION_16_16();
              OUTLINED_FUNCTION_155_2();
              if (v49 ^ v50 | v42)
                *v32 = -1 << v48;
              else
                OUTLINED_FUNCTION_128_2(v48);
              *(_QWORD *)(v31 + 16) = 0;
              break;
            }
            v40 = v32[v41];
            if (!v40)
            {
              while (1)
              {
                v30 = v41 + 1;
                if (__OFADD__(v41, 1))
                  goto LABEL_36;
                if (v30 >= v34)
                  goto LABEL_29;
                v40 = v32[v30];
                ++v41;
                if (v40)
                  goto LABEL_17;
              }
            }
            v30 = v41;
          }
        }
      }
LABEL_17:
      v33 = (v40 - 1) & v40;
    }
  }
  OUTLINED_FUNCTION_16_16();
  *(_QWORD *)v30 = v38;
  OUTLINED_FUNCTION_79_2();
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t *v3;
  Swift::UInt v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v5);
  result = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(unsigned __int8 *)(v10 + a2) == (_DWORD)v5)
    {
LABEL_13:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(unsigned __int8 *)(v10 + a2) == (_DWORD)v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v12 + 48) + a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::UInt64 v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v9 = *v3;
  Hasher.init(_seed:)();
  v10 = NWConnection.identifier.getter();
  Hasher._combine(_:)(v10);
  v11 = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for NWConnection();
    swift_retain();
    v13 = NWConnection.identifier.getter();
    v14 = NWConnection.identifier.getter();
    swift_release();
    if (v13 == v14)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v15 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v15;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        swift_retain();
        v16 = NWConnection.identifier.getter();
        v17 = NWConnection.identifier.getter();
        swift_release();
        if (v16 == v17)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v18 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v18 + 48) + 8 * a2) = a1;
  v19 = *(_QWORD *)(v18 + 16);
  v20 = __OFADD__(v19, 1);
  v21 = v19 + 1;
  if (v20)
    __break(1u);
  else
    *(_QWORD *)(v18 + 16) = v21;
}

{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _BYTE v20[40];

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v8 > v7)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v9 = *v3;
  v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      outlined init with copy of AnyHashable(*(_QWORD *)(v9 + 48) + 40 * a2, (uint64_t)v20);
      v13 = MEMORY[0x24956D3DC](v20, a1);
      outlined destroy of AnyHashable((uint64_t)v20);
      if ((v13 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v12;
    }
    while (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v15 = *(_QWORD *)(v14 + 48) + 40 * a2;
  v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v15 = *(_OWORD *)a1;
  *(_OWORD *)(v15 + 16) = v16;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (!v18)
  {
    *(_QWORD *)(v14 + 16) = v19;
    return;
  }
  __break(1u);
LABEL_15:
  ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(void *__src, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  _BYTE v30[114];
  _BYTE __dst[120];

  v4 = v3;
  memcpy(__dst, __src, 0x72uLL);
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v9 > v8)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v10 = *v4;
  memcpy(v30, __src, sizeof(v30));
  Hasher.init(_seed:)();
  ConnectionPolicyRoute.hash(into:)();
  v11 = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  v13 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v10 + 48);
    do
    {
      v16 = v15 + 120 * a2;
      v17 = *(_QWORD *)(v16 + 64);
      v18 = *(_BYTE *)(v16 + 72);
      v19 = *(_BYTE *)(v16 + 96);
      v20 = *(_QWORD *)(v16 + 104);
      v21 = *(_BYTE *)(v16 + 112);
      v22 = *(_BYTE *)(v16 + 113);
      v23 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)v30 = *(_OWORD *)v16;
      *(_OWORD *)&v30[16] = v23;
      v24 = *(_OWORD *)(v16 + 48);
      *(_OWORD *)&v30[32] = *(_OWORD *)(v16 + 32);
      *(_OWORD *)&v30[48] = v24;
      *(_QWORD *)&v30[64] = v17;
      v30[72] = v18;
      *(_OWORD *)&v30[80] = *(_OWORD *)(v16 + 80);
      v30[96] = v19;
      *(_QWORD *)&v30[104] = v20;
      v30[112] = v21;
      v30[113] = v22;
      if (static ConnectionPolicyRoute.== infix(_:_:)((uint64_t)v30, (uint64_t)__dst))
        goto LABEL_15;
      a2 = (a2 + 1) & v14;
    }
    while (((*(_QWORD *)(v13 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v25 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (uint64_t)memcpy((void *)(*(_QWORD *)(v25 + 48) + 120 * a2), __src, 0x72uLL);
  v27 = *(_QWORD *)(v25 + 16);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (!v28)
  {
    *(_QWORD *)(v25 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21[65];
  _BYTE __dst[520];

  v9 = a2;
  v11 = *(_QWORD *)(*v8 + 16);
  v12 = *(_QWORD *)(*v8 + 24);
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)(v11 + 1, a2, a3, a4, a5, a6, a7, a8, v21[0], v21[1], v21[2], v21[3], v21[4], v21[5], v21[6], v21[7], v21[8], v21[9], v21[10],
      v21[11],
      v21[12],
      v21[13],
      v21[14],
      v21[15],
      v21[16],
      v21[17],
      v21[18],
      v21[19],
      v21[20],
      v21[21]);
  }
  else
  {
    if (v12 > v11)
    {
      specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v13 = *v8;
  Hasher.init(_seed:)();
  specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)__dst);
  v14 = Hasher._finalize()();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  v9 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v16 = ~v15;
    do
    {
      memcpy(__dst, (const void *)(*(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * v9) + 40), 0x204uLL);
      memcpy(v21, (const void *)(a1 + 40), 0x204uLL);
      if (static ConnectionConfiguration.== infix(_:_:)((uint64_t)__dst, (uint64_t)v21))
        goto LABEL_15;
      v9 = (v9 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
LABEL_12:
  v17 = *v8;
  *(_QWORD *)(*v8 + 8 * (v9 >> 6) + 56) |= 1 << v9;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * v9) = a1;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (!v19)
  {
    *(_QWORD *)(v17 + 16) = v20;
    return;
  }
  __break(1u);
LABEL_15:
  type metadata accessor for BackgroundConnection();
  ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

void specialized _NativeSet.copy()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  OUTLINED_FUNCTION_87_3();
  OUTLINED_FUNCTION_244();
  if (!v5)
  {
LABEL_24:
    OUTLINED_FUNCTION_16_16();
    *v0 = v0;
    OUTLINED_FUNCTION_10_4();
    return;
  }
  v6 = (void *)OUTLINED_FUNCTION_12_17();
  if (v9)
    v10 = (unint64_t)v6 >= v8;
  else
    v10 = 1;
  if (v10)
    OUTLINED_FUNCTION_71_3(v6, v7);
  OUTLINED_FUNCTION_9_23();
  if (!v4)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_65_2();
  while (1)
  {
    OUTLINED_FUNCTION_148_1(v11);
    if (v4)
      goto LABEL_9;
LABEL_10:
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v12 >= v2)
      goto LABEL_24;
    ++v3;
    if (!*(_QWORD *)(v1 + 8 * v12))
    {
      v3 = v12 + 1;
      if (v12 + 1 >= v2)
        goto LABEL_24;
      if (!*(_QWORD *)(v1 + 8 * v3))
        break;
    }
LABEL_21:
    OUTLINED_FUNCTION_208();
    v11 = v14 + (v3 << 6);
  }
  v13 = v12 + 2;
  if (v13 >= v2)
    goto LABEL_24;
  if (*(_QWORD *)(v1 + 8 * v13))
  {
    v3 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v2)
      goto LABEL_24;
    ++v13;
    if (*(_QWORD *)(v1 + 8 * v3))
      goto LABEL_21;
  }
LABEL_26:
  __break(1u);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t *v37;

  OUTLINED_FUNCTION_48_2();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  v37 = v0;
  v3 = *v0;
  v4 = v2;
  static _SetStorage.copy(original:)();
  OUTLINED_FUNCTION_244();
  if (!v5)
  {
LABEL_28:
    OUTLINED_FUNCTION_16_16();
    *v37 = v4;
    OUTLINED_FUNCTION_17_5();
    return;
  }
  v6 = (void *)OUTLINED_FUNCTION_12_17();
  if (v9)
    v10 = (unint64_t)v6 >= v8;
  else
    v10 = 1;
  if (v10)
    OUTLINED_FUNCTION_71_3(v6, v7);
  v11 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v3 + 16);
  v12 = 1 << *(_BYTE *)(v3 + 32);
  v13 = *(_QWORD *)(v3 + 56);
  v14 = -1;
  if (v12 < 64)
    v14 = ~(-1 << v12);
  v15 = v14 & v13;
  v16 = (unint64_t)(v12 + 63) >> 6;
  if ((v14 & v13) == 0)
    goto LABEL_12;
LABEL_11:
  v17 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (i = v17 | (v11 << 6); ; i = __clz(__rbit64(v20)) + (v11 << 6))
  {
    v22 = 120 * i;
    v23 = *(_QWORD *)(v3 + 48) + v22;
    v24 = *(_QWORD *)(v23 + 40);
    v25 = *(_QWORD *)(v23 + 64);
    v26 = *(_BYTE *)(v23 + 72);
    v28 = *(_QWORD *)(v23 + 80);
    v27 = *(_QWORD *)(v23 + 88);
    v29 = *(_BYTE *)(v23 + 96);
    v30 = *(_QWORD *)(v23 + 104);
    v31 = *(_BYTE *)(v23 + 112);
    v32 = *(_BYTE *)(v23 + 113);
    v33 = *(_QWORD *)(v4 + 48) + v22;
    v34 = *(_OWORD *)(v23 + 8);
    v35 = *(_OWORD *)(v23 + 24);
    v36 = *(_OWORD *)(v23 + 48);
    *(_QWORD *)v33 = *(_QWORD *)v23;
    *(_OWORD *)(v33 + 8) = v34;
    *(_OWORD *)(v33 + 24) = v35;
    *(_QWORD *)(v33 + 40) = v24;
    *(_OWORD *)(v33 + 48) = v36;
    *(_QWORD *)(v33 + 64) = v25;
    *(_BYTE *)(v33 + 72) = v26;
    *(_QWORD *)(v33 + 80) = v28;
    *(_QWORD *)(v33 + 88) = v27;
    *(_BYTE *)(v33 + 96) = v29;
    *(_QWORD *)(v33 + 104) = v30;
    *(_BYTE *)(v33 + 112) = v31;
    *(_BYTE *)(v33 + 113) = v32;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_10();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_12_6();
    OUTLINED_FUNCTION_47_3();
    if (v15)
      goto LABEL_11;
LABEL_12:
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v16)
      goto LABEL_28;
    v20 = *(_QWORD *)(v1 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v16)
        goto LABEL_28;
      v20 = *(_QWORD *)(v1 + 8 * v11);
      if (!v20)
      {
        v11 = v19 + 2;
        if (v19 + 2 >= v16)
          goto LABEL_28;
        v20 = *(_QWORD *)(v1 + 8 * v11);
        if (!v20)
          break;
      }
    }
LABEL_25:
    v15 = (v20 - 1) & v20;
  }
  v21 = v19 + 3;
  if (v21 >= v16)
    goto LABEL_28;
  v20 = *(_QWORD *)(v1 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v16)
      goto LABEL_28;
    v20 = *(_QWORD *)(v1 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  OUTLINED_FUNCTION_87_3();
  OUTLINED_FUNCTION_244();
  if (!v5)
  {
LABEL_26:
    OUTLINED_FUNCTION_16_16();
    *v0 = v0;
    OUTLINED_FUNCTION_10_4();
    return;
  }
  v6 = (void *)OUTLINED_FUNCTION_12_17();
  if (v9)
    v10 = (unint64_t)v6 >= v8;
  else
    v10 = 1;
  if (v10)
    OUTLINED_FUNCTION_71_3(v6, v7);
  OUTLINED_FUNCTION_9_23();
  if (!v4)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_65_2();
  while (1)
  {
    OUTLINED_FUNCTION_148_1(v11);
    if (v4)
      goto LABEL_9;
LABEL_10:
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v2)
      goto LABEL_26;
    ++v3;
    if (!*(_QWORD *)(v1 + 8 * v12))
    {
      v3 = v12 + 1;
      if (v12 + 1 >= v2)
        goto LABEL_26;
      if (!*(_QWORD *)(v1 + 8 * v3))
      {
        v3 = v12 + 2;
        if (v12 + 2 >= v2)
          goto LABEL_26;
        if (!*(_QWORD *)(v1 + 8 * v3))
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_153_2();
  }
  v13 = v12 + 3;
  if (v13 >= v2)
    goto LABEL_26;
  if (*(_QWORD *)(v1 + 8 * v13))
  {
    v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v2)
      goto LABEL_26;
    ++v13;
    if (*(_QWORD *)(v1 + 8 * v3))
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  OUTLINED_FUNCTION_87_3();
  OUTLINED_FUNCTION_244();
  if (!v6)
  {
LABEL_26:
    OUTLINED_FUNCTION_16_16();
    *v0 = v0;
    OUTLINED_FUNCTION_251();
    return;
  }
  v7 = (void *)OUTLINED_FUNCTION_12_17();
  if (v10)
    v11 = (unint64_t)v7 >= v9;
  else
    v11 = 1;
  if (v11)
    OUTLINED_FUNCTION_71_3(v7, v8);
  OUTLINED_FUNCTION_9_23();
  if (!v5)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_65_2();
  while (1)
  {
    v15 = 5 * v12;
    outlined init with copy of AnyHashable(*(_QWORD *)(v1 + 48) + 40 * v12, (uint64_t)v19);
    v16 = v0[6] + 8 * v15;
    v17 = v19[0];
    v18 = v19[1];
    *(_QWORD *)(v16 + 32) = v20;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    if (v5)
      goto LABEL_9;
LABEL_10:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v13 >= v3)
      goto LABEL_26;
    ++v4;
    if (!*(_QWORD *)(v2 + 8 * v13))
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v3)
        goto LABEL_26;
      if (!*(_QWORD *)(v2 + 8 * v4))
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v3)
          goto LABEL_26;
        if (!*(_QWORD *)(v2 + 8 * v4))
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_153_2();
  }
  v14 = v13 + 3;
  if (v14 >= v3)
    goto LABEL_26;
  if (*(_QWORD *)(v2 + 8 * v14))
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v3)
      goto LABEL_26;
    ++v14;
    if (*(_QWORD *)(v2 + 8 * v4))
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

void *specialized _NativeSet.copy()()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + i) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + i);
    if (v12)
      goto LABEL_11;
LABEL_12:
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
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
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
  uint64_t v18;
  Swift::UInt64 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NWConnection>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = v2 + 56;
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain_n();
    v12 = 0;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      Hasher.init(_seed:)();
      swift_retain();
      v19 = NWConnection.identifier.getter();
      Hasher._combine(_:)(v19);
      result = Hasher._finalize()();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_27:
      *(_QWORD *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v23) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_33;
      if (v15 >= v9)
        goto LABEL_29;
      v16 = *(_QWORD *)(v6 + 8 * v15);
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_29;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
        {
          v17 = v15 + 2;
          if (v17 >= v9)
          {
LABEL_29:
            result = swift_release_n();
            v1 = v0;
            goto LABEL_31;
          }
          v16 = *(_QWORD *)(v6 + 8 * v17);
          v12 = v17;
          if (!v16)
            break;
        }
      }
LABEL_17:
      v8 = (v16 - 1) & v16;
    }
    while (1)
    {
      v12 = v17 + 1;
      if (__OFADD__(v17, 1))
        break;
      if (v12 >= v9)
        goto LABEL_29;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      ++v17;
      if (v16)
        goto LABEL_17;
    }
LABEL_34:
    __break(1u);
  }
  else
  {
    result = swift_release();
LABEL_31:
    *v1 = v4;
  }
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  Swift::UInt v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionMethod>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + i);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v17);
    result = Hasher._finalize()();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  char v27[72];

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<BackgroundConnection>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
    Hasher.init(_seed:)();
    swift_retain();
    specialized BackgroundConnectionProtocol.hash(into:)((uint64_t)v27);
    result = Hasher._finalize()();
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
    v1 = v0;
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
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];
  uint64_t v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
    outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * i, (uint64_t)v29);
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v10 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v10 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v10 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v4 + 48) + 40 * v21;
    v27 = v29[0];
    v28 = v29[1];
    *(_QWORD *)(v26 + 32) = v30;
    *(_OWORD *)v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
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
    v1 = v0;
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

unint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
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
  uint64_t *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<ConnectionPolicyRoute>);
  v2 = static _SetStorage.resize(original:capacity:move:)();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_24:
    result = swift_release();
    *v25 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v26 = v1 + 56;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 56);
  v27 = (unint64_t)(v4 + 63) >> 6;
  v28 = v2 + 56;
  v29 = v1;
  result = swift_retain();
  v8 = 0;
  if (!v6)
    goto LABEL_7;
LABEL_6:
  v38 = (v6 - 1) & v6;
  v39 = v8;
  v9 = __clz(__rbit64(v6)) | (v8 << 6);
  v10 = v29;
  while (1)
  {
    v15 = *(_QWORD *)(v10 + 48) + 120 * v9;
    v16 = *(_QWORD *)v15;
    v17 = *(_QWORD *)(v15 + 8);
    v18 = *(_QWORD *)(v15 + 24);
    v20 = *(_QWORD *)(v15 + 32);
    v19 = *(_QWORD *)(v15 + 40);
    v21 = *(_QWORD *)(v15 + 48);
    v36 = *(_QWORD *)(v15 + 56);
    v37 = *(_QWORD *)(v15 + 16);
    v22 = *(_QWORD *)(v15 + 64);
    v35 = *(_BYTE *)(v15 + 72);
    v23 = *(_QWORD *)(v15 + 88);
    v34 = *(_QWORD *)(v15 + 80);
    v33 = *(_BYTE *)(v15 + 96);
    v32 = *(_QWORD *)(v15 + 104);
    v30 = *(_BYTE *)(v15 + 113);
    v31 = *(_BYTE *)(v15 + 112);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    ConnectionPolicyRoute.hash(into:)();
    Hasher._finalize()();
    result = _HashTable.nextHole(atOrAfter:)();
    *(_QWORD *)(v28 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v24 = *(_QWORD *)(v3 + 48) + 120 * result;
    *(_QWORD *)v24 = v16;
    *(_QWORD *)(v24 + 8) = v17;
    *(_QWORD *)(v24 + 16) = v37;
    *(_QWORD *)(v24 + 24) = v18;
    *(_QWORD *)(v24 + 32) = v20;
    *(_QWORD *)(v24 + 40) = v19;
    *(_QWORD *)(v24 + 48) = v21;
    *(_QWORD *)(v24 + 56) = v36;
    *(_QWORD *)(v24 + 64) = v22;
    *(_BYTE *)(v24 + 72) = v35;
    *(_QWORD *)(v24 + 80) = v34;
    *(_QWORD *)(v24 + 88) = v23;
    *(_BYTE *)(v24 + 96) = v33;
    *(_QWORD *)(v24 + 104) = v32;
    *(_BYTE *)(v24 + 112) = v31;
    *(_BYTE *)(v24 + 113) = v30;
    ++*(_QWORD *)(v3 + 16);
    v6 = v38;
    v8 = v39;
    if (v38)
      goto LABEL_6;
LABEL_7:
    v11 = v8 + 1;
    v10 = v29;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v11 >= v27)
      goto LABEL_23;
    v12 = *(_QWORD *)(v26 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_23;
      v12 = *(_QWORD *)(v26 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_23;
        v12 = *(_QWORD *)(v26 + 8 * v13);
        if (!v12)
          break;
      }
    }
LABEL_20:
    v38 = (v12 - 1) & v12;
    v39 = v13;
    v9 = __clz(__rbit64(v12)) + (v13 << 6);
  }
  v14 = v8 + 4;
  if (v8 + 4 >= v27)
  {
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  v12 = *(_QWORD *)(v26 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v27)
      goto LABEL_23;
    v12 = *(_QWORD *)(v26 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t specialized BackgroundConnection.connectionProvider(_:receivedIntermediateError:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v9 = type metadata accessor for DispatchWorkItemFlags();
  v22 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *(_QWORD *)(a3 + 32);
  v16 = swift_allocObject();
  swift_weakInit();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v16;
  v17[3] = a1;
  v17[4] = a5;
  v17[5] = a2;
  aBlock[4] = partial apply for closure #1 in BackgroundConnection.connectionProvider(_:receivedIntermediateError:);
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_68;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  v19 = a2;
  static DispatchQoS.unspecified.getter();
  v23 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x24956D244](0, v15, v11, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_release();
  return swift_release();
}

uint64_t specialized Connection.didEncounterError(_:error:analysisInfo:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v35 = a3;
  v38 = a2;
  v6 = type metadata accessor for DispatchWorkItemFlags();
  v37 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&object - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v11 = (char *)&object - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&object - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v16, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v18 = result;
    result = swift_unknownObjectRelease();
    if (v18 == a4)
    {
      type metadata accessor for BackgroundConnection();
      result = swift_dynamicCastClass();
      if (result)
      {
        v19 = result;
        swift_retain();
        v32 = v19;
        v20 = BackgroundConnection.getConnectionMethod()();
        object = v20._object;
        countAndFlagsBits = v20._countAndFlagsBits;
        v33 = *(_QWORD *)(a4 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        v34 = swift_allocObject();
        swift_unknownObjectWeakInit();
        outlined init with copy of NetworkConnectionProtocol?(v35, (uint64_t)&object - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
        v21 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
        v22 = (v14 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
        v23 = swift_allocObject();
        v24 = v38;
        *(_QWORD *)(v23 + 16) = v34;
        *(_QWORD *)(v23 + 24) = v24;
        _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0((uint64_t)v15, v23 + v21, &demangling cache variable for type metadata for ConnectionAnalysisInfo?);
        v25 = countAndFlagsBits;
        *(_QWORD *)(v23 + v22) = v32;
        v26 = (uint64_t *)(v23 + ((v22 + 15) & 0xFFFFFFFFFFFFFFF8));
        v27 = (uint64_t)object;
        *v26 = v25;
        v26[1] = v27;
        aBlock[4] = partial apply for closure #1 in Connection.didEncounterError(_:error:analysisInfo:);
        aBlock[5] = v23;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_82;
        v28 = _Block_copy(aBlock);
        swift_retain();
        swift_retain();
        v29 = v38;
        static DispatchQoS.unspecified.getter();
        v39 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x24956D244](0, v11, v8, v28);
        _Block_release(v28);
        swift_release();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v6);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v36);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t specialized Connection.willStartConnection(_:type:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  int v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v22 = a2;
  v5 = type metadata accessor for DispatchWorkItemFlags();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  v15 = v14;
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v17 = result;
    result = swift_unknownObjectRelease();
    if (v17 == a3)
    {
      v21[1] = *(_QWORD *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v19 = swift_allocObject();
      *(_QWORD *)(v19 + 16) = v18;
      *(_QWORD *)(v19 + 24) = a1;
      *(_QWORD *)(v19 + 32) = v15;
      *(_BYTE *)(v19 + 40) = v22;
      aBlock[4] = partial apply for closure #1 in Connection.willStartConnection(_:type:);
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_117;
      v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      static DispatchQoS.unspecified.getter();
      v23 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x24956D244](0, v12, v8, v20);
      _Block_release(v20);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didClose(_:)(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v4 = type metadata accessor for DispatchWorkItemFlags();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v12, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v14 = result;
    result = swift_unknownObjectRelease();
    if (v14 == a2)
    {
      type metadata accessor for BackgroundConnection();
      result = swift_dynamicCastClass();
      if (result)
      {
        v15 = result;
        v21 = *(_QWORD *)(a2 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        v16 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v17 = swift_allocObject();
        *(_QWORD *)(v17 + 16) = v16;
        *(_QWORD *)(v17 + 24) = v15;
        aBlock[4] = partial apply for closure #1 in Connection.didClose(_:);
        aBlock[5] = v17;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_89;
        v20 = _Block_copy(aBlock);
        swift_retain_n();
        swift_retain();
        static DispatchQoS.unspecified.getter();
        v22 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        v18 = v20;
        MEMORY[0x24956D244](0, v11, v7, v20);
        _Block_release(v18);
        swift_release();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t specialized Connection.didOpenConnectionType(_:type:routeId:delay:)(uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v28 = a3;
  v29 = a4;
  v10 = type metadata accessor for DispatchWorkItemFlags();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DispatchQoS();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v18, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v20 = result;
    result = swift_unknownObjectRelease();
    if (v20 == a5)
    {
      type metadata accessor for BackgroundConnection();
      result = swift_dynamicCastClass();
      if (result)
      {
        v21 = result;
        v27 = *(_QWORD *)(a5 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
        v26 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v22 = swift_allocObject();
        *(_QWORD *)(v22 + 16) = v26;
        *(_QWORD *)(v22 + 24) = v21;
        *(_BYTE *)(v22 + 32) = a2;
        v23 = v29;
        *(_QWORD *)(v22 + 40) = v28;
        *(_QWORD *)(v22 + 48) = v23;
        *(double *)(v22 + 56) = a6;
        aBlock[4] = partial apply for closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:);
        aBlock[5] = v22;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_102;
        v28 = _Block_copy(aBlock);
        swift_bridgeObjectRetain();
        swift_retain_n();
        swift_retain();
        static DispatchQoS.unspecified.getter();
        v30 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        v24 = v28;
        MEMORY[0x24956D244](0, v17, v13, v28);
        _Block_release(v24);
        swift_release();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        swift_release();
        return swift_release();
      }
    }
  }
  return result;
}

void specialized Connection.didEncounterIntermediateError(_:error:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *aBlock;
  unint64_t v43;
  uint64_t (*v44)(uint64_t);
  unint64_t v45;
  void (*v46)();
  _QWORD *v47;
  uint64_t v48;

  v6 = type metadata accessor for DispatchWorkItemFlags();
  v41 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  v40 = v14;
  v48 = (uint64_t)a2;
  v15 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  if (swift_dynamicCast())
  {
    v16 = v45 >> 60 == 2;
    outlined consume of NetworkConnectionError(aBlock, v43, (uint64_t)v44, v45, v46);
  }
  else
  {
    v16 = 0;
  }
  v17 = MEMORY[0x24956E090](a1 + 16);
  if (!v17)
    goto LABEL_6;
  v18 = v17;
  swift_unknownObjectRelease();
  if (v18 != a3)
    goto LABEL_6;
  v31 = *(_QWORD *)(a3 + OBJC_IVAR___SNConnectionInternal_activeBackgroundConnection);
  if (v31)
  {
    if (((v31 != a1) & ~v16) == 0)
      goto LABEL_19;
  }
  else if ((v16 & 1) != 0)
  {
LABEL_19:
    v39 = *(_QWORD *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
    v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v36 = (_QWORD *)swift_allocObject();
    v36[2] = v35;
    v36[3] = a1;
    v36[4] = v40;
    v36[5] = a2;
    v46 = partial apply for closure #1 in Connection.didEncounterIntermediateError(_:error:);
    v47 = v36;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v43 = 1107296256;
    v44 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v45 = (unint64_t)&block_descriptor_75;
    v37 = _Block_copy(&aBlock);
    v38 = a2;
    swift_retain();
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v48 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D244](0, v12, v8, v37);
    _Block_release(v37);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
    swift_release();
    return;
  }
LABEL_6:
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
  v20 = a2;
  swift_retain();
  v21 = a2;
  swift_retain();
  v22 = Logger.logObject.getter();
  v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v48 = v26;
    *(_DWORD *)v24 = 136315394;
    v27 = *(_QWORD *)(a1 + 448);
    if (v27 >= 2)
    {
      aBlock = *(void **)(a1 + 440);
      v43 = v27;
      swift_bridgeObjectRetain();
      v28 = String.init<A>(describing:)();
      v30 = v32;
    }
    else
    {
      v28 = implicit closure #4 in implicit closure #3 in Connection.didEncounterIntermediateError(_:error:)();
      v30 = v29;
      swift_bridgeObjectRelease();
    }
    aBlock = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v30, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2112;
    v33 = a2;
    v34 = (void *)_swift_stdlib_bridgeErrorToNSError();
    aBlock = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v25 = v34;

    _os_log_impl(&dword_246EC7000, v22, v23, "Connection - Intermediate Error: Background Connection. Got an intermediate error from inactive background connection route %s. Error: %@", (uint8_t *)v24, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v26, -1, -1);
    MEMORY[0x24956E018](v24, -1, -1);
  }
  else
  {
    swift_release_n();

  }
}

uint64_t specialized Connection.willStartConnection(_:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v6 = type metadata accessor for DispatchWorkItemFlags();
  v22 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  v15 = v14;
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v17 = result;
    result = swift_unknownObjectRelease();
    if (v17 == a3)
    {
      v21[1] = *(_QWORD *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v19 = (_QWORD *)swift_allocObject();
      v19[2] = v18;
      v19[3] = a1;
      v19[4] = v15;
      v19[5] = a2;
      aBlock[4] = partial apply for closure #1 in Connection.willStartConnection(_:with:);
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_30_0;
      v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      static DispatchQoS.unspecified.getter();
      v23 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x24956D244](0, v12, v8, v20);
      _Block_release(v20);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didReceiveAceObject(_:object:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v6 = type metadata accessor for DispatchWorkItemFlags();
  v23 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v13, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  v15 = v14;
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v17 = result;
    result = swift_unknownObjectRelease();
    if (v17 == a3)
    {
      v22[1] = *(_QWORD *)(a3 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v19 = (_QWORD *)swift_allocObject();
      v19[2] = v18;
      v19[3] = a1;
      v19[4] = v15;
      v19[5] = a2;
      aBlock[4] = partial apply for closure #1 in Connection.didReceiveAceObject(_:object:);
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_10_6;
      v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      v21 = a2;
      static DispatchQoS.unspecified.getter();
      v24 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x24956D244](0, v12, v8, v20);
      _Block_release(v20);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t specialized Connection.didReceiveObject(_:object:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v25 = a3;
  v7 = type metadata accessor for DispatchWorkItemFlags();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type BackgroundConnection and conformance BackgroundConnection, v14, (uint64_t (*)(uint64_t))type metadata accessor for BackgroundConnection, (uint64_t)&protocol conformance descriptor for BackgroundConnection);
  v16 = v15;
  result = MEMORY[0x24956E090](a1 + 16);
  if (result)
  {
    v18 = result;
    result = swift_unknownObjectRelease();
    if (v18 == a4)
    {
      v24 = *(_QWORD *)(a4 + OBJC_IVAR___SNConnectionInternal_connectionQueue);
      v19 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = v19;
      v20[3] = a1;
      v20[4] = v16;
      v20[5] = a2;
      v21 = a2;
      v22 = v25;
      v20[6] = v25;
      aBlock[4] = partial apply for closure #1 in Connection.didReceiveObject(_:object:);
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      aBlock[3] = &block_descriptor_16;
      v23 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      outlined copy of Data?(v21, v22);
      static DispatchQoS.unspecified.getter();
      v27 = MEMORY[0x24BEE4AF8];
      lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x24956D244](0, v13, v9, v23);
      _Block_release(v23);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_246F5F794()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246F5F7B8()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_195_1();
  v1 = *(_QWORD *)(v0 + 48);
  if (v1 >> 60 != 15)
    outlined consume of Data._Representation(*(_QWORD *)(v0 + 40), v1);
  return swift_deallocObject();
}

void partial apply for closure #1 in Connection.didReceiveObject(_:object:)()
{
  closure #1 in Connection.didReceiveObject(_:object:)();
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_246F5F81C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_195_1();

  OUTLINED_FUNCTION_105_1();
  return swift_deallocObject();
}

void partial apply for closure #1 in Connection.didReceiveAceObject(_:object:)()
{
  uint64_t v0;

  closure #1 in Connection.didReceiveAceObject(_:object:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_246F5F84C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246F5F870()
{
  return OUTLINED_FUNCTION_30_6((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

void partial apply for closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(error:)(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

id outlined copy of NetworkConnectionError?(id result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  if ((unint64_t)a2 >> 1 != 0xFFFFFFFF || a4 >= 2)
    return outlined copy of NetworkConnectionError(result, a2, a3, a4, a5);
  return result;
}

void outlined consume of NetworkConnectionError?(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  if ((unint64_t)a2 >> 1 != 0xFFFFFFFF || a4 >= 2)
    outlined consume of NetworkConnectionError(a1, a2, a3, a4, a5);
}

uint64_t sub_246F5F8BC()
{
  return objectdestroy_26Tm((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

void partial apply for closure #1 in Connection.willStartConnection(_:with:)()
{
  closure #1 in Connection.willStartConnection(_:with:)();
}

uint64_t siri_kdebug_trace_0()
{
  return kdebug_trace();
}

uint64_t sub_246F5F8E8()
{
  return objectdestroy_15Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

void partial apply for closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1, unint64_t a2, void *a3, char a4)
{
  uint64_t v4;

  closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t outlined init with take of NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  __swift_memcpy40_8(a2, a1);
  return a2;
}

void outlined retain of NetworkConnectionError(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4]);
  OUTLINED_FUNCTION_3();
}

void partial apply for closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1)
{
  uint64_t v1;

  closure #1 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, *(_QWORD *)(v1 + 16), (_QWORD *)(v1 + 24));
}

uint64_t sub_246F5F984()
{
  return OUTLINED_FUNCTION_30_6((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

void partial apply for closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(uint64_t a1)
{
  uint64_t v1;

  closure #2 in closure #1 in BackgroundConnection.setupReadHandlerOnProvider()(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_246F5F99C()
{
  _QWORD *v0;

  outlined consume of Data._Representation(v0[2], v0[3]);
  if (v0[4])
    OUTLINED_FUNCTION_260();
  OUTLINED_FUNCTION_105_1();
  return swift_deallocObject();
}

void partial apply for closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(void *a1, char a2)
{
  uint64_t v2;

  closure #1 in BackgroundConnection.tryToWriteBufferedOutputData(with:)(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(void *))(v2 + 32));
}

void outlined consume of Result<(), Error>(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_246F5F9E0()
{
  return objectdestroy_26Tm((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

uint64_t sub_246F5F9EC()
{
  return objectdestroy_26Tm((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

uint64_t objectdestroy_26Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_195_1();
  a1(*(_QWORD *)(v1 + 40));
  OUTLINED_FUNCTION_105_1();
  return swift_deallocObject();
}

void partial apply for closure #1 in Connection.didEncounterIntermediateError(_:error:)()
{
  closure #1 in Connection.didEncounterIntermediateError(_:error:)();
}

uint64_t sub_246F5FA34()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?)
                 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  OUTLINED_FUNCTION_99();

  v3 = type metadata accessor for ConnectionAnalysisInfo();
  if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v3))
  {
    v4 = type metadata accessor for URL();
    if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v4))
      (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v2, v4);
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in Connection.didEncounterError(_:error:analysisInfo:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ConnectionAnalysisInfo?);
  closure #1 in Connection.didEncounterError(_:error:analysisInfo:)();
}

uint64_t sub_246F5FB8C()
{
  return OUTLINED_FUNCTION_30_6((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

void partial apply for closure #1 in Connection.didClose(_:)()
{
  closure #1 in Connection.didClose(_:)();
}

uint64_t sub_246F5FBA0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    OUTLINED_FUNCTION_261();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in BackgroundConnection.sendCommands(_:with:)(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_QWORD, uint64_t);

  v2 = *(void (**)(_QWORD, uint64_t))(v1 + 16);
  if (v2)
    v2(*(_QWORD *)(v1 + 32), a1);
  OUTLINED_FUNCTION_3();
}

unint64_t type metadata accessor for OS_dispatch_data()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_data;
  if (!lazy cache variable for type metadata for OS_dispatch_data)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_data);
  }
  return result;
}

uint64_t sub_246F5FC34()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(void *a1)
{
  uint64_t v1;

  closure #1 in BackgroundConnection.sendCommand(_:moreComing:with:)(a1, *(_QWORD *)(v1 + 16), *(void (**)(void *))(v1 + 24));
}

uint64_t sub_246F5FC74()
{
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_261();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:)()
{
  closure #1 in Connection.didOpenConnectionType(_:type:routeId:delay:)();
}

void partial apply for closure #1 in BackgroundConnection.startSecondaryConnection()(uint64_t a1)
{
  closure #1 in BackgroundConnection.startSecondaryConnection()(a1);
}

uint64_t sub_246F5FCBC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
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

uint64_t outlined assign with take of CommunicationProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CommunicationProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_246F5FD64()
{
  uint64_t v0;

  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_195_1();
  OUTLINED_FUNCTION_260();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 440))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v0 + 456) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_deallocObject();
}

void partial apply for specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1)
{
  uint64_t *v1;

  specialized closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a1, v1[2], v1[3], v1[4], v1[5], (uint64_t)(v1 + 6), v1[71], v1[72]);
}

uint64_t sub_246F5FE3C()
{
  return objectdestroy_15Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

void partial apply for closure #1 in Connection.willStartConnection(_:type:)()
{
  closure #1 in Connection.willStartConnection(_:type:)();
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_99();
  outlined consume of NetworkConnectionError(*(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void **)(v0 + 56));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #2 in BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(a1, *(_QWORD *)(v1 + 16), (_QWORD *)(v1 + 24));
}

uint64_t sub_246F5FEA0()
{
  return OUTLINED_FUNCTION_30_6((void (*)(_QWORD))MEMORY[0x24BEE4CA0]);
}

uint64_t objectdestroy_15Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  OUTLINED_FUNCTION_99();
  a1(*(_QWORD *)(v1 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in BackgroundConnection.connectionProvider(_:received:)(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t objectdestroy_19Tm()
{
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_260();
  OUTLINED_FUNCTION_105_1();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)()
{
  uint64_t v0;

  return specialized closure #1 in BackgroundConnection.fallbackToNextConnectionMethod(_:error:after:with:)(*(_QWORD *)(v0 + 16), (SiriNetwork::ConnectionMethod)*(_BYTE *)(v0 + 24), *(_BYTE *)(v0 + 25), *(void (**)(__int128 *))(v0 + 32));
}

uint64_t sub_246F5FF28()
{
  OUTLINED_FUNCTION_261();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed ConnectionMetrics?) -> ()(a1);
}

__n128 OUTLINED_FUNCTION_4_26()
{
  return *(__n128 *)&STACK[0x15D8];
}

__n128 OUTLINED_FUNCTION_5_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unint64_t a34,int a35,char a36,unint64_t a37,int a38,char a39,unint64_t a40,char a41,int a42,unint64_t a43,unint64_t a44,int a45,char a46,unint64_t a47,int a48,char a49,unint64_t a50,int a51,char a52,unint64_t a53,unint64_t a54,__n128 a55,__int128 a56)
{
  _BYTE *v56;
  uint64_t v57;
  char v58;
  __n128 result;

  *(_OWORD *)(v57 + 1280) = a56;
  result = a55;
  *(__n128 *)(v57 + 1296) = a55;
  STACK[0xD80] = a54;
  STACK[0xD88] = a53;
  *v56 = a52;
  STACK[0xD98] = a50;
  v56[16] = a49;
  STACK[0xDA8] = a47;
  v56[32] = a46;
  STACK[0xDB8] = a44;
  STACK[0xDC0] = a43;
  LODWORD(STACK[0xDC8]) = a42;
  v56[60] = a41;
  STACK[0xDD0] = a40;
  v56[72] = a39;
  STACK[0xDE0] = a37;
  v56[88] = a36;
  STACK[0xDF0] = a34;
  v56[104] = v58;
  return result;
}

void OUTLINED_FUNCTION_9_23()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
}

void OUTLINED_FUNCTION_10_20()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_12_17()
{
  uint64_t v0;

  return v0 + 56;
}

uint64_t OUTLINED_FUNCTION_16_16()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_17_14()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_20_13()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_26_8()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_27_9()
{
  unint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  outlined consume of NetworkConnectionError(v4, v3, v2, v0, v1);
}

id OUTLINED_FUNCTION_28_6()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  return 0x6B726F7774656ELL;
}

uint64_t OUTLINED_FUNCTION_30_6(void (*a1)(_QWORD))
{
  return objectdestroy_15Tm(a1);
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_34_7()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_38_7()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_39_6(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * a1) = v2;
  ++*(_QWORD *)(v1 + 16);
}

uint64_t OUTLINED_FUNCTION_43_5()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_46_4()
{
  return 7368560;
}

uint64_t OUTLINED_FUNCTION_47_4()
{
  return 1919247728;
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_53_3(float a1)
{
  float *v1;
  char v2;

  *v1 = a1;
  LODWORD(STACK[0x278]) = v2 & 1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_54_2(unint64_t a1)
{
  STACK[0x278] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_56_3(uint64_t a1, ...)
{
  uint64_t v2;
  va_list va;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a1);
  va_start(va, a1);
  v2 = va_arg(va1, _QWORD);
  v4 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  return outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)va1, (uint64_t)va);
}

void OUTLINED_FUNCTION_62_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  outlined init with copy of NetworkConnectionProtocol?(v3, a2, a3);
}

void OUTLINED_FUNCTION_63_3()
{
  void *v0;

}

void OUTLINED_FUNCTION_66_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  outlined init with copy of NetworkConnectionProtocol?(v3, a2, a3);
}

uint64_t OUTLINED_FUNCTION_67_3(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(unint64_t *, uint64_t, uint64_t), uint64_t a15, uint64_t a16)
{
  uint64_t v16;

  *(__n128 *)&STACK[0x290] = a1;
  return a14(&STACK[0x278], a16, v16);
}

uint64_t OUTLINED_FUNCTION_68_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;

  return a12(v13, v15, v14, v12, v16, v17);
}

uint64_t OUTLINED_FUNCTION_69_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_70_3(uint64_t a1, uint64_t *a2)
{
  outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)&STACK[0x278], a2);
}

void *OUTLINED_FUNCTION_71_3@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;

  return memmove(a1, v2, 8 * a2);
}

uint64_t OUTLINED_FUNCTION_72_3(__n128 a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(void);

  *(__n128 *)(a3 + 24) = a1;
  return v3();
}

uint64_t OUTLINED_FUNCTION_73_4(uint64_t a1)
{
  unint64_t v1;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v1, (uint64_t *)&STACK[0xA60]);
}

uint64_t OUTLINED_FUNCTION_75_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_78_1()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_81_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_83_3()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_86_4(unint64_t a1)
{
  STACK[0x278] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_87_3()
{
  return static _SetStorage.copy(original:)();
}

uint64_t OUTLINED_FUNCTION_88_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, unint64_t, uint64_t, uint64_t))(v1 + 24))(0, 0xF000000000000000, v0, v1);
}

uint64_t OUTLINED_FUNCTION_90_3()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_91_2(float a1)
{
  float *v1;

  *v1 = a1;
  return 0x6E776F6E6B6E75;
}

id OUTLINED_FUNCTION_92_3()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_94_3(Swift::UInt a1)
{
  Hasher._combine(_:)(a1);
}

void OUTLINED_FUNCTION_95_2(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  outlined destroy of RPCOspreyConnectionProtocol?((uint64_t)&a26, a2);
}

uint64_t OUTLINED_FUNCTION_96_2(unint64_t a1)
{
  STACK[0x698] = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

BOOL OUTLINED_FUNCTION_97_2(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

_WORD *OUTLINED_FUNCTION_98_1(_WORD *result)
{
  *result = 0;
  return result;
}

__n128 OUTLINED_FUNCTION_99_3(float a1)
{
  uint64_t v1;
  float *v2;

  *v2 = a1;
  return *(__n128 *)v1;
}

id OUTLINED_FUNCTION_103_3()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_105_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_107_1()
{
  SiriNetwork::ConnectionMethod v0;
  char v1;

  BackgroundConnection.start(proposedFallbackMethod:allowFallbackToNewMethod:)(v0, (v1 & 1) == 0);
}

uint64_t OUTLINED_FUNCTION_108_1()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t OUTLINED_FUNCTION_110_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_112_1()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void *OUTLINED_FUNCTION_114_2(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x72uLL);
}

uint64_t OUTLINED_FUNCTION_115_2()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t OUTLINED_FUNCTION_119_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  return outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)&a26, (uint64_t)&a18);
}

uint64_t OUTLINED_FUNCTION_120_1(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &a26);
}

unint64_t *OUTLINED_FUNCTION_121_1()
{
  return &STACK[0x1668];
}

uint64_t OUTLINED_FUNCTION_122_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_123_1()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_124_1(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = a2;
}

uint64_t OUTLINED_FUNCTION_125_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_128_2@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t OUTLINED_FUNCTION_130_1()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_131_0()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_132_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_133_1()
{
  return swift_weakLoadStrong();
}

uint64_t OUTLINED_FUNCTION_134_0()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_135_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_137_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_138_1()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  *v0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 48) + 8 * v2);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_141_2()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_142_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return a1(v2, v1, v3, v4);
}

uint64_t OUTLINED_FUNCTION_144_1()
{
  unint64_t v0;
  uint64_t v1;

  outlined consume of Data?(v1, v0);
  return 0x6566617320746F4ELL;
}

id OUTLINED_FUNCTION_145_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  float *v17;

  *v17 = a9;
  return a17;
}

uint64_t OUTLINED_FUNCTION_146_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_148_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * a1) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * a1);
  return swift_retain();
}

void OUTLINED_FUNCTION_151_2(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

uint64_t OUTLINED_FUNCTION_152_0()
{
  return swift_unknownObjectRetain();
}

BOOL OUTLINED_FUNCTION_157_1(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

_QWORD *OUTLINED_FUNCTION_160_1(_QWORD *a1, uint64_t a2)
{
  return __swift_project_boxed_opaque_existential_1(a1, a2);
}

uint64_t OUTLINED_FUNCTION_161_1()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  outlined consume of Data?(v4, v3);
  outlined consume of Data?(v2, v1);
  return v0;
}

void OUTLINED_FUNCTION_162_1(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  outlined retain of NetworkConnectionError(v2, a2);
}

uint64_t OUTLINED_FUNCTION_163_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_164_2()
{
  return swift_weakLoadStrong();
}

void OUTLINED_FUNCTION_166_2(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x12u);
}

id OUTLINED_FUNCTION_167_2()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_170_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_171_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_mutable_project_boxed_opaque_existential_1(a2, v2);
}

uint64_t OUTLINED_FUNCTION_172_1(uint64_t a1)
{
  unint64_t v1;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v1, (uint64_t *)&STACK[0x270]);
}

uint64_t OUTLINED_FUNCTION_173_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

void OUTLINED_FUNCTION_174_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_175_1()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_176_1()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_178_2()
{
  return swift_getErrorValue();
}

BOOL OUTLINED_FUNCTION_179_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_181_1()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_182_0(uint64_t a1)
{
  ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)(a1, 0);
}

uint64_t OUTLINED_FUNCTION_183_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_184_2(uint64_t a1)
{
  unint64_t v1;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v1, (uint64_t *)&STACK[0x278]);
}

void OUTLINED_FUNCTION_185_0(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x1Cu);
}

BOOL OUTLINED_FUNCTION_187_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_190_1()
{
  JUMPOUT(0x24956E090);
}

uint64_t OUTLINED_FUNCTION_195_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_198_1()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_201_0()
{
  unint64_t v0;
  uint64_t v1;

  return outlined copy of Data?(v1, v0);
}

void OUTLINED_FUNCTION_203(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  a2[1] = 0;
  a2[2] = 0;
  *a2 = v2;
}

uint64_t OUTLINED_FUNCTION_205_0()
{
  return Optional.debugDescription.getter();
}

uint64_t OUTLINED_FUNCTION_207_0()
{
  return NWConnection.identifier.getter();
}

uint64_t OUTLINED_FUNCTION_209_0()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_210_0()
{
  return swift_dynamicCast();
}

_QWORD *OUTLINED_FUNCTION_213_0()
{
  return outlined retain of ConnectionConfiguration(&STACK[0x208]);
}

void OUTLINED_FUNCTION_214_0()
{
  BackgroundConnection.closeConnectionAndPrepareForReconnect(_:)(0);
}

uint64_t OUTLINED_FUNCTION_218_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_219()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_220_0()
{
  return swift_dynamicCastClass();
}

uint64_t OUTLINED_FUNCTION_221_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

void OUTLINED_FUNCTION_224()
{
  STACK[0x288] = 0;
  STACK[0x278] = 9;
  STACK[0x280] = 0;
}

__n128 OUTLINED_FUNCTION_226@<Q0>(__n128 *a1@<X8>)
{
  return a1[5];
}

__n128 OUTLINED_FUNCTION_227_0@<Q0>(__n128 *a1@<X8>)
{
  return a1[3];
}

__n128 OUTLINED_FUNCTION_230_0@<Q0>(__n128 *a1@<X8>)
{
  return a1[1];
}

uint64_t OUTLINED_FUNCTION_232_0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_233_0()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

double OUTLINED_FUNCTION_235_0()
{
  uint64_t v0;
  double v1;

  return v1 - *(double *)(v0 + 1192);
}

uint64_t OUTLINED_FUNCTION_236_0()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_237_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_239_0()
{
  unint64_t v0;
  uint64_t v1;

  return outlined copy of Data._Representation(v1, v0);
}

void OUTLINED_FUNCTION_241()
{
  uint64_t v0;

  BackgroundConnection.canFallBackFromError(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_242()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_243()
{
  return type metadata accessor for CommunicationProtocolAce();
}

uint64_t OUTLINED_FUNCTION_246()
{
  return NWConnection.identifier.getter();
}

uint64_t OUTLINED_FUNCTION_247()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_248()
{
  uint64_t (*v0)(unint64_t *, _QWORD);

  return v0(&STACK[0x278], 0);
}

void OUTLINED_FUNCTION_249()
{
  Swift::Int v0;

  ConnectionMethod.nextConnectionMethodSupported(connectionConfiguration:)((uint64_t)&STACK[0x278], v0);
}

uint64_t (*OUTLINED_FUNCTION_250())()
{
  return BackgroundConnection.communicationProtocol.modify();
}

void OUTLINED_FUNCTION_252(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  _s11SiriNetwork24ConnectionSnapshotReportVSgWObTm_0(v3 + 6504, a2, a3);
}

void OUTLINED_FUNCTION_253()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2112;
}

BOOL OUTLINED_FUNCTION_255()
{
  return Error.sn_isNetworkDown()();
}

uint64_t OUTLINED_FUNCTION_256()
{
  uint64_t v0;

  return outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v0);
}

void OUTLINED_FUNCTION_258(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  specialized RawRepresentable<>.hash(into:)((uint64_t)va, v1);
}

void OUTLINED_FUNCTION_259()
{
  Hasher._combine(_:)(1uLL);
}

uint64_t OUTLINED_FUNCTION_260()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_261()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_263(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)va);
}

id RATInterface.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RATInterface();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RATInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RATInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id protocol witness for RATManagerProtocol.registerClient(_:queue:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
  return @nonobjc WRM_iRATInterface.registerClient(_:queue:)(a1, a2);
}

id @nonobjc WRM_iRATInterface.registerClient(_:queue:)(uint64_t a1, uint64_t a2)
{
  void *v2;

  return objc_msgSend(v2, sel_registerClient_queue_, a1, a2);
}

id protocol witness for RATManagerProtocol.unregisterClient() in conformance WRM_iRATInterface()
{
  return @nonobjc WRM_iRATInterface.unregisterClient()();
}

id @nonobjc WRM_iRATInterface.unregisterClient()()
{
  void *v0;

  return objc_msgSend(v0, sel_unregisterClient);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [WRM_iRATProximityRecommendation]?) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a2;
  v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    type metadata accessor for CTServiceDescriptor(0, &lazy cache variable for type metadata for WRM_iRATProximityRecommendation);
    v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void protocol witness for RATManagerProtocol.subscribeStandaloneLinkRecommendation(_:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
  @nonobjc WRM_iRATInterface.subscribeStandaloneLinkRecommendation(_:)(a1, a2, (uint64_t)thunk for @escaping @callee_guaranteed (@unowned WRMApplicationType, @unowned WRMLinkType, @guaranteed NSValue?) -> (), (uint64_t)&block_descriptor_75_0, (SEL *)&selRef_subscribeStandaloneLinkRecommendation_);
}

void thunk for @escaping @callee_guaranteed (@unowned WRMApplicationType, @unowned WRMLinkType, @guaranteed NSValue?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  v8 = a4;
  v7(a2, a3, a4);
  swift_release();

}

void protocol witness for RATManagerProtocol.getProximityLinkRecommendation(_:recommendation:) in conformance WRM_iRATInterface(char a1, uint64_t a2, uint64_t a3)
{
  @nonobjc WRM_iRATInterface.getProximityLinkRecommendation(_:recommendation:)(a1, a2, a3);
}

void @nonobjc WRM_iRATInterface.getProximityLinkRecommendation(_:recommendation:)(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v6[6];

  if (a2)
  {
    v6[4] = a2;
    v6[5] = a3;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1107296256;
    v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed [WRM_iRATProximityRecommendation]?) -> ();
    v6[3] = &block_descriptor_72_0;
    v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, sel_getProximityLinkRecommendation_recommendation_, a1 & 1, v5);
  _Block_release(v5);
}

void protocol witness for RATManagerProtocol.getLinkRecommendationMetrics(_:) in conformance WRM_iRATInterface(uint64_t a1, uint64_t a2)
{
  @nonobjc WRM_iRATInterface.subscribeStandaloneLinkRecommendation(_:)(a1, a2, (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed AceObject?) -> (), (uint64_t)&block_descriptor_69, (SEL *)&selRef_getLinkRecommendationMetrics_);
}

uint64_t dispatch thunk of RATManagerProtocol.registerClient(_:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for RATInterface()
{
  return objc_opt_self();
}

void @nonobjc WRM_iRATInterface.subscribeStandaloneLinkRecommendation(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v5;
  void *v7;
  _QWORD v8[6];

  if (a1)
  {
    v8[4] = a1;
    v8[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = a3;
    v8[3] = a4;
    v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, *a5, v7);
  _Block_release(v7);
}

uint64_t NetworkWirelessCoexManager.init(queue:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  id v7;
  uint64_t v9;
  void *v10;

  OUTLINED_FUNCTION_19();
  v10 = v2;
  v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v3 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_17_15();
  v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41_1();
  v6 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v6);
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 2;
  type metadata accessor for CTServiceDescriptor(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_QWORD *)(v0 + 160) = 0;
  static DispatchQoS.userInteractive.getter();
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x24BEE5750], v9);
  *(_QWORD *)(v0 + 176) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(_QWORD *)(v0 + 184) = 0x4014000000000000;
  *(_QWORD *)(v0 + 168) = v10;
  v7 = v10;
  NetworkWirelessCoexManager.resetLinkRecommendationInfo()();

  return v0;
}

uint64_t NetworkWirelessCoexManager.deinit()
{
  uint64_t v0;

  NetworkWirelessCoexManager.unregisterClient()();
  outlined destroy of RATManagerProtocol?(v0 + 16);

  return v0;
}

uint64_t NetworkWirelessCoexManager.__deallocating_deinit()
{
  NetworkWirelessCoexManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NetworkWirelessCoexManager()
{
  return objc_opt_self();
}

Swift::Void __swiftcall NetworkWirelessCoexManager.registerClient()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_19();
  v3 = v0;
  v4 = OUTLINED_FUNCTION_18();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v6 = OUTLINED_FUNCTION_33_3(v4);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_17_15();
  v7 = type metadata accessor for DispatchQoS();
  v11 = *(_QWORD *)(v7 - 8);
  v12 = v7;
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_41_1();
  v8 = *(void **)(v3 + 168);
  OUTLINED_FUNCTION_14_0();
  swift_weakInit();
  v9 = OUTLINED_FUNCTION_16((uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ());
  v10 = v8;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v5, MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_21_12((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x24956D244](0, v2, v1, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v12);
  swift_release();
  swift_release();
  NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
  NetworkWirelessCoexManager.subscribeLinkRecommendation()();
  OUTLINED_FUNCTION_1_1();
}

uint64_t closure #1 in NetworkWirelessCoexManager.registerClient()()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(uint64_t, void *, uint64_t, uint64_t);
  id v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  objc_class *v15;
  _UNKNOWN **v16;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = result + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    v3 = v15;
    outlined destroy of RATManagerProtocol?((uint64_t)v14);
    if (v3)
    {
      outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    }
    else
    {
      v4 = (objc_class *)type metadata accessor for RATInterface();
      v5 = objc_msgSend(objc_allocWithZone(v4), sel_init);
      v15 = v4;
      v16 = &protocol witness table for WRM_iRATInterface;
      v14[0] = v5;
    }
    outlined init with take of RATManagerProtocol?((uint64_t)v14, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of RATManagerProtocol?((uint64_t)v11, v2);
    swift_endAccess();
    outlined init with copy of RATManagerProtocol?(v2, (uint64_t)v14);
    if (v15)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v14, (uint64_t)v11);
      outlined destroy of RATManagerProtocol?((uint64_t)v14);
      v6 = v12;
      v7 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      v8 = *(void **)(v1 + 168);
      v9 = *(void (**)(uint64_t, void *, uint64_t, uint64_t))(v7 + 8);
      v10 = v8;
      v9(22, v8, v6, v7);

      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {
      swift_release();
      return outlined destroy of RATManagerProtocol?((uint64_t)v14);
    }
  }
  return result;
}

Swift::Void __swiftcall NetworkWirelessCoexManager.unregisterClient()()
{
  NetworkWirelessCoexManager.unregisterClient()();
}

uint64_t closure #1 in NetworkWirelessCoexManager.unregisterClient()()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v1, (uint64_t)&v9);
    swift_release();
    if (*((_QWORD *)&v10 + 1))
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)&v9, (uint64_t)v6);
      outlined destroy of RATManagerProtocol?((uint64_t)&v9);
      v2 = v7;
      v3 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
    }
    else
    {
      outlined destroy of RATManagerProtocol?((uint64_t)&v9);
    }
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result + 16;
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    swift_beginAccess();
    outlined assign with take of RATManagerProtocol?((uint64_t)&v9, v5);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
  NetworkWirelessCoexManager.unregisterClient()();
}

void NetworkWirelessCoexManager.unregisterClient()()
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
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  _QWORD v19[5];
  uint64_t v20;

  OUTLINED_FUNCTION_19();
  v4 = v3;
  v6 = v5;
  v7 = v0;
  v8 = OUTLINED_FUNCTION_18();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v10 = OUTLINED_FUNCTION_33_3(v8);
  MEMORY[0x24BDAC7A8](v10);
  v11 = OUTLINED_FUNCTION_0_3();
  v12 = OUTLINED_FUNCTION_23(v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)(v7 + 168);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_19_13();
  v19[4] = v6;
  v20 = v2;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v19[3] = v4;
  v16 = _Block_copy(v19);
  v17 = v15;
  OUTLINED_FUNCTION_83();
  static DispatchQoS.unspecified.getter();
  v18[3] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v9, MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_21_12((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x24956D244](0, v14, v1, v16);
  _Block_release(v16);

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_1();
}

uint64_t closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_beginAccess();
    *(_QWORD *)(v1 + 56) = 256;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_QWORD *)(v1 + 160) = 0;
    return swift_release();
  }
  return result;
}

void NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
  NetworkWirelessCoexManager.unregisterClient()();
}

uint64_t closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t (*)(int, int, void *), uint64_t, uint64_t, uint64_t);
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v1, (uint64_t)v9);
    swift_release();
    if (v10)
    {
      outlined init with copy of RPCOspreyConnectionProtocol((uint64_t)v9, (uint64_t)v6);
      outlined destroy of RATManagerProtocol?((uint64_t)v9);
      v2 = v7;
      v3 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      v4 = swift_allocObject();
      swift_beginAccess();
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      v5 = *(void (**)(uint64_t (*)(int, int, void *), uint64_t, uint64_t, uint64_t))(v3 + 32);
      swift_retain();
      v5(partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation(), v4, v2, v3);
      swift_release_n();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
    }
    else
    {
      return outlined destroy of RATManagerProtocol?((uint64_t)v9);
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(int a1, int a2, void *a3)
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  _BYTE *v16;
  uint64_t (*v17)();
  _BYTE *v18;
  uint64_t (*v19)();
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _BYTE *v23;
  uint64_t (*v24)();
  uint64_t result;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _BYTE *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriNetwork);
  v7 = a3;
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v32[0] = v31;
    *(_DWORD *)v10 = 136315650;
    LODWORD(v33) = a1;
    type metadata accessor for WRMApplicationType(0);
    v11 = String.init<A>(describing:)();
    v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    LODWORD(v33) = a2;
    type metadata accessor for WRMLinkType(0);
    v13 = String.init<A>(describing:)();
    v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 2112;
    if (a3)
    {
      v33 = (uint64_t)v7;
      v15 = v7;
    }
    else
    {
      v33 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v30 = a3;

    _os_log_impl(&dword_246EC7000, v8, v9, "Received an asynchronous recommendation type %s, linkType %s, value %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v30, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24956E018](v31, -1, -1);
    MEMORY[0x24956E018](v10, -1, -1);

  }
  else
  {

  }
  swift_beginAccess();
  if (!swift_weakLoadStrong())
    goto LABEL_22;
  if (a1 != 1)
  {
    swift_release();
LABEL_22:
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (!result)
      return result;
    NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
    return swift_release();
  }
  v17 = NetworkConnectionProvider.connectionMetrics.modify();
  if (*v16 != 2)
    *v16 = 0;
  ((void (*)(uint64_t *, _QWORD))v17)(v32, 0);
  v19 = NetworkConnectionProvider.connectionMetrics.modify();
  if (*v18 != 2)
    v18[1] = 1;
  ((void (*)(uint64_t *, _QWORD))v19)(v32, 0);
  if (!a2)
  {
    v26 = Logger.logObject.getter();
    v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_246EC7000, v26, v27, "NetworkWirelessCoexManager: Standalone linkRecommendationInfo wifiPreference false", v28, 2u);
      MEMORY[0x24956E018](v28, -1, -1);
    }

    v24 = NetworkConnectionProvider.connectionMetrics.modify();
    if (*v29 != 2)
      v29[1] = 0;
    goto LABEL_28;
  }
  if (a2 == 1)
  {
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_246EC7000, v20, v21, "NetworkWirelessCoexManager: Standalone linkRecommendationInfo wifiPreference true", v22, 2u);
      MEMORY[0x24956E018](v22, -1, -1);
    }

    v24 = NetworkConnectionProvider.connectionMetrics.modify();
    if (*v23 != 2)
      v23[1] = 1;
LABEL_28:
    ((void (*)(uint64_t *, _QWORD))v24)(v32, 0);
  }
  return swift_release();
}

void NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_19();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_18();
  v8 = OUTLINED_FUNCTION_33_3(v7);
  MEMORY[0x24BDAC7A8](v8);
  v9 = OUTLINED_FUNCTION_0_3();
  v10 = OUTLINED_FUNCTION_23(v9);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_16_17();
  v11 = OUTLINED_FUNCTION_14_0();
  swift_weakInit();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v4;
  *(_QWORD *)(v12 + 32) = v2;
  *(_BYTE *)(v12 + 40) = v6;
  OUTLINED_FUNCTION_16((uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ());
  v13 = v0;
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_26_9();
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_21_12((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  OUTLINED_FUNCTION_8_22();
  OUTLINED_FUNCTION_11_19();
}

void sub_246F620AC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  const void *v21;

  _Block_release(v21);

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_1();
}

uint64_t closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
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
  char *v15;
  uint64_t v16;
  uint64_t Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD, void (*)(unint64_t), uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  id v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t result;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[3];
  uint64_t v76;
  uint64_t v77;
  __int128 aBlock;
  uint64_t (*v79)(uint64_t);
  void *v80;
  uint64_t (*v81)();
  _QWORD *v82;

  v69 = a4;
  v71 = a3;
  v70 = a2;
  v5 = type metadata accessor for DispatchWorkItemFlags();
  v72 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchTime();
  v67 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v68 = (char *)&v58 - v16;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
    swift_release();
  }
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v18 = Strong;
    v64 = v12;
    v19 = Strong + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v19, (uint64_t)&aBlock);
    if (v80)
    {
      v66 = v18;
      v59 = a1;
      v60 = v9;
      outlined init with take of RPCOspreyConnectionProtocol(&aBlock, (uint64_t)v75);
      v20 = swift_allocObject();
      v21 = dispatch_group_create();
      *(_QWORD *)(v20 + 16) = v21;
      dispatch_group_enter(v21);
      v62 = v11;
      v22 = v76;
      v23 = v77;
      __swift_project_boxed_opaque_existential_1(v75, v76);
      v24 = swift_allocObject();
      v65 = v5;
      v25 = v24;
      v63 = v7;
      swift_beginAccess();
      swift_weakLoadStrong();
      v58 = v8;
      swift_weakInit();
      swift_release();
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = v25;
      *(_QWORD *)(v26 + 24) = v20;
      v27 = *(void (**)(_QWORD, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v23 + 40);
      swift_retain();
      v61 = v20;
      swift_retain();
      v28 = v23;
      v29 = v62;
      v27(v69 & 1, partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:), v26, v22, v28);
      v30 = v63;
      v31 = v65;
      swift_release();
      v32 = v72;
      swift_release();
      swift_beginAccess();
      v33 = *(void **)(v20 + 16);
      if (v33)
      {
        v34 = v33;
        static DispatchTime.now()();
        v35 = v30;
        v36 = v29;
        v37 = v32;
        v38 = v68;
        MEMORY[0x24956CFC8](v15, *(double *)(v66 + 184));
        v39 = *(void (**)(char *, uint64_t))(v67 + 8);
        v40 = v64;
        v39(v15, v64);
        MEMORY[0x24956D1FC](v38);

        v41 = v38;
        v32 = v37;
        v29 = v36;
        v30 = v35;
        v31 = v65;
        v39(v41, v40);
        if ((static DispatchTimeoutResult.== infix(_:_:)() & 1) != 0)
        {
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v42 = type metadata accessor for Logger();
          __swift_project_value_buffer(v42, (uint64_t)static Logger.siriNetwork);
          v43 = Logger.logObject.getter();
          v44 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_246EC7000, v43, v44, "NetworkWirelessCoexManager: getProximityLinkRecommendation timedout", v45, 2u);
            MEMORY[0x24956E018](v45, -1, -1);
          }

        }
      }
      swift_beginAccess();
      v46 = swift_weakLoadStrong();
      if (v46)
      {
        v47 = *(id *)(v46 + 168);
        swift_release();
        v48 = (_QWORD *)swift_allocObject();
        v49 = v70;
        v50 = v71;
        v48[2] = v70;
        v48[3] = v50;
        v48[4] = v59;
        v81 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
        v82 = v48;
        *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v79 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        v80 = &block_descriptor_49_1;
        v51 = _Block_copy(&aBlock);
        outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v49);
        swift_retain();
        static DispatchQoS.unspecified.getter();
        v73 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x24956D244](0, v29, v30, v51);
        _Block_release(v51);
        swift_release();

        (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
        (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v58);
      }
      swift_release();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
    }
    swift_release();
    outlined destroy of RATManagerProtocol?((uint64_t)&aBlock);
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v53 = *(id *)(result + 168);
    swift_release();
    v54 = (_QWORD *)swift_allocObject();
    v55 = v70;
    v56 = v71;
    v54[2] = v70;
    v54[3] = v56;
    v54[4] = a1;
    v81 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    v82 = v54;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v79 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v80 = &block_descriptor_38;
    v57 = _Block_copy(&aBlock);
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v55);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v74 = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D244](0, v11, v7, v57);
    _Block_release(v57);

    (*(void (**)(char *, uint64_t))(v72 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return swift_release();
  }
  return result;
}

void closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_group_t *v4;
  uint64_t v5;
  uint64_t v6;
  char **v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint8_t *v17;
  _BYTE *v18;
  uint64_t (*v19)();
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint8_t *v24;
  _BYTE *v25;
  uint64_t (*v26)();
  NSObject *v27;
  dispatch_group_t v28;
  _BYTE v29[32];

  v4 = (dispatch_group_t *)(a3 + 16);
  swift_beginAccess();
  if (!swift_weakLoadStrong())
  {
LABEL_34:
    swift_beginAccess();
    if (*v4)
      dispatch_group_leave(*v4);
    goto LABEL_40;
  }
  if (!a1)
  {
    swift_release();
    goto LABEL_34;
  }
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_5;
LABEL_37:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (*v4)
    {
      v27 = *v4;
      dispatch_group_leave(v27);

    }
    swift_release();
LABEL_40:
    swift_beginAccess();
    v28 = *v4;
    *v4 = 0;

    return;
  }
  swift_bridgeObjectRetain();
  v5 = _CocoaArrayWrapper.endIndex.getter();
  if (!v5)
    goto LABEL_37;
LABEL_5:
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = &selRef_carrierBundleChange_;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x24956D43C](v6, a1);
      else
        v8 = *(id *)(a1 + 8 * v6 + 32);
      v9 = v8;
      if (objc_msgSend(v8, sel_RecommendationType) == 2)
      {
        v10 = objc_msgSend(v9, v7[388]);
        if (v10)
        {
          v11 = v10;
          v12 = v10;
          NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(v11);

        }
      }
      if (objc_msgSend(v9, sel_linkIsRecommended)
        && (objc_msgSend(v9, sel_linkRecommendationIsValid) & 1) != 0)
      {
        if (objc_msgSend(v9, sel_RecommendationType) == 1)
        {
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v13 = type metadata accessor for Logger();
          __swift_project_value_buffer(v13, (uint64_t)static Logger.siriNetwork);
          v14 = Logger.logObject.getter();
          v15 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_246EC7000, v14, v15, "NetworkWirelessCoexManager: Get Proximity linkRecommendationInfo btPreference true", v16, 2u);
            v17 = v16;
            v7 = &selRef_carrierBundleChange_;
            MEMORY[0x24956E018](v17, -1, -1);
          }

          v19 = NetworkConnectionProvider.connectionMetrics.modify();
          if (*v18 != 2)
            *v18 = 1;
          ((void (*)(_BYTE *, _QWORD))v19)(v29, 0);
        }
        if (objc_msgSend(v9, sel_RecommendationType) == 2)
        {
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v20 = type metadata accessor for Logger();
          __swift_project_value_buffer(v20, (uint64_t)static Logger.siriNetwork);
          v21 = Logger.logObject.getter();
          v22 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v21, v22))
          {
            v23 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_246EC7000, v21, v22, "NetworkWirelessCoexManager: Get Proximity linkRecommendationInfo wifiPreference true", v23, 2u);
            v24 = v23;
            v7 = &selRef_carrierBundleChange_;
            MEMORY[0x24956E018](v24, -1, -1);
          }

          v26 = NetworkConnectionProvider.connectionMetrics.modify();
          if (*v25 != 2)
            v25[1] = 1;
          ((void (*)(_BYTE *, _QWORD))v26)(v29, 0);
        }
      }
      ++v6;

    }
    while (v5 != v6);
    goto LABEL_37;
  }
  __break(1u);
}

void NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
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
  uint64_t v9;
  _QWORD *v10;
  id v11;

  OUTLINED_FUNCTION_19();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_18();
  v7 = OUTLINED_FUNCTION_33_3(v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_0_3();
  v9 = OUTLINED_FUNCTION_23(v8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_16_17();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_19_13();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v1;
  v10[3] = v5;
  v10[4] = v3;
  OUTLINED_FUNCTION_16((uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ());
  v11 = v0;
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_26_9();
  lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_21_12((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  OUTLINED_FUNCTION_8_22();
  OUTLINED_FUNCTION_11_19();
}

void sub_246F62DE4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  const void *v21;

  _Block_release(v21);

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_1();
}

uint64_t closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void (*)(void *), uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  char *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char *v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  id v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char *v52;
  uint64_t v53;
  uint64_t result;
  char *v55;
  id v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[3];
  uint64_t v79;
  uint64_t v80;
  __int128 aBlock;
  uint64_t (*v82)(uint64_t);
  void *v83;
  uint64_t (*v84)();
  _QWORD *v85;

  v71 = a3;
  v70 = a2;
  v69 = type metadata accessor for DispatchTime();
  v67 = *(_QWORD *)(v69 - 8);
  v4 = MEMORY[0x24BDAC7A8](v69);
  v66 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v68 = (char *)&v61 - v6;
  v7 = type metadata accessor for DispatchWorkItemFlags();
  v74 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v75 = a1 + 2;
  Strong = swift_weakLoadStrong();
  v15 = MEMORY[0x24BEE4AF8];
  v73 = v11;
  if (Strong)
  {
    v16 = MEMORY[0x24BDAC760];
    v72 = *(id *)(Strong + 168);
    swift_release();
    v84 = partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    v85 = a1;
    *(_QWORD *)&aBlock = v16;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v82 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v83 = &block_descriptor_6_0;
    v17 = _Block_copy(&aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v78[0] = MEMORY[0x24BEE4AF8];
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    v15 = MEMORY[0x24BEE4AF8];
    dispatch thunk of SetAlgebra.init<A>(_:)();
    v18 = v72;
    MEMORY[0x24956D244](0, v13, v9, v17);
    v19 = v17;
    v11 = v73;
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v74 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_release();
  }
  v72 = (id)v10;
  swift_beginAccess();
  v20 = swift_weakLoadStrong();
  if (v20)
  {
    v21 = v20;
    v22 = v20 + 16;
    swift_beginAccess();
    outlined init with copy of RATManagerProtocol?(v22, (uint64_t)&aBlock);
    if (v83)
    {
      v61 = v9;
      v62 = v7;
      outlined init with take of RPCOspreyConnectionProtocol(&aBlock, (uint64_t)v78);
      v23 = swift_allocObject();
      v24 = dispatch_group_create();
      v64 = v21;
      *(_QWORD *)(v23 + 16) = v24;
      dispatch_group_enter(v24);
      v65 = v13;
      v25 = v79;
      v26 = v80;
      __swift_project_boxed_opaque_existential_1(v78, v79);
      v27 = a1;
      v28 = swift_allocObject();
      swift_beginAccess();
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = v28;
      *(_QWORD *)(v29 + 24) = v23;
      v30 = *(void (**)(void (*)(void *), uint64_t, uint64_t, uint64_t))(v26 + 48);
      swift_retain();
      v63 = v23;
      swift_retain();
      v31 = v26;
      v32 = v65;
      v30(partial apply for closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:), v29, v25, v31);
      v33 = v27;
      swift_release();
      swift_release();
      swift_beginAccess();
      v34 = *(void **)(v23 + 16);
      v35 = v64;
      v36 = MEMORY[0x24BDAC760];
      if (v34)
      {
        v37 = v34;
        v38 = v66;
        static DispatchTime.now()();
        v39 = v68;
        MEMORY[0x24956CFC8](v38, *(double *)(v35 + 184));
        v40 = *(void (**)(char *, uint64_t))(v67 + 8);
        v41 = v69;
        v40(v38, v69);
        MEMORY[0x24956D1FC](v39);

        v40(v39, v41);
        if ((static DispatchTimeoutResult.== infix(_:_:)() & 1) != 0)
        {
          if (one-time initialization token for siriNetwork != -1)
            swift_once();
          v42 = type metadata accessor for Logger();
          __swift_project_value_buffer(v42, (uint64_t)static Logger.siriNetwork);
          v43 = Logger.logObject.getter();
          v44 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_246EC7000, v43, v44, "NetworkWirelessCoexManager: getLinkRecommendationMetrics timedout", v45, 2u);
            MEMORY[0x24956E018](v45, -1, -1);
          }

        }
      }
      swift_beginAccess();
      v46 = swift_weakLoadStrong();
      if (v46)
      {
        v47 = *(id *)(v46 + 168);
        swift_release();
        v48 = (_QWORD *)swift_allocObject();
        v49 = v70;
        v50 = v71;
        v48[2] = v70;
        v48[3] = v50;
        v48[4] = v33;
        v84 = partial apply for closure #4 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
        v85 = v48;
        *(_QWORD *)&aBlock = v36;
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v82 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        v83 = &block_descriptor_25_0;
        v51 = _Block_copy(&aBlock);
        swift_retain();
        outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v49);
        static DispatchQoS.unspecified.getter();
        v76 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        v52 = v61;
        v53 = v62;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x24956D244](0, v32, v52, v51);
        _Block_release(v51);
        swift_release();

        (*(void (**)(char *, uint64_t))(v74 + 8))(v52, v53);
        (*(void (**)(char *, id))(v73 + 8))(v32, v72);
      }
      swift_release();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v78);
    }
    swift_release();
    outlined destroy of RATManagerProtocol?((uint64_t)&aBlock);
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v55 = v9;
    v56 = *(id *)(result + 168);
    swift_release();
    v57 = (_QWORD *)swift_allocObject();
    v58 = v70;
    v59 = v71;
    v57[2] = v70;
    v57[3] = v59;
    v57[4] = a1;
    v84 = partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:);
    v85 = v57;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v82 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v83 = &block_descriptor_12;
    v60 = _Block_copy(&aBlock);
    swift_retain();
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v58);
    static DispatchQoS.unspecified.getter();
    v77 = v15;
    lazy protocol witness table accessor for type RPCOspreyConnectionProvider and conformance RPCOspreyConnectionProvider((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x24956D244](0, v13, v55, v60);
    _Block_release(v60);

    (*(void (**)(char *, uint64_t))(v74 + 8))(v55, v7);
    (*(void (**)(char *, id))(v11 + 8))(v13, v72);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(0);
    return swift_release();
  }
  return result;
}

void closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  uint64_t Strong;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;

  v4 = (id *)(a3 + 16);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    if (a1)
    {
      v7 = a1;
      NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(a1);
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v8 = type metadata accessor for Logger();
      __swift_project_value_buffer(v8, (uint64_t)static Logger.siriNetwork);
      swift_retain_n();
      v9 = Logger.logObject.getter();
      v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        v12 = swift_slowAlloc();
        v17 = v12;
        *(_DWORD *)v11 = 136315138;
        swift_beginAccess();
        if (*(_QWORD *)(v6 + 56) == 2)
        {
          v13 = 0xE100000000000000;
          v14 = 45;
        }
        else
        {
          v14 = String.init<A>(describing:)();
          v13 = v15;
        }
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v13, &v17);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_246EC7000, v9, v10, "NetworkWirelessCoexManager: LinkRecommendationMetrics %s", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24956E018](v12, -1, -1);
        MEMORY[0x24956E018](v11, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (*v4)
      {
        v16 = *v4;
        dispatch_group_leave(v16);

      }
      swift_release();
      goto LABEL_18;
    }
    swift_release();
  }
  swift_beginAccess();
  if (*v4)
    dispatch_group_leave((dispatch_group_t)*v4);
  swift_beginAccess();
  v7 = *v4;
  *v4 = 0;
LABEL_18:

}

uint64_t closure #1 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(uint64_t result)
{
  uint64_t (*v1)(_OWORD *);
  uint64_t Strong;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[7];

  if (result)
  {
    v1 = (uint64_t (*)(_OWORD *))result;
    OUTLINED_FUNCTION_0_2();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v3 = Strong;
      OUTLINED_FUNCTION_0_2();
      v16 = *(_OWORD *)(v3 + 72);
      v17 = *(_OWORD *)(v3 + 56);
      v14 = *(_OWORD *)(v3 + 104);
      v15 = *(_OWORD *)(v3 + 88);
      v12 = *(_OWORD *)(v3 + 136);
      v13 = *(_OWORD *)(v3 + 120);
      v11 = *(_OWORD *)(v3 + 152);
      swift_release();
      v5 = v11;
      v4 = v12;
      v7 = v13;
      v6 = v14;
      v9 = v15;
      v8 = v16;
      v10 = v17;
    }
    else
    {
      v10 = xmmword_246F740B0;
      v8 = 0uLL;
      v9 = 0uLL;
      v6 = 0uLL;
      v7 = 0uLL;
      v4 = 0uLL;
      v5 = 0uLL;
    }
    v18[0] = v10;
    v18[1] = v8;
    v18[2] = v9;
    v18[3] = v6;
    v18[4] = v7;
    v18[5] = v4;
    v18[6] = v5;
    return v1(v18);
  }
  return result;
}

uint64_t NetworkWirelessCoexManager.updateMetricsFromProximityRecommendationLogging(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)();
  _BYTE *v112;
  uint64_t (*v113)();
  _BYTE *v114;
  id v115;
  uint64_t v117[4];

  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v11 = v3;
    if (a1)
      v2 = OUTLINED_FUNCTION_0_8((uint64_t)v2, sel_btRSSI);
    else
      v2 = 0;
    *(_QWORD *)(v11 + 8) = v2;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v20 = v13;
    if (a1)
      v12 = OUTLINED_FUNCTION_0_8((uint64_t)v12, sel_wifiRSSI);
    else
      v12 = 0;
    *(_QWORD *)(v20 + 16) = v12;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v29 = v22;
    if (a1)
      v21 = OUTLINED_FUNCTION_0_8((uint64_t)v21, sel_wifiSNR);
    else
      v21 = 0;
    *(_QWORD *)(v29 + 24) = v21;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v38 = v31;
    if (a1)
      v30 = objc_msgSend(a1, sel_beaconPER);
    else
      v30 = 0;
    *(_DWORD *)(v38 + 32) = (_DWORD)v30;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v47 = v40;
    if (a1)
      v39 = objc_msgSend(a1, sel_nwType);
    else
      v39 = 0;
    *(_BYTE *)(v47 + 36) = (_BYTE)v39;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v56 = v49;
    if (a1)
      v48 = OUTLINED_FUNCTION_0_8((uint64_t)v48, sel_wifiCCA);
    else
      v48 = 0;
    *(_QWORD *)(v56 + 40) = v48;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v48, v49, v50, v51, v52, v53, v54, v55, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v65 = v58;
    if (a1)
      v57 = OUTLINED_FUNCTION_0_8((uint64_t)v57, sel_lsmRecommendationBe);
    else
      v57 = 0;
    *(_QWORD *)(v65 + 48) = v57;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v57, v58, v59, v60, v61, v62, v63, v64, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v74 = v67;
    if (a1)
      v66 = OUTLINED_FUNCTION_0_8((uint64_t)v66, sel_expectedThroughputVIBE);
    else
      v66 = 0;
    *(_QWORD *)(v74 + 56) = v66;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v66, v67, v68, v69, v70, v71, v72, v73, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v83 = v76;
    if (a1)
      v75 = OUTLINED_FUNCTION_0_8((uint64_t)v75, sel_packetLifetimeVIBE);
    else
      v75 = 0;
    *(_QWORD *)(v83 + 64) = v75;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v75, v76, v77, v78, v79, v80, v81, v82, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v92 = v85;
    if (a1)
      v84 = OUTLINED_FUNCTION_0_8((uint64_t)v84, sel_packetLossRateVIBE);
    else
      v84 = 0;
    *(_QWORD *)(v92 + 72) = v84;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v84, v85, v86, v87, v88, v89, v90, v91, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v101 = v94;
    if (a1)
      v93 = OUTLINED_FUNCTION_0_8((uint64_t)v93, sel_btRetransmissionRateTx);
    else
      v93 = 0;
    *(_QWORD *)(v101 + 80) = v93;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v93, v94, v95, v96, v97, v98, v99, v100, v117[0]);
  OUTLINED_FUNCTION_3_29();
  OUTLINED_FUNCTION_1_34();
  if (!v10)
  {
    v110 = v103;
    if (a1)
      v102 = OUTLINED_FUNCTION_0_8((uint64_t)v102, sel_btRetransmissionRateRx);
    else
      v102 = 0;
    *(_QWORD *)(v110 + 88) = v102;
  }
  OUTLINED_FUNCTION_0_48((uint64_t)v102, v103, v104, v105, v106, v107, v108, v109, v117[0]);
  v111 = OUTLINED_FUNCTION_3_29();
  v113 = v111;
  if (*v112 != 2)
  {
    v114 = v112;
    if (a1)
      v115 = OUTLINED_FUNCTION_0_8((uint64_t)v111, sel_btTech);
    else
      v115 = 0;
    *((_QWORD *)v114 + 12) = v115;
  }
  return ((uint64_t (*)(uint64_t *, _QWORD))v113)(v117, 0);
}

uint64_t sub_246F63E34()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246F63E58()
{
  return objectdestroy_2Tm_2();
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  uint64_t v0;

  return closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  return closure #1 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)();
}

uint64_t partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)()
{
  uint64_t v0;

  return closure #1 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(*(_QWORD *)(v0 + 16));
}

uint64_t outlined init with copy of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of RATManagerProtocol?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246F63F34()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(void *a1)
{
  uint64_t v1;

  closure #3 in closure #1 in NetworkWirelessCoexManager.getLinkRecommendationMetrics(_:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_246F63F68()
{
  return objectdestroy_2Tm_2();
}

uint64_t objectdestroy_2Tm_2()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)()
{
  uint64_t v0;

  return closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

uint64_t objectdestroy_18Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(unint64_t a1)
{
  uint64_t v1;

  closure #2 in closure #1 in NetworkWirelessCoexManager.getProximityLinkRecommendation(retry:_:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()()
{
  return closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()();
}

uint64_t partial apply for closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(int a1, int a2, void *a3)
{
  return closure #1 in closure #1 in NetworkWirelessCoexManager.subscribeLinkRecommendation()(a1, a2, a3);
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
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
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()()
{
  return closure #1 in NetworkWirelessCoexManager.resetLinkRecommendationInfo()();
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.unregisterClient()()
{
  return closure #1 in NetworkWirelessCoexManager.unregisterClient()();
}

uint64_t outlined assign with take of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in NetworkWirelessCoexManager.registerClient()()
{
  return closure #1 in NetworkWirelessCoexManager.registerClient()();
}

uint64_t outlined init with take of RATManagerProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RATManagerProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24956DF70](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v9)(uint64_t *, _QWORD);

  return v9(&a9, 0);
}

uint64_t (*OUTLINED_FUNCTION_3_29())()
{
  return NetworkConnectionProvider.connectionMetrics.modify();
}

uint64_t OUTLINED_FUNCTION_8_22()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void OUTLINED_FUNCTION_11_19()
{
  JUMPOUT(0x24956D244);
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_21_12(unint64_t *a1)
{
  uint64_t *v1;

  return _sSay8Dispatch0A13WorkItemFlagsVGSayxGSTsWlTm_0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26_9()
{
  uint64_t v0;

  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed LinkRecommendationInfo?) -> ())?(v0);
  return static DispatchQoS.unspecified.getter();
}

void __swiftcall LinkRecommendationInfo.snLinkRecommendationInfo()(SNLinkRecommendationInfo *__return_ptr retstr)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *v1;
  v3 = v1[1];
  v4 = *((_QWORD *)v1 + 1);
  v5 = *((_QWORD *)v1 + 2);
  v6 = *((_QWORD *)v1 + 3);
  v7 = *((int *)v1 + 8);
  v8 = (char)v1[36];
  v10 = *((_QWORD *)v1 + 5);
  v9 = *((_QWORD *)v1 + 6);
  v13 = *((_QWORD *)v1 + 7);
  v14 = *((_QWORD *)v1 + 8);
  v15 = *((_QWORD *)v1 + 9);
  v16 = *((_QWORD *)v1 + 10);
  v17 = *((_QWORD *)v1 + 11);
  v18 = *((_QWORD *)v1 + 12);
  v11 = *((double *)v1 + 13);
  v12 = objc_msgSend(objc_allocWithZone((Class)SNLinkRecommendationInfo), sel_init);
  objc_msgSend(v12, sel_setBtPreference_, v2);
  objc_msgSend(v12, sel_setWifiPreference_, v3);
  objc_msgSend(v12, sel_setBtRSSI_, v4);
  objc_msgSend(v12, sel_setWifiRSSI_, v5);
  objc_msgSend(v12, sel_setWifiSNR_, v6);
  objc_msgSend(v12, sel_setBeaconPER_, v7);
  objc_msgSend(v12, sel_setNwType_, v8);
  objc_msgSend(v12, sel_setWifiCCA_, v10);
  objc_msgSend(v12, sel_setLsmRecommendationBe_, v9);
  objc_msgSend(v12, sel_setExpectedThroughputVIBE_, v13);
  objc_msgSend(v12, sel_setPacketLifetimeVIBE_, v14);
  objc_msgSend(v12, sel_setPacketLossRateVIBE_, v15);
  objc_msgSend(v12, sel_setBtRetransmissionRateTx_, v16);
  objc_msgSend(v12, sel_setBtRetransmissionRateRx_, v17);
  objc_msgSend(v12, sel_setBtTech_, v18);
  objc_msgSend(v12, sel_setTimeTaken_, v11);
}

double LinkRecommendationInfo.init(btPreference:wifiPreference:)@<D0>(char a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  double result;

  *(_BYTE *)a3 = a1;
  *(_BYTE *)(a3 + 1) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 29) = 0;
  result = 0.0;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_QWORD *)(a3 + 104) = 0;
  return result;
}

uint64_t LinkRecommendationInfo.btPreference.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t LinkRecommendationInfo.btPreference.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btPreference.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiPreference.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t LinkRecommendationInfo.wifiPreference.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiPreference.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRSSI.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t LinkRecommendationInfo.btRSSI.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRSSI.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiRSSI.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t LinkRecommendationInfo.wifiRSSI.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiRSSI.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiSNR.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t LinkRecommendationInfo.wifiSNR.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiSNR.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.beaconPER.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 32);
}

uint64_t LinkRecommendationInfo.beaconPER.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.beaconPER.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.nwType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 36);
}

uint64_t LinkRecommendationInfo.nwType.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 36) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.nwType.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.wifiCCA.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t LinkRecommendationInfo.wifiCCA.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.wifiCCA.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.lsmRecommendationBe.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t LinkRecommendationInfo.lsmRecommendationBe.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.lsmRecommendationBe.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.expectedThroughputVIBE.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t LinkRecommendationInfo.expectedThroughputVIBE.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.expectedThroughputVIBE.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.packetLifetimeVIBE.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t LinkRecommendationInfo.packetLifetimeVIBE.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.packetLifetimeVIBE.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.packetLossRateVIBE.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t LinkRecommendationInfo.packetLossRateVIBE.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.packetLossRateVIBE.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRetransmissionRateTx.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t LinkRecommendationInfo.btRetransmissionRateTx.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRetransmissionRateTx.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btRetransmissionRateRx.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t LinkRecommendationInfo.btRetransmissionRateRx.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btRetransmissionRateRx.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.btTech.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t LinkRecommendationInfo.btTech.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = result;
  return result;
}

uint64_t (*LinkRecommendationInfo.btTech.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

double LinkRecommendationInfo.timeTaken.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

void LinkRecommendationInfo.timeTaken.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 104) = a1;
}

uint64_t (*LinkRecommendationInfo.timeTaken.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t LinkRecommendationInfo.debugDescription.getter()
{
  uint64_t v0;
  int v1;
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
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;

  v1 = *(unsigned __int8 *)(v0 + 1);
  v29 = *(_QWORD *)(v0 + 40);
  v24 = *(_QWORD *)(v0 + 56);
  v22 = *(_QWORD *)(v0 + 64);
  v23 = *(_QWORD *)(v0 + 72);
  v26 = *(_QWORD *)(v0 + 48);
  v28 = *(_QWORD *)(v0 + 80);
  if (*(_BYTE *)v0)
    v2 = 1702195828;
  else
    v2 = 0x65736C6166;
  v31 = *(_QWORD *)(v0 + 88);
  v34 = *(_QWORD *)(v0 + 96);
  OUTLINED_FUNCTION_9_5(v2);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_6_19();
  v39 = v3;
  _StringGuts.grow(_:)(17);
  OUTLINED_FUNCTION_7_16();
  OUTLINED_FUNCTION_13_17();
  if (v1)
    v4 = 1702195828;
  else
    v4 = 0x65736C6166;
  OUTLINED_FUNCTION_9_5(v4);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_6_19();
  v38 = v5;
  v40._countAndFlagsBits = OUTLINED_FUNCTION_14_12();
  OUTLINED_FUNCTION_11_14(v40);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_6_19();
  v37 = v6;
  OUTLINED_FUNCTION_13_17();
  v41._countAndFlagsBits = OUTLINED_FUNCTION_2_31();
  OUTLINED_FUNCTION_11_14(v41);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v36 = v7;
  OUTLINED_FUNCTION_13_17();
  v42._countAndFlagsBits = OUTLINED_FUNCTION_2_31();
  OUTLINED_FUNCTION_11_14(v42);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v35 = v8;
  v43._countAndFlagsBits = OUTLINED_FUNCTION_14_12();
  OUTLINED_FUNCTION_11_14(v43);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v33 = v9;
  v44._countAndFlagsBits = OUTLINED_FUNCTION_14_12();
  OUTLINED_FUNCTION_11_14(v44);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v32 = v10;
  OUTLINED_FUNCTION_13_17();
  v45._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v29);
  OUTLINED_FUNCTION_11_14(v45);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v30 = v11;
  _StringGuts.grow(_:)(22);
  OUTLINED_FUNCTION_7_16();
  v46._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v26);
  OUTLINED_FUNCTION_11_14(v46);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_6_19();
  v27 = v12;
  _StringGuts.grow(_:)(25);
  OUTLINED_FUNCTION_7_16();
  OUTLINED_FUNCTION_11_20((uint64_t)"expectedThroughputVIBE ");
  v47._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v24);
  OUTLINED_FUNCTION_11_14(v47);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_6_19();
  v25 = v13;
  _StringGuts.grow(_:)(21);
  OUTLINED_FUNCTION_7_16();
  v48._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v22);
  OUTLINED_FUNCTION_11_14(v48);
  OUTLINED_FUNCTION_6_4();
  _StringGuts.grow(_:)(21);
  OUTLINED_FUNCTION_7_16();
  v49._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v23);
  OUTLINED_FUNCTION_11_14(v49);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_7_16();
  OUTLINED_FUNCTION_11_20((uint64_t)"btRetransmissionRateTx ");
  v50._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v28);
  OUTLINED_FUNCTION_11_14(v50);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_7_16();
  OUTLINED_FUNCTION_11_20((uint64_t)"btRetransmissionRateRx ");
  v51._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v31);
  OUTLINED_FUNCTION_11_14(v51);
  swift_bridgeObjectRelease();
  v52._countAndFlagsBits = OUTLINED_FUNCTION_1_35(v34);
  OUTLINED_FUNCTION_11_14(v52);
  OUTLINED_FUNCTION_10_2();
  v14._object = (void *)0xEA0000000000206ELL;
  v14._countAndFlagsBits = 0x656B6154656D6974;
  String.append(_:)(v14);
  Double.write<A>(to:)();
  _StringGuts.grow(_:)(86);
  v15._countAndFlagsBits = 0xD000000000000018;
  v15._object = (void *)0x8000000246F795C0;
  String.append(_:)(v15);
  OUTLINED_FUNCTION_5_23(v39);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v38);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v37);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v36);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v35);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v33);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v32);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v30);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v27);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_5_23(v25);
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_1_6();
  v16._countAndFlagsBits = 0xD000000000000013;
  v16._object = (void *)0x8000000246F79540;
  String.append(_:)(v16);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_1_6();
  v17._countAndFlagsBits = 0xD000000000000013;
  v17._object = (void *)0x8000000246F79560;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_6();
  v18._countAndFlagsBits = 0xD000000000000013;
  v18._object = (void *)0x8000000246F79560;
  String.append(_:)(v18);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_1_6();
  v19._countAndFlagsBits = 0xD000000000000013;
  v19._object = (void *)0x8000000246F79560;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_9_5(0x20686365547462);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_1_6();
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t getEnumTagSinglePayload for LinkRecommendationInfo(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[112])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkRecommendationInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for LinkRecommendationInfo()
{
  return &type metadata for LinkRecommendationInfo;
}

uint64_t OUTLINED_FUNCTION_1_35@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = a1;
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

void OUTLINED_FUNCTION_11_20(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = (a1 - 32) | 0x8000000000000000;
}

void OUTLINED_FUNCTION_12_18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = 0;
  *(_QWORD *)(v1 - 112) = v0;
  _StringGuts.grow(_:)(25);
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  _OWORD v4[2];

  if (*(_QWORD *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v4);
    specialized Dictionary._Variant.setValue(_:forKey:)((uint64_t)v4, a2);
    return outlined destroy of AnyHashable(a2);
  }
  else
  {
    outlined destroy of Any?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(v4, a2);
    outlined destroy of AnyHashable(a2);
    return outlined destroy of Any?((uint64_t)v4);
  }
}

void specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v5[2];

  if (*(_QWORD *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v5);
    specialized Dictionary._Variant.setValue(_:forKey:)(v5, a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of Any?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(v5, a2, a3);
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)v5);
  }
  OUTLINED_FUNCTION_5_22();
}

uint64_t static NetworkConnectionError.errorDomain.getter()
{
  uint64_t v0;

  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  v0 = static NetworkConnectionError.errorDomain;
  swift_bridgeObjectRetain();
  return v0;
}

void static NetworkConnectionError.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  static NetworkConnectionError.errorDomain = a1;
  qword_257663580 = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_22();
}

uint64_t (*static NetworkConnectionError.errorDomain.modify())()
{
  if (one-time initialization token for errorDomain != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  return static ConnectionConfigurationError.errorDomain.modify;
}

uint64_t NetworkConnectionError.errorCode.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(uint64_t))((char *)sub_246F650D8 + 4 * byte_246F75A20[*(_QWORD *)(v0 + 24) >> 60]))(6);
}

uint64_t sub_246F650D8()
{
  return 5;
}

uint64_t sub_246F650E0()
{
  return 7;
}

uint64_t sub_246F650E8()
{
  return 8;
}

uint64_t sub_246F650F0()
{
  return 17;
}

uint64_t sub_246F650F8()
{
  return 9;
}

uint64_t sub_246F65100()
{
  return 10;
}

uint64_t sub_246F65108()
{
  return 12;
}

uint64_t sub_246F65110()
{
  return 13;
}

uint64_t sub_246F65118()
{
  return 14;
}

uint64_t sub_246F65120@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  BOOL v5;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  v3 = v2[4];
  if (a1 == 0xA000000000000000 && (v2[1] | v2[2] | v1 | v3) == 0)
    return 0;
  if (!v3)
  {
    v5 = a1 == 0xA000000000000000 && v1 == 1;
    if (v5 && *(_OWORD *)(v2 + 1) == 0)
      return 1;
  }
  if (!v3)
  {
    v8 = a1 == 0xA000000000000000 && v1 == 2;
    if (v8 && *(_OWORD *)(v2 + 1) == 0)
      return 2;
  }
  if (!v3)
  {
    v9 = a1 == 0xA000000000000000 && v1 == 3;
    if (v9 && *(_OWORD *)(v2 + 1) == 0)
      return 3;
  }
  if (!v3)
  {
    v10 = a1 == 0xA000000000000000 && v1 == 4;
    if (v10 && *(_OWORD *)(v2 + 1) == 0)
      return 4;
  }
  if (!v3)
  {
    v11 = a1 == 0xA000000000000000 && v1 == 5;
    if (v11 && *(_OWORD *)(v2 + 1) == 0)
      return 18;
  }
  if (!v3)
  {
    v12 = a1 == 0xA000000000000000 && v1 == 6;
    if (v12 && *(_OWORD *)(v2 + 1) == 0)
      return 19;
  }
  if (!v3)
  {
    v13 = a1 == 0xA000000000000000 && v1 == 7;
    if (v13 && *(_OWORD *)(v2 + 1) == 0)
      return 11;
  }
  if (*(_OWORD *)(v2 + 1) == 0 && v1 == 8 && a1 == 0xA000000000000000 && v3 == 0)
    return 15;
  else
    return 16;
}

uint64_t NetworkConnectionError.errorUserInfo.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
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
  uint64_t v16;

  v1 = *v0;
  v2 = v0[3];
  v3 = v0[4];
  v16 = Dictionary.init(dictionaryLiteral:)();
  v4 = v2 >> 60;
  if ((v2 >> 60) <= 9)
  {
    if ((_DWORD)v4 == 3)
      v5 = v3;
    else
      v5 = v1;
    if (v5)
    {
      OUTLINED_FUNCTION_1_36();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      type metadata accessor for NSError();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        OUTLINED_FUNCTION_0_49(v6, v7, v6, v7, v8);
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_36();
    }
    if ((_DWORD)v4 == 3)
    {
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_0_49(v9, v10, v9, v10, v11);
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_0_49(v12, v13, v12, v13, v14);
    }
  }
  return v16;
}

uint64_t protocol witness for Error._domain.getter in conformance NetworkConnectionError()
{
  lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
  return Error<>._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance NetworkConnectionError()
{
  lazy protocol witness table accessor for type NetworkConnectionError and conformance NetworkConnectionError();
  return Error<>._code.getter();
}

void destroy for NetworkConnectionError(uint64_t a1)
{
  outlined consume of NetworkConnectionError(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(void **)(a1 + 32));
}

_QWORD *initializeWithCopy for NetworkConnectionError(_QWORD *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(void **)(a2 + 32);
  outlined copy of NetworkConnectionError(*(id *)a2, v4, v5, v6, v7);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t assignWithCopy for NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(void **)(a2 + 32);
  outlined copy of NetworkConnectionError(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(void **)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  outlined consume of NetworkConnectionError(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for NetworkConnectionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  __int128 v9;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 32) = v3;
  outlined consume of NetworkConnectionError(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkConnectionError(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8) >> 1;
      if (v2 > 0x80000000)
        v3 = ~(_DWORD)v2;
      else
        v3 = -1;
    }
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkConnectionError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 2 * -a2;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 16) = 0;
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t getEnumTag for NetworkConnectionError(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 24) >> 60;
  if (v1 <= 9)
    return v1;
  else
    return (*(_DWORD *)a1 + 10);
}

uint64_t destructiveProjectEnumData for NetworkConnectionError(uint64_t result)
{
  *(_QWORD *)(result + 24) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

_QWORD *destructiveInjectEnumTag for NetworkConnectionError(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2 < 0xA)
  {
    v2 = result[3] & 1 | (a2 << 60);
    result[1] &= 1uLL;
    result[3] = v2;
  }
  else
  {
    result[1] = 0;
    result[2] = 0;
    *result = (a2 - 10);
    *(_OWORD *)(result + 3) = xmmword_246F72F10;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkConnectionError()
{
  return &type metadata for NetworkConnectionError;
}

void OUTLINED_FUNCTION_0_49(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  specialized Dictionary.subscript.setter((uint64_t)va, a3, a4);
}

id OUTLINED_FUNCTION_1_36()
{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;

  return outlined copy of NetworkConnectionError(v3, v4, v0, v2, v1);
}

void static NetworkAnalytics.netProvider(from:)()
{
  uint64_t v0;
  char v1;

  String.lowercased()();
  OUTLINED_FUNCTION_17_16();
  if (v0 == 0xD000000000000018 && (OUTLINED_FUNCTION_34_8(), v1)
    || (OUTLINED_FUNCTION_0_50() & 1) != 0
    || v0 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_13_18((uint64_t)"siricorenetworksessionprovider"), v1)
    || (OUTLINED_FUNCTION_0_50() & 1) != 0
    || v0 == 0xD000000000000014 && (OUTLINED_FUNCTION_34_8(), v1)
    || (OUTLINED_FUNCTION_0_50() & 1) != 0
    || v0 == 0xD000000000000017 && (OUTLINED_FUNCTION_34_8(), v1)
    || (OUTLINED_FUNCTION_0_50() & 1) != 0
    || v0 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_13_18((uint64_t)"sirinetworkrpcospreyconnection"), v1))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

void static NetworkAnalytics.netSnapshotState(from:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  BOOL v3;
  BOOL v4;

  v2 = String.lowercased()();
  v3 = v2._countAndFlagsBits == 0x6574736575716572 && v2._object == (void *)0xEA0000000000646ELL;
  if (v3
    || (OUTLINED_FUNCTION_17_16(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || (v1 == 0x6674736575716572 ? (v4 = v0 == 0xED000064656C6961) : (v4 = 0), v4))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t static NetworkAnalytics.netConnectionMethod(from:)()
{
  char v1;

  String.lowercased()();
  lazy protocol witness table accessor for type String and conformance String();
  if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    return 1;
  }
  else if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    return 2;
  }
  else if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    return 3;
  }
  else if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    return 4;
  }
  else
  {
    OUTLINED_FUNCTION_45_1();
    if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
    {
      OUTLINED_FUNCTION_10_2();
      return 5;
    }
    else if ((OUTLINED_FUNCTION_2_32() & 1) != 0)
    {
      OUTLINED_FUNCTION_10_2();
      return 6;
    }
    else
    {
      v1 = OUTLINED_FUNCTION_2_32();
      OUTLINED_FUNCTION_10_2();
      if ((v1 & 1) != 0)
        return 7;
      else
        return 0;
    }
  }
}

void static NetworkAnalytics.netTLSVersion(from:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v2 = String.lowercased()();
  if (v2._countAndFlagsBits == 0x3031736C74 && v2._object == (void *)0xE500000000000000)
    goto LABEL_6;
  OUTLINED_FUNCTION_17_16();
  OUTLINED_FUNCTION_33_5();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_51_4();
  if (v1 == (v4 & 0xFFFF0000FFFFFFFFLL | 0x3100000000) && v0 == 0xE500000000000000)
    goto LABEL_6;
  OUTLINED_FUNCTION_33_5();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_51_4();
  if (v1 == (v6 & 0xFFFF0000FFFFFFFFLL | 0x3200000000) && v0 == 0xE500000000000000)
    goto LABEL_6;
  OUTLINED_FUNCTION_33_5();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_51_4();
  v9 = v1 == (v8 & 0xFFFF0000FFFFFFFFLL | 0x3300000000) && v0 == 0xE500000000000000;
  if (v9
    || (OUTLINED_FUNCTION_33_5(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || ((OUTLINED_FUNCTION_51_4(), v1 == (v10 & 0xFFFF0000FFFFFFFFLL | 0x3400000000))
      ? (v11 = v0 == 0xE500000000000000)
      : (v11 = 0),
        v11
     || (OUTLINED_FUNCTION_33_5(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
     || (v1 == 0x30336C7373 ? (v12 = v0 == 0xE500000000000000) : (v12 = 0), v12)))
  {
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

void static NetworkAnalytics.netWiFiPhyMode(from:)()
{
  Swift::String v0;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;

  v0 = String.lowercased()();
  if (v0._countAndFlagsBits == 0x6131312E323038 && v0._object == (void *)0xE700000000000000)
    goto LABEL_6;
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  if (v0._countAndFlagsBits == (v2 & 0xFFFFFFFFFFFFLL | 0x62000000000000)
    && v0._object == (void *)0xE700000000000000)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  if (v0._countAndFlagsBits == (v4 & 0xFFFFFFFFFFFFLL | 0x67000000000000)
    && v0._object == (void *)0xE700000000000000)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  if (v0._countAndFlagsBits == (v6 & 0xFFFFFFFFFFFFLL | 0x6E000000000000)
    && v0._object == (void *)0xE700000000000000)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  if (v0._countAndFlagsBits == (v8 & 0xFFFFFFFFFFFFLL | 0x6361000000000000)
    && v0._object == (void *)0xE800000000000000)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  if (v0._countAndFlagsBits == (v10 & 0xFFFFFFFFFFFFLL | 0x7861000000000000)
    && v0._object == (void *)0xE800000000000000)
  {
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_8_23();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_21();
  v13 = v0._countAndFlagsBits == (v12 & 0xFFFFFFFFFFFFLL | 0x6A61000000000000)
     && v0._object == (void *)0xE800000000000000;
  if (v13
    || (OUTLINED_FUNCTION_8_23(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || ((OUTLINED_FUNCTION_10_21(), v0._countAndFlagsBits == (v14 & 0xFFFFFFFFFFFFLL | 0x6861000000000000))
      ? (v15 = v0._object == (void *)0xE800000000000000)
      : (v15 = 0),
        v15
     || (OUTLINED_FUNCTION_8_23(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
     || ((OUTLINED_FUNCTION_10_21(), v0._countAndFlagsBits == (v16 & 0xFFFFFFFFFFFFLL | 0x6461000000000000))
       ? (v17 = v0._object == (void *)0xE800000000000000)
       : (v17 = 0),
         v17)))
  {
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_8_23();
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t static NetworkAnalytics.netDebugSessionConnectionQuality(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  int v12;
  int v13;
  Swift::String v14;
  BOOL v15;
  BOOL v16;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952E0]), sel_init);
  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v20 = 0;
  v21 = 0;
  v8 = 0;
  while (v5)
  {
    v5 &= v5 - 1;
LABEL_20:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    static NetworkAnalytics.netQuality(fromString:)();
    v13 = v12;
    swift_bridgeObjectRelease();
    v14 = String.lowercased()();
    swift_bridgeObjectRelease();
    v15 = v14._countAndFlagsBits == 0x72616C756C6C6563 && v14._object == (void *)0xEF746E6174736E69;
    if (v15 || (OUTLINED_FUNCTION_42_5(), (OUTLINED_FUNCTION_7_9() & 1) != 0))
    {
      result = swift_bridgeObjectRelease();
      HIDWORD(v21) = v13;
    }
    else if (v14._countAndFlagsBits == 0xD000000000000012 && v14._object == (void *)0x8000000246F781F0
           || (OUTLINED_FUNCTION_7_9() & 1) != 0)
    {
      result = swift_bridgeObjectRelease();
      LODWORD(v21) = v13;
    }
    else
    {
      v16 = v14._countAndFlagsBits == 0x74736E6969666977 && v14._object == (void *)0xEB00000000746E61;
      if (v16 || (OUTLINED_FUNCTION_7_9() & 1) != 0)
      {
        result = swift_bridgeObjectRelease();
        HIDWORD(v20) = v13;
      }
      else
      {
        if (v14._countAndFlagsBits == 0x7473696869666977 && v14._object == (void *)0xEE006C616369726FLL)
        {
          result = swift_bridgeObjectRelease();
          goto LABEL_43;
        }
        v18 = OUTLINED_FUNCTION_7_9();
        result = swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
LABEL_43:
          LODWORD(v20) = v13;
      }
    }
  }
  v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v9 >= v6)
    goto LABEL_44;
  v10 = *(_QWORD *)(v2 + 8 * v9);
  ++v8;
  if (v10)
    goto LABEL_19;
  v8 = v9 + 1;
  if (v9 + 1 >= v6)
    goto LABEL_44;
  v10 = *(_QWORD *)(v2 + 8 * v8);
  if (v10)
    goto LABEL_19;
  v8 = v9 + 2;
  if (v9 + 2 >= v6)
    goto LABEL_44;
  v10 = *(_QWORD *)(v2 + 8 * v8);
  if (v10)
  {
LABEL_19:
    v5 = (v10 - 1) & v10;
    goto LABEL_20;
  }
  v11 = v9 + 3;
  if (v11 >= v6)
  {
LABEL_44:
    swift_release();
    objc_msgSend(v19, sel_setSymptomsCellularInstant_, HIDWORD(v21));
    objc_msgSend(v19, sel_setSymptomsCellularHistorical_, v21);
    objc_msgSend(v19, sel_setSymptomsWiFiInstant_, HIDWORD(v20));
    objc_msgSend(v19, sel_setSymptomsWiFiHistorical_, v20);
    return (uint64_t)v19;
  }
  v10 = *(_QWORD *)(v2 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_19;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v6)
      goto LABEL_44;
    v10 = *(_QWORD *)(v2 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_19;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netEndpointType(from:)(unsigned int a1)
{
  if (a1 < 5)
    return a1 + 1;
  else
    return 0;
}

void static NetworkAnalytics.netPathStatus(from:)()
{
  void *v0;
  uint64_t v1;
  char v2;
  Swift::String v3;
  Swift::String v5;
  Swift::String v7;

  String.lowercased()();
  OUTLINED_FUNCTION_17_16();
  v3 = String.lowercased()();
  if (v3._countAndFlagsBits == v1 && v3._object == v0)
    goto LABEL_14;
  OUTLINED_FUNCTION_0_50();
  OUTLINED_FUNCTION_13_4();
  if ((v2 & 1) == 0)
  {
    v5 = String.lowercased()();
    if (v5._countAndFlagsBits != v1 || v5._object != v0)
    {
      OUTLINED_FUNCTION_0_50();
      OUTLINED_FUNCTION_13_4();
      if ((v2 & 1) != 0)
        goto LABEL_6;
      OUTLINED_FUNCTION_46_5();
      v7 = String.lowercased()();
      if (v7._countAndFlagsBits != v1 || v7._object != v0)
      {
        OUTLINED_FUNCTION_0_50();
        OUTLINED_FUNCTION_10_2();
        OUTLINED_FUNCTION_8_2();
        goto LABEL_15;
      }
    }
LABEL_14:
    OUTLINED_FUNCTION_9_24();
    goto LABEL_15;
  }
LABEL_6:
  OUTLINED_FUNCTION_10_2();
LABEL_15:
  OUTLINED_FUNCTION_23_1();
}

uint64_t static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, void *a9)
{
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  id v26;
  uint64_t v27;
  int v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  Class isa;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  uint64_t v59;
  unsigned __int8 v60;

  v54 = a6;
  v55 = a5;
  v52 = a2;
  v53 = a4;
  v14 = (uint64_t)a9;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v51 - v19;
  v21 = (int *)OUTLINED_FUNCTION_0_7();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = v9;
  v58 = a8;
  v56 = a7;
  v57 = a1;
  if (a9)
  {
    v25 = OUTLINED_FUNCTION_44_5(v22, sel_connectionType);
    v26 = objc_msgSend(v25, sel_technology);

  }
  else
  {
    v26 = 0;
  }
  LOBYTE(v27) = ConnectionType.init(rawValue:)((Swift::Int)v26);
  v28 = v60;
  if (!a9)
  {
    v33 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v33);
    v34 = 0;
LABEL_11:
    type metadata accessor for CTServiceDescriptor(0, &lazy cache variable for type metadata for NSNumber);
    isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
    goto LABEL_12;
  }
  v29 = OUTLINED_FUNCTION_44_5(v27, sel_connectionURL);
  if (v29)
  {
    v30 = v29;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v31 = type metadata accessor for URL();
    v32 = 0;
  }
  else
  {
    v31 = type metadata accessor for URL();
    v32 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v32, 1, v31);
  outlined init with take of URL?((uint64_t)v18, (uint64_t)v20);
  v35 = (uint64_t)objc_msgSend(a9, sel_interfaceIndex);
  if ((v35 & 0x80000000) != 0)
  {
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_16_18();
    result = OUTLINED_FUNCTION_16_9();
    __break(1u);
    return result;
  }
  v34 = v35;
  isa = (Class)OUTLINED_FUNCTION_44_5(v35, sel_sendBufferSize);
  if (!isa)
    goto LABEL_11;
LABEL_12:
  v37 = UInt64.init(truncating:)();

  if (a9)
  {
    v38 = objc_msgSend(a9, sel_wwanPreferred);
    v14 = outlined bridged method (pb) of @objc SAConnectionPolicy.policyId.getter(a9);
    v40 = v39;
  }
  else
  {
    v40 = 0;
    v38 = 0;
  }
  if (v28 == 25)
    LOBYTE(v28) = 0;
  outlined init with take of URL?((uint64_t)v20, (uint64_t)v24);
  v41 = &v24[v21[5]];
  *(_DWORD *)v41 = v34;
  v41[4] = 0;
  *(_QWORD *)&v24[v21[6]] = v37;
  v24[v21[7]] = v38;
  v24[v21[8]] = v28;
  v42 = (uint64_t *)&v24[v21[9]];
  *v42 = v14;
  v42[1] = v40;
  if (a3)
    v43 = v52;
  else
    v43 = 0;
  if (a3)
    v44 = a3;
  else
    v44 = 0xE000000000000000;
  if (v55)
    v45 = v53;
  else
    v45 = 0;
  if (v55)
    v46 = v55;
  else
    v46 = 0xE000000000000000;
  if (v56)
    v47 = v54;
  else
    v47 = 0;
  if (v56)
    v48 = v56;
  else
    v48 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49 = static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:connectionAnalysisInfo:)(v57, v43, v44, v45, v46, v47, v48, v58 & 1, (uint64_t)v24);
  OUTLINED_FUNCTION_8_2();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ConnectionAnalysisInfo((uint64_t)v24);
  return (uint64_t)v49;
}

id static NetworkAnalytics.netSessionConnectionFailed(error:connectionMode:sessionType:sessionState:isDormant:connectionAnalysisInfo:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95340]), sel_init);
  if (!a1)
  {
    v66 = 0u;
    v67 = 0u;
LABEL_12:
    v34 = outlined destroy of Any?((uint64_t)&v66);
LABEL_13:
    if (!v11)
      goto LABEL_16;
    goto LABEL_14;
  }
  v12 = objc_allocWithZone(MEMORY[0x24BE952F8]);
  v13 = a1;
  v14 = objc_msgSend(v12, sel_init);
  if (v14)
  {
    v15 = v14;
    v64 = a5;
    v16 = OUTLINED_FUNCTION_12_3((uint64_t)v14, sel_domain);
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_12_19(v17, v18, v19, (SEL *)&selRef_setDomain_);
    v21 = OUTLINED_FUNCTION_12_3(v20, sel_description);
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_12_19(v22, v23, v24, (SEL *)&selRef_setDescription_);
    v26 = OUTLINED_FUNCTION_12_3(v25, sel_code);
    OUTLINED_FUNCTION_49_4((uint64_t)v26, sel_setErrorCode_);
    if (v11)
    {
      v27 = v11;
      v28 = v15;
      OUTLINED_FUNCTION_39_7((uint64_t)v28, sel_setError_);

    }
  }

  v30 = OUTLINED_FUNCTION_12_3(v29, sel_userInfo);
  v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  specialized Dictionary.subscript.getter(v32, v33, v31, &v66);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v67 + 1))
    goto LABEL_12;
  type metadata accessor for CTServiceDescriptor(0, (unint64_t *)&lazy cache variable for type metadata for NSError);
  v34 = OUTLINED_FUNCTION_11_4();
  if ((v34 & 1) == 0)
    goto LABEL_13;
  v35 = v65;
  v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952F8]), sel_init);
  if (v36)
  {
    v37 = v36;
    v64 = a5;
    v38 = OUTLINED_FUNCTION_12_3((uint64_t)v36, sel_domain);
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_12_19(v39, v40, v41, (SEL *)&selRef_setDomain_);
    v43 = OUTLINED_FUNCTION_12_3(v42, sel_description);
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_12_19(v44, v45, v46, (SEL *)&selRef_setDescription_);
    v48 = OUTLINED_FUNCTION_12_3(v47, sel_code);
    OUTLINED_FUNCTION_49_4((uint64_t)v48, sel_setErrorCode_);
    if (!v11)
    {

      goto LABEL_15;
    }
    v49 = v11;
    v50 = v37;
    OUTLINED_FUNCTION_39_7((uint64_t)v50, sel_setUnderlyingError_);

LABEL_14:
    LOBYTE(v66) = *(_BYTE *)(a9 + *(int *)(OUTLINED_FUNCTION_0_7() + 32));
    v51 = ConnectionType.netConnectionType.getter();
    OUTLINED_FUNCTION_0_8(v51, sel_setConnectionType_);
    v52 = v11;
    static NetworkAnalytics.netConnectionMode(from:)();
    OUTLINED_FUNCTION_12_3(v53, sel_setConnectionMode_);

    v54 = v52;
    static NetworkAnalytics.netSessionType(from:)();
    OUTLINED_FUNCTION_12_3(v55, sel_setSessionType_);

    v35 = v54;
    static NetworkAnalytics.netSessionState(from:)();
    OUTLINED_FUNCTION_12_3(v56, sel_setNetworkSessionState_);
LABEL_15:

    goto LABEL_16;
  }

  if (v11)
    goto LABEL_14;
LABEL_16:
  OUTLINED_FUNCTION_0_8(v34, sel_setIsDormant_);
  if (v11)
  {
    v57 = OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_0_8(v57, sel_setIsWwanPreferred_);
    objc_msgSend(v11, sel_setSendBufferSize_, *(_QWORD *)(a9 + *(int *)(v57 + 24)));
    v58 = (uint64_t *)(a9 + *(int *)(v57 + 36));
    v59 = (void *)v58[1];
    if (v59)
    {
      v60 = *v58;
      v61 = v11;
      v59 = (void *)MEMORY[0x24956D034](v60, v59);
    }
    else
    {
      v62 = v11;
    }
    objc_msgSend(v11, sel_setPolicyId_, v59, v64);

  }
  return v11;
}

void static NetworkAnalytics.netConnectionMode(from:)()
{
  uint64_t v0;
  Swift::String v1;
  BOOL v2;

  v1 = String.lowercased()();
  v2 = v1._countAndFlagsBits == 0x6E61747369737361 && v1._object == (void *)0xE900000000000074;
  if (v2
    || (OUTLINED_FUNCTION_17_16(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || v0 == 0xD000000000000015 && (OUTLINED_FUNCTION_13_18((uint64_t)"assistantanddictation"), v2))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_46_5();
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

void static NetworkAnalytics.netSessionType(from:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;

  v2 = String.lowercased()();
  v3 = v2._countAndFlagsBits == 0x6C61636F6CLL && v2._object == (void *)0xE500000000000000;
  if (v3
    || (OUTLINED_FUNCTION_17_16(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || (v1 == 0x65746F6D6572 ? (v4 = v0 == 0xE600000000000000) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_30_7(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
     || (v1 == 0x696C65746F6D6572 ? (v5 = v0 == 0xED0000646574696DLL) : (v5 = 0),
         v5
      || (OUTLINED_FUNCTION_30_7(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
      || (v1 == 0x756665746F6D6572 ? (v6 = v0 == 0xEA00000000006C6CLL) : (v6 = 0), v6))))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_30_7();
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

void static NetworkAnalytics.netSessionState(from:)()
{
  Swift::String v0;
  BOOL v1;
  BOOL v2;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  v0 = String.lowercased()();
  v1 = v0._countAndFlagsBits == 0x6C616974696E69 && v0._object == (void *)0xE700000000000000;
  if (v1 || (OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  v2 = v0._countAndFlagsBits == 0x676E6974696177 && v0._object == (void *)0xE700000000000000;
  if (v2 || (OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  if (v0._countAndFlagsBits == 0x6961777972746572 && v0._object == (void *)0xEC000000676E6974)
    goto LABEL_6;
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  if (v0._countAndFlagsBits == 0xD000000000000011)
  {
    OUTLINED_FUNCTION_13_18((uint64_t)"connectionstarted");
    if (v1)
      goto LABEL_6;
  }
  OUTLINED_FUNCTION_46_5();
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0)
    goto LABEL_6;
  if (v0._countAndFlagsBits == 0xD000000000000010)
  {
    OUTLINED_FUNCTION_13_18((uint64_t)"connectionopened");
    if (v1)
      goto LABEL_6;
  }
  if ((OUTLINED_FUNCTION_0_50() & 1) != 0
    || (v0._countAndFlagsBits == 0x6F6464656E65706FLL ? (v4 = v0._object == (void *)0xED0000746E616D72) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_0_50() & 1) != 0
     || (v0._countAndFlagsBits == 0x69746E6568747561 ? (v5 = v0._object == (void *)0xEE00676E69746163) : (v5 = 0),
         v5
      || (OUTLINED_FUNCTION_0_50() & 1) != 0
      || (v0._countAndFlagsBits == 0x676E69646C6F68 ? (v6 = v0._object == (void *)0xE700000000000000) : (v6 = 0),
          v6
       || (OUTLINED_FUNCTION_0_50() & 1) != 0
       || (v0._countAndFlagsBits == 0x7361657461657263 ? (v7 = v0._object == (void *)0xEF746E6174736973) : (v7 = 0),
           v7
        || (OUTLINED_FUNCTION_0_50() & 1) != 0
        || (v0._countAndFlagsBits == 0x6973736164616F6CLL ? (v8 = v0._object == (void *)0xED0000746E617473) : (v8 = 0),
            v8
         || (OUTLINED_FUNCTION_0_50() & 1) != 0
         || v0._countAndFlagsBits == 0xD000000000000010 && (OUTLINED_FUNCTION_13_18((uint64_t)"destroyassistant"), v1)
         || (OUTLINED_FUNCTION_0_50() & 1) != 0
         || (v0._countAndFlagsBits == 0x657669746361 ? (v9 = v0._object == (void *)0xE600000000000000) : (v9 = 0), v9)))))))
  {
LABEL_6:
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t static NetworkAnalytics.netEndpointFromDictionary(_:)()
{
  id v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952F0]), sel_init);
  v1 = OUTLINED_FUNCTION_43_6(1701869940);
  if ((v2 & 1) == 0)
  {
    if ((v1 & 0x8000000000000000) != 0)
      goto LABEL_11;
    if (HIDWORD(v1))
    {
LABEL_12:
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_24_10();
      goto LABEL_13;
    }
    v3 = static NetworkAnalytics.netEndpointType(from:)(v1);
    OUTLINED_FUNCTION_0_8(v3, sel_setType_);
  }
  v4 = OUTLINED_FUNCTION_43_6(1953656688);
  if ((v5 & 1) != 0 || !v0)
    return (uint64_t)v0;
  if ((v4 & 0x8000000000000000) == 0)
  {
    if (!HIDWORD(v4))
    {
      OUTLINED_FUNCTION_0_8(v4, sel_setPort_);
      return (uint64_t)v0;
    }
    goto LABEL_12;
  }
LABEL_11:
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_16_18();
LABEL_13:
  result = OUTLINED_FUNCTION_16_9();
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netEndpointsFromArray(_:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _BYTE v8[32];
  uint64_t v9;

  result = MEMORY[0x24BEE4AF8];
  v9 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a1 + 32;
    v5 = swift_bridgeObjectRetain();
    do
    {
      OUTLINED_FUNCTION_35_4(v5, (uint64_t)v8);
      OUTLINED_FUNCTION_29_6();
      v5 = OUTLINED_FUNCTION_11_4();
      if ((v5 & 1) != 0)
      {
        v6 = (void *)OUTLINED_FUNCTION_38_8();
        v5 = swift_bridgeObjectRelease();
        if (v6)
        {
          v7 = v6;
          MEMORY[0x24956D118]();
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            OUTLINED_FUNCTION_28_7();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();

        }
      }
      v4 += 32;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_10_2();
    return v9;
  }
  return result;
}

uint64_t static NetworkAnalytics.netPathType(from:)(uint64_t result)
{
  if ((result - 1) >= 4)
    return 0;
  else
    return result;
}

void static NetworkAnalytics.netPathType(from:)()
{
  void *v0;
  uint64_t v1;
  char v2;
  Swift::String v3;
  Swift::String v5;
  Swift::String v7;
  Swift::String v9;
  Swift::String v11;

  String.lowercased()();
  OUTLINED_FUNCTION_17_16();
  v3 = String.lowercased()();
  if (v3._countAndFlagsBits != v1 || v3._object != v0)
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_13_4();
    if ((v2 & 1) != 0)
      goto LABEL_28;
    v5 = String.lowercased()();
    if (v5._countAndFlagsBits != v1 || v5._object != v0)
    {
      OUTLINED_FUNCTION_0_50();
      OUTLINED_FUNCTION_13_4();
      if ((v2 & 1) != 0)
        goto LABEL_28;
      OUTLINED_FUNCTION_42_5();
      v7 = String.lowercased()();
      if (v7._countAndFlagsBits != v1 || v7._object != v0)
      {
        OUTLINED_FUNCTION_0_50();
        OUTLINED_FUNCTION_13_4();
        if ((v2 & 1) != 0)
          goto LABEL_28;
        v9 = String.lowercased()();
        if (v9._countAndFlagsBits != v1 || v9._object != v0)
        {
          OUTLINED_FUNCTION_0_50();
          OUTLINED_FUNCTION_13_4();
          if ((v2 & 1) != 0)
          {
LABEL_28:
            OUTLINED_FUNCTION_10_2();
            goto LABEL_8;
          }
          v11 = String.lowercased()();
          if (v11._countAndFlagsBits != v1 || v11._object != v0)
          {
            OUTLINED_FUNCTION_0_50();
            OUTLINED_FUNCTION_10_2();
            OUTLINED_FUNCTION_8_2();
            goto LABEL_8;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_24();
LABEL_8:
  OUTLINED_FUNCTION_23_1();
}

uint64_t static NetworkAnalytics.netPathInterfaces(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
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
  unint64_t v25;
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
  uint64_t v39;
  unint64_t v40;
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
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  result = MEMORY[0x24BEE4AF8];
  v65 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return result;
  v5 = OUTLINED_FUNCTION_26_10();
  while (1)
  {
    OUTLINED_FUNCTION_35_4(v5, (uint64_t)&v63);
    OUTLINED_FUNCTION_29_6();
    v5 = OUTLINED_FUNCTION_11_4();
    if ((v5 & 1) != 0)
      break;
LABEL_29:
    v1 += 32;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v65;
    }
  }
  v6 = v61;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95328]), sel_init);
  if (!v7)
  {
    v5 = OUTLINED_FUNCTION_44_1();
    goto LABEL_29;
  }
  v8 = v7;
  if (*(_QWORD *)(v61 + 16))
  {
    v9 = specialized __RawDictionaryStorage.find<A>(_:)(1701869940, 0xE400000000000000);
    if ((v10 & 1) != 0)
    {
      v16 = OUTLINED_FUNCTION_21_13(v9, v10, v11, v12, v13, v14, v15);
      OUTLINED_FUNCTION_36_3(v16, v17, v18, v19, v20, v21, v22, v23, v57, v58, v59, v60, v61);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
      {
        if ((v61 & 0x8000000000000000) != 0)
          goto LABEL_32;
        if (HIDWORD(v61))
          goto LABEL_33;
        v24 = static NetworkAnalytics.netPathType(from:)(v61);
        OUTLINED_FUNCTION_47_5(v24, sel_setType_);
      }
    }
  }
  if (*(_QWORD *)(v6 + 16))
  {
    v25 = specialized __RawDictionaryStorage.find<A>(_:)(1701667182, 0xE400000000000000);
    if ((v26 & 1) != 0)
    {
      v32 = OUTLINED_FUNCTION_21_13(v25, v26, v27, v28, v29, v30, v31);
      OUTLINED_FUNCTION_36_3(v32, v33, v34, v35, v36, v37, v38, v39, v57, v58, v59, v60, v61);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
        outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(v61, v62, v8, (SEL *)&selRef_setName_);
    }
  }
  if (*(_QWORD *)(v6 + 16)
    && (v40 = specialized __RawDictionaryStorage.find<A>(_:)(0x7865646E69, 0xE500000000000000), (v41 & 1) != 0))
  {
    OUTLINED_FUNCTION_21_13(v40, v41, v42, v43, v44, v45, v46);
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  v47 = OUTLINED_FUNCTION_44_1();
  if (!*((_QWORD *)&v64 + 1))
  {
    outlined destroy of Any?((uint64_t)&v63);
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_36_3(v47, v48, v49, v50, v51, v52, v53, v54, v57, v58, v59, v60, v61);
  v55 = OUTLINED_FUNCTION_11_4();
  if ((v55 & 1) == 0)
  {
LABEL_26:
    v56 = v8;
    MEMORY[0x24956D118]();
    if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_28_7();
    OUTLINED_FUNCTION_50_2();
    specialized Array._endMutation()();

    goto LABEL_29;
  }
  if ((v61 & 0x8000000000000000) != 0)
  {
LABEL_32:
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_16_18();
    goto LABEL_34;
  }
  if (!HIDWORD(v61))
  {
    OUTLINED_FUNCTION_47_5(v55, sel_setIndex_);
    goto LABEL_26;
  }
LABEL_33:
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_24_10();
LABEL_34:
  result = OUTLINED_FUNCTION_16_9();
  __break(1u);
  return result;
}

uint64_t static NetworkAnalytics.netPathStatus(from:)(unsigned int a1)
{
  if (a1 < 4)
    return a1 + 1;
  else
    return 0;
}

void static NetworkAnalytics.netEstablishmentResolution(from:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v92 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_42:
    OUTLINED_FUNCTION_62_2();
    return;
  }
  v4 = 0xD000000000000010;
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_45_1();
  v87 = v5;
  v88 = v6;
  OUTLINED_FUNCTION_45_1();
  v86 = v8;
  while (1)
  {
    OUTLINED_FUNCTION_35_4(v7, (uint64_t)&v90);
    OUTLINED_FUNCTION_29_6();
    v7 = OUTLINED_FUNCTION_11_4();
    if ((v7 & 1) != 0)
      break;
LABEL_40:
    v2 += 32;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_42;
    }
  }
  v9 = v89;
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95300]), sel_init);
  if (!v10)
  {
    v7 = OUTLINED_FUNCTION_44_1();
    goto LABEL_40;
  }
  v11 = v10;
  if (*(_QWORD *)(v89 + 16))
  {
    v12 = specialized __RawDictionaryStorage.find<A>(_:)(0x6E6F697461727564, 0xE800000000000000);
    if ((v13 & 1) != 0)
    {
      v20 = OUTLINED_FUNCTION_5_27(v12, v13, v14, v15, v16, v17, v18, v19, v80);
      OUTLINED_FUNCTION_32_3(v20, v21, v22, v23, v24, v25, v26, v27, v81, v83, v84, v85, v86, v87, v88, v89);
      v28 = OUTLINED_FUNCTION_11_4();
      if ((v28 & 1) != 0)
      {
        if ((v89 & 0x8000000000000000) != 0)
          goto LABEL_43;
        OUTLINED_FUNCTION_49_4(v28, sel_setDuration_);
      }
    }
  }
  if (*(_QWORD *)(v9 + 16))
  {
    v29 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, v86);
    if ((v30 & 1) != 0)
    {
      v37 = OUTLINED_FUNCTION_5_27(v29, v30, v31, v32, v33, v34, v35, v36, v80);
      OUTLINED_FUNCTION_32_3(v37, v38, v39, v40, v41, v42, v43, v44, v82, v83, v84, v85, v86, v87, v88, v89);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
      {
        if ((v89 & 0x8000000000000000) != 0)
          goto LABEL_43;
        if (HIDWORD(v89))
          goto LABEL_44;
        objc_msgSend(v11, sel_setResolutionSource_);
      }
    }
  }
  if (*(_QWORD *)(v9 + 16))
  {
    v45 = specialized __RawDictionaryStorage.find<A>(_:)(v4 + 2, v87);
    if ((v46 & 1) != 0)
    {
      OUTLINED_FUNCTION_5_27(v45, v46, v47, v48, v49, v50, v51, v52, v80);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Int]);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
      {
        v4 = v89;
        OUTLINED_FUNCTION_38_8();
        v53 = OUTLINED_FUNCTION_25_10();
        if (v1)
        {
          OUTLINED_FUNCTION_48_3(v53, sel_setSuccessfulEndpoint_);

        }
      }
    }
  }
  if (*(_QWORD *)(v9 + 16))
  {
    v54 = specialized __RawDictionaryStorage.find<A>(_:)(v4 + 1, v88);
    if ((v55 & 1) != 0)
    {
      OUTLINED_FUNCTION_5_27(v54, v55, v56, v57, v58, v59, v60, v61, v80);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Int]);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
      {
        v4 = v89;
        OUTLINED_FUNCTION_38_8();
        v62 = OUTLINED_FUNCTION_25_10();
        if (v1)
        {
          OUTLINED_FUNCTION_48_3(v62, sel_setPreferredEndpoint_);

        }
      }
    }
  }
  if (*(_QWORD *)(v9 + 16)
    && (v63 = specialized __RawDictionaryStorage.find<A>(_:)(0x746E696F70646E65, 0xED0000746E756F43), (v64 & 1) != 0))
  {
    OUTLINED_FUNCTION_5_27(v63, v64, v65, v66, v67, v68, v69, v70, v80);
  }
  else
  {
    v90 = 0u;
    v91 = 0u;
  }
  v71 = OUTLINED_FUNCTION_44_1();
  if (!*((_QWORD *)&v91 + 1))
  {
    outlined destroy of Any?((uint64_t)&v90);
    goto LABEL_37;
  }
  OUTLINED_FUNCTION_32_3(v71, v72, v73, v74, v75, v76, v77, v78, v80, v83, v84, v85, v86, v87, v88, v89);
  if ((OUTLINED_FUNCTION_11_4() & 1) == 0)
  {
LABEL_37:
    v79 = v11;
    MEMORY[0x24956D118]();
    v1 = *(void **)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v1 >= *(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_28_7();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    goto LABEL_40;
  }
  if ((v89 & 0x8000000000000000) != 0)
  {
LABEL_43:
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_16_18();
    goto LABEL_45;
  }
  if (!HIDWORD(v89))
  {
    objc_msgSend(v11, sel_setEndpointCount_);
    goto LABEL_37;
  }
LABEL_44:
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_24_10();
LABEL_45:
  OUTLINED_FUNCTION_16_9();
  __break(1u);
}

id static NetworkAnalytics.netProxyConfiguration(from:)(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95338]), sel_init);
  if (v2)
  {
    v3 = specialized Dictionary.subscript.getter(0x6E6F4379786F7270, 0xEF64657275676966, a1);
    OUTLINED_FUNCTION_0_8(v3, sel_setIsProxyConfigured_);
    v4 = v2;
    OUTLINED_FUNCTION_46_5();
    objc_msgSend(v4, sel_setUsingConfiguredProxy_, specialized Dictionary.subscript.getter(0xD000000000000014, v5, a1) & 1);

  }
  return v2;
}

void static NetworkAnalytics.netProtocol(from:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;

  v2 = String.lowercased()();
  v3 = v2._countAndFlagsBits == 7365492 && v2._object == (void *)0xE300000000000000;
  if (v3
    || (OUTLINED_FUNCTION_17_16(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || (v1 == 7564404 ? (v4 = v0 == 0xE300000000000000) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_0_50() & 1) != 0
     || (v1 == 1886680168 ? (v5 = v0 == 0xE400000000000000) : (v5 = 0), v5)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

void static NetworkAnalytics.netHandshakeProtocol(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
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
  char **v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
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
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = MEMORY[0x24BEE4AF8];
  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
  {
LABEL_30:
    OUTLINED_FUNCTION_62_2();
    return;
  }
  v2 = a1 + 32;
  v73 = a1;
  swift_bridgeObjectRetain();
  v3 = MEMORY[0x24BEE4AD8];
  v4 = 0x24BE95000uLL;
  v5 = &selRef_carrierBundleChange_;
  OUTLINED_FUNCTION_45_1();
  v74 = v7;
  while (1)
  {
    OUTLINED_FUNCTION_35_4(v6, (uint64_t)&v76);
    OUTLINED_FUNCTION_29_6();
    v6 = OUTLINED_FUNCTION_11_4();
    if ((v6 & 1) == 0)
      goto LABEL_28;
    v8 = v75;
    v9 = objc_msgSend(objc_allocWithZone(*(Class *)(v4 + 776)), v5[120]);
    if (!v9)
    {
      v6 = OUTLINED_FUNCTION_44_1();
      goto LABEL_28;
    }
    v10 = v9;
    if (*(_QWORD *)(v75 + 16))
    {
      v11 = specialized __RawDictionaryStorage.find<A>(_:)(0x6C6F636F746F7270, 0xE800000000000000);
      if ((v12 & 1) != 0)
      {
        v19 = OUTLINED_FUNCTION_5_27(v11, v12, v13, v14, v15, v16, v17, v18, v67);
        OUTLINED_FUNCTION_31_4(v19, v20, v21, v22, v23, v24, v25, v26, v68, v70, v71, v72, v73, v74, v75);
        if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
        {
          static NetworkAnalytics.netProtocol(from:)();
          v27 = v5;
          v28 = v4;
          v29 = v3;
          v31 = v30;
          swift_bridgeObjectRelease();
          v32 = v31;
          v3 = v29;
          v4 = v28;
          v5 = v27;
          objc_msgSend(v10, sel_setProtocol_, v32);
        }
      }
    }
    if (*(_QWORD *)(v8 + 16))
    {
      v33 = specialized __RawDictionaryStorage.find<A>(_:)(0x6B616853646E6168, 0xEC00000054545265);
      if ((v34 & 1) != 0)
      {
        v41 = OUTLINED_FUNCTION_5_27(v33, v34, v35, v36, v37, v38, v39, v40, v67);
        OUTLINED_FUNCTION_31_4(v41, v42, v43, v44, v45, v46, v47, v48, v69, v70, v71, v72, v73, v74, v75);
        v49 = OUTLINED_FUNCTION_11_4();
        if ((v49 & 1) != 0)
          break;
      }
    }
LABEL_15:
    if (*(_QWORD *)(v8 + 16)
      && (v50 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, v74), (v51 & 1) != 0))
    {
      OUTLINED_FUNCTION_5_27(v50, v51, v52, v53, v54, v55, v56, v57, v67);
    }
    else
    {
      v76 = 0u;
      v77 = 0u;
    }
    v58 = OUTLINED_FUNCTION_44_1();
    if (*((_QWORD *)&v77 + 1))
    {
      OUTLINED_FUNCTION_31_4(v58, v59, v60, v61, v62, v63, v64, v65, v67, v70, v71, v72, v73, v74, v75);
      if ((OUTLINED_FUNCTION_11_4() & 1) != 0)
      {
        if ((v75 & 0x8000000000000000) != 0)
        {
LABEL_31:
          OUTLINED_FUNCTION_0_0();
          OUTLINED_FUNCTION_16_18();
          goto LABEL_33;
        }
        objc_msgSend(v10, sel_setHandShakeDuration_);
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v76);
    }
    v66 = v10;
    MEMORY[0x24956D118]();
    if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_28_7();
    OUTLINED_FUNCTION_50_2();
    specialized Array._endMutation()();

LABEL_28:
    v2 += 32;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  if ((v75 & 0x8000000000000000) != 0)
    goto LABEL_31;
  if (!HIDWORD(v75))
  {
    OUTLINED_FUNCTION_47_5(v49, sel_setHandShakeRTT_);
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_24_10();
LABEL_33:
  OUTLINED_FUNCTION_16_9();
  __break(1u);
}

void static NetworkAnalytics.netQuality(fromString:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;

  v2 = String.lowercased()();
  v3 = v2._countAndFlagsBits == 6578530 && v2._object == (void *)0xE300000000000000;
  if (v3
    || (OUTLINED_FUNCTION_17_16(), (OUTLINED_FUNCTION_0_50() & 1) != 0)
    || (v1 == 1685024615 ? (v4 = v0 == 0xE400000000000000) : (v4 = 0),
        v4
     || (OUTLINED_FUNCTION_0_50() & 1) != 0
     || (v1 == 0x616C696176616E75 ? (v5 = v0 == 0xEB00000000656C62) : (v5 = 0), v5)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_0_50();
    OUTLINED_FUNCTION_10_2();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  OUTLINED_FUNCTION_40_5();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x24956D568](*(_QWORD *)(v1 + 40), a1, 4);
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(unsigned __int8 a1)
{
  Swift::Int v2;

  OUTLINED_FUNCTION_40_5();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
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
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24956D3DC](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

void outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)MEMORY[0x24956D034]();
  OUTLINED_FUNCTION_8_2();
  objc_msgSend(a3, *a4, v6);

}

uint64_t OUTLINED_FUNCTION_0_50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_2_32()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_5_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  return outlined init with copy of Any(*(_QWORD *)(v9 + 56) + 32 * a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_8_23()
{
  return 0x31312E323038;
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_12_19(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  outlined bridged method (mbnn) of @objc NETSchemaNETError.domain.setter(v4, v5, v6, a4);
}

unint64_t OUTLINED_FUNCTION_13_18@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000;
}

void OUTLINED_FUNCTION_20_14()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_21_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  return outlined init with copy of Any(*(_QWORD *)(v7 + 56) + 32 * a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_25_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_27_10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t OUTLINED_FUNCTION_28_7()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t OUTLINED_FUNCTION_29_6()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return 0x65746F6D6572;
}

char *OUTLINED_FUNCTION_31_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  return &a15;
}

char *OUTLINED_FUNCTION_32_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  return &a16;
}

uint64_t OUTLINED_FUNCTION_33_5()
{
  return 829647988;
}

uint64_t OUTLINED_FUNCTION_35_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return outlined init with copy of Any(v2, a2);
}

char *OUTLINED_FUNCTION_36_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_38_8()
{
  return static NetworkAnalytics.netEndpointFromDictionary(_:)();
}

id OUTLINED_FUNCTION_39_7(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_40_5()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return 0x72616C756C6C6563;
}

uint64_t OUTLINED_FUNCTION_43_6(uint64_t a1)
{
  uint64_t v1;

  return specialized Dictionary.subscript.getter(a1, 0xE400000000000000, v1);
}

id OUTLINED_FUNCTION_44_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_47_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_48_3(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_49_4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

Swift::Void __swiftcall NetworkManager.forceFastDormancy()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint32_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  _DWORD v19[4];

  v0 = type metadata accessor for DispatchQoS.QoSClass();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5490], v0);
  v4 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v5 = _CTServerConnectionCreateOnTargetQueue();

  if (v5)
  {
    v6 = _CTServerForceFastDormancy();
    if ((_DWORD)v6)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_5_1();
      v8 = OUTLINED_FUNCTION_3_1(v7, (uint64_t)static Logger.siriNetwork);
      v9 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = OUTLINED_FUNCTION_8_24();
        *(_DWORD *)v10 = 67109376;
        v19[3] = v6;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v10 + 8) = 1024;
        v19[2] = HIDWORD(v6);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v11 = "NetworkManager - ForceFastDormancy: Failed to forceFastDormancy (%d, %d).";
        v12 = v8;
        v13 = v9;
        v14 = (uint8_t *)v10;
        v15 = 14;
        goto LABEL_11;
      }
    }
    else
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v16 = OUTLINED_FUNCTION_5_1();
      v8 = OUTLINED_FUNCTION_3_1(v16, (uint64_t)static Logger.siriNetwork);
      v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v17))
      {
        v18 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v18 = 0;
        v11 = "NetworkManager - ForceFastDormancy: forceFastDormancy.";
        v12 = v8;
        v13 = v17;
        v14 = v18;
        v15 = 2;
LABEL_11:
        _os_log_impl(&dword_246EC7000, v12, v13, v11, v14, v15);
        OUTLINED_FUNCTION_0_4();
      }
    }

  }
}

void static NetworkManager.acquireDormancySuspendAssertion(_:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  const char *v6;
  uint64_t v7;
  os_log_type_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  _QWORD aBlock[6];

  v2 = type metadata accessor for DispatchQoS.QoSClass();
  MEMORY[0x24BDAC7A8](v2);
  if (!a1)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_5_1();
    v23 = OUTLINED_FUNCTION_3_1(v7, (uint64_t)static Logger.siriNetwork);
    v8 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_5_28(v8))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v5 = 0;
      v6 = "NetworkManager - Assertion: Assertion ref should not be nil.";
LABEL_11:
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v23, (os_log_type_t)a1, v6, v5);
      OUTLINED_FUNCTION_0_4();
    }
    goto LABEL_12;
  }
  if (*a1)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_5_1();
    v23 = OUTLINED_FUNCTION_3_1(v3, (uint64_t)static Logger.siriNetwork);
    v4 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_5_28(v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v5 = 0;
      v6 = "NetworkManager - Assertion: Assertion already acquired.";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  type metadata accessor for OS_dispatch_queue();
  OUTLINED_FUNCTION_6_20();
  v9 = (void *)static OS_dispatch_queue.global(qos:)();
  OUTLINED_FUNCTION_10_22();
  v10 = _CTServerConnectionCreateOnTargetQueue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24956D034](0xD00000000000001ELL, 0x8000000246F797C0);
    OUTLINED_FUNCTION_6_20();
    v12 = (void *)static OS_dispatch_queue.global(qos:)();
    OUTLINED_FUNCTION_10_22();
    aBlock[4] = closure #1 in static NetworkManager.acquireDormancySuspendAssertion(_:);
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    aBlock[3] = &block_descriptor_18;
    v13 = _Block_copy(aBlock);
    v14 = _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB();
    _Block_release(v13);

    if ((_DWORD)v14)
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v15 = OUTLINED_FUNCTION_5_1();
      v16 = OUTLINED_FUNCTION_3_1(v15, (uint64_t)static Logger.siriNetwork);
      v17 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_1_23(v17))
      {
        v18 = OUTLINED_FUNCTION_8_24();
        *(_DWORD *)v18 = 67109376;
        LODWORD(aBlock[0]) = v14;
        OUTLINED_FUNCTION_7_22();
        *(_WORD *)(v18 + 8) = 1024;
        LODWORD(aBlock[0]) = HIDWORD(v14);
        OUTLINED_FUNCTION_7_22();
        _os_log_impl(&dword_246EC7000, v16, (os_log_type_t)v13, "NetworkManager - Assertion: Failed to acquire the dormancy suspend assertion (%d, %d).", (uint8_t *)v18, 0xEu);
        OUTLINED_FUNCTION_0_4();
      }

    }
    else
    {
      if (one-time initialization token for siriNetwork != -1)
        swift_once();
      v19 = OUTLINED_FUNCTION_5_1();
      v20 = OUTLINED_FUNCTION_3_1(v19, (uint64_t)static Logger.siriNetwork);
      v21 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v22 = 0;
        OUTLINED_FUNCTION_8_0(&dword_246EC7000, v20, v21, "NetworkManager - Assertion: Acquired dormany suspension assertion.", v22);
        OUTLINED_FUNCTION_0_4();
      }

    }
  }
}

void closure #1 in static NetworkManager.acquireDormancySuspendAssertion(_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriNetwork);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_246EC7000, oslog, v1, "NetworkManager - Assertion: Dormancy Suspend Assertion auto expired.", v2, 2u);
    MEMORY[0x24956E018](v2, -1, -1);
  }

}

void static NetworkManager.releaseDormancySuspendAssertion(_:)(_QWORD *a1)
{
  os_log_type_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (a1)
  {
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_3_1(v3, (uint64_t)static Logger.siriNetwork);
    v5 = static os_log_type_t.default.getter();
    if (OUTLINED_FUNCTION_1_23(v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v6 = 0;
      OUTLINED_FUNCTION_8_0(&dword_246EC7000, v4, v1, "NetworkManager - Assertion: Released dormancy suspension assertion.", v6);
      OUTLINED_FUNCTION_0_4();
    }

    *a1 = 0;
  }
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

BOOL OUTLINED_FUNCTION_5_28(os_log_type_t a1)
{
  uint64_t v1;

  return os_log_type_enabled(*(os_log_t *)(v1 - 136), a1);
}

uint64_t OUTLINED_FUNCTION_6_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_7_22()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_8_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t ConnectionEstablishmentReport.init(report:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, unint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  id v97;
  uint64_t v98;
  int v100;
  uint64_t v101;
  int v102;
  void (*v103)(uint64_t, unint64_t, uint64_t);
  uint64_t v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;

  v3 = type metadata accessor for NWEndpoint();
  v109 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_193();
  v108 = v5;
  v6 = type metadata accessor for NWConnection.EstablishmentReport.Resolution.Source();
  v113 = *(_QWORD *)(v6 - 8);
  v114 = v6;
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_193();
  v112 = v8;
  v9 = type metadata accessor for NWConnection.EstablishmentReport.Resolution();
  v110 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_193();
  v111 = v11;
  v12 = type metadata accessor for NWConnection.EstablishmentReport.Handshake();
  v122 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1_0();
  v16 = v15 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWEndpoint?);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_1_0();
  v20 = v19 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_1_0();
  v24 = v23 - v22;
  v25 = type metadata accessor for NWConnection.EstablishmentReport();
  v98 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_193();
  v101 = v27;
  if (one-time initialization token for sharedNetworkAnalytics != -1)
    swift_once();
  v28 = (void *)static NetworkAnalytics.sharedNetworkAnalytics;
  outlined init with copy of NWConnection.EstablishmentReport?(a1, v24);
  if (__swift_getEnumTagSinglePayload(v24, 1, v25) == 1)
  {
    v29 = v28;
    outlined destroy of NWError?(a1, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
    outlined destroy of NWError?(v24, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);

    OUTLINED_FUNCTION_2_7();
    result = OUTLINED_FUNCTION_2_7();
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
LABEL_40:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = v31;
    a2[3] = v39;
    a2[4] = 0;
    a2[5] = v40;
    a2[6] = 0;
    a2[7] = v32;
    a2[8] = v33;
    a2[9] = v34;
    a2[10] = v35;
    a2[11] = v36;
    a2[12] = v37;
    a2[13] = v38;
    return result;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 32))(v101, v24, v25);
  v41 = v28;
  v42 = NWConnection.EstablishmentReport.previousAttemptCount.getter();
  if ((v42 & 0x8000000000000000) == 0)
  {
    v96 = v42;
    if (!HIDWORD(v42))
    {
      NWConnection.EstablishmentReport.attemptStartedAfterInterval.getter();
      v39 = v43;
      NWConnection.EstablishmentReport.Resolution.duration.getter();
      v40 = v44;
      v92 = NWConnection.EstablishmentReport.proxyConfigured.getter();
      v91 = NWConnection.EstablishmentReport.usedProxy.getter();
      NWConnection.EstablishmentReport.proxyEndpoint.getter();
      v106 = v3;
      if (__swift_getEnumTagSinglePayload(v20, 1, v3) == 1)
      {
        outlined destroy of NWError?(v20, &demangling cache variable for type metadata for NWEndpoint?);
        v95 = 0;
        v93 = 0;
      }
      else
      {
        v95 = NWEndpoint.endpointReport()();
        v93 = v45;
        (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v20, v3);
      }
      v97 = v41;
      OUTLINED_FUNCTION_4_27((uint64_t)&v125);
      swift_bridgeObjectRelease();
      v46 = NWConnection.EstablishmentReport.handshakes.getter();
      v47 = *(_QWORD *)(v46 + 16);
      v107 = a1;
      if (v47)
      {
        v118 = v25;
        v120 = v9;
        v48 = v46 + ((*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80));
        v49 = *(_QWORD *)(v122 + 72);
        v50 = *(void (**)(uint64_t, unint64_t, uint64_t))(v122 + 16);
        v51 = MEMORY[0x24BEE4AF8];
        do
        {
          v50(v16, v48, v12);
          NWConnection.EstablishmentReport.Handshake.definition.getter();
          v52 = MEMORY[0x24956CE48]();
          v54 = v53;
          swift_release();
          NWConnection.EstablishmentReport.Handshake.handshakeDuration.getter();
          v56 = v55;
          NWConnection.EstablishmentReport.Handshake.handshakeRTT.getter();
          v58 = v57;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
            v51 = v62;
          }
          v59 = *(_QWORD *)(v51 + 16);
          v60 = v51;
          if (v59 >= *(_QWORD *)(v51 + 24) >> 1)
          {
            specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
            v60 = v63;
          }
          *(_QWORD *)(v60 + 16) = v59 + 1;
          v51 = v60;
          v61 = v60 + 48 * v59;
          *(_QWORD *)(v61 + 32) = v52;
          *(_QWORD *)(v61 + 40) = v54;
          *(_QWORD *)(v61 + 48) = v56;
          *(_BYTE *)(v61 + 56) = 0;
          *(_QWORD *)(v61 + 64) = v58;
          *(_BYTE *)(v61 + 72) = 0;
          (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v16, v12);
          v48 += v49;
          --v47;
        }
        while (v47);
        swift_bridgeObjectRelease();
        a1 = v107;
        v25 = v118;
        v9 = v120;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      OUTLINED_FUNCTION_4_27((uint64_t)&v124);
      v64 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRelease();
      v65 = NWConnection.EstablishmentReport.resolutions.getter();
      v66 = *(_QWORD *)(v65 + 16);
      v67 = v111;
      if (!v66)
      {
        v123 = v64;
LABEL_37:
        outlined destroy of NWError?(a1, &demangling cache variable for type metadata for NWConnection.EstablishmentReport?);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v101, v25);
        v33 = v123;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRelease();
        v32 = v90;
        swift_bridgeObjectRetain();
        v36 = v94;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_7();
        result = OUTLINED_FUNCTION_2_7();
        v31 = v96;
        v89 = 256;
        if ((v91 & 1) == 0)
          v89 = 0;
        v34 = v89 & 0xFFFFFFFFFFFFFFFELL | v92 & 1;
        v38 = v97;
        v35 = v95;
        v37 = v93;
        goto LABEL_40;
      }
      v68 = v65 + ((*(unsigned __int8 *)(v110 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80));
      v105 = *MEMORY[0x24BDE0220];
      v102 = *MEMORY[0x24BDE0218];
      v100 = *MEMORY[0x24BDE0210];
      v104 = *(_QWORD *)(v110 + 72);
      v103 = *(void (**)(uint64_t, unint64_t, uint64_t))(v110 + 16);
      v123 = MEMORY[0x24BEE4AF8];
      while (1)
      {
        v121 = v66;
        v103(v67, v68, v9);
        NWConnection.EstablishmentReport.Resolution.source.getter();
        v69 = (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 88))(v112, v114);
        if (v69 == v105)
          goto LABEL_22;
        if (v69 == v102)
        {
          v70 = 1;
        }
        else
        {
          if (v69 != v100)
          {
            (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v112, v114);
LABEL_22:
            v70 = 0;
            goto LABEL_27;
          }
          v70 = 2;
        }
LABEL_27:
        NWConnection.EstablishmentReport.Resolution.duration.getter();
        v72 = v71;
        v73 = NWConnection.EstablishmentReport.Resolution.endpointCount.getter();
        if ((v73 & 0x8000000000000000) != 0)
          break;
        v74 = v73;
        if (HIDWORD(v73))
          break;
        v75 = v9;
        NWConnection.EstablishmentReport.Resolution.successfulEndpoint.getter();
        v76 = NWEndpoint.endpointReport()();
        v117 = v77;
        v119 = v76;
        v116 = v78;
        v79 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
        v79(v108, v106);
        NWConnection.EstablishmentReport.Resolution.preferredEndpoint.getter();
        v80 = NWEndpoint.endpointReport()();
        v115 = v81;
        v83 = v82;
        v79(v108, v106);
        v84 = v123;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_5_29();
          v84 = v87;
        }
        v85 = *(_QWORD *)(v84 + 16);
        if (v85 >= *(_QWORD *)(v84 + 24) >> 1)
        {
          OUTLINED_FUNCTION_5_29();
          v84 = v88;
        }
        *(_QWORD *)(v84 + 16) = v85 + 1;
        v123 = v84;
        v86 = v84 + 80 * v85;
        *(_DWORD *)(v86 + 32) = v70;
        *(_BYTE *)(v86 + 36) = 0;
        *(_QWORD *)(v86 + 40) = v72;
        *(_BYTE *)(v86 + 48) = 0;
        *(_DWORD *)(v86 + 52) = v74;
        *(_BYTE *)(v86 + 56) = 0;
        *(_QWORD *)(v86 + 64) = v119;
        *(_QWORD *)(v86 + 72) = v117;
        *(_QWORD *)(v86 + 80) = v116;
        *(_QWORD *)(v86 + 88) = v80;
        *(_QWORD *)(v86 + 96) = v115;
        *(_QWORD *)(v86 + 104) = v83;
        v67 = v111;
        v9 = v75;
        (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v111, v75);
        v68 += v104;
        v66 = v121 - 1;
        a1 = v107;
        if (v121 == 1)
          goto LABEL_37;
      }
    }
  }
  OUTLINED_FUNCTION_0_0();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_27@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 - 256) = v1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_5_29()
{
  specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t ConnectionHandshakeReport.handshakeDurationInMs.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  char v6;
  char v7;
  char v8;
  uint64_t result;
  _BYTE v10[16];
  double v11;
  char v12;

  v1 = outlined init with take of Double?(v0 + 16, (uint64_t)v10);
  OUTLINED_FUNCTION_9_18(v1, v2, v3, v4);
  if ((v12 & 1) == 0 && v11 > 0.0)
  {
    v5 = OUTLINED_FUNCTION_3_30(v11, 1000.0);
    if (v7 ^ v8 | v6)
      goto LABEL_14;
    if (v5 >= 9.22337204e18)
      return 0x7FFFFFFFFFFFFFFFLL;
    if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
    {
      if (v5 > -9.22337204e18)
      {
        result = (uint64_t)v5;
        if (((uint64_t)v5 & 0x8000000000000000) == 0)
          return result;
LABEL_14:
        OUTLINED_FUNCTION_0_0();
        result = OUTLINED_FUNCTION_16_9();
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
  return 0;
}

unint64_t ConnectionHandshakeReport.handshakeRTTInMs.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  char v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t result;
  _BYTE v12[16];
  double v13;
  char v14;

  v1 = outlined init with take of Double?(v0 + 32, (uint64_t)v12);
  OUTLINED_FUNCTION_9_18(v1, v2, v3, v4);
  if ((v14 & 1) != 0 || v13 <= 0.0)
  {
    v9 = 0;
    LOBYTE(v10) = 1;
    goto LABEL_11;
  }
  v5 = OUTLINED_FUNCTION_3_30(v13, 1000.0);
  if (v7 ^ v8 | v6 || v5 >= 9.22337204e18)
    goto LABEL_14;
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      v9 = (uint64_t)v5;
      if ((uint64_t)v5 < 0)
        goto LABEL_14;
      v10 = HIDWORD(v9);
      if (HIDWORD(v9))
        goto LABEL_14;
LABEL_11:
      LOBYTE(v13) = v10;
      return v9 | ((unint64_t)v10 << 32);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_14:
  OUTLINED_FUNCTION_0_0();
  result = OUTLINED_FUNCTION_16_9();
  __break(1u);
  return result;
}

uint64_t initializeWithCopy for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ConnectionHandshakeReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionHandshakeReport(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 41))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionHandshakeReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConnectionHandshakeReport()
{
  return &type metadata for ConnectionHandshakeReport;
}

uint64_t ConnectionHandshakeReport.debugDescription.getter()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  Swift::String v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35[8];

  v0 = 0x6E776F6E6B6E75;
  v1 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_15(v1, v2, v3, v4, v5, v6, v7, v8, v31, v33, 110);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(24);
  OUTLINED_FUNCTION_10_9();
  v9 = ConnectionHandshakeReport.handshakeDurationInMs.getter();
  if ((v10 & 1) != 0)
  {
    v13 = 0xE700000000000000;
    v11 = 0x6E776F6E6B6E75;
  }
  else
  {
    v34 = v9;
    v11 = String.init<A>(describing:)();
    v13 = v12;
  }
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v11);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(19);
  OUTLINED_FUNCTION_10_9();
  v15 = ConnectionHandshakeReport.handshakeRTTInMs.getter();
  if ((v15 & 0x100000000) != 0)
  {
    v17 = (void *)0xE700000000000000;
  }
  else
  {
    LODWORD(v34) = v15;
    v0 = String.init<A>(describing:)();
    v17 = v16;
  }
  v18._countAndFlagsBits = v0;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(45);
  v19 = OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_2_15(v19, v20, v21, v22, v23, v24, v25, v26, v32, v34, 34);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_16();
  v27._countAndFlagsBits = 0xD000000000000016;
  v27._object = (void *)0x8000000246F79820;
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_16();
  v28._countAndFlagsBits = 0xD000000000000011;
  v28._object = (void *)0x8000000246F79840;
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = 93;
  v29._object = (void *)0xE100000000000000;
  String.append(_:)(v29);
  return *(_QWORD *)v35;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ConnectionHandshakeReport()
{
  return ConnectionHandshakeReport.debugDescription.getter();
}

double OUTLINED_FUNCTION_3_30(double a1, double a2)
{
  return a1 * a2;
}

uint64_t NWEndpoint.init(configuration:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[65];
  _QWORD v35[46];
  char v36;
  uint64_t v37;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWEndpoint.Port?);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_0();
  v8 = v7 - v6;
  v9 = type metadata accessor for NWEndpoint.Port();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = OUTLINED_FUNCTION_1_37();
  v33 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1_0();
  v14 = v13 - v12;
  OUTLINED_FUNCTION_28(v35, a1);
  OUTLINED_FUNCTION_28(v34, a1);
  v15 = ConnectionConfiguration.resolvedHost.getter();
  if (!v16)
  {
    OUTLINED_FUNCTION_4_28();
    goto LABEL_7;
  }
  v17 = v16;
  v32 = v15;
  OUTLINED_FUNCTION_28(v34, v35);
  ConnectionConfiguration.resolvedPort.getter();
  if ((v18 & 0x10000) != 0)
  {
    OUTLINED_FUNCTION_4_28();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  NWEndpoint.Port.init(rawValue:)();
  if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_28();
    outlined destroy of NWError?(v8, &demangling cache variable for type metadata for NWEndpoint.Port?);
LABEL_7:
    if (one-time initialization token for siriNetwork != -1)
      swift_once();
    v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Logger.siriNetwork);
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_2_2();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_246EC7000, v20, v21, "Provider - Network setup: No resolved host", v22, 2u);
      OUTLINED_FUNCTION_0_4();
    }

    v23 = 1;
    return __swift_storeEnumTagSinglePayload(a2, v23, 1, v11);
  }
  OUTLINED_FUNCTION_7_23(v2, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  v25 = v14
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
               + 48);
  OUTLINED_FUNCTION_12_6();
  NWEndpoint.Host.init(_:)();
  OUTLINED_FUNCTION_7_23(v25, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v14, *MEMORY[0x24BDDFF58], v11);
  if (!v37)
  {
    OUTLINED_FUNCTION_4_28();
    goto LABEL_18;
  }
  v26 = v35[45];
  v27 = v36;
  OUTLINED_FUNCTION_4_28();
  if ((v27 & 1) != 0)
  {
LABEL_18:
    v26 = 5228;
    goto LABEL_19;
  }
  if ((unint64_t)(v26 - 1) <= 0xFFFD)
  {
LABEL_19:
    if (one-time initialization token for htons != -1)
      swift_once();
    static Endian.htons(v26);
    NWEndpoint.alternatePort.setter();
  }
  if (one-time initialization token for siriNetwork != -1)
    swift_once();
  v28 = type metadata accessor for Logger();
  __swift_project_value_buffer(v28, (uint64_t)static Logger.siriNetwork);
  OUTLINED_FUNCTION_12_6();
  v29 = Logger.logObject.getter();
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v31))
  {
    v30 = OUTLINED_FUNCTION_2_2();
    v34[0] = OUTLINED_FUNCTION_2_2();
    *(_DWORD *)v30 = 136315650;
    OUTLINED_FUNCTION_12_6();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v17, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 512;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v30 + 16) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246EC7000, v29, v31, "Provider - Network setup: Endpoint created: %s:%hu/%ld", (uint8_t *)v30, 0x1Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_4();
  }
  swift_bridgeObjectRelease_n();

  OUTLINED_FUNCTION_48_0(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(a2, v14, v11);
  v23 = 0;
  return __swift_storeEnumTagSinglePayload(a2, v23, 1, v11);
}

uint64_t NWEndpoint.endpointReport()()
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v0;
  v3 = type metadata accessor for NWEndpoint.Port();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_0();
  v7 = v6 - v5;
  v8 = type metadata accessor for NWEndpoint.Host();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = OUTLINED_FUNCTION_1_37();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_0();
  v14 = v13 - v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v13 - v12, v2, v10);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 88))(v14, v10);
  if (v15 == *MEMORY[0x24BDDFF58])
  {
    OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96));
    v16 = v14
        + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
                 + 48);
    OUTLINED_FUNCTION_7_23(v1, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v7, v16, v3);
    v17 = NWEndpoint.Host.debugDescription.getter();
    NWEndpoint.Port.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
    OUTLINED_FUNCTION_48_0(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  }
  else
  {
    if (v15 != *MEMORY[0x24BDDFF48])
    {
      if (v15 == *MEMORY[0x24BDDFF38])
      {
        OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96));
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v15 == *MEMORY[0x24BDDFEC0])
        {
          OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
          return 0;
        }
        if (v15 == *MEMORY[0x24BDDFF40])
        {
          OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96));
          swift_unknownObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
        }
      }
      return 0;
    }
    OUTLINED_FUNCTION_230(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (name: String, type: String, domain: String, interface: NWInterface?));
    outlined destroy of NWError?(v14 + *(int *)(v18 + 80), (uint64_t *)&demangling cache variable for type metadata for NWInterface?);
    return 0;
  }
  return v17;
}

uint64_t OUTLINED_FUNCTION_1_37()
{
  return type metadata accessor for NWEndpoint();
}

_QWORD *OUTLINED_FUNCTION_4_28()
{
  uint64_t v0;

  return outlined release of ConnectionConfiguration((_QWORD *)(v0 + 592));
}

uint64_t OUTLINED_FUNCTION_7_23@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t dispatch thunk of DataCompressing.compressedDataForData(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataDecompressing.decompressedDataForData(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of DataCompressing.compressedDataForData(_:)(a1, a2, a3, a4);
}

id ConnectionEstablishmentReport.netConnectionStateReadySnapshot.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v8;
  _BYTE v9[16];
  uint64_t v10;
  void *v11;
  unsigned int v12;
  char v13;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95318]), sel_init);
  if (v1)
  {
    outlined init with take of ConnectionSnapshotReport?(v0, (uint64_t)v9, &demangling cache variable for type metadata for String?);
    outlined init with take of ConnectionSnapshotReport?((uint64_t)v9, (uint64_t)&v10, &demangling cache variable for type metadata for String?);
    v2 = v11;
    if (v11)
    {
      v3 = v10;
      v4 = v1;
      v2 = (void *)MEMORY[0x24956D034](v3, v2);
    }
    else
    {
      v5 = v1;
    }
    objc_msgSend(v1, sel_setConnectionInfo_, v2);

  }
  v6 = ConnectionEstablishmentReport.attemptDelayInMs.getter();
  if ((v6 & 0x100000000) == 0)
    objc_msgSend(v1, sel_setConnectionEstablishmentAttemptDelay_, v6);
  outlined init with take of ConnectionSnapshotReport?(v0 + 16, (uint64_t)&v8, &demangling cache variable for type metadata for UInt32?);
  outlined init with take of ConnectionSnapshotReport?((uint64_t)&v8, (uint64_t)&v12, &demangling cache variable for type metadata for UInt32?);
  if ((v13 & 1) == 0)
    objc_msgSend(v1, sel_setConnectionEstablishmentPreviousAttemptCount_, v12);
  return v1;
}

uint64_t ConnectionEstablishmentReport.netDebugConnectionStateReadySnapshot.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  double v15;
  double v16;
  char v17;
  char v18;
  id v19;
  id v20;
  double v21;
  char v22;
  char v23;
  double v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unsigned int *v29;
  char v30;
  double v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  id v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t result;
  void *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952C0]), sel_init);
  v2 = ConnectionEstablishmentReport.durationInMs.getter();
  if ((v3 & 1) == 0)
    objc_msgSend(v1, sel_setDurationInMs_, v2);
  if (v1)
  {
    v4 = objc_allocWithZone(MEMORY[0x24BE95338]);
    v5 = v1;
    v6 = objc_msgSend(v4, sel_init);
    objc_msgSend(v5, sel_setProxyConfiguration_, v6);

    v7 = OUTLINED_FUNCTION_3_31();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_setIsProxyConfigured_, *(unsigned __int8 *)(v0 + 72));

    }
    v9 = OUTLINED_FUNCTION_3_31();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, sel_setUsingConfiguredProxy_, *(unsigned __int8 *)(v0 + 73));

    }
  }
  v55 = *(_QWORD *)(v0 + 56);
  v11 = *(_QWORD *)(v55 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  v47 = v1;
  if (v11)
  {
    v54 = MEMORY[0x24BEE4AF8];
    v13 = (_BYTE *)(swift_bridgeObjectRetain() + 72);
    while (1)
    {
      v14 = *((_QWORD *)v13 - 4);
      v15 = *((double *)v13 - 3);
      v16 = *((double *)v13 - 1);
      v17 = *v13;
      v18 = *(v13 - 16);
      v19 = objc_allocWithZone(MEMORY[0x24BE95308]);
      swift_bridgeObjectRetain();
      v20 = objc_msgSend(v19, sel_init);
      if ((v18 & 1) == 0 && v15 > 0.0)
      {
        if (v15 * 1000.0 <= -9.22337204e18)
          goto LABEL_82;
        if (v15 * 1000.0 < 9.22337204e18)
        {
          OUTLINED_FUNCTION_0_51();
          if (v22)
            goto LABEL_79;
          if (v21 <= -9.22337204e18)
            goto LABEL_81;
          if ((uint64_t)v21 < 0)
            goto LABEL_82;
        }
        objc_msgSend(v20, sel_setHandShakeDuration_);
      }
      if (v16 <= 0.0)
        v23 = 1;
      else
        v23 = v17;
      if ((v23 & 1) == 0)
      {
        if (v16 * 1000.0 <= -9.22337204e18)
          goto LABEL_82;
        if (v16 * 1000.0 >= 9.22337204e18)
        {
LABEL_83:
          OUTLINED_FUNCTION_0_0();
          goto LABEL_84;
        }
        OUTLINED_FUNCTION_0_51();
        if (v22)
        {
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          OUTLINED_FUNCTION_0_0();
LABEL_84:
          result = _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        if (v24 <= -9.22337204e18)
          goto LABEL_77;
        if ((uint64_t)v24 < 0)
          goto LABEL_82;
        if ((unint64_t)(uint64_t)v24 >> 32)
          goto LABEL_83;
        objc_msgSend(v20, sel_setHandShakeRTT_);
      }
      if (v14)
      {
        if (v20)
        {
          OUTLINED_FUNCTION_4_11();
          v25 = v20;
          static NetworkAnalytics.netProtocol(from:)();
          objc_msgSend(v25, sel_setProtocol_, v26);
          swift_bridgeObjectRelease();

LABEL_33:
          v27 = v20;
          MEMORY[0x24956D118]();
          if (*(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();

          goto LABEL_37;
        }
        swift_bridgeObjectRelease();
      }
      else if (v20)
      {
        goto LABEL_33;
      }
LABEL_37:
      v13 += 48;
      if (!--v11)
      {
        outlined release of [ConnectionHandshakeReport]((uint64_t)&v55);
        if (v1)
          outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured.resolutions.setter(v54, v1, &lazy cache variable for type metadata for NETSchemaNETHandShakeProtocol, 0x24BE95308, (SEL *)&selRef_setConnectionEstablishmentProtocols_);
        else
          swift_bridgeObjectRelease();
        v12 = MEMORY[0x24BEE4AF8];
        break;
      }
    }
  }
  v54 = *(_QWORD *)(v0 + 64);
  v28 = *(_QWORD *)(v54 + 16);
  if (!v28)
    return (uint64_t)v1;
  v53 = v12;
  v29 = (unsigned int *)(swift_bridgeObjectRetain() + 52);
  do
  {
    v30 = *((_BYTE *)v29 - 16);
    v31 = *(double *)(v29 - 3);
    v32 = *v29;
    v33 = *((_BYTE *)v29 + 4);
    v34 = *(_QWORD *)(v29 + 5);
    v35 = *(_QWORD *)(v29 + 11);
    v51 = v29[14];
    v52 = *(v29 - 5);
    v49 = v29[8];
    v50 = v29[13];
    v48 = v29[7];
    v36 = *((_BYTE *)v29 - 4);
    v37 = objc_allocWithZone(MEMORY[0x24BE95300]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v38 = objc_msgSend(v37, sel_init);
    if ((v36 & 1) == 0 && v31 > 0.0)
    {
      if (v31 * 1000.0 <= -9.22337204e18)
        goto LABEL_82;
      if (v31 * 1000.0 < 9.22337204e18)
      {
        OUTLINED_FUNCTION_0_51();
        if (v22)
          goto LABEL_78;
        if (v39 <= -9.22337204e18)
          goto LABEL_80;
        if ((uint64_t)v39 < 0)
          goto LABEL_82;
      }
      objc_msgSend(v38, sel_setDuration_);
    }
    if ((v33 & 1) != 0)
    {
      if ((v30 & 1) == 0)
        goto LABEL_57;
    }
    else
    {
      objc_msgSend(v38, sel_setEndpointCount_, v32);
      if ((v30 & 1) == 0)
      {
LABEL_57:
        objc_msgSend(v38, sel_setResolutionSource_, v52);
        if (!v34)
          goto LABEL_60;
        goto LABEL_58;
      }
    }
    if (!v34)
      goto LABEL_60;
LABEL_58:
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952F0]), sel_init);
    if (v40)
    {
      v41 = v40;
      objc_msgSend(v40, sel_setPort_, v48);
      OUTLINED_FUNCTION_4_11();
      objc_msgSend(v41, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v49));
      v42 = v38;
      objc_msgSend(v42, sel_setSuccessfulEndpoint_, v41);

    }
LABEL_60:
    if (!v35 || (v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE952F0]), sel_init)) == 0)
    {
      OUTLINED_FUNCTION_6_4();
      OUTLINED_FUNCTION_8_2();
      if (!v38)
        goto LABEL_69;
      goto LABEL_65;
    }
    v44 = v43;
    objc_msgSend(v43, sel_setPort_, v50);
    OUTLINED_FUNCTION_4_11();
    objc_msgSend(v44, sel_setType_, static NetworkAnalytics.netEndpointType(from:)(v51));
    if (v38)
    {
      v45 = v38;
      objc_msgSend(v45, sel_setPreferredEndpoint_, v44);
      OUTLINED_FUNCTION_6_4();
      OUTLINED_FUNCTION_8_2();

LABEL_65:
      v44 = v38;
      MEMORY[0x24956D118]();
      if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      goto LABEL_68;
    }
    OUTLINED_FUNCTION_6_4();
    OUTLINED_FUNCTION_8_2();
LABEL_68:

LABEL_69:
    v29 += 20;
    --v28;
  }
  while (v28);
  outlined release of [ConnectionHandshakeReport]((uint64_t)&v54);
  v1 = v47;
  if (v47)
    outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured.resolutions.setter(v53, v47, &lazy cache variable for type metadata for NETSchemaNETEstablishmentResolution, 0x24BE95300, (SEL *)&selRef_setResolutions_);
  else
    swift_bridgeObjectRelease();
  return (uint64_t)v1;
}

uint64_t outlined release of [ConnectionHandshakeReport](uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void outlined bridged method (mbnn) of @objc NETSchemaNETDebugNetworkConnectionStateReadySnapshotCaptured.resolutions.setter(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  Class isa;

  type metadata accessor for CTServiceDescriptor(0, a3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  OUTLINED_FUNCTION_8_2();
  objc_msgSend(a2, *a5, isa);

}

id OUTLINED_FUNCTION_3_31()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 3437));
}

_QWORD *ConnectionPreparationReport.init(path:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void (*v32)(uint64_t, _BYTE *, uint64_t);
  uint64_t v33;
  char v34;
  int v35;
  char v36;
  char v37;
  char v38;
  char v39;
  NSObject *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  _BYTE *v55;
  void (*v56)(_BYTE *, _BYTE *, uint64_t);
  int v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  void (*v76)(_QWORD, _QWORD, _QWORD);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE v91[12];
  int v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  void (*v120)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE *v124;
  __int128 v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[296];
  _QWORD v130[45];
  _OWORD v131[2];
  int v132;
  int v133;
  _QWORD v134[41];
  _OWORD v135[23];
  _BYTE v136[304];

  v104 = a2;
  v3 = type metadata accessor for NWEndpoint.Port();
  v113 = *(_QWORD *)(v3 - 8);
  v114 = v3;
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_193();
  v112 = v5;
  v6 = type metadata accessor for NWEndpoint.Host();
  v110 = *(_QWORD *)(v6 - 8);
  v111 = v6;
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_193();
  v109 = v8;
  v9 = type metadata accessor for NWInterface();
  v126 = *(_QWORD **)(v9 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_193();
  v128 = v11;
  v12 = type metadata accessor for NWEndpoint();
  v116 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_4_10();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v115 = &v91[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v124 = &v91[-v16];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NWInterface?);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v17);
  v19 = &v91[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = type metadata accessor for NWPath.Status();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_193();
  v127 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWPath?);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v23);
  v25 = &v91[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = type metadata accessor for NWPath();
  v103 = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_193();
  v107 = v28;
  memset(v135, 0, 37);
  _s11SiriNetwork25ConnectionInterfaceReportVSgWOi0_(v136);
  v105 = (uint64_t)&v135[2] + 8;
  outlined init with take of ConnectionSnapshotReport?((uint64_t)v136, (uint64_t)&v135[2] + 8, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
  *(_QWORD *)&v135[21] = MEMORY[0x24BEE4AF8];
  *((_QWORD *)&v135[21] + 1) = MEMORY[0x24BEE4AF8];
  if (one-time initialization token for sharedNetworkAnalytics != -1)
    swift_once();
  v29 = (void *)static NetworkAnalytics.sharedNetworkAnalytics;
  *(_QWORD *)&v135[22] = static NetworkAnalytics.sharedNetworkAnalytics;
  outlined init with copy of NWPath?(a1, (uint64_t)v25);
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26) == 1)
  {
    v30 = v29;
    outlined destroy of NWError?(a1, &demangling cache variable for type metadata for NWPath?);
    outlined destroy of NWError?((uint64_t)v25, &demangling cache variable for type metadata for NWPath?);
    memcpy(v130, v135, sizeof(v130));
    outlined release of ConnectionPreparationReport(v130);
    _s11SiriNetwork27ConnectionPreparationReportVSgWOi0_(v131);
    return (_QWORD *)outlined init with take of ConnectionSnapshotReport?((uint64_t)v131, (uint64_t)v104, &demangling cache variable for type metadata for ConnectionPreparationReport?);
  }
  v32 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v103 + 32);
  *(_QWORD *)&v125 = v21;
  v123 = v26;
  v32(v107, v25, v26);
  *(_QWORD *)&v131[0] = 0;
  *((_QWORD *)&v131[0] + 1) = 0xE000000000000000;
  v100 = v29;
  v33 = v127;
  NWPath.status.getter();
  _print_unlocked<A, B>(_:_:)();
  (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v33, v20);
  v99 = *(_QWORD *)&v131[0];
  v135[1] = v131[0];
  v101 = *((_QWORD *)&v131[0] + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = NWPath.supportsDNS.getter();
  v35 = v34 & 1;
  LOBYTE(v135[2]) = v34 & 1;
  v36 = NWPath.isExpensive.getter();
  v97 = v36 & 1;
  BYTE1(v135[2]) = v36 & 1;
  v37 = NWPath.isConstrained.getter();
  v96 = v37 & 1;
  BYTE2(v135[2]) = v37 & 1;
  v38 = NWPath.supportsIPv4.getter();
  v95 = v38 & 1;
  BYTE3(v135[2]) = v38 & 1;
  v39 = NWPath.supportsIPv6.getter();
  v94 = v39 & 1;
  BYTE4(v135[2]) = v39 & 1;
  NWPath.nw.getter();
  v40 = nw_path_copy_interface();
  swift_unknownObjectRelease();
  v98 = v35;
  if (v40)
  {
    LODWORD(v127) = nw_interface_get_index(v40);
    swift_unknownObjectRelease();
  }
  else
  {
    LODWORD(v127) = 0;
  }
  v41 = v126;
  v42 = NWPath.availableInterfaces.getter();
  v43 = *(_QWORD *)(v42 + 16);
  v122 = v42;
  if (v43)
  {
    v44 = v42;
    v45 = (*((unsigned __int8 *)v41 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v41 + 80);
    v46 = v41[9];
    v126 = (_QWORD *)v41[2];
    ((void (*)(_BYTE *, unint64_t, uint64_t))v126)(v19, v42 + v45, v9);
    if (OUTLINED_FUNCTION_2_33() == 1)
    {
      v117 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    *(_QWORD *)&v125 = v41[4];
    v117 = MEMORY[0x24BEE4AF8];
    v83 = v44 + v46 + v45;
    v84 = v46;
    while (1)
    {
      v85 = v128;
      ((void (*)(uint64_t, _BYTE *, uint64_t))v125)(v128, v19, v9);
      ConnectionInterfaceReport.init(interface:)(v85, v130);
      OUTLINED_FUNCTION_16_6(v131, v130);
      if (v133 == (_DWORD)v127)
      {
        OUTLINED_FUNCTION_16_6(v129, v131);
        destructiveProjectEnumData for ConnectionConfigurationError(v129);
        v86 = v105;
        outlined init with take of ConnectionSnapshotReport?(v105, (uint64_t)v130, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
        outlined retain of ConnectionInterfaceReport((uint64_t)v131);
        outlined retain of ConnectionInterfaceReport?((uint64_t)v130, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of ConnectionInterfaceReport?);
        outlined init with take of ConnectionSnapshotReport?((uint64_t)v129, v86, (uint64_t *)&demangling cache variable for type metadata for ConnectionInterfaceReport?);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        v117 = v89;
      }
      v87 = *(_QWORD *)(v117 + 16);
      if (v87 >= *(_QWORD *)(v117 + 24) >> 1)
      {
        specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        v117 = v90;
      }
      v88 = v117;
      *(_QWORD *)(v117 + 16) = v87 + 1;
      OUTLINED_FUNCTION_16_6((void *)(v88 + 296 * v87 + 32), v131);
      if (!--v43)
        break;
      ((void (*)(_BYTE *, unint64_t, uint64_t))v126)(v19, v83, v9);
      v83 += v84;
      if (OUTLINED_FUNCTION_2_33() == 1)
        goto LABEL_13;
    }
  }
  else
  {
    v117 = MEMORY[0x24BEE4AF8];
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 1, 1, v9);
LABEL_13:
  swift_bridgeObjectRelease();
  v47 = v117;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v135[21] = v47;
  v48 = NWPath.gateways.getter();
  v49 = *(_QWORD *)(v48 + 16);
  v93 = v48;
  if (v49)
  {
    v50 = v116;
    v51 = v48 + ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80));
    v52 = *(_QWORD *)(v116 + 72);
    v120 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v116 + 16);
    v121 = v52;
    v119 = *MEMORY[0x24BDDFF58];
    v108 = *MEMORY[0x24BDDFF48];
    v106 = *MEMORY[0x24BDDFF38];
    v102 = *MEMORY[0x24BDDFEC0];
    v53 = MEMORY[0x24BEE4AF8];
    v92 = *MEMORY[0x24BDDFF40];
    v122 = a1;
    v54 = v115;
    v55 = v124;
    while (1)
    {
      v56 = v120;
      v120(v55, (_BYTE *)v51, v12);
      v56(v54, v55, v12);
      v57 = (*(uint64_t (**)(_BYTE *, uint64_t))(v50 + 88))(v54, v12);
      v128 = v49;
      if (v57 == v119)
      {
        OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
        v58 = &v54[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (host: NWEndpoint.Host, port: NWEndpoint.Port))
                          + 48)];
        v118 = v53;
        v60 = v109;
        v59 = v110;
        v61 = v111;
        (*(void (**)(uint64_t, _BYTE *, uint64_t))(v110 + 32))(v109, v54, v111);
        v62 = v113;
        v63 = v114;
        v64 = v12;
        v65 = v112;
        (*(void (**)(uint64_t, _BYTE *, uint64_t))(v113 + 32))(v112, v58, v114);
        v66 = NWEndpoint.Host.debugDescription.getter();
        v126 = v67;
        v127 = v66;
        LODWORD(v58) = (unsigned __int16)NWEndpoint.Port.rawValue.getter();
        v68 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
        v69 = v65;
        v12 = v64;
        v54 = v115;
        v50 = v116;
        v68(v69, v63);
        v70 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
        v53 = v118;
        v70(v60, v61);
        *(_QWORD *)&v71 = v58 | 0x100000000;
      }
      else if (v57 == v108)
      {
        OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (name: String, type: String, domain: String, interface: NWInterface?));
        outlined destroy of NWError?((uint64_t)&v54[*(int *)(v72 + 80)], (uint64_t *)&demangling cache variable for type metadata for NWInterface?);
        v126 = (_QWORD *)0xE000000000000000;
        v127 = 0;
        *(_QWORD *)&v71 = 0x300000000;
      }
      else
      {
        if (v57 == v106)
        {
          OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v57 == v102)
          {
            OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
            v126 = (_QWORD *)0xE000000000000000;
            v127 = 0;
            *(_QWORD *)&v71 = 0x400000000;
            goto LABEL_24;
          }
          if (v57 == v92)
          {
            OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
            swift_unknownObjectRelease();
          }
          else
          {
            OUTLINED_FUNCTION_1_38(*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
          }
        }
        v126 = (_QWORD *)0xE000000000000000;
        v127 = 0;
        *(_QWORD *)&v71 = 0x500000000;
      }
LABEL_24:
      v125 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_6_21();
        v53 = v78;
      }
      v55 = v124;
      v73 = v128;
      v74 = *(_QWORD *)(v53 + 16);
      if (v74 >= *(_QWORD *)(v53 + 24) >> 1)
      {
        OUTLINED_FUNCTION_6_21();
        v53 = v79;
      }
      *(_QWORD *)(v53 + 16) = v74 + 1;
      v75 = (_QWORD *)(v53 + 24 * v74);
      v76 = (void (*)(_QWORD, _QWORD, _QWORD))v126;
      v75[4] = v127;
      v75[5] = v76;
      v75[6] = v125;
      (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v55, v12);
      a1 = v122;
      v51 += v121;
      v49 = v73 - 1;
      v77 = v123;
      if (!v49)
        goto LABEL_34;
    }
  }
  v53 = MEMORY[0x24BEE4AF8];
  v77 = v123;
LABEL_34:
  outlined destroy of NWError?(a1, &demangling cache variable for type metadata for NWPath?);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v107, v77);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0(v105, (uint64_t)v129);
  v130[1] = 0;
  v130[0] = 0;
  v130[2] = v99;
  v130[3] = v101;
  LOBYTE(v130[4]) = v98;
  BYTE1(v130[4]) = v97;
  BYTE2(v130[4]) = v96;
  BYTE3(v130[4]) = v95;
  BYTE4(v130[4]) = v94;
  OUTLINED_FUNCTION_10_0((uint64_t)v129, (uint64_t)&v130[5]);
  v130[42] = v117;
  v130[43] = v53;
  v130[44] = v100;
  outlined retain of ConnectionInterfaceReport?((uint64_t)v129, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of ConnectionInterfaceReport?);
  outlined retain of ConnectionPreparationReport(v130);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined retain of ConnectionInterfaceReport?((uint64_t)v129, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of ConnectionInterfaceReport?);
  swift_bridgeObjectRelease();
  v80 = v104;
  memcpy(v104, v130, 0x168uLL);
  destructiveProjectEnumData for ConnectionConfigurationError(v80);
  v81 = *(_QWORD *)&v135[21];
  v82 = *(_QWORD *)&v135[22];
  v131[0] = v135[0];
  v131[1] = v135[1];
  v132 = v135[2];
  LOBYTE(v133) = BYTE4(v135[2]);
  OUTLINED_FUNCTION_10_0((uint64_t)v129, (uint64_t)v134);
  v134[37] = v81;
  v134[38] = v53;
  v134[39] = v82;
  return outlined release of ConnectionPreparationReport(v131);
}

uint64_t outlined init with copy of NWPath?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NWPath?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined retain of ConnectionInterfaceReport?(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  char v7;

  v7 = *(_BYTE *)(a1 + 288);
  v5 = *(_OWORD *)(a1 + 240);
  v6 = *(_OWORD *)(a1 + 256);
  v4 = *(_OWORD *)(a1 + 208);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    v4,
    *((_QWORD *)&v4 + 1),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    *(_QWORD *)(a1 + 272),
    *(_QWORD *)(a1 + 280),
    v7);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_38@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

void OUTLINED_FUNCTION_6_21()
{
  specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t ConnectionConfiguration.resolvedURL.getter()
{
  _QWORD *v0;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_19();
  v33 = v3;
  v34 = v4;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLComponents?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1_0();
  v10 = v9 - v8;
  v11 = type metadata accessor for URLComponents();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v15);
  v16 = OUTLINED_FUNCTION_6_22();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_41_1();
  if (v0[51] == 1)
    return OUTLINED_FUNCTION_25_11(v6);
  v30 = v12;
  v18 = v0[56];
  v31 = v0[57];
  v32 = v6;
  v19 = v0[58];
  if (v18)
  {
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = OUTLINED_FUNCTION_4_12();
    if (String.hasSuffix(_:)(v20))
      goto LABEL_11;
    v21._countAndFlagsBits = OUTLINED_FUNCTION_37_5();
    if (String.hasPrefix(_:)(v21))
      goto LABEL_11;
    swift_bridgeObjectRelease();
  }
  if (v19)
  {
    OUTLINED_FUNCTION_8_21();
    v22._countAndFlagsBits = OUTLINED_FUNCTION_4_12();
    if (String.hasSuffix(_:)(v22))
    {
      OUTLINED_FUNCTION_11_7();
LABEL_11:
      URL.init(string:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_29(v2, 1, v16);
      if (v26)
      {
        v24 = (uint64_t *)&demangling cache variable for type metadata for URL?;
        v25 = v2;
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v1, v2, v16);
        URLComponents.init(url:resolvingAgainstBaseURL:)();
        OUTLINED_FUNCTION_4_29(v10, 1, v11);
        if (!v26)
        {
          v27 = v30;
          (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v14, v10, v11);
          URLComponents.url.getter();
          (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v11);
          return OUTLINED_FUNCTION_61_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
        }
        OUTLINED_FUNCTION_61_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
        v24 = &demangling cache variable for type metadata for URLComponents?;
        v25 = v10;
      }
      outlined destroy of NWError?(v25, v24);
      goto LABEL_19;
    }
    v23._countAndFlagsBits = OUTLINED_FUNCTION_37_5();
    HIDWORD(v29) = String.hasPrefix(_:)(v23);
    OUTLINED_FUNCTION_11_7();
    if ((v29 & 0x100000000) != 0)
      goto LABEL_11;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  v6 = v32;
  return OUTLINED_FUNCTION_25_11(v6);
}

void ConnectionConfiguration.usingTLS.getter()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[18];

  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLComponents?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_7_24();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_54();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15_17();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v25 - v10;
  v12 = type metadata accessor for URL();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_57_1();
  MEMORY[0x24BDAC7A8](v14);
  v25[0] = (char *)v25 - v15;
  v16 = *(_QWORD *)(v0 + 408);
  if (v16 == 1)
    goto LABEL_10;
  OUTLINED_FUNCTION_0_52(v16);
  if (!v17)
    goto LABEL_10;
  OUTLINED_FUNCTION_30_8();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_4_29(v3, 1, v12);
  if (v21)
  {
    v18 = (uint64_t *)&demangling cache variable for type metadata for URL?;
    v19 = v3;
LABEL_9:
    outlined destroy of NWError?(v19, v18);
LABEL_10:
    OUTLINED_FUNCTION_18_13();
LABEL_11:
    outlined destroy of NWError?((uint64_t)v11, (uint64_t *)&demangling cache variable for type metadata for URL?);
    goto LABEL_12;
  }
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
  v20(v2, v3, v12);
  OUTLINED_FUNCTION_19_14();
  OUTLINED_FUNCTION_4_29(v1, 1, v6);
  if (v21)
  {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v12);
    v18 = &demangling cache variable for type metadata for URLComponents?;
    v19 = v1;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_26_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
  URLComponents.url.getter();
  OUTLINED_FUNCTION_36_4(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v12);
  OUTLINED_FUNCTION_4_29((uint64_t)v11, 1, v12);
  if (v22)
    goto LABEL_11;
  v20(v25[0], (uint64_t)v11, v12);
  v23 = URL.scheme.getter();
  if (v24)
  {
    v25[3] = v23;
    v25[4] = v24;
    OUTLINED_FUNCTION_10_23();
    OUTLINED_FUNCTION_14_13();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_31_5();
LABEL_12:
  OUTLINED_FUNCTION_1_1();
}

void ConnectionConfiguration.connectionId.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 408) == 1 || *(_QWORD *)(v0 + 424) == 0)
  {
    OUTLINED_FUNCTION_8_21();
    OUTLINED_FUNCTION_11_7();
  }
  else
  {
    OUTLINED_FUNCTION_8_21();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t ConnectionConfiguration.resolvedHost.getter()
{
  const void *v0;
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
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  char v32;
  uint64_t v33;
  __int16 v34;
  _OWORD v35[38];
  uint64_t v36;
  uint64_t v37;

  OUTLINED_FUNCTION_19();
  v36 = v4;
  v37 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLComponents?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v6);
  v7 = OUTLINED_FUNCTION_7_24();
  v24 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_6_22();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1_0();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_15_17();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - v15;
  memcpy(v35, v0, 0x204uLL);
  if (*((_QWORD *)&v35[25] + 1) == 1)
  {
    outlined retain of ConnectionConfiguration(v35);
  }
  else
  {
    v25 = v35[25];
    v26 = v35[26];
    v27 = v35[27];
    v28 = v35[28];
    v29 = *(_QWORD *)&v35[29];
    v30 = BYTE8(v35[29]) & 1;
    v31 = v35[30];
    v32 = v35[31];
    v33 = *((_QWORD *)&v35[31] + 1);
    v34 = v35[32] & 0xFF01;
    outlined retain of ConnectionConfiguration(v35);
    ConnectionPolicyRoute.routeHost.getter();
    if (v17)
    {
      OUTLINED_FUNCTION_30_8();
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_4_29(v2, 1, v8);
      if (v20)
      {
        v18 = (uint64_t *)&demangling cache variable for type metadata for URL?;
        v19 = v2;
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v12, v2, v8);
        OUTLINED_FUNCTION_19_14();
        OUTLINED_FUNCTION_4_29(v1, 1, v7);
        if (!v20)
        {
          v23 = v24;
          OUTLINED_FUNCTION_26_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 32));
          URLComponents.url.getter();
          OUTLINED_FUNCTION_36_4(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
          OUTLINED_FUNCTION_61_1(v12, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
          goto LABEL_12;
        }
        OUTLINED_FUNCTION_61_1(v12, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
        v18 = &demangling cache variable for type metadata for URLComponents?;
        v19 = v1;
      }
      outlined destroy of NWError?(v19, v18);
    }
  }
  OUTLINED_FUNCTION_25_11((uint64_t)v16);
LABEL_12:
  outlined release of ConnectionConfiguration(v35);
  OUTLINED_FUNCTION_4_29((uint64_t)v16, 1, v8);
  if (v20)
  {
    outlined destroy of NWError?((uint64_t)v16, (uint64_t *)&demangling cache variable for type metadata for URL?);
    return 0;
  }
  else
  {
    v21 = URL.host.getter();
    OUTLINED_FUNCTION_61_1((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  return v21;
}

Swift::String __swiftcall ConnectionProtocolTechnology.provider()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  const char *v3;
  void *v4;
  Swift::String result;

  v1 = v0;
  v2 = 0xD000000000000017;
  if (v1 == 1)
  {
    v3 = "sirinetworknwconnection";
  }
  else
  {
    if (v1 != 2)
    {
      v2 = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
      __break(1u);
      goto LABEL_7;
    }
    v2 = 0xD00000000000001ELL;
    v3 = "sirinetworkrpcospreyconnection";
  }
  v4 = (void *)((unint64_t)(v3 - 32) | 0x8000000000000000);
LABEL_7:
  result._object = v4;
  result._countAndFlagsBits = v2;
  return result;
}

void ConnectionConfiguration.connectionId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_23_1();
}

void ConnectionConfiguration.resolvedPort.getter()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[18];

  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLComponents?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_0();
  v8 = v7 - v6;
  v9 = type metadata accessor for URLComponents();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41_1();
  v11 = type metadata accessor for URL();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_54();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for URL?);
  OUTLINED_FUNCTION_19_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_57_1();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v27 - v15;
  v17 = *(_QWORD *)(v0 + 408);
  if (v17 == 1)
    goto LABEL_10;
  OUTLINED_FUNCTION_0_52(v17);
  if (!v18)
    goto LABEL_10;
  URL.init(string:)();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_4_29(v3, 1, v11);
  if (v21)
  {
    v19 = (uint64_t *)&demangling cache variable for type metadata for URL?;
    v20 = v3;
LABEL_9:
    outlined destroy of NWError?(v20, v19);
LABEL_10:
    OUTLINED_FUNCTION_18_13();
LABEL_11:
    outlined destroy of NWError?((uint64_t)v16, (uint64_t *)&demangling cache variable for type metadata for URL?);
    goto LABEL_12;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v2, v3, v11);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  OUTLINED_FUNCTION_4_29(v8, 1, v9);
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v11);
    v19 = &demangling cache variable for type metadata for URLComponents?;
    v20 = v8;
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v1, v8, v9);
  URLComponents.url.getter();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v9);
  v22 = *(void (**)(char *, uint64_t))(v4 + 8);
  v22(v2, v11);
  OUTLINED_FUNCTION_4_29((uint64_t)v16, 1, v11);
  if (v23)
    goto LABEL_11;
  v24 = URL.scheme.getter();
  v26 = v25;
  v22(v16, v11);
  if (v26)
  {
    v27[3] = v24;
    v27[4] = v26;
    OUTLINED_FUNCTION_10_23();
    OUTLINED_FUNCTION_14_13();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  OUTLINED_FUNCTION_1_1();
}

uint64_t ConnectionProtocolTechnology.init(rawValue:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance ConnectionProtocolTechnology()
{
  _QWORD *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ConnectionProtocolTechnology(int a1)
{
  Swift::UInt *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance ConnectionProtocolTechnology(uint64_t a1)
{
  _QWORD *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ConnectionProtocolTechnology@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = ConnectionProtocolTechnology.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void static ConnectionConfiguration.default.getter(uint64_t a1@<X8>)
{
  int v2;
  char ShouldUseTFO;
  __int128 v4[7];
  __int16 v5;
  __int128 v6[5];

  memset(v6, 0, sizeof(v6));
  v4[0] = xmmword_246F729D0;
  memset(&v4[1], 0, 96);
  v5 = 0;
  v2 = AFIsInternalInstall();
  ShouldUseTFO = 0;
  if (v2)
    ShouldUseTFO = _AFPreferencesShouldUseTFO();
  ConnectionConfiguration.init(connectionProtocolTechnology:communicationProtocolTechnology:assistantIdentifier:peerAssistantIdentifier:internalConnectionId:remoteHost:languageCode:prefersWWAN:skipPeer:useWiFiHint:usesProxyConnection:skipPeerErrorReason:connectedByPOPMethod:forceReconnect:forceOnDeviceOnlyDictation:timeout:staleIntervalSeconds:productTypePrefix:peerType:peerVersion:useTFO:useTLSSessionTickets:keepAliveIdleTime:keepAliveIntervalTime:keepAliveUnackedCount:retransmissionBasedconnectionDropTime:openConnectionTimeoutTime:openSlowTimeoutTime:staleConnectionTime:imposePolicyBan:connectionPolicy:connectionPolicyRoute:deviceIsInWalkaboutExperimentGroup:usesPeerManagedSync:)(1, 1, 0, 0, 0, 0, 0, 0, a1, 90.0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    1,
    0,
    (__n128)0,
    0,
    0,
    ShouldUseTFO,
    1,
    0x4024000000000000,
    0,
    0x4000000000000000,
    0,
    3,
    0,
    0x4008000000000000,
    0,
    0x402E000000000000,
    0,
    0,
    1,
    0x4056800000000000,
    0,
    0,
    v6,
    v4,
    0,
    0);
  OUTLINED_FUNCTION_3();
}

__n128 ConnectionConfiguration.init(connectionProtocolTechnology:communicationProtocolTechnology:assistantIdentifier:peerAssistantIdentifier:internalConnectionId:remoteHost:languageCode:prefersWWAN:skipPeer:useWiFiHint:usesProxyConnection:skipPeerErrorReason:connectedByPOPMethod:forceReconnect:forceOnDeviceOnlyDictation:timeout:staleIntervalSeconds:productTypePrefix:peerType:peerVersion:useTFO:useTLSSessionTickets:keepAliveIdleTime:keepAliveIntervalTime:keepAliveUnackedCount:retransmissionBasedconnectionDropTime:openConnectionTimeoutTime:openSlowTimeoutTime:staleConnectionTime:imposePolicyBan:connectionPolicy:connectionPolicyRoute:deviceIsInWalkaboutExperimentGroup:usesPeerManagedSync:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, __int128 a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, char a19, char a20,char a21,uint64_t a22,char a23,__int128 a24,__n128 a25,uint64_t a26,uint64_t a27,char a28,char a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,char a35,uint64_t a36,char a37,uint64_t a38,char a39,uint64_t a40,char a41,uint64_t a42,char a43,char a44,__int128 *a45,__int128 *a46,char a47,char a48)
{
  __int128 v48;
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
  __int128 v59;
  __n128 result;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 80) = a12;
  *(_QWORD *)(a9 + 88) = a13;
  *(_BYTE *)(a9 + 96) = a14;
  *(_BYTE *)(a9 + 97) = a15;
  *(_BYTE *)(a9 + 98) = a16;
  *(_BYTE *)(a9 + 99) = a17;
  *(_QWORD *)(a9 + 104) = a18;
  *(_BYTE *)(a9 + 112) = a19;
  *(_BYTE *)(a9 + 113) = a20;
  *(_BYTE *)(a9 + 114) = a21;
  *(_QWORD *)(a9 + 120) = a22;
  *(_BYTE *)(a9 + 128) = a23 & 1;
  *(_QWORD *)(a9 + 136) = 0x4056800000000000;
  *(_QWORD *)(a9 + 184) = a26;
  *(_QWORD *)(a9 + 192) = a27;
  *(_BYTE *)(a9 + 200) = a28;
  *(_BYTE *)(a9 + 201) = a29;
  *(_QWORD *)(a9 + 208) = a30;
  *(_BYTE *)(a9 + 216) = a31 & 1;
  *(_QWORD *)(a9 + 224) = a32;
  *(_BYTE *)(a9 + 232) = a33 & 1;
  *(_QWORD *)(a9 + 240) = a34;
  *(_BYTE *)(a9 + 248) = a35 & 1;
  *(_QWORD *)(a9 + 256) = a36;
  *(_BYTE *)(a9 + 264) = a37 & 1;
  *(_QWORD *)(a9 + 272) = a38;
  *(_BYTE *)(a9 + 280) = a39 & 1;
  *(_QWORD *)(a9 + 288) = a40;
  *(_BYTE *)(a9 + 296) = a41 & 1;
  *(_QWORD *)(a9 + 304) = a42;
  *(_BYTE *)(a9 + 312) = a43 & 1;
  *(_BYTE *)(a9 + 313) = a44;
  v48 = *a45;
  v49 = a45[1];
  v50 = a45[2];
  v51 = a45[3];
  v52 = a45[4];
  v53 = *a46;
  v54 = a46[1];
  v55 = a46[2];
  v56 = a46[3];
  v57 = a46[4];
  v58 = a46[5];
  v59 = a46[6];
  *(_WORD *)(a9 + 512) = *((_WORD *)a46 + 56);
  *(_BYTE *)(a9 + 514) = a47;
  *(_BYTE *)(a9 + 515) = a48;
  *(_OWORD *)(a9 + 64) = a11;
  *(double *)(a9 + 144) = a10;
  *(_OWORD *)(a9 + 152) = a24;
  result = a25;
  *(__n128 *)(a9 + 168) = a25;
  *(_OWORD *)(a9 + 320) = v48;
  *(_OWORD *)(a9 + 336) = v49;
  *(_OWORD *)(a9 + 352) = v50;
  *(_OWORD *)(a9 + 368) = v51;
  *(_OWORD *)(a9 + 384) = v52;
  *(_OWORD *)(a9 + 400) = v53;
  *(_OWORD *)(a9 + 416) = v54;
  *(_OWORD *)(a9 + 432) = v55;
  *(_OWORD *)(a9 + 448) = v56;
  *(_OWORD *)(a9 + 464) = v57;
  *(_OWORD *)(a9 + 480) = v58;
  *(_OWORD *)(a9 + 496) = v59;
  return result;
}

uint64_t ConnectionConfiguration.connectionProtocolTechnology.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ConnectionConfiguration.connectionProtocolTechnology.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionProtocolTechnology.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.communicationProtocolTechnology.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t ConnectionConfiguration.communicationProtocolTechnology.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.communicationProtocolTechnology.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.assistantIdentifier.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.assistantIdentifier.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.assistantIdentifier.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.peerAssistantIdentifier.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.peerAssistantIdentifier.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.peerAssistantIdentifier.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void key path setter for ConnectionConfiguration.connectionId : ConnectionConfiguration()
{
  swift_bridgeObjectRetain();
  ConnectionConfiguration.connectionId.setter();
}

void (*ConnectionConfiguration.connectionId.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  a1[2] = v1;
  v3 = v1[53];
  if (v1[51] == 1 || v3 == 0)
  {
    v5 = v1 + 6;
    v6 = v1[6];
    v3 = v5[1];
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_11_7();
  }
  else
  {
    v6 = v1[52];
    swift_bridgeObjectRetain();
  }
  *a1 = v6;
  a1[1] = v3;
  return ConnectionConfiguration.connectionId.modify;
}

void ConnectionConfiguration.connectionId.modify(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_21();
    OUTLINED_FUNCTION_44_1();
    *(_QWORD *)(v3 + 48) = v4;
    *(_QWORD *)(v3 + 56) = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_44_1();
    *(_QWORD *)(v3 + 48) = v4;
    *(_QWORD *)(v3 + 56) = v2;
    OUTLINED_FUNCTION_23_1();
  }
}

void ConnectionConfiguration.remoteHost.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.remoteHost.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.remoteHost.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.languageCode.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.languageCode.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.languageCode.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.prefersWWAN.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t ConnectionConfiguration.prefersWWAN.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 96) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.prefersWWAN.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.skipPeer.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 97);
}

uint64_t ConnectionConfiguration.skipPeer.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 97) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.skipPeer.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.useWiFiHint.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 98);
}

uint64_t ConnectionConfiguration.useWiFiHint.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 98) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.useWiFiHint.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.usesProxyConnection.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 99);
}

uint64_t ConnectionConfiguration.usesProxyConnection.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 99) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.usesProxyConnection.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void *ConnectionConfiguration.skipPeerErrorReason.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 104);
  v2 = v1;
  return v1;
}

void ConnectionConfiguration.skipPeerErrorReason.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = a1;
  OUTLINED_FUNCTION_3();
}

uint64_t (*ConnectionConfiguration.skipPeerErrorReason.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectedByPOPMethod.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t ConnectionConfiguration.connectedByPOPMethod.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 112) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.connectedByPOPMethod.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.forceReconnect.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 113);
}

uint64_t ConnectionConfiguration.forceReconnect.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 113) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.forceReconnect.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.forceOnDeviceOnlyDictation.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 114);
}

uint64_t ConnectionConfiguration.forceOnDeviceOnlyDictation.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 114) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.forceOnDeviceOnlyDictation.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.timeout.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t ConnectionConfiguration.timeout.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = result;
  *(_BYTE *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*ConnectionConfiguration.timeout.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.productTypePrefix.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.productTypePrefix.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 152) = v2;
  *(_QWORD *)(v1 + 160) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.productTypePrefix.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.peerType.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.peerType.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 168) = v2;
  *(_QWORD *)(v1 + 176) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.peerType.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

void ConnectionConfiguration.peerVersion.getter()
{
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_3();
}

void ConnectionConfiguration.peerVersion.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_7();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 184) = v2;
  *(_QWORD *)(v1 + 192) = v0;
  OUTLINED_FUNCTION_23_1();
}

uint64_t (*ConnectionConfiguration.peerVersion.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.imposePolicyBan.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 313);
}

uint64_t ConnectionConfiguration.imposePolicyBan.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 313) = result;
  return result;
}

uint64_t (*ConnectionConfiguration.imposePolicyBan.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectionPolicy.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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

  v0 = OUTLINED_FUNCTION_32_4();
  v9 = OUTLINED_FUNCTION_20_15(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  return outlined copy of ConnectionPolicy?(v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

__n128 ConnectionConfiguration.connectionPolicy.setter(__int128 *a1)
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
  __n128 result;
  __n128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v16 = *a1;
  v14 = a1[2];
  v15 = a1[1];
  v13 = (__n128)a1[3];
  v2 = *((_QWORD *)a1 + 8);
  v3 = *((_QWORD *)a1 + 9);
  v4 = OUTLINED_FUNCTION_32_4();
  outlined consume of ConnectionPolicy?(v4, v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(v1 + 384), *(_QWORD *)(v1 + 392));
  *(_OWORD *)(v1 + 320) = v16;
  *(_OWORD *)(v1 + 336) = v15;
  result = v13;
  *(_OWORD *)(v1 + 352) = v14;
  *(__n128 *)(v1 + 368) = v13;
  *(_QWORD *)(v1 + 384) = v2;
  *(_QWORD *)(v1 + 392) = v3;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionPolicy.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

uint64_t ConnectionConfiguration.connectionPolicyRoute.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  v0 = OUTLINED_FUNCTION_34_9();
  v9 = OUTLINED_FUNCTION_20_15(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  *(_QWORD *)(v10 + 80) = v11;
  *(_QWORD *)(v10 + 88) = v12;
  *(_QWORD *)(v10 + 96) = v13;
  *(_QWORD *)(v10 + 104) = v14;
  *(_WORD *)(v10 + 112) = v15;
  return outlined copy of ConnectionPolicyRoute?(v9, v16);
}

__n128 ConnectionConfiguration.connectionPolicyRoute.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  __n128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v12 = a1[1];
  v13 = *a1;
  v11 = a1[2];
  v9 = a1[4];
  v10 = a1[3];
  v8 = (__n128)a1[5];
  v2 = *((_QWORD *)a1 + 12);
  v3 = *((_QWORD *)a1 + 13);
  v4 = *((_WORD *)a1 + 56);
  v5 = OUTLINED_FUNCTION_34_9();
  outlined consume of ConnectionPolicyRoute?(v5, v6);
  *(_OWORD *)(v1 + 400) = v13;
  *(_OWORD *)(v1 + 416) = v12;
  *(_OWORD *)(v1 + 432) = v11;
  *(_OWORD *)(v1 + 448) = v10;
  result = v8;
  *(_OWORD *)(v1 + 464) = v9;
  *(__n128 *)(v1 + 480) = v8;
  *(_QWORD *)(v1 + 496) = v2;
  *(_QWORD *)(v1 + 504) = v3;
  *(_WORD *)(v1 + 512) = v4;
  return result;
}

uint64_t (*ConnectionConfiguration.connectionPolicyRoute.modify())()
{
  return destructiveProjectEnumData for ConnectionConfigurationError;
}

unint64_t lazy protocol witness table accessor for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology;
  if (!lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology)
  {
    result = MEMORY[0x24956DF70](&protocol conformance descriptor for ConnectionProtocolTechnology, &type metadata for ConnectionProtocolTechnology);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConnectionProtocolTechnology and conformance ConnectionProtocolTechnology);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology;
  if (!lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology)
  {
    result = MEMORY[0x24956DF70](&protocol conformance descriptor for CommunicationProtocolTechnology, &type metadata for CommunicationProtocolTechnology);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CommunicationProtocolTechnology and conformance CommunicationProtocolTechnology);
  }
  return result;
}

void sub_246F6D428(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  ConnectionConfiguration.connectionId.getter();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_3();
}

void type metadata accessor for ConnectionProtocolTechnology()
{
  OUTLINED_FUNCTION_8_12();
}

void type metadata accessor for CommunicationProtocolTechnology()
{
  OUTLINED_FUNCTION_8_12();
}

uint64_t destroy for ConnectionConfiguration(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 392))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  result = *(_QWORD *)(a1 + 408);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v9 = *(void **)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = v9;
  *(_QWORD *)(a1 + 104) = v9;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_WORD *)(a1 + 113) = *(_WORD *)(a2 + 113);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  v12 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v12;
  v13 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v13;
  *(_WORD *)(a1 + 200) = *(_WORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 264) = *(_BYTE *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 280) = *(_BYTE *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_BYTE *)(a1 + 296) = *(_BYTE *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_WORD *)(a1 + 312) = *(_WORD *)(a2 + 312);
  v14 = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14)
  {
    v15 = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = v15;
    *(_DWORD *)(a1 + 336) = *(_DWORD *)(a2 + 336);
    *(_WORD *)(a1 + 340) = *(_WORD *)(a2 + 340);
    *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
    *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
    *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
    *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
    v16 = *(_QWORD *)(a2 + 376);
    *(_BYTE *)(a1 + 384) = *(_BYTE *)(a2 + 384);
    *(_QWORD *)(a1 + 376) = v16;
    *(_QWORD *)(a1 + 392) = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
  }
  v17 = *(_QWORD *)(a2 + 408);
  if (v17 == 1)
  {
    memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
  }
  else
  {
    *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 408) = v17;
    v18 = *(_QWORD *)(a2 + 424);
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 424) = v18;
    *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
    v19 = *(_QWORD *)(a2 + 456);
    *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 456) = v19;
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_BYTE *)(a1 + 472) = *(_BYTE *)(a2 + 472);
    v20 = *(_QWORD *)(a2 + 488);
    *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
    *(_QWORD *)(a1 + 488) = v20;
    *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
    *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
    *(_WORD *)(a1 + 512) = *(_WORD *)(a2 + 512);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_WORD *)(a1 + 514) = *(_WORD *)(a2 + 514);
  return a1;
}

uint64_t assignWithCopy for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  void *v5;
  void *v6;
  id v7;
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
  uint64_t v25;

  v4 = (_BYTE *)(a2 + 313);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  *(_BYTE *)(a1 + 98) = *(_BYTE *)(a2 + 98);
  *(_BYTE *)(a1 + 99) = *(_BYTE *)(a2 + 99);
  v5 = *(void **)(a1 + 104);
  v6 = *(void **)(a2 + 104);
  v7 = v6;
  *(_QWORD *)(a1 + 104) = v6;

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  v8 = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v8;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  *(_BYTE *)(a1 + 201) = *(_BYTE *)(a2 + 201);
  v9 = *(_QWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = v9;
  v10 = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = v10;
  v11 = *(_QWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = v11;
  v12 = *(_QWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 264) = *(_BYTE *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = v12;
  v13 = *(_QWORD *)(a2 + 272);
  *(_BYTE *)(a1 + 280) = *(_BYTE *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = v13;
  v14 = *(_QWORD *)(a2 + 288);
  *(_BYTE *)(a1 + 296) = *(_BYTE *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = v14;
  v15 = *(_QWORD *)(a2 + 304);
  *(_BYTE *)(a1 + 312) = *(_BYTE *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = v15;
  *(_BYTE *)(a1 + 313) = *(_BYTE *)(a2 + 313);
  v16 = *(_QWORD *)(a2 + 392);
  if (*(_QWORD *)(a1 + 392))
  {
    if (v16)
    {
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 336) = v4[23];
      *(_BYTE *)(a1 + 337) = v4[24];
      *(_BYTE *)(a1 + 338) = v4[25];
      *(_BYTE *)(a1 + 339) = v4[26];
      *(_BYTE *)(a1 + 340) = v4[27];
      *(_BYTE *)(a1 + 341) = v4[28];
      v17 = *(_QWORD *)(a2 + 344);
      *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
      *(_QWORD *)(a1 + 344) = v17;
      v18 = *(_QWORD *)(a2 + 360);
      *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
      *(_QWORD *)(a1 + 360) = v18;
      v19 = *(_QWORD *)(a2 + 376);
      *(_BYTE *)(a1 + 384) = *(_BYTE *)(a2 + 384);
      *(_QWORD *)(a1 + 376) = v19;
      *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    outlined destroy of ConnectionPolicy(a1 + 320);
  }
  else if (v16)
  {
    *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
    *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
    *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
    *(_BYTE *)(a1 + 337) = *(_BYTE *)(a2 + 337);
    *(_BYTE *)(a1 + 338) = *(_BYTE *)(a2 + 338);
    *(_BYTE *)(a1 + 339) = *(_BYTE *)(a2 + 339);
    *(_BYTE *)(a1 + 340) = *(_BYTE *)(a2 + 340);
    *(_BYTE *)(a1 + 341) = *(_BYTE *)(a2 + 341);
    v20 = *(_QWORD *)(a2 + 344);
    *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
    *(_QWORD *)(a1 + 344) = v20;
    v21 = *(_QWORD *)(a2 + 360);
    *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
    *(_QWORD *)(a1 + 360) = v21;
    v22 = *(_QWORD *)(a2 + 376);
    *(_BYTE *)(a1 + 384) = *(_BYTE *)(a2 + 384);
    *(_QWORD *)(a1 + 376) = v22;
    *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
LABEL_8:
  v23 = *(_QWORD *)(a2 + 408);
  if (*(_QWORD *)(a1 + 408) != 1)
  {
    if (v23 != 1)
    {
      *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
      *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
      *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
      *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
      *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 472) = v4[159];
      *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
      *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
      v25 = *(_QWORD *)(a2 + 504);
      *(_BYTE *)(a1 + 512) = *(_BYTE *)(a2 + 512);
      *(_QWORD *)(a1 + 504) = v25;
      *(_BYTE *)(a1 + 513) = *(_BYTE *)(a2 + 513);
      goto LABEL_15;
    }
    outlined destroy of ConnectionPolicyRoute(a1 + 400);
    goto LABEL_13;
  }
  if (v23 == 1)
  {
LABEL_13:
    memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
    goto LABEL_15;
  }
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  *(_BYTE *)(a1 + 472) = *(_BYTE *)(a2 + 472);
  *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  v24 = *(_QWORD *)(a2 + 504);
  *(_BYTE *)(a1 + 512) = *(_BYTE *)(a2 + 512);
  *(_QWORD *)(a1 + 504) = v24;
  *(_BYTE *)(a1 + 513) = *(_BYTE *)(a2 + 513);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_15:
  *(_BYTE *)(a1 + 514) = v4[201];
  *(_BYTE *)(a1 + 515) = v4[202];
  return a1;
}

uint64_t outlined destroy of ConnectionPolicy(uint64_t a1)
{
  destroy for ConnectionPolicy();
  return a1;
}

uint64_t outlined destroy of ConnectionPolicyRoute(uint64_t a1)
{
  destroy for ConnectionPolicyRoute();
  return a1;
}

void *__swift_memcpy516_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x204uLL);
}

uint64_t assignWithTake for ConnectionConfiguration(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = (_BYTE *)(a2 + 313);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  *(_BYTE *)(a1 + 98) = *(_BYTE *)(a2 + 98);
  *(_BYTE *)(a1 + 99) = *(_BYTE *)(a2 + 99);
  v10 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  *(_BYTE *)(a1 + 114) = *(_BYTE *)(a2 + 114);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v13;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  *(_BYTE *)(a1 + 201) = *(_BYTE *)(a2 + 201);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 216) = *(_BYTE *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_BYTE *)(a1 + 264) = *(_BYTE *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_BYTE *)(a1 + 280) = *(_BYTE *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_BYTE *)(a1 + 296) = *(_BYTE *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_BYTE *)(a1 + 312) = *(_BYTE *)(a2 + 312);
  *(_BYTE *)(a1 + 313) = *(_BYTE *)(a2 + 313);
  if (*(_QWORD *)(a1 + 392))
  {
    if (*(_QWORD *)(a2 + 392))
    {
      v14 = *(_QWORD *)(a2 + 328);
      *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
      *(_QWORD *)(a1 + 328) = v14;
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 336) = v4[23];
      *(_BYTE *)(a1 + 337) = v4[24];
      *(_BYTE *)(a1 + 338) = v4[25];
      *(_BYTE *)(a1 + 339) = v4[26];
      *(_BYTE *)(a1 + 340) = v4[27];
      *(_BYTE *)(a1 + 341) = v4[28];
      *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
      *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
      *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
      *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
      *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
      *(_BYTE *)(a1 + 384) = *(_BYTE *)(a2 + 384);
      *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    outlined destroy of ConnectionPolicy(a1 + 320);
  }
  memcpy((void *)(a1 + 320), (const void *)(a2 + 320), 0x50uLL);
LABEL_6:
  if (*(_QWORD *)(a1 + 408) != 1)
  {
    v15 = *(_QWORD *)(a2 + 408);
    if (v15 != 1)
    {
      *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
      *(_QWORD *)(a1 + 408) = v15;
      swift_bridgeObjectRelease();
      v16 = *(_QWORD *)(a2 + 424);
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
      *(_QWORD *)(a1 + 424) = v16;
      swift_bridgeObjectRelease();
      *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      swift_bridgeObjectRelease();
      v17 = *(_QWORD *)(a2 + 464);
      *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
      *(_QWORD *)(a1 + 464) = v17;
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 472) = v4[159];
      v18 = *(_QWORD *)(a2 + 488);
      *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
      *(_QWORD *)(a1 + 488) = v18;
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
      *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
      *(_WORD *)(a1 + 512) = *(_WORD *)(a2 + 512);
      goto LABEL_11;
    }
    outlined destroy of ConnectionPolicyRoute(a1 + 400);
  }
  memcpy((void *)(a1 + 400), (const void *)(a2 + 400), 0x72uLL);
LABEL_11:
  *(_BYTE *)(a1 + 514) = v4[201];
  *(_BYTE *)(a1 + 515) = v4[202];
  return a1;
}

uint64_t getEnumTagSinglePayload for ConnectionConfiguration(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 516))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConnectionConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 504) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_DWORD *)(result + 512) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 516) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 516) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

void type metadata accessor for ConnectionConfiguration()
{
  OUTLINED_FUNCTION_8_12();
}

uint64_t OUTLINED_FUNCTION_0_52@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;

  v3 = *(_WORD *)(v1 + 512);
  v5 = *(_QWORD *)(v1 + 496);
  v4 = *(_QWORD *)(v1 + 504);
  v6 = *(_BYTE *)(v1 + 472);
  v7 = *(_QWORD *)(v1 + 464);
  *(_QWORD *)(v2 - 200) = *(_QWORD *)(v1 + 400);
  *(_QWORD *)(v2 - 192) = a1;
  v8 = *(_OWORD *)(v1 + 432);
  *(_OWORD *)(v2 - 184) = *(_OWORD *)(v1 + 416);
  *(_OWORD *)(v2 - 168) = v8;
  *(_OWORD *)(v2 - 152) = *(_OWORD *)(v1 + 448);
  *(_QWORD *)(v2 - 136) = v7;
  *(_BYTE *)(v2 - 128) = v6 & 1;
  *(_OWORD *)(v2 - 120) = *(_OWORD *)(v1 + 480);
  *(_BYTE *)(v2 - 104) = v5;
  *(_QWORD *)(v2 - 96) = v4;
  *(_BYTE *)(v2 - 88) = v3 & 1;
  *(_BYTE *)(v2 - 87) = HIBYTE(v3);
  return ConnectionPolicyRoute.routeHost.getter();
}

uint64_t OUTLINED_FUNCTION_4_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_6_22()
{
  return type metadata accessor for URL();
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  return type metadata accessor for URLComponents();
}

unint64_t OUTLINED_FUNCTION_10_23()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 216) = 0x7370747468;
  *(_QWORD *)(v0 - 208) = 0xE500000000000000;
  return lazy protocol witness table accessor for type String and conformance String();
}

uint64_t OUTLINED_FUNCTION_14_13()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_18_13()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t OUTLINED_FUNCTION_20_15@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;

  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = v9;
  a9[9] = v10;
  return result;
}

uint64_t OUTLINED_FUNCTION_25_11(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_26_11@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  return URL.init(string:)();
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t OUTLINED_FUNCTION_32_4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 320);
}

uint64_t OUTLINED_FUNCTION_34_9()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 400);
}

uint64_t OUTLINED_FUNCTION_36_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_37_5()
{
  return 3028785;
}

uint64_t specialized Collection.isEmpty.getter(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_246F6E3B4 + 4 * byte_246F75DF0[a2 >> 62]))();
}

BOOL sub_246F6E3B4(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0;
}

uint64_t CommunicationProtocolProtobuf.protobufDelegate.getter()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = MEMORY[0x24956E090](v0 + 16);
  if (result)
  {
    v2 = result;
    swift_getObjectType();
    result = dynamic_cast_existential_1_conditional(v2);
    if (!result)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t CommunicationProtocolProtobuf.__allocating_init(withDelegate:connectionQueue:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  CommunicationProtocolProtobuf.init(withDelegate:connectionQueue:)(a1, a2, a3);
  return v6;
}

uint64_t CommunicationProtocolProtobuf.init(withDelegate:connectionQueue:)(uint64_t a1, uint64_t a2, void *a3)
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

  v4 = v3;
  v13 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v5 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1_0();
  v8 = v7 - v6;
  v9 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1_0();
  v10 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v3 + 32) = xmmword_246F725D0;
  *(_OWORD *)(v3 + 48) = xmmword_246F725D0;
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BEE5750], v13);
  v11 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  *(_QWORD *)(v4 + 64) = v11;
  *(_OWORD *)(v4 + 72) = xmmword_246F725D0;
  *(_QWORD *)(v4 + 88) = 0;
  *(_QWORD *)(v4 + 24) = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t CommunicationProtocolProtobuf.initialPayload(withBufferedInitialLength:forceReconnect:)()
{
  return 0;
}

uint64_t CommunicationProtocolProtobuf.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_1_32();
  v1 = v0[4];
  v2 = v0[5];
  *((_OWORD *)v0 + 2) = xmmword_246F725C0;
  outlined consume of Data?(v1, v2);
  OUTLINED_FUNCTION_1_32();
  v3 = v0[6];
  v4 = v0[7];
  *((_OWORD *)v0 + 3) = xmmword_246F725C0;
  return outlined consume of Data?(v3, v4);
}

void CommunicationProtocolProtobuf.bufferGeneralData(data:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_39();
  if (*(_QWORD *)(v0 + 40) >> 60 != 15)
    OUTLINED_FUNCTION_5_30();
  swift_endAccess();
  OUTLINED_FUNCTION_5_22();
}

void CommunicationProtocolProtobuf.bufferUncompressedData(data:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_39();
  if (*(_QWORD *)(v0 + 56) >> 60 != 15)
    OUTLINED_FUNCTION_5_30();
  swift_endAccess();
  OUTLINED_FUNCTION_5_22();
}

void CommunicationProtocolProtobuf.getBufferedUncompressedDataToWrite()()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_1_32();
  v1 = *(_QWORD *)(v0 + 56);
  if (v1 >> 60 != 15)
    __asm { BR              X10 }
  OUTLINED_FUNCTION_5_22();
}

void CommunicationProtocolProtobuf.getBufferedOutputDataToWrite()()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_1_32();
  v1 = *(_QWORD *)(v0 + 40);
  if (v1 >> 60 != 15)
    __asm { BR              X10 }
  OUTLINED_FUNCTION_5_22();
}

Swift::Void __swiftcall CommunicationProtocolProtobuf.closeConnection(prepareForReconnect:)(Swift::Bool prepareForReconnect)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  if (!prepareForReconnect)
  {
    OUTLINED_FUNCTION_1_32();
    v2 = *(_QWORD *)(v1 + 32);
    v3 = *(_QWORD *)(v1 + 40);
    *(_OWORD *)(v1 + 32) = xmmword_246F725D0;
    outlined consume of Data?(v2, v3);
  }
}

uint64_t CommunicationProtocolProtobuf.bytesAvailable(_:)()
{
  uint64_t result;

  if (CommunicationProtocolProtobuf.protobufDelegate.getter())
  {
    BackgroundConnection.updateFirstByteReadTime()();
    swift_unknownObjectRelease();
  }
  result = CommunicationProtocolProtobuf.protobufDelegate.getter();
  if (result)
    BackgroundConnection.didReceiveObject(_:)();
  return result;
}

uint64_t CommunicationProtocolProtobuf.compressData(_:)(uint64_t a1, unint64_t a2)
{
  outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t CommunicationProtocolProtobuf.deinit()
{
  uint64_t v0;

  outlined destroy of weak ConnectionProviderDelegate?(v0 + 16);
  outlined consume of Data?(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  outlined consume of Data?(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));

  outlined consume of Data?(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  swift_release();
  return v0;
}

uint64_t CommunicationProtocolProtobuf.__deallocating_deinit()
{
  CommunicationProtocolProtobuf.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CommunicationProtocolProtobuf()
{
  return objc_opt_self();
}

uint64_t protocol witness for CommunicationProtocol.init(withDelegate:connectionQueue:) in conformance CommunicationProtocolProtobuf@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = CommunicationProtocolProtobuf.__allocating_init(withDelegate:connectionQueue:)(a1, a2, a3);
  *a4 = result;
  return result;
}

uint64_t protocol witness for CommunicationProtocol.safetyNetBuffer.getter in conformance CommunicationProtocolProtobuf()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  outlined copy of Data?(v1, *(_QWORD *)(*(_QWORD *)v0 + 80));
  return v1;
}

uint64_t protocol witness for CommunicationProtocol.safetyNetBuffer.setter in conformance CommunicationProtocolProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 72);
  v5 = *(_QWORD *)(*v2 + 80);
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = a2;
  return outlined consume of Data?(v4, v5);
}

uint64_t protocol witness for CommunicationProtocol.pingInfo.getter in conformance CommunicationProtocolProtobuf()
{
  return swift_retain();
}

uint64_t protocol witness for CommunicationProtocol.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:) in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.updateBuffers(forInitialPayload:bufferedLength:forceReconnect:)();
}

void protocol witness for CommunicationProtocol.bufferGeneralData(data:) in conformance CommunicationProtocolProtobuf()
{
  CommunicationProtocolProtobuf.bufferGeneralData(data:)();
}

void protocol witness for CommunicationProtocol.getBufferedOutputDataToWrite() in conformance CommunicationProtocolProtobuf()
{
  CommunicationProtocolProtobuf.getBufferedOutputDataToWrite()();
}

void protocol witness for CommunicationProtocol.bufferUncompressedData(data:) in conformance CommunicationProtocolProtobuf()
{
  CommunicationProtocolProtobuf.bufferUncompressedData(data:)();
}

void protocol witness for CommunicationProtocol.getBufferedUncompressedDataToWrite() in conformance CommunicationProtocolProtobuf()
{
  CommunicationProtocolProtobuf.getBufferedUncompressedDataToWrite()();
}

void protocol witness for CommunicationProtocol.closeConnection(prepareForReconnect:) in conformance CommunicationProtocolProtobuf(Swift::Bool a1)
{
  CommunicationProtocolProtobuf.closeConnection(prepareForReconnect:)(a1);
}

uint64_t protocol witness for CommunicationProtocol.bytesAvailable(_:) in conformance CommunicationProtocolProtobuf()
{
  return CommunicationProtocolProtobuf.bytesAvailable(_:)();
}

uint64_t protocol witness for CommunicationProtocol.compressData(_:) in conformance CommunicationProtocolProtobuf(uint64_t a1, unint64_t a2)
{
  return CommunicationProtocolProtobuf.compressData(_:)(a1, a2);
}

uint64_t OUTLINED_FUNCTION_1_39()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_30()
{
  return Data.append(_:)();
}

uint64_t DataProtocol.copyBytes(to:)()
{
  return MEMORY[0x24BDCB7E0]();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t URLComponents.url.getter()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

Swift::String_optional __swiftcall URL.host(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = MEMORY[0x24BDCD9D0](percentEncoded);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.host.getter()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t URL.port.getter()
{
  return MEMORY[0x24BDCDA08]();
}

uint64_t URL.scheme.getter()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDB60]();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t Data.init(bytesNoCopy:count:deallocator:)()
{
  return MEMORY[0x24BDCDBD8]();
}

uint64_t Data._Representation.init(_:count:)()
{
  return MEMORY[0x24BDCDC50]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Data.init(bytes:count:)()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t Data.init(count:)()
{
  return MEMORY[0x24BDCDD08]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t Data.append(_:count:)()
{
  return MEMORY[0x24BDCDD38]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t Data.subdata(in:)()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t Data.advanced(by:)()
{
  return MEMORY[0x24BDCDD90]();
}

uint64_t Date.description(with:)()
{
  return MEMORY[0x24BDCE2C0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t XPC_TYPE_DATA.getter()
{
  return MEMORY[0x24BEE6448]();
}

uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t POSIXErrorCode.rawValue.getter()
{
  return MEMORY[0x24BEE76A0]();
}

uint64_t NWActivity.isActivated.getter()
{
  return MEMORY[0x24BDDFE40]();
}

uint64_t NWActivity.parentActivity.setter()
{
  return MEMORY[0x24BDDFE48]();
}

uint64_t type metadata accessor for NWActivity.CompletionReason()
{
  return MEMORY[0x24BDDFE58]();
}

uint64_t NWActivity.label.getter()
{
  return MEMORY[0x24BDDFE60]();
}

uint64_t NWActivity.token.getter()
{
  return MEMORY[0x24BDDFE68]();
}

uint64_t NWActivity.init(domain:label:)()
{
  return MEMORY[0x24BDDFE70]();
}

Swift::Void __swiftcall NWActivity.activate()()
{
  MEMORY[0x24BDDFE78]();
}

uint64_t NWActivity.complete(reason:)()
{
  return MEMORY[0x24BDDFE80]();
}

uint64_t type metadata accessor for NWActivity()
{
  return MEMORY[0x24BDDFE88]();
}

uint64_t NWEndpoint.alternatePort.setter()
{
  return MEMORY[0x24BDDFEA8]();
}

uint64_t NWEndpoint.Host.debugDescription.getter()
{
  return MEMORY[0x24BDDFEC8]();
}

uint64_t type metadata accessor for NWEndpoint.Host()
{
  return MEMORY[0x24BDDFEE0]();
}

uint64_t NWEndpoint.Host.init(_:)()
{
  return MEMORY[0x24BDDFEF0]();
}

uint64_t NWEndpoint.Port.init(rawValue:)()
{
  return MEMORY[0x24BDDFF10]();
}

uint64_t NWEndpoint.Port.rawValue.getter()
{
  return MEMORY[0x24BDDFF18]();
}

uint64_t type metadata accessor for NWEndpoint.Port()
{
  return MEMORY[0x24BDDFF20]();
}

uint64_t type metadata accessor for NWEndpoint()
{
  return MEMORY[0x24BDDFF68]();
}

uint64_t type metadata accessor for NWInterface.InterfaceType()
{
  return MEMORY[0x24BDE00C8]();
}

uint64_t NWInterface.name.getter()
{
  return MEMORY[0x24BDE00E8]();
}

uint64_t NWInterface.type.getter()
{
  return MEMORY[0x24BDE00F0]();
}

uint64_t NWInterface.index.getter()
{
  return MEMORY[0x24BDE00F8]();
}

uint64_t type metadata accessor for NWInterface()
{
  return MEMORY[0x24BDE0100]();
}

uint64_t NWConnection.identifier.getter()
{
  return MEMORY[0x24BDE0158]();
}

uint64_t NWConnection.currentPath.getter()
{
  return MEMORY[0x24BDE0160]();
}

uint64_t static NWConnection.ContentContext.defaultMessage.getter()
{
  return MEMORY[0x24BDE0190]();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return MEMORY[0x24BDE01B8]();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return MEMORY[0x24BDE01D0]();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return MEMORY[0x24BDE01F0]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.endpointCount.getter()
{
  return MEMORY[0x24BDE01F8]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.preferredEndpoint.getter()
{
  return MEMORY[0x24BDE0200]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.successfulEndpoint.getter()
{
  return MEMORY[0x24BDE0208]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Resolution.Source()
{
  return MEMORY[0x24BDE0228]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.source.getter()
{
  return MEMORY[0x24BDE0230]();
}

uint64_t NWConnection.EstablishmentReport.Resolution.duration.getter()
{
  return MEMORY[0x24BDE0238]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Resolution()
{
  return MEMORY[0x24BDE0240]();
}

uint64_t NWConnection.EstablishmentReport.handshakes.getter()
{
  return MEMORY[0x24BDE0248]();
}

uint64_t NWConnection.EstablishmentReport.resolutions.getter()
{
  return MEMORY[0x24BDE0250]();
}

uint64_t NWConnection.EstablishmentReport.proxyEndpoint.getter()
{
  return MEMORY[0x24BDE0258]();
}

uint64_t NWConnection.EstablishmentReport.proxyConfigured.getter()
{
  return MEMORY[0x24BDE0260]();
}

uint64_t NWConnection.EstablishmentReport.previousAttemptCount.getter()
{
  return MEMORY[0x24BDE0268]();
}

uint64_t NWConnection.EstablishmentReport.attemptStartedAfterInterval.getter()
{
  return MEMORY[0x24BDE0270]();
}

uint64_t NWConnection.EstablishmentReport.duration.getter()
{
  return MEMORY[0x24BDE0278]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.definition.getter()
{
  return MEMORY[0x24BDE0280]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeRTT.getter()
{
  return MEMORY[0x24BDE0288]();
}

uint64_t NWConnection.EstablishmentReport.Handshake.handshakeDuration.getter()
{
  return MEMORY[0x24BDE0290]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport.Handshake()
{
  return MEMORY[0x24BDE0298]();
}

uint64_t NWConnection.EstablishmentReport.usedProxy.getter()
{
  return MEMORY[0x24BDE02A0]();
}

uint64_t type metadata accessor for NWConnection.EstablishmentReport()
{
  return MEMORY[0x24BDE02A8]();
}

uint64_t NWConnection.viabilityUpdateHandler.setter()
{
  return MEMORY[0x24BDE02B8]();
}

uint64_t NWConnection.betterPathUpdateHandler.setter()
{
  return MEMORY[0x24BDE02C0]();
}

uint64_t NWConnection.requestEstablishmentReport(queue:completion:)()
{
  return MEMORY[0x24BDE02C8]();
}

uint64_t NWConnection.nw.getter()
{
  return MEMORY[0x24BDE02D0]();
}

uint64_t dispatch thunk of NWConnection.__allocating_init(to:using:)()
{
  return MEMORY[0x24BDE02D8]();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return MEMORY[0x24BDE02E8]();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return MEMORY[0x24BDE0328]();
}

uint64_t NWConnection.start(queue:)()
{
  return MEMORY[0x24BDE0340]();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
  MEMORY[0x24BDE0350]();
}

uint64_t NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)()
{
  return MEMORY[0x24BDE0358]();
}

uint64_t type metadata accessor for NWConnection()
{
  return MEMORY[0x24BDE0378]();
}

uint64_t type metadata accessor for NWParameters.ServiceClass()
{
  return MEMORY[0x24BDE03A0]();
}

uint64_t NWParameters.serviceClass.setter()
{
  return MEMORY[0x24BDE03A8]();
}

uint64_t NWParameters.nw.getter()
{
  return MEMORY[0x24BDE03D0]();
}

uint64_t NWParameters.__allocating_init(tls:tcp:)()
{
  return MEMORY[0x24BDE03E0]();
}

uint64_t type metadata accessor for NWParameters()
{
  return MEMORY[0x24BDE03F0]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.getter()
{
  return MEMORY[0x24BDE0450]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter()
{
  return MEMORY[0x24BDE0458]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.enableFastOpen.setter()
{
  return MEMORY[0x24BDE0460]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveCount.getter()
{
  return MEMORY[0x24BDE0468]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter()
{
  return MEMORY[0x24BDE0470]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter()
{
  return MEMORY[0x24BDE0478]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.getter()
{
  return MEMORY[0x24BDE0480]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter()
{
  return MEMORY[0x24BDE0488]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.connectionDropTime.setter()
{
  return MEMORY[0x24BDE0490]();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.noDelay.setter()
{
  return MEMORY[0x24BDE0498]();
}

uint64_t NWProtocolTCP.Options.init()()
{
  return MEMORY[0x24BDE04A0]();
}

uint64_t type metadata accessor for NWProtocolTCP.Options()
{
  return MEMORY[0x24BDE04A8]();
}

uint64_t dispatch thunk of NWProtocolTLS.Options.securityProtocolOptions.getter()
{
  return MEMORY[0x24BDE04B0]();
}

uint64_t NWProtocolTLS.Options.init()()
{
  return MEMORY[0x24BDE04B8]();
}

uint64_t type metadata accessor for NWProtocolTLS.Options()
{
  return MEMORY[0x24BDE04C0]();
}

uint64_t NWProtocolDefinition.name.getter()
{
  return MEMORY[0x24BDE05C8]();
}

uint64_t NWPath.isExpensive.getter()
{
  return MEMORY[0x24BDE05D0]();
}

uint64_t NWPath.supportsDNS.getter()
{
  return MEMORY[0x24BDE05D8]();
}

uint64_t NWPath.supportsIPv4.getter()
{
  return MEMORY[0x24BDE05E0]();
}

uint64_t NWPath.supportsIPv6.getter()
{
  return MEMORY[0x24BDE05E8]();
}

uint64_t NWPath.isConstrained.getter()
{
  return MEMORY[0x24BDE05F0]();
}

uint64_t NWPath.availableInterfaces.getter()
{
  return MEMORY[0x24BDE0610]();
}

uint64_t NWPath.nw.getter()
{
  return MEMORY[0x24BDE0618]();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return MEMORY[0x24BDE0640]();
}

uint64_t NWPath.status.getter()
{
  return MEMORY[0x24BDE0650]();
}

uint64_t NWPath.gateways.getter()
{
  return MEMORY[0x24BDE0658]();
}

uint64_t type metadata accessor for NWPath()
{
  return MEMORY[0x24BDE0660]();
}

uint64_t type metadata accessor for NWError()
{
  return MEMORY[0x24BDE0688]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t static DispatchQoS.default.getter()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t DispatchData._bridgeToObjectiveC()()
{
  return MEMORY[0x24BEE5518]();
}

uint64_t static DispatchData._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BEE5520]();
}

uint64_t DispatchData.init(bytes:)()
{
  return MEMORY[0x24BEE5528]();
}

uint64_t DispatchData.count.getter()
{
  return MEMORY[0x24BEE5530]();
}

uint64_t type metadata accessor for DispatchData()
{
  return MEMORY[0x24BEE5538]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t DispatchTime.advanced(by:)()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x24BEE5628]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

Swift::Void __swiftcall Dictionary._Variant.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x24BEE0418](keepingCapacity);
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE0A08]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x24BEE0BB0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CC8](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CD0](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFBC0]();
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

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC08]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC58]();
}

uint64_t static Double._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFC68]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t Int.init(truncating:)()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t OS_dispatch_group.notify(queue:work:)()
{
  return MEMORY[0x24BEE5668]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t OS_dispatch_queue.label.getter()
{
  return MEMORY[0x24BEE57A8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return MEMORY[0x24BEE58B8]();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
  MEMORY[0x24BEE58D0]();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
  MEMORY[0x24BEE58D8]();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return MEMORY[0x24BEE5958]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x24BDD01F8](integerLiteral);
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return MEMORY[0x24BEE2368]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x24BEE4318](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t UInt64.init(truncating:)()
{
  return MEMORY[0x24BDD0808]();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDD0810]();
}

uint64_t _Pointer.debugDescription.getter()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x24BE08BD0]();
}

uint64_t AFDeviceName()
{
  return MEMORY[0x24BE08C58]();
}

uint64_t AFDeviceRegionCode()
{
  return MEMORY[0x24BE08C60]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x24BE08CC0]();
}

uint64_t AFDeviceSupportsWiFiLPASMode()
{
  return MEMORY[0x24BE08CD8]();
}

uint64_t AFHasCellularData()
{
  return MEMORY[0x24BE08D38]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFProductName()
{
  return MEMORY[0x24BE08EF8]();
}

uint64_t AFProductType()
{
  return MEMORY[0x24BE08F00]();
}

uint64_t AFProductVersion()
{
  return MEMORY[0x24BE08F08]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x24BDB7298](message, newBytes, numBytes);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x24BDB72A0](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72A8](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x24BDB72B0](message, headerField);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72C8](message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D0](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x24BDB72E8](response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x24BDB72F8](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t NetworkServiceProxyEnableInParameters()
{
  return MEMORY[0x24BE6B710]();
}

uint64_t NetworkServiceProxySetServiceNameInParameters()
{
  return MEMORY[0x24BE6B728]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x24BE67C00]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x24BE67C78]();
}

uint64_t _AFPreferencesGetTuscanyStatus()
{
  return MEMORY[0x24BE09420]();
}

uint64_t _AFPreferencesShouldUseTFO()
{
  return MEMORY[0x24BE09440]();
}

uint64_t _AFPreferencesShowAllDialogVariantsEnabled()
{
  return MEMORY[0x24BE09448]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreateWithExpirationCB()
{
  return MEMORY[0x24BDC28A8]();
}

uint64_t _CTServerForceFastDormancy()
{
  return MEMORY[0x24BDC2998]();
}

CFStringRef __CFStringMakeConstantString(const char *cStr)
{
  return (CFStringRef)MEMORY[0x24BDBD198](cStr);
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

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E8](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x24BDE0A48]();
}

uint64_t nw_array_get_object_at_index()
{
  return MEMORY[0x24BDE0A50]();
}

uint64_t nw_connection_copy_attempted_endpoint_array()
{
  return MEMORY[0x24BDE0B10]();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x24BDE0B28]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0B50](connection, definition);
}

uint64_t nw_connection_copy_tcp_info()
{
  return MEMORY[0x24BDE0B60]();
}

uint64_t nw_connection_fillout_tcp_statistics()
{
  return MEMORY[0x24BDE0BA0]();
}

uint64_t nw_connection_multipath_copy_subflow_counts()
{
  return MEMORY[0x24BDE0C08]();
}

uint64_t nw_connection_multipath_get_primary_subflow_interface_index()
{
  return MEMORY[0x24BDE0C10]();
}

uint64_t nw_connection_multipath_get_subflow_count()
{
  return MEMORY[0x24BDE0C18]();
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x24BDE0CA0]();
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x24BDE0CC0]();
}

uint64_t nw_connection_uses_multipath()
{
  return MEMORY[0x24BDE0CF8]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x24BDE0DA0]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x24BDE0DB8]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x24BDE0DC0]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x24BDE0DC8]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x24BDE0DD0]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x24BDE0EF8]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x24BDE13A8](interface);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x24BDE1648]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x24BDE1658]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
  MEMORY[0x24BDE1678](parameters, *(_QWORD *)&expired_dns_behavior);
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x24BDE16A8]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x24BDE16B0]();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
  MEMORY[0x24BDE16E0](parameters, *(_QWORD *)&multipath_service);
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x24BDE1748](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x24BDE1770]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x24BDE1780]();
}

uint64_t nw_parameters_set_tls_session_id()
{
  return MEMORY[0x24BDE1788]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x24BDE1790]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x24BDE17D8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x24BDE1818]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x24BDE1848]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x24BDE1B88]();
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x24BDE25F0](metadata);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x24BDE95C0](metadata);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x24BDE95D8](options, application_protocol);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9628](options, version);
}

void sec_protocol_options_set_tls_false_start_enabled(sec_protocol_options_t options, BOOL false_start_enabled)
{
  MEMORY[0x24BDE9690](options, false_start_enabled);
}

void sec_protocol_options_set_tls_resumption_enabled(sec_protocol_options_t options, BOOL resumption_enabled)
{
  MEMORY[0x24BDE9698](options, resumption_enabled);
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
  MEMORY[0x24BDE96A8](options, tickets_enabled);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

