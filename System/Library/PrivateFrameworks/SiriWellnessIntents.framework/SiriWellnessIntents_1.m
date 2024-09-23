uint64_t $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  _BYTE **v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  uint64_t v71;
  uint32_t v72;
  const char *v73;
  const char *v74;
  const char *v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  uint64_t v78;
  uint64_t v79;

  v61 = a1;
  v65 = a2;
  v41 = "GBPIHandle";
  v42 = "Assertion failed";
  v43 = "os/OSSignpostStringInterpolationAPI.swift";
  v44 = "Fatal error";
  v45 = "Unexpectedly found nil while unwrapping an Optional value";
  v46 = "Swift/StaticString.swift";
  v79 = 0;
  v78 = 0;
  v47 = 0;
  v52 = 0;
  v48 = type metadata accessor for OSSignpostError();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = (*(_QWORD *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v51 = (char *)&v16 - v50;
  v53 = type metadata accessor for OSSignpostID();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = (*(_QWORD *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v52);
  v56 = (uint64_t)&v16 - v55;
  v57 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v63 = (char *)&v16 - v57;
  v58 = type metadata accessor for OSSignposter();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = (*(_QWORD *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](v58);
  v62 = (char *)&v16 - v60;
  v79 = v61;
  v78 = v5;
  (*(void (**)(char *, uint64_t, double))(v6 + 16))((char *)&v16 - v60, v61 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v4);
  v64 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  v66 = static os_signpost_type_t.end.getter();
  swift_retain();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
LABEL_11:
    (*(void (**)(char *, uint64_t))(v54 + 8))(v63, v53);
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v62, v58);
  }
  v77 = 0;
  v76 = 0;
  v74 = v41;
  v40 = v41;
  if (v41)
  {
    closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v40, (uint64_t *)&v75);
    v39 = v75;
    v73 = "";
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v51, v48) == *MEMORY[0x24BEE7810])
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("[Error] Interval already ended", 0x1EuLL, 1);
      v14 = 785;
      v15 = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v8 = v47;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v48);
    swift_release();
    v18 = v73;
    v28 = v77;
    v30 = v76;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v25 = 0;
    v31 = _allocateUninitializedArray<A>(_:)();
    v9 = v64;
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v56, v63, v53);
    v21 = &v71;
    v22 = 2;
    v71 = 2;
    v19 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v20 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v23 = v72;
    v26 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v27 = createStorage<A>(capacity:type:)(v25);
    v29 = createStorage<A>(capacity:type:)(v25);
    v34 = &v70;
    v70 = v26;
    v35 = &v69;
    v69 = v27;
    v32 = &v68;
    v68 = v29;
    serialize(_:at:)(v28, &v70);
    serialize(_:at:)(v30, v34);
    v67 = v31;
    v33 = &v16;
    MEMORY[0x24BDAC7A8](&v16);
    v10 = v35;
    v11 = &v16 - 6;
    v36 = &v16 - 6;
    v11[2] = (uint64_t)v34;
    v11[3] = (uint64_t)v10;
    v11[4] = v12;
    v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    v38 = v8;
    if (v8)
      __break(1u);
    else
      closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v26, v23, v64, (os_signpost_type_t)v66, v56, v39, v18);
    v17 = 0;
    destroyStorage<A>(_:count:)(v27, 0, v24);
    destroyStorage<A>(_:count:)(v29, v17, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v26, MEMORY[0x24BEE4260]);

    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v56, v53);
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, void *a2, void *a3, char *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void *a9, void *a10)
{
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
  id v24;
  id v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  unint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint32_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t *v80;
  _BYTE **v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  NSObject *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint32_t v99;
  uint64_t v100;
  uint64_t v101;
  uint8_t *v102;
  uint64_t v103;
  unsigned int v104;
  uint64_t v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t *v109;
  _BYTE **v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  Class v118;
  void (*v119)(char *, uint64_t, uint64_t);
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  void (*v132)(char *, char *, uint64_t);
  NSObject *v133;
  int v134;
  Class v135;
  Class v136;
  id v137;
  id v138;
  Class v139;
  id v140;
  Class isa;
  Class v142;
  unsigned int (*v143)(char *, uint64_t, uint64_t);
  id v144;
  id v145;
  const char *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  unint64_t v154;
  char *v155;
  unint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  char *v162;
  unint64_t v163;
  char *v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  id v177;
  char *v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  char *v187;
  unint64_t v188;
  id v189;
  char *v190;
  id v191;
  id v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  _BYTE *v197;
  uint64_t v198;
  uint32_t v199;
  const char *v200;
  const char *v201;
  const char *v202;
  unsigned __int8 v203;
  unsigned __int8 v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  _BYTE *v208;
  uint64_t v209;
  uint32_t v210;
  const char *v211;
  const char *v212;
  const char *v213;
  unsigned __int8 v214;
  unsigned __int8 v215;
  id v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;

  v184 = a1;
  v191 = a2;
  v177 = a3;
  v178 = a4;
  v179 = a5;
  v180 = a6;
  v181 = a7;
  v182 = a8;
  v189 = a9;
  v183 = a10;
  v146 = "Query initialized";
  v147 = "Query execution complete";
  v148 = "Fatal error";
  v149 = "Unexpectedly found nil while unwrapping an Optional value";
  v150 = "Swift/StaticString.swift";
  v228 = 0;
  v227 = 0;
  v226 = 0;
  v225 = 0;
  v224 = 0;
  v223 = 0;
  v222 = 0;
  v221 = 0;
  v220 = 0;
  v219 = 0;
  v217 = 0;
  v216 = 0;
  v151 = 0;
  v167 = 0;
  v152 = type metadata accessor for OSSignposter();
  v153 = *(_QWORD **)(v152 - 8);
  v154 = (v153[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v155 = (char *)&v62 - v154;
  v156 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v11);
  v157 = (char *)&v62 - v156;
  v158 = type metadata accessor for OSSignpostID();
  v159 = *(_QWORD *)(v158 - 8);
  v160 = *(_QWORD *)(v159 + 64);
  v161 = (v160 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v158);
  v162 = (char *)&v62 - v161;
  v163 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v62 - v161);
  v164 = (char *)&v62 - v163;
  v165 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v62 - v163);
  v166 = (char *)&v62 - v165;
  v168 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  v169 = *(_QWORD *)(v168 - 8);
  v170 = *(_QWORD *)(v169 + 64);
  v171 = (v170 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v167);
  v172 = (char *)&v62 - v171;
  v173 = type metadata accessor for Date();
  v174 = *(_QWORD *)(v173 - 8);
  v175 = (*(_QWORD *)(v174 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v173);
  v176 = (char *)&v62 - v175;
  v186 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64);
  v185 = (v186 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v184);
  v187 = (char *)&v62 - v185;
  v188 = (v186 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v14);
  v190 = (char *)&v62 - v188;
  v228 = v15;
  v227 = v16;
  v226 = v17;
  v225 = v18;
  v224 = v19;
  v223 = v20;
  v222 = v21;
  v221 = v22 + 16;
  v220 = v189;
  v219 = v23;
  v192 = (id)objc_opt_self();
  v193 = objc_msgSend(v191, sel_startDate);
  if (v193)
  {
    v145 = v193;
    v144 = v193;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v174 + 32))(v190, v176, v173);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v174 + 56))(v190, 0, 1, v173);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v174 + 56))(v190, 1, 1, v173);
  }
  v143 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v174 + 48);
  if (v143(v190, 1, v173) == 1)
  {
    v142 = 0;
  }
  else
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v174 + 8))(v190, v173);
    v142 = isa;
  }
  v139 = v142;
  v140 = objc_msgSend(v191, sel_endDate);
  if (v140)
  {
    v138 = v140;
    v137 = v140;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v174 + 32))(v187, v176, v173);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v174 + 56))(v187, 0, 1, v173);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v174 + 56))(v187, 1, 1, v173);
  }
  if (v143(v187, 1, v173) == 1)
  {
    v136 = 0;
  }
  else
  {
    v135 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v174 + 8))(v187, v173);
    v136 = v135;
  }
  v118 = v136;
  v129 = 0;
  type metadata accessor for HKQueryOptions();
  v117 = _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type HKQueryOptions and conformance HKQueryOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  v128 = objc_msgSend(v192, sel_predicateForSamplesWithStartDate_endDate_options_, v139, v118, v218);

  v217 = v128;
  type metadata accessor for HKCorrelationQuery();
  v24 = v177;
  v25 = v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v169 + 16))(v172, v184, v168);
  v26 = v178;
  v119 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 16);
  v119(v166, v179, v158);
  swift_bridgeObjectRetain();
  v27 = v181;
  swift_retain();
  v28 = v189;
  v29 = v183;
  v120 = (*(unsigned __int8 *)(v169 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v169 + 80);
  v121 = (v120 + v170 + 7) & 0xFFFFFFFFFFFFFFF8;
  v122 = (v121 + 8 + *(unsigned __int8 *)(v159 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80);
  v123 = (v122 + v160 + 7) & 0xFFFFFFFFFFFFFFF8;
  v124 = (v123 + 15) & 0xFFFFFFFFFFFFFFF8;
  v125 = (v124 + 15) & 0xFFFFFFFFFFFFFFF8;
  v126 = (v125 + 15) & 0xFFFFFFFFFFFFFFF8;
  v127 = (v126 + 15) & 0xFFFFFFFFFFFFFFF8;
  v130 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v169 + 32))(v130 + v120, v172, v168);
  v30 = v122;
  v31 = v159;
  v32 = v166;
  v33 = v158;
  v34 = v130;
  *(_QWORD *)(v130 + v121) = v178;
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v34 + v30, v32, v33);
  v35 = v181;
  v36 = v124;
  v37 = v125;
  v38 = v182;
  v39 = v126;
  v40 = v189;
  v41 = v127;
  v42 = v183;
  v43 = v128;
  v44 = v129;
  v45 = v130;
  v46 = v177;
  *(_QWORD *)(v130 + v123) = v180;
  *(_QWORD *)(v45 + v36) = v35;
  *(_QWORD *)(v45 + v37) = v38;
  *(_QWORD *)(v45 + v39) = v40;
  *(_QWORD *)(v45 + v41) = v42;
  v131 = HKCorrelationQuery.__allocating_init(type:predicate:samplePredicates:completion:)(v46, v43, v44, (uint64_t)partial apply for closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:), v45);
  v216 = v131;
  v132 = (void (*)(char *, char *, uint64_t))v153[2];
  v132(v157, &v178[OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter], v152);
  v133 = OSSignposter.logHandle.getter();
  v134 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
    v115 = v151;
    goto LABEL_23;
  }
  v204 = 0;
  v203 = 0;
  v201 = v146;
  v116 = v146;
  if (!v146)
  {
    v59 = 2;
    v60 = 136;
    v61 = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_26;
  }
  v47 = v151;
  closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v116, (uint64_t *)&v202);
  v93 = v202;
  v200 = "";
  v94 = "";
  v104 = v204;
  v106 = v203;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v101 = 0;
  v107 = _allocateUninitializedArray<A>(_:)();
  v48 = v133;
  v119(v164, v179, v158);
  v97 = &v198;
  v98 = 2;
  v198 = 2;
  v95 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v96 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v99 = v199;
  v102 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v103 = createStorage<A>(capacity:type:)(v101);
  v105 = createStorage<A>(capacity:type:)(v101);
  v110 = &v197;
  v197 = v102;
  v111 = &v196;
  v196 = v103;
  v108 = &v195;
  v195 = v105;
  serialize(_:at:)(v104, &v197);
  serialize(_:at:)(v106, v110);
  v194 = v107;
  v109 = &v62;
  MEMORY[0x24BDAC7A8](&v62);
  v49 = v111;
  v50 = &v62 - 6;
  v112 = &v62 - 6;
  v50[2] = (uint64_t)v110;
  v50[3] = (uint64_t)v49;
  v50[4] = v51;
  v113 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  v114 = v47;
  if (v47)
  {
    __break(1u);
LABEL_21:
    v91 = 0;
    destroyStorage<A>(_:count:)(v103, 0, v100);
    destroyStorage<A>(_:count:)(v105, v91, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v102, MEMORY[0x24BEE4260]);

    (*(void (**)(char *, uint64_t))(v159 + 8))(v164, v158);
    swift_bridgeObjectRelease();
    v115 = v92;
    goto LABEL_23;
  }
  v52 = v114;
  closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v102, v99, v133, (os_signpost_type_t)v134, (uint64_t)v164, v93, v94);
  v92 = v52;
  if (!v52)
    goto LABEL_21;
  __break(1u);
LABEL_23:
  v53 = v155;
  v87 = v115;

  v88 = (void (*)(char *, uint64_t))v153[1];
  v88(v157, v152);
  objc_msgSend(v183, sel_executeQuery_, v131);
  v132(v53, &v178[OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter], v152);
  v89 = OSSignposter.logHandle.getter();
  v90 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
LABEL_31:

    v88(v155, v152);
    return;
  }
LABEL_26:
  v215 = 0;
  v214 = 0;
  v212 = v147;
  v86 = v147;
  if (v147)
  {
    v54 = v87;
    closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v86, (uint64_t *)&v213);
    v64 = v213;
    v211 = "";
    v65 = "";
    v75 = v215;
    v77 = v214;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v72 = 0;
    v78 = _allocateUninitializedArray<A>(_:)();
    v55 = v89;
    v119(v162, v179, v158);
    v68 = &v209;
    v69 = 2;
    v209 = 2;
    v66 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v67 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v70 = v210;
    v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v74 = createStorage<A>(capacity:type:)(v72);
    v76 = createStorage<A>(capacity:type:)(v72);
    v81 = &v208;
    v208 = v73;
    v82 = &v207;
    v207 = v74;
    v79 = &v206;
    v206 = v76;
    serialize(_:at:)(v75, &v208);
    serialize(_:at:)(v77, v81);
    v205 = v78;
    v80 = &v62;
    MEMORY[0x24BDAC7A8](&v62);
    v56 = v82;
    v57 = &v62 - 6;
    v83 = &v62 - 6;
    v57[2] = (uint64_t)v81;
    v57[3] = (uint64_t)v56;
    v57[4] = v58;
    v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    v85 = v54;
    if (v54)
      __break(1u);
    else
      closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v73, v70, v89, (os_signpost_type_t)v90, (uint64_t)v162, v64, v65);
    v63 = 0;
    destroyStorage<A>(_:count:)(v74, 0, v71);
    destroyStorage<A>(_:count:)(v76, v63, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v73, MEMORY[0x24BEE4260]);

    (*(void (**)(char *, uint64_t))(v159 + 8))(v162, v158);
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  v59 = 2;
  v60 = 136;
  v61 = 0;
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, void *a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t *v42;
  void **v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void **v51;
  void *v52;
  void *v53;
  uint64_t result;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  char *v60;
  uint64_t v61;
  uint64_t *v62;
  void **v63;
  void *v64;
  char *v65;
  char v66;
  uint64_t v67;
  int v68;
  void *v69[2];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t *v77;
  void **v78;
  _BYTE **v79;
  uint64_t *v80;
  void **v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t *v87;
  uint32_t v88;
  int v89;
  NSObject *v90;
  uint64_t v91;
  Class v92;
  uint64_t *v93;
  HKUnit v94;
  Swift::String v95;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  id v102;
  id *v103;
  Class v104;
  Class v105;
  id v106;
  id v107;
  id v108;
  Class v109;
  id v110;
  uint64_t *v111;
  uint64_t *v112;
  id v113;
  Class isa;
  Class v115;
  unsigned int (*v116)(char *, uint64_t, uint64_t);
  id v117;
  id v118;
  id v119;
  id v120;
  char *v121;
  unint64_t v122;
  uint64_t *v123;
  id v124;
  void **v125;
  void **v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint32_t v135;
  uint64_t v136;
  uint64_t v137;
  uint8_t *v138;
  uint64_t v139;
  unsigned int v140;
  uint64_t v141;
  unsigned int v142;
  uint64_t v143;
  uint64_t *v144;
  void **v145;
  _BYTE **v146;
  uint64_t *v147;
  void **v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  NSObject *v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  char **v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint8_t *v168;
  uint64_t v169;
  uint64_t v170;
  _BYTE **v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  id v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t *v180;
  uint32_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  _QWORD *v191;
  uint64_t v192;
  NSObject *v193;
  int v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  const char *v198;
  const char *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  char *v205;
  unint64_t v206;
  char *v207;
  unint64_t v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  char *v230;
  uint64_t v231;
  uint64_t v232;
  id v233;
  char *v234;
  void *v235;
  uint64_t (*v236)(uint64_t, uint64_t, uint64_t);
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  _BYTE *v240;
  char *v241;
  uint64_t v242;
  uint32_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  _BYTE *v249;
  uint64_t v250;
  uint32_t v251;
  const char *v252;
  const char *v253;
  const char *v254;
  unsigned __int8 v255;
  unsigned __int8 v256;
  id v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  char v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  _BYTE *v272;
  char *v273;
  uint64_t v274;
  uint32_t v275;
  char v276;
  uint64_t v277;
  id v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  HKHealthStore_optional v288;
  Swift::Double_optional v289;

  v231 = a1;
  v225 = a2;
  v235 = a3;
  v219 = a4;
  v220 = a5;
  v221 = a6;
  v222 = a7;
  v223 = a8;
  v232 = a9;
  v233 = a10;
  v224 = a11;
  v197 = "correlation operations begin";
  v198 = "Fatal error";
  v199 = "Unexpectedly found nil while unwrapping an Optional value";
  v200 = "Swift/StaticString.swift";
  v287 = 0;
  v286 = 0;
  v285 = 0;
  v284 = 0;
  v283 = 0;
  v282 = 0;
  v281 = 0;
  v280 = 0;
  v279 = 0;
  v278 = 0;
  v277 = 0;
  v201 = 0;
  v268 = 0;
  v245 = 0;
  v214 = 0;
  v202 = type metadata accessor for Date();
  v203 = *(_QWORD *)(v202 - 8);
  v204 = (*(_QWORD *)(v203 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v202);
  v205 = (char *)v69 - v204;
  v206 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v214);
  v207 = (char *)v69 - v206;
  v208 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v12);
  v209 = (char *)v69 - v208;
  v210 = type metadata accessor for OSSignpostID();
  v211 = *(_QWORD *)(v210 - 8);
  v212 = (*(_QWORD *)(v211 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v214);
  v213 = (uint64_t)v69 - v212;
  v215 = type metadata accessor for OSSignposter();
  v216 = *(_QWORD *)(v215 - 8);
  v217 = (*(_QWORD *)(v216 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v214);
  v218 = (char *)v69 - v217;
  v226 = type metadata accessor for Logger();
  v227 = *(_QWORD *)(v226 - 8);
  v229 = *(_QWORD *)(v227 + 64);
  v228 = (v229 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v235);
  v230 = (char *)v69 - v228;
  MEMORY[0x24BDAC7A8](v13);
  v234 = (char *)v69 - v14;
  v287 = v231;
  v286 = v15;
  v285 = v16;
  v284 = v17;
  v283 = v18;
  v282 = v19;
  v281 = v20;
  v280 = v21;
  v279 = v232 + 16;
  v278 = v233;
  v277 = v22;
  v23 = v16;
  if (v235)
  {
    v196 = v235;
    v24 = v234;
    v177 = v235;
    v245 = v235;
    v175 = Logger.wellness.unsafeMutableAddressor();
    v176 = &v244;
    v183 = 32;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v227 + 16))(v24, v175, v226);
    swift_endAccess();
    v25 = v177;
    v184 = 7;
    v185 = swift_allocObject();
    *(_QWORD *)(v185 + 16) = v177;
    v193 = Logger.logObject.getter();
    v194 = static os_log_type_t.error.getter();
    v180 = &v242;
    v242 = 12;
    v178 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v179 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v181 = v243;
    v182 = 17;
    v187 = swift_allocObject();
    *(_BYTE *)(v187 + 16) = 32;
    v188 = swift_allocObject();
    *(_BYTE *)(v188 + 16) = 8;
    v26 = swift_allocObject();
    v27 = v185;
    v186 = v26;
    *(_QWORD *)(v26 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:);
    *(_QWORD *)(v26 + 24) = v27;
    v28 = swift_allocObject();
    v29 = v186;
    v190 = v28;
    *(_QWORD *)(v28 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v28 + 24) = v29;
    v192 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v189 = _allocateUninitializedArray<A>(_:)();
    v191 = v30;
    swift_retain();
    v31 = v187;
    v32 = v191;
    *v191 = partial apply for closure #1 in OSLogArguments.append(_:);
    v32[1] = v31;
    swift_retain();
    v33 = v188;
    v34 = v191;
    v191[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v34[3] = v33;
    swift_retain();
    v35 = v190;
    v36 = v191;
    v191[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v36[5] = v35;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v193, (os_log_type_t)v194))
    {
      v37 = v201;
      v168 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v167 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v169 = createStorage<A>(capacity:type:)(0);
      v170 = createStorage<A>(capacity:type:)(1);
      v171 = &v240;
      v240 = v168;
      v172 = &v239;
      v239 = v169;
      v173 = &v238;
      v238 = v170;
      serialize(_:at:)(2, &v240);
      serialize(_:at:)(1, v171);
      v236 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v237 = v187;
      closure #1 in osLogInternal(_:log:type:)(&v236, (uint64_t)v171, (uint64_t)v172, (uint64_t)v173);
      v174 = v37;
      if (v37)
      {
        __break(1u);
      }
      else
      {
        v236 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v237 = v188;
        closure #1 in osLogInternal(_:log:type:)(&v236, (uint64_t)&v240, (uint64_t)&v239, (uint64_t)&v238);
        v165 = 0;
        v236 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v237 = v190;
        closure #1 in osLogInternal(_:log:type:)(&v236, (uint64_t)&v240, (uint64_t)&v239, (uint64_t)&v238);
        v164 = 0;
        _os_log_impl(&dword_24749F000, v193, (os_log_type_t)v194, "Query Errored out: %s", v168, v181);
        destroyStorage<A>(_:count:)(v169, 0, v167);
        destroyStorage<A>(_:count:)(v170, 1, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v168, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
        v166 = v164;
      }
    }
    else
    {
      v38 = v201;
      swift_release();
      swift_release();
      swift_release();
      v166 = v38;
    }
    v163 = v166;

    (*(void (**)(char *, uint64_t))(v227 + 8))(v234, v226);
    v161 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    v39 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, v161);
    v162 = &v241;
    v241 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
    CheckedContinuation.resume(returning:)();

    v195 = v163;
  }
  else
  {
    v195 = v201;
  }
  v160 = v195;
  swift_bridgeObjectRetain();
  if (v225)
  {
    v159 = v225;
    v155 = v225;
    v268 = v225;
    swift_bridgeObjectRetain();
    v157 = &v267;
    v267 = v155;
    v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKCorrelation]);
    lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
    v158 = Collection.isEmpty.getter();
    outlined destroy of [HKQuantityType]();
    if ((v158 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v216 + 16))(v218, v220 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v215);
      v153 = OSSignposter.logHandle.getter();
      v154 = static os_signpost_type_t.event.getter();
      if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
      {
        v151 = v160;
        goto LABEL_24;
      }
      v256 = 0;
      v255 = 0;
      v253 = v197;
      v152 = v197;
      if (!v197)
      {
        v66 = 2;
        v67 = 136;
        v68 = 0;
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
LABEL_27:
        swift_bridgeObjectRelease();

        v121 = &v265;
        swift_beginAccess();
        v120 = *(id *)(v232 + 16);
        v55 = v120;
        swift_endAccess();
        swift_bridgeObjectRetain();
        v123 = &v263;
        v263 = v155;
        v122 = lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
        BidirectionalCollection.last.getter();
        outlined destroy of [HKQuantityType]();
        v124 = v264;
        if (v264)
        {
          v119 = v124;
          v117 = v124;
          v118 = objc_msgSend(v124, sel_startDate);
          static Date._unconditionallyBridgeFromObjectiveC(_:)();
          (*(void (**)(char *, char *, uint64_t))(v203 + 32))(v209, v205, v202);

          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v203 + 56))(v209, 0, 1, v202);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v203 + 56))(v209, 1, 1, v202);
        }
        v116 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v203 + 48);
        if (v116(v209, 1, v202) == 1)
        {
          v115 = 0;
        }
        else
        {
          isa = Date._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v203 + 8))(v209, v202);
          v115 = isa;
        }
        v109 = v115;
        objc_msgSend(v120, sel_setSampleStartDate_);

        v111 = &v262;
        swift_beginAccess();
        v110 = *(id *)(v232 + 16);
        v56 = v110;
        swift_endAccess();
        swift_bridgeObjectRetain();
        v112 = &v260;
        v260 = v155;
        BidirectionalCollection.last.getter();
        outlined destroy of [HKQuantityType]();
        v113 = v261;
        if (v261)
        {
          v108 = v113;
          v106 = v113;
          v107 = objc_msgSend(v113, sel_endDate);
          static Date._unconditionallyBridgeFromObjectiveC(_:)();
          (*(void (**)(char *, char *, uint64_t))(v203 + 32))(v207, v205, v202);

          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v203 + 56))(v207, 0, 1, v202);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v203 + 56))(v207, 1, 1, v202);
        }
        if (v116(v207, 1, v202) == 1)
        {
          v105 = 0;
        }
        else
        {
          v104 = Date._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v203 + 8))(v207, v202);
          v105 = v104;
        }
        v92 = v105;
        objc_msgSend(v110, sel_setSampleEndDate_);

        v98 = v232 + 16;
        v93 = &v259;
        v99 = 32;
        v100 = 0;
        swift_beginAccess();
        v97 = *(id *)(v232 + 16);
        v57 = v97;
        swift_endAccess();
        v94.super.isa = (Class)objc_msgSend((id)objc_opt_self(), sel_millimeterOfMercuryUnit);
        v58 = v224;
        v288.is_nil = (char)v224;
        v289.is_nil = 0;
        v288.value.super.isa = 0;
        v95 = localizedUnitName(for:value:store:)(v94, v289, v288);

        v96 = (id)MEMORY[0x24957CFB4](v95._countAndFlagsBits, v95._object);
        swift_bridgeObjectRelease();
        objc_msgSend(v97, sel_setUnit_, v96);

        v101 = &v258;
        swift_beginAccess();
        v102 = *(id *)(v232 + 16);
        v59 = v102;
        swift_endAccess();
        v103 = &v257;
        v257 = v102;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
        CheckedContinuation.resume(returning:)();
        return swift_bridgeObjectRelease();
      }
      v40 = v160;
      closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v152, (uint64_t *)&v254);
      v129 = v254;
      v252 = "";
      v130 = "";
      v140 = v256;
      v142 = v255;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v137 = 0;
      v143 = _allocateUninitializedArray<A>(_:)();
      v41 = v153;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v211 + 16))(v213, v221, v210);
      v133 = &v250;
      v134 = 2;
      v250 = 2;
      v131 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v132 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v135 = v251;
      v138 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v136 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v139 = createStorage<A>(capacity:type:)(v137);
      v141 = createStorage<A>(capacity:type:)(v137);
      v146 = &v249;
      v249 = v138;
      v147 = &v248;
      v248 = v139;
      v144 = &v247;
      v247 = v141;
      serialize(_:at:)(v140, &v249);
      serialize(_:at:)(v142, v146);
      v246 = v143;
      v145 = v69;
      MEMORY[0x24BDAC7A8](v69);
      v42 = v147;
      v43 = &v69[-6];
      v148 = &v69[-6];
      v43[2] = v146;
      v43[3] = v42;
      v43[4] = v44;
      v149 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      v150 = v40;
      if (v40)
      {
        __break(1u);
      }
      else
      {
        v45 = v150;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v138, v135, v153, (os_signpost_type_t)v154, v213, v129, v130);
        v128 = v45;
        if (v45)
        {
          __break(1u);
LABEL_24:
          v46 = v151;

          (*(void (**)(char *, uint64_t))(v216 + 8))(v218, v215);
          v266 = v155;
          swift_bridgeObjectRetain();
          v47 = v223;
          v48 = v233;
          v125 = v69;
          MEMORY[0x24BDAC7A8](v69);
          v49 = v223;
          v50 = v232;
          v51 = &v69[-6];
          v126 = &v69[-6];
          v51[2] = v52;
          v51[3] = v49;
          v51[4] = (void *)(v50 + 16);
          v51[5] = v53;
          lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
          result = Sequence.forEach(_:)();
          if (v46)
          {
            __break(1u);
            return result;
          }
          goto LABEL_27;
        }
      }
      v127 = 0;
      destroyStorage<A>(_:count:)(v139, 0, v136);
      destroyStorage<A>(_:count:)(v141, v127, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v138, MEMORY[0x24BEE4260]);

      (*(void (**)(uint64_t, uint64_t))(v211 + 8))(v213, v210);
      swift_bridgeObjectRelease();
      v151 = v128;
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
  }
  v60 = v230;
  v83 = Logger.wellness.unsafeMutableAddressor();
  v84 = &v276;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v227 + 16))(v60, v83, v226);
  swift_endAccess();
  v90 = Logger.logObject.getter();
  v89 = static os_log_type_t.debug.getter();
  v87 = &v274;
  v274 = 2;
  v85 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v86 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v88 = v275;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v91 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v90, (os_log_type_t)v89))
  {
    v61 = v160;
    v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v72 = 0;
    v74 = createStorage<A>(capacity:type:)(0);
    v75 = createStorage<A>(capacity:type:)(v72);
    v79 = &v272;
    v272 = v73;
    v80 = &v271;
    v271 = v74;
    v77 = &v270;
    v270 = v75;
    v76 = 0;
    serialize(_:at:)(0, &v272);
    serialize(_:at:)(v76, v79);
    v269 = v91;
    v78 = v69;
    MEMORY[0x24BDAC7A8](v69);
    v62 = v80;
    v63 = &v69[-6];
    v81 = &v69[-6];
    v63[2] = v79;
    v63[3] = v62;
    v63[4] = v64;
    v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v61)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_24749F000, v90, (os_log_type_t)v89, "No data returned", v73, v88);
      v70 = 0;
      destroyStorage<A>(_:count:)(v74, 0, v71);
      destroyStorage<A>(_:count:)(v75, v70, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v73, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v227 + 8))(v230, v226);
  v69[0] = 0;
  type metadata accessor for GetBloodPressureIntentResponse();
  v65 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, v69[0]);
  v69[1] = &v273;
  v273 = v65;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  swift_getErrorValue();
  return Error.localizedDescription.getter();
}

uint64_t closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void **a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void *v7;

  v7 = *a1;
  swift_bridgeObjectRetain();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_beginAccess();
  conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(v7, a2, a3);
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_beginAccess();
  conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(v7, a2, a5);
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void key path getter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_systolicMinimum);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setSystolicMinimum_, v4);

}

void key path getter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_systolicMaximum);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setSystolicMaximum_, v4);

}

void key path getter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_systolic);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setSystolic_, v4);

}

void key path getter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_diastolicMinimum);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setDiastolicMinimum_, v4);

}

void key path getter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_diastolicMaximum);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setDiastolicMaximum_, v4);

}

void key path getter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  objc_msgSend(v4, sel_diastolic);
  *a2 = v3;

}

void key path setter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  id v2;
  id v3;
  double v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  objc_msgSend(v3, sel_setDiastolic_, v4);

}

id HKCorrelationQuery.__allocating_init(type:predicate:samplePredicates:completion:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;

  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc HKCorrelationQuery.init(type:predicate:samplePredicates:completion:)(a1, a2, a3, a4, a5);
}

uint64_t implicit closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/Library/Caches/com.apple.xbs/Sources/SiriHealth/Wellness/SiriWellnessIntents/Intent Handlers/GetBloodPressureIntentHandler.swift", 0x81uLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #2 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return 151;
}

uint64_t @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 48) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return GetBloodPressureIntentHandler.handle(intent:)((uint64_t)a1);
}

id GetBloodPressureIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t GetBloodPressureIntentHandler.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriWellnessIntents.GetBloodPressureIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.GetBloodPressureIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/GetBloodPressureIntentHandler.swift", 55, 2, v1, 0x3EuLL, 0x14uLL);
  __break(1u);
  return result;
}

id GetBloodPressureIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc HKCorrelationQuery.init(type:predicate:samplePredicates:completion:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const void *v6;
  id v7;
  Class isa;
  Class v9;
  void *v14;
  uint64_t aBlock;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  uint64_t v20;
  uint64_t v21;

  if (a3)
  {
    type metadata accessor for HKSampleType();
    type metadata accessor for NSPredicate();
    lazy protocol witness table accessor for type HKSampleType and conformance NSObject();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v20 = a4;
  v21 = a5;
  aBlock = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = 0;
  v18 = thunk for @escaping @callee_guaranteed (@guaranteed HKCorrelationQuery, @guaranteed [HKCorrelation]?, @guaranteed Error?) -> ();
  v19 = &block_descriptor_64;
  v6 = _Block_copy(&aBlock);
  v7 = objc_msgSend(v14, sel_initWithType_predicate_samplePredicates_completion_, a1, a2, v9);
  _Block_release(v6);
  swift_release();

  return v7;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed HKCorrelationQuery, @guaranteed [HKCorrelation]?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(void *, uint64_t);

  v12 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = a3;
  if (a3)
  {
    type metadata accessor for HKCorrelation();
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  v6 = a4;
  if (a4)
    v8 = a4;
  else
    v8 = 0;
  v12(a2, v10);

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t closure #1 in _globalStringTablePointerOfStaticString(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  *a2 = v2;
  return result;
}

void closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v7;

  v7 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_24749F000, a3, a4, v7, a6, a7, a1, a2);
}

unint64_t type metadata accessor for HKCorrelationType()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for HKCorrelationType;
  if (!lazy cache variable for type metadata for HKCorrelationType)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCorrelationType);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_24758A880()
{
  uint64_t v0;

  return swift_deallocObject();
}

void partial apply for closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(char **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56), *(_QWORD *)(v1 + 64), *(void **)(v1 + 72), *(void **)(v1 + 80));
}

uint64_t sub_24758A908()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24758A944()
{
  return swift_deallocObject();
}

uint64_t sub_24758A96C()
{
  return swift_deallocObject();
}

uint64_t sub_24758A994()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758A9D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758AA0C()
{
  return swift_deallocObject();
}

uint64_t sub_24758AA34()
{
  return swift_deallocObject();
}

uint64_t sub_24758AA5C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758AA98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758AAD4()
{
  return swift_deallocObject();
}

uint64_t sub_24758AAFC()
{
  return swift_deallocObject();
}

uint64_t sub_24758AB24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758AB60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758AB9C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758ABD8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)
                                                               + async function pointer to @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)))(v6, v4, v5);
}

uint64_t ObjC metadata update function for GetBloodPressureIntentHandler()
{
  return type metadata accessor for GetBloodPressureIntentHandler();
}

uint64_t type metadata accessor for GetBloodPressureIntentHandler()
{
  uint64_t v1;

  v1 = type metadata singleton initialization cache for GetBloodPressureIntentHandler;
  if (!type metadata singleton initialization cache for GetBloodPressureIntentHandler)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t type metadata completion function for GetBloodPressureIntentHandler()
{
  unint64_t v0;
  uint64_t updated;

  updated = type metadata accessor for OSSignposter();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

unint64_t type metadata accessor for HKCorrelationQuery()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for HKCorrelationQuery;
  if (!lazy cache variable for type metadata for HKCorrelationQuery)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCorrelationQuery);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_24758AE74()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  v2 = *(_QWORD *)(v4 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = type metadata accessor for OSSignpostID();
  v6 = *(_QWORD *)(v8 - 8);
  v7 = (v5 + 8 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = (((v7 + *(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);

  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v8);
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>)
                 - 8);
  v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v10 = (v12 + *(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(type metadata accessor for OSSignpostID() - 8);
  v6 = (v10 + 8 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (v6 + *(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  return closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, a2, a3, v3 + v12, *(_QWORD *)(v3 + v10), v3 + v6, *(_QWORD *)(v3 + v7), *(void **)(v3 + v8), *(_QWORD *)(v3 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3 + ((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3+ ((((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

unint64_t type metadata accessor for HKSampleType()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for HKSampleType;
  if (!lazy cache variable for type metadata for HKSampleType)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKSampleType);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t type metadata accessor for NSPredicate()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for NSPredicate;
  if (!lazy cache variable for type metadata for NSPredicate)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSPredicate);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type HKSampleType and conformance NSObject()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type HKSampleType and conformance NSObject;
  if (!lazy protocol witness table cache variable for type HKSampleType and conformance NSObject)
  {
    v0 = type metadata accessor for HKSampleType();
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE5BD8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type HKSampleType and conformance NSObject);
    return v1;
  }
  return v3;
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void **a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_24758B3D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)();
}

uint64_t sub_24758B414()
{
  return swift_deallocObject();
}

uint64_t sub_24758B43C()
{
  return swift_deallocObject();
}

uint64_t sub_24758B464()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758B4A0()
{
  swift_release();
  return swift_deallocObject();
}

char *keypath_get_selector_systolicMinimum()
{
  return sel_systolicMinimum;
}

void sub_24758B4E8(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B4FC(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(a1, a2);
}

char *keypath_get_selector_systolicMaximum()
{
  return sel_systolicMaximum;
}

void sub_24758B51C(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B530(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(a1, a2);
}

char *keypath_get_selector_systolic()
{
  return sel_systolic;
}

void sub_24758B550(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B564(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(a1, a2);
}

char *keypath_get_selector_diastolicMinimum()
{
  return sel_diastolicMinimum;
}

void sub_24758B584(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B598(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(a1, a2);
}

char *keypath_get_selector_diastolicMaximum()
{
  return sel_diastolicMaximum;
}

void sub_24758B5B8(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B5CC(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(a1, a2);
}

char *keypath_get_selector_diastolic()
{
  return sel_diastolic;
}

void sub_24758B5EC(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(a1, a2);
}

void sub_24758B600(double *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(a1, a2);
}

void *HealthKitCategoryProvider.init(store:identifier:categoryEnum:failure:mapIntent:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X3>, void *a4@<X4>, void *a5@<X5>, void *a6@<X6>, void *a7@<X7>, _QWORD *a8@<X8>, void *a9)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *result;
  id v18;
  id __b[8];

  memset(__b, 0, 0x30uLL);
  __b[7] = a7;
  __b[6] = a9;
  v9 = a1;
  v10 = a1;
  __b[1] = a1;
  type metadata accessor for HKCategoryType();
  v11 = a2;
  v18 = (id)MEMORY[0x24957D308](a2);
  v12 = v18;
  __b[0] = v18;
  swift_retain();
  swift_retain();
  __b[2] = a3;
  __b[3] = a4;
  swift_retain();
  swift_retain();
  __b[4] = a5;
  __b[5] = a6;
  v13 = v18;
  v14 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  outlined destroy of HealthKitCategoryProvider<A, B>(__b);
  result = a1;
  *a8 = v18;
  a8[1] = a1;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  return result;
}

unint64_t type metadata accessor for HKCategoryType()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for HKCategoryType;
  if (!lazy cache variable for type metadata for HKCategoryType)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCategoryType);
    return ObjCClassMetadata;
  }
  return v2;
}

id *outlined destroy of HealthKitCategoryProvider<A, B>(id *a1)
{

  swift_release();
  swift_release();
  return a1;
}

uint64_t HealthKitCategoryProvider.isQueryAuthorized()()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  void *v6;

  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  v6 = *(void **)(v0 + 8);
  v1[4] = v6;
  v2 = v6;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 40) = v3;
  *v3 = *(_QWORD *)(v5 + 16);
  v3[1] = CycleTrackingFetcher.isReadingAuthorized();
  return isSiriAuthorizedToAccessHealthData(store:)((uint64_t)v6);
}

uint64_t HealthKitCategoryProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void **v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v20;
  uint64_t v21;

  v5[8] = v4;
  v5[7] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v20 = a4[3];
  v5[9] = v20;
  v5[10] = type metadata accessor for Date();
  v5[11] = swift_getTupleTypeMetadata2();
  v5[12] = type metadata accessor for Optional();
  v5[13] = swift_task_alloc();
  v6 = a4[2];
  v5[14] = v6;
  v5[15] = *(_QWORD *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_getTupleTypeMetadata2();
  v5[18] = type metadata accessor for Optional();
  v5[19] = swift_task_alloc();
  v21 = swift_task_alloc();
  v5[20] = v21;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = v4;
  v7 = *(void **)(v4 + 8);
  v5[21] = v7;
  v8 = v7;
  v9 = *v14;
  v17 = (uint64_t)*v14;
  v5[22] = *v14;
  v10 = v9;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v16 + 184) = v11;
  v12 = a4[4];
  *v11 = *(_QWORD *)(v16 + 16);
  v11[1] = HealthKitCategoryProvider.query(start:end:);
  return HKHealthStore.query<A>(categoryType:start:end:enumerationType:)(v21, v17, a2, a3, v20, v20, v12);
}

uint64_t HealthKitCategoryProvider.query(start:end:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v5 = v2 + 16;
  *(_QWORD *)(v2 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 152);

  }
  return swift_task_switch();
}

{
  _QWORD *v0;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(void);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;

  v21 = (char *)v0[20];
  v25 = (char *)v0[19];
  v23 = v0[18];
  v24 = v0[17];
  v22 = v0[9];
  v1 = v0[8];
  v0[2] = v0;
  v20 = *(void (**)(void))(v1 + 32);
  swift_retain();
  outlined init with copy of (value: B, startDate: Date)?(v21, v25, v22, v24, v23);
  if ((*(unsigned int (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v25, 1) == 1)
  {
    v4 = v19[13];
    v3 = v19[11];
    outlined destroy of (value: B, startDate: Date)?(v19[19], v19[9], v19[17]);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v4, 1);
  }
  else
  {
    v18 = v19[13];
    v17 = v19[11];
    v15 = v19[10];
    v14 = v19[19] + *(int *)(v19[17] + 48);
    v16 = v18 + *(int *)(v17 + 48);
    (*(void (**)(void))(*(_QWORD *)(v19[9] - 8) + 32))();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v16, v14);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v18, 0, 1);
  }
  v11 = v19[20];
  v13 = v19[17];
  v10 = v19[16];
  v8 = v19[15];
  v9 = v19[14];
  v5 = v19[13];
  v6 = v19[11];
  v12 = v19[9];
  v7 = v19[7];
  v20();
  outlined destroy of (value: B, startDate: Date)?(v5, v12, v6);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
  outlined destroy of (value: B, startDate: Date)?(v11, v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v19[2] + 8))();
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  id v8;

  v8 = (id)v0[24];
  v1 = (void *)v0[22];
  v5 = (id)v0[21];
  v6 = v0[8];
  v0[2] = v0;

  v2 = v8;
  v0[6] = v8;
  v7 = *(void (**)(uint64_t))(v6 + 16);
  v3 = swift_retain();
  v7(v3);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[2] + 8))();
}

char *outlined init with copy of (value: B, startDate: Date)?(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char *v7;
  char *v8;
  uint64_t v14;

  v14 = *(_QWORD *)(a4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(a5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *))(*(_QWORD *)(a3 - 8) + 16))(a2, a1);
    v8 = &a2[*(int *)(a4 + 48)];
    v7 = &a1[*(int *)(a4 + 48)];
    v5 = type metadata accessor for Date();
    (*(void (**)(char *, char *))(*(_QWORD *)(v5 - 8) + 16))(v8, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, a4);
  }
  return a2;
}

uint64_t outlined destroy of (value: B, startDate: Date)?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 48))(a1, 1))
  {
    (*(void (**)(uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1);
    v5 = a1 + *(int *)(a3 + 48);
    v3 = type metadata accessor for Date();
    (*(void (**)(uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v5);
  }
  return a1;
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCategoryProvider<A, B>()
{
  const void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 64) = v1;
  memcpy((void *)(v1 + 16), v0, 0x30uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 72) = v2;
  *v2 = *(_QWORD *)(v4 + 64);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitDistanceProvider<A>;
  return HealthKitCategoryProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance HealthKitCategoryProvider<A, B>()
{
  const void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 64) = v1;
  memcpy((void *)(v1 + 16), v0, 0x30uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 72) = v2;
  *v2 = *(_QWORD *)(v4 + 64);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitDistanceProvider<A>;
  return HealthKitCategoryProvider.isQueryAuthorized()();
}

uint64_t type metadata instantiation function for HealthKitCategoryProvider()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for HealthKitCategoryProvider(id *a1)
{

  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for HealthKitCategoryProvider(_QWORD *a1, uint64_t a2)
{
  id v2;
  id v3;
  _QWORD *result;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;

  v5 = *(id *)a2;
  v2 = *(id *)a2;
  *a1 = v5;
  v6 = *(void **)(a2 + 8);
  v3 = v6;
  a1[1] = v6;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  swift_retain();
  a1[2] = v7;
  a1[3] = v8;
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  a1[4] = v11;
  a1[5] = v12;
  return result;
}

uint64_t assignWithCopy for HealthKitCategoryProvider(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v7 = *(id *)a2;
  v2 = *(id *)a2;
  v3 = *(void **)a1;
  *(_QWORD *)a1 = v7;

  v8 = *(void **)(a2 + 8);
  v4 = v8;
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v8;

  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  swift_retain();
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10;
  swift_release();
  v12 = *(_QWORD *)(a2 + 32);
  v13 = *(_QWORD *)(a2 + 40);
  swift_retain();
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v13;
  swift_release();
  return a1;
}

uint64_t assignWithTake for HealthKitCategoryProvider(uint64_t a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v4 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  v5 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for HealthKitCategoryProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HealthKitCategoryProvider);
}

SiriWellnessIntents::WellnessVerb_optional __swiftcall WellnessVerb.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v6;
  SiriWellnessIntents::WellnessVerb_optional v7;

  v1 = _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)v2 = "askQuestion";
  *(_QWORD *)(v2 + 8) = 11;
  *(_BYTE *)(v2 + 16) = 2;
  *(_QWORD *)(v2 + 24) = "delete";
  *(_QWORD *)(v2 + 32) = 6;
  *(_BYTE *)(v2 + 40) = 2;
  *(_QWORD *)(v2 + 48) = "save";
  *(_QWORD *)(v2 + 56) = 4;
  *(_BYTE *)(v2 + 64) = 2;
  _finalizeUninitializedArray<A>(_:)();
  v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessVerb_askQuestion;
LABEL_8:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessVerb_delete;
      goto LABEL_8;
    case 2:
      v7.value = SiriWellnessIntents_WellnessVerb_save;
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessVerb_optional)3;
}

uint64_t static WellnessVerb.allCases.getter()
{
  uint64_t result;
  _BYTE *v1;

  result = _allocateUninitializedArray<A>(_:)();
  *v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  _finalizeUninitializedArray<A>(_:)();
  return result;
}

uint64_t WellnessVerb.rawValue.getter(char a1)
{
  if (!a1)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("askQuestion", 0xBuLL, 1)._countAndFlagsBits;
  if (a1 == 1)
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1)._countAndFlagsBits;
  else
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("save", 4uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessVerb()
{
  lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessVerb()
{
  return lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
}

unint64_t lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb;
  if (!lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessVerb, &type metadata for WellnessVerb);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb;
  if (!lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessVerb, &type metadata for WellnessVerb);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessVerb()
{
  lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessVerb()
{
  lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessVerb()
{
  lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessVerb_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessVerb@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessVerb_optional *a2@<X8>)
{
  SiriWellnessIntents::WellnessVerb_optional result;

  result.value = WellnessVerb.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessVerb@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v3;

  result = WellnessVerb.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in WellnessVerb()
{
  return lazy protocol witness table accessor for type [WellnessVerb] and conformance [A]();
}

unint64_t lazy protocol witness table accessor for type [WellnessVerb] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WellnessVerb]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance WellnessVerb@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static WellnessVerb.allCases.getter();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for WellnessVerb()
{
  return &type metadata for WellnessVerb;
}

id DeleteHealthSampleIntentHandler.__allocating_init(storage:)(_QWORD *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return DeleteHealthSampleIntentHandler.init(storage:)(a1);
}

id DeleteHealthSampleIntentHandler.init(storage:)(_QWORD *a1)
{
  void *v1;
  id v2;
  SiriWellnessIntents::CycleTrackingFetcher v3;
  id v4;
  id v6;
  char *v7;
  objc_class *ObjectType;
  objc_super v10;
  _QWORD v11[5];
  _QWORD __dst[6];
  id v13;

  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  v2 = v1;
  v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.isa = CycleTrackingFetcher.init()().store.super.isa;
    __dst[3] = &type metadata for HealthSampleDeleter;
    __dst[4] = &protocol witness table for HealthSampleDeleter;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents31DeleteHealthSampleIntentHandler_storage]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v4 = v6;
  v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

uint64_t DeleteHealthSampleIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[19] = v1;
  v2[18] = a1;
  v2[10] = v2;
  v2[11] = 0;
  v2[12] = 0;
  v3 = type metadata accessor for Logger();
  v2[20] = v3;
  v2[21] = *(_QWORD *)(v3 - 8);
  v2[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v2[23] = swift_task_alloc();
  v4 = type metadata accessor for UUID();
  v2[24] = v4;
  v2[25] = *(_QWORD *)(v4 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[11] = a1;
  v2[12] = v1;
  return swift_task_switch();
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 80) = *v1;
  *(_QWORD *)(v3 + 232) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t DeleteHealthSampleIntentHandler.handle(intent:)()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint32_t v17;
  os_log_type_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(_QWORD, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v1 = *(void **)(v0 + 144);
  *(_QWORD *)(v0 + 80) = v0;
  v30 = objc_msgSend(v1, sel_sampleIdentifier);
  if (v30)
  {
    v25 = *(_QWORD *)(v29 + 208);
    v26 = *(_QWORD *)(v29 + 200);
    v27 = *(_QWORD *)(v29 + 192);
    v28 = *(_QWORD *)(v29 + 184);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v28, v25, v27);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v27);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v29 + 200) + 56))(*(_QWORD *)(v29 + 184), 1, 1, *(_QWORD *)(v29 + 192));
  }
  if ((*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v29 + 200) + 48))(*(_QWORD *)(v29 + 184), 1, *(_QWORD *)(v29 + 192)) == 1)
  {
    v4 = *(_QWORD *)(v29 + 176);
    v14 = *(_QWORD *)(v29 + 168);
    v16 = *(_QWORD *)(v29 + 160);
    outlined destroy of UUID?(*(_QWORD *)(v29 + 184));
    v15 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v4, v15, v16);
    swift_endAccess();
    v19 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    *(_QWORD *)(v29 + 104) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v17 = *(_DWORD *)(v29 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v20 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v19, v18))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v11 = createStorage<A>(capacity:type:)(0);
      v12 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v29 + 112) = buf;
      *(_QWORD *)(v29 + 120) = v11;
      *(_QWORD *)(v29 + 128) = v12;
      serialize(_:at:)(0, (_BYTE **)(v29 + 112));
      serialize(_:at:)(0, (_BYTE **)(v29 + 112));
      *(_QWORD *)(v29 + 136) = v20;
      v13 = (_QWORD *)swift_task_alloc();
      v13[2] = v29 + 112;
      v13[3] = v29 + 120;
      v13[4] = v29 + 128;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v19, v18, "Missing sampleIdentifier. Aborting delete.", buf, v17);
      destroyStorage<A>(_:count:)(v11, 0, v9);
      destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v6 = *(_QWORD *)(v29 + 176);
    v5 = *(_QWORD *)(v29 + 168);
    v7 = *(_QWORD *)(v29 + 160);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    type metadata accessor for DeleteHealthSampleIntentResponse();
    v8 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v29 + 80) + 8))(v8);
  }
  else
  {
    v21 = *(_QWORD *)(v29 + 152);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v29 + 200) + 32))(*(_QWORD *)(v29 + 216), *(_QWORD *)(v29 + 184), *(_QWORD *)(v29 + 192));
    outlined init with copy of QuantityPersisting(v21 + OBJC_IVAR____TtC19SiriWellnessIntents31DeleteHealthSampleIntentHandler_storage, v29 + 16);
    v22 = *(_QWORD *)(v29 + 40);
    v23 = *(_QWORD *)(v29 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v29 + 16), v22);
    v24 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8) + **(int **)(v23 + 8));
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v29 + 224) = v2;
    *v2 = *(_QWORD *)(v29 + 80);
    v2[1] = DeleteHealthSampleIntentHandler.handle(intent:);
    return v24(*(_QWORD *)(v29 + 216), v22, v23);
  }
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v0[27];
  v2 = v0[25];
  v4 = v0[24];
  v0[10] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  v5 = v0[29];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[10] + 8))(v5);
}

uint64_t @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 48) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return DeleteHealthSampleIntentHandler.handle(intent:)((uint64_t)a1);
}

id DeleteHealthSampleIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t DeleteHealthSampleIntentHandler.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriWellnessIntents.DeleteHealthSampleIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.DeleteHealthSampleIntentHandler", 51, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/DeleteHealthSampleIntentHandler.swift", 57, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id DeleteHealthSampleIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t HealthSampleDeleter.delete(sampleIdentifier:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[46] = a2;
  v2[45] = a1;
  v2[27] = v2;
  v2[28] = 0;
  v2[29] = 0;
  v2[33] = 0;
  v2[36] = 0;
  v3 = type metadata accessor for UUID();
  v2[47] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[48] = v4;
  v2[49] = *(_QWORD *)(v4 + 64);
  v2[50] = swift_task_alloc();
  v5 = type metadata accessor for Logger();
  v2[51] = v5;
  v2[52] = *(_QWORD *)(v5 - 8);
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[28] = a1;
  v2[29] = a2;
  return swift_task_switch();
}

uint64_t HealthSampleDeleter.delete(sampleIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class isa;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  os_log_type_t v25;
  NSObject *oslog;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;

  v1 = *(_QWORD *)(v0 + 448);
  v34 = *(_QWORD *)(v0 + 416);
  v36 = *(_QWORD *)(v0 + 408);
  v42 = *(_QWORD *)(v0 + 400);
  v40 = *(_QWORD *)(v0 + 384);
  v43 = *(_QWORD *)(v0 + 376);
  v38 = *(_QWORD *)(v0 + 360);
  *(_QWORD *)(v0 + 216) = v0;
  v35 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  *(_QWORD *)(v0 + 456) = v37;
  v37(v1, v35, v36);
  swift_endAccess();
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v39(v42, v38, v43);
  v41 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  v44 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v40 + 32))(v44 + v41, v42, v43);
  swift_retain();
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = partial apply for implicit closure #1 in MedsUndoer.convertMatchedMedNamesToDoseEvents(matchingMeds:);
  *(_QWORD *)(v46 + 24) = v44;
  swift_release();
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 240) = 12;
  *(_QWORD *)(v0 + 464) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 472) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 480) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v45 = *(_DWORD *)(v0 + 528);
  v48 = swift_allocObject();
  *(_BYTE *)(v48 + 16) = 32;
  v49 = swift_allocObject();
  *(_BYTE *)(v49 + 16) = 8;
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(_QWORD *)(v47 + 24) = v46;
  v50 = swift_allocObject();
  *(_QWORD *)(v50 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v50 + 24) = v47;
  *(_QWORD *)(v0 + 488) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v51 = v2;
  swift_retain();
  *v51 = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[1] = v48;
  swift_retain();
  v51[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[3] = v49;
  swift_retain();
  v51[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[5] = v50;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v52, v53))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v31 = createStorage<A>(capacity:type:)(0);
    v32 = createStorage<A>(capacity:type:)(1);
    v54 = buf;
    v55 = v31;
    v56 = v32;
    serialize(_:at:)(2, &v54);
    serialize(_:at:)(1, &v54);
    v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v58 = v48;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v58 = v49;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v58 = v50;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    _os_log_impl(&dword_24749F000, v52, v53, "Starting to delete health sample with UUID: %s", buf, v45);
    destroyStorage<A>(_:count:)(v31, 0, v29);
    destroyStorage<A>(_:count:)(v32, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v20 = *(_QWORD *)(v33 + 448);
  v3 = *(_QWORD *)(v33 + 440);
  v19 = *(_QWORD *)(v33 + 416);
  v23 = *(_QWORD *)(v33 + 408);

  v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v33 + 496) = v21;
  v21(v20, v23);
  v22 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v37(v3, v22, v23);
  swift_endAccess();
  oslog = Logger.logObject.getter();
  v25 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v33 + 248) = 2;
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v33 + 532);
  v27 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v25))
  {
    v15 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v16 = createStorage<A>(capacity:type:)(0);
    v17 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v33 + 328) = v15;
    *(_QWORD *)(v33 + 336) = v16;
    *(_QWORD *)(v33 + 344) = v17;
    serialize(_:at:)(0, (_BYTE **)(v33 + 328));
    serialize(_:at:)(0, (_BYTE **)(v33 + 328));
    *(_QWORD *)(v33 + 352) = v27;
    v18 = (_QWORD *)swift_task_alloc();
    v18[2] = v33 + 328;
    v18[3] = v33 + 336;
    v18[4] = v33 + 344;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, oslog, v25, "Asking store to delete", v15, size);
    destroyStorage<A>(_:count:)(v16, 0, v14);
    destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v15, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v33 + 504) = 0;
  v7 = *(_QWORD *)(v33 + 440);
  v8 = *(_QWORD *)(v33 + 408);
  v10 = *(_QWORD *)(v33 + 376);
  v13 = *(id *)(v33 + 368);
  v9 = *(_QWORD *)(v33 + 360);

  v21(v7, v8);
  v4 = v13;
  _allocateUninitializedArray<A>(_:)();
  v39(v5, v9, v10);
  _finalizeUninitializedArray<A>(_:)();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v33 + 512) = isa;
  swift_bridgeObjectRelease();
  type metadata accessor for HKDeleteObjectOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type HKDeleteObjectOptions and conformance HKDeleteObjectOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  v12 = *(_QWORD *)(v33 + 256);
  *(_QWORD *)(v33 + 16) = *(_QWORD *)(v33 + 216);
  *(_QWORD *)(v33 + 56) = v28;
  *(_QWORD *)(v33 + 24) = HealthSampleDeleter.delete(sampleIdentifier:);
  *(_QWORD *)(v33 + 112) = swift_continuation_init();
  *(_QWORD *)(v33 + 80) = MEMORY[0x24BDAC760];
  *(_DWORD *)(v33 + 88) = 0x40000000;
  *(_DWORD *)(v33 + 92) = 0;
  *(_QWORD *)(v33 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
  *(_QWORD *)(v33 + 104) = &block_descriptor_11;
  objc_msgSend(v13, sel_deleteObjectsWithUUIDs_options_completion_, isa, v12, v33 + 80);
  return __swift_continuation_await_point(v33 + 16);
}

{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[27] = *v0;
  v1[65] = v1[6];
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  char *v8;
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint32_t v19;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;

  v15 = *(id *)(v0 + 512);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  v1 = *(_QWORD *)(v0 + 432);
  v17 = *(_QWORD *)(v0 + 408);
  v2 = *(void **)(v0 + 368);
  *(_QWORD *)(v0 + 216) = v0;

  v16 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v18(v1, v16, v17);
  swift_endAccess();
  v21 = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 280) = 2;
  UnsignedInteger<>.init<A>(_:)();
  v19 = *(_DWORD *)(v0 + 540);
  v22 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v21, v20))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v14 + 504);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v11 = createStorage<A>(capacity:type:)(0);
  v12 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v14 + 296) = buf;
  *(_QWORD *)(v14 + 304) = v11;
  *(_QWORD *)(v14 + 312) = v12;
  serialize(_:at:)(0, (_BYTE **)(v14 + 296));
  serialize(_:at:)(0, (_BYTE **)(v14 + 296));
  *(_QWORD *)(v14 + 320) = v22;
  v13 = (_QWORD *)swift_task_alloc();
  v13[2] = v14 + 296;
  v13[3] = v14 + 304;
  v13[4] = v14 + 312;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v21, v20, "Successfully deleted sample. Returning success response.", buf, v19);
    destroyStorage<A>(_:count:)(v11, 0, v9);
    destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
LABEL_6:
    v7 = *(void (**)(uint64_t, uint64_t))(v14 + 496);
    v5 = *(_QWORD *)(v14 + 432);
    v6 = *(_QWORD *)(v14 + 408);

    v7(v5, v6);
    type metadata accessor for DeleteHealthSampleIntentResponse();
    v8 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(4, 0);
    *(_QWORD *)(v14 + 288) = v8;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v14 + 216) + 8))(v8);
  }
  return result;
}

{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  char *v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  id v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  v21 = *(id *)(v0 + 520);
  v17 = *(id *)(v0 + 512);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  v15 = *(_QWORD *)(v0 + 424);
  v19 = *(_QWORD *)(v0 + 408);
  v16 = *(id *)(v0 + 368);
  *(_QWORD *)(v0 + 216) = v0;
  swift_willThrow();

  v1 = v21;
  *(_QWORD *)(v0 + 264) = v21;
  v18 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v20(v15, v18, v19);
  swift_endAccess();
  v2 = v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v21;
  v29 = Logger.logObject.getter();
  v30 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 272) = 12;
  UnsignedInteger<>.init<A>(_:)();
  v22 = *(_DWORD *)(v0 + 536);
  v25 = swift_allocObject();
  *(_BYTE *)(v25 + 16) = 32;
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(_QWORD *)(v24 + 24) = v23;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v27 + 24) = v24;
  _allocateUninitializedArray<A>(_:)();
  v28 = v3;
  swift_retain();
  *v28 = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[1] = v25;
  swift_retain();
  v28[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[3] = v26;
  swift_retain();
  v28[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[5] = v27;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v29, v30))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = createStorage<A>(capacity:type:)(0);
    v13 = createStorage<A>(capacity:type:)(1);
    v31 = buf;
    v32 = v12;
    v33 = v13;
    serialize(_:at:)(2, &v31);
    serialize(_:at:)(1, &v31);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    _os_log_impl(&dword_24749F000, v29, v30, "Failed to delete sample. Error: %s", buf, v22);
    destroyStorage<A>(_:count:)(v12, 0, v10);
    destroyStorage<A>(_:count:)(v13, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = (id)v14[65];
  v7 = (void (*)(uint64_t, uint64_t))v14[62];
  v5 = v14[53];
  v6 = v14[51];

  v7(v5, v6);
  type metadata accessor for DeleteHealthSampleIntentResponse();
  v9 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(char *))(v14[27] + 8))(v9);
}

uint64_t protocol witness for HealthSampleDeleting.delete(sampleIdentifier:) in conformance HealthSampleDeleter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return HealthSampleDeleter.delete(sampleIdentifier:)(a1, v5);
}

uint64_t sub_24758EF70()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)
                                                               + async function pointer to @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)))(v6, v4, v5);
}

uint64_t sub_24758F068()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for UUID() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_24758F0D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758F114()
{
  return swift_deallocObject();
}

uint64_t sub_24758F13C()
{
  return swift_deallocObject();
}

uint64_t sub_24758F164()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758F1A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758F1DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24758F218()
{
  return swift_deallocObject();
}

uint64_t sub_24758F240()
{
  return swift_deallocObject();
}

uint64_t sub_24758F268()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24758F2A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for DeleteHealthSampleIntentHandler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for HealthSampleDeleter()
{
  return &type metadata for HealthSampleDeleter;
}

id MedStorageHelper.__allocating_init(storage:)(_QWORD *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return MedStorageHelper.init(storage:)(a1);
}

id MedStorageHelper.init(storage:)(_QWORD *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v7;
  char *v8;
  objc_class *ObjectType;
  objc_super v11;
  _QWORD v12[5];
  _QWORD __dst[6];
  id v14;

  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  v2 = v1;
  v14 = v1;
  outlined init with copy of QuantityPersisting?(a1, v12);
  if (v12[3])
  {
    outlined init with take of QuantityPersisting(v12, __dst);
  }
  else
  {
    v3 = MedsUndoer.init()();
    __dst[3] = &type metadata for SpecificMedicationsPersistor;
    __dst[4] = &protocol witness table for SpecificMedicationsPersistor;
    __dst[0] = v3;
    __dst[1] = v4;
    outlined destroy of QuantityPersisting?((uint64_t)v12);
  }
  outlined init with take of QuantityPersisting(__dst, &v8[OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage]);

  v11.receiver = v14;
  v11.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v11, sel_init);
  v5 = v7;
  v14 = v7;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v7;
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[28] = v1;
  v2[27] = a1;
  v2[19] = v2;
  v2[20] = 0;
  v2[21] = 0;
  v3 = type metadata accessor for Logger();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[20] = a1;
  v2[21] = v1;
  return swift_task_switch();
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = v0[28];
  v0[19] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  v7 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + **(int **)(v5 + 8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 256) = v2;
  *v2 = *(_QWORD *)(v4 + 152);
  v2[1] = MedStorageHelper.sampleScheduleIDFor(dateInterval:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t v19;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v24 = *(_BYTE *)(v0 + 292);
  *(_QWORD *)(v0 + 152) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v24 & 1) != 0)
  {
    outlined init with copy of QuantityPersisting(*(_QWORD *)(v23 + 224) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v23 + 56);
    v5 = *(_QWORD *)(v23 + 80);
    v6 = *(_QWORD *)(v23 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v23 + 56), v5);
    v7 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 + 48) + **(int **)(v6 + 48));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v23 + 264) = v4;
    *v4 = *(_QWORD *)(v23 + 152);
    v4[1] = MedStorageHelper.sampleScheduleIDFor(dateInterval:);
    return v7(*(_QWORD *)(v23 + 216), v5, v6);
  }
  else
  {
    v1 = *(_QWORD *)(v23 + 248);
    v16 = *(_QWORD *)(v23 + 240);
    v18 = *(_QWORD *)(v23 + 232);
    v17 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v17, v18);
    swift_endAccess();
    v21 = Logger.logObject.getter();
    v20 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v23 + 176) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v19 = *(_DWORD *)(v23 + 288);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v22 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v21, v20))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v13 = createStorage<A>(capacity:type:)(0);
      v14 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v23 + 184) = buf;
      *(_QWORD *)(v23 + 192) = v13;
      *(_QWORD *)(v23 + 200) = v14;
      serialize(_:at:)(0, (_BYTE **)(v23 + 184));
      serialize(_:at:)(0, (_BYTE **)(v23 + 184));
      *(_QWORD *)(v23 + 208) = v22;
      v15 = (_QWORD *)swift_task_alloc();
      v15[2] = v23 + 184;
      v15[3] = v23 + 192;
      v15[4] = v23 + 200;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v21, v20, "MedStorageHelper is not authorized to read meds data, returning empty string", buf, v19);
      destroyStorage<A>(_:count:)(v13, 0, v11);
      destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v23 + 248);
    v8 = *(_QWORD *)(v23 + 240);
    v10 = *(_QWORD *)(v23 + 232);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)(v23 + 152) + 8))(v2._countAndFlagsBits, v2._object);
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[35];
  v2 = v0[34];
  v0[19] = v0;
  v0[17] = v2;
  v0[18] = v1;
  if (v0[18])
  {
    v3 = v7[18];
    v7[15] = v7[17];
    v7[16] = v3;
  }
  else
  {
    *(Swift::String *)(v7 + 15) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    outlined destroy of String.UTF8View();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 7));
  v5 = v7[15];
  v6 = v7[16];
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7[19] + 8))(v5, v6);
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 152) = *v1;
  *(_BYTE *)(v3 + 292) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v4 = (_QWORD *)*v2;
  v4[19] = *v2;
  v4[34] = a1;
  v4[35] = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t MedStorageHelper.displayNameFor(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[30] = v2;
  v3[29] = a2;
  v3[28] = a1;
  v3[21] = v3;
  v3[15] = 0;
  v3[16] = 0;
  v3[22] = 0;
  v4 = type metadata accessor for Logger();
  v3[31] = v4;
  v3[32] = *(_QWORD *)(v4 - 8);
  v3[33] = swift_task_alloc();
  v3[15] = a1;
  v3[16] = a2;
  v3[22] = v2;
  return swift_task_switch();
}

{
  _QWORD *v2;
  _QWORD *v4;

  v4 = (_QWORD *)*v2;
  v4[21] = *v2;
  v4[36] = a1;
  v4[37] = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t MedStorageHelper.displayNameFor(identifier:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = v0[30];
  v0[21] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  v7 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + **(int **)(v5 + 8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 272) = v2;
  *v2 = *(_QWORD *)(v4 + 168);
  v2[1] = MedStorageHelper.displayNameFor(identifier:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t v19;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v24 = *(_BYTE *)(v0 + 308);
  *(_QWORD *)(v0 + 168) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v24 & 1) != 0)
  {
    outlined init with copy of QuantityPersisting(*(_QWORD *)(v23 + 240) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v23 + 56);
    v5 = *(_QWORD *)(v23 + 80);
    v6 = *(_QWORD *)(v23 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v23 + 56), v5);
    v7 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 + 40) + **(int **)(v6 + 40));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v23 + 280) = v4;
    *v4 = *(_QWORD *)(v23 + 168);
    v4[1] = MedStorageHelper.displayNameFor(identifier:);
    return v7(*(_QWORD *)(v23 + 224), *(_QWORD *)(v23 + 232), v5, v6);
  }
  else
  {
    v1 = *(_QWORD *)(v23 + 264);
    v16 = *(_QWORD *)(v23 + 256);
    v18 = *(_QWORD *)(v23 + 248);
    v17 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v17, v18);
    swift_endAccess();
    v21 = Logger.logObject.getter();
    v20 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v23 + 184) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v19 = *(_DWORD *)(v23 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v22 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v21, v20))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v13 = createStorage<A>(capacity:type:)(0);
      v14 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v23 + 192) = buf;
      *(_QWORD *)(v23 + 200) = v13;
      *(_QWORD *)(v23 + 208) = v14;
      serialize(_:at:)(0, (_BYTE **)(v23 + 192));
      serialize(_:at:)(0, (_BYTE **)(v23 + 192));
      *(_QWORD *)(v23 + 216) = v22;
      v15 = (_QWORD *)swift_task_alloc();
      v15[2] = v23 + 192;
      v15[3] = v23 + 200;
      v15[4] = v23 + 208;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v21, v20, "SpecificMedStorageHelper is not authorized to read meds data, returning empty string", buf, v19);
      destroyStorage<A>(_:count:)(v13, 0, v11);
      destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v23 + 264);
    v8 = *(_QWORD *)(v23 + 256);
    v10 = *(_QWORD *)(v23 + 248);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)(v23 + 168) + 8))(v2._countAndFlagsBits, v2._object);
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[37];
  v2 = v0[36];
  v0[21] = v0;
  v0[19] = v2;
  v0[20] = v1;
  if (v0[20])
  {
    v3 = v7[20];
    v7[17] = v7[19];
    v7[18] = v3;
  }
  else
  {
    *(Swift::String *)(v7 + 17) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    outlined destroy of String.UTF8View();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 7));
  v5 = v7[17];
  v6 = v7[18];
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7[21] + 8))(v5, v6);
}

uint64_t MedStorageHelper.displayNameFor(identifier:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 168) = *v1;
  *(_BYTE *)(v3 + 308) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 192) = v2;
  *(_BYTE *)(v3 + 249) = a2 & 1;
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 120) = v3;
  *(_QWORD *)(v3 + 128) = 0;
  *(_BYTE *)(v3 + 248) = 0;
  *(_QWORD *)(v3 + 136) = 0;
  v4 = type metadata accessor for Logger();
  *(_QWORD *)(v3 + 200) = v4;
  *(_QWORD *)(v3 + 208) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  *(_QWORD *)(v3 + 128) = a1;
  *(_BYTE *)(v3 + 248) = a2 & 1;
  *(_QWORD *)(v3 + 136) = v2;
  return swift_task_switch();
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = v0[24];
  v0[15] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  v7 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + **(int **)(v5 + 8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 224) = v2;
  *v2 = *(_QWORD *)(v4 + 120);
  v2[1] = MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint32_t v18;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v23 = *(_BYTE *)(v0 + 250);
  *(_QWORD *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v23 & 1) != 0)
  {
    outlined init with copy of QuantityPersisting(*(_QWORD *)(v22 + 192) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v22 + 56);
    v4 = *(_QWORD *)(v22 + 80);
    v5 = *(_QWORD *)(v22 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v22 + 56), v4);
    v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 + 56) + **(int **)(v5 + 56));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v22 + 232) = v3;
    *v3 = *(_QWORD *)(v22 + 120);
    v3[1] = MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
    return v6(*(_QWORD *)(v22 + 184), *(_BYTE *)(v22 + 249) & 1, v4, v5);
  }
  else
  {
    v1 = *(_QWORD *)(v22 + 216);
    v15 = *(_QWORD *)(v22 + 208);
    v17 = *(_QWORD *)(v22 + 200);
    v16 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v1, v16, v17);
    swift_endAccess();
    v20 = Logger.logObject.getter();
    v19 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v22 + 144) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v18 = *(_DWORD *)(v22 + 252);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v21 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v20, v19))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v12 = createStorage<A>(capacity:type:)(0);
      v13 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v22 + 152) = buf;
      *(_QWORD *)(v22 + 160) = v12;
      *(_QWORD *)(v22 + 168) = v13;
      serialize(_:at:)(0, (_BYTE **)(v22 + 152));
      serialize(_:at:)(0, (_BYTE **)(v22 + 152));
      *(_QWORD *)(v22 + 176) = v21;
      v14 = (_QWORD *)swift_task_alloc();
      v14[2] = v22 + 152;
      v14[3] = v22 + 160;
      v14[4] = v22 + 168;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v20, v19, "MedStorageHelper is not authorized to read meds data, returning empty string", buf, v18);
      destroyStorage<A>(_:count:)(v12, 0, v10);
      destroyStorage<A>(_:count:)(v13, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v22 + 216);
    v7 = *(_QWORD *)(v22 + 208);
    v9 = *(_QWORD *)(v22 + 200);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v22 + 120) + 8))(0);
  }
}

{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 240);
  *(_QWORD *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 120) + 8))(v2);
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 120) = *v1;
  *(_BYTE *)(v3 + 250) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 120) = *v1;
  *(_QWORD *)(v3 + 240) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

id MedStorageHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MedStorageHelper.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriWellnessIntents.MedStorageHelper")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.MedStorageHelper", 36, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/MedStorageHelper.swift", 42, 2, v1, 0x10uLL, 0x14uLL);
  __break(1u);
  return result;
}

id MedStorageHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for MedStorageHelping.displayNameFor(identifier:) in conformance MedStorageHelper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = protocol witness for SpecificMedicationsPersisting.displayNameFor(identifier:) in conformance SpecificMedicationsPersistor;
  return MedStorageHelper.displayNameFor(identifier:)(a1, a2);
}

uint64_t protocol witness for MedStorageHelping.sampleScheduleIDFor(dateInterval:) in conformance MedStorageHelper(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = protocol witness for SpecificMedicationsPersisting.displayNameFor(identifier:) in conformance SpecificMedicationsPersistor;
  return MedStorageHelper.sampleScheduleIDFor(dateInterval:)(a1);
}

uint64_t protocol witness for MedStorageHelping.buildMatchedMedName(from:shouldIncludeAsNeededParams:) in conformance MedStorageHelper(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(a1, a2 & 1);
}

uint64_t type metadata accessor for MedStorageHelper()
{
  return objc_opt_self();
}

char *GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return GetBloodPressureIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetBloodPressureIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetBloodPressureIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id GetBloodPressureIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetBloodPressureIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetBloodPressureIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetBloodPressureIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetBloodPressureIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetBloodPressureIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetBloodPressureIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetBloodPressureIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = GetBloodPressureIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetBloodPressureIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  GetBloodPressureIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetBloodPressureIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___GetBloodPressureIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetBloodPressureIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___GetBloodPressureIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetBloodPressureIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = GetBloodPressureIntentResponse.code.getter();

}

void key path setter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  GetBloodPressureIntentResponse.code.setter(v4);

}

char *GetBloodPressureIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___GetBloodPressureIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetBloodPressureIntent()
{
  return objc_opt_self();
}

id GetBloodPressureIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetBloodPressureIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetBloodPressureIntentResponse()
{
  return objc_opt_self();
}

id GetBloodPressureIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetBloodPressureIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetBloodPressureIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id GetBloodPressureIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetBloodPressureIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetBloodPressureIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetBloodPressureIntentResponseCode, &type metadata for GetBloodPressureIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetBloodPressureIntentResponseCode, &type metadata for GetBloodPressureIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_24759275C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(a1, a2);
}

void sub_247592770(uint64_t *a1, id *a2)
{
  key path setter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for GetBloodPressureIntentResponseCode()
{
  return &type metadata for GetBloodPressureIntentResponseCode;
}

Swift::Bool __swiftcall isMedDosageUnitSynonym(userSuppliedUnit:systemSuppliedUnit:)(Swift::String userSuppliedUnit, Swift::String systemSuppliedUnit)
{
  Swift::String *v2;
  Swift::String *v3;
  Swift::String *v4;
  Swift::String *v5;
  Swift::String *v6;
  Swift::String *v7;
  Swift::String *v8;
  Swift::String *v10;
  char v11;
  char v12;
  Swift::String *v13;
  char v14;
  char v15;
  Swift::String *v16;
  char v17;
  char v18;
  Swift::String *v19;
  char v20;
  char v21;
  Swift::String *v22;
  char v23;
  char v24;
  Swift::String *v25;
  char v26;
  char v27;
  Swift::String *v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;

  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("application", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  v56 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bar", 3uLL, 1);
  swift_bridgeObjectRetain();
  v55 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridge", 9uLL, 1);
  swift_bridgeObjectRetain();
  v54 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v54 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("device", 6uLL, 1);
  swift_bridgeObjectRetain();
  v53 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("disc", 4uLL, 1);
  swift_bridgeObjectRetain();
  v52 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
  swift_bridgeObjectRetain();
  v51 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v51 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enema", 5uLL, 1);
  swift_bridgeObjectRetain();
  v50 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v50 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globule", 7uLL, 1);
  swift_bridgeObjectRetain();
  v49 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v49 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implant", 7uLL, 1);
  swift_bridgeObjectRetain();
  v48 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v48 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("insert", 6uLL, 1);
  swift_bridgeObjectRetain();
  v47 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kit", 3uLL, 1);
  swift_bridgeObjectRetain();
  v46 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packet", 6uLL, 1);
  swift_bridgeObjectRetain();
  v45 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patch", 5uLL, 1);
  swift_bridgeObjectRetain();
  v44 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v44 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("piece", 5uLL, 1);
  swift_bridgeObjectRetain();
  v43 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v43 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicle", 8uLL, 1);
  swift_bridgeObjectRetain();
  v42 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoop", 5uLL, 1);
  swift_bridgeObjectRetain();
  v41 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v41 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponge", 6uLL, 1);
  swift_bridgeObjectRetain();
  v40 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v40 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("spray", 5uLL, 1);
  swift_bridgeObjectRetain();
  v39 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v39 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stick", 5uLL, 1);
  swift_bridgeObjectRetain();
  v38 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strip", 5uLL, 1);
  swift_bridgeObjectRetain();
  v37 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppository", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  v36 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v36 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampon", 6uLL, 1);
  swift_bridgeObjectRetain();
  v35 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatment", 9uLL, 1);
  swift_bridgeObjectRetain();
  v34 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
    goto LABEL_38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unit", 4uLL, 1);
  swift_bridgeObjectRetain();
  v33 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0
    || (swift_bridgeObjectRelease(),
        swift_bridgeObjectRetain(),
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wick", 4uLL, 1),
        swift_bridgeObjectRetain(),
        v32 = static String.== infix(_:_:)(),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v32 & 1) != 0))
  {
LABEL_38:
    swift_bridgeObjectRelease();
    v31 = static String.== infix(_:_:)();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
    swift_bridgeObjectRetain();
    v30 = static String.== infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      _allocateUninitializedArray<A>(_:)();
      v28 = v2;
      *v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
      v28[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhaler", 7uLL, 1);
      v28[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("puff", 4uLL, 1);
      v28[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nebulizer", 9uLL, 1);
      v28[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("neb", 3uLL, 1);
      _finalizeUninitializedArray<A>(_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      v29 = Sequence<>.contains(_:)();
      outlined destroy of [HKQuantityType]();
      v31 = v29;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
      swift_bridgeObjectRetain();
      v27 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v27 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        _allocateUninitializedArray<A>(_:)();
        v25 = v3;
        *v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
        v25[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("shot", 4uLL, 1);
        _finalizeUninitializedArray<A>(_:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
        lazy protocol witness table accessor for type [String] and conformance [A]();
        v26 = Sequence<>.contains(_:)();
        outlined destroy of [HKQuantityType]();
        v31 = v26;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
        swift_bridgeObjectRetain();
        v24 = static String.== infix(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          _allocateUninitializedArray<A>(_:)();
          v22 = v4;
          *v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
          v22[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
          v22[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("troche", 6uLL, 1);
          v22[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pastille", 8uLL, 1);
          _finalizeUninitializedArray<A>(_:)();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
          lazy protocol witness table accessor for type [String] and conformance [A]();
          v23 = Sequence<>.contains(_:)();
          outlined destroy of [HKQuantityType]();
          v31 = v23;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mL", 2uLL, 1);
          swift_bridgeObjectRetain();
          v21 = static String.== infix(_:_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v21 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            _allocateUninitializedArray<A>(_:)();
            v19 = v5;
            *v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mL", 2uLL, 1);
            v19[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliter", 0xAuLL, 1);
            v19[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliLiter", 0xAuLL, 1);
            _finalizeUninitializedArray<A>(_:)();
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
            lazy protocol witness table accessor for type [String] and conformance [A]();
            v20 = Sequence<>.contains(_:)();
            outlined destroy of [HKQuantityType]();
            v31 = v20;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mg", 2uLL, 1);
            swift_bridgeObjectRetain();
            v18 = static String.== infix(_:_:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v18 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              _allocateUninitializedArray<A>(_:)();
              v16 = v6;
              *v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mg", 2uLL, 1);
              v16[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligram", 9uLL, 1);
              _finalizeUninitializedArray<A>(_:)();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
              lazy protocol witness table accessor for type [String] and conformance [A]();
              v17 = Sequence<>.contains(_:)();
              outlined destroy of [HKQuantityType]();
              v31 = v17;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
              swift_bridgeObjectRetain();
              v15 = static String.== infix(_:_:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v15 & 1) != 0)
              {
                swift_bridgeObjectRelease();
                _allocateUninitializedArray<A>(_:)();
                v13 = v7;
                *v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
                v13[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tab", 3uLL, 1);
                v13[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pill", 4uLL, 1);
                v13[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cap", 3uLL, 1);
                v13[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsule", 7uLL, 1);
                _finalizeUninitializedArray<A>(_:)();
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                lazy protocol witness table accessor for type [String] and conformance [A]();
                v14 = Sequence<>.contains(_:)();
                outlined destroy of [HKQuantityType]();
                v31 = v14;
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vial", 4uLL, 1);
                swift_bridgeObjectRetain();
                v12 = static String.== infix(_:_:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v12 & 1) != 0)
                {
                  _allocateUninitializedArray<A>(_:)();
                  v10 = v8;
                  *v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nebulizer", 9uLL, 1);
                  v10[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("neb", 3uLL, 1);
                  v10[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
                  _finalizeUninitializedArray<A>(_:)();
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                  lazy protocol witness table accessor for type [String] and conformance [A]();
                  v11 = Sequence<>.contains(_:)();
                  outlined destroy of [HKQuantityType]();
                  v31 = v11;
                }
                else
                {
                  v31 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return v31 & 1;
}

id LogBloodPressureIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogBloodPressureIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for LogBloodPressureIntent()
{
  return objc_opt_self();
}

id LogBloodPressureIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogBloodPressureIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id LogBloodPressureIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id LogBloodPressureIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id LogBloodPressureIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id LogBloodPressureIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LogBloodPressureIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
    case 104:
      return 104;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LogBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LogBloodPressureIntentResponseCode()
{
  lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogBloodPressureIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = LogBloodPressureIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogBloodPressureIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  LogBloodPressureIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t LogBloodPressureIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___LogBloodPressureIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t LogBloodPressureIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___LogBloodPressureIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*LogBloodPressureIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = LogBloodPressureIntentResponse.code.getter();

}

void key path setter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  LogBloodPressureIntentResponse.code.setter(v4);

}

char *LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return LogBloodPressureIntentResponse.init(code:userActivity:)(a1, a2);
}

char *LogBloodPressureIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___LogBloodPressureIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

id LogBloodPressureIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogBloodPressureIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for LogBloodPressureIntentResponse()
{
  return objc_opt_self();
}

id LogBloodPressureIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogBloodPressureIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id LogBloodPressureIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id LogBloodPressureIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id LogBloodPressureIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in LogBloodPressureIntentResponseCode()
{
  return lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for LogBloodPressureIntentResponseCode, &type metadata for LogBloodPressureIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for LogBloodPressureIntentResponseCode, &type metadata for LogBloodPressureIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_247595ACC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(a1, a2);
}

void sub_247595AE0(uint64_t *a1, id *a2)
{
  key path setter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for LogBloodPressureIntentResponseCode()
{
  return &type metadata for LogBloodPressureIntentResponseCode;
}

char *GetMenstruationPredictionIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return GetMenstruationPredictionIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetMenstruationPredictionIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetMenstruationPredictionIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id GetMenstruationPredictionIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetMenstruationPredictionIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetMenstruationPredictionIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetMenstruationPredictionIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetMenstruationPredictionIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetMenstruationPredictionIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetMenstruationPredictionIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetMenstruationPredictionIntentResponseCode()
{
  lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetMenstruationPredictionIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = GetMenstruationPredictionIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetMenstruationPredictionIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  GetMenstruationPredictionIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetMenstruationPredictionIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___GetMenstruationPredictionIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetMenstruationPredictionIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___GetMenstruationPredictionIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetMenstruationPredictionIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = GetMenstruationPredictionIntentResponse.code.getter();

}

void key path setter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  GetMenstruationPredictionIntentResponse.code.setter(v4);

}

char *GetMenstruationPredictionIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetMenstruationPredictionIntent()
{
  return objc_opt_self();
}

id GetMenstruationPredictionIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetMenstruationPredictionIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetMenstruationPredictionIntentResponse()
{
  return objc_opt_self();
}

id GetMenstruationPredictionIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetMenstruationPredictionIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetMenstruationPredictionIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id GetMenstruationPredictionIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetMenstruationPredictionIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetMenstruationPredictionIntentResponseCode, &type metadata for GetMenstruationPredictionIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetMenstruationPredictionIntentResponseCode, &type metadata for GetMenstruationPredictionIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_24759735C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(a1, a2);
}

void sub_247597370(uint64_t *a1, id *a2)
{
  key path setter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for GetMenstruationPredictionIntentResponseCode()
{
  return &type metadata for GetMenstruationPredictionIntentResponseCode;
}

void *static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *BloodPressureIntentResponse;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v13[8];

  v2 = a1;
  v10 = (void *)*MEMORY[0x24BDD2B08];
  v3 = (id)*MEMORY[0x24BDD2B08];
  v8 = (void *)*MEMORY[0x24BDD33A8];
  v4 = (id)*MEMORY[0x24BDD33A8];
  v9 = (void *)*MEMORY[0x24BDD33A0];
  v5 = (id)*MEMORY[0x24BDD33A0];
  BloodPressureIntentResponse = (void *)type metadata accessor for GetBloodPressureIntentResponse();
  HealthKitCorrelationProvider.init(store:identifier:firstQuantityIdentifier:secondQuantityIdentifier:failure:mapIntent:)(a1, v10, v8, v9, implicit closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:), 0, closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:), 0, v13, BloodPressureIntentResponse);
  return memcpy(a2, v13, 0x40uLL);
}

id HealthKitCorrelationProvider.init(store:identifier:firstQuantityIdentifier:secondQuantityIdentifier:failure:mapIntent:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, void *a6@<X5>, void *a7@<X6>, void *a8@<X7>, _QWORD *a9@<X8>, void *a10)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id result;
  id v27;
  id v28;
  id v34;
  id __b[9];

  memset(__b, 0, 0x40uLL);
  __b[8] = a10;
  v10 = a1;
  v11 = a1;
  __b[0] = a1;
  type metadata accessor for HKCorrelationType();
  v12 = a2;
  v27 = (id)MEMORY[0x24957D320](a2);
  v13 = v27;
  __b[1] = v27;
  type metadata accessor for HKQuantityType();
  v14 = a3;
  v28 = (id)MEMORY[0x24957D314](a3);
  v15 = v28;
  __b[2] = v28;
  v16 = a4;
  v34 = (id)MEMORY[0x24957D314](a4);
  v17 = v34;
  __b[3] = v34;
  swift_retain();
  swift_retain();
  __b[4] = a5;
  __b[5] = a6;
  swift_retain();
  swift_retain();
  __b[6] = a7;
  __b[7] = a8;
  v18 = a1;
  v19 = v27;
  v20 = v28;
  v21 = v34;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  outlined destroy of HealthKitCorrelationProvider<A>(__b);
  result = v34;
  *a9 = a1;
  a9[1] = v27;
  a9[2] = v28;
  a9[3] = v34;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t HealthKitCorrelationProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v21;

  v5[8] = v4;
  v5[7] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v6 = *(_QWORD *)(a4 + 16);
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
  v21 = swift_task_alloc();
  v5[12] = v21;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = v4;
  v7 = *v4;
  v5[13] = v7;
  v8 = v7;
  v16 = (void *)v14[1];
  v5[14] = v16;
  v9 = v16;
  v17 = (void *)v14[2];
  v5[15] = v17;
  v10 = v17;
  v18 = (void *)v14[3];
  v5[16] = v18;
  v11 = v18;
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v15 + 136) = v12;
  *v12 = *(_QWORD *)(v15 + 16);
  v12[1] = HealthKitCorrelationProvider.query(start:end:);
  return HKHealthStore.query(correlationType:firstQuantityType:secondQuantityType:start:end:)(v21, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a2, a3);
}

uint64_t HealthKitCorrelationProvider.query(start:end:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v7 = v2 + 16;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v7 + 104);
    v5 = *(void **)(v7 + 96);
    v6 = *(void **)(v7 + 88);

  }
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = v0[12];
  v7 = v0[11];
  v5 = v0[10];
  v6 = v0[9];
  v1 = v0[8];
  v4 = v0[7];
  v0[2] = v0;
  v3 = *(void (**)(uint64_t))(v1 + 48);
  swift_retain();
  v3(v8);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
  outlined destroy of Statistics<(first: Double, second: Double)>?(v8);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[2] + 8))();
}

{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  id v10;

  v10 = (id)v0[18];
  v1 = (void *)v0[16];
  v5 = (id)v0[15];
  v6 = (id)v0[14];
  v7 = (id)v0[13];
  v8 = v0[8];
  v0[2] = v0;

  v2 = v10;
  v0[6] = v10;
  v9 = *(void (**)(uint64_t))(v8 + 32);
  v3 = swift_retain();
  v9(v3);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[2] + 8))();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>()
{
  const void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 80) = v1;
  memcpy((void *)(v1 + 16), v0, 0x40uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 88) = v2;
  *v2 = *(_QWORD *)(v4 + 80);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>;
  return HealthKitDistanceProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>(unsigned int a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 80) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v3 + 80) + 8))(a1);
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance HealthKitCorrelationProvider<A>()
{
  const void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 80) = v1;
  memcpy((void *)(v1 + 16), v0, 0x40uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 88) = v2;
  *v2 = *(_QWORD *)(v4 + 80);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>;
  return HealthKitDistanceProvider.isQueryAuthorized()();
}

char *implicit closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(char **a1@<X8>)
{
  char *result;

  type metadata accessor for GetBloodPressureIntentResponse();
  result = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
  *a1 = result;
  return result;
}

char *closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t v2;
  char *v3;
  char *v4;
  char *result;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  NSDate v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  Class isa;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  Class v23;
  char *v24;
  void *v25;
  char **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  int *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;

  v26 = a2;
  v37 = a1;
  v45 = 0;
  v44 = 0;
  v43 = 0;
  v27 = 0;
  v28 = type metadata accessor for Date();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = (*(_QWORD *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v31 = (char *)&v14 - v30;
  v32 = type metadata accessor for DateInterval();
  v33 = *(_QWORD **)(v32 - 8);
  v34 = (v33[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v14 - v34;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
  v36 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v14 - v36;
  v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  v40 = *((_QWORD *)v41 - 1);
  v38 = (*(_QWORD *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)&v14 - v38;
  v45 = (char *)&v14 - v38;
  v44 = v3;
  outlined init with copy of Statistics<(first: Double, second: Double)>?(v3, v4);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v40 + 48))(v42, 1, v41) == 1)
  {
    outlined destroy of Statistics<(first: Double, second: Double)>?((uint64_t)v42);
    v25 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    result = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, v25);
    *v26 = result;
  }
  else
  {
    outlined init with take of Statistics<(first: Double, second: Double)>(v42, v39);
    v15 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    v6 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(4, v15);
    v7 = v35;
    v24 = v6;
    v43 = v6;
    v8 = &v39[v41[9]];
    v16 = *(_QWORD *)v8;
    v17 = *((_QWORD *)v8 + 1);
    swift_bridgeObjectRetain();
    v18 = (id)MEMORY[0x24957CFB4](v16, v17);
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_setUnit_, v18);

    objc_msgSend(v24, sel_setSystolic_, *(double *)&v39[v41[11]]);
    objc_msgSend(v24, sel_setSystolicMinimum_, *(double *)&v39[v41[10]]);
    objc_msgSend(v24, sel_setSystolicMaximum_, *(double *)&v39[v41[10] + 16]);
    objc_msgSend(v24, sel_setDiastolic_, *(double *)&v39[v41[11] + 8]);
    objc_msgSend(v24, sel_setDiastolicMinimum_, *(double *)&v39[v41[10] + 8]);
    objc_msgSend(v24, sel_setDiastolicMaximum_, *(double *)&v39[v41[10] + 24]);
    v9 = &v39[v41[7]];
    v20 = (void (*)(char *, char *, uint64_t))v33[2];
    v20(v7, v9, v32);
    DateInterval.start.getter();
    v10.super.isa = Date._bridgeToObjectiveC()().super.isa;
    v11 = v35;
    isa = v10.super.isa;
    v21 = (void (*)(char *, uint64_t))v33[1];
    v21(v35, v32);
    v22 = *(void (**)(char *, uint64_t))(v29 + 8);
    v22(v31, v28);
    objc_msgSend(v24, sel_setSampleStartDate_, isa);

    v20(v11, &v39[v41[7]], v32);
    DateInterval.end.getter();
    v23 = Date._bridgeToObjectiveC()().super.isa;
    v21(v35, v32);
    v22(v31, v28);
    objc_msgSend(v24, sel_setSampleEndDate_, v23);

    v12 = v24;
    v13 = v24;
    *v26 = v24;

    return (char *)outlined destroy of Statistics<(first: Double, second: Double)>((uint64_t)v39);
  }
  return result;
}

id *outlined destroy of HealthKitCorrelationProvider<A>(id *a1)
{

  swift_release();
  swift_release();
  return a1;
}

uint64_t outlined destroy of Statistics<(first: Double, second: Double)>?(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(a1, 1))
  {
    v2 = type metadata accessor for DateInterval();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(v3 + 48))(a1, 1))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1 + *(int *)(v5 + 28), v2);
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  *(_QWORD *)(v4 + 80) = v4;
  memcpy((void *)(v4 + 16), v3, 0x40uLL);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 96) = v5;
  *v5 = *(_QWORD *)(v7 + 80);
  v5[1] = protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>;
  return HealthKitCorrelationProvider.query(start:end:)(v7 + 88, a1, a2, a3);
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 80) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 80) + 8))(*(_QWORD *)(v2 + 88));
}

uint64_t type metadata instantiation function for HealthKitCorrelationProvider()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for HealthKitCorrelationProvider(id *a1)
{

  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for HealthKitCorrelationProvider(_QWORD *a1, uint64_t a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  _QWORD *result;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;

  v7 = *(id *)a2;
  v2 = *(id *)a2;
  *a1 = v7;
  v8 = *(void **)(a2 + 8);
  v3 = v8;
  a1[1] = v8;
  v9 = *(void **)(a2 + 16);
  v4 = v9;
  a1[2] = v9;
  v10 = *(void **)(a2 + 24);
  v5 = v10;
  a1[3] = v10;
  v11 = *(_QWORD *)(a2 + 32);
  v12 = *(_QWORD *)(a2 + 40);
  swift_retain();
  a1[4] = v11;
  a1[5] = v12;
  v15 = *(_QWORD *)(a2 + 48);
  v16 = *(_QWORD *)(a2 + 56);
  swift_retain();
  result = a1;
  a1[6] = v15;
  a1[7] = v16;
  return result;
}

uint64_t assignWithCopy for HealthKitCorrelationProvider(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v11 = *(id *)a2;
  v2 = *(id *)a2;
  v3 = *(void **)a1;
  *(_QWORD *)a1 = v11;

  v12 = *(void **)(a2 + 8);
  v4 = v12;
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v12;

  v13 = *(void **)(a2 + 16);
  v6 = v13;
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v13;

  v14 = *(void **)(a2 + 24);
  v8 = v14;
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v14;

  v15 = *(_QWORD *)(a2 + 32);
  v16 = *(_QWORD *)(a2 + 40);
  swift_retain();
  *(_QWORD *)(a1 + 32) = v15;
  *(_QWORD *)(a1 + 40) = v16;
  swift_release();
  v18 = *(_QWORD *)(a2 + 48);
  v19 = *(_QWORD *)(a2 + 56);
  swift_retain();
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v19;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy64_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x40uLL);
}

uint64_t assignWithTake for HealthKitCorrelationProvider(uint64_t a1, _QWORD *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2[3];

  v6 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v6;
  swift_release();
  v7 = a2[7];
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_QWORD *)(a1 + 56) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthKitCorrelationProvider(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    {
      v4 = *(_QWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (*(_QWORD *)a1 < 0x100000000uLL)
        v3 = *(_QWORD *)a1;
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthKitCorrelationProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 64) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 64) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)result = a2 - 1;
  }
  return result;
}

uint64_t type metadata accessor for HealthKitCorrelationProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for HealthKitCorrelationProvider);
}

char *outlined init with copy of Statistics<(first: Double, second: Double)>?(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v14;
  uint64_t v15;

  v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  v15 = *((_QWORD *)v14 - 1);
  if ((*(unsigned int (**)(char *, uint64_t))(v15 + 48))(a1, 1))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v10 = type metadata accessor for DateInterval();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(a1, 1))
    {
      v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(a2, a1, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a2, 0, 1, v10);
    }
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&a2[v14[7]], &a1[v14[7]], v10);
    *(_QWORD *)&a2[v14[8]] = *(_QWORD *)&a1[v14[8]];
    v3 = v14[9];
    v8 = &a2[v3];
    *(_QWORD *)&a2[v3] = *(_QWORD *)&a1[v3];
    v9 = *(_QWORD *)&a1[v3 + 8];
    swift_bridgeObjectRetain();
    *((_QWORD *)v8 + 1) = v9;
    v4 = &a2[v14[10]];
    v5 = v14[10];
    *(_OWORD *)v4 = *(_OWORD *)&a1[v5];
    *((_OWORD *)v4 + 1) = *(_OWORD *)&a1[v5 + 16];
    *(_OWORD *)&a2[v14[11]] = *(_OWORD *)&a1[v14[11]];
    *(_OWORD *)&a2[v14[12]] = *(_OWORD *)&a1[v14[12]];
    *(_OWORD *)&a2[v14[13]] = *(_OWORD *)&a1[v14[13]];
    (*(void (**)(void))(v15 + 56))();
  }
  return a2;
}

__n128 outlined init with take of Statistics<(first: Double, second: Double)>(char *a1, char *a2)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __n128 result;
  int *v6;
  uint64_t v9;
  uint64_t v10;

  v9 = type metadata accessor for DateInterval();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a2, a1, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
  v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&a2[v6[7]], &a1[v6[7]], v9);
  *(_QWORD *)&a2[v6[8]] = *(_QWORD *)&a1[v6[8]];
  *(_OWORD *)&a2[v6[9]] = *(_OWORD *)&a1[v6[9]];
  v3 = &a2[v6[10]];
  v4 = v6[10];
  *(_OWORD *)v3 = *(_OWORD *)&a1[v4];
  *((_OWORD *)v3 + 1) = *(_OWORD *)&a1[v4 + 16];
  *(_OWORD *)&a2[v6[11]] = *(_OWORD *)&a1[v6[11]];
  *(_OWORD *)&a2[v6[12]] = *(_OWORD *)&a1[v6[12]];
  result = *(__n128 *)&a1[v6[13]];
  *(__n128 *)&a2[v6[13]] = result;
  return result;
}

void PeriodFlow.toMenstrualFlow()(unint64_t a1)
{
  if (a1 <= 5)
    __asm { BR              X8 }
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  JUMPOUT(0x247598FC0);
}

uint64_t PeriodFlow.init(flow:)(unint64_t a1)
{
  if (a1 <= 5)
    __asm { BR              X8 }
  return 0;
}

char *LogGenericMedicationsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return LogGenericMedicationsIntentResponse.init(code:userActivity:)(a1, a2);
}

id LogGenericMedicationsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogGenericMedicationsIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id LogGenericMedicationsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogGenericMedicationsIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id LogGenericMedicationsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id LogGenericMedicationsIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id LogGenericMedicationsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id LogGenericMedicationsIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LogGenericMedicationsIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
    case 104:
      return 104;
    case 105:
      return 105;
    case 106:
      return 106;
    case 107:
      return 107;
    case 108:
      return 108;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogGenericMedicationsIntentResponseCode()
{
  lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LogGenericMedicationsIntentResponseCode()
{
  lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogGenericMedicationsIntentResponseCode()
{
  lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LogGenericMedicationsIntentResponseCode()
{
  lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogGenericMedicationsIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = LogGenericMedicationsIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogGenericMedicationsIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  LogGenericMedicationsIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t LogGenericMedicationsIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___LogGenericMedicationsIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t LogGenericMedicationsIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___LogGenericMedicationsIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*LogGenericMedicationsIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = LogGenericMedicationsIntentResponse.code.getter();

}

void key path setter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  LogGenericMedicationsIntentResponse.code.setter(v4);

}

char *LogGenericMedicationsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___LogGenericMedicationsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for LogGenericMedicationsIntent()
{
  return objc_opt_self();
}

id LogGenericMedicationsIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogGenericMedicationsIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for LogGenericMedicationsIntentResponse()
{
  return objc_opt_self();
}

id LogGenericMedicationsIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogGenericMedicationsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id LogGenericMedicationsIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id LogGenericMedicationsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in LogGenericMedicationsIntentResponseCode()
{
  return lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for LogGenericMedicationsIntentResponseCode, &type metadata for LogGenericMedicationsIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for LogGenericMedicationsIntentResponseCode, &type metadata for LogGenericMedicationsIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_24759A938(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(a1, a2);
}

void sub_24759A94C(uint64_t *a1, id *a2)
{
  key path setter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for LogGenericMedicationsIntentResponseCode()
{
  return &type metadata for LogGenericMedicationsIntentResponseCode;
}

SiriWellnessIntents::WellnessNoun_optional __swiftcall WellnessNoun.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v6;
  SiriWellnessIntents::WellnessNoun_optional v7;

  v1 = _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)v2 = "abdominal_cramps";
  *(_QWORD *)(v2 + 8) = 16;
  *(_BYTE *)(v2 + 16) = 2;
  *(_QWORD *)(v2 + 24) = "acne";
  *(_QWORD *)(v2 + 32) = 4;
  *(_BYTE *)(v2 + 40) = 2;
  *(_QWORD *)(v2 + 48) = "appetite_changes";
  *(_QWORD *)(v2 + 56) = 16;
  *(_BYTE *)(v2 + 64) = 2;
  *(_QWORD *)(v2 + 72) = "audiogram";
  *(_QWORD *)(v2 + 80) = 9;
  *(_BYTE *)(v2 + 88) = 2;
  *(_QWORD *)(v2 + 96) = "basal_body_temperature";
  *(_QWORD *)(v2 + 104) = 22;
  *(_BYTE *)(v2 + 112) = 2;
  *(_QWORD *)(v2 + 120) = "bicycling";
  *(_QWORD *)(v2 + 128) = 9;
  *(_BYTE *)(v2 + 136) = 2;
  *(_QWORD *)(v2 + 144) = "biotin";
  *(_QWORD *)(v2 + 152) = 6;
  *(_BYTE *)(v2 + 160) = 2;
  *(_QWORD *)(v2 + 168) = "bladder_incontinence";
  *(_QWORD *)(v2 + 176) = 20;
  *(_BYTE *)(v2 + 184) = 2;
  *(_QWORD *)(v2 + 192) = "bloating";
  *(_QWORD *)(v2 + 200) = 8;
  *(_BYTE *)(v2 + 208) = 2;
  *(_QWORD *)(v2 + 216) = "blood_alcohol_content";
  *(_QWORD *)(v2 + 224) = 21;
  *(_BYTE *)(v2 + 232) = 2;
  *(_QWORD *)(v2 + 240) = "blood_glucose";
  *(_QWORD *)(v2 + 248) = 13;
  *(_BYTE *)(v2 + 256) = 2;
  *(_QWORD *)(v2 + 264) = "blood_pressure";
  *(_QWORD *)(v2 + 272) = 14;
  *(_BYTE *)(v2 + 280) = 2;
  *(_QWORD *)(v2 + 288) = "blood_pressure_diastolic";
  *(_QWORD *)(v2 + 296) = 24;
  *(_BYTE *)(v2 + 304) = 2;
  *(_QWORD *)(v2 + 312) = "blood_pressure_systolic";
  *(_QWORD *)(v2 + 320) = 23;
  *(_BYTE *)(v2 + 328) = 2;
  *(_QWORD *)(v2 + 336) = "body_fat_percentage";
  *(_QWORD *)(v2 + 344) = 19;
  *(_BYTE *)(v2 + 352) = 2;
  *(_QWORD *)(v2 + 360) = "body_mass_index";
  *(_QWORD *)(v2 + 368) = 15;
  *(_BYTE *)(v2 + 376) = 2;
  *(_QWORD *)(v2 + 384) = "body_temperature";
  *(_QWORD *)(v2 + 392) = 16;
  *(_BYTE *)(v2 + 400) = 2;
  *(_QWORD *)(v2 + 408) = "caffeine";
  *(_QWORD *)(v2 + 416) = 8;
  *(_BYTE *)(v2 + 424) = 2;
  *(_QWORD *)(v2 + 432) = "calcium";
  *(_QWORD *)(v2 + 440) = 7;
  *(_BYTE *)(v2 + 448) = 2;
  *(_QWORD *)(v2 + 456) = "carbohydrates";
  *(_QWORD *)(v2 + 464) = 13;
  *(_BYTE *)(v2 + 472) = 2;
  *(_QWORD *)(v2 + 480) = "cervical_mucus_quality";
  *(_QWORD *)(v2 + 488) = 22;
  *(_BYTE *)(v2 + 496) = 2;
  *(_QWORD *)(v2 + 504) = "chills";
  *(_QWORD *)(v2 + 512) = 6;
  *(_BYTE *)(v2 + 520) = 2;
  *(_QWORD *)(v2 + 528) = "chloride";
  *(_QWORD *)(v2 + 536) = 8;
  *(_BYTE *)(v2 + 544) = 2;
  *(_QWORD *)(v2 + 552) = "chromium";
  *(_QWORD *)(v2 + 560) = 8;
  *(_BYTE *)(v2 + 568) = 2;
  *(_QWORD *)(v2 + 576) = "constipation";
  *(_QWORD *)(v2 + 584) = 12;
  *(_BYTE *)(v2 + 592) = 2;
  *(_QWORD *)(v2 + 600) = "copper";
  *(_QWORD *)(v2 + 608) = 6;
  *(_BYTE *)(v2 + 616) = 2;
  *(_QWORD *)(v2 + 624) = "diarrhea";
  *(_QWORD *)(v2 + 632) = 8;
  *(_BYTE *)(v2 + 640) = 2;
  *(_QWORD *)(v2 + 648) = "diastolic_blood_pressure";
  *(_QWORD *)(v2 + 656) = 24;
  *(_BYTE *)(v2 + 664) = 2;
  *(_QWORD *)(v2 + 672) = "dietary_cholesterol";
  *(_QWORD *)(v2 + 680) = 19;
  *(_BYTE *)(v2 + 688) = 2;
  *(_QWORD *)(v2 + 696) = "dietary_sugar";
  *(_QWORD *)(v2 + 704) = 13;
  *(_BYTE *)(v2 + 712) = 2;
  *(_QWORD *)(v2 + 720) = "double_support";
  *(_QWORD *)(v2 + 728) = 14;
  *(_BYTE *)(v2 + 736) = 2;
  *(_QWORD *)(v2 + 744) = "dry_skin";
  *(_QWORD *)(v2 + 752) = 8;
  *(_BYTE *)(v2 + 760) = 2;
  *(_QWORD *)(v2 + 768) = "electrocardiogram";
  *(_QWORD *)(v2 + 776) = 17;
  *(_BYTE *)(v2 + 784) = 2;
  *(_QWORD *)(v2 + 792) = "electrodermal_activity";
  *(_QWORD *)(v2 + 800) = 22;
  *(_BYTE *)(v2 + 808) = 2;
  *(_QWORD *)(v2 + 816) = "environment_noise";
  *(_QWORD *)(v2 + 824) = 17;
  *(_BYTE *)(v2 + 832) = 2;
  *(_QWORD *)(v2 + 840) = "energy_consumed";
  *(_QWORD *)(v2 + 848) = 15;
  *(_BYTE *)(v2 + 856) = 2;
  *(_QWORD *)(v2 + 864) = "exercise";
  *(_QWORD *)(v2 + 872) = 8;
  *(_BYTE *)(v2 + 880) = 2;
  *(_QWORD *)(v2 + 888) = "exercise_ring";
  *(_QWORD *)(v2 + 896) = 13;
  *(_BYTE *)(v2 + 904) = 2;
  *(_QWORD *)(v2 + 912) = "fatigue";
  *(_QWORD *)(v2 + 920) = 7;
  *(_BYTE *)(v2 + 928) = 2;
  *(_QWORD *)(v2 + 936) = "fat_monounsaturated";
  *(_QWORD *)(v2 + 944) = 19;
  *(_BYTE *)(v2 + 952) = 2;
  *(_QWORD *)(v2 + 960) = "fat_polyunsaturated";
  *(_QWORD *)(v2 + 968) = 19;
  *(_BYTE *)(v2 + 976) = 2;
  *(_QWORD *)(v2 + 984) = "fat_saturated";
  *(_QWORD *)(v2 + 992) = 13;
  *(_BYTE *)(v2 + 1000) = 2;
  *(_QWORD *)(v2 + 1008) = "fat_total";
  *(_QWORD *)(v2 + 1016) = 9;
  *(_BYTE *)(v2 + 1024) = 2;
  *(_QWORD *)(v2 + 1032) = "fiber";
  *(_QWORD *)(v2 + 1040) = 5;
  *(_BYTE *)(v2 + 1048) = 2;
  *(_QWORD *)(v2 + 1056) = "flights";
  *(_QWORD *)(v2 + 1064) = 7;
  *(_BYTE *)(v2 + 1072) = 2;
  *(_QWORD *)(v2 + 1080) = "folate";
  *(_QWORD *)(v2 + 1088) = 6;
  *(_BYTE *)(v2 + 1096) = 2;
  *(_QWORD *)(v2 + 1104) = "forced_expiratory_volume";
  *(_QWORD *)(v2 + 1112) = 24;
  *(_BYTE *)(v2 + 1120) = 2;
  *(_QWORD *)(v2 + 1128) = "forced_vital_capacity";
  *(_QWORD *)(v2 + 1136) = 21;
  *(_BYTE *)(v2 + 1144) = 2;
  *(_QWORD *)(v2 + 1152) = "hair_loss";
  *(_QWORD *)(v2 + 1160) = 9;
  *(_BYTE *)(v2 + 1168) = 2;
  *(_QWORD *)(v2 + 1176) = "handwash";
  *(_QWORD *)(v2 + 1184) = 8;
  *(_BYTE *)(v2 + 1192) = 2;
  *(_QWORD *)(v2 + 1200) = "headache";
  *(_QWORD *)(v2 + 1208) = 8;
  *(_BYTE *)(v2 + 1216) = 2;
  *(_QWORD *)(v2 + 1224) = "headphone_audio";
  *(_QWORD *)(v2 + 1232) = 15;
  *(_BYTE *)(v2 + 1240) = 2;
  *(_QWORD *)(v2 + 1248) = "heart_rate";
  *(_QWORD *)(v2 + 1256) = 10;
  *(_BYTE *)(v2 + 1264) = 2;
  *(_QWORD *)(v2 + 1272) = "heart_rate_variability_sdnn";
  *(_QWORD *)(v2 + 1280) = 27;
  *(_BYTE *)(v2 + 1288) = 2;
  *(_QWORD *)(v2 + 1296) = "height";
  *(_QWORD *)(v2 + 1304) = 6;
  *(_BYTE *)(v2 + 1312) = 2;
  *(_QWORD *)(v2 + 1320) = "high_heart_rate";
  *(_QWORD *)(v2 + 1328) = 15;
  *(_BYTE *)(v2 + 1336) = 2;
  *(_QWORD *)(v2 + 1344) = "hot_flashes";
  *(_QWORD *)(v2 + 1352) = 11;
  *(_BYTE *)(v2 + 1360) = 2;
  *(_QWORD *)(v2 + 1368) = "inhaler_usage";
  *(_QWORD *)(v2 + 1376) = 13;
  *(_BYTE *)(v2 + 1384) = 2;
  *(_QWORD *)(v2 + 1392) = "insulin_delivery";
  *(_QWORD *)(v2 + 1400) = 16;
  *(_BYTE *)(v2 + 1408) = 2;
  *(_QWORD *)(v2 + 1416) = "iodine";
  *(_QWORD *)(v2 + 1424) = 6;
  *(_BYTE *)(v2 + 1432) = 2;
  *(_QWORD *)(v2 + 1440) = "irregular_heart_rate";
  *(_QWORD *)(v2 + 1448) = 20;
  *(_BYTE *)(v2 + 1456) = 2;
  *(_QWORD *)(v2 + 1464) = "iron";
  *(_QWORD *)(v2 + 1472) = 4;
  *(_BYTE *)(v2 + 1480) = 2;
  *(_QWORD *)(v2 + 1488) = "lean_body_mass";
  *(_QWORD *)(v2 + 1496) = 14;
  *(_BYTE *)(v2 + 1504) = 2;
  *(_QWORD *)(v2 + 1512) = "lower_back_pain";
  *(_QWORD *)(v2 + 1520) = 15;
  *(_BYTE *)(v2 + 1528) = 2;
  *(_QWORD *)(v2 + 1536) = "low_heart_rate";
  *(_QWORD *)(v2 + 1544) = 14;
  *(_BYTE *)(v2 + 1552) = 2;
  *(_QWORD *)(v2 + 1560) = "magnesium";
  *(_QWORD *)(v2 + 1568) = 9;
  *(_BYTE *)(v2 + 1576) = 2;
  *(_QWORD *)(v2 + 1584) = "manganese";
  *(_QWORD *)(v2 + 1592) = 9;
  *(_BYTE *)(v2 + 1600) = 2;
  *(_QWORD *)(v2 + 1608) = "memory_lapse";
  *(_QWORD *)(v2 + 1616) = 12;
  *(_BYTE *)(v2 + 1624) = 2;
  *(_QWORD *)(v2 + 1632) = "menstruation";
  *(_QWORD *)(v2 + 1640) = 12;
  *(_BYTE *)(v2 + 1648) = 2;
  *(_QWORD *)(v2 + 1656) = "mindful";
  *(_QWORD *)(v2 + 1664) = 7;
  *(_BYTE *)(v2 + 1672) = 2;
  *(_QWORD *)(v2 + 1680) = "mood_swing";
  *(_QWORD *)(v2 + 1688) = 10;
  *(_BYTE *)(v2 + 1696) = 2;
  *(_QWORD *)(v2 + 1704) = "move";
  *(_QWORD *)(v2 + 1712) = 4;
  *(_BYTE *)(v2 + 1720) = 2;
  *(_QWORD *)(v2 + 1728) = "move_ring";
  *(_QWORD *)(v2 + 1736) = 9;
  *(_BYTE *)(v2 + 1744) = 2;
  *(_QWORD *)(v2 + 1752) = "molybdenum";
  *(_QWORD *)(v2 + 1760) = 10;
  *(_BYTE *)(v2 + 1768) = 2;
  *(_QWORD *)(v2 + 1776) = "nausea";
  *(_QWORD *)(v2 + 1784) = 6;
  *(_BYTE *)(v2 + 1792) = 2;
  *(_QWORD *)(v2 + 1800) = "niacin";
  *(_QWORD *)(v2 + 1808) = 6;
  *(_BYTE *)(v2 + 1816) = 2;
  *(_QWORD *)(v2 + 1824) = "night_sweats";
  *(_QWORD *)(v2 + 1832) = 12;
  *(_BYTE *)(v2 + 1840) = 2;
  *(_QWORD *)(v2 + 1848) = "nikeFuel";
  *(_QWORD *)(v2 + 1856) = 8;
  *(_BYTE *)(v2 + 1864) = 2;
  *(_QWORD *)(v2 + 1872) = "number_of_times_fallen";
  *(_QWORD *)(v2 + 1880) = 22;
  *(_BYTE *)(v2 + 1888) = 2;
  *(_QWORD *)(v2 + 1896) = "oxygen_saturation";
  *(_QWORD *)(v2 + 1904) = 17;
  *(_BYTE *)(v2 + 1912) = 2;
  *(_QWORD *)(v2 + 1920) = "ovulation";
  *(_QWORD *)(v2 + 1928) = 9;
  *(_BYTE *)(v2 + 1936) = 2;
  *(_QWORD *)(v2 + 1944) = "pantothenic_acid";
  *(_QWORD *)(v2 + 1952) = 16;
  *(_BYTE *)(v2 + 1960) = 2;
  *(_QWORD *)(v2 + 1968) = "peak_expiratory_flow_rate";
  *(_QWORD *)(v2 + 1976) = 25;
  *(_BYTE *)(v2 + 1984) = 2;
  *(_QWORD *)(v2 + 1992) = "pelvic_pain";
  *(_QWORD *)(v2 + 2000) = 11;
  *(_BYTE *)(v2 + 2008) = 2;
  *(_QWORD *)(v2 + 2016) = "peripheral_perfusion_index";
  *(_QWORD *)(v2 + 2024) = 26;
  *(_BYTE *)(v2 + 2032) = 2;
  *(_QWORD *)(v2 + 2040) = "phosphorus";
  *(_QWORD *)(v2 + 2048) = 10;
  *(_BYTE *)(v2 + 2056) = 2;
  *(_QWORD *)(v2 + 2064) = "potassium";
  *(_QWORD *)(v2 + 2072) = 9;
  *(_BYTE *)(v2 + 2080) = 2;
  *(_QWORD *)(v2 + 2088) = "protein";
  *(_QWORD *)(v2 + 2096) = 7;
  *(_BYTE *)(v2 + 2104) = 2;
  *(_QWORD *)(v2 + 2112) = "respiratory_rate";
  *(_QWORD *)(v2 + 2120) = 16;
  *(_BYTE *)(v2 + 2128) = 2;
  *(_QWORD *)(v2 + 2136) = "resting_heart_rate";
  *(_QWORD *)(v2 + 2144) = 18;
  *(_BYTE *)(v2 + 2152) = 2;
  *(_QWORD *)(v2 + 2160) = "riboflavin";
  *(_QWORD *)(v2 + 2168) = 10;
  *(_BYTE *)(v2 + 2176) = 2;
  *(_QWORD *)(v2 + 2184) = "running";
  *(_QWORD *)(v2 + 2192) = 7;
  *(_BYTE *)(v2 + 2200) = 2;
  *(_QWORD *)(v2 + 2208) = "selenium";
  *(_QWORD *)(v2 + 2216) = 8;
  *(_BYTE *)(v2 + 2224) = 2;
  *(_QWORD *)(v2 + 2232) = "sexual_activity";
  *(_QWORD *)(v2 + 2240) = 15;
  *(_BYTE *)(v2 + 2248) = 2;
  *(_QWORD *)(v2 + 2256) = "six_minute_walk";
  *(_QWORD *)(v2 + 2264) = 15;
  *(_BYTE *)(v2 + 2272) = 2;
  *(_QWORD *)(v2 + 2280) = "sleep";
  *(_QWORD *)(v2 + 2288) = 5;
  *(_BYTE *)(v2 + 2296) = 2;
  *(_QWORD *)(v2 + 2304) = "sleep_changes";
  *(_QWORD *)(v2 + 2312) = 13;
  *(_BYTE *)(v2 + 2320) = 2;
  *(_QWORD *)(v2 + 2328) = "spotting";
  *(_QWORD *)(v2 + 2336) = 8;
  *(_BYTE *)(v2 + 2344) = 2;
  *(_QWORD *)(v2 + 2352) = "stand";
  *(_QWORD *)(v2 + 2360) = 5;
  *(_BYTE *)(v2 + 2368) = 2;
  *(_QWORD *)(v2 + 2376) = "stand_ring";
  *(_QWORD *)(v2 + 2384) = 10;
  *(_BYTE *)(v2 + 2392) = 2;
  *(_QWORD *)(v2 + 2400) = "swimming";
  *(_QWORD *)(v2 + 2408) = 8;
  *(_BYTE *)(v2 + 2416) = 2;
  *(_QWORD *)(v2 + 2424) = "sodium";
  *(_QWORD *)(v2 + 2432) = 6;
  *(_BYTE *)(v2 + 2440) = 2;
  *(_QWORD *)(v2 + 2448) = "thiamin";
  *(_QWORD *)(v2 + 2456) = 7;
  *(_BYTE *)(v2 + 2464) = 2;
  *(_QWORD *)(v2 + 2472) = "uv_index";
  *(_QWORD *)(v2 + 2480) = 8;
  *(_BYTE *)(v2 + 2488) = 2;
  *(_QWORD *)(v2 + 2496) = "vaginal_dryness";
  *(_QWORD *)(v2 + 2504) = 15;
  *(_BYTE *)(v2 + 2512) = 2;
  *(_QWORD *)(v2 + 2520) = "vitamin_a";
  *(_QWORD *)(v2 + 2528) = 9;
  *(_BYTE *)(v2 + 2536) = 2;
  *(_QWORD *)(v2 + 2544) = "vitamin_b12";
  *(_QWORD *)(v2 + 2552) = 11;
  *(_BYTE *)(v2 + 2560) = 2;
  *(_QWORD *)(v2 + 2568) = "vitamin_b6";
  *(_QWORD *)(v2 + 2576) = 10;
  *(_BYTE *)(v2 + 2584) = 2;
  *(_QWORD *)(v2 + 2592) = "vitamin_c";
  *(_QWORD *)(v2 + 2600) = 9;
  *(_BYTE *)(v2 + 2608) = 2;
  *(_QWORD *)(v2 + 2616) = "vitamin_d";
  *(_QWORD *)(v2 + 2624) = 9;
  *(_BYTE *)(v2 + 2632) = 2;
  *(_QWORD *)(v2 + 2640) = "vitamin_e";
  *(_QWORD *)(v2 + 2648) = 9;
  *(_BYTE *)(v2 + 2656) = 2;
  *(_QWORD *)(v2 + 2664) = "vitamin_k";
  *(_QWORD *)(v2 + 2672) = 9;
  *(_BYTE *)(v2 + 2680) = 2;
  *(_QWORD *)(v2 + 2688) = "vo2_max";
  *(_QWORD *)(v2 + 2696) = 7;
  *(_BYTE *)(v2 + 2704) = 2;
  *(_QWORD *)(v2 + 2712) = "waist_circumference";
  *(_QWORD *)(v2 + 2720) = 19;
  *(_BYTE *)(v2 + 2728) = 2;
  *(_QWORD *)(v2 + 2736) = "walking";
  *(_QWORD *)(v2 + 2744) = 7;
  *(_BYTE *)(v2 + 2752) = 2;
  *(_QWORD *)(v2 + 2760) = "walking_heart_rate_average";
  *(_QWORD *)(v2 + 2768) = 26;
  *(_BYTE *)(v2 + 2776) = 2;
  *(_QWORD *)(v2 + 2784) = "water";
  *(_QWORD *)(v2 + 2792) = 5;
  *(_BYTE *)(v2 + 2800) = 2;
  *(_QWORD *)(v2 + 2808) = "weight";
  *(_QWORD *)(v2 + 2816) = 6;
  *(_BYTE *)(v2 + 2824) = 2;
  *(_QWORD *)(v2 + 2832) = "workouts";
  *(_QWORD *)(v2 + 2840) = 8;
  *(_BYTE *)(v2 + 2848) = 2;
  *(_QWORD *)(v2 + 2856) = "zinc";
  *(_QWORD *)(v2 + 2864) = 4;
  *(_BYTE *)(v2 + 2872) = 2;
  *(_QWORD *)(v2 + 2880) = "unsupported";
  *(_QWORD *)(v2 + 2888) = 11;
  *(_BYTE *)(v2 + 2896) = 2;
  *(_QWORD *)(v2 + 2904) = "active_energy_burned";
  *(_QWORD *)(v2 + 2912) = 20;
  *(_BYTE *)(v2 + 2920) = 2;
  *(_QWORD *)(v2 + 2928) = "inBed";
  *(_QWORD *)(v2 + 2936) = 5;
  *(_BYTE *)(v2 + 2944) = 2;
  *(_QWORD *)(v2 + 2952) = "stepCount";
  *(_QWORD *)(v2 + 2960) = 9;
  *(_BYTE *)(v2 + 2968) = 2;
  _finalizeUninitializedArray<A>(_:)();
  v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessNoun_abdominal_cramps;
LABEL_250:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessNoun_acne;
      goto LABEL_250;
    case 2:
      v7.value = SiriWellnessIntents_WellnessNoun_appetite_changes;
      goto LABEL_250;
    case 3:
      v7.value = SiriWellnessIntents_WellnessNoun_audiogram;
      goto LABEL_250;
    case 4:
      v7.value = SiriWellnessIntents_WellnessNoun_basal_body_temperature;
      goto LABEL_250;
    case 5:
      v7.value = SiriWellnessIntents_WellnessNoun_bicycling;
      goto LABEL_250;
    case 6:
      v7.value = SiriWellnessIntents_WellnessNoun_biotin;
      goto LABEL_250;
    case 7:
      v7.value = SiriWellnessIntents_WellnessNoun_bladder_incontinence;
      goto LABEL_250;
    case 8:
      v7.value = SiriWellnessIntents_WellnessNoun_bloating;
      goto LABEL_250;
    case 9:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_alcohol_content;
      goto LABEL_250;
    case 10:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_glucose;
      goto LABEL_250;
    case 11:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure;
      goto LABEL_250;
    case 12:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure_diastolic;
      goto LABEL_250;
    case 13:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure_systolic;
      goto LABEL_250;
    case 14:
      v7.value = SiriWellnessIntents_WellnessNoun_body_fat_percentage;
      goto LABEL_250;
    case 15:
      v7.value = SiriWellnessIntents_WellnessNoun_body_mass_index;
      goto LABEL_250;
    case 16:
      v7.value = SiriWellnessIntents_WellnessNoun_body_temperature;
      goto LABEL_250;
    case 17:
      v7.value = SiriWellnessIntents_WellnessNoun_caffeine;
      goto LABEL_250;
    case 18:
      v7.value = SiriWellnessIntents_WellnessNoun_calcium;
      goto LABEL_250;
    case 19:
      v7.value = SiriWellnessIntents_WellnessNoun_carbohydrates;
      goto LABEL_250;
    case 20:
      v7.value = SiriWellnessIntents_WellnessNoun_cervical_mucus_quality;
      goto LABEL_250;
    case 21:
      v7.value = SiriWellnessIntents_WellnessNoun_chills;
      goto LABEL_250;
    case 22:
      v7.value = SiriWellnessIntents_WellnessNoun_chloride;
      goto LABEL_250;
    case 23:
      v7.value = SiriWellnessIntents_WellnessNoun_chromium;
      goto LABEL_250;
    case 24:
      v7.value = SiriWellnessIntents_WellnessNoun_constipation;
      goto LABEL_250;
    case 25:
      v7.value = SiriWellnessIntents_WellnessNoun_copper;
      goto LABEL_250;
    case 26:
      v7.value = SiriWellnessIntents_WellnessNoun_diarrhea;
      goto LABEL_250;
    case 27:
      v7.value = SiriWellnessIntents_WellnessNoun_diastolic_blood_pressure;
      goto LABEL_250;
    case 28:
      v7.value = SiriWellnessIntents_WellnessNoun_dietary_cholesterol;
      goto LABEL_250;
    case 29:
      v7.value = SiriWellnessIntents_WellnessNoun_dietary_sugar;
      goto LABEL_250;
    case 30:
      v7.value = SiriWellnessIntents_WellnessNoun_double_support;
      goto LABEL_250;
    case 31:
      v7.value = SiriWellnessIntents_WellnessNoun_dry_skin;
      goto LABEL_250;
    case 32:
      v7.value = SiriWellnessIntents_WellnessNoun_electrocardiogram;
      goto LABEL_250;
    case 33:
      v7.value = SiriWellnessIntents_WellnessNoun_electrodermal_activity;
      goto LABEL_250;
    case 34:
      v7.value = SiriWellnessIntents_WellnessNoun_environment_noise;
      goto LABEL_250;
    case 35:
      v7.value = SiriWellnessIntents_WellnessNoun_energy_consumed;
      goto LABEL_250;
    case 36:
      v7.value = SiriWellnessIntents_WellnessNoun_exercise;
      goto LABEL_250;
    case 37:
      v7.value = SiriWellnessIntents_WellnessNoun_exercise_ring;
      goto LABEL_250;
    case 38:
      v7.value = SiriWellnessIntents_WellnessNoun_fatigue;
      goto LABEL_250;
    case 39:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_monounsaturated;
      goto LABEL_250;
    case 40:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_polyunsaturated;
      goto LABEL_250;
    case 41:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_saturated;
      goto LABEL_250;
    case 42:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_total;
      goto LABEL_250;
    case 43:
      v7.value = SiriWellnessIntents_WellnessNoun_fiber;
      goto LABEL_250;
    case 44:
      v7.value = SiriWellnessIntents_WellnessNoun_flights;
      goto LABEL_250;
    case 45:
      v7.value = SiriWellnessIntents_WellnessNoun_folate;
      goto LABEL_250;
    case 46:
      v7.value = SiriWellnessIntents_WellnessNoun_forced_expiratory_volume;
      goto LABEL_250;
    case 47:
      v7.value = SiriWellnessIntents_WellnessNoun_forced_vital_capacity;
      goto LABEL_250;
    case 48:
      v7.value = SiriWellnessIntents_WellnessNoun_hair_loss;
      goto LABEL_250;
    case 49:
      v7.value = SiriWellnessIntents_WellnessNoun_handwash;
      goto LABEL_250;
    case 50:
      v7.value = SiriWellnessIntents_WellnessNoun_headache;
      goto LABEL_250;
    case 51:
      v7.value = SiriWellnessIntents_WellnessNoun_headphone_audio;
      goto LABEL_250;
    case 52:
      v7.value = SiriWellnessIntents_WellnessNoun_heart_rate;
      goto LABEL_250;
    case 53:
      v7.value = SiriWellnessIntents_WellnessNoun_heart_rate_variability_sdnn;
      goto LABEL_250;
    case 54:
      v7.value = SiriWellnessIntents_WellnessNoun_height;
      goto LABEL_250;
    case 55:
      v7.value = SiriWellnessIntents_WellnessNoun_high_heart_rate;
      goto LABEL_250;
    case 56:
      v7.value = SiriWellnessIntents_WellnessNoun_hot_flashes;
      goto LABEL_250;
    case 57:
      v7.value = SiriWellnessIntents_WellnessNoun_inhaler_usage;
      goto LABEL_250;
    case 58:
      v7.value = SiriWellnessIntents_WellnessNoun_insulin_delivery;
      goto LABEL_250;
    case 59:
      v7.value = SiriWellnessIntents_WellnessNoun_iodine;
      goto LABEL_250;
    case 60:
      v7.value = SiriWellnessIntents_WellnessNoun_irregular_heart_rate;
      goto LABEL_250;
    case 61:
      v7.value = SiriWellnessIntents_WellnessNoun_iron;
      goto LABEL_250;
    case 62:
      v7.value = SiriWellnessIntents_WellnessNoun_lean_body_mass;
      goto LABEL_250;
    case 63:
      v7.value = SiriWellnessIntents_WellnessNoun_lower_back_pain;
      goto LABEL_250;
    case 64:
      v7.value = SiriWellnessIntents_WellnessNoun_low_heart_rate;
      goto LABEL_250;
    case 65:
      v7.value = SiriWellnessIntents_WellnessNoun_magnesium;
      goto LABEL_250;
    case 66:
      v7.value = SiriWellnessIntents_WellnessNoun_manganese;
      goto LABEL_250;
    case 67:
      v7.value = SiriWellnessIntents_WellnessNoun_memory_lapse;
      goto LABEL_250;
    case 68:
      v7.value = SiriWellnessIntents_WellnessNoun_menstruation;
      goto LABEL_250;
    case 69:
      v7.value = SiriWellnessIntents_WellnessNoun_mindful;
      goto LABEL_250;
    case 70:
      v7.value = SiriWellnessIntents_WellnessNoun_mood_swing;
      goto LABEL_250;
    case 71:
      v7.value = SiriWellnessIntents_WellnessNoun_move;
      goto LABEL_250;
    case 72:
      v7.value = SiriWellnessIntents_WellnessNoun_move_ring;
      goto LABEL_250;
    case 73:
      v7.value = SiriWellnessIntents_WellnessNoun_molybdenum;
      goto LABEL_250;
    case 74:
      v7.value = SiriWellnessIntents_WellnessNoun_nausea;
      goto LABEL_250;
    case 75:
      v7.value = SiriWellnessIntents_WellnessNoun_niacin;
      goto LABEL_250;
    case 76:
      v7.value = SiriWellnessIntents_WellnessNoun_night_sweats;
      goto LABEL_250;
    case 77:
      v7.value = SiriWellnessIntents_WellnessNoun_nikeFuel;
      goto LABEL_250;
    case 78:
      v7.value = SiriWellnessIntents_WellnessNoun_number_of_times_fallen;
      goto LABEL_250;
    case 79:
      v7.value = SiriWellnessIntents_WellnessNoun_oxygen_saturation;
      goto LABEL_250;
    case 80:
      v7.value = SiriWellnessIntents_WellnessNoun_ovulation;
      goto LABEL_250;
    case 81:
      v7.value = SiriWellnessIntents_WellnessNoun_pantothenic_acid;
      goto LABEL_250;
    case 82:
      v7.value = SiriWellnessIntents_WellnessNoun_peak_expiratory_flow_rate;
      goto LABEL_250;
    case 83:
      v7.value = SiriWellnessIntents_WellnessNoun_pelvic_pain;
      goto LABEL_250;
    case 84:
      v7.value = SiriWellnessIntents_WellnessNoun_peripheral_perfusion_index;
      goto LABEL_250;
    case 85:
      v7.value = SiriWellnessIntents_WellnessNoun_phosphorus;
      goto LABEL_250;
    case 86:
      v7.value = SiriWellnessIntents_WellnessNoun_potassium;
      goto LABEL_250;
    case 87:
      v7.value = SiriWellnessIntents_WellnessNoun_protein;
      goto LABEL_250;
    case 88:
      v7.value = SiriWellnessIntents_WellnessNoun_respiratory_rate;
      goto LABEL_250;
    case 89:
      v7.value = SiriWellnessIntents_WellnessNoun_resting_heart_rate;
      goto LABEL_250;
    case 90:
      v7.value = SiriWellnessIntents_WellnessNoun_riboflavin;
      goto LABEL_250;
    case 91:
      v7.value = SiriWellnessIntents_WellnessNoun_running;
      goto LABEL_250;
    case 92:
      v7.value = SiriWellnessIntents_WellnessNoun_selenium;
      goto LABEL_250;
    case 93:
      v7.value = SiriWellnessIntents_WellnessNoun_sexual_activity;
      goto LABEL_250;
    case 94:
      v7.value = SiriWellnessIntents_WellnessNoun_six_minute_walk;
      goto LABEL_250;
    case 95:
      v7.value = SiriWellnessIntents_WellnessNoun_sleep;
      goto LABEL_250;
    case 96:
      v7.value = SiriWellnessIntents_WellnessNoun_sleep_changes;
      goto LABEL_250;
    case 97:
      v7.value = SiriWellnessIntents_WellnessNoun_spotting;
      goto LABEL_250;
    case 98:
      v7.value = SiriWellnessIntents_WellnessNoun_stand;
      goto LABEL_250;
    case 99:
      v7.value = SiriWellnessIntents_WellnessNoun_stand_ring;
      goto LABEL_250;
    case 100:
      v7.value = SiriWellnessIntents_WellnessNoun_swimming;
      goto LABEL_250;
    case 101:
      v7.value = SiriWellnessIntents_WellnessNoun_sodium;
      goto LABEL_250;
    case 102:
      v7.value = SiriWellnessIntents_WellnessNoun_thiamin;
      goto LABEL_250;
    case 103:
      v7.value = SiriWellnessIntents_WellnessNoun_uv_index;
      goto LABEL_250;
    case 104:
      v7.value = SiriWellnessIntents_WellnessNoun_vaginal_dryness;
      goto LABEL_250;
    case 105:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_a;
      goto LABEL_250;
    case 106:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_b12;
      goto LABEL_250;
    case 107:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_b6;
      goto LABEL_250;
    case 108:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_c;
      goto LABEL_250;
    case 109:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_d;
      goto LABEL_250;
    case 110:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_e;
      goto LABEL_250;
    case 111:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_k;
      goto LABEL_250;
    case 112:
      v7.value = SiriWellnessIntents_WellnessNoun_vo2_max;
      goto LABEL_250;
    case 113:
      v7.value = SiriWellnessIntents_WellnessNoun_waist_circumference;
      goto LABEL_250;
    case 114:
      v7.value = SiriWellnessIntents_WellnessNoun_walking;
      goto LABEL_250;
    case 115:
      v7.value = SiriWellnessIntents_WellnessNoun_walking_heart_rate_average;
      goto LABEL_250;
    case 116:
      v7.value = SiriWellnessIntents_WellnessNoun_water;
      goto LABEL_250;
    case 117:
      v7.value = SiriWellnessIntents_WellnessNoun_weight;
      goto LABEL_250;
    case 118:
      v7.value = SiriWellnessIntents_WellnessNoun_workouts;
      goto LABEL_250;
    case 119:
      v7.value = SiriWellnessIntents_WellnessNoun_zinc;
      goto LABEL_250;
    case 120:
      v7.value = SiriWellnessIntents_WellnessNoun_unsupported;
      goto LABEL_250;
    case 121:
      v7.value = SiriWellnessIntents_WellnessNoun_active_energy_burned;
      goto LABEL_250;
    case 122:
      v7.value = SiriWellnessIntents_WellnessNoun_inBed;
      goto LABEL_250;
    case 123:
      v7.value = SiriWellnessIntents_WellnessNoun_stepCount;
      goto LABEL_250;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessNoun_optional)124;
}

uint64_t static WellnessNoun.allCases.getter()
{
  uint64_t result;
  _BYTE *v1;

  result = _allocateUninitializedArray<A>(_:)();
  *v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  v1[5] = 5;
  v1[6] = 6;
  v1[7] = 7;
  v1[8] = 8;
  v1[9] = 9;
  v1[10] = 10;
  v1[11] = 11;
  v1[12] = 12;
  v1[13] = 13;
  v1[14] = 14;
  v1[15] = 15;
  v1[16] = 16;
  v1[17] = 17;
  v1[18] = 18;
  v1[19] = 19;
  v1[20] = 20;
  v1[21] = 21;
  v1[22] = 22;
  v1[23] = 23;
  v1[24] = 24;
  v1[25] = 25;
  v1[26] = 26;
  v1[27] = 27;
  v1[28] = 28;
  v1[29] = 29;
  v1[30] = 30;
  v1[31] = 31;
  _finalizeUninitializedArray<A>(_:)();
  return result;
}

void WellnessNoun.rawValue.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_24759D42C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("abdominal_cramps", 0x10uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessNoun()
{
  lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessNoun()
{
  return lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
}

unint64_t lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun;
  if (!lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessNoun, &type metadata for WellnessNoun);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun;
  if (!lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessNoun, &type metadata for WellnessNoun);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessNoun()
{
  lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessNoun()
{
  lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessNoun()
{
  lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessNoun_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessNoun@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessNoun_optional *a2@<X8>)
{
  SiriWellnessIntents::WellnessNoun_optional result;

  result.value = WellnessNoun.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance WellnessNoun(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  WellnessNoun.rawValue.getter(*v1);
  *a1 = v2;
  a1[1] = v3;
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in WellnessNoun()
{
  return lazy protocol witness table accessor for type [WellnessNoun] and conformance [A]();
}

unint64_t lazy protocol witness table accessor for type [WellnessNoun] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WellnessNoun]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A]);
    return v1;
  }
  return v3;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance WellnessNoun@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static WellnessNoun.allCases.getter();
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessNoun(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0x84)
      goto LABEL_15;
    v7 = ((a2 + 123) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 132;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 124;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for WellnessNoun(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0x84)
  {
    v5 = ((a3 + 123) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0x84)
  {
    v4 = ((a2 - 133) >> 8) + 1;
    *result = a2 + 123;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 123;
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessNoun()
{
  return &type metadata for WellnessNoun;
}

id LogBloodPressureIntentHandler.__allocating_init(storage:)(_QWORD *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return LogBloodPressureIntentHandler.init(storage:)(a1);
}

id LogBloodPressureIntentHandler.init(storage:)(_QWORD *a1)
{
  void *v1;
  id v2;
  SiriWellnessIntents::BloodPressurePersistor v3;
  id v4;
  id v6;
  char *v7;
  objc_class *ObjectType;
  objc_super v10;
  _QWORD v11[5];
  _QWORD __dst[6];
  id v13;

  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  v2 = v1;
  v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.isa = BloodPressurePersistor.init()().store.super.isa;
    __dst[3] = &type metadata for BloodPressurePersistor;
    __dst[4] = &protocol witness table for BloodPressurePersistor;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v4 = v6;
  v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

SiriWellnessIntents::BloodPressurePersistor __swiftcall BloodPressurePersistor.init()()
{
  id v0;
  void *v2;
  id v3;

  v3 = 0;
  type metadata accessor for HKHealthStore();
  v2 = (void *)NSDateFormatter.__allocating_init()();
  v0 = v2;
  v3 = v2;
  outlined destroy of HealthKitPersistor(&v3);
  return (SiriWellnessIntents::BloodPressurePersistor)v2;
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[44] = v1;
  v2[43] = a1;
  v2[24] = v2;
  v2[25] = 0;
  v2[26] = 0;
  v3 = type metadata accessor for Logger();
  v2[45] = v3;
  v2[46] = *(_QWORD *)(v3 - 8);
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[25] = a1;
  v2[26] = v1;
  return swift_task_switch();
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 192) = *v1;
  *(_QWORD *)(v3 + 488) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t);
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint8_t *buf;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 400);
  v19 = *(_QWORD *)(v0 + 368);
  v21 = *(_QWORD *)(v0 + 360);
  *(_QWORD *)(v0 + 192) = v0;
  v20 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  *(_QWORD *)(v0 + 408) = v2;
  v2(v1, v20, v21);
  swift_endAccess();
  v24 = Logger.logObject.getter();
  v23 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 216) = 2;
  *(_QWORD *)(v0 + 416) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 424) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 432) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v22 = *(_DWORD *)(v0 + 496);
  *(_QWORD *)(v0 + 440) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v25 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v24, v23))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v15 = createStorage<A>(capacity:type:)(0);
    v16 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v18 + 312) = buf;
    *(_QWORD *)(v18 + 320) = v15;
    *(_QWORD *)(v18 + 328) = v16;
    serialize(_:at:)(0, (_BYTE **)(v18 + 312));
    serialize(_:at:)(0, (_BYTE **)(v18 + 312));
    *(_QWORD *)(v18 + 336) = v25;
    v17 = (_QWORD *)swift_task_alloc();
    v17[2] = v18 + 312;
    v17[3] = v18 + 320;
    v17[4] = v18 + 328;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v24, v23, "Checking authorization for Blood Pressure...", buf, v22);
    destroyStorage<A>(_:count:)(v15, 0, v13);
    destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)(v18 + 448) = 0;
  v7 = *(_QWORD *)(v18 + 400);
  v6 = *(_QWORD *)(v18 + 368);
  v8 = *(_QWORD *)(v18 + 360);
  v9 = *(_QWORD *)(v18 + 352);

  v3 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v18 + 456) = v3;
  v3(v7, v8);
  outlined init with copy of QuantityPersisting(v9 + OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage, v18 + 16);
  v12 = *(_QWORD *)(v18 + 40);
  v10 = *(_QWORD *)(v18 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v18 + 16), v12);
  v11 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v10 + 8) + **(int **)(v10 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v18 + 464) = v4;
  *v4 = *(_QWORD *)(v18 + 192);
  v4[1] = LogBloodPressureIntentHandler.handle(intent:);
  return v11(v12, v10);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint32_t v27;
  os_log_type_t v28;
  NSObject *log;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, double, double);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  id v43;
  double v44;
  id v45;
  uint64_t v46;
  uint8_t *buf;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  id v55;
  uint32_t size;
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
  _QWORD *v72;
  NSObject *oslog;
  os_log_type_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t, uint64_t);
  uint32_t v84;
  os_log_type_t v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;

  v89 = *(_BYTE *)(v0 + 512);
  *(_QWORD *)(v0 + 192) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v89 & 1) == 0)
  {
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 408);
    v13 = *(_QWORD *)(v88 + 376);
    v25 = *(_QWORD *)(v88 + 360);
    v24 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v26(v13, v24, v25);
    swift_endAccess();
    log = Logger.logObject.getter();
    v28 = static os_log_type_t.error.getter();
    *(_QWORD *)(v88 + 224) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v27 = *(_DWORD *)(v88 + 500);
    v30 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v28))
    {
      v14 = *(_QWORD *)(v88 + 448);
      v20 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v21 = createStorage<A>(capacity:type:)(0);
      v22 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v88 + 232) = v20;
      *(_QWORD *)(v88 + 240) = v21;
      *(_QWORD *)(v88 + 248) = v22;
      serialize(_:at:)(0, (_BYTE **)(v88 + 232));
      serialize(_:at:)(0, (_BYTE **)(v88 + 232));
      *(_QWORD *)(v88 + 256) = v30;
      v23 = (_QWORD *)swift_task_alloc();
      v23[2] = v88 + 232;
      v23[3] = v88 + 240;
      v23[4] = v88 + 248;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v14)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, log, v28, "Not authorized to write Blood Pressure data.", v20, v27);
      destroyStorage<A>(_:count:)(v21, 0, v19);
      destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v20, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v17 = *(void (**)(uint64_t, uint64_t))(v88 + 456);
    v15 = *(_QWORD *)(v88 + 376);
    v16 = *(_QWORD *)(v88 + 360);

    v17(v15, v16);
    type metadata accessor for LogBloodPressureIntentResponse();
    v18 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(101, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v88 + 192) + 8))(v18);
  }
  v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 408);
  v1 = *(_QWORD *)(v88 + 392);
  v82 = *(_QWORD *)(v88 + 360);
  v81 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v83(v1, v81, v82);
  swift_endAccess();
  v86 = Logger.logObject.getter();
  v85 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v88 + 264) = 2;
  UnsignedInteger<>.init<A>(_:)();
  v84 = *(_DWORD *)(v88 + 504);
  v87 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v86, v85))
  {
    v2 = *(_QWORD *)(v88 + 448);
    v77 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v78 = createStorage<A>(capacity:type:)(0);
    v79 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v88 + 280) = v77;
    *(_QWORD *)(v88 + 288) = v78;
    *(_QWORD *)(v88 + 296) = v79;
    serialize(_:at:)(0, (_BYTE **)(v88 + 280));
    serialize(_:at:)(0, (_BYTE **)(v88 + 280));
    *(_QWORD *)(v88 + 304) = v87;
    v80 = (_QWORD *)swift_task_alloc();
    v80[2] = v88 + 280;
    v80[3] = v88 + 288;
    v80[4] = v88 + 296;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    result = Sequence.forEach(_:)();
    if (v2)
      return result;
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v86, v85, "Authorization check successful for Blood Pressure!", v77, v84);
    destroyStorage<A>(_:count:)(v78, 0, v76);
    destroyStorage<A>(_:count:)(v79, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v77, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
    v75 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v75 = *(_QWORD *)(v88 + 448);
  }
  v51 = *(void (**)(uint64_t, uint64_t))(v88 + 456);
  v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 408);
  v50 = *(_QWORD *)(v88 + 392);
  v4 = *(_QWORD *)(v88 + 384);
  v53 = *(_QWORD *)(v88 + 360);
  v55 = *(id *)(v88 + 344);

  v51(v50, v53);
  v52 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v54(v4, v52, v53);
  swift_endAccess();
  v5 = v55;
  v57 = swift_allocObject();
  *(_QWORD *)(v57 + 16) = v55;
  v6 = v55;
  v59 = swift_allocObject();
  *(_QWORD *)(v59 + 16) = v55;
  v7 = v55;
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = v55;
  oslog = Logger.logObject.getter();
  v74 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v88 + 272) = 32;
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v88 + 508);
  v63 = swift_allocObject();
  *(_BYTE *)(v63 + 16) = 0;
  v64 = swift_allocObject();
  *(_BYTE *)(v64 + 16) = 8;
  v58 = swift_allocObject();
  *(_QWORD *)(v58 + 16) = partial apply for implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:);
  *(_QWORD *)(v58 + 24) = v57;
  v65 = swift_allocObject();
  *(_QWORD *)(v65 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v65 + 24) = v58;
  v66 = swift_allocObject();
  *(_BYTE *)(v66 + 16) = 0;
  v67 = swift_allocObject();
  *(_BYTE *)(v67 + 16) = 8;
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = partial apply for implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:);
  *(_QWORD *)(v60 + 24) = v59;
  v68 = swift_allocObject();
  *(_QWORD *)(v68 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v68 + 24) = v60;
  v69 = swift_allocObject();
  *(_BYTE *)(v69 + 16) = 32;
  v70 = swift_allocObject();
  *(_BYTE *)(v70 + 16) = 8;
  v62 = swift_allocObject();
  *(_QWORD *)(v62 + 16) = partial apply for implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:);
  *(_QWORD *)(v62 + 24) = v61;
  v71 = swift_allocObject();
  *(_QWORD *)(v71 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v71 + 24) = v62;
  _allocateUninitializedArray<A>(_:)();
  v72 = v8;
  swift_retain();
  *v72 = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[1] = v63;
  swift_retain();
  v72[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[3] = v64;
  swift_retain();
  v72[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[5] = v65;
  swift_retain();
  v72[6] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[7] = v66;
  swift_retain();
  v72[8] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[9] = v67;
  swift_retain();
  v72[10] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[11] = v68;
  swift_retain();
  v72[12] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[13] = v69;
  swift_retain();
  v72[14] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[15] = v70;
  swift_retain();
  v72[16] = partial apply for closure #1 in OSLogArguments.append(_:);
  v72[17] = v71;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v74))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v48 = createStorage<A>(capacity:type:)(0);
    v49 = createStorage<A>(capacity:type:)(1);
    v90 = buf;
    v91 = v48;
    v92 = v49;
    serialize(_:at:)(2, &v90);
    serialize(_:at:)(3, &v90);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v63;
    result = closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    if (v75)
      return result;
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v64;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v65;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v66;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v67;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v68;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v69;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v70;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v94 = v71;
    closure #1 in osLogInternal(_:log:type:)(&v93, (uint64_t)&v90, (uint64_t)&v91, (uint64_t)&v92);
    _os_log_impl(&dword_24749F000, oslog, v74, "Persisting sample...\n  systolic: %f\n  diastolic: %f\n  unit: %s", buf, size);
    destroyStorage<A>(_:count:)(v48, 0, v46);
    destroyStorage<A>(_:count:)(v49, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  v38 = *(void (**)(uint64_t, uint64_t))(v88 + 456);
  v36 = *(_QWORD *)(v88 + 384);
  v37 = *(_QWORD *)(v88 + 360);
  v39 = *(_QWORD *)(v88 + 352);
  v43 = *(id *)(v88 + 344);

  v38(v36, v37);
  outlined init with copy of QuantityPersisting(v39 + OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage, v88 + 56);
  v40 = *(_QWORD *)(v88 + 80);
  v41 = *(_QWORD *)(v88 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v88 + 56), v40);
  objc_msgSend(v43, sel_systolic);
  v42 = v9;
  objc_msgSend(v43, sel_diastolic);
  v44 = v10;
  v45 = objc_msgSend(v43, sel_unit);
  if (v45)
  {
    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v33 = v11;

    v34 = v32;
    v35 = v33;
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }
  *(_QWORD *)(v88 + 472) = v35;
  v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))(*(_QWORD *)(v41 + 16)
                                                                                   + **(int **)(v41 + 16));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v88 + 480) = v12;
  *v12 = *(_QWORD *)(v88 + 192);
  v12[1] = LogBloodPressureIntentHandler.handle(intent:);
  return v31(v34, v35, v40, v41, v42, v44);
}

{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 192) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v2 = *(_QWORD *)(v0 + 488);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 192) + 8))(v2);
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 192) = *v1;
  *(_BYTE *)(v3 + 512) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

id implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  return objc_msgSend(a1, sel_systolic);
}

id implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  return objc_msgSend(a1, sel_diastolic);
}

uint64_t implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, sel_unit);
  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  lazy protocol witness table accessor for type String? and conformance A?();
  return String.init<A>(describing:)();
}

uint64_t @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 48) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return LogBloodPressureIntentHandler.handle(intent:)((uint64_t)a1);
}

id LogBloodPressureIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t LogBloodPressureIntentHandler.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriWellnessIntents.LogBloodPressureIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.LogBloodPressureIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/LogBloodPressureIntentHandler.swift", 55, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id LogBloodPressureIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BloodPressurePersistor.isLoggingAuthorized()(void *a1)
{
  _QWORD *v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;

  v1[4] = a1;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = a1;
  v2 = a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 40) = v3;
  *v3 = *(_QWORD *)(v5 + 16);
  v3[1] = CycleTrackingFetcher.isReadingAuthorized();
  return isSiriAuthorizedToAccessHealthData(store:)((uint64_t)a1);
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 1240) = a3;
  *(_QWORD *)(v5 + 1232) = a2;
  *(_QWORD *)(v5 + 1224) = a1;
  *(double *)(v5 + 1216) = a5;
  *(double *)(v5 + 1208) = a4;
  *(_QWORD *)(v5 + 512) = v5;
  *(_QWORD *)(v5 + 520) = 0;
  *(_QWORD *)(v5 + 528) = 0;
  *(_QWORD *)(v5 + 480) = 0;
  *(_QWORD *)(v5 + 488) = 0;
  *(_QWORD *)(v5 + 536) = 0;
  *(_QWORD *)(v5 + 592) = 0;
  *(_QWORD *)(v5 + 600) = 0;
  *(_QWORD *)(v5 + 608) = 0;
  *(_QWORD *)(v5 + 680) = 0;
  *(_QWORD *)(v5 + 696) = 0;
  *(_QWORD *)(v5 + 704) = 0;
  *(_QWORD *)(v5 + 720) = 0;
  *(_QWORD *)(v5 + 728) = 0;
  *(_QWORD *)(v5 + 744) = 0;
  *(_QWORD *)(v5 + 752) = 0;
  *(_QWORD *)(v5 + 768) = 0;
  *(_QWORD *)(v5 + 792) = 0;
  *(_QWORD *)(v5 + 496) = 0;
  *(_QWORD *)(v5 + 504) = 0;
  v6 = type metadata accessor for Date();
  *(_QWORD *)(v5 + 1248) = v6;
  *(_QWORD *)(v5 + 1256) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 1264) = swift_task_alloc();
  *(_QWORD *)(v5 + 1272) = swift_task_alloc();
  *(_QWORD *)(v5 + 1280) = swift_task_alloc();
  *(_QWORD *)(v5 + 1288) = swift_task_alloc();
  v7 = type metadata accessor for Logger();
  *(_QWORD *)(v5 + 1296) = v7;
  *(_QWORD *)(v5 + 1304) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 1312) = swift_task_alloc();
  *(_QWORD *)(v5 + 1320) = swift_task_alloc();
  *(_QWORD *)(v5 + 1328) = swift_task_alloc();
  *(_QWORD *)(v5 + 1336) = swift_task_alloc();
  *(_QWORD *)(v5 + 1344) = swift_task_alloc();
  *(_QWORD *)(v5 + 1352) = swift_task_alloc();
  *(_QWORD *)(v5 + 1360) = swift_task_alloc();
  *(_QWORD *)(v5 + 1368) = swift_task_alloc();
  *(_QWORD *)(v5 + 1376) = swift_task_alloc();
  *(_QWORD *)(v5 + 1384) = swift_task_alloc();
  *(_QWORD *)(v5 + 1392) = swift_task_alloc();
  *(_QWORD *)(v5 + 1400) = swift_task_alloc();
  *(_QWORD *)(v5 + 1408) = swift_task_alloc();
  *(_QWORD *)(v5 + 1416) = swift_task_alloc();
  *(_QWORD *)(v5 + 1424) = swift_task_alloc();
  *(double *)(v5 + 520) = a4;
  *(double *)(v5 + 528) = a5;
  *(_QWORD *)(v5 + 480) = a1;
  *(_QWORD *)(v5 + 488) = a2;
  *(_QWORD *)(v5 + 536) = a3;
  return swift_task_switch();
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint32_t v53;
  os_log_type_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  id v60;
  id v61;
  id v62;
  char *v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  uint32_t v72;
  os_log_type_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  id v79;
  uint64_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t, uint64_t);
  uint32_t v100;
  os_log_type_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t, uint64_t);
  uint32_t v112;
  os_log_type_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, uint64_t);
  id v124;
  id v125;
  id v126;
  char *v127;
  uint64_t v128;
  uint8_t *v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t, uint64_t);
  uint32_t v136;
  os_log_type_t v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void (*v142)(uint64_t, uint64_t);
  double v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  id v151;
  NSString *v152;
  Swift::Bool v153;
  uint64_t v154;
  uint8_t *v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  uint64_t v160;
  void (*v161)(uint64_t, uint64_t, uint64_t);
  uint32_t v162;
  os_log_type_t v163;
  NSObject *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void (*v173)(uint64_t, uint64_t);
  id v174;
  id v175;
  id v176;
  char *v177;
  uint64_t v178;
  uint8_t *v179;
  uint64_t v180;
  uint64_t v181;
  _QWORD *v182;
  uint64_t v183;
  uint64_t v184;
  void (*v185)(uint64_t, uint64_t, uint64_t);
  uint32_t v186;
  os_log_type_t v187;
  NSObject *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void (*v192)(uint64_t, uint64_t);
  double v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  id v200;
  id v201;
  NSString *identifier;
  Swift::Bool v203;
  uint64_t v204;
  uint8_t *v205;
  uint64_t v206;
  uint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t, uint64_t);
  uint64_t v214;
  uint64_t v215;
  void (*v216)(uint64_t, uint64_t, uint64_t);
  uint32_t v217;
  os_log_type_t v218;
  NSObject *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void (*v223)(uint64_t, uint64_t);
  id v224;
  id v225;
  id v226;
  char *v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint8_t *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void (*v236)(uint64_t, uint64_t, uint64_t);
  void *v237;
  void *v238;
  uint32_t v239;
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
  _QWORD *v255;
  NSObject *v256;
  os_log_type_t v257;
  unsigned int v258;
  id v259;
  unsigned __int8 v260;
  uint64_t v261;
  uint64_t v262;
  void (*v263)(uint64_t, uint64_t);
  void *v264;
  uint64_t v265;
  uint8_t *v266;
  uint64_t v267;
  uint64_t v268;
  _QWORD *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint8_t *v273;
  uint64_t v274;
  uint64_t v275;
  _QWORD *v276;
  uint64_t v277;
  uint64_t v278;
  uint32_t v279;
  os_log_type_t v280;
  NSObject *log;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void (*v287)(uint64_t, uint64_t, uint64_t);
  uint32_t v288;
  os_log_type_t v289;
  NSObject *v290;
  uint64_t v291;
  uint64_t v292;
  uint8_t *v293;
  uint64_t v294;
  uint64_t v295;
  _QWORD *v296;
  uint64_t v297;
  uint64_t v298;
  uint32_t size;
  os_log_type_t v300;
  NSObject *oslog;
  uint64_t v302;
  uint64_t v303;
  id v304;
  id v305;
  id v306;
  id v307;
  id v308;
  id v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void (*v313)(uint64_t, uint64_t);
  id ObjCClassFromMetadata;
  id v315;
  id v316;
  uint64_t v317;
  uint8_t *buf;
  uint64_t v319;
  uint64_t v320;
  _QWORD *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void (*v325)(uint64_t, uint64_t, uint64_t);
  uint32_t v326;
  os_log_type_t v327;
  NSObject *v328;
  uint64_t v329;
  uint8_t *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t (*v333)(uint64_t, uint64_t, uint64_t);
  uint64_t v334;

  MEMORY[0x24BDAC7A8](a1);
  v2 = *(_QWORD *)(v1 + 1424);
  v322 = *(_QWORD *)(v1 + 1304);
  v324 = *(_QWORD *)(v1 + 1296);
  *(_QWORD *)(v1 + 512) = v1;
  v323 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v325 = *(void (**)(uint64_t, uint64_t, uint64_t))(v322 + 16);
  *(_QWORD *)(v1 + 1432) = v325;
  v325(v2, v323, v324);
  swift_endAccess();
  v328 = Logger.logObject.getter();
  v327 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v1 + 544) = 2;
  *(_QWORD *)(v1 + 1440) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v1 + 1448) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v1 + 1456) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v326 = *(_DWORD *)(v1 + 1608);
  *(_QWORD *)(v1 + 1464) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v329 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v328, v327))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v317 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v319 = createStorage<A>(capacity:type:)(0);
    v320 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v1 + 1176) = buf;
    *(_QWORD *)(v1 + 1184) = v319;
    *(_QWORD *)(v1 + 1192) = v320;
    serialize(_:at:)(0, (_BYTE **)(v1 + 1176));
    serialize(_:at:)(0, (_BYTE **)(v1 + 1176));
    *(_QWORD *)(v1 + 1200) = v329;
    v321 = (_QWORD *)swift_task_alloc();
    v321[2] = v1 + 1176;
    v321[3] = v1 + 1184;
    v321[4] = v1 + 1192;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v328, v327, "Starting to save blood pressure.", buf, v326);
    destroyStorage<A>(_:count:)(v319, 0, v317);
    destroyStorage<A>(_:count:)(v320, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  v311 = *(_QWORD *)(v1 + 1424);
  v310 = *(_QWORD *)(v1 + 1304);
  v312 = *(_QWORD *)(v1 + 1296);

  v313 = *(void (**)(uint64_t, uint64_t))(v310 + 8);
  *(_QWORD *)(v1 + 1472) = v313;
  v313(v311, v312);
  type metadata accessor for HKQuantityType();
  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  v315 = (id)*MEMORY[0x24BDD33A8];
  v3 = (id)*MEMORY[0x24BDD33A8];
  v4 = objc_msgSend(ObjCClassFromMetadata, sel_quantityTypeForIdentifier_, v315);
  *(_QWORD *)(v1 + 1480) = v4;
  v316 = v4;

  if (!v316)
    goto LABEL_50;
  *(_QWORD *)(v1 + 592) = v316;
  v307 = (id)swift_getObjCClassFromMetadata();
  v308 = (id)*MEMORY[0x24BDD33A0];
  v5 = (id)*MEMORY[0x24BDD33A0];
  v6 = objc_msgSend(v307, sel_quantityTypeForIdentifier_, v308);
  *(_QWORD *)(v1 + 1488) = v6;
  v309 = v6;

  if (!v309)
  {

LABEL_50:
    v43 = *(_QWORD *)(v1 + 1320);
    v52 = *(_QWORD *)(v1 + 1296);
    v51 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v325(v43, v51, v52);
    swift_endAccess();
    v55 = Logger.logObject.getter();
    v54 = static os_log_type_t.error.getter();
    *(_QWORD *)(v1 + 552) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v53 = *(_DWORD *)(v1 + 1612);
    v56 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v55, v54))
    {
      v47 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v48 = createStorage<A>(capacity:type:)(0);
      v49 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 560) = v47;
      *(_QWORD *)(v1 + 568) = v48;
      *(_QWORD *)(v1 + 576) = v49;
      serialize(_:at:)(0, (_BYTE **)(v1 + 560));
      serialize(_:at:)(0, (_BYTE **)(v1 + 560));
      *(_QWORD *)(v1 + 584) = v56;
      v50 = (_QWORD *)swift_task_alloc();
      v50[2] = v1 + 560;
      v50[3] = v1 + 568;
      v50[4] = v1 + 576;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v55, v54, "Could not create any Blood Pressure types.", v47, v53);
      destroyStorage<A>(_:count:)(v48, 0, v46);
      destroyStorage<A>(_:count:)(v49, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v47, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v44 = *(_QWORD *)(v1 + 1320);
    v45 = *(_QWORD *)(v1 + 1296);

    v313(v44, v45);
    type metadata accessor for LogBloodPressureIntentResponse();
    v228 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    goto LABEL_53;
  }
  *(_QWORD *)(v1 + 600) = v309;
  type metadata accessor for HKCorrelationType();
  v304 = (id)swift_getObjCClassFromMetadata();
  v305 = (id)*MEMORY[0x24BDD2B08];
  v7 = (id)*MEMORY[0x24BDD2B08];
  v8 = objc_msgSend(v304, sel_correlationTypeForIdentifier_, v305);
  *(_QWORD *)(v1 + 1496) = v8;
  v306 = v8;

  if (!v306)
  {

    goto LABEL_50;
  }
  v303 = *(_QWORD *)(v1 + 1232);
  *(_QWORD *)(v1 + 608) = v306;
  swift_bridgeObjectRetain();
  if (v303)
  {
    v9 = *(_QWORD *)(v1 + 1232);
    v10 = *(_QWORD *)(v1 + 1416);
    v298 = *(_QWORD *)(v1 + 1296);
    *(_QWORD *)(v1 + 496) = *(_QWORD *)(v1 + 1224);
    *(_QWORD *)(v1 + 504) = v9;
    v297 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v325(v10, v297, v298);
    swift_endAccess();
    oslog = Logger.logObject.getter();
    v300 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 1136) = 2;
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v1 + 1664);
    v302 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v300))
    {
      v293 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v292 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v294 = createStorage<A>(capacity:type:)(0);
      v295 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 1144) = v293;
      *(_QWORD *)(v1 + 1152) = v294;
      *(_QWORD *)(v1 + 1160) = v295;
      serialize(_:at:)(0, (_BYTE **)(v1 + 1144));
      serialize(_:at:)(0, (_BYTE **)(v1 + 1144));
      *(_QWORD *)(v1 + 1168) = v302;
      v296 = (_QWORD *)swift_task_alloc();
      v296[2] = v1 + 1144;
      v296[3] = v1 + 1152;
      v296[4] = v1 + 1160;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, oslog, v300, "Trying to convert unit to HKUnit.", v293, size);
      destroyStorage<A>(_:count:)(v294, 0, v292);
      destroyStorage<A>(_:count:)(v295, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v293, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v283 = *(_QWORD *)(v1 + 1416);
    v284 = *(_QWORD *)(v1 + 1296);

    v313(v283, v284);
    type metadata accessor for HKUnit();
    swift_bridgeObjectRetain();
    *(_QWORD *)(v1 + 616) = @nonobjc HKUnit.__allocating_init(from:)();
    swift_bridgeObjectRelease();
    v287 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    v11 = *(_QWORD *)(v1 + 1400);
    v286 = *(_QWORD *)(v1 + 1296);
    v285 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v287(v11, v285, v286);
    swift_endAccess();
    v290 = Logger.logObject.getter();
    v289 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 632) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v288 = *(_DWORD *)(v1 + 1620);
    v291 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v290, v289))
    {
      v266 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v265 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v267 = createStorage<A>(capacity:type:)(0);
      v268 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 1072) = v266;
      *(_QWORD *)(v1 + 1080) = v267;
      *(_QWORD *)(v1 + 1088) = v268;
      serialize(_:at:)(0, (_BYTE **)(v1 + 1072));
      serialize(_:at:)(0, (_BYTE **)(v1 + 1072));
      *(_QWORD *)(v1 + 1096) = v291;
      v269 = (_QWORD *)swift_task_alloc();
      v269[2] = v1 + 1072;
      v269[3] = v1 + 1080;
      v269[4] = v1 + 1088;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v290, v289, "Starting to convert optional HKUnit to non-optional HKUnit.", v266, v288);
      destroyStorage<A>(_:count:)(v267, 0, v265);
      destroyStorage<A>(_:count:)(v268, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v266, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v263 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
    v261 = *(_QWORD *)(v1 + 1400);
    v262 = *(_QWORD *)(v1 + 1296);

    v263(v261, v262);
    v264 = *(void **)(v1 + 616);
    *(_QWORD *)(v1 + 1528) = v264;
    v15 = v264;
    if (!v264)
    {
      v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      v42 = *(_QWORD *)(v1 + 1328);
      v70 = *(_QWORD *)(v1 + 1296);
      v69 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v71(v42, v69, v70);
      swift_endAccess();
      v74 = Logger.logObject.getter();
      v73 = static os_log_type_t.error.getter();
      *(_QWORD *)(v1 + 640) = 2;
      UnsignedInteger<>.init<A>(_:)();
      v72 = *(_DWORD *)(v1 + 1624);
      v75 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v74, v73))
      {
        v65 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v66 = createStorage<A>(capacity:type:)(0);
        v67 = createStorage<A>(capacity:type:)(0);
        *(_QWORD *)(v1 + 648) = v65;
        *(_QWORD *)(v1 + 656) = v66;
        *(_QWORD *)(v1 + 664) = v67;
        serialize(_:at:)(0, (_BYTE **)(v1 + 648));
        serialize(_:at:)(0, (_BYTE **)(v1 + 648));
        *(_QWORD *)(v1 + 672) = v75;
        v68 = (_QWORD *)swift_task_alloc();
        v68[2] = v1 + 648;
        v68[3] = v1 + 656;
        v68[4] = v1 + 664;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_24749F000, v74, v73, "Could not create an HKUnit.", v65, v72);
        destroyStorage<A>(_:count:)(v66, 0, v64);
        destroyStorage<A>(_:count:)(v67, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v65, MEMORY[0x24BEE4260]);
      }
      swift_bridgeObjectRelease();
      v59 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
      v57 = *(_QWORD *)(v1 + 1328);
      v58 = *(_QWORD *)(v1 + 1296);
      v60 = *(id *)(v1 + 1496);
      v61 = *(id *)(v1 + 1488);
      v62 = *(id *)(v1 + 1480);

      v59(v57, v58);
      type metadata accessor for LogBloodPressureIntentResponse();
      v63 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
      outlined destroy of HealthKitPersistor((id *)(v1 + 616));

      v228 = v63;
      goto LABEL_53;
    }
    v16 = *(void **)(v1 + 1480);
    v259 = *(id *)(v1 + 1488);
    *(_QWORD *)(v1 + 680) = v264;
    v260 = objc_msgSend(v16, sel_isCompatibleWithUnit_);
    v17 = v259;
    v18 = v264;
    if ((v260 & 1) != 0)
      v258 = objc_msgSend(*(id *)(v1 + 1488), sel_isCompatibleWithUnit_, v264) ^ 1;
    else
      LOBYTE(v258) = 1;

    if ((v258 & 1) != 0)
    {
      v236 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      v19 = *(_QWORD *)(v1 + 1392);
      v235 = *(_QWORD *)(v1 + 1296);
      v238 = *(void **)(v1 + 1488);
      v237 = *(void **)(v1 + 1480);
      v234 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v236(v19, v234, v235);
      swift_endAccess();
      v20 = v264;
      v240 = swift_allocObject();
      *(_QWORD *)(v240 + 16) = v264;
      v21 = v237;
      v242 = swift_allocObject();
      *(_QWORD *)(v242 + 16) = v237;
      v22 = v238;
      v244 = swift_allocObject();
      *(_QWORD *)(v244 + 16) = v238;
      v256 = Logger.logObject.getter();
      v257 = static os_log_type_t.error.getter();
      *(_QWORD *)(v1 + 1064) = 32;
      UnsignedInteger<>.init<A>(_:)();
      v239 = *(_DWORD *)(v1 + 1660);
      v246 = swift_allocObject();
      *(_BYTE *)(v246 + 16) = 64;
      v247 = swift_allocObject();
      *(_BYTE *)(v247 + 16) = 8;
      v241 = swift_allocObject();
      *(_QWORD *)(v241 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(_QWORD *)(v241 + 24) = v240;
      v248 = swift_allocObject();
      *(_QWORD *)(v248 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(_QWORD *)(v248 + 24) = v241;
      v249 = swift_allocObject();
      *(_BYTE *)(v249 + 16) = 64;
      v250 = swift_allocObject();
      *(_BYTE *)(v250 + 16) = 8;
      v243 = swift_allocObject();
      *(_QWORD *)(v243 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(_QWORD *)(v243 + 24) = v242;
      v251 = swift_allocObject();
      *(_QWORD *)(v251 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(_QWORD *)(v251 + 24) = v243;
      v252 = swift_allocObject();
      *(_BYTE *)(v252 + 16) = 64;
      v253 = swift_allocObject();
      *(_BYTE *)(v253 + 16) = 8;
      v245 = swift_allocObject();
      *(_QWORD *)(v245 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(_QWORD *)(v245 + 24) = v244;
      v254 = swift_allocObject();
      *(_QWORD *)(v254 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(_QWORD *)(v254 + 24) = v245;
      _allocateUninitializedArray<A>(_:)();
      v255 = v23;
      swift_retain();
      *v255 = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[1] = v246;
      swift_retain();
      v255[2] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[3] = v247;
      swift_retain();
      v255[4] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[5] = v248;
      swift_retain();
      v255[6] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[7] = v249;
      swift_retain();
      v255[8] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[9] = v250;
      swift_retain();
      v255[10] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[11] = v251;
      swift_retain();
      v255[12] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[13] = v252;
      swift_retain();
      v255[14] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[15] = v253;
      swift_retain();
      v255[16] = partial apply for closure #1 in OSLogArguments.append(_:);
      v255[17] = v254;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v256, v257))
      {
        v231 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v230 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v232 = createStorage<A>(capacity:type:)(3);
        v233 = createStorage<A>(capacity:type:)(0);
        v330 = v231;
        v331 = v232;
        v332 = v233;
        serialize(_:at:)(2, &v330);
        serialize(_:at:)(3, &v330);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v246;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v247;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v248;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v249;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v250;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v251;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v252;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v253;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        v333 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v334 = v254;
        closure #1 in osLogInternal(_:log:type:)(&v333, (uint64_t)&v330, (uint64_t)&v331, (uint64_t)&v332);
        _os_log_impl(&dword_24749F000, v256, v257, "%@ is incompatible with %@ or %@.", v231, v239);
        destroyStorage<A>(_:count:)(v232, 3, v230);
        destroyStorage<A>(_:count:)(v233, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v231, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      v223 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
      v221 = *(_QWORD *)(v1 + 1392);
      v222 = *(_QWORD *)(v1 + 1296);
      v224 = *(id *)(v1 + 1496);
      v225 = *(id *)(v1 + 1488);
      v226 = *(id *)(v1 + 1480);

      v223(v221, v222);
      type metadata accessor for LogBloodPressureIntentResponse();
      v227 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      v228 = v227;
LABEL_53:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(char *))(*(_QWORD *)(v1 + 512) + 8))(v228);
    }
    v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    v24 = *(_QWORD *)(v1 + 1384);
    v215 = *(_QWORD *)(v1 + 1296);
    v211 = *(_QWORD *)(v1 + 1288);
    v210 = *(_QWORD *)(v1 + 1280);
    v209 = *(_QWORD *)(v1 + 1256);
    v212 = *(_QWORD *)(v1 + 1248);
    Date.init()();
    v213 = *(void (**)(uint64_t, uint64_t, uint64_t))(v209 + 16);
    *(_QWORD *)(v1 + 1536) = v213;
    v213(v210, v211, v212);
    v214 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v216(v24, v214, v215);
    swift_endAccess();
    v219 = Logger.logObject.getter();
    v218 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 688) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v217 = *(_DWORD *)(v1 + 1628);
    v220 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v219, v218))
    {
      v205 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v204 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v206 = createStorage<A>(capacity:type:)(0);
      v207 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 1032) = v205;
      *(_QWORD *)(v1 + 1040) = v206;
      *(_QWORD *)(v1 + 1048) = v207;
      serialize(_:at:)(0, (_BYTE **)(v1 + 1032));
      serialize(_:at:)(0, (_BYTE **)(v1 + 1032));
      *(_QWORD *)(v1 + 1056) = v220;
      v208 = (_QWORD *)swift_task_alloc();
      v208[2] = v1 + 1032;
      v208[3] = v1 + 1040;
      v208[4] = v1 + 1048;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v219, v218, "Creating HKQuantity for Systolic.", v205, v217);
      destroyStorage<A>(_:count:)(v206, 0, v204);
      destroyStorage<A>(_:count:)(v207, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v205, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v192 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
    v190 = *(_QWORD *)(v1 + 1384);
    v191 = *(_QWORD *)(v1 + 1296);
    v194 = *(_QWORD *)(v1 + 1288);
    v195 = *(_QWORD *)(v1 + 1280);
    v197 = *(_QWORD *)(v1 + 1272);
    v198 = *(_QWORD *)(v1 + 1264);
    v196 = *(_QWORD *)(v1 + 1248);
    v193 = *(double *)(v1 + 1208);
    v199 = *(void **)(v1 + 1480);

    v192(v190, v191);
    type metadata accessor for HKQuantity();
    v25 = v264;
    v201 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v264, v193);
    *(_QWORD *)(v1 + 1544) = v201;
    *(_QWORD *)(v1 + 696) = v201;
    type metadata accessor for HKQuantitySample();
    v26 = v199;
    v27 = v201;
    v213(v197, v194, v196);
    v213(v198, v195, v196);
    v200 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v199, v201, v197, v198);
    *(_QWORD *)(v1 + 1552) = v200;
    *(_QWORD *)(v1 + 704) = v200;
    identifier = (NSString *)*MEMORY[0x24BDD33A8];
    v28 = (id)*MEMORY[0x24BDD33A8];
    v203 = validateQuantity(identifier:quantity:)(identifier, (HKQuantity)v201);

    if (!v203)
    {
      v185 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      v29 = *(_QWORD *)(v1 + 1376);
      v184 = *(_QWORD *)(v1 + 1296);
      v183 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v185(v29, v183, v184);
      swift_endAccess();
      v188 = Logger.logObject.getter();
      v187 = static os_log_type_t.error.getter();
      *(_QWORD *)(v1 + 992) = 2;
      UnsignedInteger<>.init<A>(_:)();
      v186 = *(_DWORD *)(v1 + 1656);
      v189 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v188, v187))
      {
        v179 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v178 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v180 = createStorage<A>(capacity:type:)(0);
        v181 = createStorage<A>(capacity:type:)(0);
        *(_QWORD *)(v1 + 1000) = v179;
        *(_QWORD *)(v1 + 1008) = v180;
        *(_QWORD *)(v1 + 1016) = v181;
        serialize(_:at:)(0, (_BYTE **)(v1 + 1000));
        serialize(_:at:)(0, (_BYTE **)(v1 + 1000));
        *(_QWORD *)(v1 + 1024) = v189;
        v182 = (_QWORD *)swift_task_alloc();
        v182[2] = v1 + 1000;
        v182[3] = v1 + 1008;
        v182[4] = v1 + 1016;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_24749F000, v188, v187, "Quantity validation failed - systolic blood pressure value outside valid bounds.", v179, v186);
        destroyStorage<A>(_:count:)(v180, 0, v178);
        destroyStorage<A>(_:count:)(v181, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v179, MEMORY[0x24BEE4260]);
      }
      swift_bridgeObjectRelease();
      v168 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
      v166 = *(_QWORD *)(v1 + 1376);
      v167 = *(_QWORD *)(v1 + 1296);
      v171 = *(_QWORD *)(v1 + 1288);
      v170 = *(_QWORD *)(v1 + 1280);
      v169 = *(_QWORD *)(v1 + 1256);
      v172 = *(_QWORD *)(v1 + 1248);
      v174 = *(id *)(v1 + 1496);
      v175 = *(id *)(v1 + 1488);
      v176 = *(id *)(v1 + 1480);

      v168(v166, v167);
      type metadata accessor for LogBloodPressureIntentResponse();
      v177 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      v173 = *(void (**)(uint64_t, uint64_t))(v169 + 8);
      v173(v170, v172);
      v173(v171, v172);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      v228 = v177;
      goto LABEL_53;
    }
    v161 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    v30 = *(_QWORD *)(v1 + 1368);
    v160 = *(_QWORD *)(v1 + 1296);
    v159 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v161(v30, v159, v160);
    swift_endAccess();
    v164 = Logger.logObject.getter();
    v163 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 712) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v162 = *(_DWORD *)(v1 + 1632);
    v165 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v164, v163))
    {
      v155 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v154 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v156 = createStorage<A>(capacity:type:)(0);
      v157 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 960) = v155;
      *(_QWORD *)(v1 + 968) = v156;
      *(_QWORD *)(v1 + 976) = v157;
      serialize(_:at:)(0, (_BYTE **)(v1 + 960));
      serialize(_:at:)(0, (_BYTE **)(v1 + 960));
      *(_QWORD *)(v1 + 984) = v165;
      v158 = (_QWORD *)swift_task_alloc();
      v158[2] = v1 + 960;
      v158[3] = v1 + 968;
      v158[4] = v1 + 976;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v164, v163, "Creating HKQuantity for Diastolic.", v155, v162);
      destroyStorage<A>(_:count:)(v156, 0, v154);
      destroyStorage<A>(_:count:)(v157, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v155, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v142 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
    v140 = *(_QWORD *)(v1 + 1368);
    v141 = *(_QWORD *)(v1 + 1296);
    v144 = *(_QWORD *)(v1 + 1288);
    v145 = *(_QWORD *)(v1 + 1280);
    v147 = *(_QWORD *)(v1 + 1272);
    v148 = *(_QWORD *)(v1 + 1264);
    v146 = *(_QWORD *)(v1 + 1248);
    v143 = *(double *)(v1 + 1216);
    v149 = *(void **)(v1 + 1488);

    v142(v140, v141);
    v31 = v264;
    v151 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v264, v143);
    *(_QWORD *)(v1 + 1560) = v151;
    *(_QWORD *)(v1 + 720) = v151;
    v32 = v149;
    v33 = v151;
    v213(v147, v144, v146);
    v213(v148, v145, v146);
    v150 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v149, v151, v147, v148);
    *(_QWORD *)(v1 + 1568) = v150;
    *(_QWORD *)(v1 + 728) = v150;
    v152 = (NSString *)*MEMORY[0x24BDD33A0];
    v34 = (id)*MEMORY[0x24BDD33A0];
    v153 = validateQuantity(identifier:quantity:)(v152, (HKQuantity)v151);

    if (!v153)
    {
      v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      v35 = *(_QWORD *)(v1 + 1360);
      v134 = *(_QWORD *)(v1 + 1296);
      v133 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v135(v35, v133, v134);
      swift_endAccess();
      v138 = Logger.logObject.getter();
      v137 = static os_log_type_t.error.getter();
      *(_QWORD *)(v1 + 920) = 2;
      UnsignedInteger<>.init<A>(_:)();
      v136 = *(_DWORD *)(v1 + 1652);
      v139 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v138, v137))
      {
        v129 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v128 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v130 = createStorage<A>(capacity:type:)(0);
        v131 = createStorage<A>(capacity:type:)(0);
        *(_QWORD *)(v1 + 928) = v129;
        *(_QWORD *)(v1 + 936) = v130;
        *(_QWORD *)(v1 + 944) = v131;
        serialize(_:at:)(0, (_BYTE **)(v1 + 928));
        serialize(_:at:)(0, (_BYTE **)(v1 + 928));
        *(_QWORD *)(v1 + 952) = v139;
        v132 = (_QWORD *)swift_task_alloc();
        v132[2] = v1 + 928;
        v132[3] = v1 + 936;
        v132[4] = v1 + 944;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_24749F000, v138, v137, "Quantity validation failed - diastolic blood pressure value outside valid bounds.", v129, v136);
        destroyStorage<A>(_:count:)(v130, 0, v128);
        destroyStorage<A>(_:count:)(v131, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v129, MEMORY[0x24BEE4260]);
      }
      swift_bridgeObjectRelease();
      v118 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
      v116 = *(_QWORD *)(v1 + 1360);
      v117 = *(_QWORD *)(v1 + 1296);
      v121 = *(_QWORD *)(v1 + 1288);
      v120 = *(_QWORD *)(v1 + 1280);
      v119 = *(_QWORD *)(v1 + 1256);
      v122 = *(_QWORD *)(v1 + 1248);
      v124 = *(id *)(v1 + 1496);
      v125 = *(id *)(v1 + 1488);
      v126 = *(id *)(v1 + 1480);

      v118(v116, v117);
      type metadata accessor for LogBloodPressureIntentResponse();
      v127 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      v123 = *(void (**)(uint64_t, uint64_t))(v119 + 8);
      v123(v120, v122);
      v123(v121, v122);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      v228 = v127;
      goto LABEL_53;
    }
    v111 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    v36 = *(_QWORD *)(v1 + 1352);
    v110 = *(_QWORD *)(v1 + 1296);
    v109 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v111(v36, v109, v110);
    swift_endAccess();
    v114 = Logger.logObject.getter();
    v113 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 736) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v112 = *(_DWORD *)(v1 + 1636);
    v115 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v114, v113))
    {
      v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v106 = createStorage<A>(capacity:type:)(0);
      v107 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 888) = v105;
      *(_QWORD *)(v1 + 896) = v106;
      *(_QWORD *)(v1 + 904) = v107;
      serialize(_:at:)(0, (_BYTE **)(v1 + 888));
      serialize(_:at:)(0, (_BYTE **)(v1 + 888));
      *(_QWORD *)(v1 + 912) = v115;
      v108 = (_QWORD *)swift_task_alloc();
      v108[2] = v1 + 888;
      v108[3] = v1 + 896;
      v108[4] = v1 + 904;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v114, v113, "Creating HKCorrelation.", v105, v112);
      destroyStorage<A>(_:count:)(v106, 0, v104);
      destroyStorage<A>(_:count:)(v107, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v105, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v86 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
    v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    v85 = *(_QWORD *)(v1 + 1352);
    v95 = *(_QWORD *)(v1 + 1344);
    v98 = *(_QWORD *)(v1 + 1296);
    v88 = *(_QWORD *)(v1 + 1288);
    v89 = *(_QWORD *)(v1 + 1280);
    v92 = *(_QWORD *)(v1 + 1272);
    v93 = *(_QWORD *)(v1 + 1264);
    v90 = *(_QWORD *)(v1 + 1248);
    v91 = *(void **)(v1 + 1496);

    v86(v85, v98);
    type metadata accessor for HKSample();
    _allocateUninitializedArray<A>(_:)();
    v87 = v37;
    v38 = v200;
    *v87 = v200;
    v39 = v150;
    v87[1] = v150;
    _finalizeUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type HKSample and conformance NSObject();
    v94 = Set.init(arrayLiteral:)();
    *(_QWORD *)(v1 + 1576) = v94;
    *(_QWORD *)(v1 + 744) = v94;
    type metadata accessor for HKCorrelation();
    v40 = v91;
    v213(v92, v88, v90);
    v213(v93, v89, v90);
    swift_bridgeObjectRetain();
    v96 = @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(v91, v92, v93);
    *(_QWORD *)(v1 + 1584) = v96;
    *(_QWORD *)(v1 + 752) = v96;
    v97 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v99(v95, v97, v98);
    swift_endAccess();
    v102 = Logger.logObject.getter();
    v101 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 760) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v100 = *(_DWORD *)(v1 + 1640);
    v103 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v102, v101))
    {
      v81 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v82 = createStorage<A>(capacity:type:)(0);
      v83 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 856) = v81;
      *(_QWORD *)(v1 + 864) = v82;
      *(_QWORD *)(v1 + 872) = v83;
      serialize(_:at:)(0, (_BYTE **)(v1 + 856));
      serialize(_:at:)(0, (_BYTE **)(v1 + 856));
      *(_QWORD *)(v1 + 880) = v103;
      v84 = (_QWORD *)swift_task_alloc();
      v84[2] = v1 + 856;
      v84[3] = v1 + 864;
      v84[4] = v1 + 872;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v102, v101, "Trying to save to store.", v81, v100);
      destroyStorage<A>(_:count:)(v82, 0, v80);
      destroyStorage<A>(_:count:)(v83, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v81, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 1592) = 0;
    v78 = *(void (**)(uint64_t, uint64_t))(v1 + 1472);
    v76 = *(_QWORD *)(v1 + 1344);
    v77 = *(_QWORD *)(v1 + 1296);
    v79 = *(id *)(v1 + 1240);

    v78(v76, v77);
    v41 = v79;
    *(_QWORD *)(v1 + 16) = *(_QWORD *)(v1 + 512);
    *(_QWORD *)(v1 + 56) = v229;
    *(_QWORD *)(v1 + 24) = BloodPressurePersistor.save(systolic:diastolic:units:);
    *(_QWORD *)(v1 + 112) = swift_continuation_init();
    *(_QWORD *)(v1 + 80) = MEMORY[0x24BDAC760];
    *(_DWORD *)(v1 + 88) = 0x40000000;
    *(_DWORD *)(v1 + 92) = 0;
    *(_QWORD *)(v1 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
    *(_QWORD *)(v1 + 104) = &block_descriptor_12;
    objc_msgSend(v79, sel_saveObject_withCompletion_, v96, v1 + 80);
    return __swift_continuation_await_point(v1 + 16);
  }
  else
  {
    v12 = *(_QWORD *)(v1 + 1408);
    v278 = *(_QWORD *)(v1 + 1296);
    v277 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v325(v12, v277, v278);
    swift_endAccess();
    log = Logger.logObject.getter();
    v280 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v1 + 624) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v279 = *(_DWORD *)(v1 + 1616);
    v282 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v280))
    {
      v273 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v272 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v274 = createStorage<A>(capacity:type:)(0);
      v275 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v1 + 1104) = v273;
      *(_QWORD *)(v1 + 1112) = v274;
      *(_QWORD *)(v1 + 1120) = v275;
      serialize(_:at:)(0, (_BYTE **)(v1 + 1104));
      serialize(_:at:)(0, (_BYTE **)(v1 + 1104));
      *(_QWORD *)(v1 + 1128) = v282;
      v276 = (_QWORD *)swift_task_alloc();
      v276[2] = v1 + 1104;
      v276[3] = v1 + 1112;
      v276[4] = v1 + 1120;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, log, v280, "Using preferred unit.", v273, v279);
      destroyStorage<A>(_:count:)(v274, 0, v272);
      destroyStorage<A>(_:count:)(v275, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v273, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 1504) = 0;
    v270 = *(_QWORD *)(v1 + 1408);
    v271 = *(_QWORD *)(v1 + 1296);

    v313(v270, v271);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 1512) = v13;
    *v13 = *(_QWORD *)(v1 + 512);
    v13[1] = BloodPressurePersistor.save(systolic:diastolic:units:);
    return BloodPressurePersistor.preferredUnit()(*(_QWORD *)(v1 + 1240));
  }
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 512) = *v1;
  *(_QWORD *)(v3 + 1520) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  id v35;
  id v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint32_t v47;
  os_log_type_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  uint32_t v76;
  os_log_type_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t, uint64_t);
  uint32_t v89;
  os_log_type_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  id v101;
  id v102;
  id v103;
  char *v104;
  uint64_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t, uint64_t);
  uint32_t v113;
  os_log_type_t v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  NSString *v129;
  Swift::Bool v130;
  uint64_t v131;
  uint64_t v132;
  uint8_t *v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  void (*v139)(uint64_t, uint64_t, uint64_t);
  uint32_t v140;
  os_log_type_t v141;
  NSObject *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(uint64_t, uint64_t);
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void (*v151)(uint64_t, uint64_t);
  id v152;
  id v153;
  id v154;
  char *v155;
  uint64_t v156;
  uint8_t *v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  void (*v163)(uint64_t, uint64_t, uint64_t);
  uint32_t v164;
  os_log_type_t v165;
  NSObject *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void (*v170)(uint64_t, uint64_t);
  double v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id v178;
  id v179;
  NSString *identifier;
  Swift::Bool v181;
  uint64_t v182;
  uint64_t v183;
  uint8_t *v184;
  uint64_t v185;
  uint64_t v186;
  _QWORD *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void (*v192)(uint64_t, uint64_t, uint64_t);
  uint64_t v193;
  uint64_t v194;
  void (*v195)(uint64_t, uint64_t, uint64_t);
  uint32_t v196;
  os_log_type_t v197;
  NSObject *log;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void (*v202)(uint64_t, uint64_t);
  id v203;
  id v204;
  id v205;
  char *v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  uint8_t *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void (*v215)(uint64_t, uint64_t, uint64_t);
  void *v216;
  void *v217;
  uint32_t size;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
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
  _QWORD *v234;
  NSObject *oslog;
  os_log_type_t v236;
  unsigned int v237;
  id v238;
  unsigned __int8 v239;
  uint64_t v240;
  uint64_t v241;
  void (*v242)(uint64_t, uint64_t);
  void *v243;
  uint64_t v244;
  uint64_t v245;
  uint8_t *buf;
  uint64_t v247;
  uint64_t v248;
  _QWORD *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void (*v254)(uint64_t, uint64_t, uint64_t);
  uint32_t v255;
  os_log_type_t v256;
  NSObject *v257;
  uint64_t v258;
  uint8_t *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t (*v262)(uint64_t, uint64_t, uint64_t);
  uint64_t v263;

  v1 = *(_QWORD *)(v0 + 1520);
  *(_QWORD *)(v0 + 512) = v0;
  *(_QWORD *)(v0 + 616) = v1;
  v251 = *(_QWORD *)(v0 + 1504);
  v254 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  v2 = *(_QWORD *)(v0 + 1400);
  v253 = *(_QWORD *)(v0 + 1296);
  v252 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v254(v2, v252, v253);
  swift_endAccess();
  v257 = Logger.logObject.getter();
  v256 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 632) = 2;
  UnsignedInteger<>.init<A>(_:)();
  v255 = *(_DWORD *)(v0 + 1620);
  v258 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v257, v256))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v245 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v247 = createStorage<A>(capacity:type:)(0);
    v248 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v250 + 1072) = buf;
    *(_QWORD *)(v250 + 1080) = v247;
    *(_QWORD *)(v250 + 1088) = v248;
    serialize(_:at:)(0, (_BYTE **)(v250 + 1072));
    serialize(_:at:)(0, (_BYTE **)(v250 + 1072));
    *(_QWORD *)(v250 + 1096) = v258;
    v249 = (_QWORD *)swift_task_alloc();
    v249[2] = v250 + 1072;
    v249[3] = v250 + 1080;
    v249[4] = v250 + 1088;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    result = Sequence.forEach(_:)();
    if (v251)
      return result;
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v257, v256, "Starting to convert optional HKUnit to non-optional HKUnit.", buf, v255);
    destroyStorage<A>(_:count:)(v247, 0, v245);
    destroyStorage<A>(_:count:)(v248, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
    v244 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v244 = v251;
  }
  v242 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
  v240 = *(_QWORD *)(v250 + 1400);
  v241 = *(_QWORD *)(v250 + 1296);

  v242(v240, v241);
  v243 = *(void **)(v250 + 616);
  *(_QWORD *)(v250 + 1528) = v243;
  v4 = v243;
  if (!v243)
  {
    v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
    v31 = *(_QWORD *)(v250 + 1328);
    v45 = *(_QWORD *)(v250 + 1296);
    v44 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v46(v31, v44, v45);
    swift_endAccess();
    v49 = Logger.logObject.getter();
    v48 = static os_log_type_t.error.getter();
    *(_QWORD *)(v250 + 640) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v47 = *(_DWORD *)(v250 + 1624);
    v50 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v49, v48))
    {
      v40 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v41 = createStorage<A>(capacity:type:)(0);
      v42 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v250 + 648) = v40;
      *(_QWORD *)(v250 + 656) = v41;
      *(_QWORD *)(v250 + 664) = v42;
      serialize(_:at:)(0, (_BYTE **)(v250 + 648));
      serialize(_:at:)(0, (_BYTE **)(v250 + 648));
      *(_QWORD *)(v250 + 672) = v50;
      v43 = (_QWORD *)swift_task_alloc();
      v43[2] = v250 + 648;
      v43[3] = v250 + 656;
      v43[4] = v250 + 664;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v244)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v49, v48, "Could not create an HKUnit.", v40, v47);
      destroyStorage<A>(_:count:)(v41, 0, v39);
      destroyStorage<A>(_:count:)(v42, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v40, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v34 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v32 = *(_QWORD *)(v250 + 1328);
    v33 = *(_QWORD *)(v250 + 1296);
    v35 = *(id *)(v250 + 1496);
    v36 = *(id *)(v250 + 1488);
    v37 = *(id *)(v250 + 1480);

    v34(v32, v33);
    type metadata accessor for LogBloodPressureIntentResponse();
    v38 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    outlined destroy of HealthKitPersistor((id *)(v250 + 616));

    v207 = v38;
    goto LABEL_58;
  }
  v5 = *(void **)(v250 + 1480);
  v238 = *(id *)(v250 + 1488);
  *(_QWORD *)(v250 + 680) = v243;
  v239 = objc_msgSend(v5, sel_isCompatibleWithUnit_);
  v6 = v238;
  v7 = v243;
  if ((v239 & 1) != 0)
    v237 = objc_msgSend(*(id *)(v250 + 1488), sel_isCompatibleWithUnit_, v243) ^ 1;
  else
    LOBYTE(v237) = 1;

  if ((v237 & 1) == 0)
  {
    v195 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
    v13 = *(_QWORD *)(v250 + 1384);
    v194 = *(_QWORD *)(v250 + 1296);
    v190 = *(_QWORD *)(v250 + 1288);
    v189 = *(_QWORD *)(v250 + 1280);
    v188 = *(_QWORD *)(v250 + 1256);
    v191 = *(_QWORD *)(v250 + 1248);
    Date.init()();
    v192 = *(void (**)(uint64_t, uint64_t, uint64_t))(v188 + 16);
    *(_QWORD *)(v250 + 1536) = v192;
    v192(v189, v190, v191);
    v193 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v195(v13, v193, v194);
    swift_endAccess();
    log = Logger.logObject.getter();
    v197 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v250 + 688) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v196 = *(_DWORD *)(v250 + 1628);
    v199 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v197))
    {
      v184 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v183 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v185 = createStorage<A>(capacity:type:)(0);
      v186 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v250 + 1032) = v184;
      *(_QWORD *)(v250 + 1040) = v185;
      *(_QWORD *)(v250 + 1048) = v186;
      serialize(_:at:)(0, (_BYTE **)(v250 + 1032));
      serialize(_:at:)(0, (_BYTE **)(v250 + 1032));
      *(_QWORD *)(v250 + 1056) = v199;
      v187 = (_QWORD *)swift_task_alloc();
      v187[2] = v250 + 1032;
      v187[3] = v250 + 1040;
      v187[4] = v250 + 1048;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v244)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, log, v197, "Creating HKQuantity for Systolic.", v184, v196);
      destroyStorage<A>(_:count:)(v185, 0, v183);
      destroyStorage<A>(_:count:)(v186, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v184, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
      v182 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      v182 = v244;
    }
    v170 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v168 = *(_QWORD *)(v250 + 1384);
    v169 = *(_QWORD *)(v250 + 1296);
    v172 = *(_QWORD *)(v250 + 1288);
    v173 = *(_QWORD *)(v250 + 1280);
    v175 = *(_QWORD *)(v250 + 1272);
    v176 = *(_QWORD *)(v250 + 1264);
    v174 = *(_QWORD *)(v250 + 1248);
    v171 = *(double *)(v250 + 1208);
    v177 = *(void **)(v250 + 1480);

    v170(v168, v169);
    type metadata accessor for HKQuantity();
    v14 = v243;
    v179 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v243, v171);
    *(_QWORD *)(v250 + 1544) = v179;
    *(_QWORD *)(v250 + 696) = v179;
    type metadata accessor for HKQuantitySample();
    v15 = v177;
    v16 = v179;
    v192(v175, v172, v174);
    v192(v176, v173, v174);
    v178 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v177, v179, v175, v176);
    *(_QWORD *)(v250 + 1552) = v178;
    *(_QWORD *)(v250 + 704) = v178;
    identifier = (NSString *)*MEMORY[0x24BDD33A8];
    v17 = (id)*MEMORY[0x24BDD33A8];
    v181 = validateQuantity(identifier:quantity:)(identifier, (HKQuantity)v179);

    if (!v181)
    {
      v163 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
      v18 = *(_QWORD *)(v250 + 1376);
      v162 = *(_QWORD *)(v250 + 1296);
      v161 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v163(v18, v161, v162);
      swift_endAccess();
      v166 = Logger.logObject.getter();
      v165 = static os_log_type_t.error.getter();
      *(_QWORD *)(v250 + 992) = 2;
      UnsignedInteger<>.init<A>(_:)();
      v164 = *(_DWORD *)(v250 + 1656);
      v167 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v166, v165))
      {
        v157 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v158 = createStorage<A>(capacity:type:)(0);
        v159 = createStorage<A>(capacity:type:)(0);
        *(_QWORD *)(v250 + 1000) = v157;
        *(_QWORD *)(v250 + 1008) = v158;
        *(_QWORD *)(v250 + 1016) = v159;
        serialize(_:at:)(0, (_BYTE **)(v250 + 1000));
        serialize(_:at:)(0, (_BYTE **)(v250 + 1000));
        *(_QWORD *)(v250 + 1024) = v167;
        v160 = (_QWORD *)swift_task_alloc();
        v160[2] = v250 + 1000;
        v160[3] = v250 + 1008;
        v160[4] = v250 + 1016;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        result = Sequence.forEach(_:)();
        if (v182)
          return result;
        swift_task_dealloc();
        _os_log_impl(&dword_24749F000, v166, v165, "Quantity validation failed - systolic blood pressure value outside valid bounds.", v157, v164);
        destroyStorage<A>(_:count:)(v158, 0, v156);
        destroyStorage<A>(_:count:)(v159, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v157, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v146 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
      v144 = *(_QWORD *)(v250 + 1376);
      v145 = *(_QWORD *)(v250 + 1296);
      v149 = *(_QWORD *)(v250 + 1288);
      v148 = *(_QWORD *)(v250 + 1280);
      v147 = *(_QWORD *)(v250 + 1256);
      v150 = *(_QWORD *)(v250 + 1248);
      v152 = *(id *)(v250 + 1496);
      v153 = *(id *)(v250 + 1488);
      v154 = *(id *)(v250 + 1480);

      v146(v144, v145);
      type metadata accessor for LogBloodPressureIntentResponse();
      v155 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      v151 = *(void (**)(uint64_t, uint64_t))(v147 + 8);
      v151(v148, v150);
      v151(v149, v150);

      outlined destroy of HealthKitPersistor((id *)(v250 + 616));
      v207 = v155;
      goto LABEL_58;
    }
    v139 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
    v19 = *(_QWORD *)(v250 + 1368);
    v138 = *(_QWORD *)(v250 + 1296);
    v137 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v139(v19, v137, v138);
    swift_endAccess();
    v142 = Logger.logObject.getter();
    v141 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v250 + 712) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v140 = *(_DWORD *)(v250 + 1632);
    v143 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v142, v141))
    {
      v133 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v132 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v134 = createStorage<A>(capacity:type:)(0);
      v135 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v250 + 960) = v133;
      *(_QWORD *)(v250 + 968) = v134;
      *(_QWORD *)(v250 + 976) = v135;
      serialize(_:at:)(0, (_BYTE **)(v250 + 960));
      serialize(_:at:)(0, (_BYTE **)(v250 + 960));
      *(_QWORD *)(v250 + 984) = v143;
      v136 = (_QWORD *)swift_task_alloc();
      v136[2] = v250 + 960;
      v136[3] = v250 + 968;
      v136[4] = v250 + 976;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v182)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v142, v141, "Creating HKQuantity for Diastolic.", v133, v140);
      destroyStorage<A>(_:count:)(v134, 0, v132);
      destroyStorage<A>(_:count:)(v135, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v133, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
      v131 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      v131 = v182;
    }
    v119 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v117 = *(_QWORD *)(v250 + 1368);
    v118 = *(_QWORD *)(v250 + 1296);
    v121 = *(_QWORD *)(v250 + 1288);
    v122 = *(_QWORD *)(v250 + 1280);
    v124 = *(_QWORD *)(v250 + 1272);
    v125 = *(_QWORD *)(v250 + 1264);
    v123 = *(_QWORD *)(v250 + 1248);
    v120 = *(double *)(v250 + 1216);
    v126 = *(void **)(v250 + 1488);

    v119(v117, v118);
    v20 = v243;
    v128 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v243, v120);
    *(_QWORD *)(v250 + 1560) = v128;
    *(_QWORD *)(v250 + 720) = v128;
    v21 = v126;
    v22 = v128;
    v192(v124, v121, v123);
    v192(v125, v122, v123);
    v127 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v126, v128, v124, v125);
    *(_QWORD *)(v250 + 1568) = v127;
    *(_QWORD *)(v250 + 728) = v127;
    v129 = (NSString *)*MEMORY[0x24BDD33A0];
    v23 = (id)*MEMORY[0x24BDD33A0];
    v130 = validateQuantity(identifier:quantity:)(v129, (HKQuantity)v128);

    if (!v130)
    {
      v112 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
      v24 = *(_QWORD *)(v250 + 1360);
      v111 = *(_QWORD *)(v250 + 1296);
      v110 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v112(v24, v110, v111);
      swift_endAccess();
      v115 = Logger.logObject.getter();
      v114 = static os_log_type_t.error.getter();
      *(_QWORD *)(v250 + 920) = 2;
      UnsignedInteger<>.init<A>(_:)();
      v113 = *(_DWORD *)(v250 + 1652);
      v116 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v115, v114))
      {
        v106 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v105 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v107 = createStorage<A>(capacity:type:)(0);
        v108 = createStorage<A>(capacity:type:)(0);
        *(_QWORD *)(v250 + 928) = v106;
        *(_QWORD *)(v250 + 936) = v107;
        *(_QWORD *)(v250 + 944) = v108;
        serialize(_:at:)(0, (_BYTE **)(v250 + 928));
        serialize(_:at:)(0, (_BYTE **)(v250 + 928));
        *(_QWORD *)(v250 + 952) = v116;
        v109 = (_QWORD *)swift_task_alloc();
        v109[2] = v250 + 928;
        v109[3] = v250 + 936;
        v109[4] = v250 + 944;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        result = Sequence.forEach(_:)();
        if (v131)
          return result;
        swift_task_dealloc();
        _os_log_impl(&dword_24749F000, v115, v114, "Quantity validation failed - diastolic blood pressure value outside valid bounds.", v106, v113);
        destroyStorage<A>(_:count:)(v107, 0, v105);
        destroyStorage<A>(_:count:)(v108, 0, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v106, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v95 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
      v93 = *(_QWORD *)(v250 + 1360);
      v94 = *(_QWORD *)(v250 + 1296);
      v98 = *(_QWORD *)(v250 + 1288);
      v97 = *(_QWORD *)(v250 + 1280);
      v96 = *(_QWORD *)(v250 + 1256);
      v99 = *(_QWORD *)(v250 + 1248);
      v101 = *(id *)(v250 + 1496);
      v102 = *(id *)(v250 + 1488);
      v103 = *(id *)(v250 + 1480);

      v95(v93, v94);
      type metadata accessor for LogBloodPressureIntentResponse();
      v104 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      v100 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
      v100(v97, v99);
      v100(v98, v99);

      outlined destroy of HealthKitPersistor((id *)(v250 + 616));
      v207 = v104;
      goto LABEL_58;
    }
    v88 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
    v25 = *(_QWORD *)(v250 + 1352);
    v87 = *(_QWORD *)(v250 + 1296);
    v86 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v88(v25, v86, v87);
    swift_endAccess();
    v91 = Logger.logObject.getter();
    v90 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v250 + 736) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v89 = *(_DWORD *)(v250 + 1636);
    v92 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v91, v90))
    {
      v82 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v83 = createStorage<A>(capacity:type:)(0);
      v84 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v250 + 888) = v82;
      *(_QWORD *)(v250 + 896) = v83;
      *(_QWORD *)(v250 + 904) = v84;
      serialize(_:at:)(0, (_BYTE **)(v250 + 888));
      serialize(_:at:)(0, (_BYTE **)(v250 + 888));
      *(_QWORD *)(v250 + 912) = v92;
      v85 = (_QWORD *)swift_task_alloc();
      v85[2] = v250 + 888;
      v85[3] = v250 + 896;
      v85[4] = v250 + 904;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v131)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v91, v90, "Creating HKCorrelation.", v82, v89);
      destroyStorage<A>(_:count:)(v83, 0, v81);
      destroyStorage<A>(_:count:)(v84, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v82, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
      v80 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      v80 = v131;
    }
    v62 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
    v61 = *(_QWORD *)(v250 + 1352);
    v71 = *(_QWORD *)(v250 + 1344);
    v74 = *(_QWORD *)(v250 + 1296);
    v64 = *(_QWORD *)(v250 + 1288);
    v65 = *(_QWORD *)(v250 + 1280);
    v68 = *(_QWORD *)(v250 + 1272);
    v69 = *(_QWORD *)(v250 + 1264);
    v66 = *(_QWORD *)(v250 + 1248);
    v67 = *(void **)(v250 + 1496);

    v62(v61, v74);
    type metadata accessor for HKSample();
    _allocateUninitializedArray<A>(_:)();
    v63 = v26;
    v27 = v178;
    *v63 = v178;
    v28 = v127;
    v63[1] = v127;
    _finalizeUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type HKSample and conformance NSObject();
    v70 = Set.init(arrayLiteral:)();
    *(_QWORD *)(v250 + 1576) = v70;
    *(_QWORD *)(v250 + 744) = v70;
    type metadata accessor for HKCorrelation();
    v29 = v67;
    v192(v68, v64, v66);
    v192(v69, v65, v66);
    swift_bridgeObjectRetain();
    v72 = @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(v67, v68, v69);
    *(_QWORD *)(v250 + 1584) = v72;
    *(_QWORD *)(v250 + 752) = v72;
    v73 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v75(v71, v73, v74);
    swift_endAccess();
    v78 = Logger.logObject.getter();
    v77 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v250 + 760) = 2;
    UnsignedInteger<>.init<A>(_:)();
    v76 = *(_DWORD *)(v250 + 1640);
    v79 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v78, v77))
    {
      v57 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v58 = createStorage<A>(capacity:type:)(0);
      v59 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v250 + 856) = v57;
      *(_QWORD *)(v250 + 864) = v58;
      *(_QWORD *)(v250 + 872) = v59;
      serialize(_:at:)(0, (_BYTE **)(v250 + 856));
      serialize(_:at:)(0, (_BYTE **)(v250 + 856));
      *(_QWORD *)(v250 + 880) = v79;
      v60 = (_QWORD *)swift_task_alloc();
      v60[2] = v250 + 856;
      v60[3] = v250 + 864;
      v60[4] = v250 + 872;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      result = Sequence.forEach(_:)();
      if (v80)
        return result;
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v78, v77, "Trying to save to store.", v57, v76);
      destroyStorage<A>(_:count:)(v58, 0, v56);
      destroyStorage<A>(_:count:)(v59, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v57, MEMORY[0x24BEE4260]);
      swift_bridgeObjectRelease();
      v55 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      v55 = v80;
    }
    *(_QWORD *)(v250 + 1592) = v55;
    v53 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v51 = *(_QWORD *)(v250 + 1344);
    v52 = *(_QWORD *)(v250 + 1296);
    v54 = *(id *)(v250 + 1240);

    v53(v51, v52);
    v30 = v54;
    *(_QWORD *)(v250 + 16) = *(_QWORD *)(v250 + 512);
    *(_QWORD *)(v250 + 56) = v208;
    *(_QWORD *)(v250 + 24) = BloodPressurePersistor.save(systolic:diastolic:units:);
    *(_QWORD *)(v250 + 112) = swift_continuation_init();
    *(_QWORD *)(v250 + 80) = MEMORY[0x24BDAC760];
    *(_DWORD *)(v250 + 88) = 0x40000000;
    *(_DWORD *)(v250 + 92) = 0;
    *(_QWORD *)(v250 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
    *(_QWORD *)(v250 + 104) = &block_descriptor_12;
    objc_msgSend(v54, sel_saveObject_withCompletion_, v72, v250 + 80);
    return __swift_continuation_await_point(v250 + 16);
  }
  v215 = *(void (**)(uint64_t, uint64_t, uint64_t))(v250 + 1432);
  v8 = *(_QWORD *)(v250 + 1392);
  v214 = *(_QWORD *)(v250 + 1296);
  v217 = *(void **)(v250 + 1488);
  v216 = *(void **)(v250 + 1480);
  v213 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v215(v8, v213, v214);
  swift_endAccess();
  v9 = v243;
  v219 = swift_allocObject();
  *(_QWORD *)(v219 + 16) = v243;
  v10 = v216;
  v221 = swift_allocObject();
  *(_QWORD *)(v221 + 16) = v216;
  v11 = v217;
  v223 = swift_allocObject();
  *(_QWORD *)(v223 + 16) = v217;
  oslog = Logger.logObject.getter();
  v236 = static os_log_type_t.error.getter();
  *(_QWORD *)(v250 + 1064) = 32;
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v250 + 1660);
  v225 = swift_allocObject();
  *(_BYTE *)(v225 + 16) = 64;
  v226 = swift_allocObject();
  *(_BYTE *)(v226 + 16) = 8;
  v220 = swift_allocObject();
  *(_QWORD *)(v220 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
  *(_QWORD *)(v220 + 24) = v219;
  v227 = swift_allocObject();
  *(_QWORD *)(v227 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v227 + 24) = v220;
  v228 = swift_allocObject();
  *(_BYTE *)(v228 + 16) = 64;
  v229 = swift_allocObject();
  *(_BYTE *)(v229 + 16) = 8;
  v222 = swift_allocObject();
  *(_QWORD *)(v222 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
  *(_QWORD *)(v222 + 24) = v221;
  v230 = swift_allocObject();
  *(_QWORD *)(v230 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v230 + 24) = v222;
  v231 = swift_allocObject();
  *(_BYTE *)(v231 + 16) = 64;
  v232 = swift_allocObject();
  *(_BYTE *)(v232 + 16) = 8;
  v224 = swift_allocObject();
  *(_QWORD *)(v224 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
  *(_QWORD *)(v224 + 24) = v223;
  v233 = swift_allocObject();
  *(_QWORD *)(v233 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v233 + 24) = v224;
  _allocateUninitializedArray<A>(_:)();
  v234 = v12;
  swift_retain();
  *v234 = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[1] = v225;
  swift_retain();
  v234[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[3] = v226;
  swift_retain();
  v234[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[5] = v227;
  swift_retain();
  v234[6] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[7] = v228;
  swift_retain();
  v234[8] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[9] = v229;
  swift_retain();
  v234[10] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[11] = v230;
  swift_retain();
  v234[12] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[13] = v231;
  swift_retain();
  v234[14] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[15] = v232;
  swift_retain();
  v234[16] = partial apply for closure #1 in OSLogArguments.append(_:);
  v234[17] = v233;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(oslog, v236))
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_16;
  }
  v210 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v209 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v211 = createStorage<A>(capacity:type:)(3);
  v212 = createStorage<A>(capacity:type:)(0);
  v259 = v210;
  v260 = v211;
  v261 = v212;
  serialize(_:at:)(2, &v259);
  serialize(_:at:)(3, &v259);
  v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v263 = v225;
  result = closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
  if (!v244)
  {
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v226;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v227;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v228;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v229;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v230;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v231;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v232;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    v262 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v263 = v233;
    closure #1 in osLogInternal(_:log:type:)(&v262, (uint64_t)&v259, (uint64_t)&v260, (uint64_t)&v261);
    _os_log_impl(&dword_24749F000, oslog, v236, "%@ is incompatible with %@ or %@.", v210, size);
    destroyStorage<A>(_:count:)(v211, 3, v209);
    destroyStorage<A>(_:count:)(v212, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](v210, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
LABEL_16:
    v202 = *(void (**)(uint64_t, uint64_t))(v250 + 1472);
    v200 = *(_QWORD *)(v250 + 1392);
    v201 = *(_QWORD *)(v250 + 1296);
    v203 = *(id *)(v250 + 1496);
    v204 = *(id *)(v250 + 1488);
    v205 = *(id *)(v250 + 1480);

    v202(v200, v201);
    type metadata accessor for LogBloodPressureIntentResponse();
    v206 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

    outlined destroy of HealthKitPersistor((id *)(v250 + 616));
    v207 = v206;
LABEL_58:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v250 + 512) + 8))(v207);
  }
  return result;
}

{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[64] = *v0;
  v1[200] = v1[6];
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  id v14;
  double v15;
  id v16;
  double v17;
  Swift::Double value;
  id store;
  id v20;
  uint64_t v21;
  Class isa;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  Class v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  id v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  uint64_t v40;
  uint8_t *buf;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint32_t v49;
  os_log_type_t v50;
  NSObject *v51;
  uint64_t v52;
  HKHealthStore_optional v53;
  Swift::Double_optional v54;

  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  v1 = *(_QWORD *)(v0 + 1336);
  v47 = *(_QWORD *)(v0 + 1296);
  v2 = *(void **)(v0 + 1240);
  *(_QWORD *)(v0 + 512) = v0;

  v46 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v48(v1, v46, v47);
  swift_endAccess();
  v51 = Logger.logObject.getter();
  v50 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 784) = 2;
  UnsignedInteger<>.init<A>(_:)();
  v49 = *(_DWORD *)(v0 + 1648);
  v52 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v51, v50))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v45 + 1592);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v42 = createStorage<A>(capacity:type:)(0);
  v43 = createStorage<A>(capacity:type:)(0);
  *(_QWORD *)(v45 + 824) = buf;
  *(_QWORD *)(v45 + 832) = v42;
  *(_QWORD *)(v45 + 840) = v43;
  serialize(_:at:)(0, (_BYTE **)(v45 + 824));
  serialize(_:at:)(0, (_BYTE **)(v45 + 824));
  *(_QWORD *)(v45 + 848) = v52;
  v44 = (_QWORD *)swift_task_alloc();
  v44[2] = v45 + 824;
  v44[3] = v45 + 832;
  v44[4] = v45 + 840;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v51, v50, "Getting intent response.", buf, v49);
    destroyStorage<A>(_:count:)(v42, 0, v40);
    destroyStorage<A>(_:count:)(v43, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_bridgeObjectRelease();
LABEL_6:
    v26 = *(id *)(v45 + 1584);
    v27 = *(id *)(v45 + 1568);
    v28 = *(id *)(v45 + 1560);
    v29 = *(id *)(v45 + 1552);
    v30 = *(id *)(v45 + 1544);
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 1536);
    v13 = *(void (**)(uint64_t, uint64_t))(v45 + 1472);
    v11 = *(_QWORD *)(v45 + 1336);
    v12 = *(_QWORD *)(v45 + 1296);
    v32 = *(_QWORD *)(v45 + 1288);
    v31 = *(_QWORD *)(v45 + 1280);
    v24 = *(_QWORD *)(v45 + 1272);
    v21 = *(_QWORD *)(v45 + 1256);
    v33 = *(_QWORD *)(v45 + 1248);
    store = *(id *)(v45 + 1240);
    v35 = *(id *)(v45 + 1528);
    v36 = *(id *)(v45 + 1496);
    v37 = *(id *)(v45 + 1488);
    v38 = *(id *)(v45 + 1480);

    v13(v11, v12);
    type metadata accessor for LogBloodPressureIntentResponse();
    v39 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(4, 0);
    *(_QWORD *)(v45 + 792) = v39;
    v14 = objc_msgSend(v29, (SEL)0x1F392E622);
    objc_msgSend(v14, (SEL)0x1F3F06C8ALL, v35);
    v15 = v5;

    objc_msgSend(v39, sel_setSystolic_, v15);
    v16 = objc_msgSend(v27, (SEL)0x1F392E622);
    objc_msgSend(v16, (SEL)0x1F3F06C8ALL, v35);
    v17 = v6;

    objc_msgSend(v39, sel_setDiastolic_, v17);
    objc_msgSend(v39, sel_systolic);
    *(_QWORD *)(v45 + 808) = v7;
    objc_msgSend(v39, sel_diastolic);
    *(_QWORD *)(v45 + 816) = v8;
    max<A>(_:_:)();
    value = *(double *)(v45 + 800);
    v9 = store;
    v54.value = value;
    v53.is_nil = (char)store;
    v54.is_nil = LOBYTE(value);
    v53.value.super.isa = 0;
    v10 = localizedUnitName(for:value:store:)((HKUnit)v35, v54, v53);

    v20 = (id)MEMORY[0x24957CFB4](v10._countAndFlagsBits, v10._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v39, sel_setUnit_, v20);

    v23(v24, v32, v33);
    isa = Date._bridgeToObjectiveC()().super.isa;
    v34 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v34(v24, v33);
    objc_msgSend(v39, sel_setSampleStart_, isa);

    v23(v24, v31, v33);
    v25 = Date._bridgeToObjectiveC()().super.isa;
    v34(v24, v33);
    objc_msgSend(v39, sel_setSampleEnd_, v25);

    swift_bridgeObjectRelease();
    v34(v31, v33);
    v34(v32, v33);

    outlined destroy of HealthKitPersistor((id *)(v45 + 616));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v45 + 512) + 8))(v39);
  }
  return result;
}

{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  id v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint8_t *buf;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  void *v34;
  uint32_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;

  v34 = *(void **)(v0 + 1600);
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  v29 = *(_QWORD *)(v0 + 1312);
  v32 = *(_QWORD *)(v0 + 1296);
  v30 = *(id *)(v0 + 1240);
  *(_QWORD *)(v0 + 512) = v0;
  swift_willThrow();

  v1 = v34;
  *(_QWORD *)(v0 + 768) = v34;
  v31 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v33(v29, v31, v32);
  swift_endAccess();
  v2 = v34;
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = v34;
  v42 = Logger.logObject.getter();
  v43 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 776) = 12;
  UnsignedInteger<>.init<A>(_:)();
  v35 = *(_DWORD *)(v0 + 1644);
  v38 = swift_allocObject();
  *(_BYTE *)(v38 + 16) = 32;
  v39 = swift_allocObject();
  *(_BYTE *)(v39 + 16) = 8;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(_QWORD *)(v37 + 24) = v36;
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v40 + 24) = v37;
  _allocateUninitializedArray<A>(_:)();
  v41 = v3;
  swift_retain();
  *v41 = partial apply for closure #1 in OSLogArguments.append(_:);
  v41[1] = v38;
  swift_retain();
  v41[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v41[3] = v39;
  swift_retain();
  v41[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v41[5] = v40;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v42, v43))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v26 = createStorage<A>(capacity:type:)(0);
    v27 = createStorage<A>(capacity:type:)(1);
    v44 = buf;
    v45 = v26;
    v46 = v27;
    serialize(_:at:)(2, &v44);
    serialize(_:at:)(1, &v44);
    v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v48 = v38;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v48 = v39;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v48 = v40;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    _os_log_impl(&dword_24749F000, v42, v43, "Failed to persist sample. Error: %s", buf, v35);
    destroyStorage<A>(_:count:)(v26, 0, v24);
    destroyStorage<A>(_:count:)(v27, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = *(id *)(v28 + 1600);
  v9 = *(id *)(v28 + 1584);
  v10 = *(id *)(v28 + 1568);
  v11 = *(id *)(v28 + 1560);
  v12 = *(id *)(v28 + 1552);
  v13 = *(id *)(v28 + 1544);
  v7 = *(void (**)(uint64_t, uint64_t))(v28 + 1472);
  v5 = *(_QWORD *)(v28 + 1312);
  v6 = *(_QWORD *)(v28 + 1296);
  v16 = *(_QWORD *)(v28 + 1288);
  v15 = *(_QWORD *)(v28 + 1280);
  v14 = *(_QWORD *)(v28 + 1256);
  v17 = *(_QWORD *)(v28 + 1248);
  v19 = *(id *)(v28 + 1528);
  v20 = *(id *)(v28 + 1496);
  v21 = *(id *)(v28 + 1488);
  v22 = *(id *)(v28 + 1480);

  v7(v5, v6);
  type metadata accessor for LogBloodPressureIntentResponse();
  v23 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  swift_bridgeObjectRelease();
  v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v18(v15, v17);
  v18(v16, v17);

  outlined destroy of HealthKitPersistor((id *)(v28 + 616));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(char *))(*(_QWORD *)(v28 + 512) + 8))(v23);
}

uint64_t BloodPressurePersistor.preferredUnit()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[35] = a1;
  v1[21] = v1;
  v1[22] = 0;
  v1[24] = 0;
  v1[26] = 0;
  v1[28] = 0;
  v2 = type metadata accessor for Logger();
  v1[36] = v2;
  v1[37] = *(_QWORD *)(v2 - 8);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[22] = a1;
  return swift_task_switch();
}

uint64_t BloodPressurePersistor.preferredUnit()()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t);
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  _QWORD *v10;
  Class isa;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint32_t v28;
  os_log_type_t v29;
  NSObject *v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 312);
  v25 = *(_QWORD *)(v0 + 296);
  v27 = *(_QWORD *)(v0 + 288);
  *(_QWORD *)(v0 + 168) = v0;
  v26 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 320) = v2;
  v2(v1, v26, v27);
  swift_endAccess();
  v30 = Logger.logObject.getter();
  v29 = static os_log_type_t.debug.getter();
  *(_QWORD *)(v0 + 184) = 2;
  *(_QWORD *)(v0 + 328) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 336) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(_QWORD *)(v0 + 344) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v28 = *(_DWORD *)(v0 + 408);
  *(_QWORD *)(v0 + 352) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v31 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v30, v29))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v21 = createStorage<A>(capacity:type:)(0);
    v22 = createStorage<A>(capacity:type:)(0);
    *(_QWORD *)(v24 + 248) = buf;
    *(_QWORD *)(v24 + 256) = v21;
    *(_QWORD *)(v24 + 264) = v22;
    serialize(_:at:)(0, (_BYTE **)(v24 + 248));
    serialize(_:at:)(0, (_BYTE **)(v24 + 248));
    *(_QWORD *)(v24 + 272) = v31;
    v23 = (_QWORD *)swift_task_alloc();
    v23[2] = v24 + 248;
    v23[3] = v24 + 256;
    v23[4] = v24 + 264;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_24749F000, v30, v29, "Looking for preferred units", buf, v28);
    destroyStorage<A>(_:count:)(v21, 0, v19);
    destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
  }
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(v24 + 312);
  v13 = *(_QWORD *)(v24 + 296);
  v15 = *(_QWORD *)(v24 + 288);

  v3 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(_QWORD *)(v24 + 360) = v3;
  v3(v14, v15);
  v16 = (id)objc_opt_self();
  v17 = (id)*MEMORY[0x24BDD33A8];
  v4 = (id)*MEMORY[0x24BDD33A8];
  v5 = objc_msgSend(v16, sel_quantityTypeForIdentifier_, v17);
  *(_QWORD *)(v24 + 368) = v5;
  v18 = v5;

  if (v18)
  {
    v12 = *(id *)(v24 + 280);
    *(_QWORD *)(v24 + 192) = v18;
    v6 = v12;
    *(_QWORD *)(v24 + 376) = type metadata accessor for HKQuantityType();
    _allocateUninitializedArray<A>(_:)();
    v10 = v7;
    v8 = v18;
    *v10 = v18;
    _finalizeUninitializedArray<A>(_:)();
    *(_QWORD *)(v24 + 384) = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    Set.init(arrayLiteral:)();
    isa = Set._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v24 + 392) = isa;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v24 + 16) = *(_QWORD *)(v24 + 168);
    *(_QWORD *)(v24 + 56) = v24 + 200;
    *(_QWORD *)(v24 + 24) = BloodPressurePersistor.preferredUnit();
    *(_QWORD *)(v24 + 112) = swift_continuation_init();
    *(_QWORD *)(v24 + 80) = MEMORY[0x24BDAC760];
    *(_DWORD *)(v24 + 88) = 0x40000000;
    *(_DWORD *)(v24 + 92) = 0;
    *(_QWORD *)(v24 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [HKQuantityType : HKUnit];
    *(_QWORD *)(v24 + 104) = &block_descriptor_147;
    objc_msgSend(v12, sel_preferredUnitsForQuantityTypes_completion_, isa, v24 + 80);
    return __swift_continuation_await_point(v24 + 16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v24 + 168) + 8))(0);
  }
}

{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[21] = *v0;
  v1[50] = v1[6];
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v5 = *(id *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 384);
  v6 = *(_QWORD *)(v0 + 376);
  v9 = *(id *)(v0 + 368);
  v1 = *(void **)(v0 + 280);
  *(_QWORD *)(v0 + 168) = v0;
  v8 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 224) = v8;

  v2 = v9;
  *(_QWORD *)(v0 + 240) = v9;
  v3 = type metadata accessor for HKUnit();
  MEMORY[0x24957CF6C](v0 + 240, v8, v6, v3, v7);

  v10 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 168) + 8))(v10);
}

{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  id v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  v21 = *(id *)(v0 + 400);
  v17 = *(id *)(v0 + 392);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  v15 = *(_QWORD *)(v0 + 304);
  v19 = *(_QWORD *)(v0 + 288);
  v16 = *(id *)(v0 + 280);
  *(_QWORD *)(v0 + 168) = v0;
  swift_willThrow();

  v1 = v21;
  *(_QWORD *)(v0 + 208) = v21;
  v18 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v20(v15, v18, v19);
  swift_endAccess();
  v2 = v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v21;
  v29 = Logger.logObject.getter();
  v30 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 216) = 12;
  UnsignedInteger<>.init<A>(_:)();
  v22 = *(_DWORD *)(v0 + 412);
  v25 = swift_allocObject();
  *(_BYTE *)(v25 + 16) = 32;
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(_QWORD *)(v24 + 24) = v23;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v27 + 24) = v24;
  _allocateUninitializedArray<A>(_:)();
  v28 = v3;
  swift_retain();
  *v28 = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[1] = v25;
  swift_retain();
  v28[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[3] = v26;
  swift_retain();
  v28[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[5] = v27;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v29, v30))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = createStorage<A>(capacity:type:)(0);
    v13 = createStorage<A>(capacity:type:)(1);
    v31 = buf;
    v32 = v12;
    v33 = v13;
    serialize(_:at:)(2, &v31);
    serialize(_:at:)(1, &v31);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    _os_log_impl(&dword_24749F000, v29, v30, "Error fetching preferred units: %s", buf, v22);
    destroyStorage<A>(_:count:)(v12, 0, v10);
    destroyStorage<A>(_:count:)(v13, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = (id)v14[50];
  v7 = (void (*)(uint64_t, uint64_t))v14[45];
  v5 = v14[38];
  v6 = v14[36];
  v9 = (id)v14[46];

  v7(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v14[21] + 8))(0);
}

id @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(void *a1, uint64_t a2, uint64_t a3)
{
  Class v4;
  Class v5;
  Class isa;
  uint64_t v9;
  void (*v10)(uint64_t);
  id v12;

  isa = Date._bridgeToObjectiveC()().super.isa;
  v5 = Date._bridgeToObjectiveC()().super.isa;
  type metadata accessor for HKSample();
  lazy protocol witness table accessor for type HKSample and conformance NSObject();
  v4 = Set._bridgeToObjectiveC()().super.isa;
  v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_correlationWithType_startDate_endDate_objects_, a1, isa, v5, v4);

  swift_bridgeObjectRelease();
  v9 = type metadata accessor for Date();
  v10 = *(void (**)(uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(a3);

  ((void (*)(uint64_t, uint64_t))v10)(a2, v9);
  return v12;
}

uint64_t protocol witness for BloodPressurePersisting.isLoggingAuthorized() in conformance BloodPressurePersistor()
{
  void **v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;

  *(_QWORD *)(v1 + 16) = v1;
  v4 = *v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return BloodPressurePersistor.isLoggingAuthorized()(v4);
}

uint64_t protocol witness for BloodPressurePersisting.save(systolic:diastolic:units:) in conformance BloodPressurePersistor(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v11;

  *(_QWORD *)(v5 + 16) = v5;
  v11 = *v4;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v6;
  *v6 = *(_QWORD *)(v5 + 16);
  v6[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return BloodPressurePersistor.save(systolic:diastolic:units:)(a1, a2, v11, a3, a4);
}

uint64_t sub_2475AB6BC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id partial apply for implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v0;

  return implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_2475AB700()
{
  uint64_t v0;

  return swift_deallocObject();
}

id partial apply for implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v0;

  return implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_2475AB744()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v0;

  return implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_2475AB788()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB7B0()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB7D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB814()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB850()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB878()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB8A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB8DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB918()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB940()
{
  return swift_deallocObject();
}

uint64_t sub_2475AB968()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB9A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475AB9E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)
                                                               + async function pointer to @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)))(v6, v4, v5);
}

uint64_t sub_2475ABAD8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475ABB14()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABB3C()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABB64()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABBA0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABBDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475ABC18()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475ABC54()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475ABC90()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABCB8()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABCE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABD1C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABD58()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABD80()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABDA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABDE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABE20()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABE48()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABE70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABEAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABEE8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475ABF24()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABF4C()
{
  return swift_deallocObject();
}

uint64_t sub_2475ABF74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475ABFB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for LogBloodPressureIntentHandler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for BloodPressurePersistor()
{
  return &type metadata for BloodPressurePersistor;
}

char *GetAmbiguousDistanceIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetAmbiguousDistanceIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAmbiguousDistanceIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id GetAmbiguousDistanceIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAmbiguousDistanceIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetAmbiguousDistanceIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetAmbiguousDistanceIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetAmbiguousDistanceIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetAmbiguousDistanceIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetAmbiguousDistanceIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetAmbiguousDistanceIntentResponseCode()
{
  lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetAmbiguousDistanceIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = GetAmbiguousDistanceIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetAmbiguousDistanceIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  GetAmbiguousDistanceIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetAmbiguousDistanceIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetAmbiguousDistanceIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetAmbiguousDistanceIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = GetAmbiguousDistanceIntentResponse.code.getter();

}

void key path setter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  GetAmbiguousDistanceIntentResponse.code.setter(v4);

}

char *GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetAmbiguousDistanceIntent()
{
  return objc_opt_self();
}

id GetAmbiguousDistanceIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAmbiguousDistanceIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetAmbiguousDistanceIntentResponse()
{
  return objc_opt_self();
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAmbiguousDistanceIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetAmbiguousDistanceIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id GetAmbiguousDistanceIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetAmbiguousDistanceIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetAmbiguousDistanceIntentResponseCode, &type metadata for GetAmbiguousDistanceIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for GetAmbiguousDistanceIntentResponseCode, &type metadata for GetAmbiguousDistanceIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_2475AD7E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(a1, a2);
}

void sub_2475AD7FC(uint64_t *a1, id *a2)
{
  key path setter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for GetAmbiguousDistanceIntentResponseCode()
{
  return &type metadata for GetAmbiguousDistanceIntentResponseCode;
}

Swift::String_optional __swiftcall HKMedicationLoggingUnit.getDisplayUnit(for:)(Swift::Double a1)
{
  void *v1;
  uint64_t v2;
  Swift::String_optional result;
  uint64_t v4;
  double v5;

  abs<A>(_:)();
  if (v5 >= 0.01)
    v4 = HKMedicationLoggingUnit.pluralLoggingUnit.getter();
  else
    v4 = HKMedicationLoggingUnit.singularLoggingUnit.getter();
  v2 = v4;
  result.value._object = v1;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t HKMedicationLoggingUnit.singularLoggingUnit.getter()
{
  Swift::String *v0;
  unint64_t v1;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  Swift::String *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v12 = _allocateUninitializedArray<A>(_:)();
  v11 = v0;
  *v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unknown", 7uLL, 1);
  v11[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsule", 7uLL, 1);
  v11[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("application", 0xBuLL, 1);
  v11[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("device", 6uLL, 1);
  v11[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
  v11[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
  v11[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
  v11[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliter", 0xAuLL, 1);
  v11[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patch", 5uLL, 1);
  v11[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoop", 5uLL, 1);
  v11[10] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("spray", 5uLL, 1);
  v11[11] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stick", 5uLL, 1);
  v11[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unit", 4uLL, 1);
  v11[13] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
  v11[14] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bar", 3uLL, 1);
  v11[15] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridge", 9uLL, 1);
  v11[16] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chewable", 8uLL, 1);
  v11[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("disc", 4uLL, 1);
  v11[18] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enema", 5uLL, 1);
  v11[19] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globule", 7uLL, 1);
  v11[20] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implant", 7uLL, 1);
  v11[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("insert", 6uLL, 1);
  v11[22] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kit", 3uLL, 1);
  v11[23] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
  v11[24] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligram", 9uLL, 1);
  v11[25] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packet", 6uLL, 1);
  v11[26] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("piece", 5uLL, 1);
  v11[27] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicle", 8uLL, 1);
  v11[28] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponge", 6uLL, 1);
  v11[29] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strip", 5uLL, 1);
  v11[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppository", 0xBuLL, 1);
  v11[31] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampon", 6uLL, 1);
  v11[32] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatment", 9uLL, 1);
  v11[33] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vial", 4uLL, 1);
  v11[34] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wick", 4uLL, 1);
  _finalizeUninitializedArray<A>(_:)();
  if (objc_msgSend(v13, sel_loggingUnitCode))
  {
    objc_msgSend(v13, sel_loggingUnitCode);
    HKMedicationDoseEventStatus.rawValue.getter();
    v5 = v1;
    v6 = MEMORY[0x24957D11C](v12);
    if (v6 > 0 && v5 < v6)
    {
      objc_msgSend(v13, sel_loggingUnitCode);
      HKMedicationDoseEventStatus.rawValue.getter();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type UInt and conformance UInt();
      SignedInteger<>.init<A>(_:)();
      v3 = MEMORY[0x24957D17C](v14, v12);
    }
    else
    {
      v3 = 0;
    }
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    v10 = objc_msgSend(v13, sel_fallbackLoggingUnitSingularString);
    if (v10)
    {
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    swift_bridgeObjectRelease();
    return v9;
  }
}

uint64_t HKMedicationLoggingUnit.pluralLoggingUnit.getter()
{
  Swift::String *v0;
  unint64_t v1;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  Swift::String *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v12 = _allocateUninitializedArray<A>(_:)();
  v11 = v0;
  *v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unknown", 7uLL, 1);
  v11[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsules", 8uLL, 1);
  v11[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("applications", 0xCuLL, 1);
  v11[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("devices", 7uLL, 1);
  v11[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drops", 5uLL, 1);
  v11[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalations", 0xBuLL, 1);
  v11[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injections", 0xAuLL, 1);
  v11[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliters", 0xBuLL, 1);
  v11[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patches", 7uLL, 1);
  v11[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoops", 6uLL, 1);
  v11[10] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sprays", 6uLL, 1);
  v11[11] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sticks", 6uLL, 1);
  v11[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("units", 5uLL, 1);
  v11[13] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablets", 7uLL, 1);
  v11[14] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  v11[15] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridges", 0xAuLL, 1);
  v11[16] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chewables", 9uLL, 1);
  v11[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("discs", 5uLL, 1);
  v11[18] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enemas", 6uLL, 1);
  v11[19] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globules", 8uLL, 1);
  v11[20] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implants", 8uLL, 1);
  v11[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inserts", 7uLL, 1);
  v11[22] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kits", 4uLL, 1);
  v11[23] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenges", 8uLL, 1);
  v11[24] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligrams", 0xAuLL, 1);
  v11[25] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packets", 7uLL, 1);
  v11[26] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pieces", 6uLL, 1);
  v11[27] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicles", 9uLL, 1);
  v11[28] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponges", 7uLL, 1);
  v11[29] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strips", 6uLL, 1);
  v11[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppositories", 0xDuLL, 1);
  v11[31] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampons", 7uLL, 1);
  v11[32] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatments", 0xAuLL, 1);
  v11[33] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vials", 5uLL, 1);
  v11[34] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wicks", 5uLL, 1);
  _finalizeUninitializedArray<A>(_:)();
  if (objc_msgSend(v13, sel_loggingUnitCode))
  {
    objc_msgSend(v13, sel_loggingUnitCode);
    HKMedicationDoseEventStatus.rawValue.getter();
    v5 = v1;
    v6 = MEMORY[0x24957D11C](v12);
    if (v6 > 0 && v5 < v6)
    {
      objc_msgSend(v13, sel_loggingUnitCode);
      HKMedicationDoseEventStatus.rawValue.getter();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type UInt and conformance UInt();
      SignedInteger<>.init<A>(_:)();
      v3 = MEMORY[0x24957D17C](v14, v12);
    }
    else
    {
      v3 = 0;
    }
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    v10 = objc_msgSend(v13, sel_fallbackLoggingUnitPluralString);
    if (v10)
    {
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    swift_bridgeObjectRelease();
    return v9;
  }
}

uint64_t dateInterval(startTime:endTime:)@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
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
  const void *v13;
  uint64_t v14;
  void *v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  _BYTE **v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t *v55;
  void (**v56)(char *, uint64_t);
  _BYTE **v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t *v65;
  uint32_t v66;
  int v67;
  NSObject *v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  uint64_t *v73;
  int v74;
  void (*v75)(char *, uint64_t);
  unsigned int v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  unint64_t v103;
  const void *v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  unint64_t v110;
  char *v111;
  unint64_t v112;
  uint64_t v113;
  char *v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unsigned int (*v120)(uint64_t, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BYTE *v124;
  uint64_t v125;
  uint32_t v126;
  char v127;
  uint64_t v128;
  const void *v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;

  v78 = a3;
  v105 = a1;
  v104 = a2;
  v133 = 0;
  v132 = 0;
  v131 = 0;
  v130 = 0;
  v129 = 0;
  v128 = 0;
  v79 = 0;
  v98 = 0;
  v80 = type metadata accessor for Logger();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = (*(_QWORD *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v83 = (char *)&v47 - v82;
  v84 = type metadata accessor for Calendar();
  v85 = *(_QWORD *)(v84 - 8);
  v86 = (*(_QWORD *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v84);
  v87 = (char *)&v47 - v86;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  v88 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v89 = (char *)&v47 - v88;
  v90 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v98);
  v91 = (char *)&v47 - v90;
  v92 = type metadata accessor for DateComponents();
  v93 = *(_QWORD *)(v92 - 8);
  v94 = (*(_QWORD *)(v93 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v92);
  v95 = (char *)&v47 - v94;
  v96 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v47 - v94);
  v97 = (char *)&v47 - v96;
  v133 = (char *)&v47 - v96;
  v99 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v98);
  v100 = (uint64_t)&v47 - v99;
  v101 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v102 = (char *)&v47 - v101;
  v103 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v119 = (uint64_t)&v47 - v103;
  v118 = type metadata accessor for Date();
  v117 = *(_QWORD *)(v118 - 8);
  v113 = *(_QWORD *)(v117 + 64);
  v106 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v105);
  v107 = (char *)&v47 - v106;
  v108 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v109 = (char *)&v47 - v108;
  v110 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v111 = (char *)&v47 - v110;
  v132 = (char *)&v47 - v110;
  v112 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v114 = (char *)&v47 - v112;
  v131 = (char *)&v47 - v112;
  v115 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (const void *)MEMORY[0x24BDAC7A8](v12);
  v116 = (char *)&v47 - v115;
  v130 = (char *)&v47 - v115;
  v129 = v13;
  v128 = v14;
  outlined init with copy of Date?(v13, v15);
  v120 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48);
  if (v120(v119, 1, v118) == 1)
  {
    outlined destroy of Date?(v119);
LABEL_13:
    v24 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v78, 1);
  }
  v77 = *(void (**)(char *, uint64_t, uint64_t))(v117 + 32);
  v77(v116, v119, v118);
  outlined init with copy of Date?(v104, v102);
  if (v120((uint64_t)v102, 1, v118) == 1)
  {
    outlined destroy of Date?((uint64_t)v102);
    (*(void (**)(char *, uint64_t))(v117 + 8))(v116, v118);
    goto LABEL_13;
  }
  v77(v114, (uint64_t)v102, v118);
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
  v76 = 1;
  v16(v91, 1, 1, v84);
  v72 = 0;
  v17 = type metadata accessor for TimeZone();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v17 - 8) + 56))(v89, v76);
  v73 = &v25;
  v25 = 0;
  v74 = 1;
  v26 = 1;
  v27 = 0;
  v28 = 1;
  v29 = 0;
  v30 = 1;
  v31 = 0;
  v32 = 1;
  v33 = 0;
  v34 = 1;
  v35 = 0;
  v36 = 1;
  v37 = 0;
  v38 = 1;
  v39 = 0;
  v40 = 1;
  v41 = 0;
  v42 = 1;
  v43 = 0;
  LOBYTE(v44) = 1;
  v45 = 0;
  v46 = 1;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  DateComponents.second.setter();
  static Calendar.current.getter();
  (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v95, v97, v92);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  Calendar.date(byAdding:to:wrappingComponents:)();
  v75 = *(void (**)(char *, uint64_t))(v93 + 8);
  v75(v95, v92);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v87, v84);
  if (v120(v100, v76, v118) == 1)
  {
    v20 = v83;
    outlined destroy of Date?(v100);
    v61 = Logger.wellnessIntents.unsafeMutableAddressor();
    v62 = &v127;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v20, v61, v80);
    swift_endAccess();
    v68 = Logger.logObject.getter();
    v67 = static os_log_type_t.error.getter();
    v65 = &v125;
    v125 = 2;
    v63 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v66 = v126;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v69 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v68, (os_log_type_t)v67))
    {
      v21 = v79;
      v51 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v50 = 0;
      v52 = createStorage<A>(capacity:type:)(0);
      v53 = createStorage<A>(capacity:type:)(v50);
      v57 = &v124;
      v124 = v51;
      v58 = &v123;
      v123 = v52;
      v55 = &v122;
      v122 = v53;
      v54 = 0;
      serialize(_:at:)(0, &v124);
      serialize(_:at:)(v54, v57);
      v121 = v69;
      v56 = &v47;
      MEMORY[0x24BDAC7A8](&v47);
      v59 = &v41;
      v43 = v57;
      v44 = v58;
      v45 = v22;
      v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v21)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_24749F000, v68, (os_log_type_t)v67, "Failed to create date interval", v51, v66);
        v48 = 0;
        destroyStorage<A>(_:count:)(v52, 0, v49);
        destroyStorage<A>(_:count:)(v53, v48, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v51, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v81 + 8))(v83, v80);
    v23 = type metadata accessor for DateInterval();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v78, 1);
    v75(v97, v92);
    v47 = *(void (**)(char *, uint64_t))(v117 + 8);
    v47(v114, v118);
    return ((uint64_t (*)(char *, uint64_t))v47)(v116, v118);
  }
  else
  {
    v77(v111, v100, v118);
    v70 = *(void (**)(char *, char *, uint64_t))(v117 + 16);
    v70(v109, v111, v118);
    v70(v107, v114, v118);
    DateInterval.init(start:end:)();
    v18 = type metadata accessor for DateInterval();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v78, 0, 1);
    v71 = *(void (**)(char *, uint64_t))(v117 + 8);
    v71(v111, v118);
    v75(v97, v92);
    v71(v114, v118);
    return ((uint64_t (*)(char *, uint64_t))v71)(v116, v118);
  }
}

Swift::Bool __swiftcall allDoseEventsAreUnlogged(doseEvents:)(Swift::OpaquePointer doseEvents)
{
  _QWORD *v1;
  char v3;

  type metadata accessor for HKMedicationDoseEventStatus();
  _allocateUninitializedArray<A>(_:)();
  *v1 = 4;
  v1[1] = 5;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  v3 = Sequence.allSatisfy(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Bool __swiftcall allLoggedWithMixedStatus(doseEvents:)(Swift::OpaquePointer doseEvents)
{
  Swift::Bool result;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = 0;
  v9 = 0;
  v8 = 0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
    IndexingIterator.next()();
    if (!v7)
      break;
    objc_msgSend(v7, sel_status);
    type metadata accessor for HKMedicationDoseEventStatus();
    lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
    result = == infix<A>(_:_:)();
    if (result)
    {
      if (__OFADD__(v10, 1))
        goto LABEL_30;
      ++v10;
    }
    else
    {
      objc_msgSend(v7, sel_status);
      result = == infix<A>(_:_:)();
      if (result)
      {
        if (__OFADD__(v9, 1))
          goto LABEL_29;
        ++v9;
      }
      else
      {
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        ++v8;
      }
    }

  }
  outlined destroy of [HKQuantityType]();
  if (v8)
    v6 = 0;
  else
    v6 = v10 >= 1;
  return v6 && v9 >= 1;
}

Swift::Bool __swiftcall oneExistingStatusWithConflictingRequest(doseEvents:requestedStatus:)(Swift::OpaquePointer doseEvents, Swift::Bool requestedStatus)
{
  void *v4;
  void *v5;

  if (requestedStatus)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
    lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
      IndexingIterator.next()();
      if (!v4)
        break;
      objc_msgSend(v4, sel_status);
      type metadata accessor for HKMedicationDoseEventStatus();
      lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
      if ((== infix<A>(_:_:)() & 1) != 0)
      {

        outlined destroy of [HKQuantityType]();
        return 1;
      }

    }
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
    lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
      IndexingIterator.next()();
      if (!v5)
        break;
      objc_msgSend(v5, sel_status);
      type metadata accessor for HKMedicationDoseEventStatus();
      lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
      if ((== infix<A>(_:_:)() & 1) != 0)
      {

        outlined destroy of [HKQuantityType]();
        return 1;
      }

    }
  }
  outlined destroy of [HKQuantityType]();
  return 0;
}

uint64_t getUnloggedDoseEvents(doseEvents:)()
{
  _QWORD *v0;
  uint64_t v2;

  type metadata accessor for HKMedicationDoseEventStatus();
  _allocateUninitializedArray<A>(_:)();
  *v0 = 4;
  v0[1] = 5;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  v2 = _ArrayProtocol.filter(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t getFallbackDateInterval(specifiedDateInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, char *, uint64_t);
  unsigned int v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  const char *v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  unint64_t v60;
  char *v61;
  unint64_t v62;
  char *v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  int v74;
  char *v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t);
  _QWORD *v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t);
  _QWORD *v86;
  char *v87;
  unsigned int v88;
  uint64_t v89;
  unsigned int (*v90)(char *, _QWORD, uint64_t);
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;

  v46 = a2;
  v68 = a1;
  v47 = "Fatal error";
  v48 = "Unexpectedly found nil while unwrapping an Optional value";
  v49 = "SiriWellnessIntents/MedicationsHelpers.swift";
  v96 = 0;
  v95 = 0;
  v94 = 0;
  v93 = 0;
  v92 = 0;
  v91 = 0;
  v72 = 0;
  v84 = type metadata accessor for Calendar();
  v82 = *(_QWORD **)(v84 - 8);
  v50 = (v82[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v84);
  v83 = (char *)&v41 - v50;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v51 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v52 = (char *)&v41 - v51;
  v53 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v41 - v51);
  v87 = (char *)&v41 - v53;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  v54 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v71 = (char *)&v41 - v54;
  v55 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v72);
  v70 = (char *)&v41 - v55;
  v80 = type metadata accessor for DateComponents();
  v78 = *(_QWORD **)(v80 - 8);
  v56 = (v78[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x24BDAC7A8](v72);
  v79 = (char *)&v41 - v56;
  v57 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v75 = (char *)&v41 - v57;
  v96 = (char *)&v41 - v57;
  v89 = type metadata accessor for Date();
  v86 = *(_QWORD **)(v89 - 8);
  v58 = (v86[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v89);
  v59 = (char *)&v41 - v58;
  v60 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v41 - v58);
  v61 = (char *)&v41 - v60;
  v62 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x24BDAC7A8]((char *)&v41 - v60);
  v63 = (char *)&v41 - v62;
  v95 = (char *)&v41 - v62;
  v64 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v41 - v64;
  v94 = (char *)&v41 - v64;
  v66 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v41 - v66;
  v93 = (char *)&v41 - v66;
  v67 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v14);
  v77 = (char *)&v41 - v67;
  v92 = (char *)&v41 - v67;
  v91 = a1;
  DateInterval.start.getter();
  DateInterval.end.getter();
  v16 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v82[7];
  v88 = 1;
  v16(v70, 1, 1, v84);
  v17 = type metadata accessor for TimeZone();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v17 - 8) + 56))(v71, v88);
  v73 = &v19;
  v19 = 0;
  v74 = 1;
  v20 = 1;
  v21 = 0;
  v22 = 1;
  v23 = 0;
  v24 = 1;
  v25 = 0;
  v26 = 1;
  v27 = 0;
  v28 = 1;
  v29 = 0;
  v30 = 1;
  v31 = 0;
  v32 = 1;
  v33 = 0;
  v34 = 1;
  v35 = 0;
  v36 = 1;
  v37 = 0;
  LOBYTE(v38) = 1;
  v39 = 0;
  v40 = 1;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  DateComponents.hour.setter();
  static Calendar.current.getter();
  v76 = (void (*)(char *, char *, uint64_t))v78[2];
  v76(v79, v75, v80);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  Calendar.date(byAdding:to:wrappingComponents:)();
  v81 = (void (*)(char *, uint64_t))v78[1];
  v81(v79, v80);
  v85 = (void (*)(char *, uint64_t))v82[1];
  v85(v83, v84);
  v90 = (unsigned int (*)(char *, _QWORD, uint64_t))v86[6];
  if (v90(v87, v88, v89) == 1)
  {
    LOBYTE(v37) = 2;
    v38 = 152;
    LODWORD(v39) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v44 = (void (*)(char *, char *, uint64_t))v86[4];
  v44(v65, v87, v89);
  static Calendar.current.getter();
  v76(v79, v75, v80);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  v45 = 1;
  Calendar.date(byAdding:to:wrappingComponents:)();
  v81(v79, v80);
  v85(v83, v84);
  if (v90(v52, v45, v89) == 1)
  {
    LOBYTE(v37) = 2;
    v38 = 153;
    LODWORD(v39) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v44(v63, v52, v89);
  v42 = (void (*)(char *, char *, uint64_t))v86[2];
  v42(v61, v65, v89);
  v42(v59, v63, v89);
  DateInterval.init(start:end:)();
  v43 = (void (*)(char *, uint64_t))v86[1];
  v43(v63, v89);
  v43(v65, v89);
  v81(v75, v80);
  v43(v69, v89);
  return ((uint64_t (*)(char *, uint64_t))v43)(v77, v89);
}

uint64_t filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  id v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  _QWORD v113[2];
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE **v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint32_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  NSObject *v140;
  int v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD *v159;
  _QWORD *v160;
  uint64_t *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  id v168;
  uint64_t v169;
  _QWORD *v170;
  _QWORD *v171;
  int v172;
  uint64_t v173;
  _QWORD *v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  id v186;
  _BOOL4 v187;
  _BOOL4 v188;
  id v189;
  id v190;
  uint64_t v191;
  id v192;
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
  uint8_t *v209;
  uint64_t v210;
  uint64_t v211;
  _BYTE **v212;
  uint64_t *v213;
  uint64_t *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  id v219;
  uint32_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  int v229;
  uint64_t v230;
  int v231;
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
  _QWORD *v252;
  NSObject *v253;
  int v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void (*v258)(char *, uint64_t);
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  unint64_t v262;
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
  uint8_t *v273;
  uint64_t v274;
  uint64_t v275;
  _BYTE **v276;
  uint64_t *v277;
  uint64_t *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  unint64_t v283;
  char *v284;
  uint64_t v285;
  unint64_t v286;
  uint64_t v287;
  unint64_t v288;
  char *v289;
  unint64_t v290;
  char *v291;
  unint64_t v292;
  char *v293;
  uint64_t v294;
  _QWORD *v295;
  uint64_t v296;
  uint64_t v297;
  void (*v298)(char *, uint64_t, uint64_t);
  char *v299;
  uint64_t v300;
  unint64_t v301;
  unint64_t v302;
  uint64_t *v303;
  unint64_t v304;
  uint32_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  _QWORD *v315;
  uint64_t v316;
  NSObject *v317;
  int v318;
  uint64_t (*v319)(uint64_t, uint64_t, uint64_t);
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  _BYTE *v323;
  uint64_t (*v324)(uint64_t, uint64_t, uint64_t);
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  _BYTE *v328[2];
  _QWORD v329[2];
  _QWORD v330[3];
  _QWORD v331[2];
  _QWORD v332[2];
  _QWORD v333[2];
  uint64_t v334;
  _QWORD v335[2];
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  BOOL v340;
  uint64_t v341;
  uint32_t v342;
  uint64_t v343;
  void *v344;
  uint64_t (*v345)(uint64_t, uint64_t, uint64_t);
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  _BYTE *v349;
  char v350;
  uint64_t v351;
  uint32_t v352;
  char v353;
  void *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint32_t v361;
  char v362;
  uint64_t v363;

  v300 = a1;
  v363 = 0;
  v359 = 0;
  v358 = 0;
  v356 = 0;
  v357 = 0;
  v294 = 0;
  v280 = 0;
  v344 = 0;
  v340 = 0;
  v338 = 0;
  v339 = 0;
  v337 = 0;
  v285 = 0;
  v281 = type metadata accessor for Date();
  v282 = *(_QWORD *)(v281 - 8);
  v283 = (*(_QWORD *)(v282 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v281);
  v284 = (char *)v113 - v283;
  v286 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v285);
  v287 = (uint64_t)v113 - v286;
  v297 = type metadata accessor for Logger();
  v295 = *(_QWORD **)(v297 - 8);
  v288 = (v295[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v300);
  v289 = (char *)v113 - v288;
  v290 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v1);
  v291 = (char *)v113 - v290;
  v292 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v113 - v292;
  v293 = (char *)v113 - v292;
  v363 = v5;
  v296 = Logger.wellnessIntents.unsafeMutableAddressor();
  v299 = &v362;
  v307 = 32;
  swift_beginAccess();
  v298 = (void (*)(char *, uint64_t, uint64_t))v295[2];
  v298(v6, v296, v297);
  swift_endAccess();
  swift_bridgeObjectRetain();
  v308 = 7;
  v309 = swift_allocObject();
  *(_QWORD *)(v309 + 16) = v300;
  v317 = Logger.logObject.getter();
  v318 = static os_log_type_t.debug.getter();
  v303 = &v360;
  v360 = 12;
  v301 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v302 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v304 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v305 = v361;
  v306 = 17;
  v311 = swift_allocObject();
  *(_BYTE *)(v311 + 16) = 0;
  v312 = swift_allocObject();
  *(_BYTE *)(v312 + 16) = 8;
  v7 = swift_allocObject();
  v8 = v309;
  v310 = v7;
  *(_QWORD *)(v7 + 16) = partial apply for implicit closure #4 in SpecificMedicationsPersistor.saveMedication(named:medStatusTaken:dosage:dosageUnit:);
  *(_QWORD *)(v7 + 24) = v8;
  v9 = swift_allocObject();
  v10 = v310;
  v314 = v9;
  *(_QWORD *)(v9 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  *(_QWORD *)(v9 + 24) = v10;
  v316 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v313 = _allocateUninitializedArray<A>(_:)();
  v315 = v11;
  swift_retain();
  v12 = v311;
  v13 = v315;
  *v315 = partial apply for closure #1 in OSLogArguments.append(_:);
  v13[1] = v12;
  swift_retain();
  v14 = v312;
  v15 = v315;
  v315[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v15[3] = v14;
  swift_retain();
  v16 = v314;
  v17 = v315;
  v315[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v317, (os_log_type_t)v318))
  {
    v18 = v280;
    v273 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v271 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v272 = 0;
    v274 = createStorage<A>(capacity:type:)(0);
    v275 = createStorage<A>(capacity:type:)(v272);
    v276 = &v323;
    v323 = v273;
    v277 = &v322;
    v322 = v274;
    v278 = &v321;
    v321 = v275;
    serialize(_:at:)(0, &v323);
    serialize(_:at:)(1, v276);
    v319 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v320 = v311;
    closure #1 in osLogInternal(_:log:type:)(&v319, (uint64_t)v276, (uint64_t)v277, (uint64_t)v278);
    v279 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      v319 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v320 = v312;
      closure #1 in osLogInternal(_:log:type:)(&v319, (uint64_t)&v323, (uint64_t)&v322, (uint64_t)&v321);
      v269 = 0;
      v20 = v269;
      v319 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
      v320 = v314;
      closure #1 in osLogInternal(_:log:type:)(&v319, (uint64_t)&v323, (uint64_t)&v322, (uint64_t)&v321);
      v268 = v20;
      _os_log_impl(&dword_24749F000, v317, (os_log_type_t)v318, "Started filtering with this many dose events: %ld", v273, v305);
      v267 = 0;
      destroyStorage<A>(_:count:)(v274, 0, v271);
      destroyStorage<A>(_:count:)(v275, v267, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v273, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      v270 = v268;
    }
  }
  else
  {
    v19 = v280;
    swift_release();
    swift_release();
    swift_release();
    v270 = v19;
  }
  v265 = v270;

  v258 = (void (*)(char *, uint64_t))v295[1];
  v258(v293, v297);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String?, [String]));
  v263 = 0;
  v261 = _allocateUninitializedArray<A>(_:)();
  v259 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v260 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  v262 = lazy protocol witness table accessor for type String? and conformance <A> A?();
  v359 = Dictionary.init(dictionaryLiteral:)();
  type metadata accessor for HKMedicationExposableDoseEvent();
  v358 = _allocateUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  v355 = v300;
  v264 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  Collection<>.makeIterator()();
  v266 = v265;
  while (1)
  {
    v256 = v266;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
    IndexingIterator.next()();
    v257 = v354;
    if (!v354)
      break;
    v255 = v257;
    v21 = v291;
    v219 = v257;
    v344 = v257;
    v216 = Logger.wellnessIntents.unsafeMutableAddressor();
    v217 = &v343;
    v232 = 32;
    swift_beginAccess();
    v298(v21, v216, v297);
    swift_endAccess();
    v22 = v219;
    v218 = 24;
    v233 = 7;
    v23 = swift_allocObject();
    v24 = v219;
    v221 = v23;
    *(_QWORD *)(v23 + 16) = v219;
    v25 = v24;
    v26 = swift_allocObject();
    v27 = v219;
    v223 = v26;
    *(_QWORD *)(v26 + 16) = v219;
    v28 = v27;
    v29 = swift_allocObject();
    v30 = v219;
    v225 = v29;
    *(_QWORD *)(v29 + 16) = v219;
    v31 = v30;
    v32 = swift_allocObject();
    v33 = v219;
    v227 = v32;
    *(_QWORD *)(v32 + 16) = v219;
    v34 = v33;
    v234 = swift_allocObject();
    *(_QWORD *)(v234 + 16) = v219;
    v253 = Logger.logObject.getter();
    v254 = static os_log_type_t.debug.getter();
    v341 = 52;
    UnsignedInteger<>.init<A>(_:)();
    v220 = v342;
    v230 = 17;
    v236 = swift_allocObject();
    v229 = 32;
    *(_BYTE *)(v236 + 16) = 32;
    v237 = swift_allocObject();
    v231 = 8;
    *(_BYTE *)(v237 + 16) = 8;
    v35 = swift_allocObject();
    v36 = v221;
    v222 = v35;
    *(_QWORD *)(v35 + 16) = partial apply for implicit closure #4 in SpecificMedicationsPersistor.saveScheduledMedication(specifiedDateInterval:medStatusTaken:);
    *(_QWORD *)(v35 + 24) = v36;
    v37 = swift_allocObject();
    v38 = v222;
    v238 = v37;
    *(_QWORD *)(v37 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v37 + 24) = v38;
    v239 = swift_allocObject();
    *(_BYTE *)(v239 + 16) = v229;
    v240 = swift_allocObject();
    *(_BYTE *)(v240 + 16) = v231;
    v39 = swift_allocObject();
    v40 = v223;
    v224 = v39;
    *(_QWORD *)(v39 + 16) = partial apply for implicit closure #1 in MedsUndoer.getUpdatedDoseEvent(doseEvent:matchingMeds:);
    *(_QWORD *)(v39 + 24) = v40;
    v41 = swift_allocObject();
    v42 = v224;
    v241 = v41;
    *(_QWORD *)(v41 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v41 + 24) = v42;
    v242 = swift_allocObject();
    *(_BYTE *)(v242 + 16) = v229;
    v243 = swift_allocObject();
    *(_BYTE *)(v243 + 16) = v231;
    v43 = swift_allocObject();
    v44 = v225;
    v226 = v43;
    *(_QWORD *)(v43 + 16) = partial apply for implicit closure #7 in SpecificMedicationsPersistor.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
    *(_QWORD *)(v43 + 24) = v44;
    v45 = swift_allocObject();
    v46 = v226;
    v244 = v45;
    *(_QWORD *)(v45 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v45 + 24) = v46;
    v245 = swift_allocObject();
    *(_BYTE *)(v245 + 16) = v229;
    v246 = swift_allocObject();
    *(_BYTE *)(v246 + 16) = v231;
    v47 = swift_allocObject();
    v48 = v227;
    v228 = v47;
    *(_QWORD *)(v47 + 16) = partial apply for implicit closure #5 in filterUniqueDoseEvents(doseEvents:);
    *(_QWORD *)(v47 + 24) = v48;
    v49 = swift_allocObject();
    v50 = v228;
    v247 = v49;
    *(_QWORD *)(v49 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v49 + 24) = v50;
    v248 = swift_allocObject();
    *(_BYTE *)(v248 + 16) = v229;
    v249 = swift_allocObject();
    *(_BYTE *)(v249 + 16) = v231;
    v51 = swift_allocObject();
    v52 = v234;
    v235 = v51;
    *(_QWORD *)(v51 + 16) = partial apply for implicit closure #6 in filterUniqueDoseEvents(doseEvents:);
    *(_QWORD *)(v51 + 24) = v52;
    v53 = swift_allocObject();
    v54 = v235;
    v251 = v53;
    *(_QWORD *)(v53 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v53 + 24) = v54;
    v250 = _allocateUninitializedArray<A>(_:)();
    v252 = v55;
    swift_retain();
    v56 = v236;
    v57 = v252;
    *v252 = partial apply for closure #1 in OSLogArguments.append(_:);
    v57[1] = v56;
    swift_retain();
    v58 = v237;
    v59 = v252;
    v252[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v59[3] = v58;
    swift_retain();
    v60 = v238;
    v61 = v252;
    v252[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v61[5] = v60;
    swift_retain();
    v62 = v239;
    v63 = v252;
    v252[6] = partial apply for closure #1 in OSLogArguments.append(_:);
    v63[7] = v62;
    swift_retain();
    v64 = v240;
    v65 = v252;
    v252[8] = partial apply for closure #1 in OSLogArguments.append(_:);
    v65[9] = v64;
    swift_retain();
    v66 = v241;
    v67 = v252;
    v252[10] = partial apply for closure #1 in OSLogArguments.append(_:);
    v67[11] = v66;
    swift_retain();
    v68 = v242;
    v69 = v252;
    v252[12] = partial apply for closure #1 in OSLogArguments.append(_:);
    v69[13] = v68;
    swift_retain();
    v70 = v243;
    v71 = v252;
    v252[14] = partial apply for closure #1 in OSLogArguments.append(_:);
    v71[15] = v70;
    swift_retain();
    v72 = v244;
    v73 = v252;
    v252[16] = partial apply for closure #1 in OSLogArguments.append(_:);
    v73[17] = v72;
    swift_retain();
    v74 = v245;
    v75 = v252;
    v252[18] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[19] = v74;
    swift_retain();
    v76 = v246;
    v77 = v252;
    v252[20] = partial apply for closure #1 in OSLogArguments.append(_:);
    v77[21] = v76;
    swift_retain();
    v78 = v247;
    v79 = v252;
    v252[22] = partial apply for closure #1 in OSLogArguments.append(_:);
    v79[23] = v78;
    swift_retain();
    v80 = v248;
    v81 = v252;
    v252[24] = partial apply for closure #1 in OSLogArguments.append(_:);
    v81[25] = v80;
    swift_retain();
    v82 = v249;
    v83 = v252;
    v252[26] = partial apply for closure #1 in OSLogArguments.append(_:);
    v83[27] = v82;
    swift_retain();
    v84 = v251;
    v85 = v252;
    v252[28] = partial apply for closure #1 in OSLogArguments.append(_:);
    v85[29] = v84;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v253, (os_log_type_t)v254))
    {
      v86 = v256;
      v209 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v210 = createStorage<A>(capacity:type:)(0);
      v211 = createStorage<A>(capacity:type:)(5);
      v212 = v328;
      v328[0] = v209;
      v213 = &v327;
      v327 = v210;
      v214 = &v326;
      v326 = v211;
      serialize(_:at:)(2, v328);
      serialize(_:at:)(5, v212);
      v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v325 = v236;
      closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v212, (uint64_t)v213, (uint64_t)v214);
      v215 = v86;
      if (v86)
      {
        __break(1u);
      }
      else
      {
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v237;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v206 = 0;
        v88 = v206;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v238;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v205 = v88;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v239;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v204 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v240;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v203 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v241;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v202 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v242;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v201 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v243;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v200 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v244;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v199 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v245;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v198 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v246;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v197 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v247;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v196 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v248;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v195 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v249;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v194 = 0;
        v324 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v325 = v251;
        closure #1 in osLogInternal(_:log:type:)(&v324, (uint64_t)v328, (uint64_t)&v327, (uint64_t)&v326);
        v193 = 0;
        _os_log_impl(&dword_24749F000, v253, (os_log_type_t)v254, "got a dose event with scheduleID: %s, medID: %s, status: %s, scheduledDate: %s, startDate: %s", v209, v220);
        destroyStorage<A>(_:count:)(v210, 0, v208);
        destroyStorage<A>(_:count:)(v211, 5, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v209, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v207 = v193;
      }
    }
    else
    {
      v87 = v256;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v207 = v87;
    }
    v191 = v207;

    v258(v291, v297);
    v192 = objc_msgSend(v219, sel_scheduledDate);
    if (v192)
    {
      v190 = v192;
      v189 = v192;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();
      (*(void (**)(uint64_t, char *, uint64_t))(v282 + 32))(v287, v284, v281);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v282 + 56))(v287, 0, 1, v281);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v282 + 56))(v287, 1, 1, v281);
    }
    v188 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v282 + 48))(v287, 1, v281) == 1;
    v187 = v188;
    outlined destroy of Date?(v287);
    v340 = v187;
    if (v187)
    {

      v266 = v191;
    }
    else
    {
      v182 = objc_msgSend(v219, sel_medicationIdentifier);
      v185 = objc_msgSend(v182, sel_underlyingIdentifier);
      v183 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v184 = v89;
      v338 = v183;
      v339 = v89;

      v186 = objc_msgSend(v219, sel_scheduleItemIdentifier);
      if (v186)
      {
        v181 = v186;
        v176 = v186;
        v177 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v178 = v90;

        v179 = v177;
        v180 = v178;
      }
      else
      {
        v179 = 0;
        v180 = 0;
      }
      v174 = v335;
      v335[0] = v179;
      v335[1] = v180;
      MEMORY[0x24957CF6C](&v336);
      outlined destroy of String.UTF8View();
      v175 = v336;
      if (v336)
      {
        v173 = v175;
        v169 = v175;
        swift_bridgeObjectRetain();
        v337 = v169;
        v171 = v332;
        v332[0] = v169;
        v170 = v331;
        v331[0] = v183;
        v331[1] = v184;
        lazy protocol witness table accessor for type [String] and conformance [A]();
        v172 = Sequence<>.contains(_:)();
        outlined destroy of [HKQuantityType]();
        if ((v172 & 1) == 0)
        {
          swift_bridgeObjectRetain();
          v330[1] = v183;
          v330[2] = v184;
          specialized Array.append(_:)();
          v168 = objc_msgSend(v219, sel_scheduleItemIdentifier);
          if (v168)
          {
            v167 = v168;
            v162 = v168;
            v163 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v164 = v91;

            v165 = v163;
            v166 = v164;
          }
          else
          {
            v165 = 0;
            v166 = 0;
          }
          v158 = v166;
          v157 = v165;
          v161 = &v337;
          v156 = v337;
          swift_bridgeObjectRetain();
          v160 = v330;
          v330[0] = v156;
          v159 = v329;
          v329[0] = v157;
          v329[1] = v158;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String? : [String]]);
          Dictionary.subscript.setter();
          v92 = v219;
          v328[1] = v219;
          Array.append(_:)();
          outlined destroy of [HKQuantityType]();
          goto LABEL_44;
        }
        outlined destroy of [HKQuantityType]();
        swift_bridgeObjectRelease();

        v266 = v191;
      }
      else
      {
        v155 = objc_msgSend(v219, sel_scheduleItemIdentifier);
        if (v155)
        {
          v154 = v155;
          v149 = v155;
          v150 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v151 = v93;

          v152 = v150;
          v153 = v151;
        }
        else
        {
          v152 = 0;
          v153 = 0;
        }
        v146 = v153;
        v145 = v152;
        v144 = MEMORY[0x24BEE0D00];
        v142 = _allocateUninitializedArray<A>(_:)();
        v143 = v94;
        swift_bridgeObjectRetain();
        v95 = v142;
        v96 = v184;
        v97 = v143;
        *v143 = v183;
        v97[1] = v96;
        _finalizeUninitializedArray<A>(_:)();
        v148 = &v334;
        v334 = v95;
        v147 = v333;
        v333[0] = v145;
        v333[1] = v146;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String? : [String]]);
        Dictionary.subscript.setter();
        v98 = v219;
        v332[1] = v219;
        Array.append(_:)();
LABEL_44:
        swift_bridgeObjectRelease();

        v266 = v191;
      }
    }
  }
  v99 = v289;
  outlined destroy of [HKQuantityType]();
  v126 = Logger.wellnessIntents.unsafeMutableAddressor();
  v127 = &v353;
  v131 = 32;
  swift_beginAccess();
  v298(v99, v126, v297);
  swift_endAccess();
  v128 = v358;
  swift_bridgeObjectRetain();
  v132 = 7;
  v133 = swift_allocObject();
  *(_QWORD *)(v133 + 16) = v128;
  v140 = Logger.logObject.getter();
  v141 = static os_log_type_t.debug.getter();
  v351 = 12;
  UnsignedInteger<>.init<A>(_:)();
  v129 = v352;
  v130 = 17;
  v135 = swift_allocObject();
  *(_BYTE *)(v135 + 16) = 0;
  v136 = swift_allocObject();
  *(_BYTE *)(v136 + 16) = 8;
  v100 = swift_allocObject();
  v101 = v133;
  v134 = v100;
  *(_QWORD *)(v100 + 16) = partial apply for specialized implicit closure #10 in SpecificMedicationsPersistor.writeDoseEvent(medicationController:doseEvents:medStatusTaken:medicationIDPresent:dosage:dosageUnit:);
  *(_QWORD *)(v100 + 24) = v101;
  v102 = swift_allocObject();
  v103 = v134;
  v138 = v102;
  *(_QWORD *)(v102 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  *(_QWORD *)(v102 + 24) = v103;
  v137 = _allocateUninitializedArray<A>(_:)();
  v139 = v104;
  swift_retain();
  v105 = v135;
  v106 = v139;
  *v139 = partial apply for closure #1 in OSLogArguments.append(_:);
  v106[1] = v105;
  swift_retain();
  v107 = v136;
  v108 = v139;
  v139[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v108[3] = v107;
  swift_retain();
  v109 = v138;
  v110 = v139;
  v139[4] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
  v110[5] = v109;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v140, (os_log_type_t)v141))
  {
    v111 = v256;
    v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v117 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v118 = 0;
    v120 = createStorage<A>(capacity:type:)(0);
    v121 = createStorage<A>(capacity:type:)(v118);
    v122 = &v349;
    v349 = v119;
    v123 = &v348;
    v348 = v120;
    v124 = &v347;
    v347 = v121;
    serialize(_:at:)(0, &v349);
    serialize(_:at:)(1, v122);
    v345 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v346 = v135;
    closure #1 in osLogInternal(_:log:type:)(&v345, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
    v125 = v111;
    if (v111)
    {
      __break(1u);
    }
    else
    {
      v345 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v346 = v136;
      closure #1 in osLogInternal(_:log:type:)(&v345, (uint64_t)&v349, (uint64_t)&v348, (uint64_t)&v347);
      v116 = 0;
      v345 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
      v346 = v138;
      closure #1 in osLogInternal(_:log:type:)(&v345, (uint64_t)&v349, (uint64_t)&v348, (uint64_t)&v347);
      _os_log_impl(&dword_24749F000, v140, (os_log_type_t)v141, "Finished filtering to this many dose events: %ld", v119, v129);
      v115 = 0;
      destroyStorage<A>(_:count:)(v120, 0, v117);
      destroyStorage<A>(_:count:)(v121, v115, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v119, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  v258(v289, v297);
  v113[1] = &v358;
  v113[0] = &v350;
  swift_beginAccess();
  v114 = v358;
  swift_bridgeObjectRetain();
  swift_endAccess();
  outlined destroy of [HKQuantityType]();
  outlined destroy of [HKQuantityType]();
  return v114;
}

BOOL isLogged(doseEvent:)(void *a1)
{
  id v3;

  v3 = objc_msgSend(a1, sel_status);
  return v3 == (id)4 || v3 == (id)5;
}

Swift::Bool __swiftcall isCompatibleUnit(_:_:)(Swift::String_optional a1, Swift::String_optional a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  _BYTE **v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint32_t v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  int v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t countAndFlagsBits;
  uint64_t v46;
  void *object;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint32_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  countAndFlagsBits = a1.value._countAndFlagsBits;
  object = a1.value._object;
  v46 = a2.value._countAndFlagsBits;
  v52 = a2.value._object;
  v66 = 0;
  v67 = 0;
  v64 = 0;
  v65 = 0;
  v44 = 0;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = 0;
  v48 = type metadata accessor for Logger();
  v49 = *(_QWORD *)(v48 - 8);
  v50 = (*(_QWORD *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v52);
  v51 = (char *)&v12 - v50;
  v66 = v3;
  v67 = v4;
  v64 = v5;
  v65 = v2;
  swift_bridgeObjectRetain();
  if (v52)
  {
    v42 = v46;
    v43 = v52;
    v40 = v52;
    v41 = v46;
    v55 = v46;
    v56 = v52;
    swift_bridgeObjectRetain();
    if (object)
    {
      v38 = countAndFlagsBits;
      v39 = object;
      v35 = object;
      v53 = countAndFlagsBits;
      v54 = object;
      v36 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = v36;
    }
    else
    {
      swift_bridgeObjectRelease();
      v37 = 1;
    }
  }
  else
  {
    v6 = v51;
    v26 = Logger.wellnessIntents.unsafeMutableAddressor();
    v27 = &v63;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v6, v26, v48);
    swift_endAccess();
    v33 = Logger.logObject.getter();
    v32 = static os_log_type_t.debug.getter();
    v30 = &v61;
    v61 = 2;
    v28 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v31 = v62;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v34 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v33, (os_log_type_t)v32))
    {
      v7 = v44;
      v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v15 = 0;
      v17 = createStorage<A>(capacity:type:)(0);
      v18 = createStorage<A>(capacity:type:)(v15);
      v22 = &v60;
      v60 = v16;
      v23 = &v59;
      v59 = v17;
      v20 = &v58;
      v58 = v18;
      v19 = 0;
      serialize(_:at:)(0, &v60);
      serialize(_:at:)(v19, v22);
      v57 = v34;
      v21 = &v12;
      MEMORY[0x24BDAC7A8](&v12);
      v8 = v23;
      v9 = &v12 - 6;
      v24 = &v12 - 6;
      v9[2] = (uint64_t)v22;
      v9[3] = (uint64_t)v8;
      v9[4] = v10;
      v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v7)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_24749F000, v33, (os_log_type_t)v32, "healthAppDosageUnit was unexpectedly nil, return false", v16, v31);
        v13 = 0;
        destroyStorage<A>(_:count:)(v17, 0, v14);
        destroyStorage<A>(_:count:)(v18, v13, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v16, MEMORY[0x24BEE4260]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v48);
    v37 = 0;
  }
  return v37 & 1;
}

uint64_t implicit closure #5 in filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  id v14;

  v10 = a1;
  v6 = type metadata accessor for Date();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v3 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v12 = (*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = (void *)MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v3 - v12;
  v14 = objc_msgSend(v1, sel_scheduledDate);
  if (v14)
  {
    v5 = v14;
    v4 = v14;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v9, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v13, 1, 1, v6);
  }
  lazy protocol witness table accessor for type Date? and conformance A?();
  return String.init<A>(describing:)();
}

uint64_t implicit closure #6 in filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1;
  v6 = type metadata accessor for Date();
  v5 = (*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v3 - v5;
  v8 = objc_msgSend((id)MEMORY[0x24BDAC7A8](v4), sel_startDate);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  lazy protocol witness table accessor for type Date and conformance Date();
  v9 = String.init<A>(describing:)();
  v10 = v1;

  return v9;
}

uint64_t closure #1 in allDoseEventsAreUnlogged(doseEvents:)(id *a1)
{
  objc_msgSend(*a1, sel_status);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationDoseEventStatus]);
  lazy protocol witness table accessor for type [HKMedicationDoseEventStatus] and conformance [A]();
  lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
  return (Sequence<>.contains(_:)() ^ 1) & 1;
}

uint64_t partial apply for closure #1 in allDoseEventsAreUnlogged(doseEvents:)(id *a1)
{
  return closure #1 in allDoseEventsAreUnlogged(doseEvents:)(a1) & 1;
}

uint64_t sub_2475B2E44()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2475B2E80()
{
  return swift_deallocObject();
}

uint64_t sub_2475B2EA8()
{
  return swift_deallocObject();
}

uint64_t sub_2475B2ED0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B2F0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B2F48()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2475B2F84()
{
  return swift_deallocObject();
}

uint64_t sub_2475B2FAC()
{
  return swift_deallocObject();
}

uint64_t sub_2475B2FD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B3010()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B304C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475B3088()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475B30C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475B3100()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #5 in filterUniqueDoseEvents(doseEvents:)()
{
  uint64_t v0;

  return implicit closure #5 in filterUniqueDoseEvents(doseEvents:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2475B3144()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in filterUniqueDoseEvents(doseEvents:)()
{
  uint64_t v0;

  return implicit closure #6 in filterUniqueDoseEvents(doseEvents:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2475B3188()
{
  return swift_deallocObject();
}

uint64_t sub_2475B31B0()
{
  return swift_deallocObject();
}

uint64_t sub_2475B31D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B3214()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B3250()
{
  return swift_deallocObject();
}

uint64_t sub_2475B3278()
{
  return swift_deallocObject();
}

uint64_t sub_2475B32A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B32DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B3318()
{
  return swift_deallocObject();
}

uint64_t sub_2475B3340()
{
  return swift_deallocObject();
}

uint64_t sub_2475B3368()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B33A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B33E0()
{
  return swift_deallocObject();
}

uint64_t sub_2475B3408()
{
  return swift_deallocObject();
}

uint64_t sub_2475B3430()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B346C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B34A8()
{
  return swift_deallocObject();
}

uint64_t sub_2475B34D0()
{
  return swift_deallocObject();
}

uint64_t sub_2475B34F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B3534()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type [HKMedicationDoseEventStatus] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A];
  if (!lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKMedicationDoseEventStatus]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A]);
    return v1;
  }
  return v3;
}

char *UndoMedsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;

  v3 = objc_allocWithZone(v2);
  return UndoMedsIntentResponse.init(code:userActivity:)(a1, a2);
}

id UndoMedsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UndoMedsIntent.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for UndoMedsIntent();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id UndoMedsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id UndoMedsIntent.init(coder:)(void *a1)
{
  id v1;
  id v5;
  objc_super v6;
  void *v7;
  id v8;

  v8 = 0;
  v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for UndoMedsIntent();
  v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    v1 = v5;
    v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v5;
  uint64_t v6;
  void *v7;
  id v11;

  v11 = objc_allocWithZone(v3);
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id UndoMedsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v13 = a1;
  v14 = a2;
  v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    v6 = MEMORY[0x24957CFB4](a1);
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for UndoMedsIntent();
  v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  v3 = v5;
  v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id UndoMedsIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v6;
  id v8;
  id v9;
  Class isa;
  id v13;
  void *v16;
  void *v18;

  v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x24957CFB4](a1, a2);
  v18 = (void *)MEMORY[0x24957CFB4](a3, a4);
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id UndoMedsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  id v7;
  Class isa;
  Class v9;
  id v12;
  void *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = 0;
  v21 = a1;
  v22 = a2;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  swift_bridgeObjectRetain();
  v12 = (id)MEMORY[0x24957CFB4](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = (void *)MEMORY[0x24957CFB4](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v9 = isa;
  }
  else
  {
    v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for UndoMedsIntent();
  v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  v5 = v7;
  v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id UndoMedsIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UndoMedsIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UndoMedsIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UndoMedsIntentResponseCode()
{
  lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance UndoMedsIntentResponseCode()
{
  lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UndoMedsIntentResponseCode()
{
  lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance UndoMedsIntentResponseCode()
{
  lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UndoMedsIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = UndoMedsIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UndoMedsIntentResponseCode(_QWORD *a1@<X8>)
{
  uint64_t v1;

  UndoMedsIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t UndoMedsIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR___UndoMedsIntentResponse_code);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t UndoMedsIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___UndoMedsIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*UndoMedsIntentResponse.code.modify())()
{
  swift_beginAccess();
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2;
  id v3;

  v3 = *a1;
  v2 = *a1;
  *a2 = UndoMedsIntentResponse.code.getter();

}

void key path setter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(uint64_t *a1, id *a2)
{
  id v2;
  id v3;
  uint64_t v4;

  v4 = *a1;
  v3 = *a2;
  v2 = *a2;
  UndoMedsIntentResponse.code.setter(v4);

}

char *UndoMedsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v6;
  char *v9;
  void *v10;

  v9 = (char *)objc_msgSend(v10, sel_init);
  v2 = v9;
  v3 = v9;
  v4 = v9;
  v6 = &v9[OBJC_IVAR___UndoMedsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for UndoMedsIntent()
{
  return objc_opt_self();
}

id UndoMedsIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UndoMedsIntentResponse.init()()
{
  char *v0;
  char *v1;
  id v2;
  id v4;
  objc_super v5;
  void *v6;

  v1 = v0;
  v6 = v0;
  *(_QWORD *)&v0[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  v4 = objc_msgSendSuper2(&v5, sel_init);
  v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for UndoMedsIntentResponse()
{
  return objc_opt_self();
}

id UndoMedsIntentResponse.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id UndoMedsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id UndoMedsIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v7;
  objc_super v8;
  void *v9;
  id v10;

  v9 = a1;
  v2 = v1;
  v10 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    v3 = v7;
    v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  id v4;
  id v5;
  Class isa;
  id v8;

  v8 = objc_allocWithZone(v1);
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  v5 = v2;

  return v5;
}

id UndoMedsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  char *v2;
  id v3;
  id v6;
  Class isa;
  Class v8;
  objc_super v10;
  uint64_t v11;
  id v12;

  v11 = a1;
  v2 = v1;
  v12 = v1;
  *(_QWORD *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v8 = isa;
  }
  else
  {
    v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    v3 = v6;
    v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id UndoMedsIntentResponse.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in UndoMedsIntentResponseCode()
{
  return lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for UndoMedsIntentResponseCode, &type metadata for UndoMedsIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for UndoMedsIntentResponseCode, &type metadata for UndoMedsIntentResponseCode);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode);
    return v0;
  }
  return v2;
}

void sub_2475B4D5C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  key path getter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(a1, a2);
}

void sub_2475B4D70(uint64_t *a1, id *a2)
{
  key path setter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(a1, a2);
}

ValueMetadata *type metadata accessor for UndoMedsIntentResponseCode()
{
  return &type metadata for UndoMedsIntentResponseCode;
}

uint64_t Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  void *v17;
  uint64_t result;
  char *v20;
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
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  uint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  _BYTE **v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  uint32_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  NSObject *v89;
  int v90;
  void (*v91)(char *, char *, uint64_t);
  void (*v92)(char *, uint64_t);
  void (*v93)(char *, uint64_t);
  void (*v94)(char *, uint64_t, uint64_t);
  Class v95;
  id v96;
  unsigned int (*v97)(uint64_t, uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  unint64_t v114;
  char *v115;
  unint64_t v116;
  char *v117;
  unint64_t v118;
  char *v119;
  unint64_t v120;
  char *v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  char *v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  void (*v130)(char *, uint64_t, uint64_t);
  _QWORD *v131;
  uint64_t v132;
  char *v133;
  void (*v134)(char *, uint64_t);
  id v135;
  Class isa;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  void (*v141)(char *, char *, uint64_t);
  id v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _BYTE *v152;
  uint64_t v153;
  uint32_t v154;
  char v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;

  v98 = a3;
  v145 = a1;
  v144 = a2;
  v163 = 0;
  v162 = 0;
  v161 = 0;
  v160 = 0;
  v159 = 0;
  v157 = 0;
  v158 = 0;
  v156 = 0;
  v99 = 0;
  v122 = 0;
  v100 = type metadata accessor for Logger();
  v101 = *(_QWORD *)(v100 - 8);
  v102 = (*(_QWORD *)(v101 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v103 = (char *)v48 - v102;
  v104 = type metadata accessor for DateInterval();
  v105 = *(_QWORD *)(v104 - 8);
  v106 = (*(_QWORD *)(v105 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v104);
  v107 = (char *)v48 - v106;
  v163 = (char *)v48 - v106;
  v108 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v122);
  v109 = (uint64_t)v48 - v108;
  v110 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v3);
  v111 = (uint64_t)v48 - v110;
  v112 = type metadata accessor for Date();
  v113 = *(_QWORD **)(v112 - 8);
  v114 = (v113[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x24BDAC7A8](v122);
  v115 = (char *)v48 - v114;
  v116 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v117 = (char *)v48 - v116;
  v118 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v119 = (char *)v48 - v118;
  v162 = (char *)v48 - v118;
  v120 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v121 = (char *)v48 - v120;
  v161 = (char *)v48 - v120;
  v132 = type metadata accessor for Calendar();
  v131 = *(_QWORD **)(v132 - 8);
  v123 = (v131[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v122);
  v11 = (char *)v48 - v123;
  v133 = (char *)v48 - v123;
  v140 = type metadata accessor for DateComponents();
  v137 = *(_QWORD *)(v140 - 8);
  v127 = *(_QWORD *)(v137 + 64);
  v124 = (v127 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v145);
  v125 = (char *)v48 - v124;
  v160 = (char *)v48 - v124;
  v126 = (v127 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v139 = (char *)v48 - v126;
  v128 = (v127 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v138 = (char *)v48 - v128;
  v159 = (char *)v48 - v128;
  v157 = v14;
  v158 = v15;
  v156 = v16;
  v143 = 0x24BDBC000uLL;
  v135 = (id)objc_opt_self();
  v130 = (void (*)(char *, uint64_t, uint64_t))v131[2];
  v130(v11, v129, v132);
  isa = Calendar._bridgeToObjectiveC()().super.isa;
  v134 = (void (*)(char *, uint64_t))v131[1];
  v134(v133, v132);
  v142 = objc_msgSend(v135, sel_hk_componentsWithDayIndex_calendar_, v145, isa);

  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
  v141 = *(void (**)(char *, char *, uint64_t))(v137 + 32);
  v141(v138, v139, v140);

  v17 = (void *)objc_opt_self();
  result = v145;
  v146 = v17;
  v147 = v145 + v144;
  if (__OFADD__(v145, v144))
  {
    __break(1u);
  }
  else
  {
    v130(v133, v129, v132);
    v95 = Calendar._bridgeToObjectiveC()().super.isa;
    v134(v133, v132);
    v96 = objc_msgSend(v146, sel_hk_componentsWithDayIndex_calendar_, v147, v95);

    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
    v141(v125, v139, v140);

    Calendar.date(from:)();
    v97 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v113[6];
    if (v97(v111, 1, v112) == 1)
    {
      outlined destroy of Date?(v111);
    }
    else
    {
      v94 = (void (*)(char *, uint64_t, uint64_t))v113[4];
      v94(v121, v111, v112);
      Calendar.date(from:)();
      if (v97(v109, 1, v112) != 1)
      {
        v94(v119, v109, v112);
        v91 = (void (*)(char *, char *, uint64_t))v113[2];
        v91(v117, v121, v112);
        v91(v115, v119, v112);
        DateInterval.init(start:end:)();
        (*(void (**)(uint64_t, char *, uint64_t))(v105 + 16))(v98, v107, v104);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v105 + 56))(v98, 0, 1, v104);
        (*(void (**)(char *, uint64_t))(v105 + 8))(v107, v104);
        v92 = (void (*)(char *, uint64_t))v113[1];
        v92(v119, v112);
        v92(v121, v112);
        v93 = *(void (**)(char *, uint64_t))(v137 + 8);
        v93(v125, v140);
        return ((uint64_t (*)(char *, uint64_t))v93)(v138, v140);
      }
      outlined destroy of Date?(v109);
      ((void (*)(char *, uint64_t))v113[1])(v121, v112);
    }
    v20 = v103;
    v59 = Logger.wellnessIntents.unsafeMutableAddressor();
    v60 = &v155;
    v76 = 32;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v20, v59, v100);
    swift_endAccess();
    v63 = *(void (**)(char *, char *, uint64_t))(v137 + 16);
    v63(v139, v138, v140);
    v64 = *(unsigned int *)(v137 + 80);
    v61 = (v64 + 16) & ~(unint64_t)v64;
    v77 = 7;
    v62 = swift_allocObject();
    v141((char *)(v62 + v61), v139, v140);
    swift_retain();
    v21 = swift_allocObject();
    v22 = v62;
    v71 = v21;
    *(_QWORD *)(v21 + 16) = partial apply for implicit closure #1 in Calendar.dateInterval(for:);
    *(_QWORD *)(v21 + 24) = v22;
    swift_release();
    v63(v139, v125, v140);
    v65 = (v64 + 16) & ~(unint64_t)v64;
    v66 = swift_allocObject();
    v141((char *)(v66 + v65), v139, v140);
    swift_retain();
    v23 = swift_allocObject();
    v24 = v66;
    v78 = v23;
    *(_QWORD *)(v23 + 16) = partial apply for implicit closure #1 in Calendar.dateInterval(for:);
    *(_QWORD *)(v23 + 24) = v24;
    swift_release();
    v89 = Logger.logObject.getter();
    v90 = static os_log_type_t.error.getter();
    v69 = &v153;
    v153 = 22;
    v67 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    v68 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v70 = v154;
    v74 = 17;
    v80 = swift_allocObject();
    v73 = 32;
    *(_BYTE *)(v80 + 16) = 32;
    v81 = swift_allocObject();
    v75 = 8;
    *(_BYTE *)(v81 + 16) = 8;
    v25 = swift_allocObject();
    v26 = v71;
    v72 = v25;
    *(_QWORD *)(v25 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4;
    *(_QWORD *)(v25 + 24) = v26;
    v27 = swift_allocObject();
    v28 = v72;
    v82 = v27;
    *(_QWORD *)(v27 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v27 + 24) = v28;
    v83 = swift_allocObject();
    *(_BYTE *)(v83 + 16) = v73;
    v84 = swift_allocObject();
    *(_BYTE *)(v84 + 16) = v75;
    v29 = swift_allocObject();
    v30 = v78;
    v79 = v29;
    *(_QWORD *)(v29 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4;
    *(_QWORD *)(v29 + 24) = v30;
    v31 = swift_allocObject();
    v32 = v79;
    v86 = v31;
    *(_QWORD *)(v31 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v31 + 24) = v32;
    v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v85 = _allocateUninitializedArray<A>(_:)();
    v87 = v33;
    swift_retain();
    v34 = v80;
    v35 = v87;
    *v87 = partial apply for closure #1 in OSLogArguments.append(_:);
    v35[1] = v34;
    swift_retain();
    v36 = v81;
    v37 = v87;
    v87[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v37[3] = v36;
    swift_retain();
    v38 = v82;
    v39 = v87;
    v87[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v39[5] = v38;
    swift_retain();
    v40 = v83;
    v41 = v87;
    v87[6] = partial apply for closure #1 in OSLogArguments.append(_:);
    v41[7] = v40;
    swift_retain();
    v42 = v84;
    v43 = v87;
    v87[8] = partial apply for closure #1 in OSLogArguments.append(_:);
    v43[9] = v42;
    swift_retain();
    v44 = v86;
    v45 = v87;
    v87[10] = partial apply for closure #1 in OSLogArguments.append(_:);
    v45[11] = v44;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v89, (os_log_type_t)v90))
    {
      v46 = v99;
      v51 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v52 = createStorage<A>(capacity:type:)(0);
      v53 = createStorage<A>(capacity:type:)(2);
      v55 = &v152;
      v152 = v51;
      v56 = &v151;
      v151 = v52;
      v57 = &v150;
      v150 = v53;
      v54 = 2;
      serialize(_:at:)(2, &v152);
      serialize(_:at:)(v54, v55);
      v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v149 = v80;
      closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57);
      v58 = v46;
      if (v46)
      {
        __break(1u);
      }
      else
      {
        v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v149 = v81;
        closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
        v49 = 0;
        v47 = v49;
        v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v149 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
        v48[3] = v47;
        v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v149 = v83;
        closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
        v48[2] = 0;
        v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v149 = v84;
        closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
        v48[1] = 0;
        v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v149 = v86;
        closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
        _os_log_impl(&dword_24749F000, v89, (os_log_type_t)v90, "Failed to convert HKDayIndexRange into a valid date interval. Start: %s End: %s", v51, v70);
        destroyStorage<A>(_:count:)(v52, 0, v50);
        destroyStorage<A>(_:count:)(v53, 2, MEMORY[0x24BEE4AD8] + 8);
        MEMORY[0x24957D398](v51, MEMORY[0x24BEE4260]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v101 + 8))(v103, v100);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56))(v98, 1, 1, v104);
    v48[0] = *(_QWORD *)(v137 + 8);
    ((void (*)(char *, uint64_t))v48[0])(v125, v140);
    return ((uint64_t (*)(char *, uint64_t))v48[0])(v138, v140);
  }
  return result;
}

uint64_t MenstrualCycleAnalysis.init(_:calendar:)(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  _BYTE *v30;
  uint64_t (*v31)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE **v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  id v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t *v69;
  uint32_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  NSObject *v82;
  int v83;
  uint64_t (*v84)(uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE *v88[3];
  uint64_t v89;
  uint32_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v66 = a1;
  v58 = a2;
  v94 = 0;
  v93 = 0;
  v92 = 0;
  v61 = 0;
  v57 = 0;
  v64 = type metadata accessor for Logger();
  v62 = *(_QWORD *)(v64 - 8);
  v59 = (*(_QWORD *)(v62 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v66);
  v2 = (char *)v28 - v59;
  v60 = (char *)v28 - v59;
  v93 = v3;
  v92 = v4;
  v63 = Logger.wellnessIntents.unsafeMutableAddressor();
  v65 = &v91;
  v72 = 32;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v2, v63, v64);
  swift_endAccess();
  v5 = v66;
  v73 = 7;
  v74 = swift_allocObject();
  *(_QWORD *)(v74 + 16) = v66;
  v82 = Logger.logObject.getter();
  v83 = static os_log_type_t.debug.getter();
  v69 = &v89;
  v89 = 12;
  v67 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  v68 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v70 = v90;
  v71 = 17;
  v76 = swift_allocObject();
  *(_BYTE *)(v76 + 16) = 64;
  v77 = swift_allocObject();
  *(_BYTE *)(v77 + 16) = 8;
  v6 = swift_allocObject();
  v7 = v74;
  v75 = v6;
  *(_QWORD *)(v6 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
  *(_QWORD *)(v6 + 24) = v7;
  v8 = swift_allocObject();
  v9 = v75;
  v79 = v8;
  *(_QWORD *)(v8 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v8 + 24) = v9;
  v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v78 = _allocateUninitializedArray<A>(_:)();
  v80 = v10;
  swift_retain();
  v11 = v76;
  v12 = v80;
  *v80 = partial apply for closure #1 in OSLogArguments.append(_:);
  v12[1] = v11;
  swift_retain();
  v13 = v77;
  v14 = v80;
  v80[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v14[3] = v13;
  swift_retain();
  v15 = v79;
  v16 = v80;
  v80[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v82, (os_log_type_t)v83))
  {
    v17 = v57;
    v50 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v51 = createStorage<A>(capacity:type:)(1);
    v52 = createStorage<A>(capacity:type:)(0);
    v53 = v88;
    v88[0] = v50;
    v54 = &v87;
    v87 = v51;
    v55 = &v86;
    v86 = v52;
    serialize(_:at:)(2, v88);
    serialize(_:at:)(1, v53);
    v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v85 = v76;
    closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55);
    v56 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v85 = v77;
      closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)v88, (uint64_t)&v87, (uint64_t)&v86);
      v46 = 0;
      v19 = v46;
      v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v85 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v84, (uint64_t)v88, (uint64_t)&v87, (uint64_t)&v86);
      v45 = v19;
      _os_log_impl(&dword_24749F000, v82, (os_log_type_t)v83, "%@", v50, v70);
      destroyStorage<A>(_:count:)(v51, 1, v49);
      destroyStorage<A>(_:count:)(v52, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](v50, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
      v47 = v45;
    }
  }
  else
  {
    v18 = v57;
    swift_release();
    swift_release();
    swift_release();
    v47 = v18;
  }
  v20 = v47;

  (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v64);
  v38 = objc_msgSend(v66, sel_menstruationProjections);
  v39 = 0;
  type metadata accessor for HKMCProjection();
  v88[2] = (_BYTE *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  KeyPath = swift_getKeyPath();
  swift_retain();
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMCProjection]);
  v42 = type metadata accessor for HKDayIndexRange();
  v21 = lazy protocol witness table accessor for type [HKMCProjection] and conformance [A]();
  result = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:), KeyPath, v41, v42, MEMORY[0x24BEE4078], v21, MEMORY[0x24BEE40A8], v48);
  v43 = v20;
  v44 = (_BYTE *)result;
  if (v20)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    v30 = v44;
    swift_release();
    swift_release();
    outlined destroy of [HKQuantityType]();

    v88[1] = v30;
    v31 = implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(v58);
    v32 = v23;
    swift_retain();
    v33 = v28;
    MEMORY[0x24BDAC7A8](v31);
    v24 = &v28[-4];
    v34 = &v28[-4];
    v24[2] = v25;
    v24[3] = v26;
    v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKDayIndexRange]);
    v36 = type metadata accessor for DateInterval();
    lazy protocol witness table accessor for type [HKDayIndexRange] and conformance [A]();
    v37 = Sequence.compactMap<A>(_:)();
    v29 = v37;
    swift_release();
    swift_release();
    outlined destroy of [HKQuantityType]();
    swift_bridgeObjectRetain();
    v28[1] = &v94;
    v94 = v29;
    v27 = type metadata accessor for Calendar();
    (*(void (**)(uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v58);

    outlined destroy of [HKQuantityType]();
    return v29;
  }
  return result;
}

void key path getter for HKMCProjection.mostLikelyDays : HKMCProjection(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v4 = *a1;
  v2 = *a1;
  *a2 = objc_msgSend(v4, sel_mostLikelyDays);
  a2[1] = v3;

}

uint64_t implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(id *a1)
{
  id v1;
  id v3;

  v3 = *a1;
  v1 = *a1;
  swift_retain();
  swift_getAtKeyPath();

  return swift_release();
}

uint64_t (*implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(uint64_t a1))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5[1] = a1;
  v13 = 0;
  v11 = type metadata accessor for Calendar();
  v8 = *(_QWORD *)(v11 - 8);
  v7 = *(_QWORD *)(v8 + 64);
  v6 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x24BDAC7A8](v11);
  v10 = (char *)v5 - v6;
  v13 = v2;
  (*(void (**)(double))(v3 + 16))(v1);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v9, v10, v11);
  return partial apply for implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:);
}

uint64_t implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Calendar.dateInterval(for:)(a1, a2, a3);
}

uint64_t thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(_QWORD *a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  return a2(*a1, a1[1]);
}

uint64_t MenstrualCycleAnalysis.init(menstruationProjections:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  outlined destroy of [HKQuantityType]();
  return a1;
}

uint64_t implicit closure #1 in Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for DateComponents();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
}

uint64_t sub_2475B6D94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for DateComponents() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DateComponents() - 8) + 80);
  return implicit closure #1 in Calendar.dateInterval(for:)(v1 + ((v2 + 16) & ~v2), a1);
}

uint64_t sub_2475B6E44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = type metadata accessor for DateComponents();
  v1 = lazy protocol witness table accessor for type DateComponents and conformance DateComponents();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

unint64_t lazy protocol witness table accessor for type DateComponents and conformance DateComponents()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type DateComponents and conformance DateComponents;
  if (!lazy protocol witness table cache variable for type DateComponents and conformance DateComponents)
  {
    v0 = type metadata accessor for DateComponents();
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BDCBE28], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type DateComponents and conformance DateComponents);
    return v1;
  }
  return v3;
}

uint64_t sub_2475B6F38()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for DateComponents() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_2475B6FA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B6FE4()
{
  return swift_deallocObject();
}

uint64_t sub_2475B700C()
{
  return swift_deallocObject();
}

uint64_t sub_2475B7034()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B7070()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B70AC()
{
  return swift_deallocObject();
}

uint64_t sub_2475B70D4()
{
  return swift_deallocObject();
}

uint64_t sub_2475B70FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B7138()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B7174()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475B71B0()
{
  return swift_deallocObject();
}

uint64_t sub_2475B71D8()
{
  return swift_deallocObject();
}

uint64_t sub_2475B7200()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475B723C()
{
  swift_release();
  return swift_deallocObject();
}

char *keypath_get_selector_mostLikelyDays()
{
  return sel_mostLikelyDays;
}

void sub_2475B7284(id *a1@<X0>, _QWORD *a2@<X8>)
{
  key path getter for HKMCProjection.mostLikelyDays : HKMCProjection(a1, a2);
}

uint64_t partial apply for implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(id *a1)
{
  return implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(a1);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(_QWORD *a1)
{
  uint64_t v1;

  return thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(a1, *(uint64_t (**)(_QWORD, _QWORD))(v1 + 16));
}

unint64_t lazy protocol witness table accessor for type [HKDayIndexRange] and conformance [A]()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A];
  if (!lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A])
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKDayIndexRange]);
    v1 = MEMORY[0x24957D92C](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A]);
    return v1;
  }
  return v3;
}

ValueMetadata *type metadata accessor for MenstrualCycleAnalysis()
{
  return &type metadata for MenstrualCycleAnalysis;
}

uint64_t sub_2475B73E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(type metadata accessor for Calendar() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for Calendar();
  return implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(a1, a2, a3);
}

SiriWellnessIntents::WellnessUnit_optional __swiftcall WellnessUnit.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v6;
  SiriWellnessIntents::WellnessUnit_optional v7;

  v1 = _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)v2 = "kilogram";
  *(_QWORD *)(v2 + 8) = 8;
  *(_BYTE *)(v2 + 16) = 2;
  *(_QWORD *)(v2 + 24) = "gram";
  *(_QWORD *)(v2 + 32) = 4;
  *(_BYTE *)(v2 + 40) = 2;
  *(_QWORD *)(v2 + 48) = "pound";
  *(_QWORD *)(v2 + 56) = 5;
  *(_BYTE *)(v2 + 64) = 2;
  *(_QWORD *)(v2 + 72) = "stone";
  *(_QWORD *)(v2 + 80) = 5;
  *(_BYTE *)(v2 + 88) = 2;
  *(_QWORD *)(v2 + 96) = "centimeter";
  *(_QWORD *)(v2 + 104) = 10;
  *(_BYTE *)(v2 + 112) = 2;
  *(_QWORD *)(v2 + 120) = "feet";
  *(_QWORD *)(v2 + 128) = 4;
  *(_BYTE *)(v2 + 136) = 2;
  *(_QWORD *)(v2 + 144) = "meter";
  *(_QWORD *)(v2 + 152) = 5;
  *(_BYTE *)(v2 + 160) = 2;
  *(_QWORD *)(v2 + 168) = "inch";
  *(_QWORD *)(v2 + 176) = 4;
  *(_BYTE *)(v2 + 184) = 2;
  *(_QWORD *)(v2 + 192) = "liter";
  *(_QWORD *)(v2 + 200) = 5;
  *(_BYTE *)(v2 + 208) = 2;
  *(_QWORD *)(v2 + 216) = "second";
  *(_QWORD *)(v2 + 224) = 6;
  *(_BYTE *)(v2 + 232) = 2;
  *(_QWORD *)(v2 + 240) = "minute";
  *(_QWORD *)(v2 + 248) = 6;
  *(_BYTE *)(v2 + 256) = 2;
  *(_QWORD *)(v2 + 264) = "hour";
  *(_QWORD *)(v2 + 272) = 4;
  *(_BYTE *)(v2 + 280) = 2;
  *(_QWORD *)(v2 + 288) = "celsius";
  *(_QWORD *)(v2 + 296) = 7;
  *(_BYTE *)(v2 + 304) = 2;
  *(_QWORD *)(v2 + 312) = "fahrenheit";
  *(_QWORD *)(v2 + 320) = 10;
  *(_BYTE *)(v2 + 328) = 2;
  *(_QWORD *)(v2 + 336) = "mmhg";
  *(_QWORD *)(v2 + 344) = 4;
  *(_BYTE *)(v2 + 352) = 2;
  *(_QWORD *)(v2 + 360) = "bpm";
  *(_QWORD *)(v2 + 368) = 3;
  *(_BYTE *)(v2 + 376) = 2;
  *(_QWORD *)(v2 + 384) = "breath_min";
  *(_QWORD *)(v2 + 392) = 10;
  *(_BYTE *)(v2 + 400) = 2;
  *(_QWORD *)(v2 + 408) = "calories";
  *(_QWORD *)(v2 + 416) = 8;
  *(_BYTE *)(v2 + 424) = 2;
  *(_QWORD *)(v2 + 432) = "joule";
  *(_QWORD *)(v2 + 440) = 5;
  *(_BYTE *)(v2 + 448) = 2;
  *(_QWORD *)(v2 + 456) = "kilojoule";
  *(_QWORD *)(v2 + 464) = 9;
  *(_BYTE *)(v2 + 472) = 2;
  *(_QWORD *)(v2 + 480) = "active_energy";
  *(_QWORD *)(v2 + 488) = 13;
  *(_BYTE *)(v2 + 496) = 2;
  *(_QWORD *)(v2 + 504) = "resting_energy";
  *(_QWORD *)(v2 + 512) = 14;
  *(_BYTE *)(v2 + 520) = 2;
  *(_QWORD *)(v2 + 528) = "mgdl";
  *(_QWORD *)(v2 + 536) = 4;
  *(_BYTE *)(v2 + 544) = 2;
  *(_QWORD *)(v2 + 552) = "mmoll";
  *(_QWORD *)(v2 + 560) = 5;
  *(_BYTE *)(v2 + 568) = 2;
  *(_QWORD *)(v2 + 576) = "percent";
  *(_QWORD *)(v2 + 584) = 7;
  *(_BYTE *)(v2 + 592) = 2;
  *(_QWORD *)(v2 + 600) = "miles";
  *(_QWORD *)(v2 + 608) = 5;
  *(_BYTE *)(v2 + 616) = 2;
  *(_QWORD *)(v2 + 624) = "kilometers";
  *(_QWORD *)(v2 + 632) = 10;
  *(_BYTE *)(v2 + 640) = 2;
  *(_QWORD *)(v2 + 648) = "steps";
  *(_QWORD *)(v2 + 656) = 5;
  *(_BYTE *)(v2 + 664) = 2;
  *(_QWORD *)(v2 + 672) = "flights";
  *(_QWORD *)(v2 + 680) = 7;
  *(_BYTE *)(v2 + 688) = 2;
  *(_QWORD *)(v2 + 696) = "wheelchair_pushes";
  *(_QWORD *)(v2 + 704) = 17;
  *(_BYTE *)(v2 + 712) = 2;
  *(_QWORD *)(v2 + 720) = "strokes";
  *(_QWORD *)(v2 + 728) = 7;
  *(_BYTE *)(v2 + 736) = 2;
  _finalizeUninitializedArray<A>(_:)();
  v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessUnit_kilogram;
LABEL_64:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessUnit_gram;
      goto LABEL_64;
    case 2:
      v7.value = SiriWellnessIntents_WellnessUnit_pound;
      goto LABEL_64;
    case 3:
      v7.value = SiriWellnessIntents_WellnessUnit_stone;
      goto LABEL_64;
    case 4:
      v7.value = SiriWellnessIntents_WellnessUnit_centimeter;
      goto LABEL_64;
    case 5:
      v7.value = SiriWellnessIntents_WellnessUnit_feet;
      goto LABEL_64;
    case 6:
      v7.value = SiriWellnessIntents_WellnessUnit_meter;
      goto LABEL_64;
    case 7:
      v7.value = SiriWellnessIntents_WellnessUnit_inch;
      goto LABEL_64;
    case 8:
      v7.value = SiriWellnessIntents_WellnessUnit_liter;
      goto LABEL_64;
    case 9:
      v7.value = SiriWellnessIntents_WellnessUnit_second;
      goto LABEL_64;
    case 10:
      v7.value = SiriWellnessIntents_WellnessUnit_minute;
      goto LABEL_64;
    case 11:
      v7.value = SiriWellnessIntents_WellnessUnit_hour;
      goto LABEL_64;
    case 12:
      v7.value = SiriWellnessIntents_WellnessUnit_celsius;
      goto LABEL_64;
    case 13:
      v7.value = SiriWellnessIntents_WellnessUnit_fahrenheit;
      goto LABEL_64;
    case 14:
      v7.value = SiriWellnessIntents_WellnessUnit_mmhg;
      goto LABEL_64;
    case 15:
      v7.value = SiriWellnessIntents_WellnessUnit_bpm;
      goto LABEL_64;
    case 16:
      v7.value = SiriWellnessIntents_WellnessUnit_breath_min;
      goto LABEL_64;
    case 17:
      v7.value = SiriWellnessIntents_WellnessUnit_calories;
      goto LABEL_64;
    case 18:
      v7.value = SiriWellnessIntents_WellnessUnit_joule;
      goto LABEL_64;
    case 19:
      v7.value = SiriWellnessIntents_WellnessUnit_kilojoule;
      goto LABEL_64;
    case 20:
      v7.value = SiriWellnessIntents_WellnessUnit_active_energy;
      goto LABEL_64;
    case 21:
      v7.value = SiriWellnessIntents_WellnessUnit_resting_energy;
      goto LABEL_64;
    case 22:
      v7.value = SiriWellnessIntents_WellnessUnit_mgdl;
      goto LABEL_64;
    case 23:
      v7.value = SiriWellnessIntents_WellnessUnit_mmoll;
      goto LABEL_64;
    case 24:
      v7.value = SiriWellnessIntents_WellnessUnit_percent;
      goto LABEL_64;
    case 25:
      v7.value = SiriWellnessIntents_WellnessUnit_miles;
      goto LABEL_64;
    case 26:
      v7.value = SiriWellnessIntents_WellnessUnit_kilometers;
      goto LABEL_64;
    case 27:
      v7.value = SiriWellnessIntents_WellnessUnit_steps;
      goto LABEL_64;
    case 28:
      v7.value = SiriWellnessIntents_WellnessUnit_flights;
      goto LABEL_64;
    case 29:
      v7.value = SiriWellnessIntents_WellnessUnit_wheelchair_pushes;
      goto LABEL_64;
    case 30:
      v7.value = SiriWellnessIntents_WellnessUnit_strokes;
      goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessUnit_optional)31;
}

void WellnessUnit.rawValue.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2475B7DC4()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kilogram", 8uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessUnit()
{
  lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessUnit()
{
  return lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
}

unint64_t lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit;
  if (!lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessUnit, &type metadata for WellnessUnit);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit;
  if (!lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit)
  {
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessUnit()
{
  lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessUnit()
{
  lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessUnit()
{
  lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessUnit_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessUnit@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessUnit_optional *a2@<X8>)
{
  SiriWellnessIntents::WellnessUnit_optional result;

  result.value = WellnessUnit.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance WellnessUnit(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  WellnessUnit.rawValue.getter(*v1);
  *a1 = v2;
  a1[1] = v3;
}

uint64_t getEnumTagSinglePayload for WellnessUnit(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xE1)
      goto LABEL_15;
    v7 = ((a2 + 30) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 225;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 31;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for WellnessUnit(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xE1)
  {
    v5 = ((a3 + 30) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xE1)
  {
    v4 = ((a2 - 226) >> 8) + 1;
    *result = a2 + 30;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 30;
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessUnit()
{
  return &type metadata for WellnessUnit;
}

SiriWellnessIntents::WellnessValue_optional __swiftcall WellnessValue.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v6;
  SiriWellnessIntents::WellnessValue_optional v7;

  v1 = _allocateUninitializedArray<A>(_:)();
  *(_QWORD *)v2 = "dry";
  *(_QWORD *)(v2 + 8) = 3;
  *(_BYTE *)(v2 + 16) = 2;
  *(_QWORD *)(v2 + 24) = "sticky";
  *(_QWORD *)(v2 + 32) = 6;
  *(_BYTE *)(v2 + 40) = 2;
  *(_QWORD *)(v2 + 48) = "creamy";
  *(_QWORD *)(v2 + 56) = 6;
  *(_BYTE *)(v2 + 64) = 2;
  *(_QWORD *)(v2 + 72) = "watery";
  *(_QWORD *)(v2 + 80) = 6;
  *(_BYTE *)(v2 + 88) = 2;
  *(_QWORD *)(v2 + 96) = "egg_white";
  *(_QWORD *)(v2 + 104) = 9;
  *(_BYTE *)(v2 + 112) = 2;
  *(_QWORD *)(v2 + 120) = "light";
  *(_QWORD *)(v2 + 128) = 5;
  *(_BYTE *)(v2 + 136) = 2;
  *(_QWORD *)(v2 + 144) = "medium";
  *(_QWORD *)(v2 + 152) = 6;
  *(_BYTE *)(v2 + 160) = 2;
  *(_QWORD *)(v2 + 168) = "heavy";
  *(_QWORD *)(v2 + 176) = 5;
  *(_BYTE *)(v2 + 184) = 2;
  *(_QWORD *)(v2 + 192) = "negative";
  *(_QWORD *)(v2 + 200) = 8;
  *(_BYTE *)(v2 + 208) = 2;
  *(_QWORD *)(v2 + 216) = "positive";
  *(_QWORD *)(v2 + 224) = 8;
  *(_BYTE *)(v2 + 232) = 2;
  *(_QWORD *)(v2 + 240) = "indeterminate";
  *(_QWORD *)(v2 + 248) = 13;
  *(_BYTE *)(v2 + 256) = 2;
  *(_QWORD *)(v2 + 264) = "protected";
  *(_QWORD *)(v2 + 272) = 9;
  *(_BYTE *)(v2 + 280) = 2;
  *(_QWORD *)(v2 + 288) = "not_protected";
  *(_QWORD *)(v2 + 296) = 13;
  *(_BYTE *)(v2 + 304) = 2;
  _finalizeUninitializedArray<A>(_:)();
  v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessValue_dry;
LABEL_28:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessValue_sticky;
      goto LABEL_28;
    case 2:
      v7.value = SiriWellnessIntents_WellnessValue_creamy;
      goto LABEL_28;
    case 3:
      v7.value = SiriWellnessIntents_WellnessValue_watery;
      goto LABEL_28;
    case 4:
      v7.value = SiriWellnessIntents_WellnessValue_egg_white;
      goto LABEL_28;
    case 5:
      v7.value = SiriWellnessIntents_WellnessValue_light;
      goto LABEL_28;
    case 6:
      v7.value = SiriWellnessIntents_WellnessValue_medium;
      goto LABEL_28;
    case 7:
      v7.value = SiriWellnessIntents_WellnessValue_heavy;
      goto LABEL_28;
    case 8:
      v7.value = SiriWellnessIntents_WellnessValue_negative;
      goto LABEL_28;
    case 9:
      v7.value = SiriWellnessIntents_WellnessValue_positive;
      goto LABEL_28;
    case 10:
      v7.value = SiriWellnessIntents_WellnessValue_indeterminate;
      goto LABEL_28;
    case 11:
      v7.value = SiriWellnessIntents_WellnessValue_protected;
      goto LABEL_28;
    case 12:
      v7.value = SiriWellnessIntents_WellnessValue_not_protected;
      goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessValue_optional)13;
}

void WellnessValue.rawValue.getter(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2475B8DDC()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dry", 3uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessValue()
{
  lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessValue()
{
  return lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
}

unint64_t lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue;
  if (!lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessValue, &type metadata for WellnessValue);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue;
  if (!lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for WellnessValue, &type metadata for WellnessValue);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessValue()
{
  lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessValue()
{
  lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessValue()
{
  lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessValue_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessValue@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessValue_optional *a2@<X8>)
{
  SiriWellnessIntents::WellnessValue_optional result;

  result.value = WellnessValue.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance WellnessValue(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  WellnessValue.rawValue.getter(*v1);
  *a1 = v2;
  a1[1] = v3;
}

uint64_t getEnumTagSinglePayload for WellnessValue(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xF3)
      goto LABEL_15;
    v7 = ((a2 + 12) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 243;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 13;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for WellnessValue(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xF3)
  {
    v5 = ((a3 + 12) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xF3)
  {
    v4 = ((a2 - 244) >> 8) + 1;
    *result = a2 + 12;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 12;
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessValue()
{
  return &type metadata for WellnessValue;
}

uint64_t Statistics.init(queryDateRange:dataDateRange:sampleCount:unit:valueRange:latestValue:averageValue:totalValue:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  void (*v52)(uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const void *v64;
  uint64_t v65;
  uint64_t TupleTypeMetadata2;
  int *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;

  v53 = a9;
  v64 = a1;
  v62 = a2;
  v43 = a3;
  v44 = a4;
  v60 = a5;
  v39 = a6;
  v40 = a7;
  v57 = a8;
  v56 = a10;
  v55 = a11;
  v65 = a12;
  v78 = 0;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v74 = 0;
  v72 = 0;
  v73 = 0;
  v71 = 0;
  v70 = 0;
  v69 = 0;
  v79 = a12;
  v54 = *(_QWORD *)(a12 - 8);
  v33 = (*(_QWORD *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](a1);
  v51 = (char *)&v32 - v33;
  v36 = 0;
  v63 = type metadata accessor for DateInterval();
  v61 = *(_QWORD *)(v63 - 8);
  v34 = (*(_QWORD *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v63);
  v42 = (char *)&v32 - v34;
  v35 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v36);
  v41 = (char *)&v32 - v35;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v37 = (*(_QWORD *)(*(_QWORD *)(TupleTypeMetadata2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x24BDAC7A8](v36);
  v49 = (char *)&v32 - v37;
  v38 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v59 = (uint64_t)&v32 - v38;
  v78 = (char *)&v32 - v38;
  v67 = (int *)type metadata accessor for Statistics(v14, v15, v16, v17);
  v18 = MEMORY[0x24BDAC7A8](v59);
  v68 = (char *)&v32 - v19;
  v77 = (char *)&v32 - v19;
  v76 = v20;
  v75 = v62;
  v74 = v43;
  v72 = v21;
  v73 = v22;
  v46 = *(int *)(TupleTypeMetadata2 + 48);
  v52 = *(void (**)(uint64_t))(v23 + 32);
  v52(v18);
  ((void (*)(uint64_t, uint64_t, uint64_t))v52)(v59 + *(int *)(TupleTypeMetadata2 + 48), v40, v65);
  v71 = v57;
  v70 = v56;
  v69 = v55;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v68, 1, 1, v63);
  outlined init with copy of DateInterval?(v64, v41);
  outlined assign with take of DateInterval?(v41, v68);
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v42, v62, v63);
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(&v68[v67[7]], v42, v63);
  *(_QWORD *)&v68[v67[8]] = v43;
  swift_bridgeObjectRetain();
  v24 = v49;
  v25 = v54;
  v26 = v59;
  v27 = v60;
  v28 = v65;
  v29 = TupleTypeMetadata2;
  v30 = &v68[v67[9]];
  *(_QWORD *)v30 = v44;
  *((_QWORD *)v30 + 1) = v27;
  v45 = *(int *)(v29 + 48);
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v50(v24, v26, v28);
  v50(&v49[v45], v59 + v46, v65);
  v48 = *(int *)(TupleTypeMetadata2 + 48);
  v47 = &v68[v67[10]];
  ((void (*)(void))v52)();
  ((void (*)(char *, char *, uint64_t))v52)(&v47[*(int *)(TupleTypeMetadata2 + 48)], &v49[v48], v65);
  v50(v51, v57, v65);
  ((void (*)(char *, char *, uint64_t))v52)(&v68[v67[11]], v51, v65);
  v50(v51, v56, v65);
  ((void (*)(char *, char *, uint64_t))v52)(&v68[v67[12]], v51, v65);
  v50(v51, v55, v65);
  ((void (*)(char *, char *, uint64_t))v52)(&v68[v67[13]], v51, v65);
  outlined init with copy of Statistics<A>(v68, v53, v65, TupleTypeMetadata2, v67);
  v58 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
  v58(v55, v65);
  v58(v56, v65);
  v58(v57, v65);
  outlined destroy of (minimum: A, maximum: A)(v59, v65, TupleTypeMetadata2);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v63);
  outlined destroy of DateInterval?((uint64_t)v64);
  return outlined destroy of Statistics<A>((uint64_t)v68, v65, TupleTypeMetadata2, v67);
}

uint64_t type metadata accessor for Statistics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for Statistics);
}

void *outlined assign with take of DateInterval?(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(const void *, uint64_t, uint64_t);

  v7 = type metadata accessor for DateInterval();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

char *outlined init with copy of Statistics<A>(char *a1, char *a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t v5;
  uint64_t v6;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void (*v12)(void);
  uint64_t v18;
  uint64_t v19;

  v18 = type metadata accessor for DateInterval();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v19 + 48))(a1, 1))
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(a2, a1, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(a2, 0, 1, v18);
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(&a2[a5[7]], &a1[a5[7]], v18);
  *(_QWORD *)&a2[a5[8]] = *(_QWORD *)&a1[a5[8]];
  v6 = a5[9];
  v8 = &a2[v6];
  *(_QWORD *)&a2[v6] = *(_QWORD *)&a1[v6];
  v9 = *(_QWORD *)&a1[v6 + 8];
  swift_bridgeObjectRetain();
  *((_QWORD *)v8 + 1) = v9;
  v10 = &a2[a5[10]];
  v11 = &a1[a5[10]];
  v12 = *(void (**)(void))(*(_QWORD *)(a3 - 8) + 16);
  v12();
  ((void (*)(char *, char *, uint64_t))v12)(&v10[*(int *)(a4 + 48)], &v11[*(int *)(a4 + 48)], a3);
  ((void (*)(char *, char *, uint64_t))v12)(&a2[a5[11]], &a1[a5[11]], a3);
  ((void (*)(char *, char *, uint64_t))v12)(&a2[a5[12]], &a1[a5[12]], a3);
  ((void (*)(char *, char *, uint64_t))v12)(&a2[a5[13]], &a1[a5[13]], a3);
  return a2;
}

uint64_t outlined destroy of (minimum: A, maximum: A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(void);

  v6 = *(void (**)(void))(*(_QWORD *)(a2 - 8) + 8);
  v6();
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a3 + 48), a2);
  return a1;
}

uint64_t outlined destroy of Statistics<A>(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v5;
  void (*v6)(void);
  uint64_t v11;
  uint64_t v12;

  v11 = type metadata accessor for DateInterval();
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1 + a4[7], v11);
  swift_bridgeObjectRelease();
  v5 = a1 + a4[10];
  v6 = *(void (**)(void))(*(_QWORD *)(a2 - 8) + 8);
  v6();
  ((void (*)(uint64_t, uint64_t))v6)(v5 + *(int *)(a3 + 48), a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[11], a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[12], a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[13], a2);
  return a1;
}

void *Statistics.queryDateRange.getter@<X0>(void *a1@<X8>)
{
  const void *v1;

  return outlined init with copy of DateInterval?(v1, a1);
}

uint64_t Statistics.queryDateRange.setter(uint64_t a1)
{
  const void *v1;
  _QWORD v3[2];
  char *v4;
  uint64_t v5;

  v5 = a1;
  v3[0] = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                 - 8)
                     + 64)
         + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v5);
  v4 = (char *)v3 - v3[0];
  outlined init with copy of DateInterval?(v1, (char *)v3 - v3[0]);
  outlined assign with take of DateInterval?(v4, (void *)v3[1]);
  return outlined destroy of DateInterval?(v5);
}

__C::HKQueryOptions (__swiftcall *Statistics.queryDateRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.dataDateRange.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *(int *)(a1 + 28);
  v3 = type metadata accessor for DateInterval();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a2, v2 + v5);
}

uint64_t Statistics.dataDateRange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v7 = a2;
  v10 = type metadata accessor for DateInterval();
  v9 = *(_QWORD *)(v10 - 8);
  v6 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](v10);
  v8 = (char *)&v6 - v6;
  (*(void (**)(double))(v4 + 16))(v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v2 + *(int *)(v7 + 28), v8, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
}

__C::HKQueryOptions (__swiftcall *Statistics.dataDateRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.sampleCount.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 32));
}

uint64_t Statistics.sampleCount.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(a2 + 32)) = result;
  return result;
}

__C::HKQueryOptions (__swiftcall *Statistics.sampleCount.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.unit.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t Statistics.unit.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  swift_bridgeObjectRetain();
  v4 = (_QWORD *)(v3 + *(int *)(a3 + 36));
  *v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

__C::HKQueryOptions (__swiftcall *Statistics.unit.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.valueRange.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(double);
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;

  v17 = a1;
  v22 = a2;
  v10 = a3;
  v20 = *(_QWORD *)(a3 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = (*(_QWORD *)(*(_QWORD *)(TupleTypeMetadata2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v19 = (char *)&v9 - v9;
  v5 = *(int *)(v10 + 40);
  v11 = *(int *)(v6 + 48);
  v12 = *(int *)(v6 + 48);
  v16 = *(_QWORD *)(v7 - 8);
  v14 = *(void (**)(double))(v16 + 16);
  v13 = v3 + v5;
  v14(v4);
  ((void (*)(char *, uint64_t, uint64_t))v14)(&v19[v11], v13 + v12, v20);
  v18 = *(int *)(TupleTypeMetadata2 + 48);
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 32);
  v21(v17, v19, v20);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v21)(v22, &v19[v18], v20);
}

uint64_t Statistics.valueRange.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(double);
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t TupleTypeMetadata2;
  uint64_t v27;

  v10 = a1;
  v14 = a2;
  v19 = a3;
  v25 = *(_QWORD *)(a3 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v12 = *(_QWORD *)(*(_QWORD *)(TupleTypeMetadata2 - 8) + 64);
  v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v23 = (char *)&v10 - v11;
  v13 = v11;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v27 = (uint64_t)&v10 - v13;
  v17 = *(int *)(v6 + 48);
  v20 = *(_QWORD **)(v7 - 8);
  v15 = (void (*)(double))v20[4];
  v15(v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v15)(v27 + *(int *)(TupleTypeMetadata2 + 48), v14, v25);
  v16 = *(int *)(TupleTypeMetadata2 + 48);
  v18 = (void (*)(char *, uint64_t, uint64_t))v20[2];
  v18(v23, v27, v25);
  v18(&v23[v16], v27 + v17, v25);
  v22 = *(int *)(TupleTypeMetadata2 + 48);
  v8 = *(int *)(v19 + 40);
  v24 = (void (*)(uint64_t))v20[5];
  v21 = v3 + v8;
  v24(v3 + v8);
  ((void (*)(uint64_t, char *, uint64_t))v24)(v21 + *(int *)(TupleTypeMetadata2 + 48), &v23[v22], v25);
  return outlined destroy of (minimum: A, maximum: A)(v27, v25, TupleTypeMetadata2);
}

__C::HKQueryOptions (__swiftcall *Statistics.valueRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.latestValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 44));
}

uint64_t Statistics.latestValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v6 = a2;
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v9 - 8);
  v5 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v5 - v5;
  (*(void (**)(void))(v3 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 44), v7, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
}

__C::HKQueryOptions (__swiftcall *Statistics.latestValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.averageValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 48));
}

uint64_t Statistics.averageValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v6 = a2;
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v9 - 8);
  v5 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v5 - v5;
  (*(void (**)(void))(v3 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 48), v7, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
}

__C::HKQueryOptions (__swiftcall *Statistics.averageValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.totalValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t Statistics.totalValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v6 = a2;
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v9 - 8);
  v5 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v5 - v5;
  (*(void (**)(void))(v3 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 52), v7, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
}

__C::HKQueryOptions (__swiftcall *Statistics.totalValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t type metadata instantiation function for Statistics()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Statistics()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = type metadata accessor for DateInterval?();
  v8 = v7;
  if (v0 <= 0x3F)
  {
    v10 = *(_QWORD *)(v7 - 8) + 64;
    v1 = type metadata accessor for DateInterval();
    v8 = v1;
    if (v2 <= 0x3F)
    {
      v11 = *(_QWORD *)(v1 - 8) + 64;
      v12 = MEMORY[0x24BEE0178] + 64;
      v13 = &unk_2475C7C60;
      v3 = swift_checkMetadataState();
      v8 = v3;
      if (v4 <= 0x3F)
      {
        v6 = *(_QWORD *)(v3 - 8);
        swift_getTupleTypeLayout2();
        v14 = &v9;
        v15 = v6 + 64;
        v16 = v6 + 64;
        v17 = v6 + 64;
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v8;
}

unint64_t initializeBufferWithCopyOfBuffer for Statistics(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v20;

  v20 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v20 & 0x20000) != 0)
  {
    v15 = *a2;
    swift_retain();
    *a1 = v15;
    return *a1 + ((v20 + 16) & ~(unint64_t)v20);
  }
  else
  {
    v13 = type metadata accessor for DateInterval();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v14 + 48))(a2, 1))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v14 + 16))(a1, a2, v13);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
    }
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)a1 + *(int *)(a3 + 28), (char *)a2 + *(int *)(a3 + 28), v13);
    *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
    v4 = *(int *)(a3 + 36);
    v7 = (char *)a1 + v4;
    *(_QWORD *)((char *)a1 + v4) = *(uint64_t *)((char *)a2 + v4);
    v8 = *(uint64_t *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((_QWORD *)v7 + 1) = v8;
    v9 = (char *)a1 + *(int *)(a3 + 40);
    v10 = (char *)a2 + *(int *)(a3 + 40);
    v11 = *(_QWORD *)(a3 + 16);
    v12 = *(void (**)(void))(*(_QWORD *)(v11 - 8) + 16);
    v12();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 44), (char *)a2 + *(int *)(a3 + 44), v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 48), (char *)a2 + *(int *)(a3 + 48), v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 52), (char *)a2 + *(int *)(a3 + 52), v11);
    return (unint64_t)a1;
  }
}

uint64_t destroy for Statistics(uint64_t a1, uint64_t a2)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v9;
  uint64_t v10;

  v9 = type metadata accessor for DateInterval();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1 + *(int *)(a2 + 28), v9);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(void (**)(void))(*(_QWORD *)(v5 - 8) + 8);
  v6();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(uint64_t, uint64_t))v6)(v4 + *(int *)(TupleTypeMetadata2 + 48), v5);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 44), v5);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 48), v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 52), v5);
}

char *initializeWithCopy for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v16;
  uint64_t v17;

  v16 = type metadata accessor for DateInterval();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v17 + 48))(a2, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(a1, a2, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v16);
  *(_QWORD *)&a1[*(int *)(a3 + 32)] = *(_QWORD *)&a2[*(int *)(a3 + 32)];
  v4 = *(int *)(a3 + 36);
  v7 = &a1[v4];
  *(_QWORD *)&a1[v4] = *(_QWORD *)&a2[v4];
  v8 = *(_QWORD *)&a2[v4 + 8];
  swift_bridgeObjectRetain();
  *((_QWORD *)v7 + 1) = v8;
  v9 = &a1[*(int *)(a3 + 40)];
  v10 = &a2[*(int *)(a3 + 40)];
  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(void (**)(void))(*(_QWORD *)(v11 - 8) + 16);
  v12();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v11);
  return a1;
}

char *assignWithCopy for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t TupleTypeMetadata2;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);

  v17 = type metadata accessor for DateInterval();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (((unsigned int (*)(char *, uint64_t))v19)(a1, 1))
  {
    if (v19(a2, 1, v17))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(a1, a2, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
    }
  }
  else if (v19(a2, 1, v17))
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(a1, v17);
    v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 24))(a1, a2, v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v17);
  *(_QWORD *)&a1[*(int *)(a3 + 32)] = *(_QWORD *)&a2[*(int *)(a3 + 32)];
  v5 = *(int *)(a3 + 36);
  v8 = &a1[v5];
  *(_QWORD *)&a1[v5] = *(_QWORD *)&a2[v5];
  v9 = *(_QWORD *)&a2[v5 + 8];
  swift_bridgeObjectRetain();
  *((_QWORD *)v8 + 1) = v9;
  swift_bridgeObjectRelease();
  v10 = &a1[*(int *)(a3 + 40)];
  v11 = &a2[*(int *)(a3 + 40)];
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(void (**)(void))(*(_QWORD *)(v12 - 8) + 24);
  v13();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v13)(&v10[*(int *)(TupleTypeMetadata2 + 48)], &v11[*(int *)(TupleTypeMetadata2 + 48)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v12);
  return a1;
}

char *initializeWithTake for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t TupleTypeMetadata2;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v13;
  uint64_t v14;

  v13 = type metadata accessor for DateInterval();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(a2, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(a1, a2, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v13);
  *(_QWORD *)&a1[*(int *)(a3 + 32)] = *(_QWORD *)&a2[*(int *)(a3 + 32)];
  *(_OWORD *)&a1[*(int *)(a3 + 36)] = *(_OWORD *)&a2[*(int *)(a3 + 36)];
  v6 = &a1[*(int *)(a3 + 40)];
  v7 = &a2[*(int *)(a3 + 40)];
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 32);
  v9();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v9)(&v6[*(int *)(TupleTypeMetadata2 + 48)], &v7[*(int *)(TupleTypeMetadata2 + 48)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v8);
  return a1;
}

char *assignWithTake for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t TupleTypeMetadata2;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);

  v16 = type metadata accessor for DateInterval();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t))v18)(a1, 1))
  {
    if (v18(a2, 1, v16))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(a1, a2, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
    }
  }
  else if (v18(a2, 1, v16))
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(a1, v16);
    v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 40))(a1, a2, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 40))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v16);
  *(_QWORD *)&a1[*(int *)(a3 + 32)] = *(_QWORD *)&a2[*(int *)(a3 + 32)];
  v5 = *(int *)(a3 + 36);
  v6 = &a1[v5];
  *(_QWORD *)v6 = *(_QWORD *)&a2[v5];
  *((_QWORD *)v6 + 1) = *(_QWORD *)&a2[v5 + 8];
  swift_bridgeObjectRelease();
  v9 = &a1[*(int *)(a3 + 40)];
  v10 = &a2[*(int *)(a3 + 40)];
  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(void (**)(void))(*(_QWORD *)(v11 - 8) + 40);
  v12();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Statistics()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2475BBA08(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v15;
  uint64_t v16;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  v16 = *(_QWORD *)(v15 - 8);
  if (a2 == *(_DWORD *)(v16 + 84))
  {
    return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v16 + 48))(a1, a2, v15);
  }
  else
  {
    v9 = type metadata accessor for DateInterval();
    v10 = *(_QWORD *)(v9 - 8);
    if (a2 == *(_DWORD *)(v10 + 84))
    {
      return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))(a1 + *(int *)(a3 + 28), a2, v9);
    }
    else if (a2 == 0x7FFFFFFF)
    {
      v8 = -1;
      if (*(_QWORD *)(a1 + *(int *)(a3 + 36) + 8) < 0x100000000uLL)
        v8 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
      return (v8 + 1);
    }
    else
    {
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      v7 = *(_QWORD *)(TupleTypeMetadata2 - 8);
      if (a2 == *(_DWORD *)(v7 + 84))
      {
        return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 40), a2, TupleTypeMetadata2);
      }
      else
      {
        v4 = *(_QWORD *)(a3 + 16);
        v5 = *(_QWORD *)(v4 - 8);
        if (a2 == *(_DWORD *)(v5 + 84))
          return (*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v5 + 48))(a1 + *(int *)(a3 + 44), a2, v4);
        else
          __break(1u);
      }
    }
  }
  return v11;
}

uint64_t storeEnumTagSinglePayload for Statistics()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2475BBC34(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  v14 = *(_QWORD *)(v13 - 8);
  if (a3 == *(_DWORD *)(v14 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v14 + 56))(a1, a2, a2, v13);
  result = type metadata accessor for DateInterval();
  v8 = *(_QWORD *)(result - 8);
  if (a3 == *(_DWORD *)(v8 + 84))
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v8 + 56))(a1 + *(int *)(a4 + 28), a2, a2, result);
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = a2 - 1;
  }
  else
  {
    result = swift_getTupleTypeMetadata2();
    v7 = *(_QWORD *)(result - 8);
    if (a3 == *(_DWORD *)(v7 + 84))
    {
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v7 + 56))(a1 + *(int *)(a4 + 40), a2, a2, result);
    }
    else
    {
      v5 = *(_QWORD *)(a4 + 16);
      v6 = *(_QWORD *)(v5 - 8);
      if (a3 == *(_DWORD *)(v6 + 84))
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v6 + 56))(a1 + *(int *)(a4 + 44), a2, a2, v5);
      else
        __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for DateInterval?()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;

  v4 = lazy cache variable for type metadata for DateInterval?;
  if (!lazy cache variable for type metadata for DateInterval?)
  {
    type metadata accessor for DateInterval();
    v3 = type metadata accessor for Optional();
    v4 = v3;
    if (!v0)
    {
      v1 = v3;
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for DateInterval?);
      return v1;
    }
  }
  return v4;
}

void static InferedMeasurement.__derived_enum_equals(_:_:)(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2475BBF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_2475BBF4C
                                                                                       + dword_2475BBFB4[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2475BBF5C()
{
  uint64_t v1;

  return v1 == 0;
}

void InferedMeasurement.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_2475BC014()
{
  return Hasher.combine<A>(_:)();
}

uint64_t InferedMeasurement.hashValue.getter()
{
  lazy protocol witness table accessor for type InferedMeasurement and conformance InferedMeasurement();
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type InferedMeasurement and conformance InferedMeasurement()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement;
  if (!lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for InferedMeasurement, &type metadata for InferedMeasurement);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement;
  if (!lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for InferedMeasurement, &type metadata for InferedMeasurement);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement);
    return v0;
  }
  return v2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InferedMeasurement(char *a1)
{
  char v1;

  static InferedMeasurement.__derived_enum_equals(_:_:)(*a1);
  return v1 & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance InferedMeasurement()
{
  return InferedMeasurement.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance InferedMeasurement(uint64_t a1)
{
  char *v1;

  InferedMeasurement.hash(into:)(a1, *v1);
}

SiriWellnessIntents::InferedMeasurement __swiftcall getMeasurementType(for:)(Swift::String_optional a1)
{
  id v2;
  unsigned __int8 v3;
  id v4;
  unsigned __int8 v5;
  id v7;
  id v8;
  unsigned __int8 v9;
  void *object;

  object = a1.value._object;
  swift_bridgeObjectRetain();
  if (!object)
    return 3;
  type metadata accessor for HKUnit();
  swift_bridgeObjectRetain();
  v7 = @nonobjc HKUnit.__allocating_init(from:)();
  v8 = objc_msgSend((id)objc_opt_self(), sel_meterUnit);
  v9 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

  if ((v9 & 1) != 0)
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_gramUnit);
    v5 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

    if ((v5 & 1) != 0)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      v2 = objc_msgSend((id)objc_opt_self(), sel_smallCalorieUnit);
      v3 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

      swift_bridgeObjectRelease();
      if ((v3 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

unint64_t base witness table accessor for Equatable in InferedMeasurement()
{
  return lazy protocol witness table accessor for type InferedMeasurement and conformance InferedMeasurement();
}

uint64_t getEnumTagSinglePayload for InferedMeasurement(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *storeEnumTagSinglePayload for InferedMeasurement(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for InferedMeasurement()
{
  return &type metadata for InferedMeasurement;
}

uint64_t UnavailableDataProvider.init(failure:)(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_release();
  outlined destroy of UnavailableDataProvider<A>();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of UnavailableDataProvider<A>()
{
  swift_release();
}

uint64_t UnavailableDataProvider.isQueryAuthorized()()
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
}

uint64_t UnavailableDataProvider.isLoggingAuthorized()()
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
}

uint64_t UnavailableDataProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[9] = a5;
  v5[8] = a4;
  v5[7] = a1;
  v5[4] = v5;
  v5[5] = 0;
  v5[6] = 0;
  v5[2] = 0;
  v5[3] = 0;
  v5[5] = a2;
  v5[6] = a3;
  v5[2] = a4;
  v5[3] = a5;
  return swift_task_switch();
}

uint64_t UnavailableDataProvider.query(start:end:)()
{
  uint64_t v0;
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(v0 + 64);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = swift_retain();
  v3(v1);
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 8))();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance UnavailableDataProvider<A>()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return UnavailableDataProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance UnavailableDataProvider<A>()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = *(_QWORD *)(v0 + 16);
  v1[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return UnavailableDataProvider.isLoggingAuthorized()();
}

uint64_t protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v6 = v3;
  *(_QWORD *)(v3 + 16) = v3;
  v8 = *v2;
  v9 = v2[1];
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 32) = v4;
  type metadata accessor for GetAmbiguousDistanceIntentResponse();
  *v4 = *(_QWORD *)(v6 + 16);
  v4[1] = protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>;
  return UnavailableDataProvider.query(start:end:)(v6 + 24, a1, a2, v8, v9);
}

uint64_t protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 16) + 8))(*(_QWORD *)(v2 + 24));
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v6 = v3;
  *(_QWORD *)(v3 + 16) = v3;
  v8 = *v2;
  v9 = v2[1];
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 32) = v4;
  type metadata accessor for GetBloodPressureIntentResponse();
  *v4 = *(_QWORD *)(v6 + 16);
  v4[1] = protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>;
  return UnavailableDataProvider.query(start:end:)(v6 + 24, a1, a2, v8, v9);
}

uint64_t type metadata instantiation function for UnavailableDataProvider()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for UnavailableDataProvider(_QWORD *a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  swift_retain();
  result = a1;
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t destroy for UnavailableDataProvider()
{
  return swift_release();
}

_QWORD *assignWithCopy for UnavailableDataProvider(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  swift_retain();
  *a1 = v3;
  a1[1] = v4;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for UnavailableDataProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_release();
}

uint64_t type metadata accessor for UnavailableDataProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a4, a4, (uint64_t)&nominal type descriptor for UnavailableDataProvider);
}

uint64_t CardioFitnessLevel.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CardioFitnessLevel()
{
  lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CardioFitnessLevel()
{
  lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CardioFitnessLevel()
{
  lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CardioFitnessLevel()
{
  lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CardioFitnessLevel@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v3;

  result = CardioFitnessLevel.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CardioFitnessLevel(_QWORD *a1@<X8>)
{
  uint64_t v1;

  CardioFitnessLevel.rawValue.getter();
  *a1 = v1;
}

id static CardioFitnessLevelResolutionResult.success(with:)()
{
  uint64_t v0;
  id ObjCClassFromMetadata;

  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  CardioFitnessLevel.rawValue.getter();
  return objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedValue_, v0);
}

id static CardioFitnessLevelResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  id ObjCClassFromMetadata;

  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  CardioFitnessLevel.rawValue.getter();
  return objc_msgSend(ObjCClassFromMetadata, sel_confirmationRequiredWithValueToConfirm_, v0);
}

id CardioFitnessLevelResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v4;
  Class isa;
  id v7;

  v4 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_);

  swift_bridgeObjectRelease();
  return v7;
}

id CardioFitnessLevelResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v2;
  Class isa;
  id v7;
  objc_super v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  v10 = a1;
  v9 = a2;
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = 0;
  v8.super_class = (Class)type metadata accessor for CardioFitnessLevelResolutionResult();
  v7 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, isa, a2);

  if (v7)
  {
    v2 = v7;
    v11 = v7;

    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t type metadata accessor for CardioFitnessLevelResolutionResult()
{
  return objc_opt_self();
}

id CardioFitnessLevelResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CardioFitnessLevelResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in CardioFitnessLevel()
{
  return lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
}

unint64_t lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel()
{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel;
  if (!lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for CardioFitnessLevel, &type metadata for CardioFitnessLevel);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel);
    return v0;
  }
  return v2;
}

{
  unint64_t v0;
  uint64_t v2;

  v2 = lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel;
  if (!lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel)
  {
    v0 = MEMORY[0x24957D92C](&protocol conformance descriptor for CardioFitnessLevel, &type metadata for CardioFitnessLevel);
    atomic_store(v0, (unint64_t *)&lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel);
    return v0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for CardioFitnessLevel()
{
  return &type metadata for CardioFitnessLevel;
}

id GetCardioFitnessIntentHandler.__allocating_init(store:)(_QWORD *a1)
{
  objc_class *v1;
  id v2;

  v2 = objc_allocWithZone(v1);
  return GetCardioFitnessIntentHandler.init(store:)(a1);
}

id GetCardioFitnessIntentHandler.init(store:)(_QWORD *a1)
{
  void *v1;
  id v2;
  SiriWellnessIntents::CycleTrackingFetcher v3;
  id v4;
  id v6;
  char *v7;
  objc_class *ObjectType;
  objc_super v10;
  _QWORD v11[5];
  _QWORD __dst[6];
  id v13;

  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  v2 = v1;
  v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.isa = CycleTrackingFetcher.init()().store.super.isa;
    __dst[3] = &type metadata for CardioFitnessFetcher;
    __dst[4] = &protocol witness table for CardioFitnessFetcher;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v4 = v6;
  v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[24] = v1;
  v2[23] = a1;
  v2[15] = v2;
  v2[16] = 0;
  v2[17] = 0;
  v3 = type metadata accessor for Logger();
  v2[25] = v3;
  v2[26] = *(_QWORD *)(v3 - 8);
  v2[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v4 = type metadata accessor for Date();
  v2[30] = v4;
  v2[31] = *(_QWORD *)(v4 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[16] = a1;
  v2[17] = v1;
  return swift_task_switch();
}

{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 120) = *v1;
  *(_QWORD *)(v3 + 296) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = v0[24];
  v0[15] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store, (uint64_t)(v0 + 2));
  v7 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 8) + **(int **)(v5 + 8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 280) = v2;
  *v2 = *(_QWORD *)(v4 + 120);
  v2[1] = GetCardioFitnessIntentHandler.handle(intent:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *buf;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint32_t size;
  os_log_type_t v16;
  NSObject *oslog;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  void *v31;
  id v32;
  unsigned int (*v33)(_QWORD, uint64_t, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  char v41;

  v41 = *(_BYTE *)(v0 + 308);
  *(_QWORD *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v41 & 1) != 0)
  {
    v38 = objc_msgSend(*(id *)(v40 + 184), sel_startDate);
    if (v38)
    {
      v34 = *(_QWORD *)(v40 + 264);
      v35 = *(_QWORD *)(v40 + 248);
      v36 = *(_QWORD *)(v40 + 240);
      v37 = *(_QWORD *)(v40 + 232);
      static Date._unconditionallyBridgeFromObjectiveC(_:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v37, v34, v36);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v35 + 56))(v37, 0, 1, v36);

    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v40 + 248) + 56))(*(_QWORD *)(v40 + 232), 1, 1, *(_QWORD *)(v40 + 240));
    }
    v33 = *(unsigned int (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v40 + 248) + 48);
    if (v33(*(_QWORD *)(v40 + 232), 1, *(_QWORD *)(v40 + 240)) == 1)
    {
      outlined destroy of Date?(*(_QWORD *)(v40 + 232));
    }
    else
    {
      v31 = *(void **)(v40 + 184);
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 + 248) + 32);
      v30(*(_QWORD *)(v40 + 272), *(_QWORD *)(v40 + 232), *(_QWORD *)(v40 + 240));
      v32 = objc_msgSend(v31, sel_endDate);
      if (v32)
      {
        v26 = *(_QWORD *)(v40 + 264);
        v27 = *(_QWORD *)(v40 + 248);
        v28 = *(_QWORD *)(v40 + 240);
        v29 = *(_QWORD *)(v40 + 224);
        static Date._unconditionallyBridgeFromObjectiveC(_:)();
        v30(v29, v26, v28);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(v29, 0, 1, v28);

      }
      else
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v40 + 248) + 56))(*(_QWORD *)(v40 + 224), 1, 1, *(_QWORD *)(v40 + 240));
      }
      if (v33(*(_QWORD *)(v40 + 224), 1, *(_QWORD *)(v40 + 240)) != 1)
      {
        v19 = *(_QWORD *)(v40 + 192);
        v30(*(_QWORD *)(v40 + 256), *(_QWORD *)(v40 + 224), *(_QWORD *)(v40 + 240));
        outlined init with copy of QuantityPersisting(v19 + OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store, v40 + 56);
        v20 = *(_QWORD *)(v40 + 80);
        v21 = *(_QWORD *)(v40 + 88);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v40 + 56), v20);
        v22 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 + 16) + **(int **)(v21 + 16));
        v1 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v40 + 288) = v1;
        *v1 = *(_QWORD *)(v40 + 120);
        v1[1] = GetCardioFitnessIntentHandler.handle(intent:);
        return v22(*(_QWORD *)(v40 + 272), *(_QWORD *)(v40 + 256), v20, v21);
      }
      v25 = *(_QWORD *)(v40 + 272);
      v23 = *(_QWORD *)(v40 + 248);
      v24 = *(_QWORD *)(v40 + 240);
      outlined destroy of Date?(*(_QWORD *)(v40 + 224));
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
    }
    v3 = *(_QWORD *)(v40 + 216);
    v12 = *(_QWORD *)(v40 + 208);
    v14 = *(_QWORD *)(v40 + 200);
    v13 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v3, v13, v14);
    swift_endAccess();
    oslog = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    *(_QWORD *)(v40 + 144) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v40 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v18 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v16))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v9 = createStorage<A>(capacity:type:)(0);
      v10 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v40 + 152) = buf;
      *(_QWORD *)(v40 + 160) = v9;
      *(_QWORD *)(v40 + 168) = v10;
      serialize(_:at:)(0, (_BYTE **)(v40 + 152));
      serialize(_:at:)(0, (_BYTE **)(v40 + 152));
      *(_QWORD *)(v40 + 176) = v18;
      v11 = (_QWORD *)swift_task_alloc();
      v11[2] = v40 + 152;
      v11[3] = v40 + 160;
      v11[4] = v40 + 168;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, oslog, v16, "Must provide start and end dates for GetCardioFitnessIntent", buf, size);
      destroyStorage<A>(_:count:)(v9, 0, v7);
      destroyStorage<A>(_:count:)(v10, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v40 + 216);
    v4 = *(_QWORD *)(v40 + 208);
    v6 = *(_QWORD *)(v40 + 200);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    type metadata accessor for GetCardioFitnessIntentResponse();
    v39 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, 0);
  }
  else
  {
    type metadata accessor for GetCardioFitnessIntentResponse();
    v39 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(101, 0);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(char *))(*(_QWORD *)(v40 + 120) + 8))(v39);
}

{
  _QWORD *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = v0[34];
  v3 = v0[32];
  v2 = v0[31];
  v5 = v0[30];
  v0[15] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v3, v5);
  v6(v4, v5);
  v7 = v0[37];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[15] + 8))(v7);
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 120) = *v1;
  *(_BYTE *)(v3 + 308) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 48) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return GetCardioFitnessIntentHandler.handle(intent:)((uint64_t)a1);
}

id GetCardioFitnessIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t GetCardioFitnessIntentHandler.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriWellnessIntents.GetCardioFitnessIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.GetCardioFitnessIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/GetCardioFitnessIntentHandler.swift", 55, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id GetCardioFitnessIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CardioFitnessFetcher.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[18] = a3;
  v3[17] = a2;
  v3[16] = a1;
  v3[5] = v3;
  v3[6] = 0;
  v3[7] = 0;
  v3[8] = 0;
  v3[14] = 0;
  v4 = type metadata accessor for Logger();
  v3[19] = v4;
  v3[20] = *(_QWORD *)(v4 - 8);
  v3[21] = swift_task_alloc();
  v5 = type metadata accessor for Date();
  v3[22] = v5;
  v3[23] = *(_QWORD *)(v5 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[6] = a1;
  v3[7] = a2;
  v3[8] = a3;
  return swift_task_switch();
}

uint64_t CardioFitnessFetcher.query(start:end:)()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;

  *(_QWORD *)(v0 + 40) = v0;
  v34 = (void *)objc_opt_self();
  v35 = (void *)*MEMORY[0x24BDD36A0];
  v1 = (id)*MEMORY[0x24BDD36A0];
  v2 = objc_msgSend(v34, sel_quantityTypeForIdentifier_, v35);
  *(_QWORD *)(v0 + 208) = v2;
  v36 = v2;

  if (v36)
  {
    v30 = *(_QWORD *)(v33 + 200);
    v31 = *(_QWORD *)(v33 + 192);
    v24 = *(_QWORD *)(v33 + 184);
    v27 = *(_QWORD *)(v33 + 176);
    v29 = *(void **)(v33 + 144);
    v26 = *(_QWORD *)(v33 + 136);
    v25 = *(_QWORD *)(v33 + 128);
    *(_QWORD *)(v33 + 112) = v36;
    *(_QWORD *)(v33 + 216) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("query(start:end:)", 0x11uLL, 1)._object;
    v3 = v29;
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    v28(v30, v25, v27);
    v28(v31, v26, v27);
    v4 = v36;
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v33 + 224) = v32;
    v32[2] = v29;
    v32[3] = v30;
    v32[4] = v31;
    v32[5] = v36;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v33 + 232) = v5;
    type metadata accessor for GetCardioFitnessIntentResponse();
    *v5 = *(_QWORD *)(v33 + 40);
    v5[1] = CardioFitnessFetcher.query(start:end:);
    return withCheckedContinuation<A>(isolation:function:_:)();
  }
  else
  {
    v7 = *(_QWORD *)(v33 + 168);
    v17 = *(_QWORD *)(v33 + 160);
    v19 = *(_QWORD *)(v33 + 152);
    v18 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v7, v18, v19);
    swift_endAccess();
    v22 = Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    *(_QWORD *)(v33 + 72) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v20 = *(_DWORD *)(v33 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    v23 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v22, v21))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v14 = createStorage<A>(capacity:type:)(0);
      v15 = createStorage<A>(capacity:type:)(0);
      *(_QWORD *)(v33 + 80) = buf;
      *(_QWORD *)(v33 + 88) = v14;
      *(_QWORD *)(v33 + 96) = v15;
      serialize(_:at:)(0, (_BYTE **)(v33 + 80));
      serialize(_:at:)(0, (_BYTE **)(v33 + 80));
      *(_QWORD *)(v33 + 104) = v23;
      v16 = (_QWORD *)swift_task_alloc();
      v16[2] = v33 + 80;
      v16[3] = v33 + 88;
      v16[4] = v33 + 96;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_24749F000, v22, v21, "Couldn't create HKQuantityType for vo2max.", buf, v20);
      destroyStorage<A>(_:count:)(v14, 0, v12);
      destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    }
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v33 + 168);
    v8 = *(_QWORD *)(v33 + 160);
    v10 = *(_QWORD *)(v33 + 152);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
    type metadata accessor for GetCardioFitnessIntentResponse();
    v11 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(char *))(*(_QWORD *)(v33 + 40) + 8))(v11);
  }
}

{
  uint64_t v0;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;

  v8 = *(void **)(*(_QWORD *)v0 + 208);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 200);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 192);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 184);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 176);
  v2 = *(void **)(*(_QWORD *)v0 + 144);
  *(_QWORD *)(*(_QWORD *)v0 + 40) = *(_QWORD *)v0;
  swift_task_dealloc();
  swift_task_dealloc();

  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v4, v6);
  v7(v5, v6);

  swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  _QWORD *v0;
  void *v1;
  uint64_t v3;

  v1 = (void *)v0[26];
  v0[5] = v0;
  v3 = v0[15];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[5] + 8))(v3);
}

uint64_t closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  char *v91;
  id v92;
  id v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  char *v105;
  char *v106;

  v72 = a1;
  v92 = a2;
  v73 = a3;
  v50 = a4;
  v89 = a5;
  v106 = 0;
  v105 = 0;
  v104 = 0;
  v103 = 0;
  v102 = 0;
  v101 = 0;
  v100 = 0;
  v98 = 0;
  v68 = 0;
  v84 = type metadata accessor for Date();
  v81 = *(_QWORD *)(v84 - 8);
  v76 = *(_QWORD *)(v81 + 64);
  v40 = (v76 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v84);
  v83 = (char *)&v40 - v40;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
  v77 = *(_QWORD *)(v80 - 8);
  v75 = *(_QWORD *)(v77 + 64);
  v41 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v80);
  v79 = (char *)&v40 - v41;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  v42 = (*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v58 = (char *)&v40 - v42;
  v43 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v68);
  v57 = (char *)&v40 - v43;
  v96 = type metadata accessor for DateComponents();
  v94 = *(_QWORD *)(v96 - 8);
  v44 = (*(_QWORD *)(v94 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v96);
  v95 = (char *)&v40 - v44;
  v106 = (char *)&v40 - v44;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v45 = (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v52 = (char *)&v40 - v45;
  v46 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]((char *)&v40 - v45);
  v53 = (uint64_t)&v40 - v46;
  v67 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (dateRange: DateInterval?, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], limit: Int));
  v48 = *(_QWORD *)(*((_QWORD *)v67 - 1) + 64);
  v47 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v67);
  v91 = (char *)&v40 - v47;
  v49 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v97 = (char *)&v40 - v49;
  v105 = (char *)&v40 - v49;
  v104 = v10;
  v103 = a2;
  v102 = v11;
  v101 = v12;
  v100 = v13;
  v54 = v14[12];
  v55 = v14[16];
  v56 = v14[20];
  v15 = a2;
  v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16);
  v74(v53, v73, v84);
  v51 = *(void (**)(uint64_t))(v81 + 56);
  v60 = 0;
  v59 = 1;
  v51(v53);
  v74((uint64_t)v52, v50, v84);
  ((void (*)(char *, _QWORD, _QWORD, uint64_t))v51)(v52, v60, v59, v84);
  v62 = (id)HKHealthStore.queryParameters(start:end:)(v97, v53, v52);
  v63 = v16;
  v66 = v17;
  outlined destroy of Date?((uint64_t)v52);
  outlined destroy of Date?(v53);

  v18 = v62;
  *(_QWORD *)&v97[v54] = v62;
  swift_bridgeObjectRetain();
  v19 = v56;
  v20 = v66;
  v21 = v97;
  *(_QWORD *)&v97[v55] = v63;
  *(_QWORD *)&v21[v19] = v20;
  v22 = type metadata accessor for Calendar();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v22 - 8) + 56))(v57, v59);
  v23 = type metadata accessor for TimeZone();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v23 - 8) + 56))(v58, v59);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  v69 = 1;
  DateComponents.day.setter();
  v71 = type metadata accessor for HKStatisticsQuery();
  v24 = v89;
  v61 = v67[12];
  v64 = v67[16];
  v65 = v67[20];
  outlined init with copy of DateInterval?(v97, v91);
  v25 = v63;
  v26 = v64;
  v27 = v65;
  v28 = v66;
  v29 = v67;
  v30 = v91;
  *(_QWORD *)&v91[v61] = v62;
  *(_QWORD *)&v30[v26] = v25;
  *(_QWORD *)&v30[v27] = v28;
  v86 = *(void **)&v30[v29[12]];
  v90 = *(_QWORD *)&v30[v29[16]];
  type metadata accessor for HKStatisticsOptions();
  v31 = _allocateUninitializedArray<A>(_:)();
  *v32 = 2;
  _finalizeUninitializedArray<A>(_:)();
  v70 = v31;
  lazy protocol witness table accessor for type HKStatisticsOptions and conformance HKStatisticsOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  v87 = v99;
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v79, v72, v80);
  v74((uint64_t)v83, v73, v84);
  v33 = v92;
  v78 = (*(unsigned __int8 *)(v77 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
  v82 = (v78 + v75 + *(unsigned __int8 *)(v81 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  v85 = (v82 + v76 + 7) & 0xFFFFFFFFFFFFFFF8;
  v88 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v77 + 32))(v88 + v78, v79, v80);
  (*(void (**)(unint64_t, char *, uint64_t))(v81 + 32))(v88 + v82, v83, v84);
  v34 = v86;
  v35 = v87;
  v36 = v88;
  v37 = v89;
  *(_QWORD *)(v88 + v85) = v92;
  v93 = HKStatisticsQuery.__allocating_init(quantityType:quantitySamplePredicate:options:completionHandler:)(v37, v34, v35, (uint64_t)partial apply for closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:), v36);
  swift_bridgeObjectRelease();
  outlined destroy of DateInterval?((uint64_t)v91);
  v98 = v93;
  v38 = v92;
  objc_msgSend(v92, sel_executeQuery_, v93);

  (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v96);
  return outlined destroy of (dateRange: DateInterval?, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], limit: Int)((uint64_t)v97);
}

void closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  double v36;
  char *v37;
  char *v38;
  id v39;
  char *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  void **v48;
  void *v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  void **v53;
  void *v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  void **v58;
  void *v59;
  char *v60;
  void *v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t *v69;
  void **v70;
  _BYTE **v71;
  uint64_t *v72;
  void **v73;
  uint64_t v74;
  void *v75;
  char **v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t *v84;
  void **v85;
  _BYTE **v86;
  uint64_t *v87;
  void **v88;
  uint64_t v89;
  void *v90;
  char **v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t *v99;
  void **v100;
  _BYTE **v101;
  uint64_t *v102;
  void **v103;
  uint64_t v104;
  char **v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  char *v111;
  uint64_t v112;
  uint64_t *v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t *v116;
  uint32_t v117;
  int v118;
  NSObject *v119;
  uint64_t v120;
  id v121;
  double v122;
  id v123;
  Class isa;
  id v125;
  uint64_t v126;
  char *v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t *v130;
  uint32_t v131;
  int v132;
  NSObject *v133;
  uint64_t v134;
  double v135;
  double v136;
  id v137;
  double v138;
  double v139;
  int v140;
  id v141;
  unint64_t v142;
  id v143;
  id v144;
  unint64_t v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  char *v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t *v155;
  uint32_t v156;
  int v157;
  NSObject *v158;
  uint64_t v159;
  void *v160;
  char **v161;
  uint64_t v162;
  uint64_t v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  _BYTE **v167;
  uint64_t *v168;
  uint64_t *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t *v175;
  uint32_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  _QWORD *v186;
  uint64_t v187;
  NSObject *v188;
  int v189;
  void *v190;
  char **v191;
  id v192;
  uint64_t v193;
  id *v194;
  id v195;
  id v196;
  id v197;
  void *v198;
  uint64_t v199;
  uint64_t *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  id v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  unint64_t v216;
  char *v217;
  unint64_t v218;
  char *v219;
  unint64_t v220;
  uint64_t v221;
  char *v222;
  unint64_t v223;
  char *v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  char *v228;
  uint64_t (*v229)(uint64_t, uint64_t, uint64_t);
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _BYTE *v233;
  char *v234;
  uint64_t v235;
  uint32_t v236;
  uint64_t v237;
  _QWORD v238[2];
  id v239;
  char *v240;
  uint64_t v241;
  char v242;
  uint64_t v243;
  char *v244;
  id v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  _BYTE *v250;
  char *v251;
  uint64_t v252;
  uint32_t v253;
  uint64_t v254;
  double v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  _BYTE *v259;
  char *v260;
  uint64_t v261;
  uint32_t v262;
  char v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  _BYTE *v272;
  char *v273;
  uint64_t v274;
  uint32_t v275;
  char v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  uint64_t v282;

  v209 = a1;
  v213 = a2;
  v225 = a3;
  v210 = a4;
  v211 = a5;
  v212 = a6;
  v282 = 0;
  v281 = 0;
  v280 = 0;
  v279 = 0;
  v278 = 0;
  v277 = 0;
  v203 = 0;
  v268 = 0;
  v267 = 0;
  v266 = 0;
  v265 = 0;
  v264 = 0;
  v255 = 0.0;
  v246 = 0;
  v245 = 0;
  v244 = 0;
  v239 = 0;
  v204 = 0;
  v205 = type metadata accessor for Date();
  v206 = *(_QWORD *)(v205 - 8);
  v207 = (*(_QWORD *)(v206 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v208 = (char *)v61 - v207;
  v214 = type metadata accessor for Logger();
  v215 = *(_QWORD *)(v214 - 8);
  v221 = *(_QWORD *)(v215 + 64);
  v216 = (v221 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v225);
  v217 = (char *)v61 - v216;
  v218 = (v221 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v219 = (char *)v61 - v218;
  v220 = (v221 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v222 = (char *)v61 - v220;
  v223 = (v221 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v224 = (char *)v61 - v223;
  v282 = v9;
  v281 = v10;
  v280 = v11;
  v279 = v12;
  v278 = v13;
  v277 = v14;
  v15 = v11;
  if (v225)
  {
    v202 = v225;
    v200 = &v227;
    v227 = v225;
    v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    type metadata accessor for related decl 'e' for HKErrorCode();
    v16 = swift_dynamicCast();
    if ((v16 & 1) != 0)
      v198 = v226;
    else
      v198 = 0;
    v201 = v198;
  }
  else
  {
    v201 = 0;
  }
  v197 = v201;
  if (v201)
  {
    v196 = v197;
    v192 = v197;
    v239 = v197;
    v18 = v197;
    v194 = (id *)v238;
    v238[0] = v192;
    v193 = type metadata accessor for related decl 'e' for HKErrorCode();
    lazy protocol witness table accessor for type related decl 'e' for HKErrorCode and conformance related decl 'e' for HKErrorCode();
    _BridgedStoredNSError.code.getter();
    outlined destroy of HealthKitPersistor(v194);
    if (v238[1] == 6)
    {
      v190 = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      v19 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(103, v190);
      v191 = &v228;
      v228 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();

    }
    else
    {
      v20 = v224;
      v171 = Logger.wellnessIntents.unsafeMutableAddressor();
      v172 = &v237;
      v178 = 32;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v20, v171, v214);
      swift_endAccess();
      v21 = v192;
      v179 = 7;
      v180 = swift_allocObject();
      *(_QWORD *)(v180 + 16) = v192;
      v188 = Logger.logObject.getter();
      v189 = static os_log_type_t.error.getter();
      v175 = &v235;
      v235 = 12;
      v173 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v174 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v176 = v236;
      v177 = 17;
      v182 = swift_allocObject();
      *(_BYTE *)(v182 + 16) = 64;
      v183 = swift_allocObject();
      *(_BYTE *)(v183 + 16) = 8;
      v22 = swift_allocObject();
      v23 = v180;
      v181 = v22;
      *(_QWORD *)(v22 + 16) = partial apply for implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:);
      *(_QWORD *)(v22 + 24) = v23;
      v24 = swift_allocObject();
      v25 = v181;
      v185 = v24;
      *(_QWORD *)(v24 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(_QWORD *)(v24 + 24) = v25;
      v187 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v184 = _allocateUninitializedArray<A>(_:)();
      v186 = v26;
      swift_retain();
      v27 = v182;
      v28 = v186;
      *v186 = partial apply for closure #1 in OSLogArguments.append(_:);
      v28[1] = v27;
      swift_retain();
      v29 = v183;
      v30 = v186;
      v186[2] = partial apply for closure #1 in OSLogArguments.append(_:);
      v30[3] = v29;
      swift_retain();
      v31 = v185;
      v32 = v186;
      v186[4] = partial apply for closure #1 in OSLogArguments.append(_:);
      v32[5] = v31;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v188, (os_log_type_t)v189))
      {
        v33 = v203;
        v164 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v163 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v165 = createStorage<A>(capacity:type:)(1);
        v166 = createStorage<A>(capacity:type:)(0);
        v167 = &v233;
        v233 = v164;
        v168 = &v232;
        v232 = v165;
        v169 = &v231;
        v231 = v166;
        serialize(_:at:)(2, &v233);
        serialize(_:at:)(1, v167);
        v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        v230 = v182;
        closure #1 in osLogInternal(_:log:type:)(&v229, (uint64_t)v167, (uint64_t)v168, (uint64_t)v169);
        v170 = v33;
        if (v33)
        {
          __break(1u);
        }
        else
        {
          v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
          v230 = v183;
          closure #1 in osLogInternal(_:log:type:)(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
          v162 = 0;
          v229 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
          v230 = v185;
          closure #1 in osLogInternal(_:log:type:)(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
          _os_log_impl(&dword_24749F000, v188, (os_log_type_t)v189, "Error while querying HealthKit for quantity samples: %@", v164, v176);
          destroyStorage<A>(_:count:)(v165, 1, v163);
          destroyStorage<A>(_:count:)(v166, 0, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x24957D398](v164, MEMORY[0x24BEE4260]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v215 + 8))(v224, v214);
      v160 = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      v34 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v160);
      v161 = &v234;
      v234 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();

    }
  }
  else
  {
    v17 = v213;
    if (v213)
    {
      v195 = v213;
      v149 = v213;
      v268 = v213;
      v142 = 0x24BDD4000uLL;
      v146 = objc_msgSend((id)objc_opt_self(), sel_minuteUnit);
      v267 = v146;
      v143 = objc_msgSend((id)objc_opt_self(), sel_gramUnitWithMetricPrefix_, 9);
      v266 = v143;
      v144 = objc_msgSend((id)objc_opt_self(), sel_literUnitWithMetricPrefix_, 4);
      v265 = v144;
      v145 = 0x1F3F20000uLL;
      v147 = objc_msgSend(v144, (SEL)0x1F3F20F68, v143);
      v148 = objc_msgSend(v147, (SEL)(v145 + 3944), v146);

      v264 = v148;
      v150 = objc_msgSend(v149, sel_averageQuantity);
      if (v150)
      {
        v141 = v150;
        v137 = v150;
        objc_msgSend(v150, sel_doubleValueForUnit_, v148);
        v138 = v36;

        v139 = v138;
        v140 = 0;
      }
      else
      {
        v139 = 0.0;
        v140 = 1;
      }
      v136 = v139;
      if ((v140 & 1) != 0)
      {
        v37 = v219;
        v126 = Logger.wellnessIntents.unsafeMutableAddressor();
        v127 = &v263;
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v37, v126, v214);
        swift_endAccess();
        v133 = Logger.logObject.getter();
        v132 = static os_log_type_t.error.getter();
        v130 = &v261;
        v261 = 2;
        v128 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        v129 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        v131 = v262;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        v134 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v133, (os_log_type_t)v132))
        {
          v51 = v203;
          v80 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          v79 = 0;
          v81 = createStorage<A>(capacity:type:)(0);
          v82 = createStorage<A>(capacity:type:)(v79);
          v86 = &v259;
          v259 = v80;
          v87 = &v258;
          v258 = v81;
          v84 = &v257;
          v257 = v82;
          v83 = 0;
          serialize(_:at:)(0, &v259);
          serialize(_:at:)(v83, v86);
          v256 = v134;
          v85 = v61;
          MEMORY[0x24BDAC7A8](v61);
          v52 = v87;
          v53 = &v61[-6];
          v88 = &v61[-6];
          v53[2] = v86;
          v53[3] = v52;
          v53[4] = v54;
          v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v51)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_24749F000, v133, (os_log_type_t)v132, "Unable to create an average value for vo2Max", v80, v131);
            v77 = 0;
            destroyStorage<A>(_:count:)(v81, 0, v78);
            destroyStorage<A>(_:count:)(v82, v77, MEMORY[0x24BEE4AD8] + 8);
            MEMORY[0x24957D398](v80, MEMORY[0x24BEE4260]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v215 + 8))(v219, v214);
        v75 = 0;
        type metadata accessor for GetCardioFitnessIntentResponse();
        v55 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v75);
        v76 = &v260;
        v260 = v55;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
        CheckedContinuation.resume(returning:)();

      }
      else
      {
        v135 = v136;
        v38 = v208;
        v122 = v136;
        v255 = v136;
        v123 = (id)objc_opt_self();
        (*(void (**)(char *, uint64_t, uint64_t))(v206 + 16))(v38, v211, v205);
        isa = Date._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v206 + 8))(v208, v205);
        v39 = v212;
        v125 = objc_msgSend(v123, sel_cardioFitnessPropertiesForDate_healthStore_, isa, v212);

        if (v125)
        {
          v121 = v125;
          v106 = v125;
          v246 = v125;
          v108 = (id)objc_opt_self();
          v107 = objc_msgSend(v106, sel_biologicalSex);
          v41 = objc_msgSend(v106, sel_age);
          v110 = objc_msgSend(v108, sel_cardioFitnessLevelForVO2Max_biologicalSex_age_, v107, v41, v122);
          v245 = v110;
          v109 = 0;
          type metadata accessor for GetCardioFitnessIntentResponse();
          v111 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(4, v109);
          v244 = v111;
          HKMedicationDoseEventStatus.rawValue.getter();
          v43 = CardioFitnessLevel.init(rawValue:)(v42);
          v241 = v43;
          v242 = v44 & 1;
          if ((v44 & 1) != 0)
            v243 = 0;
          else
            v243 = v241;
          objc_msgSend(v111, sel_setCardioFitnessLevel_, v243);
          v45 = v111;
          v105 = &v240;
          v240 = v111;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
          CheckedContinuation.resume(returning:)();

        }
        else
        {
          v40 = v217;
          v112 = Logger.wellnessIntents.unsafeMutableAddressor();
          v113 = &v254;
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v40, v112, v214);
          swift_endAccess();
          v119 = Logger.logObject.getter();
          v118 = static os_log_type_t.error.getter();
          v116 = &v252;
          v252 = 2;
          v114 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          v115 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          v117 = v253;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          v120 = _allocateUninitializedArray<A>(_:)();
          if (os_log_type_enabled(v119, (os_log_type_t)v118))
          {
            v46 = v203;
            v95 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            v94 = 0;
            v96 = createStorage<A>(capacity:type:)(0);
            v97 = createStorage<A>(capacity:type:)(v94);
            v101 = &v250;
            v250 = v95;
            v102 = &v249;
            v249 = v96;
            v99 = &v248;
            v248 = v97;
            v98 = 0;
            serialize(_:at:)(0, &v250);
            serialize(_:at:)(v98, v101);
            v247 = v120;
            v100 = v61;
            MEMORY[0x24BDAC7A8](v61);
            v47 = v102;
            v48 = &v61[-6];
            v103 = &v61[-6];
            v48[2] = v101;
            v48[3] = v47;
            v48[4] = v49;
            v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
            lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
            Sequence.forEach(_:)();
            if (v46)
            {
              __break(1u);
            }
            else
            {
              _os_log_impl(&dword_24749F000, v119, (os_log_type_t)v118, "Unable to find the fitness Level", v95, v117);
              v92 = 0;
              destroyStorage<A>(_:count:)(v96, 0, v93);
              destroyStorage<A>(_:count:)(v97, v92, MEMORY[0x24BEE4AD8] + 8);
              MEMORY[0x24957D398](v95, MEMORY[0x24BEE4260]);
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          (*(void (**)(char *, uint64_t))(v215 + 8))(v217, v214);
          v90 = 0;
          type metadata accessor for GetCardioFitnessIntentResponse();
          v50 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v90);
          v91 = &v251;
          v251 = v50;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
          CheckedContinuation.resume(returning:)();

        }
      }
    }
    else
    {
      v35 = v222;
      v151 = Logger.wellnessIntents.unsafeMutableAddressor();
      v152 = &v276;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v215 + 16))(v35, v151, v214);
      swift_endAccess();
      v158 = Logger.logObject.getter();
      v157 = static os_log_type_t.error.getter();
      v155 = &v274;
      v274 = 2;
      v153 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      v154 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      v156 = v275;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v159 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v158, (os_log_type_t)v157))
      {
        v56 = v203;
        v65 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v64 = 0;
        v66 = createStorage<A>(capacity:type:)(0);
        v67 = createStorage<A>(capacity:type:)(v64);
        v71 = &v272;
        v272 = v65;
        v72 = &v271;
        v271 = v66;
        v69 = &v270;
        v270 = v67;
        v68 = 0;
        serialize(_:at:)(0, &v272);
        serialize(_:at:)(v68, v71);
        v269 = v159;
        v70 = v61;
        MEMORY[0x24BDAC7A8](v61);
        v57 = v72;
        v58 = &v61[-6];
        v73 = &v61[-6];
        v58[2] = v71;
        v58[3] = v57;
        v58[4] = v59;
        v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v56)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_24749F000, v158, (os_log_type_t)v157, "Expecting to find statistics but didn't find them", v65, v156);
          v62 = 0;
          destroyStorage<A>(_:count:)(v66, 0, v63);
          destroyStorage<A>(_:count:)(v67, v62, MEMORY[0x24BEE4AD8] + 8);
          MEMORY[0x24957D398](v65, MEMORY[0x24BEE4260]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v215 + 8))(v222, v214);
      v61[0] = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      v60 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v61[0]);
      v61[1] = &v273;
      v273 = v60;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();
    }
  }
}

uint64_t implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(void *a1)
{
  id v1;
  id v2;
  uint64_t v5;

  v1 = a1;
  v2 = a1;
  v5 = _convertErrorToNSError(_:)();

  return v5;
}

id HKStatisticsQuery.__allocating_init(quantityType:quantitySamplePredicate:options:completionHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;

  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc HKStatisticsQuery.init(quantityType:quantitySamplePredicate:options:completionHandler:)(a1, a2, a3, a4, a5);
}

uint64_t CardioFitnessFetcher.preferredUnit()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[31] = a1;
  v1[21] = v1;
  v1[22] = 0;
  v1[23] = 0;
  v1[26] = 0;
  v1[28] = 0;
  v2 = type metadata accessor for Logger();
  v1[32] = v2;
  v1[33] = *(_QWORD *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[22] = a1;
  return swift_task_switch();
}

uint64_t CardioFitnessFetcher.preferredUnit()()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  id v5;
  _QWORD *v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  _QWORD *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint8_t *buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;

  *(_QWORD *)(v0 + 168) = v0;
  v35 = (void *)objc_opt_self();
  v36 = (void *)*MEMORY[0x24BDD36A0];
  v1 = (id)*MEMORY[0x24BDD36A0];
  v2 = objc_msgSend(v35, sel_quantityTypeForIdentifier_, v36);
  *(_QWORD *)(v0 + 288) = v2;
  v37 = v2;

  if (v37)
  {
    v3 = *(_QWORD *)(v34 + 280);
    v22 = *(_QWORD *)(v34 + 264);
    v24 = *(_QWORD *)(v34 + 256);
    *(_QWORD *)(v34 + 184) = v37;
    v23 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
    *(_QWORD *)(v34 + 296) = v4;
    v4(v3, v23, v24);
    swift_endAccess();
    v5 = v37;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v37;
    v32 = Logger.logObject.getter();
    v33 = static os_log_type_t.debug.getter();
    *(_QWORD *)(v34 + 192) = 12;
    *(_QWORD *)(v34 + 304) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(_QWORD *)(v34 + 312) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(_QWORD *)(v34 + 320) = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    v25 = *(_DWORD *)(v34 + 376);
    v28 = swift_allocObject();
    *(_BYTE *)(v28 + 16) = 64;
    v29 = swift_allocObject();
    *(_BYTE *)(v29 + 16) = 8;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
    *(_QWORD *)(v27 + 24) = v26;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(_QWORD *)(v30 + 24) = v27;
    *(_QWORD *)(v34 + 328) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    v31 = v6;
    swift_retain();
    *v31 = partial apply for closure #1 in OSLogArguments.append(_:);
    v31[1] = v28;
    swift_retain();
    v31[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v31[3] = v29;
    swift_retain();
    v31[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v31[5] = v30;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v32, v33))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      v20 = createStorage<A>(capacity:type:)(1);
      v21 = createStorage<A>(capacity:type:)(0);
      v38 = buf;
      v39 = v20;
      v40 = v21;
      serialize(_:at:)(2, &v38);
      serialize(_:at:)(1, &v38);
      v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v42 = v28;
      closure #1 in osLogInternal(_:log:type:)(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
      v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v42 = v29;
      closure #1 in osLogInternal(_:log:type:)(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
      v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      v42 = v30;
      closure #1 in osLogInternal(_:log:type:)(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
      _os_log_impl(&dword_24749F000, v32, v33, "Looking for preferred units for %@", buf, v25);
      destroyStorage<A>(_:count:)(v20, 1, v18);
      destroyStorage<A>(_:count:)(v21, 0, MEMORY[0x24BEE4AD8] + 8);
      MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v13 = *(_QWORD *)(v34 + 280);
    v12 = *(_QWORD *)(v34 + 264);
    v14 = *(_QWORD *)(v34 + 256);
    v17 = *(id *)(v34 + 248);

    v7 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    *(_QWORD *)(v34 + 336) = v7;
    v7(v13, v14);
    v8 = v17;
    *(_QWORD *)(v34 + 344) = type metadata accessor for HKQuantityType();
    _allocateUninitializedArray<A>(_:)();
    v15 = v9;
    v10 = v37;
    *v15 = v37;
    _finalizeUninitializedArray<A>(_:)();
    *(_QWORD *)(v34 + 352) = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    Set.init(arrayLiteral:)();
    isa = Set._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v34 + 360) = isa;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v34 + 16) = *(_QWORD *)(v34 + 168);
    *(_QWORD *)(v34 + 56) = v34 + 200;
    *(_QWORD *)(v34 + 24) = CardioFitnessFetcher.preferredUnit();
    *(_QWORD *)(v34 + 112) = swift_continuation_init();
    *(_QWORD *)(v34 + 80) = MEMORY[0x24BDAC760];
    *(_DWORD *)(v34 + 88) = 0x40000000;
    *(_DWORD *)(v34 + 92) = 0;
    *(_QWORD *)(v34 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [HKQuantityType : HKUnit];
    *(_QWORD *)(v34 + 104) = &block_descriptor_13;
    objc_msgSend(v17, sel_preferredUnitsForQuantityTypes_completion_, isa, v34 + 80);
    return __swift_continuation_await_point(v34 + 16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v34 + 168) + 8))(0);
  }
}

{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[21] = *v0;
  v1[46] = v1[6];
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v5 = *(id *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 352);
  v6 = *(_QWORD *)(v0 + 344);
  v9 = *(id *)(v0 + 288);
  v1 = *(void **)(v0 + 248);
  *(_QWORD *)(v0 + 168) = v0;
  v8 = *(_QWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 224) = v8;

  v2 = v9;
  *(_QWORD *)(v0 + 240) = v9;
  v3 = type metadata accessor for HKUnit();
  MEMORY[0x24957CF6C](v0 + 240, v8, v6, v3, v7);

  v10 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 168) + 8))(v10);
}

{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  id v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  v21 = *(id *)(v0 + 368);
  v17 = *(id *)(v0 + 360);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  v15 = *(_QWORD *)(v0 + 272);
  v19 = *(_QWORD *)(v0 + 256);
  v16 = *(id *)(v0 + 248);
  *(_QWORD *)(v0 + 168) = v0;
  swift_willThrow();

  v1 = v21;
  *(_QWORD *)(v0 + 208) = v21;
  v18 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v20(v15, v18, v19);
  swift_endAccess();
  v2 = v21;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v21;
  v29 = Logger.logObject.getter();
  v30 = static os_log_type_t.error.getter();
  *(_QWORD *)(v0 + 216) = 12;
  UnsignedInteger<>.init<A>(_:)();
  v22 = *(_DWORD *)(v0 + 380);
  v25 = swift_allocObject();
  *(_BYTE *)(v25 + 16) = 32;
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(_QWORD *)(v24 + 24) = v23;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(_QWORD *)(v27 + 24) = v24;
  _allocateUninitializedArray<A>(_:)();
  v28 = v3;
  swift_retain();
  *v28 = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[1] = v25;
  swift_retain();
  v28[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[3] = v26;
  swift_retain();
  v28[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v28[5] = v27;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v29, v30))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v12 = createStorage<A>(capacity:type:)(0);
    v13 = createStorage<A>(capacity:type:)(1);
    v31 = buf;
    v32 = v12;
    v33 = v13;
    serialize(_:at:)(2, &v31);
    serialize(_:at:)(1, &v31);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    v35 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    _os_log_impl(&dword_24749F000, v29, v30, "Error fetching preferred units: %s", buf, v22);
    destroyStorage<A>(_:count:)(v12, 0, v10);
    destroyStorage<A>(_:count:)(v13, 1, MEMORY[0x24BEE4AD8] + 8);
    MEMORY[0x24957D398](buf, MEMORY[0x24BEE4260]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v8 = (id)v14[46];
  v7 = (void (*)(uint64_t, uint64_t))v14[42];
  v5 = v14[34];
  v6 = v14[32];
  v9 = (id)v14[36];

  v7(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v14[21] + 8))(0);
}

uint64_t protocol witness for CardioFitnessFetching.isReadingAuthorized() in conformance CardioFitnessFetcher()
{
  void **v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;

  *(_QWORD *)(v1 + 16) = v1;
  v4 = *v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return CycleTrackingFetcher.isReadingAuthorized()(v4);
}

uint64_t protocol witness for CardioFitnessFetching.query(start:end:) in conformance CardioFitnessFetcher(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;

  *(_QWORD *)(v3 + 16) = v3;
  v7 = *v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return CardioFitnessFetcher.query(start:end:)(a1, a2, v7);
}

id @nonobjc HKStatisticsQuery.init(quantityType:quantitySamplePredicate:options:completionHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  const void *v8;
  id v11;
  uint64_t aBlock;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v17 = a4;
  v18 = a5;
  aBlock = MEMORY[0x24BDAC760];
  v13 = 1107296256;
  v14 = 0;
  v15 = thunk for @escaping @callee_guaranteed (@guaranteed HKMCAnalysisQuery, @guaranteed HKMCAnalysis?, @guaranteed Error?) -> ();
  v16 = &block_descriptor_46;
  v8 = _Block_copy(&aBlock);
  v11 = objc_msgSend(v7, sel_initWithQuantityType_quantitySamplePredicate_options_completionHandler_, a1, a2, a3);
  _Block_release(v8);
  swift_release();

  return v11;
}

uint64_t sub_2475C1FEC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)
                                                               + async function pointer to @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)))(v6, v4, v5);
}

uint64_t partial apply for closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in CardioFitnessFetcher.query(start:end:)(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2475C20F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475C2134()
{
  return swift_deallocObject();
}

uint64_t sub_2475C215C()
{
  return swift_deallocObject();
}

uint64_t sub_2475C2184()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475C21C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475C21FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2475C2238()
{
  return swift_deallocObject();
}

uint64_t sub_2475C2260()
{
  return swift_deallocObject();
}

uint64_t sub_2475C2288()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475C22C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t type metadata accessor for GetCardioFitnessIntentHandler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for CardioFitnessFetcher()
{
  return &type metadata for CardioFitnessFetcher;
}

unint64_t type metadata accessor for HKStatisticsQuery()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = lazy cache variable for type metadata for HKStatisticsQuery;
  if (!lazy cache variable for type metadata for HKStatisticsQuery)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKStatisticsQuery);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_2475C239C()
{
  uint64_t v0;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
  v3 = *(_QWORD *)(v5 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v2 = v4 + *(_QWORD *)(v3 + 64);
  v8 = type metadata accessor for Date();
  v6 = *(_QWORD *)(v8 - 8);
  v7 = (v2 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = (v7 + *(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v5);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v8);

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>)
                 - 8);
  v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = v9 + *(_QWORD *)(v4 + 64);
  v5 = *(_QWORD *)(type metadata accessor for Date() - 8);
  v6 = (v7 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(a1, a2, a3, v3 + v9, v3 + v6, *(void **)(v3 + ((v6 + *(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_retain();
  result = a1;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_2475C25A4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)()
{
  uint64_t v0;

  return implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(*(void **)(v0 + 16));
}

uint64_t sub_2475C25E8()
{
  return swift_deallocObject();
}

uint64_t sub_2475C2610()
{
  return swift_deallocObject();
}

uint64_t sub_2475C2638()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2475C2674()
{
  swift_release();
  return swift_deallocObject();
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  double v2;
  NSMeasurement result;

  v0 = (objc_class *)MEMORY[0x24BDCB430]();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.isa = v0;
  return result;
}

uint64_t Measurement.init(value:unit:)()
{
  return MEMORY[0x24BDCB488]();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)MEMORY[0x24BDCB810]();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t DateInterval.end.getter()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t DateInterval.init(start:end:)()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t DateInterval.start.getter()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t DateInterval.contains(_:)()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x24BDCB878]();
}

NSDateComponents __swiftcall DateComponents._bridgeToObjectiveC()()
{
  return (NSDateComponents)MEMORY[0x24BDCBCA0]();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t DateComponents.day.getter()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t DateComponents.day.setter()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t DateComponents.hour.setter()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t DateComponents.second.setter()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t dispatch thunk of _BridgedStoredNSError._nsError.getter()
{
  return MEMORY[0x24BDCD278]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x24BDCE330]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x24BDCE5F0]();
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

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t Calendar.init(identifier:)()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t Calendar.startOfDay(for:)()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t Calendar.numberOfDaysBetween(_:and:)()
{
  return MEMORY[0x24BE40E70]();
}

NSCalendar __swiftcall Calendar._bridgeToObjectiveC()()
{
  return (NSCalendar)MEMORY[0x24BDCF0C0]();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t Calendar.date(from:)()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t static Calendar.current.getter()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t _convertBoolToObjCBool(_:)()
{
  return MEMORY[0x24BEE5B78]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t OSSignposter.makeSignpostID()()
{
  return MEMORY[0x24BEE7788]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t OSSignposter.init()()
{
  return MEMORY[0x24BEE77E0]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t OSSignpostIntervalState.__allocating_init(id:isOpen:)()
{
  return MEMORY[0x24BEE7858]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t Logger.wellness.unsafeMutableAddressor()
{
  return MEMORY[0x24BE40ED8]();
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

uint64_t static HKSamplePredicate.quantitySample(type:predicate:)()
{
  return MEMORY[0x24BDD2108]();
}

uint64_t HKStatisticsQueryDescriptor.result(for:)()
{
  return MEMORY[0x24BDD2238]();
}

uint64_t HKStatisticsQueryDescriptor.init(predicate:options:)()
{
  return MEMORY[0x24BDD2248]();
}

uint64_t type metadata accessor for HKStatisticsQueryDescriptor()
{
  return MEMORY[0x24BDD2250]();
}

uint64_t HKStatisticsCollectionQueryDescriptor.result(for:)()
{
  return MEMORY[0x24BDD2318]();
}

uint64_t HKStatisticsCollectionQueryDescriptor.init(predicate:options:anchorDate:intervalComponents:)()
{
  return MEMORY[0x24BDD2328]();
}

uint64_t type metadata accessor for HKStatisticsCollectionQueryDescriptor()
{
  return MEMORY[0x24BDD2330]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x24BEE01A8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.makeIterator()()
{
  return MEMORY[0x24BEE0288]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t Dictionary.Iterator.next()()
{
  return MEMORY[0x24BEE03F0]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE0630](seed);
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t BidirectionalCollection.reversed()()
{
  return MEMORY[0x24BEE07B0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

{
  return MEMORY[0x24BEE09F8]();
}

{
  return MEMORY[0x24BEE0A00]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3;
  void *v4;
  Swift::String result;

  v3 = MEMORY[0x24BEE0AF8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x24BEE0B08]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.init(_:)()
{
  return MEMORY[0x24BEE0DC0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD8]();
}

uint64_t Sequence.allSatisfy(_:)()
{
  return MEMORY[0x24BEE0E38]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t Sequence<>.max()()
{
  return MEMORY[0x24BEE0F08]();
}

uint64_t Sequence<>.min()()
{
  return MEMORY[0x24BEE0F10]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x24BEE1108]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t specialized Array.count.getter()
{
  return MEMORY[0x24BEE5EE0]();
}

{
  return MEMORY[0x24BEE5EE8]();
}

uint64_t Array.append<A>(contentsOf:)()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t specialized Array.append(_:)()
{
  return MEMORY[0x24BEE5F00]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t specialized Array.subscript.getter()
{
  return MEMORY[0x24BEE5F20]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6B98]();
}

uint64_t _sScg8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF()
{
  return MEMORY[0x24BEE6BB8]();
}

uint64_t type metadata accessor for ThrowingTaskGroup.Iterator()
{
  return MEMORY[0x24BEE6BC8]();
}

uint64_t type metadata accessor for ThrowingTaskGroup()
{
  return MEMORY[0x24BEE6BE8]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x24BEE1380]();
}

uint64_t Double.sign.getter()
{
  return MEMORY[0x24BEE13A0]();
}

uint64_t Double.init(_:)()
{
  return MEMORY[0x24BEE1460]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE15B8]();
}

uint64_t Set.makeIterator()()
{
  return MEMORY[0x24BEE15D0]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t Set.Iterator.next()()
{
  return MEMORY[0x24BEE1670]();
}

uint64_t type metadata accessor for Set.Iterator()
{
  return MEMORY[0x24BEE1680]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t specialized Collection<>.makeIterator()()
{
  return MEMORY[0x24BEE5F40]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

HKCategoryType __swiftcall HKCategoryType.init(_:)(HKCategoryTypeIdentifier a1)
{
  return (HKCategoryType)MEMORY[0x24BDD2520](a1);
}

HKQuantityType __swiftcall HKQuantityType.init(_:)(HKQuantityTypeIdentifier a1)
{
  return (HKQuantityType)MEMORY[0x24BDD2530](a1);
}

HKCorrelationType __swiftcall HKCorrelationType.init(_:)(HKCorrelationTypeIdentifier a1)
{
  return (HKCorrelationType)MEMORY[0x24BDD25F0](a1);
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x24BEE7958]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x24BDD01F0](BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x24BDD01F8](integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
  MEMORY[0x24BEE1BE0]();
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x24BEE1C20]();
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

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x24BEE2278]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x24BEE2280]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x24BEE2288]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x24BEE2290]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x24BEE22A0]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x24BEE22A8]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x24BEE28C0]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t _arrayForceCast<A, B>(_:)()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t IndexingIterator.next()()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t specialized IndexingIterator.next()()
{
  return MEMORY[0x24BEE5F50]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _arrayConditionalCast<A, B>(_:)()
{
  return MEMORY[0x24BEE3280]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t withThrowingTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x24BEE3BB8]();
}

Swift::Void __swiftcall _diagnoseUnexpectedNilOptional(_filenameStart:_filenameLength:_filenameIsASCII:_line:_isImplicitUnwrap:)(Builtin::RawPointer _filenameStart, Builtin::Word _filenameLength, Builtin::Int1 _filenameIsASCII, Builtin::Word _line, Builtin::Int1 _isImplicitUnwrap)
{
  MEMORY[0x24BEE3D40](_filenameStart, _filenameLength, _filenameIsASCII, _line, _isImplicitUnwrap);
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t abs<A>(_:)()
{
  return MEMORY[0x24BEE3DE8]();
}

uint64_t max<A>(_:_:)()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t min<A>(_:_:)()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x24BEE42F0]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x24BEE4A20]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x24BEE4A28]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x24BEE4A30]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x24BEE4A38]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x24BEE4A40]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A48]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x24BEE4A50]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x24BEE4A58]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x24BEE4A60]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x24BEE4A68]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x24BEE4A70]();
}

uint64_t HKMCTodayIndex()
{
  return MEMORY[0x24BE46AF0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

