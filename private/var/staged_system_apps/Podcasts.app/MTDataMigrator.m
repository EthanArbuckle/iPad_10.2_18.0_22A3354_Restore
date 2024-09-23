@implementation MTDataMigrator

+ (BOOL)requiresMigration
{
  void *v2;
  uint64_t v3;
  char v4;

  if (qword_1005520D8 != -1)
    swift_once(&qword_1005520D8, sub_10004A76C);
  v2 = off_100561958;
  v3 = swift_bridgeObjectRetain(off_100561958);
  v4 = sub_1002DCC88(v3);
  swift_bridgeObjectRelease(v2);
  return v4 & 1;
}

+ (uint64_t)migrate
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t result;
  uint64_t v17;
  __n128 v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  NSObject *v63;
  os_signpost_type_t v64;
  uint64_t v65;
  char *v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  uint8_t *v72;
  os_signpost_id_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  NSObject *v84;
  uint64_t v85;
  int v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  int v92;
  const char *v93;
  char *v94;
  uint64_t v95;
  uint8_t *v96;
  os_signpost_id_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  char v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  os_signpost_type_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t (**v124)(char *, uint64_t);
  int v125;
  const char *v126;
  char *v127;
  uint8_t *v128;
  os_signpost_id_t v129;
  uint64_t v130;
  NSObject *v131;
  os_log_type_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  char *v148;
  uint64_t v149;
  char *v150;
  char *v151;
  void *v152;
  int v153;
  char *v154;
  uint64_t v155;
  uint64_t (**v156)(char *, uint64_t);
  char *v157;
  uint64_t v158;
  char *v159;
  void (*v160)(char *, char *, uint64_t);
  __n128 v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD v172[3];
  uint64_t v173;
  uint64_t v174;
  _QWORD v175[3];
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;

  v155 = type metadata accessor for OSSignpostError(0);
  v0 = *(char **)(v155 - 8);
  v1 = __chkstk_darwin(v155);
  v3 = (char *)&v149 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v157 = (char *)&v149 - v4;
  v5 = type metadata accessor for OSSignpostID(0);
  v159 = *(char **)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v149 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v162 = (char *)&v149 - v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v149 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v149 - v14;
  if (qword_1005520D8 != -1)
  {
LABEL_71:
    v148 = v15;
    swift_once(&qword_1005520D8, sub_10004A76C);
    v15 = v148;
  }
  result = (uint64_t)off_100561958;
  v17 = *((_QWORD *)off_100561958 + 2);
  if (!v17)
    return result;
  v166 = v15;
  v150 = v3;
  v156 = (uint64_t (**)(char *, uint64_t))v0;
  v151 = v8;
  v167 = v5;
  v3 = (char *)off_100561958 + 32;
  v153 = enum case for OSSignpostError.doubleEnd(_:);
  v152 = off_100561958;
  v18 = swift_bridgeObjectRetain(off_100561958);
  v168 = 0;
  v19 = &qword_100552000;
  v18.n128_u64[0] = 136315138;
  v161 = v18;
  v154 = (char *)&type metadata for Any + 8;
  v165 = v13;
  while (1)
  {
    sub_10000A520((uint64_t)v3, (uint64_t)v175);
    v20 = v176;
    v21 = v177;
    sub_10003A834(v175, v176);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
    v23 = v19[26];
    if ((v22 & 1) == 0)
    {
      if (v23 != -1)
        swift_once(&qword_1005520D0, sub_10004A7D4);
      v40 = type metadata accessor for Logger(0);
      sub_100047DA4(v40, (uint64_t)qword_100561940);
      v41 = sub_10000A520((uint64_t)v175, (uint64_t)v172);
      v42 = Logger.logObject.getter(v41);
      v43 = static os_log_type_t.debug.getter(v42);
      if (os_log_type_enabled(v42, v43))
      {
        v44 = swift_slowAlloc(12, -1);
        v45 = swift_slowAlloc(32, -1);
        v171 = v45;
        *(_DWORD *)v44 = v161.n128_u32[0];
        v46 = v173;
        v47 = v174;
        sub_10003A834(v172, v173);
        v48 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8);
        v49 = v47;
        v13 = v165;
        v50 = v48(v46, v49);
        v53 = StaticString.description.getter(v50, v51, v52);
        v55 = v54;
        *(_QWORD *)(v44 + 4) = sub_10003D274(v53, v54, &v171);
        swift_bridgeObjectRelease(v55);
        sub_10003D380(v172);
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%s] Migration not required, skipping.", (uint8_t *)v44, 0xCu);
        swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v45, -1, -1);
        swift_slowDealloc(v44, -1, -1);
      }
      else
      {
        sub_10003D380(v172);
      }

      goto LABEL_6;
    }
    if (v23 != -1)
      swift_once(&qword_1005520D0, sub_10004A7D4);
    v24 = type metadata accessor for Logger(0);
    v25 = sub_100047DA4(v24, (uint64_t)qword_100561940);
    v26 = sub_10000A520((uint64_t)v175, (uint64_t)v172);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.info.getter(v27);
    v29 = os_log_type_enabled(v27, v28);
    v163 = v25;
    if (v29)
    {
      v30 = swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v171 = v31;
      *(_DWORD *)v30 = v161.n128_u32[0];
      v33 = v173;
      v32 = v174;
      sub_10003A834(v172, v173);
      v34 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v33, v32);
      v37 = StaticString.description.getter(v34, v35, v36);
      v39 = v38;
      *(_QWORD *)(v30 + 4) = sub_10003D274(v37, v38, &v171);
      swift_bridgeObjectRelease(v39);
      sub_10003D380(v172);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%s] Preparing to perform migration step", (uint8_t *)v30, 0xCu);
      swift_arrayDestroy(v31, 1, v154);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);
    }
    else
    {
      sub_10003D380(v172);
    }

    if (qword_1005520C8 != -1)
      swift_once(&qword_1005520C8, sub_1002DCD28);
    v56 = type metadata accessor for OSSignposter(0);
    v57 = sub_100047DA4(v56, (uint64_t)qword_100561928);
    v58 = v176;
    v59 = v177;
    sub_10003A834(v175, v176);
    v60 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v59 + 8))(v58, v59);
    v8 = v61;
    v62 = static OSSignpostID.exclusive.getter();
    v63 = OSSignposter.logHandle.getter(v62);
    v64 = static os_signpost_type_t.begin.getter(v63);
    v5 = (uint64_t)v63;
    result = OS_os_log.signpostsEnabled.getter();
    v164 = v57;
    if ((result & 1) != 0)
    {
      v0 = v159;
      if ((v8 & 1) != 0)
      {
        if ((unint64_t)v60 >> 32)
          goto LABEL_66;
        if (v60 >> 11 == 27)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
          return result;
        }
        if (v60 > 0x10FFFF)
          goto LABEL_67;
        v66 = v13;
        v70 = v168;
        v60 = sub_10017425C();
        v168 = v70;
        v65 = v167;
      }
      else
      {
        v65 = v167;
        if (!v60)
        {
          __break(1u);
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        v66 = v13;
      }
      v71 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v0 + 2);
      v69 = v166;
      v71(v66, v166, v65);
      v72 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v72 = 0;
      v73 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, v64, v73, v60, "", v72, 2u);
      v74 = v72;
      v68 = v167;
      swift_slowDealloc(v74, -1, -1);

      (*((void (**)(char *, uint64_t))v0 + 1))(v66, v68);
      v67 = v71;
      v13 = v66;
    }
    else
    {

      v0 = v159;
      v67 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v159 + 2);
      v69 = v166;
      v68 = v167;
    }
    v160 = v67;
    v67(v13, v69, v68);
    v75 = type metadata accessor for OSSignpostIntervalState(0);
    swift_allocObject(v75, *(unsigned int *)(v75 + 48), *(unsigned __int16 *)(v75 + 52));
    v76 = OSSignpostIntervalState.init(id:isOpen:)(v13, 1);
    v13 = (char *)*((_QWORD *)v0 + 1);
    ((void (*)(char *, uint64_t))v13)(v69, v68);
    v77 = v176;
    v78 = v177;
    sub_10003A834(v175, v176);
    v79 = v168;
    (*(void (**)(uint64_t, uint64_t))(v78 + 24))(v77, v78);
    v168 = v79;
    if (v79)
      break;
    v80 = v176;
    v81 = v177;
    sub_10003A834(v175, v176);
    v82 = (*(uint64_t (**)(uint64_t, uint64_t))(v81 + 8))(v80, v81);
    v8 = v83;
    v84 = OSSignposter.logHandle.getter(v82);
    v0 = v162;
    v85 = OSSignpostIntervalState.signpostID.getter();
    v86 = static os_signpost_type_t.end.getter(v85);
    result = OS_os_log.signpostsEnabled.getter();
    if ((result & 1) != 0)
    {
      if ((v8 & 1) != 0)
      {
        v15 = (char *)&v178;
        v5 = v155;
        if (HIDWORD(v82))
          goto LABEL_69;
        if (v82 >> 11 == 27)
          goto LABEL_73;
        if (v82 > 0x10FFFF)
          goto LABEL_70;
        v89 = v168;
        v82 = (unint64_t)sub_10017425C();
        v168 = v89;
      }
      else
      {
        v5 = v155;
        if (!v82)
          goto LABEL_68;
      }
      LODWORD(v164) = v86;
      swift_retain(v76);
      v90 = v157;
      checkForErrorAndConsumeState(state:)(v91);
      v158 = v76;
      swift_release(v76);
      v92 = v156[11](v90, v5);
      v93 = "[Error] Interval already ended";
      if (v92 != v153)
      {
        v156[1](v157, v5);
        v93 = "SUCCESS";
      }
      v94 = v165;
      v95 = v167;
      v160(v165, v0, v167);
      v96 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v96 = 0;
      v97 = OSSignpostID.rawValue.getter();
      v88 = v95;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v84, (os_signpost_type_t)v164, v97, (const char *)v82, v93, v96, 2u);
      swift_slowDealloc(v96, -1, -1);

      ((void (*)(char *, uint64_t))v13)(v162, v95);
      v87 = v94;
      v76 = v158;
    }
    else
    {

      v87 = v0;
      v88 = v167;
    }
    ((void (*)(char *, uint64_t))v13)(v87, v88);
    v98 = sub_10000A520((uint64_t)v175, (uint64_t)v172);
    v99 = Logger.logObject.getter(v98);
    v100 = static os_log_type_t.info.getter(v99);
    if (os_log_type_enabled(v99, v100))
    {
      v101 = swift_slowAlloc(12, -1);
      v102 = swift_slowAlloc(32, -1);
      v171 = v102;
      *(_DWORD *)v101 = v161.n128_u32[0];
      v103 = v173;
      v104 = v174;
      sub_10003A834(v172, v173);
      v105 = (*(uint64_t (**)(uint64_t, uint64_t))(v104 + 8))(v103, v104);
      v108 = StaticString.description.getter(v105, v106, v107);
      v110 = v109;
      *(_QWORD *)(v101 + 4) = sub_10003D274(v108, v109, &v171);
      swift_bridgeObjectRelease(v110);
      sub_10003D380(v172);
      _os_log_impl((void *)&_mh_execute_header, v99, v100, "[%s] Finished running migration step", (uint8_t *)v101, 0xCu);
      swift_arrayDestroy(v102, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v102, -1, -1);
      swift_slowDealloc(v101, -1, -1);
      swift_release(v76);

    }
    else
    {
      sub_10003D380(v172);

      swift_release(v76);
    }
    v13 = v165;
    v19 = &qword_100552000;
LABEL_6:
    sub_10003D380(v175);
    v3 += 40;
    if (!--v17)
      return swift_bridgeObjectRelease(v152);
  }
  swift_bridgeObjectRelease(v152);
  v111 = v176;
  v112 = v177;
  sub_10003A834(v175, v176);
  v113 = (*(uint64_t (**)(uint64_t, uint64_t))(v112 + 8))(v111, v112);
  v115 = v114;
  v116 = OSSignposter.logHandle.getter(v113);
  v117 = (uint64_t)v151;
  v118 = OSSignpostIntervalState.signpostID.getter();
  v119 = static os_signpost_type_t.end.getter(v118);
  result = OS_os_log.signpostsEnabled.getter();
  v158 = v76;
  if ((result & 1) == 0)
    goto LABEL_51;
  if ((v115 & 1) != 0)
  {
    v117 = v155;
    if (HIDWORD(v113))
      goto LABEL_74;
    if (v113 >> 11 == 27)
      goto LABEL_76;
    if (v113 > 0x10FFFF)
      goto LABEL_75;
    v113 = (unint64_t)sub_10017425C();
    goto LABEL_56;
  }
  v117 = v155;
  if (v113)
  {
LABEL_56:
    swift_retain(v76);
    v122 = v150;
    checkForErrorAndConsumeState(state:)(v123);
    swift_release(v76);
    v124 = v156;
    v125 = v156[11](v122, v117);
    if (v125 == v153)
    {
      v126 = "[Error] Interval already ended";
    }
    else
    {
      v124[1](v122, v117);
      v126 = "ERROR";
    }
    v117 = (uint64_t)v165;
    v127 = v151;
    v121 = v167;
    v160(v165, v151, v167);
    v128 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v128 = 0;
    v129 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, v119, v129, (const char *)v113, v126, v128, 2u);
    swift_slowDealloc(v128, -1, -1);

    ((void (*)(char *, uint64_t))v13)(v127, v121);
    v120 = v168;
    goto LABEL_60;
  }
  __break(1u);
LABEL_51:

  v121 = v167;
  v120 = v168;
LABEL_60:
  ((void (*)(uint64_t, uint64_t))v13)(v117, v121);
  sub_10000A520((uint64_t)v175, (uint64_t)v172);
  swift_errorRetain(v120);
  v130 = swift_errorRetain(v120);
  v131 = Logger.logObject.getter(v130);
  v132 = static os_log_type_t.error.getter(v131);
  if (os_log_type_enabled(v131, v132))
  {
    v133 = v120;
    v134 = swift_slowAlloc(22, -1);
    v135 = swift_slowAlloc(64, -1);
    v171 = v135;
    *(_DWORD *)v134 = 136315394;
    v136 = v173;
    v137 = v174;
    sub_10003A834(v172, v173);
    v138 = (*(uint64_t (**)(uint64_t, uint64_t))(v137 + 8))(v136, v137);
    v141 = StaticString.description.getter(v138, v139, v140);
    v143 = v142;
    v169 = sub_10003D274(v141, v142, &v171);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v134 + 4, v134 + 12);
    swift_bridgeObjectRelease(v143);
    sub_10003D380(v172);
    *(_WORD *)(v134 + 12) = 2080;
    v169 = v133;
    swift_errorRetain(v133);
    v144 = sub_10003F544((uint64_t *)&unk_10055A340);
    v145 = String.init<A>(describing:)(&v169, v144);
    v147 = v146;
    v169 = sub_10003D274(v145, v146, &v171);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, &v170, v134 + 14, v134 + 22);
    swift_bridgeObjectRelease(v147);
    swift_errorRelease(v133);
    swift_errorRelease(v133);
    _os_log_impl((void *)&_mh_execute_header, v131, v132, "[%s] Failed migration. Ending migrator with error: %s", (uint8_t *)v134, 0x16u);
    swift_arrayDestroy(v135, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v135, -1, -1);
    swift_slowDealloc(v134, -1, -1);
    swift_release(v158);

    swift_errorRelease(v133);
  }
  else
  {
    swift_release(v158);
    swift_errorRelease(v120);
    sub_10003D380(v172);
    swift_errorRelease(v120);
    swift_errorRelease(v120);

  }
  return sub_10003D380(v175);
}

- (MTDataMigrator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[MTDataMigrator init](&v3, "init");
}

@end
