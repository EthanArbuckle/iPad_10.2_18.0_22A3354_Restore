uint64_t sub_246106F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_source;
  v2 = *MEMORY[0x24BE91928];
  v3 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, v2, v3);
  type metadata accessor for SiriAutoCompleteHistogram();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v4 + 24) = 1;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_histogram) = v4;
  return v0;
}

void sub_24610700C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v2 = OUTLINED_FUNCTION_51();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_41();
  v6 = v5 - v4;
  v7 = objc_msgSend(a1, sel_error);
  if (v7)
  {
    v8 = v7;
    sub_2461323D0();
    v9 = v8;
    v10 = sub_2461323DC();
    v11 = sub_2461325D4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_2();
      v15 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue();
      v13 = sub_246132808();
      sub_246119920(v13, v14, &v15);
      sub_246132610();

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_22(&dword_246105000, v10, v11, "Error encountered while fetching app intents from Biome: %s", v12);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  OUTLINED_FUNCTION_28();
}

void sub_2461071B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = OUTLINED_FUNCTION_51();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_41();
  swift_beginAccess();
  sub_24610737C(a1, a3, a4 + 16);
  swift_endAccess();
  OUTLINED_FUNCTION_28();
}

void sub_24610737C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  os_log_type_t v44;
  uint8_t *v45;
  unint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  NSObject *v65;
  id v66;
  unsigned int v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  char v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  unint64_t v105;
  char v106;
  unint64_t v107;
  char v108;
  _QWORD *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  uint64_t *v118;
  os_log_type_t v119;
  _DWORD *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  os_log_type_t v126;
  _DWORD *v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  NSObject *v131;
  os_log_type_t v132;
  uint64_t v133;
  id v134;
  id v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned int v143;
  void *v144;
  unint64_t v145;
  uint64_t v146;
  NSObject *v147;
  NSObject *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  _QWORD v163[5];
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;

  v158 = a3;
  v153 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_41();
  v9 = (v8 - v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_60();
  v157 = v11;
  v12 = sub_2461322C8();
  v155 = *(_QWORD *)(v12 - 8);
  v156 = v12;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_60();
  v154 = v14;
  v15 = sub_2461323E8();
  v159 = *(_QWORD *)(v15 - 8);
  v160 = v15;
  OUTLINED_FUNCTION_39();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v141 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v141 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v141 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v141 - v27;
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_24();
  v152 = v29;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_24();
  v151 = v31;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v141 - v33;
  v35 = objc_msgSend(a1, sel_eventBody);
  if (!v35)
  {
    sub_2461323D0();
    sub_2461323DC();
    v44 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_15(v44))
    {
      v45 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_246105000, v9, (os_log_type_t)v34, "nil eventBody", v45, 2u);
      OUTLINED_FUNCTION_0();
    }

    v42 = *(void (**)(char *, uint64_t))(v159 + 8);
    v43 = v19;
    goto LABEL_9;
  }
  v36 = v35;
  v37 = sub_2461097D4(v35);
  if (v38 >> 60 == 15)
  {
    sub_2461323D0();
    sub_2461323DC();
    v39 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_19(v39))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_17(&dword_246105000, v40, v41, "nil interaction");
      OUTLINED_FUNCTION_0();
    }

    v42 = *(void (**)(char *, uint64_t))(v159 + 8);
    v43 = v22;
LABEL_9:
    v42(v43, v160);
    return;
  }
  v148 = v9;
  v150 = v3;
  v46 = v38;
  v47 = (void *)v37;
  sub_24610A844(0, &qword_25754A8F8);
  sub_24610A844(0, &qword_25754A900);
  v48 = sub_2461325EC();
  if (v4)
  {
    sub_2461098D0((uint64_t)v47, v46);

    return;
  }
  v144 = v47;
  v145 = v46;
  v146 = 0;
  if (!v48)
  {
    sub_2461323D0();
    sub_2461323DC();
    v58 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_19(v58))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_17(&dword_246105000, v59, v60, "Unable to unarchive INInteraction from Biome event");
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_44();

    (*(void (**)(char *, uint64_t))(v159 + 8))(v25, v160);
    return;
  }
  v147 = v48;
  v149 = v36;
  v49 = sub_246109834(v36, (SEL *)&selRef_bundleID);
  if (!v50)
  {
    sub_2461323D0();
    sub_2461323DC();
    v61 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_19(v61))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_17(&dword_246105000, v62, v63, "nil bundleId");
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_5();
    v122 = v149;
    v124 = v159;
    v123 = v160;

    (*(void (**)(char *, uint64_t))(v124 + 8))(v28, v123);
    return;
  }
  v51 = v49;
  v52 = v50;
  swift_bridgeObjectRetain();
  v53 = OUTLINED_FUNCTION_43();
  v54 = OUTLINED_FUNCTION_61();
  v55 = sub_24610A26C(v51, v52, v53, *v54);
  v57 = v56;
  swift_bridgeObjectRelease_n();

  v164 = v55;
  v165 = v57;
  if (v55 == 0xD000000000000017 && v57 == 0x80000002461342C0)
  {
    OUTLINED_FUNCTION_59();
LABEL_23:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v163);
    goto LABEL_24;
  }
  v64 = sub_2461327CC();
  OUTLINED_FUNCTION_59();
  if ((v64 & 1) != 0)
    goto LABEL_23;
  __swift_project_boxed_opaque_existential_1(v163, v163[3]);
  OUTLINED_FUNCTION_40();
  v125 = sub_246116E30(v55, v57);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v163);
  if ((v125 & 1) == 0)
  {
    sub_2461323D0();
    sub_2461323DC();
    v126 = OUTLINED_FUNCTION_25();
    if (os_log_type_enabled((os_log_t)0xD000000000000017, v126))
    {
      v127 = (_DWORD *)OUTLINED_FUNCTION_2();
      v161 = (_QWORD *)OUTLINED_FUNCTION_2();
      *v127 = 136315138;
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_53();
      v128 = OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_52(v128);
      sub_246132610();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_65(&dword_246105000, 0xD000000000000017, v126, "Skipping INIntent since app is not installed: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_5();

    (*(void (**)(char *, uint64_t))(v159 + 8))(v34, v160);
    goto LABEL_60;
  }
LABEL_24:
  v65 = v147;
  v66 = -[NSObject intent](v147, sel_intent);
  v67 = objc_msgSend(v66, sel__hasTitle);

  v68 = v149;
  if (!v67)
  {
    v118 = v152;
    sub_2461323D0();
    sub_2461323DC();
    v119 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_15(v119))
    {
      v120 = (_DWORD *)OUTLINED_FUNCTION_2();
      v161 = (_QWORD *)OUTLINED_FUNCTION_2();
      *v120 = 136315138;
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_53();
      v121 = OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_52(v121);
      sub_246132610();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_65(&dword_246105000, v65, OS_LOG_TYPE_DEFAULT, "Skipping INIntent with missing title from bundleId: %s)");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_44();

    (*(void (**)(uint64_t *, uint64_t))(v159 + 8))(v118, v160);
    goto LABEL_60;
  }
  v69 = -[NSObject intent](v65, sel_intent);
  v70 = objc_msgSend(v69, sel__type);

  if (v70 != (id)1)
  {
    v72 = v164;
    v71 = v165;
    OUTLINED_FUNCTION_37();
    v73 = sub_246108128(v72, v71);
    OUTLINED_FUNCTION_46();
    if ((v73 & 1) == 0)
    {
      v129 = v151;
      sub_2461323D0();
      v130 = v147;
      v131 = sub_2461323DC();
      v132 = sub_2461325D4();
      if (os_log_type_enabled(v131, v132))
      {
        v133 = OUTLINED_FUNCTION_2();
        v158 = OUTLINED_FUNCTION_2();
        v161 = (_QWORD *)v158;
        *(_DWORD *)v133 = 136315394;
        v157 = v133 + 4;
        v134 = -[NSObject intent](v130, sel_intent);
        v135 = objc_msgSend(v134, sel__title);

        v136 = sub_246132484();
        v138 = v137;

        v163[0] = sub_246119920(v136, v138, (uint64_t *)&v161);
        sub_246132610();

        swift_bridgeObjectRelease();
        *(_WORD *)(v133 + 12) = 2080;
        OUTLINED_FUNCTION_16();
        v139 = v164;
        v140 = v165;
        OUTLINED_FUNCTION_11();
        v166 = sub_246119920(v139, v140, (uint64_t *)&v161);
        sub_246132610();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_246105000, v131, v132, "Skipping INIntent that is not supported: %s from bundleId: %s", (uint8_t *)v133, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_5();
      (*(void (**)(uint64_t, uint64_t))(v159 + 8))(v129, v160);
      goto LABEL_60;
    }
  }
  v74 = v164;
  v75 = v165;
  OUTLINED_FUNCTION_37();
  v76 = OUTLINED_FUNCTION_43();
  v77 = *OUTLINED_FUNCTION_61();
  sub_24610A3C8(v74, v75, v68, v76, v77, v150);
  v79 = v78;
  OUTLINED_FUNCTION_46();

  v142 = v79;
  v80 = *(_QWORD *)(v79 + 16);
  if (!v80)
  {
LABEL_48:
    OUTLINED_FUNCTION_10();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5();

LABEL_60:
    swift_bridgeObjectRelease();
    return;
  }
  v151 = OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_histogram;
  v81 = (uint64_t *)(v142 + 40);
  v143 = *MEMORY[0x24BE91928];
  while (1)
  {
    v83 = *(v81 - 1);
    v82 = *v81;
    OUTLINED_FUNCTION_56();
    swift_retain();
    sub_246110EE8();
    swift_release();
    if (*(_QWORD *)(*(_QWORD *)v158 + 16))
    {
      OUTLINED_FUNCTION_37();
      sub_24612ACE4(v83, v82);
      v85 = v84;
      OUTLINED_FUNCTION_46();
      if ((v85 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
    }
    v152 = v81;
    v153 = v80;
    v86 = sub_246109834(v68, (SEL *)&selRef_intentClass);
    v88 = v87 ? v86 : 0;
    v89 = v87 ? v87 : 0xE000000000000000;
    v161 = (_QWORD *)v88;
    v162 = v89;
    OUTLINED_FUNCTION_49();
    sub_2461324A8();
    OUTLINED_FUNCTION_47();
    v91 = (uint64_t)v161;
    v90 = v162;
    v92 = objc_msgSend(v68, sel_identifier);
    sub_246132484();

    v161 = (_QWORD *)v91;
    v162 = v90;
    OUTLINED_FUNCTION_49();
    sub_2461324A8();
    OUTLINED_FUNCTION_47();
    swift_bridgeObjectRelease();
    v159 = v162;
    v160 = (uint64_t)v161;
    sub_246132370();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v155 + 104))(v154, v143, v156);
    v93 = sub_2461321D8();
    v94 = (uint64_t *)v158;
    OUTLINED_FUNCTION_63(v157, v95, v96, v93);
    v97 = sub_246132034();
    OUTLINED_FUNCTION_63((uint64_t)v148, v98, v99, v97);
    OUTLINED_FUNCTION_40();
    swift_bridgeObjectRetain();
    v100 = sub_246132328();
    v159 = sub_246109834(v149, (SEL *)&selRef_intentClass);
    v160 = v101;
    swift_retain();
    swift_isUniquelyReferenced_nonNull_native();
    v161 = (_QWORD *)*v94;
    v102 = (uint64_t)v161;
    *v94 = 0x8000000000000000;
    v103 = sub_24612ACE4(v83, v82);
    if (__OFADD__(*(_QWORD *)(v102 + 16), (v104 & 1) == 0))
      break;
    v105 = v103;
    v106 = v104;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754A908);
    if ((sub_2461326F4() & 1) != 0)
    {
      v107 = sub_24612ACE4(v83, v82);
      if ((v106 & 1) != (v108 & 1))
        goto LABEL_63;
      v105 = v107;
    }
    v109 = v161;
    if ((v106 & 1) != 0)
    {
      v110 = (uint64_t *)(v161[7] + 24 * v105);
      swift_release();
      OUTLINED_FUNCTION_47();
      v111 = v159;
      *v110 = v100;
      v110[1] = v111;
      v110[2] = v160;
    }
    else
    {
      v161[(v105 >> 6) + 8] |= 1 << v105;
      v112 = (uint64_t *)(v109[6] + 16 * v105);
      *v112 = v83;
      v112[1] = v82;
      v113 = (uint64_t *)(v109[7] + 24 * v105);
      v114 = v159;
      *v113 = v100;
      v113[1] = v114;
      v113[2] = v160;
      v115 = v109[2];
      v116 = __OFADD__(v115, 1);
      v117 = v115 + 1;
      if (v116)
        goto LABEL_62;
      v109[2] = v117;
      OUTLINED_FUNCTION_40();
    }
    v68 = v149;
    v81 = v152;
    *(_QWORD *)v158 = v109;
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47();
    v80 = v153;
LABEL_47:
    v81 += 2;
    if (!--v80)
      goto LABEL_48;
  }
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  sub_2461327FC();
  __break(1u);
}

uint64_t sub_246108128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  int v9;
  int v10;
  char v11;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = sub_246111E28((uint64_t)&unk_25173B220);
  v5 = *(_QWORD *)(v4 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v29 = a1;
    v30 = a2;
    v33 = MEMORY[0x24BEE4AF8];
    sub_246113760();
    v6 = v33;
    result = sub_246109D28(v4);
    v8 = result;
    v10 = v9;
    v12 = v11 & 1;
    v31 = v4;
    v32 = v4 + 56;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(v4 + 32))
    {
      if (((*(_QWORD *)(v32 + (((unint64_t)v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_17;
      if (*(_DWORD *)(v4 + 36) != v10)
        goto LABEL_18;
      v13 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v8);
      v15 = *v13;
      v14 = v13[1];
      OUTLINED_FUNCTION_49();
      v16 = sub_2461321B4();
      v17 = *(_QWORD *)(v16 + 16);
      OUTLINED_FUNCTION_49();
      if (v17)
      {
        v18 = sub_24612ACE4(v15, v14);
        v19 = v14;
        if ((v20 & 1) != 0)
        {
          v21 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 16 * v18);
          v15 = *v21;
          v19 = v21[1];
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_47();
        }
      }
      else
      {
        v19 = v14;
      }
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_47();
      v22 = *(_QWORD *)(v33 + 16);
      if (v22 >= *(_QWORD *)(v33 + 24) >> 1)
        sub_246113760();
      *(_QWORD *)(v33 + 16) = v22 + 1;
      v23 = v33 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v15;
      *(_QWORD *)(v23 + 40) = v19;
      v4 = v31;
      result = sub_246109C44(v8, v10, v12 & 1, v31);
      v8 = result;
      v10 = v24;
      v12 = v25 & 1;
      if (!--v5)
      {
        sub_24610A904(result, v24, v25 & 1);
        a1 = v29;
        a2 = v30;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  else
  {
LABEL_15:
    v26 = sub_2461279A8(v6, v4);
    sub_246127778(a1, a2, v26);
    v28 = v27;
    OUTLINED_FUNCTION_47();
    return v28 & 1;
  }
  return result;
}

uint64_t sub_246108324(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t i;
  uint64_t v5;
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
    v5 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v3 = v6;
    v6 = v6 || v5 == v2;
    if (v6)
      return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_246108384(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = OUTLINED_FUNCTION_45();
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
    if (v12 || (OUTLINED_FUNCTION_45() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_246108430(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t i;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a2 + 16))
    return 0;
  v3 = a2;
  v4 = a1;
  v31 = a2 + 56;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v30 = (unint64_t)(63 - v5) >> 6;
  v32 = a1 + 56;
  result = swift_bridgeObjectRetain();
  for (i = 0; ; i = v12)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (i << 6);
      v12 = i;
      goto LABEL_23;
    }
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v13 >= v30)
      goto LABEL_40;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v12 = i + 1;
    if (!v14)
    {
      v12 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_40;
      v14 = *(_QWORD *)(v31 + 8 * v12);
      if (!v14)
      {
        v12 = i + 3;
        if (i + 3 >= v30)
          goto LABEL_40;
        v14 = *(_QWORD *)(v31 + 8 * v12);
        if (!v14)
          break;
      }
    }
LABEL_22:
    v7 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_23:
    if (!*(_QWORD *)(v4 + 16))
    {
      v2 = 0;
      goto LABEL_41;
    }
    v16 = v3;
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v19 = *v17;
    v18 = v17[1];
    sub_246132814();
    swift_bridgeObjectRetain();
    sub_24613249C();
    v20 = sub_24613282C();
    v21 = v4;
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = v20 & ~v22;
    if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      goto LABEL_38;
    v24 = *(_QWORD *)(v21 + 48);
    v25 = (_QWORD *)(v24 + 16 * v23);
    v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_2461327CC() & 1) == 0)
    {
      v27 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v27;
        if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        v28 = (_QWORD *)(v24 + 16 * v23);
        v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_2461327CC() & 1) != 0)
          goto LABEL_37;
      }
LABEL_38:
      swift_bridgeObjectRelease();
      v2 = 0;
LABEL_41:
      sub_24610A83C();
      return v2;
    }
LABEL_37:
    result = swift_bridgeObjectRelease();
    v3 = v16;
    v4 = v21;
  }
  v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_40:
    v2 = 1;
    goto LABEL_41;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v12 = i + 4;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v30)
      goto LABEL_40;
    v14 = *(_QWORD *)(v31 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_246108714(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v4 = objc_msgSend(a1, sel__emptyCopy);
  v18 = a2 + 56;
  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  OUTLINED_FUNCTION_37();
  v9 = 0;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  for (v7 &= v7 - 1; ; v7 = (v11 - 1) & v11)
  {
    OUTLINED_FUNCTION_40();
    v13 = (void *)OUTLINED_FUNCTION_58();
    v14 = objc_msgSend(a1, sel_valueForKey_, v13);

    v15 = (void *)OUTLINED_FUNCTION_58();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setValue_forKey_, v14, v15);
    swift_unknownObjectRelease();

    if (v7)
      goto LABEL_4;
LABEL_5:
    v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v10 >= v8)
      goto LABEL_21;
    v11 = *(_QWORD *)(v18 + 8 * v10);
    ++v9;
    if (!v11)
    {
      v9 = v10 + 1;
      if (v10 + 1 >= v8)
        goto LABEL_21;
      v11 = *(_QWORD *)(v18 + 8 * v9);
      if (!v11)
      {
        v9 = v10 + 2;
        if (v10 + 2 >= v8)
          goto LABEL_21;
        v11 = *(_QWORD *)(v18 + 8 * v9);
        if (!v11)
          break;
      }
    }
LABEL_18:
    ;
  }
  v12 = v10 + 3;
  if (v12 >= v8)
  {
LABEL_21:
    swift_release();
    type metadata accessor for DefaultLocaleProvider();
    swift_initStaticObject();
    sub_246125B0C();
    v16 = (void *)sub_246132478();
    OUTLINED_FUNCTION_46();
    v17 = objc_msgSend(v4, sel__titleForLanguage_, v16);

    sub_246132484();
    return;
  }
  v11 = *(_QWORD *)(v18 + 8 * v12);
  if (v11)
  {
    v9 = v12;
    goto LABEL_18;
  }
  while (1)
  {
    v9 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v9 >= v8)
      goto LABEL_21;
    v11 = *(_QWORD *)(v18 + 8 * v9);
    ++v12;
    if (v11)
      goto LABEL_18;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_246108968(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = OUTLINED_FUNCTION_51();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_42();
  sub_2461323D0();
  v5 = sub_2461323DC();
  v6 = sub_2461325BC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246105000, v5, v6, "Ranking SiriKit Intent phrases", v7, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_retain();
  sub_246111034(a1);
  return swift_release();
}

uint64_t sub_246108A64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  char *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char v66;
  void *v67;
  id v68;
  char v69;
  uint64_t v70;
  id v71;
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  os_log_type_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v107 = a3;
  v104 = a2;
  v9 = OUTLINED_FUNCTION_51();
  v105 = *(_QWORD *)(v9 - 8);
  v106 = v9;
  OUTLINED_FUNCTION_39();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (unint64_t)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v96 - v15;
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_24();
  v102 = v17;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_24();
  v103 = v19;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_24();
  v101 = v21;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_24();
  v100 = v23;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_24();
  v98 = v25;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v26);
  v99 = (char *)&v96 - v27;
  v28 = sub_246132190();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_42();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v29 + 104))(v5, *MEMORY[0x24BEA7410], v28);
  v30 = sub_246132184();
  v32 = v31;
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v5, v28);
  if (v30 == a4 && v32 == a5)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v34 = sub_2461327CC();
    swift_bridgeObjectRelease();
    if ((v34 & 1) == 0)
    {
      sub_2461323D0();
      OUTLINED_FUNCTION_7();
      sub_2461323DC();
      v35 = OUTLINED_FUNCTION_36();
      if (os_log_type_enabled((os_log_t)v29, v35))
      {
        v36 = (uint8_t *)OUTLINED_FUNCTION_2();
        v37 = OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_34(v37);
        *(_DWORD *)v36 = 136315138;
        OUTLINED_FUNCTION_11();
        v38 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_20(v38);
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_22(&dword_246105000, v29, v35, "SiriKitIntentSource: processPlayMediaIntent - returning third party app title as is '%s'", v36);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_8();
      (*(void (**)(unint64_t, uint64_t))(v105 + 8))(v13, v106);
      goto LABEL_31;
    }
  }
  objc_opt_self();
  v39 = swift_dynamicCastObjCClass();
  v40 = v107;
  if (!v39)
  {
    sub_2461323D0();
    OUTLINED_FUNCTION_7();
    sub_2461323DC();
    v58 = OUTLINED_FUNCTION_36();
    if (OUTLINED_FUNCTION_15(v58))
    {
      v59 = (uint8_t *)OUTLINED_FUNCTION_2();
      v60 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_34(v60);
      OUTLINED_FUNCTION_9(4.8149e-34);
      v61 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_4(v61);
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_22(&dword_246105000, v29, (os_log_type_t)v13, "SiriKitIntentSource: processPlayMediaIntent - ERROR: cannot convert intent, skipping this title '%s'", v59);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_8();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v16, v106);
    return 0;
  }
  v41 = v39;
  v42 = a1;
  v43 = sub_246109698(v41);
  if (!v43)
    goto LABEL_24;
  v13 = v43;
  v97 = v42;
  if (v43 >> 62)
  {
    OUTLINED_FUNCTION_56();
    v44 = sub_246132724();
    if (v44)
      goto LABEL_13;
    goto LABEL_23;
  }
  v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_56();
  if (!v44)
  {
LABEL_23:
    OUTLINED_FUNCTION_57();
    v40 = v107;
    v42 = v97;
LABEL_24:
    v52 = -[NSObject mediaContainer](v41, sel_mediaContainer);
    v46 = v52;
    v53 = v103;
    if (v52)
      goto LABEL_34;
    v53 = v102;
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_32();
    v54 = OUTLINED_FUNCTION_62();
    if (OUTLINED_FUNCTION_21(v54))
    {
      v55 = (uint8_t *)OUTLINED_FUNCTION_2();
      v56 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_34(v56);
      *(_DWORD *)v55 = 136315138;
      OUTLINED_FUNCTION_11();
      v57 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_20(v57);
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_22(&dword_246105000, v41, (os_log_type_t)v32, "SiriKitIntentSource: processPlayMediaIntent - ERROR: cannot get media item, skipping this title '%s'", v55);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_8();
    goto LABEL_64;
  }
LABEL_13:
  v32 = 4;
  while (1)
  {
    v42 = (id)(v32 - 4);
    if ((v13 & 0xC000000000000001) != 0)
      v45 = (id)MEMORY[0x249550420](v32 - 4, v13);
    else
      v45 = *(id *)(v13 + 8 * v32);
    v46 = v45;
    v29 = v32 - 3;
    if (__OFADD__(v42, 1))
    {
      __break(1u);
      goto LABEL_68;
    }
    v47 = sub_246109834(v45, (SEL *)&selRef_title);
    if (v48)
    {
      v49 = v47;
      v50 = v48;
      swift_bridgeObjectRelease();
      v51 = HIBYTE(v50) & 0xF;
      if ((v50 & 0x2000000000000000) == 0)
        v51 = v49 & 0xFFFFFFFFFFFFLL;
      if (v51)
        break;
    }

    ++v32;
    if (v29 == v44)
      goto LABEL_23;
  }
  v52 = (id)OUTLINED_FUNCTION_57();
  v40 = v107;
  v42 = v97;
  v53 = v103;
LABEL_34:
  v63 = OUTLINED_FUNCTION_67((uint64_t)v52, (SEL *)&selRef_title);
  if (!v64)
  {
LABEL_44:
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_32();
    v76 = OUTLINED_FUNCTION_36();
    if (OUTLINED_FUNCTION_15(v76))
    {
      v77 = (uint8_t *)OUTLINED_FUNCTION_2();
      v78 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_34(v78);
      OUTLINED_FUNCTION_9(4.8149e-34);
      v79 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_4(v79);
      OUTLINED_FUNCTION_6();
      v80 = "SiriKitIntentSource: processPlayMediaIntent - title does not have proper media item title, skipping this title '%s'";
      goto LABEL_46;
    }
LABEL_63:

    OUTLINED_FUNCTION_8();
LABEL_64:
    (*(void (**)(char *, uint64_t))(v105 + 8))(v53, v106);
    return 0;
  }
  LOBYTE(v13) = v64;
  v65 = HIBYTE(v64) & 0xF;
  if ((v64 & 0x2000000000000000) == 0)
    v65 = v63 & 0xFFFFFFFFFFFFLL;
  if (!v65)
  {
    OUTLINED_FUNCTION_55();
    goto LABEL_44;
  }
  v110 = v104;
  v111 = v40;
  v108 = v63;
  v109 = v64;
  v29 = sub_246109704();
  v66 = OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_55();
  if ((v66 & 1) == 0)
    goto LABEL_44;
  v67 = (void *)sub_2461325E0();
  v68 = OUTLINED_FUNCTION_31();
  v69 = sub_246108324((uint64_t)v68, (uint64_t)v67);
  OUTLINED_FUNCTION_46();
  if ((v69 & 1) != 0 || !OUTLINED_FUNCTION_31())
  {
    v81 = (unint64_t)OUTLINED_FUNCTION_31();
    if (v81 > 0x13)
      goto LABEL_59;
    if (((1 << v81) & 0x80228) != 0)
    {
LABEL_49:

      goto LABEL_31;
    }
    if (((1 << v81) & 6) != 0)
    {
      OUTLINED_FUNCTION_67(v81, (SEL *)&selRef_artist);
      if (v82)
      {
        v110 = v104;
        v111 = v40;
        OUTLINED_FUNCTION_11();
        sub_2461324A8();
        sub_2461324A8();

        OUTLINED_FUNCTION_47();
        return v110;
      }
      v53 = v99;
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_32();
      v93 = OUTLINED_FUNCTION_36();
      if (OUTLINED_FUNCTION_15(v93))
      {
        v77 = (uint8_t *)OUTLINED_FUNCTION_2();
        v94 = OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_34(v94);
        OUTLINED_FUNCTION_9(4.8149e-34);
        v95 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_4(v95);
        OUTLINED_FUNCTION_6();
        v80 = "SiriKitIntentSource: processPlayMediaIntent - item does not have artist, skipping this title '%s'";
LABEL_46:
        OUTLINED_FUNCTION_22(&dword_246105000, v29, (os_log_type_t)v13, v80, v77);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }
      goto LABEL_63;
    }
    if (v81 != 16)
    {
LABEL_59:
      v53 = v100;
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_7();
      v88 = v46;
      OUTLINED_FUNCTION_32();
      v89 = OUTLINED_FUNCTION_62();
      if (OUTLINED_FUNCTION_21(v89))
      {
        v90 = OUTLINED_FUNCTION_2();
        v110 = OUTLINED_FUNCTION_2();
        v108 = (unint64_t)OUTLINED_FUNCTION_30(3.8521e-34);
        OUTLINED_FUNCTION_14();

        *(_WORD *)(v90 + 12) = 2080;
        OUTLINED_FUNCTION_11();
        v108 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_14();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_35(&dword_246105000, v91, v92, "SiriKitIntentSource: processPlayMediaIntent - item is %ld, not a music type we are including, skipping this title '%s'");
        OUTLINED_FUNCTION_18();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_8();
      goto LABEL_64;
    }
    v83 = OUTLINED_FUNCTION_67(16, (SEL *)&selRef_identifier);
    if (!v84)
      goto LABEL_49;
    LOBYTE(v13) = v84;
    v110 = v83;
    v111 = v84;
    v108 = 0xD000000000000019;
    v109 = 0x8000000246134350;
    v29 = OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_55();
    if ((v29 & 1) == 0)
      goto LABEL_49;
    v41 = v98;
    sub_2461323D0();
    OUTLINED_FUNCTION_7();
    sub_2461323DC();
    v85 = OUTLINED_FUNCTION_36();
    if (OUTLINED_FUNCTION_15(v85))
    {
      v77 = (uint8_t *)OUTLINED_FUNCTION_2();
      v86 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_34(v86);
      OUTLINED_FUNCTION_9(4.8149e-34);
      v87 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_4(v87);
      OUTLINED_FUNCTION_6();
      v80 = "SiriKitIntentSource: processPlayMediaIntent - user radio station in Apple Music, skipping this title '%s'";
      goto LABEL_46;
    }
LABEL_68:

    OUTLINED_FUNCTION_8();
    (*(void (**)(NSObject *, uint64_t))(v105 + 8))(v41, v106);
    return 0;
  }
  v70 = v101;
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_7();
  v71 = v46;
  OUTLINED_FUNCTION_32();
  v72 = OUTLINED_FUNCTION_62();
  if (OUTLINED_FUNCTION_21(v72))
  {
    v73 = OUTLINED_FUNCTION_2();
    v110 = OUTLINED_FUNCTION_2();
    v108 = (unint64_t)OUTLINED_FUNCTION_30(3.8521e-34);
    OUTLINED_FUNCTION_14();

    *(_WORD *)(v73 + 12) = 2080;
    OUTLINED_FUNCTION_11();
    v108 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_35(&dword_246105000, v74, v75, "SiriKitIntentSource: processPlayMediaIntent - item is %ld not music type, not modifying title '%s'");
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_8();
  (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v70, v106);
LABEL_31:
  OUTLINED_FUNCTION_11();
  return v104;
}

uint64_t sub_2461094A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_246109508()
{
  return type metadata accessor for SiriKitIntentSource();
}

uint64_t type metadata accessor for SiriKitIntentSource()
{
  uint64_t result;

  result = qword_25754A7F8;
  if (!qword_25754A7F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246109548()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461322C8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_2461095C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_27();
}

void sub_2461095E4(_WORD *a1@<X8>)
{
  unsigned __int16 *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_27();
}

void sub_246109608(uint64_t *a1@<X8>)
{
  *a1 = sub_2461171B0();
  OUTLINED_FUNCTION_27();
}

BOOL sub_246109628(uint64_t *a1, uint64_t *a2)
{
  return sub_246110C24(*a1, *a2);
}

_QWORD *sub_246109634@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_246109640(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_54(a1);
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24610965C(uint64_t (*a1)(void))
{
  return OUTLINED_FUNCTION_54(a1);
}

void sub_246109678(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  *a2 = OUTLINED_FUNCTION_54(a1);
  OUTLINED_FUNCTION_27();
}

uint64_t sub_246109698(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_mediaItems);
  if (!v1)
    return 0;
  v2 = v1;
  sub_24610A844(0, &qword_25754A8F0);
  v3 = sub_24613252C();

  return v3;
}

unint64_t sub_246109704()
{
  unint64_t result;

  result = qword_25754A8E8;
  if (!qword_25754A8E8)
  {
    result = MEMORY[0x249550960](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25754A8E8);
  }
  return result;
}

uint64_t sub_246109740(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel__validParameterCombinations);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
  sub_24610A844(0, &qword_25754A910);
  sub_24610A87C();
  v3 = sub_246132460();

  return v3;
}

uint64_t sub_2461097D4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_interaction);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246132010();

  return v3;
}

uint64_t sub_246109834(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_246132484();

  return v4;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249550948]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2461098D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2461098E4(a1, a2);
  return a1;
}

uint64_t sub_2461098E4(uint64_t a1, unint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24610994C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char **p_name;
  void (*v16)(_QWORD);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _BYTE v25[12];
  unsigned int v26;
  void (*v27)(_BYTE *, _QWORD, uint64_t);
  void (*v28)(_BYTE *, uint64_t);
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];

  v4 = 0xD000000000000017;
  v5 = sub_2461323E8();
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_246132190();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for DefaultEligibilityCriteria();
  v32[3] = v12;
  v32[4] = &off_25173BBC8;
  v32[0] = a2;
  objc_opt_self();
  v13 = (void *)swift_dynamicCastObjCClass();
  swift_retain();
  if (v13)
  {
    v29 = "com.apple.findmy";
    v30 = v5;
    v14 = a1;
    p_name = &stru_25173CFF8.name;
    if (objc_msgSend(v13, sel_preferredCallProvider) != (id)1)
      goto LABEL_5;
    __swift_project_boxed_opaque_existential_1(v32, v12);
    v16 = *(void (**)(_QWORD))(v9 + 104);
    v26 = *MEMORY[0x24BEA7420];
    v27 = (void (*)(_BYTE *, _QWORD, uint64_t))v16;
    v16(v11);
    v17 = sub_246132184();
    v18 = v14;
    v20 = v19;
    v28 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
    v28(v11, v8);
    v4 = 0xD000000000000017;
    p_name = (char **)(&stru_25173CFF8 + 8);
    LOBYTE(v17) = sub_246116E30(v17, v20);
    v14 = v18;
    swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
    {
      v27(v11, v26, v8);
      v4 = sub_246132184();

      v28(v11, v8);
    }
    else
    {
LABEL_5:
      if (objc_msgSend(v13, p_name[113]) == (id)2)
      {
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEA7430], v8);
        v4 = sub_246132184();

        (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
      }
      else
      {
        sub_2461323D0();
        v21 = sub_2461323DC();
        v22 = sub_2461325BC();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_246105000, v21, v22, "SiriKitIntentSource: Can't map com.apple.InCallService to appropriate bundleId", v23, 2u);
          MEMORY[0x249550A14](v23, -1, -1);
        }

        (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v7, v30);
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return v4;
}

int64_t sub_246109C44(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_246109D28(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_246109DA8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  char v32;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  char v41;
  char v42;
  char v43;
  _QWORD v44[2];
  uint64_t v45;
  _QWORD v46[5];

  v10 = sub_2461323E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DefaultEligibilityCriteria();
  v46[3] = v14;
  v46[4] = &off_25173BBC8;
  v46[0] = a5;
  swift_retain();
  v15 = sub_246109834(a3, (SEL *)&selRef_intentClass);
  if (!v16)
  {
    sub_2461323D0();
    v28 = sub_2461323DC();
    v29 = sub_2461325BC();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v45 = v31;
      *(_DWORD *)v30 = 136315138;
      v44[1] = sub_246119920(0xD000000000000052, 0x8000000246134390, &v45);
      sub_246132610();
      _os_log_impl(&dword_246105000, v28, v29, "Function: %s > Unable to fetch intent class for BMAppIntent", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v31, -1, -1);
      MEMORY[0x249550A14](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_15;
  }
  v17 = v15;
  v18 = v16;
  if (qword_25754A788 != -1)
    swift_once();
  if ((sub_24612A340(v17, v18, a4) & 1) == 0)
  {
    v19 = 0x6C7070612E6D6F63;
    if ((sub_2461324E4() & 1) != 0)
      goto LABEL_10;
    v20 = __swift_project_boxed_opaque_existential_1(v46, v14);
    v21 = *(_QWORD *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(*v20 + 16), *(_QWORD *)(*v20 + 40))
                    + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_246116758(a1, a2, v21);
    v23 = v22;
    v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v23
      || (sub_246127778(v17, v18, v25),
          v27 = v26,
          swift_bridgeObjectRelease(),
          swift_bridgeObjectRelease(),
          (v27 & 1) != 0))
    {
LABEL_10:
      if ((v17 != 0xD000000000000013 || v18 != 0x80000002461343F0) && (sub_2461327CC() & 1) == 0)
      {
        v34 = 0xEE007377656E2E65;
        v35 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEE007377656E2E65;
        if (!v35 && (sub_2461327CC() & 1) == 0)
        {
          v36 = sub_2461321B4();
          if (*(_QWORD *)(v36 + 16))
          {
            v37 = sub_24612ACE4(0x6C7070612E6D6F63, 0xEE007377656E2E65);
            if ((v38 & 1) != 0)
            {
              v39 = (uint64_t *)(*(_QWORD *)(v36 + 56) + 16 * v37);
              v19 = *v39;
              v34 = v39[1];
              swift_bridgeObjectRetain();
            }
          }
          swift_bridgeObjectRelease();
          if (v19 == a1 && v34 == a2)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v41 = sub_2461327CC();
            swift_bridgeObjectRelease();
            if ((v41 & 1) == 0)
            {
              swift_bridgeObjectRelease();
LABEL_37:
              v32 = 1;
              goto LABEL_16;
            }
          }
        }
        if (v17 == 0xD000000000000011 && v18 == 0x8000000246134370)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v42 = sub_2461327CC();
          swift_bridgeObjectRelease();
          if ((v42 & 1) == 0)
            goto LABEL_37;
        }
        sub_246127778(0x657449616964656DLL, 0xEA0000000000736DLL, a4);
        v32 = v43 ^ 1;
        goto LABEL_16;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_15:
  v32 = 0;
LABEL_16:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  return v32 & 1;
}

uint64_t sub_24610A26C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];

  v8 = type metadata accessor for DefaultEligibilityCriteria();
  v11[3] = v8;
  v11[4] = &off_25173BBC8;
  v11[0] = a4;
  if (a1 == 0xD000000000000017 && a2 == 0x80000002461342C0 || (sub_2461327CC() & 1) != 0)
  {
    v9 = *__swift_project_boxed_opaque_existential_1(v11, v8);
    swift_retain();
    a1 = sub_24610994C(a3, v9);
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return a1;
}

uint64_t sub_24610A364(uint64_t a1, uint64_t a2)
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

void sub_24610A3C8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v52[3];
  uint64_t v53;
  _UNKNOWN **v54;

  v53 = type metadata accessor for DefaultEligibilityCriteria();
  v54 = &off_25173BBC8;
  v52[0] = a5;
  swift_retain();
  v9 = objc_msgSend(a4, sel__nonNilParameters);
  v10 = sub_24613258C();

  v48 = a4;
  v11 = sub_246109740(a4);
  if (!v11)
  {
LABEL_45:
    swift_bridgeObjectRelease();
LABEL_46:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    return;
  }
  v12 = v11;
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v13 = 0;
  v14 = v11 + 64;
  v15 = 1 << *(_BYTE *)(v11 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v11 + 64);
  v18 = (unint64_t)(v15 + 63) >> 6;
  v46 = MEMORY[0x24BEE4AF8];
  v47 = v10;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_26;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v21 >= v18)
      goto LABEL_43;
    v22 = *(_QWORD *)(v14 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_43;
      v22 = *(_QWORD *)(v14 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_43;
        v22 = *(_QWORD *)(v14 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v18)
            goto LABEL_43;
          v22 = *(_QWORD *)(v14 + 8 * v13);
          if (!v22)
          {
            v13 = v21 + 4;
            if (v21 + 4 >= v18)
              goto LABEL_43;
            v22 = *(_QWORD *)(v14 + 8 * v13);
            if (!v22)
              break;
          }
        }
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_26:
    v24 = *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * v20);
    swift_bridgeObjectRetain();
    if ((sub_246108430(v10, v24) & 1) != 0
      && (v25 = __swift_project_boxed_opaque_existential_1(v52, v53), (sub_246109DA8(a1, a2, a3, v24, *v25) & 1) != 0))
    {
      v26 = v12;
      v27 = v14;
      v28 = v18;
      v29 = a6;
      sub_246108714(v48, v24);
      v31 = v30;
      v33 = v32;
      swift_bridgeObjectRelease();
      v34 = v33;
      __swift_project_boxed_opaque_existential_1(v52, v53);
      if (sub_246116F64())
      {
        a6 = v29;
        v18 = v28;
        v14 = v27;
        v12 = v26;
        v10 = v47;
        goto LABEL_30;
      }
      v35 = sub_246109834(a3, (SEL *)&selRef_intentClass);
      if (!v36)
        goto LABEL_38;
      if (v35 == 0xD000000000000011 && v36 == 0x8000000246134370)
      {
        swift_bridgeObjectRelease();
LABEL_36:
        v38 = sub_246108A64(v48, v31, v34, a1, a2);
        v40 = v39;
        swift_bridgeObjectRelease();
        a6 = v29;
        v18 = v28;
        v14 = v27;
        v12 = v26;
        v10 = v47;
        if (v40)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25441C5B8);
          v45 = swift_allocObject();
          *(_OWORD *)(v45 + 16) = xmmword_246132D70;
          *(_QWORD *)(v45 + 32) = v38;
          *(_QWORD *)(v45 + 40) = v40;
          swift_release();
          goto LABEL_46;
        }
      }
      else
      {
        v37 = sub_2461327CC();
        swift_bridgeObjectRelease();
        if ((v37 & 1) != 0)
          goto LABEL_36;
LABEL_38:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24612FC00();
          v46 = v43;
        }
        v41 = *(_QWORD *)(v46 + 16);
        if (v41 >= *(_QWORD *)(v46 + 24) >> 1)
        {
          sub_24612FC00();
          v46 = v44;
        }
        *(_QWORD *)(v46 + 16) = v41 + 1;
        v42 = v46 + 16 * v41;
        *(_QWORD *)(v42 + 32) = v31;
        *(_QWORD *)(v42 + 40) = v34;
        a6 = v29;
        v18 = v28;
        v14 = v27;
        v12 = v26;
        v10 = v47;
      }
    }
    else
    {
LABEL_30:
      swift_bridgeObjectRelease();
    }
  }
  v23 = v21 + 5;
  if (v23 >= v18)
  {
LABEL_43:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_46;
  }
  v22 = *(_QWORD *)(v14 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_43;
    v22 = *(_QWORD *)(v14 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_48:
  __break(1u);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_24610A83C()
{
  return swift_release();
}

uint64_t sub_24610A844(uint64_t a1, unint64_t *a2)
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

unint64_t sub_24610A87C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754A918;
  if (!qword_25754A918)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441C568);
    result = MEMORY[0x249550960](MEMORY[0x24BEE1708], v1);
    atomic_store(result, (unint64_t *)&qword_25754A918);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249550954](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24610A904(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t destroy for SKIntentAutoCompletePhrase()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16SiriAutoComplete26SKIntentAutoCompletePhraseVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  OUTLINED_FUNCTION_37();
  return a1;
}

_QWORD *assignWithCopy for SKIntentAutoCompletePhrase(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
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

_QWORD *assignWithTake for SKIntentAutoCompletePhrase(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_release();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKIntentAutoCompletePhrase(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for SKIntentAutoCompletePhrase(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SKIntentAutoCompletePhrase()
{
  return &type metadata for SKIntentAutoCompletePhrase;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x249550A14);
}

uint64_t OUTLINED_FUNCTION_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_246119920(*(_QWORD *)(v1 - 144), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;

  return sub_2461098D0(*(_QWORD *)(v0 - 296), *(_QWORD *)(v0 - 288));
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_9(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_10()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_246132610();
}

BOOL OUTLINED_FUNCTION_15(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_19(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_246132610();
}

BOOL OUTLINED_FUNCTION_21(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_22(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_2461325D4();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_24613264C();
}

void OUTLINED_FUNCTION_29()
{
  void *v0;

}

id OUTLINED_FUNCTION_30(float a1)
{
  void *v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  return objc_msgSend(v1, (SEL)(v3 + 72));
}

id OUTLINED_FUNCTION_31()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 72));
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_2461323DC();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_2461323D0();
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = result;
  return result;
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_2461325BC();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_246119920(v0, v1, (uint64_t *)(v2 - 160));
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_43()
{
  uint64_t v0;
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 - 272), (SEL)(v0 + 456));
}

void OUTLINED_FUNCTION_44()
{
  void *v0;
  uint64_t v1;

  sub_2461098D0(*(_QWORD *)(v1 - 296), *(_QWORD *)(v1 - 288));

}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_2461323E8();
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_54(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_246132478();
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24610A364(v0, v1 - 144);
}

_QWORD *OUTLINED_FUNCTION_61()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_2461325BC();
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void OUTLINED_FUNCTION_65(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

id OUTLINED_FUNCTION_66()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_246109834(v2, a2);
}

void *sub_24610AE24()
{
  return &unk_25173B280;
}

uint64_t sub_24610AE30(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24610AE68 + 4 * byte_246132E00[a1]))(0xD000000000000010, 0x8000000246134470);
}

uint64_t sub_24610AE68()
{
  return 0x6449656C646E7562;
}

uint64_t sub_24610AE80()
{
  return 0x657361726870;
}

uint64_t sub_24610AE94(uint64_t a1)
{
  return a1 + 11;
}

uint64_t sub_24610AEAC()
{
  uint64_t result;

  type metadata accessor for DenyListManager();
  swift_allocObject();
  result = sub_24610AFA8();
  qword_25441C5C8 = result;
  return result;
}

void sub_24610AEE4()
{
  qword_25441C4F8 = 0x7473694C796E6544;
  unk_25441C500 = 0xE800000000000000;
}

void sub_24610AF08()
{
  qword_25441C4D8 = 0x7473696C70;
  unk_25441C4E0 = 0xE500000000000000;
}

uint64_t sub_24610AF28()
{
  if (qword_25441C508 != -1)
    swift_once();
  if (qword_25441C4E8 != -1)
    swift_once();
  return 0x7473694C796E6544;
}

uint64_t sub_24610AFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  v2 = sub_24610B074();
  v3 = sub_24610B474();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = v2;
  sub_24610CF18(v3, (uint64_t)sub_24610DBC0, 0, isUniquelyReferenced_nonNull_native, &v7);
  v8 = v7;
  swift_bridgeObjectRelease();
  sub_2461320D0();
  swift_allocObject();
  v5 = sub_2461320C4();
  sub_24610D820((uint64_t)&v8, v5);
  swift_release();
  *(_QWORD *)(v1 + 16) = v8;
  return v1;
}

uint64_t sub_24610B074()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4A8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_246131FF8();
  v36 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v35 - v7;
  v8 = sub_2461323E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - v13;
  sub_2461323D0();
  v15 = sub_2461323DC();
  v16 = sub_2461325C8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_246105000, v15, v16, "DenyListManager: loading deny list from project resources.", v17, 2u);
    MEMORY[0x249550A14](v17, -1, -1);
  }

  v37 = *(void (**)(char *, uint64_t))(v9 + 8);
  v37(v14, v8);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  if (qword_25441C508 != -1)
    swift_once();
  v21 = qword_25441C4F8;
  v20 = unk_25441C500;
  v22 = qword_25441C4E8;
  swift_bridgeObjectRetain();
  if (v22 != -1)
    swift_once();
  v23 = qword_25441C4D8;
  v24 = unk_25441C4E0;
  swift_bridgeObjectRetain();
  v25 = sub_24610D7AC(v21, v20, v23, v24, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    sub_246131FEC();

    v26 = v36;
    v27 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v27(v2, v6, v3);
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
    if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) != 1)
    {
      v28 = v35;
      v27(v35, v2, v3);
      sub_24610BD48();
      v30 = v29;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v3);
      return v30;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  }
  sub_24610DCC8((uint64_t)v2, &qword_25441C4A8);
  sub_2461323D0();
  v31 = sub_2461323DC();
  v32 = sub_2461325D4();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_246105000, v31, v32, "DenyListManager: unable to get path to the deny list file", v33, 2u);
    MEMORY[0x249550A14](v33, -1, -1);
  }

  v37(v12, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
  return sub_24613246C();
}

uint64_t sub_24610B474()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v0 = sub_246131FF8();
  v47 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v46 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v48 = (char *)&v43 - v3;
  v4 = sub_2461320AC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2461323E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v45 = (char *)&v43 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v43 - v14;
  v16 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 134);
  sub_2461323D0();
  v17 = sub_2461323DC();
  v18 = sub_2461325C8();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v44 = v9;
    v20 = v5;
    v21 = v4;
    v22 = v16;
    v23 = v0;
    v24 = v8;
    v25 = v19;
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_246105000, v17, v18, "DenyListManager: looking for deny list on Trial.", v19, 2u);
    v26 = v25;
    v8 = v24;
    v0 = v23;
    v16 = v22;
    v4 = v21;
    v5 = v20;
    v9 = v44;
    MEMORY[0x249550A14](v26, -1, -1);
  }

  v27 = *(void (**)(char *, uint64_t))(v9 + 8);
  v27(v15, v8);
  sub_246132088();
  v28 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEA6A30], v4);
  sub_2461320A0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v29 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v16, sel_levelForFactor_withNamespaceName_, v28, v29);

  v31 = sub_24613207C();
  if (v32)
  {
    v50 = v31;
    v51 = v32;
    swift_bridgeObjectRetain();
    sub_2461324A8();
    swift_bridgeObjectRelease();
    v33 = v46;
    sub_246131FD4();
    swift_bridgeObjectRelease();
    sub_24610AF28();
    v34 = v48;
    sub_246131FE0();
    swift_bridgeObjectRelease();
    v35 = *(void (**)(char *, uint64_t))(v47 + 8);
    v35(v33, v0);
    sub_24610BD48();
    v37 = v36;

    v35(v34, v0);
  }
  else
  {
    v39 = v45;
    sub_2461323D0();
    v40 = sub_2461323DC();
    v41 = sub_2461325C8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_246105000, v40, v41, "DenyListManager: No deny list on Trial.", v42, 2u);
      MEMORY[0x249550A14](v42, -1, -1);
    }

    v27(v39, v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
    v37 = sub_24613246C();

  }
  return v37;
}

void (*sub_24610BA7C(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24610D134(v6, a2, a3);
  return sub_24610BAE8;
}

void sub_24610BAE8(uint64_t *a1)
{
  void *v1;

  v1 = (void *)*a1;
  OUTLINED_FUNCTION_14_0(*a1, *(uint64_t (**)(uint64_t, _QWORD))(*a1 + 40));
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_6_0(v1);
}

void (*sub_24610BB14(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t *a1)
{
  _QWORD *v10;

  v10 = malloc(0x38uLL);
  *a1 = v10;
  v10[4] = a3;
  v10[5] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10[6] = sub_24610D204(v10, a2, a3, a4, a5);
  return sub_24610BBA0;
}

void sub_24610BBA0(uint64_t *a1)
{
  void *v1;

  v1 = (void *)*a1;
  OUTLINED_FUNCTION_14_0(*a1, *(uint64_t (**)(uint64_t, _QWORD))(*a1 + 48));
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_4_0(v1);
}

uint64_t sub_24610BBD8(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v8 | (v2 << 6); ; i = __clz(__rbit64(v11)) + (v2 << 6))
  {
    v13 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    sub_24612B5A4(&v16, v14, v15);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_5:
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_20:
    v6 = (v11 - 1) & v11;
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_24610BD48()
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
  __int128 v10;
  _QWORD v11[6];
  __int128 v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v0 = sub_2461323E8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v16 = (char *)v11 - v4;
  MEMORY[0x24BDAC7A8](v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
  v19 = sub_24613246C();
  sub_246131FBC();
  swift_allocObject();
  v5 = sub_246131FB0();
  v6 = sub_246132004();
  v17 = v1;
  v7 = v6;
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C540);
  sub_24610DC00();
  sub_246131FA4();
  v11[1] = v7;
  v11[2] = v9;
  v11[4] = 0;
  v18 = 4;
  v20 = "bundleIdAndActionIdentifier";
  *(_QWORD *)&v10 = 136315138;
  v12 = v10;
  v11[5] = MEMORY[0x24BEE4AD8] + 8;
  v13 = "Manager";
  v14 = v21;
  v15 = v5;
  v11[3] = v0;
  JUMPOUT(0x24610C33CLL);
}

void sub_24610C75C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  char v25;
  char v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _BYTE v51[32];

  v0 = sub_2461323E8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = &v51[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = &v51[-v6];
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = &v51[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v51[-v11];
  v13 = sub_246132304();
  OUTLINED_FUNCTION_15_0(v13, v14, 0);
  v16 = v15;
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
    sub_2461323D0();
    OUTLINED_FUNCTION_9_0();
    sub_2461323DC();
    v17 = OUTLINED_FUNCTION_19_0();
    if (os_log_type_enabled(v4, v17))
    {
      OUTLINED_FUNCTION_2();
      v18 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_21_0(v18);
      OUTLINED_FUNCTION_16_0(4.8149e-34);
      v19 = sub_246132304();
      v21 = OUTLINED_FUNCTION_8_0(v19, v20);
      OUTLINED_FUNCTION_1_0(v21);
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_18_0(&dword_246105000, v4, v17, "Phrase is not being added to the index since the actionIdentifier is in the deny list: %s");
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_2_0();
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v12, v0);
  }
  else
  {
    v22 = sub_24613234C();
    v24 = v23;
    OUTLINED_FUNCTION_15_0(v22, v23, 1);
    v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) != 0)
    {
      sub_2461323D0();
      OUTLINED_FUNCTION_9_0();
      sub_2461323DC();
      v27 = OUTLINED_FUNCTION_19_0();
      if (OUTLINED_FUNCTION_13(v27))
      {
        OUTLINED_FUNCTION_2();
        v28 = OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_21_0(v28);
        OUTLINED_FUNCTION_16_0(4.8149e-34);
        v29 = sub_24613234C();
        v31 = OUTLINED_FUNCTION_8_0(v29, v30);
        OUTLINED_FUNCTION_1_0(v31);
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_18_0(&dword_246105000, v4, v24, "Phrase is not being added to the index since the bundleId is in the deny list: %s");
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_2_0();
      (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v10, v0);
    }
    else
    {
      v32 = sub_246132334();
      OUTLINED_FUNCTION_15_0(v32, v33, 2);
      v35 = v34;
      swift_bridgeObjectRelease();
      if ((v35 & 1) != 0)
      {
        sub_2461323D0();
        OUTLINED_FUNCTION_9_0();
        sub_2461323DC();
        v36 = OUTLINED_FUNCTION_19_0();
        if (OUTLINED_FUNCTION_13(v36))
        {
          OUTLINED_FUNCTION_2();
          v37 = OUTLINED_FUNCTION_2();
          OUTLINED_FUNCTION_21_0(v37);
          OUTLINED_FUNCTION_12_0(4.8149e-34);
          v38 = sub_246132334();
          v40 = OUTLINED_FUNCTION_8_0(v38, v39);
          OUTLINED_FUNCTION_1_0(v40);
          OUTLINED_FUNCTION_2_0();
          OUTLINED_FUNCTION_46();
          OUTLINED_FUNCTION_11_0(&dword_246105000, v4, v24, "Phrase is not being added to the index since the phrase is in the deny list: %s");
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_2_0();
        (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v7, v0);
      }
      else
      {
        v41 = sub_24610CBC4();
        OUTLINED_FUNCTION_15_0(v41, v42, 3);
        v44 = v43;
        swift_bridgeObjectRelease();
        if ((v44 & 1) != 0)
        {
          sub_2461323D0();
          OUTLINED_FUNCTION_9_0();
          v45 = sub_2461323DC();
          v46 = sub_2461325BC();
          if (os_log_type_enabled(v45, v46))
          {
            OUTLINED_FUNCTION_2();
            v47 = OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_21_0(v47);
            OUTLINED_FUNCTION_12_0(4.8149e-34);
            v48 = sub_24610CBC4();
            v50 = OUTLINED_FUNCTION_8_0(v48, v49);
            OUTLINED_FUNCTION_1_0(v50);
            OUTLINED_FUNCTION_2_0();
            OUTLINED_FUNCTION_46();
            OUTLINED_FUNCTION_11_0(&dword_246105000, v45, v46, "Phrase is not being added to the index since the bundleId and ActionIdentifier pair is in the deny list: %s)");
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_0();
          }

          OUTLINED_FUNCTION_2_0();
          (*(void (**)(NSObject *, uint64_t))(v1 + 8))(v4, v0);
        }
      }
    }
  }
  OUTLINED_FUNCTION_28();
}

uint64_t sub_24610CBC4()
{
  uint64_t v1;

  v1 = sub_24613234C();
  swift_bridgeObjectRetain();
  sub_2461324A8();
  OUTLINED_FUNCTION_17_0();
  sub_246132304();
  swift_bridgeObjectRetain();
  sub_2461324A8();
  OUTLINED_FUNCTION_17_0();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_24610CC60(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  v4 = sub_2461323E8();
  MEMORY[0x24BDAC7A8](v4);
  __asm { BR              X10 }
}

void sub_24610CD10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _DWORD *v12;

  v9 = sub_246116808(0x6449656C646E7562, 0xE800000000000000, a3);
  swift_bridgeObjectRelease();
  if (v9)
  {
    sub_246127778(v6, v4, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2461323D0();
    v10 = sub_2461323DC();
    v11 = sub_2461325D4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (_DWORD *)OUTLINED_FUNCTION_2();
      *(_QWORD *)(v8 - 88) = OUTLINED_FUNCTION_2();
      *v12 = 136315138;
      ((void (*)(void))((char *)&loc_24610CE00 + 4 * byte_246132E08[v5]))();
      return;
    }

    OUTLINED_FUNCTION_20_0(v7, *(uint64_t (**)(uint64_t, _QWORD))(v3 + 8));
  }
  OUTLINED_FUNCTION_28();
}

uint64_t sub_24610CED4()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DenyListManager()
{
  return objc_opt_self();
}

uint64_t sub_24610CF18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  __int128 v33;

  sub_24612CC7C(&v33);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_24612CE38();
  if (v8)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (_QWORD *)*a5;
      v15 = sub_24612ACE4(v10, v11);
      v16 = v13[2];
      v17 = (v14 & 1) == 0;
      v18 = v16 + v17;
      if (__OFADD__(v16, v17))
        break;
      v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25441C588);
          sub_246132700();
        }
      }
      else
      {
        sub_24612B298(v18, a4 & 1);
        v20 = sub_24612ACE4(v10, v11);
        if ((v19 & 1) != (v21 & 1))
          goto LABEL_17;
        v15 = v20;
      }
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
      {
        v23 = *(_QWORD *)(v22[7] + 8 * v15);
        swift_bridgeObjectRetain();
        v24 = sub_246127A24(v12, v23);
        swift_bridgeObjectRelease();
        v25 = v22[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v25 + 8 * v15) = v24;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        v26 = (uint64_t *)(v22[6] + 16 * v15);
        *v26 = v10;
        v26[1] = v11;
        *(_QWORD *)(v22[7] + 8 * v15) = v12;
        v27 = v22[2];
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_16;
        v22[2] = v29;
      }
      v10 = sub_24612CE38();
      v11 = v30;
      v12 = v31;
      a4 = 1;
      if (!v30)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2461327FC();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_24610A83C();
    return swift_release();
  }
  return result;
}

void (*sub_24610D134(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24610D5C0(v6);
  v6[10] = sub_24610D2F8(v6 + 4, a2, a3);
  return sub_24610D1C4;
}

void sub_24610D1C4(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  OUTLINED_FUNCTION_14_0(*(_QWORD *)a1 + 32, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80));
  OUTLINED_FUNCTION_46();
  v2(v1, 0);
  OUTLINED_FUNCTION_4_0(v1);
}

void (*sub_24610D204(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  _QWORD *v10;

  v10 = malloc(0x60uLL);
  *a1 = v10;
  v10[8] = a3;
  v10[9] = a5;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10[10] = sub_24610D5E0(v10);
  v10[11] = sub_24610D448(v10 + 4, a2, a3, a4, a5);
  return sub_24610D2B4;
}

void sub_24610D2B4(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 80);
  OUTLINED_FUNCTION_14_0(*(_QWORD *)a1 + 32, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 88));
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_46();
  v2(v1, 0);
  OUTLINED_FUNCTION_4_0(v1);
}

void (*sub_24610D2F8(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void (*result)(uint64_t **);

  v4 = v3;
  v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[2] = a3;
  v8[3] = v4;
  v8[1] = a2;
  v9 = *v4;
  v10 = sub_24612ACE4(a2, a3);
  *((_BYTE *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(_QWORD *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = v10;
  v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C588);
  if ((sub_2461326F4() & 1) != 0)
  {
    v14 = sub_24612ACE4(a2, a3);
    if ((v13 & 1) == (v15 & 1))
    {
      v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    result = (void (*)(uint64_t **))sub_2461327FC();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if ((v13 & 1) != 0)
    v16 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v12);
  else
    v16 = 0;
  *v8 = v16;
  return sub_24610D410;
}

void sub_24610D410(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_24610D60C(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0(v1);
}

void (*sub_24610D448(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t **a1)
{
  uint64_t *v5;
  uint64_t *v6;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  void (*result)(uint64_t **);

  v6 = v5;
  v12 = malloc(0x40uLL);
  *a1 = v12;
  v12[4] = a5;
  v12[5] = v6;
  v12[2] = a3;
  v12[3] = a4;
  v12[1] = a2;
  v13 = *v6;
  v14 = sub_24612AD34(a2, a3, a4, a5);
  *((_BYTE *)v12 + 56) = v15 & 1;
  if (__OFADD__(*(_QWORD *)(v13 + 16), (v15 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v16 = v14;
  v17 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754A928);
  if ((sub_2461326F4() & 1) != 0)
  {
    v18 = sub_24612AD34(a2, a3, a4, a5);
    if ((v17 & 1) == (v19 & 1))
    {
      v16 = v18;
      goto LABEL_5;
    }
LABEL_10:
    result = (void (*)(uint64_t **))sub_2461327FC();
    __break(1u);
    return result;
  }
LABEL_5:
  v12[6] = v16;
  if ((v17 & 1) != 0)
    v20 = *(_QWORD *)(*(_QWORD *)(*v6 + 56) + 8 * v16);
  else
    v20 = 0;
  *v12 = v20;
  return sub_24610D584;
}

void sub_24610D584(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_24610D6CC(*a1, *((_BYTE *)*a1 + 56), (_QWORD **)(*a1)[5], (*a1)[6], (*a1)[1], (*a1)[2], (*a1)[3], (*a1)[4]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0(v1);
}

uint64_t (*sub_24610D5C0(_QWORD *a1))()
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_24610DD4C;
}

uint64_t (*sub_24610D5E0(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_24610D600;
}

uint64_t sub_24610D600(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_24610D60C(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v6;
    }
    else
    {
      sub_246111CC8(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
    sub_24613270C();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_24610D6CC(uint64_t *a1, char a2, _QWORD **a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)((*a3)[7] + 8 * a4) = v8;
    }
    else
    {
      sub_246111CE4(a4, a5, a6, a7, a8, v8, *a3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
    sub_24610DD10();
    sub_24613270C();
  }
  return swift_bridgeObjectRetain();
}

id sub_24610D7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)sub_246132478();
  v7 = (void *)sub_246132478();
  v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_24610D820(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  uint64_t result;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(uint64_t *);
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(uint64_t *);
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];

  v3 = sub_2461323E8();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24613210C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[5] = a2;
  swift_retain();
  sub_2461320B8();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  v14 = *(_QWORD *)(sub_2461320F4() + 16);
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(sub_246132100() + 16);
  result = swift_bridgeObjectRelease();
  v17 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    sub_2461323D0();
    v18 = sub_2461323DC();
    v19 = sub_2461325C8();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v20 = 134217984;
      v29[0] = v17;
      sub_246132610();
      _os_log_impl(&dword_246105000, v18, v19, "DenyListManager: loaded %ld records from suggestions deny list.", v20, 0xCu);
      MEMORY[0x249550A14](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
    v21 = sub_24610BA7C(v29, 0xD000000000000010, 0x8000000246134470);
    if (*v22)
    {
      v23 = sub_2461320F4();
      sub_24610BBD8(v23);
    }
    ((void (*)(_QWORD *, _QWORD))v21)(v29, 0);
    v24 = sub_24610BA7C(v29, 0xD000000000000010, 0x8000000246134470);
    if (*v25)
    {
      v26 = sub_246132100();
      sub_24610BBD8(v26);
    }
    ((void (*)(_QWORD *, _QWORD))v24)(v29, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_24610DBC0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_24612C924(&v6, *a1, a1[1], a1[2]);
  v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

unint64_t sub_24610DC00()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_25441C548;
  if (!qword_25441C548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441C540);
    v2 = sub_24610DC6C();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x249550960](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25441C548);
  }
  return result;
}

unint64_t sub_24610DC6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25441C558;
  if (!qword_25441C558)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441C550);
    v2 = MEMORY[0x24BEE0D38];
    result = MEMORY[0x249550960](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25441C558);
  }
  return result;
}

uint64_t sub_24610DCC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t sub_24610DD10()
{
  unint64_t result;

  result = qword_25754A930;
  if (!qword_25754A930)
  {
    result = MEMORY[0x249550960](&unk_246132F94, &unk_25173B5C0);
    atomic_store(result, (unint64_t *)&qword_25754A930);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_4_0(void *a1)
{
  free(a1);
}

void OUTLINED_FUNCTION_6_0(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246119920(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_12_0(float a1)
{
  float *v1;
  uint64_t v2;
  uint64_t v3;

  *v1 = a1;
  *(_QWORD *)(v3 - 104) = v2;
}

BOOL OUTLINED_FUNCTION_13(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  return a2(a1, 0);
}

void OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, char a3)
{
  sub_24610CC60(a1, a2, a3);
}

void OUTLINED_FUNCTION_16_0(float a1)
{
  float *v1;
  uint64_t v2;
  uint64_t v3;

  *v1 = a1;
  *(_QWORD *)(v3 - 104) = v2;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_18_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_2461325BC();
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = result;
  return result;
}

uint64_t sub_24610DE44(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v2 = sub_2461323E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461323D0();
  v6 = sub_2461323DC();
  v7 = sub_2461325BC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_246105000, v6, v7, "Ranking Assistant Intent example phrases", v8, 2u);
    MEMORY[0x249550A14](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_retain();
  sub_246111034(a1);
  return swift_release();
}

uint64_t sub_24610DF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24610DFC0()
{
  return type metadata accessor for AssistantIntentExamplePhrasesSource();
}

uint64_t type metadata accessor for AssistantIntentExamplePhrasesSource()
{
  uint64_t result;

  result = qword_25754A968;
  if (!qword_25754A968)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24610E000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t sub_24610E008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

BOOL sub_24610E010(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24610E020()
{
  return sub_246132820();
}

uint64_t sub_24610E044(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v7;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000246134470 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v5 || (sub_2461327CC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x657361726870 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = sub_2461327CC();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_24610E17C()
{
  return 3;
}

uint64_t sub_24610E184()
{
  sub_246132814();
  sub_246132820();
  return sub_24613282C();
}

uint64_t sub_24610E1C8(char a1)
{
  if (!a1)
    return 0xD000000000000010;
  if (a1 == 1)
    return 0x6449656C646E7562;
  return 0x657361726870;
}

BOOL sub_24610E220(char *a1, char *a2)
{
  return sub_24610E010(*a1, *a2);
}

uint64_t sub_24610E22C()
{
  return sub_24610E184();
}

uint64_t sub_24610E234()
{
  return sub_24610E020();
}

uint64_t sub_24610E23C()
{
  sub_246132814();
  sub_246132820();
  return sub_24613282C();
}

uint64_t sub_24610E27C()
{
  char *v0;

  return sub_24610E1C8(*v0);
}

uint64_t sub_24610E284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24610E044(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24610E2A8()
{
  return sub_24610E700();
}

uint64_t sub_24610E2C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24610E17C();
  *a1 = result;
  return result;
}

uint64_t sub_24610E2E8()
{
  sub_246110514();
  return sub_246132850();
}

uint64_t sub_24610E310()
{
  sub_246110514();
  return sub_24613285C();
}

uint64_t sub_24610E338(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754ABA0) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246110514();
  sub_246132844();
  OUTLINED_FUNCTION_5_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_5_0();
  }
  return OUTLINED_FUNCTION_51_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void sub_24610E43C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
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

  OUTLINED_FUNCTION_31_0();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AB80);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_41();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_246110514();
  sub_246132838();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    v6 = OUTLINED_FUNCTION_20_1();
    v8 = v7;
    v18 = v6;
    OUTLINED_FUNCTION_17_1();
    v9 = OUTLINED_FUNCTION_20_1();
    v11 = v10;
    v16 = v9;
    OUTLINED_FUNCTION_37();
    v17 = v11;
    v12 = sub_24613276C();
    v14 = v13;
    v15 = v12;
    OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_37();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    OUTLINED_FUNCTION_46();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_1();
    *v5 = v18;
    v5[1] = v8;
    v5[2] = v16;
    v5[3] = v17;
    v5[4] = v15;
    v5[5] = v14;
  }
  OUTLINED_FUNCTION_0_0();
}

BOOL sub_24610E5DC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24610E5EC()
{
  return sub_246132820();
}

uint64_t sub_24610E610(uint64_t a1, uint64_t a2)
{
  char v6;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000246134470 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2461327CC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24610E6F8()
{
  return 2;
}

uint64_t sub_24610E700()
{
  return 0;
}

uint64_t sub_24610E70C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6449656C646E7562;
  else
    return 0xD000000000000010;
}

void sub_24610E748()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_0();
  v3 = v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754ABA8) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_28_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_246110550();
  sub_246132844();
  OUTLINED_FUNCTION_18_1();
  if (!v0)
    OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_51_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_24610E828()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_31_0();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AB90);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_41();
  v3 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_246110550();
  sub_246132838();
  if (v0)
  {
    OUTLINED_FUNCTION_53_0();
  }
  else
  {
    v3 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_7_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_53_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_1();
  }
  return v3;
}

uint64_t sub_24610E95C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6465766F72707061 && a2 == 0xEF73657361726850;
  if (v3 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000246134550)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2461327CC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_24610EA58()
{
  OUTLINED_FUNCTION_35_0();
  sub_246132820();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_24610EA88(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000019;
  else
    return 0x6465766F72707061;
}

void sub_24610EAD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31_0();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AB40);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24610FED0();
  sub_246132844();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_30_0(&qword_25754AB48, v5, (uint64_t (*)(void))sub_24610FF84, MEMORY[0x24BEE12A0]);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_40_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_30_0(&qword_25754AB58, v6, (uint64_t (*)(void))sub_246110024, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_40_0();
  }
  OUTLINED_FUNCTION_51_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_24610EC00(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AB00);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_28_0();
  v3 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  sub_24610FED0();
  sub_246132838();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_30_0(&qword_25754AB18, v4, (uint64_t (*)(void))sub_24610FF0C, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_42_0();
    v3 = v8;
    OUTLINED_FUNCTION_21_1();
    v7 = OUTLINED_FUNCTION_30_0(&qword_25754AB30, v6, (uint64_t (*)(void))sub_24610FF48, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_34_0();
    if (v7)
    {
      OUTLINED_FUNCTION_4_1();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    else
    {
      OUTLINED_FUNCTION_37();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      OUTLINED_FUNCTION_46();
    }
    OUTLINED_FUNCTION_4_1();
  }
  return v3;
}

uint64_t sub_24610EDB8()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24610EE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v12;
  char v13;
  uint64_t result;

  v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = sub_2461327CC(), result = 0, (v13 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
      return 1;
    else
      return sub_2461327CC();
  }
  return result;
}

void sub_24610EEA8()
{
  OUTLINED_FUNCTION_35_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_23_0();
}

double sub_24610EF04@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  sub_24610E43C();
  if (!v1)
  {
    *a1 = v4;
    a1[1] = v5;
    result = *(double *)&v6;
    a1[2] = v6;
  }
  return result;
}

uint64_t sub_24610EF44(_QWORD *a1)
{
  return sub_24610E338(a1);
}

BOOL sub_24610EF58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24610E5DC(*a1, *a2);
}

void sub_24610EF64()
{
  sub_24610EA58();
}

uint64_t sub_24610EF7C()
{
  return sub_24610E5EC();
}

uint64_t sub_24610EF88()
{
  char *v0;

  return sub_24610E70C(*v0);
}

uint64_t sub_24610EF90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24610E610(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24610EFB4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24610E6F8();
  *a1 = result;
  return result;
}

uint64_t sub_24610EFD8()
{
  sub_246110550();
  return sub_246132850();
}

uint64_t sub_24610F000()
{
  sub_246110550();
  return sub_24613285C();
}

uint64_t sub_24610F028@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_24610E828();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
    a1[2] = v5;
    a1[3] = v6;
  }
  return result;
}

void sub_24610F054()
{
  sub_24610E748();
}

void sub_24610F070()
{
  sub_246132814();
  sub_246132820();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_24610F0A4()
{
  char *v0;

  return sub_24610EA88(*v0);
}

uint64_t sub_24610F0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24610E95C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24610F0D0()
{
  sub_24610FED0();
  return sub_246132850();
}

uint64_t sub_24610F0F8()
{
  sub_24610FED0();
  return sub_24613285C();
}

uint64_t sub_24610F120@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_24610EC00(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void sub_24610F148()
{
  sub_24610EAD0();
}

void sub_24610F160()
{
  sub_24610EEA8();
}

uint64_t sub_24610F16C()
{
  return sub_24610EDB8();
}

void sub_24610F178()
{
  sub_246132814();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_37();
  sub_24613249C();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_23_0();
}

uint64_t sub_24610F1D8(uint64_t *a1, uint64_t *a2)
{
  return sub_24610EE1C(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_24610F1F4()
{
  uint64_t result;

  type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider();
  swift_allocObject();
  result = sub_24610F22C();
  qword_25754B8F8 = result;
  return result;
}

uint64_t sub_24610F22C()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
  sub_24610DD10();
  *(_QWORD *)(v0 + 16) = sub_24613246C();
  *(_QWORD *)(v0 + 16) = sub_24610F2A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24610F2A0()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  id v17;
  void (*v18)(uint64_t, char *, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_2461323E8();
  v26 = *(_QWORD *)(v0 - 8);
  v27 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4A8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v7 = v6 - v5;
  v8 = sub_246131FF8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v16 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = sub_24612CB94(0xD00000000000001ELL, 0x8000000246134530, 0x7473696C70, 0xE500000000000000, v16);

  if (v17)
  {
    sub_246131FEC();

    v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
    v18(v7, v12, v8);
    OUTLINED_FUNCTION_36_0(v7, 0);
    if (__swift_getEnumTagSinglePayload(v7, 1, v8) != 1)
    {
      v25 = v9;
      v18((uint64_t)v14, (char *)v7, v8);
      sub_246131FBC();
      swift_allocObject();
      sub_246131FB0();
      sub_246132004();
      sub_24610FD10();
      sub_246131FA4();
      v23 = sub_24610F770(v28, v29);
      OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_17_0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
      return v23;
    }
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v7, 1);
  }
  sub_24610FCD0(v7);
  sub_2461323D0();
  v19 = sub_2461323DC();
  v20 = sub_2461325C8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_246105000, v19, v20, "ApprovedPhrasesForAppShortcuts: unable to get a path to the list of approved phrases for App Shortcuts", v21, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
  OUTLINED_FUNCTION_45_0();
  return OUTLINED_FUNCTION_46_0();
}

uint64_t sub_24610F770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t *);
  _QWORD *v16;
  void (*v17)(uint64_t *);
  uint64_t v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void (*v33)(uint64_t *);
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
  OUTLINED_FUNCTION_45_0();
  v36 = OUTLINED_FUNCTION_46_0();
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v32 = a2;
    OUTLINED_FUNCTION_37();
    v5 = (uint64_t *)(a1 + 72);
    do
    {
      v6 = *(v5 - 5);
      v7 = *(v5 - 4);
      v8 = *(v5 - 3);
      v9 = *(v5 - 2);
      v10 = *v5;
      v34 = *(v5 - 1);
      OUTLINED_FUNCTION_56();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_15_1();
      v11 = sub_24610F9B8(v8, v9, v6, v7, (uint64_t)&v36);
      v15 = sub_24610BB14(v35, v11, v12, v13, v14);
      v17 = v15;
      v18 = *v16;
      if (*v16)
      {
        v19 = v16;
        v33 = v15;
        OUTLINED_FUNCTION_15_1();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v19 = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_37_0();
          v18 = v23;
          *v19 = v23;
        }
        v21 = *(_QWORD *)(v18 + 16);
        if (v21 >= *(_QWORD *)(v18 + 24) >> 1)
        {
          OUTLINED_FUNCTION_37_0();
          v18 = v24;
          *v19 = v24;
        }
        *(_QWORD *)(v18 + 16) = v21 + 1;
        v22 = v18 + 16 * v21;
        *(_QWORD *)(v22 + 32) = v34;
        *(_QWORD *)(v22 + 40) = v10;
        ((void (*)(_QWORD *, _QWORD))v33)(v35, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_1();
      }
      else
      {
        OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_55();
        ((void (*)(_QWORD *, _QWORD))v17)(v35, 0);
      }
      v5 += 6;
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_55();
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    a2 = v32;
  }
  v25 = *(_QWORD *)(a2 + 16);
  if (v25)
  {
    swift_bridgeObjectRetain();
    v26 = (uint64_t *)(a2 + 56);
    do
    {
      v27 = *(v26 - 3);
      v28 = *(v26 - 2);
      v29 = *(v26 - 1);
      v30 = *v26;
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_56();
      sub_24610F9B8(v29, v30, v27, v28, (uint64_t)&v36);
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_17_0();
      v26 += 4;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
  }
  return v36;
}

uint64_t sub_24610F9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v9 = *(_QWORD *)(*(_QWORD *)a5 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_49();
  if (!v9 || (v10 = OUTLINED_FUNCTION_39_0(), sub_24612AD34(v10, v11, v12, v13), (v14 & 1) == 0))
  {
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_49();
    sub_246111730(MEMORY[0x24BEE4AF8], a1, a2, a3, a4);
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_55();
  }
  return OUTLINED_FUNCTION_39_0();
}

uint64_t sub_24610FA54()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)(v1 + 16))
    return 0;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_37();
  v2 = OUTLINED_FUNCTION_14_1();
  if ((v3 & 1) == 0)
  {
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_46();
    return 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v2);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_46();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    sub_246109704();
    OUTLINED_FUNCTION_56();
    v6 = v4 + 40;
    while (OUTLINED_FUNCTION_44_0())
    {
      v6 += 16;
      if (!--v5)
      {
        OUTLINED_FUNCTION_57();
        return 0;
      }
    }
    OUTLINED_FUNCTION_57();
  }
  else
  {
    OUTLINED_FUNCTION_55();
  }
  return 1;
}

uint64_t sub_24610FB40()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)(v1 + 16))
    return 0;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_37();
  v2 = OUTLINED_FUNCTION_14_1();
  if ((v3 & 1) == 0)
  {
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_10_0();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v2);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_46();
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
    goto LABEL_9;
  sub_246109704();
  v6 = v4 + 40;
  while (1)
  {
    v7 = *(_QWORD *)(v6 - 8);
    OUTLINED_FUNCTION_15_1();
    if (!OUTLINED_FUNCTION_44_0())
      break;
    v6 += 16;
    OUTLINED_FUNCTION_2_1();
    if (!--v5)
      goto LABEL_9;
  }
  OUTLINED_FUNCTION_55();
  return v7;
}

uint64_t type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider()
{
  return objc_opt_self();
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

void type metadata accessor for ApprovedPhrasesMappingKey()
{
  OUTLINED_FUNCTION_32_0();
}

unint64_t sub_24610FC90()
{
  unint64_t result;

  result = qword_25754AAF0;
  if (!qword_25754AAF0)
  {
    result = MEMORY[0x249550960](&unk_246132F6C, &unk_25173B5C0);
    atomic_store(result, (unint64_t *)&qword_25754AAF0);
  }
  return result;
}

uint64_t sub_24610FCD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24610FD10()
{
  unint64_t result;

  result = qword_25754AAF8;
  if (!qword_25754AAF8)
  {
    result = MEMORY[0x249550960](&unk_24613302C, &unk_25173B658);
    atomic_store(result, (unint64_t *)&qword_25754AAF8);
  }
  return result;
}

uint64_t sub_24610FD50()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_24610FD78(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();
}

_QWORD *sub_24610FDA4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *sub_24610FE0C(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24610FE48(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
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

uint64_t sub_24610FE88(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ApprovedPhraseList()
{
  OUTLINED_FUNCTION_32_0();
}

unint64_t sub_24610FED0()
{
  unint64_t result;

  result = qword_25754AB08;
  if (!qword_25754AB08)
  {
    result = MEMORY[0x249550960](&unk_2461331D8, &type metadata for ApprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB08);
  }
  return result;
}

unint64_t sub_24610FF0C()
{
  unint64_t result;

  result = qword_25754AB20;
  if (!qword_25754AB20)
  {
    result = MEMORY[0x249550960](&unk_2461331B0, &unk_25173B7E8);
    atomic_store(result, (unint64_t *)&qword_25754AB20);
  }
  return result;
}

unint64_t sub_24610FF48()
{
  unint64_t result;

  result = qword_25754AB38;
  if (!qword_25754AB38)
  {
    result = MEMORY[0x249550960](&unk_246133188, &unk_25173B768);
    atomic_store(result, (unint64_t *)&qword_25754AB38);
  }
  return result;
}

unint64_t sub_24610FF84()
{
  unint64_t result;

  result = qword_25754AB50;
  if (!qword_25754AB50)
  {
    result = MEMORY[0x249550960](&unk_246133160, &unk_25173B7E8);
    atomic_store(result, (unint64_t *)&qword_25754AB50);
  }
  return result;
}

uint64_t sub_24610FFC0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x249550960](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246110024()
{
  unint64_t result;

  result = qword_25754AB60;
  if (!qword_25754AB60)
  {
    result = MEMORY[0x249550960](&unk_246133138, &unk_25173B768);
    atomic_store(result, (unint64_t *)&qword_25754AB60);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedPhraseList.CodingKeys()
{
  return &type metadata for ApprovedPhraseList.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for StaticSuggestionApprovedPhrase(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2461100B8()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2461100E0(_QWORD *a1, _QWORD *a2)
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
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_27();
}

_QWORD *sub_246110114(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17_0();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_47();
  return a1;
}

void sub_246110178(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2461101B8(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
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

uint64_t sub_2461101F8(uint64_t result, int a2, int a3)
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

void type metadata accessor for ApprovedAction()
{
  OUTLINED_FUNCTION_32_0();
}

uint64_t sub_246110244()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_246110274(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2461102C8(_QWORD *a1, _QWORD *a2)
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

_QWORD *sub_246110368(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2461103BC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
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

uint64_t sub_2461103FC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ApprovedPhrase()
{
  OUTLINED_FUNCTION_32_0();
}

unint64_t sub_246110458()
{
  unint64_t result;

  result = qword_25754AB68;
  if (!qword_25754AB68)
  {
    result = MEMORY[0x249550960](&unk_246133110, &type metadata for ApprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB68);
  }
  return result;
}

unint64_t sub_246110498()
{
  unint64_t result;

  result = qword_25754AB70;
  if (!qword_25754AB70)
  {
    result = MEMORY[0x249550960](&unk_246133080, &type metadata for ApprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB70);
  }
  return result;
}

unint64_t sub_2461104D8()
{
  unint64_t result;

  result = qword_25754AB78;
  if (!qword_25754AB78)
  {
    result = MEMORY[0x249550960](&unk_2461330A8, &type metadata for ApprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB78);
  }
  return result;
}

unint64_t sub_246110514()
{
  unint64_t result;

  result = qword_25754AB88;
  if (!qword_25754AB88)
  {
    result = MEMORY[0x249550960](&unk_2461333E8, &type metadata for ApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB88);
  }
  return result;
}

unint64_t sub_246110550()
{
  unint64_t result;

  result = qword_25754AB98;
  if (!qword_25754AB98)
  {
    result = MEMORY[0x249550960](&unk_246133398, &type metadata for ApprovedAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754AB98);
  }
  return result;
}

uint64_t _s16SiriAutoComplete18ApprovedPhraseListV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16SiriAutoComplete18ApprovedPhraseListV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246110660 + 4 * byte_246132EB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246110694 + 4 * byte_246132EB0[v4]))();
}

uint64_t sub_246110694(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24611069C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461106A4);
  return result;
}

uint64_t sub_2461106B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461106B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2461106BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461106C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461106D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2461106D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedAction.CodingKeys()
{
  return &type metadata for ApprovedAction.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriAutoCompleteHistogramType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ApprovedPhrase.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461107C8 + 4 * byte_246132EBF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2461107FC + 4 * byte_246132EBA[v4]))();
}

uint64_t sub_2461107FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246110804(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24611080CLL);
  return result;
}

uint64_t sub_246110818(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246110820);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246110824(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24611082C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246110838(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedPhrase.CodingKeys()
{
  return &type metadata for ApprovedPhrase.CodingKeys;
}

unint64_t sub_246110854()
{
  unint64_t result;

  result = qword_25754ABB0;
  if (!qword_25754ABB0)
  {
    result = MEMORY[0x249550960](&unk_2461332B8, &type metadata for ApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABB0);
  }
  return result;
}

unint64_t sub_246110894()
{
  unint64_t result;

  result = qword_25754ABB8;
  if (!qword_25754ABB8)
  {
    result = MEMORY[0x249550960](&unk_246133370, &type metadata for ApprovedAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABB8);
  }
  return result;
}

unint64_t sub_2461108D4()
{
  unint64_t result;

  result = qword_25754ABC0;
  if (!qword_25754ABC0)
  {
    result = MEMORY[0x249550960](&unk_2461332E0, &type metadata for ApprovedAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABC0);
  }
  return result;
}

unint64_t sub_246110914()
{
  unint64_t result;

  result = qword_25754ABC8;
  if (!qword_25754ABC8)
  {
    result = MEMORY[0x249550960](&unk_246133308, &type metadata for ApprovedAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABC8);
  }
  return result;
}

unint64_t sub_246110954()
{
  unint64_t result;

  result = qword_25754ABD0;
  if (!qword_25754ABD0)
  {
    result = MEMORY[0x249550960](&unk_246133228, &type metadata for ApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABD0);
  }
  return result;
}

unint64_t sub_246110994()
{
  unint64_t result;

  result = qword_25754ABD8;
  if (!qword_25754ABD8)
  {
    result = MEMORY[0x249550960](&unk_246133250, &type metadata for ApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754ABD8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_24613279C();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_14_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_24612AD34(v3, v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_24613279C();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_24613276C();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_24613276C();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_30_0(unint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  return sub_24610FFC0(a1, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return sub_24613282C();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_246132814();
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_37_0()
{
  sub_24612FC00();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return sub_24613249C();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return sub_2461327B4();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_246132784();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_246132634();
}

unint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_24610DD10();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_24613246C();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_24613249C();
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2461098E4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_51_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t sub_246110C1C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL sub_246110C24(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_246110C30(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aApplauncsiriki[8 * a1] == *(_QWORD *)&aApplauncsiriki[8 * a2]
    && *(_QWORD *)&aApplauncsiriki[8 * a1 + 24] == *(_QWORD *)&aApplauncsiriki[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_2461327CC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_246110CB4()
{
  return sub_246110D00();
}

uint64_t sub_246110CC0()
{
  sub_24613249C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246110D00()
{
  sub_246132814();
  sub_24613249C();
  swift_bridgeObjectRelease();
  return sub_24613282C();
}

uint64_t sub_246110D64()
{
  unint64_t v0;

  v0 = sub_246132754();
  OUTLINED_FUNCTION_47();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_246110DA8(char a1)
{
  return *(_QWORD *)&aApplauncsiriki[8 * a1];
}

uint64_t sub_246110DC8(char *a1, char *a2)
{
  return sub_246110C30(*a1, *a2);
}

uint64_t sub_246110DD4()
{
  return sub_246110CB4();
}

uint64_t sub_246110DDC()
{
  return sub_246110CC0();
}

uint64_t sub_246110DE4()
{
  return sub_246110D00();
}

uint64_t sub_246110DEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246110D64();
  *a1 = result;
  return result;
}

uint64_t sub_246110E18@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_246110DA8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246110E40()
{
  sub_2461115CC();
  return sub_246132514();
}

uint64_t sub_246110E9C()
{
  sub_2461115CC();
  return sub_246132508();
}

uint64_t sub_246110EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;

  OUTLINED_FUNCTION_9_1();
  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_49();
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_6_2();
  sub_2461167C8(v2, v3, v1);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_49();
  v4 = OUTLINED_FUNCTION_6_2();
  sub_246111648(v4, v5, v6);
  swift_endAccess();
  return OUTLINED_FUNCTION_47();
}

double sub_246110FA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  char v6;

  OUTLINED_FUNCTION_9_1();
  v1 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)(v1 + 16))
    return 0.0;
  OUTLINED_FUNCTION_49();
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_6_2();
  v4 = sub_24612ACE4(v2, v3);
  v5 = 0.0;
  if ((v6 & 1) != 0)
    v5 = *(double *)(*(_QWORD *)(v1 + 56) + 8 * v4);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46();
  return v5;
}

uint64_t sub_246111034(unint64_t a1)
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  char *v13;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_49();
    v3 = sub_246132724();
    if (v3)
      goto LABEL_3;
LABEL_15:
    v5 = MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_49();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v6 = OUTLINED_FUNCTION_6_2();
      MEMORY[0x249550420](v6);
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
    }
    OUTLINED_FUNCTION_4_2();
    sub_246110FA8();
    OUTLINED_FUNCTION_11_1();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_10_1();
      v5 = v8;
    }
    v7 = *(_QWORD *)(v5 + 16);
    if (v7 >= *(_QWORD *)(v5 + 24) >> 1)
    {
      OUTLINED_FUNCTION_10_1();
      v5 = v9;
    }
    ++v4;
    *(_QWORD *)(v5 + 16) = v7 + 1;
    *(double *)(v5 + 8 * v7 + 32) = v1;
    swift_release();
  }
  while (v3 != v4);
LABEL_16:
  OUTLINED_FUNCTION_47();
  v13 = (char *)v5;
  swift_bridgeObjectRetain();
  sub_246130774(&v13);
  swift_bridgeObjectRelease();
  v10 = v13;
  if (!v3)
    return swift_release();
  if (v3 < 1)
    goto LABEL_26;
  OUTLINED_FUNCTION_49();
  v11 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      MEMORY[0x249550420](v11, a1);
    else
      OUTLINED_FUNCTION_5_1();
    ++v11;
    OUTLINED_FUNCTION_4_2();
    sub_246110FA8();
    OUTLINED_FUNCTION_11_1();
    sub_246131A9C((uint64_t)v10, v1);
    sub_2461322F8();
    swift_release();
  }
  while (v3 != v11);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246111264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_2461322C8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  if (!*(_BYTE *)(v0 + 24))
  {
    swift_bridgeObjectRelease();
    return sub_24613234C();
  }
  v8 = sub_2461327CC();
  OUTLINED_FUNCTION_46();
  if ((v8 & 1) != 0)
    return sub_24613234C();
  sub_246132340();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BE91900], v1);
  sub_246111608();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_1();
  v9 = v17;
  v10 = v19;
  v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v5, v1);
  v11(v7, v1);
  if (v9 != v10)
    return sub_246132334();
  v12 = sub_24613234C();
  v14 = v13;
  sub_246132304();
  v17 = v12;
  v18 = v14;
  swift_bridgeObjectRetain();
  sub_2461324A8();
  swift_bridgeObjectRetain();
  sub_2461324A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_24611147C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriAutoCompleteHistogram()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for SiriAutoCompleteHistogramType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24611150C + 4 * byte_246133445[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246111540 + 4 * byte_246133440[v4]))();
}

uint64_t sub_246111540(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246111548(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246111550);
  return result;
}

uint64_t sub_24611155C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246111564);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246111568(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246111570(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriAutoCompleteHistogramType()
{
  return &type metadata for SiriAutoCompleteHistogramType;
}

unint64_t sub_246111590()
{
  unint64_t result;

  result = qword_25754ACC0;
  if (!qword_25754ACC0)
  {
    result = MEMORY[0x249550960](&unk_2461335A8, &type metadata for SiriAutoCompleteHistogramType);
    atomic_store(result, (unint64_t *)&qword_25754ACC0);
  }
  return result;
}

unint64_t sub_2461115CC()
{
  unint64_t result;

  result = qword_25754ACC8;
  if (!qword_25754ACC8)
  {
    result = MEMORY[0x249550960](&unk_246133530, &type metadata for SiriAutoCompleteHistogramType);
    atomic_store(result, (unint64_t *)&qword_25754ACC8);
  }
  return result;
}

unint64_t sub_246111608()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754ACD0;
  if (!qword_25754ACD0)
  {
    v1 = sub_2461322C8();
    result = MEMORY[0x249550960](MEMORY[0x24BE91950], v1);
    atomic_store(result, (unint64_t *)&qword_25754ACD0);
  }
  return result;
}

uint64_t sub_246111648(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2461117D0(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461116C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_1();
  sub_2461118E0(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_246111730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_246111748(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2461119F4);
}

uint64_t sub_24611173C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_246111748(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_246111B3C);
}

uint64_t sub_246111748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v6;
  uint64_t v14;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_3_1();
  a6(a1, a2, a3, a4, a5);
  *v6 = v14;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461117D0(uint64_t a1, uint64_t a2, double a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t result;
  char v14;
  _QWORD *v15;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_24612ACE4(a1, a2);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754ACD8);
  result = sub_2461326F4();
  if ((result & 1) == 0)
    goto LABEL_5;
  result = sub_24612ACE4(a1, a2);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_2461327FC();
    __break(1u);
    return result;
  }
  v11 = result;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    *(double *)(v15[7] + 8 * v11) = a3;
  }
  else
  {
    sub_246111C80(v11, a1, a2, v15, a3);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2461118E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v4 = v3;
  v8 = *v3;
  v9 = sub_24612ACE4(a2, a3);
  if (__OFADD__(*(_QWORD *)(v8 + 16), (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754ACE0);
  if ((sub_2461326F4() & 1) == 0)
    goto LABEL_5;
  v13 = sub_24612ACE4(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_2461327FC();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = *(_QWORD *)(v15 + 56);
    result = swift_release();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_246111CC8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2461119F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v13 = sub_24612AD34(a2, a3, a4, a5);
  if (__OFADD__(v12[2], (v14 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v15 = v13;
  v16 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754A928);
  if ((sub_2461326F4() & 1) == 0)
    goto LABEL_5;
  v17 = sub_24612AD34(a2, a3, a4, a5);
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_9:
    result = sub_2461327FC();
    __break(1u);
    return result;
  }
  v15 = v17;
LABEL_5:
  v19 = *v6;
  if ((v16 & 1) != 0)
  {
    v20 = v19[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v20 + 8 * v15) = a1;
  }
  else
  {
    sub_246111CE4(v15, a2, a3, a4, a5, a1, v19);
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_246111B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t result;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v13 = sub_24612ACE4(a4, a5);
  if (__OFADD__(v12[2], (v14 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v15 = v13;
  v16 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C580);
  if ((sub_2461326F4() & 1) == 0)
    goto LABEL_5;
  v17 = sub_24612ACE4(a4, a5);
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_9:
    result = sub_2461327FC();
    __break(1u);
    return result;
  }
  v15 = v17;
LABEL_5:
  v19 = *v6;
  if ((v16 & 1) != 0)
  {
    v20 = (uint64_t *)(v19[7] + 24 * v15);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *v20 = a1;
    v20[1] = a2;
    v20[2] = a3;
  }
  else
  {
    sub_246111D30(v15, a4, a5, a1, a2, a3, v19);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_246111C80(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4, double a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a4[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(double *)(a4[7] + 8 * result) = a5;
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

unint64_t sub_246111CC8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;

  result = OUTLINED_FUNCTION_0_1(a1, a2, a3, a4, a5);
  if (v8)
    __break(1u);
  else
    *(_QWORD *)(v6 + 16) = v7;
  return result;
}

unint64_t sub_246111CE4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 32 * result);
  *v7 = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  *(_QWORD *)(a7[7] + 8 * result) = a6;
  v8 = a7[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a7[2] = v10;
  return result;
}

unint64_t sub_246111D30(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a7[(result >> 6) + 8] |= 1 << result;
  v7 = (_QWORD *)(a7[6] + 16 * result);
  *v7 = a2;
  v7[1] = a3;
  v8 = (_QWORD *)(a7[7] + 24 * result);
  *v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  v9 = a7[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a7[2] = v11;
  return result;
}

unint64_t OUTLINED_FUNCTION_0_1(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  *(_QWORD *)(a5 + 8 * (result >> 6) + 64) |= 1 << result;
  v5 = (_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * result) = a4;
  return result;
}

void OUTLINED_FUNCTION_3_1()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_246111264();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_2461324FC();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_10_1()
{
  sub_24612FB50();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_246111E28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_2461325A4();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24612B5A4(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_47();
    return v10;
  }
  else
  {
    v7 = v2;
    OUTLINED_FUNCTION_47();
  }
  return v7;
}

void sub_246111ED0()
{
  qword_25754ACE8 = 0x74756374726F6853;
  unk_25754ACF0 = 0xE900000000000073;
}

uint64_t sub_246111EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_source;
  v2 = *MEMORY[0x24BE91918];
  v3 = OUTLINED_FUNCTION_19_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, v2, v3);
  type metadata accessor for SiriAutoCompleteHistogram();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v4 + 24) = 2;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram) = v4;
  return v0;
}

id sub_246111F84()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id result;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_15_2();
  v18 = v0;
  v19 = v1;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_51();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v3, sel_error);
  if (result)
  {
    v9 = result;
    sub_2461323D0();
    v10 = v9;
    v11 = sub_2461323DC();
    v12 = sub_2461325D4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_2();
      v17 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v13 = 136315138;
      v16[1] = v13 + 4;
      swift_getErrorValue();
      v14 = sub_246132808();
      v16[2] = sub_246119920(v14, v15, &v17);
      sub_246132610();

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_22(&dword_246105000, v11, v12, "Error encountered while fetching the link transcript for phrases %s", v13);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_246112148(void *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t *v8;

  v7 = (uint64_t *)(a4 + 16);
  swift_beginAccess();
  v8 = __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  sub_246113C8C(a1, *v8, v7, a2);
  return swift_endAccess();
}

uint64_t sub_2461121BC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  OUTLINED_FUNCTION_15_2();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_51();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_42();
  v5 = objc_msgSend(v2, sel_source);
  if (v5 < 0xB)
    return (0x5BEu >> v5) & 1;
  OUTLINED_FUNCTION_25_0();
  v7 = v2;
  v8 = sub_2461323DC();
  v9 = sub_2461325D4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v10 = 33554688;
    objc_msgSend(v7, sel_source);
    OUTLINED_FUNCTION_23_1();

    _os_log_impl(&dword_246105000, v8, v9, "Unexpected source not covered by switch statement: %hu", v10, 6u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  return 0;
}

void sub_246112308()
{
  void *v0;
  void *v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  _QWORD *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(_QWORD);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  uint64_t v102;
  void (*v103)(_QWORD);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[2];
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;

  OUTLINED_FUNCTION_15_2();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_60();
  v113 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_60();
  v114 = v5;
  v6 = OUTLINED_FUNCTION_19_2();
  v111 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_60();
  v112 = v8;
  v9 = OUTLINED_FUNCTION_51();
  v118 = *(_QWORD *)(v9 - 8);
  v119 = v9;
  OUTLINED_FUNCTION_39();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v108 - v14;
  v16 = sub_246109834(v1, (SEL *)&selRef_bundleIdentifier);
  if (!v17)
  {
    OUTLINED_FUNCTION_25_0();
    v87 = v1;
    v88 = sub_2461323DC();
    v89 = sub_2461325D4();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)OUTLINED_FUNCTION_2();
      v91 = (_QWORD *)OUTLINED_FUNCTION_2();
      *(_DWORD *)v90 = 138412290;
      v136 = (uint64_t)v87;
      v92 = v87;
      OUTLINED_FUNCTION_23_1();
      *v91 = v87;

      OUTLINED_FUNCTION_22(&dword_246105000, v88, v89, "Missing bundleId from LNTranscriptActionRecord: %@", v90);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754A920);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v118 + 8))(v13, v119);
LABEL_64:
    OUTLINED_FUNCTION_28();
    return;
  }
  v126 = v1;
  v109 = v16;
  v110 = v17;
  sub_246114920(v16, v17);
  v20 = v18;
  v122 = *(_QWORD *)(v18 + 16);
  if (!v122)
  {
LABEL_58:
    OUTLINED_FUNCTION_46();
    sub_246114F98(v109, v110);
    if (*(_QWORD *)(v93 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_10_0();
      sub_246132370();
      OUTLINED_FUNCTION_18_2();
      v95(*(_QWORD *)(v94 - 256));
      v96 = sub_2461321D8();
      v99 = OUTLINED_FUNCTION_27_1(v114, v97, v98, v96);
      __swift_storeEnumTagSinglePayload(v113, 1, 1, v99);
LABEL_63:
      sub_246132328();
    }
    else
    {
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_10_0();
    }
    goto LABEL_64;
  }
  v108[1] = v6;
  v21 = 0;
  v124 = 0;
  v121 = v18 + 32;
  *(_QWORD *)&v19 = 136315138;
  v117 = v19;
  v116 = 0x8000000246134630;
  v115 = MEMORY[0x24BEE4AD8] + 8;
  v123 = v15;
  v120 = v18;
  while (v21 < *(_QWORD *)(v20 + 16))
  {
    v22 = (uint64_t *)(v121 + 32 * v21);
    v24 = *v22;
    v23 = v22[1];
    v25 = v22[3];
    v26 = qword_25754A770;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_40();
    if (v26 != -1)
      swift_once();
    v127 = v21;
    v130 = v25;
    if (qword_25754AE28)
    {
      v27 = (id)qword_25754AE28;
      v28 = (void *)sub_246132478();
      if ((v23 & 0x1000000000000000) != 0)
        v29 = sub_2461324C0();
      else
        v29 = sub_2461324CC();
      v30 = objc_msgSend(v27, sel_matchesInString_options_range_, v28, 0, 0, v29);

      sub_24610A844(0, (unint64_t *)&qword_25754AE20);
      v31 = OUTLINED_FUNCTION_20_2();

      swift_bridgeObjectRetain();
      v32 = v124;
      v33 = sub_2461134BC(v31, v24, v23);
      v124 = v32;
      swift_bridgeObjectRelease();

    }
    else
    {
      sub_2461323D0();
      v34 = sub_2461323DC();
      v35 = sub_2461325D4();
      v32 = v35;
      if (os_log_type_enabled(v34, v35))
      {
        v36 = OUTLINED_FUNCTION_2();
        v136 = OUTLINED_FUNCTION_2();
        *(_DWORD *)v36 = v117;
        *(_QWORD *)(v36 + 4) = sub_246119920(0xD000000000000021, v116, &v136);
        OUTLINED_FUNCTION_22(&dword_246105000, v34, (os_log_type_t)v32, "Function: %s > Unable to get variable names since variable name regex could not be initialized", (uint8_t *)v36);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      (*(void (**)(char *, uint64_t))(v118 + 8))(v15, v119);
      v33 = MEMORY[0x24BEE4AF8];
    }
    v37 = sub_2461325A4();
    v134 = v37;
    v38 = *(_QWORD *)(v33 + 16);
    if (v38)
    {
      v39 = (uint64_t *)(v33 + 40);
      do
      {
        v32 = *(v39 - 1);
        v40 = *v39;
        swift_bridgeObjectRetain();
        sub_24612B5A4(&v136, v32, v40);
        swift_bridgeObjectRelease();
        v39 += 2;
        --v38;
      }
      while (v38);
      OUTLINED_FUNCTION_10_0();
      v129 = v134;
    }
    else
    {
      v129 = v37;
      OUTLINED_FUNCTION_10_0();
    }
    v41 = objc_msgSend(objc_msgSend(v126, sel_action), sel_parameters);
    OUTLINED_FUNCTION_9_2();
    v42 = sub_24610A844(0, &qword_25754AE18);
    v43 = sub_24613252C();

    if (v43 >> 62)
    {
      OUTLINED_FUNCTION_11();
      v44 = sub_246132724();
      OUTLINED_FUNCTION_13_0();
    }
    else
    {
      v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v128 = v23;
    v131 = v24;
    v125 = v42;
    if (v44)
    {
      v136 = MEMORY[0x24BEE4AF8];
      sub_246113760();
      if (v44 < 0)
        goto LABEL_67;
      v45 = 0;
      v46 = v136;
      do
      {
        if ((v43 & 0xC000000000000001) != 0)
          v47 = (id)MEMORY[0x249550420](v45, v43);
        else
          v47 = *(id *)(v43 + 8 * v45 + 32);
        v48 = v47;
        v49 = objc_msgSend(v47, sel_identifier);
        v50 = sub_246132484();
        v52 = v51;

        v136 = v46;
        v53 = *(_QWORD *)(v46 + 16);
        if (v53 >= *(_QWORD *)(v46 + 24) >> 1)
        {
          sub_246113760();
          v46 = v136;
        }
        ++v45;
        *(_QWORD *)(v46 + 16) = v53 + 1;
        v54 = v46 + 16 * v53;
        *(_QWORD *)(v54 + 32) = v50;
        *(_QWORD *)(v54 + 40) = v52;
      }
      while (v44 != v45);
      OUTLINED_FUNCTION_13_0();
    }
    else
    {
      OUTLINED_FUNCTION_13_0();
      v46 = MEMORY[0x24BEE4AF8];
    }
    v55 = v129;
    v134 = sub_2461325A4();
    v56 = *(_QWORD *)(v46 + 16);
    if (v56)
    {
      v57 = (uint64_t *)(v46 + 40);
      do
      {
        v58 = *(v57 - 1);
        v59 = *v57;
        OUTLINED_FUNCTION_40();
        sub_24612B5A4(&v136, v58, v59);
        swift_bridgeObjectRelease();
        v57 += 2;
        --v56;
      }
      while (v56);
    }
    OUTLINED_FUNCTION_11_2();
    sub_246127D04(v55, v134);
    v61 = v60;
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_47();
    swift_bridgeObjectRelease();
    if ((v61 & 1) != 0)
    {
      v62 = objc_msgSend(objc_msgSend(v126, sel_action), sel_parameters);
      OUTLINED_FUNCTION_9_2();
      v63 = sub_24613252C();

      v64 = v128;
      if (v63 >> 62)
      {
        OUTLINED_FUNCTION_40();
        v65 = sub_246132724();
        OUTLINED_FUNCTION_10_0();
        if (v65)
        {
LABEL_38:
          v129 = v63;
          v130 = v63 & 0xC000000000000001;
          v66 = 4;
          while (1)
          {
            v67 = v130 ? (id)MEMORY[0x249550420](v66 - 4, v63) : *(id *)(v63 + 8 * v66);
            v68 = v67;
            v69 = v66 - 3;
            if (__OFADD__(v66 - 4, 1))
              break;
            v70 = objc_msgSend(v67, sel_value);
            if (!v70
              || (v71 = v70,
                  v72 = objc_msgSend(v70, sel_displayRepresentation),
                  v71,
                  !v72))
            {
              OUTLINED_FUNCTION_10_0();

              goto LABEL_49;
            }
            v73 = objc_msgSend(v72, sel_title);
            OUTLINED_FUNCTION_9_2();
            type metadata accessor for DefaultLocaleProvider();
            swift_initStaticObject();
            sub_246125B0C();
            v74 = (void *)sub_246132478();
            OUTLINED_FUNCTION_46();
            v75 = objc_msgSend(v71, sel_localizedStringForLocaleIdentifier_, v74);

            v76 = sub_246132484();
            v78 = v77;

            v79 = objc_msgSend(v68, sel_identifier);
            sub_246132484();

            v136 = 31524;
            v137 = 0xE200000000000000;
            sub_2461324A8();
            sub_2461324A8();
            v80 = v136;
            v81 = v137;
            v136 = v131;
            v137 = v64;
            v134 = v80;
            v135 = v81;
            v132 = v76;
            v133 = v78;
            sub_246109704();
            v131 = sub_246132628();
            v83 = v82;
            OUTLINED_FUNCTION_47();
            OUTLINED_FUNCTION_11_2();
            v63 = v129;
            swift_bridgeObjectRelease();

            OUTLINED_FUNCTION_13_0();
            v64 = v83;
            ++v66;
            if (v69 == v65)
              goto LABEL_46;
          }
          __break(1u);
          break;
        }
      }
      else
      {
        v65 = *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v65)
          goto LABEL_38;
      }
LABEL_46:
      OUTLINED_FUNCTION_10_0();
LABEL_49:
      v15 = v123;
      v20 = v120;
      v84 = v127;
      sub_246114D50(v131, v64);
      v86 = *(_QWORD *)(v85 + 16);
      swift_bridgeObjectRelease();
      if (!v86)
      {
        OUTLINED_FUNCTION_46();
        sub_246132370();
        v100 = objc_msgSend(v126, sel_action);
        v101 = objc_msgSend(v100, sel_identifier);

        sub_246132484();
        OUTLINED_FUNCTION_18_2();
        v103(*(_QWORD *)(v102 - 256));
        v104 = sub_2461321D8();
        v107 = OUTLINED_FUNCTION_27_1(v114, v105, v106, v104);
        __swift_storeEnumTagSinglePayload(v113, 1, 1, v107);
        goto LABEL_63;
      }
    }
    else
    {
      v15 = v123;
      v20 = v120;
      v84 = v127;
    }
    v21 = v84 + 1;
    OUTLINED_FUNCTION_11_2();
    if (v21 == v122)
      goto LABEL_58;
  }
  __break(1u);
LABEL_67:
  __break(1u);
}

void sub_246112F30()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38[2];

  OUTLINED_FUNCTION_15_2();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v38[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = OUTLINED_FUNCTION_51();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60128]), sel_init);
  v13 = sub_246132478();
  v14 = (void *)sub_246132478();
  v38[0] = 0;
  v36 = v12;
  v15 = objc_msgSend(v12, sel_actionsForBundleIdentifier_andActionIdentifier_error_, v13, v14, v38);
  OUTLINED_FUNCTION_9_2();

  v16 = v38[0];
  if (v12)
  {
    sub_24610A844(0, &qword_25754AE10);
    v17 = OUTLINED_FUNCTION_20_2();
    v18 = v16;

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v30 = sub_246132724();
      OUTLINED_FUNCTION_46();
      if (v30)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      if ((v17 & 0xC000000000000001) != 0)
      {
        MEMORY[0x249550420](0, v17);
      }
      else
      {
        if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
          __break(1u);
        v19 = *(id *)(v17 + 32);
      }
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_16_1();
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_46();
    goto LABEL_13;
  }
  v34 = v9;
  v35 = v8;
  v20 = v38[0];
  v21 = (void *)sub_246131FC8();

  swift_willThrow();
  sub_2461323D0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17_2();
  v22 = v21;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17_2();
  v23 = v21;
  v24 = sub_2461323DC();
  v25 = sub_2461325D4();
  v26 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    v27 = OUTLINED_FUNCTION_2();
    v33 = (void *)OUTLINED_FUNCTION_2();
    v38[0] = v33;
    *(_DWORD *)v27 = 136315906;
    v32 = v26;
    v37 = sub_246119920(0xD00000000000002ALL, 0x8000000246134600, (uint64_t *)v38);
    OUTLINED_FUNCTION_4_3();
    *(_WORD *)(v27 + 12) = 2080;
    OUTLINED_FUNCTION_11();
    v37 = sub_246119920(v7, v5, (uint64_t *)v38);
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 22) = 2080;
    OUTLINED_FUNCTION_17_2();
    v37 = sub_246119920(v3, v1, (uint64_t *)v38);
    OUTLINED_FUNCTION_4_3();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 32) = 2080;
    swift_getErrorValue();
    v28 = sub_246132808();
    v37 = sub_246119920(v28, v29, (uint64_t *)v38);
    sub_246132610();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_6_3();
    _os_log_impl(&dword_246105000, v24, (os_log_type_t)v32, "Function: %s > Unable to fetch LNActionMetadata for: %s actionIdentifier: %s with error: %s", (uint8_t *)v27, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_6_3();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_6_3();

  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
LABEL_13:
  OUTLINED_FUNCTION_28();
}

uint64_t sub_246113328(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = OUTLINED_FUNCTION_51();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_25_0();
  v5 = sub_2461323DC();
  v6 = sub_2461325BC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246105000, v5, v6, "Ranking App Intent transcript phrases", v7, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_retain();
  sub_246111034(a1);
  return swift_release();
}

uint64_t sub_246113420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_source;
  v2 = OUTLINED_FUNCTION_19_2();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24611347C()
{
  return type metadata accessor for AppIntentTranscriptSource();
}

uint64_t type metadata accessor for AppIntentTranscriptSource()
{
  uint64_t result;

  result = qword_25754AD28;
  if (!qword_25754AD28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461134BC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
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
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_246132724())
  {
    v26 = v5 & 0xC000000000000001;
    v7 = MEMORY[0x24BEE4AF8];
    v8 = 4;
    v24 = v6;
    v25 = v5;
    while (1)
    {
      v9 = v26 ? (id)MEMORY[0x249550420](v8 - 4, v5) : *(id *)(v5 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      objc_msgSend(v9, sel_rangeAtIndex_, 1);
      sub_2461325B0();
      if ((v12 & 1) != 0)
      {

      }
      else
      {
        v13 = a2;
        v14 = a3;
        v15 = sub_2461324F0();
        v16 = MEMORY[0x24955021C](v15);
        v18 = v17;

        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_26_0();
          v7 = v21;
        }
        v19 = *(_QWORD *)(v7 + 16);
        if (v19 >= *(_QWORD *)(v7 + 24) >> 1)
        {
          OUTLINED_FUNCTION_26_0();
          v7 = v22;
        }
        *(_QWORD *)(v7 + 16) = v19 + 1;
        v20 = v7 + 16 * v19;
        *(_QWORD *)(v20 + 32) = v16;
        *(_QWORD *)(v20 + 40) = v18;
        a3 = v14;
        a2 = v13;
        v6 = v24;
        v5 = v25;
      }
      ++v8;
      if (v11 == v6)
        goto LABEL_20;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  v7 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void sub_246113688(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_246132610();
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

unint64_t sub_24611373C(unint64_t result, char a2, uint64_t a3)
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

void sub_246113760()
{
  _QWORD *v0;
  uint64_t v1;

  sub_246130618();
  *v0 = v1;
}

void sub_24611377C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_2461306C0();
  *v0 = v1;
}

uint64_t sub_246113798(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _BOOL4 v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  _BYTE v36[4];
  _BOOL4 v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  _UNKNOWN **v47;

  v8 = sub_2461323E8();
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v36[-v12];
  v14 = type metadata accessor for DefaultEligibilityCriteria();
  v46 = v14;
  v47 = &off_25173BBC8;
  v45[0] = a4;
  swift_retain();
  v15 = objc_msgSend(a3, sel_action);
  v16 = objc_msgSend(v15, sel_identifier);

  v40 = sub_246132484();
  v18 = v17;

  v19 = sub_246109834(a3, (SEL *)&selRef_bundleIdentifier);
  v21 = v20;
  if (v20)
  {
    v22 = v19;
    if ((objc_msgSend(a5, sel_visibleForUse_, 1) & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1(v45, v14);
      LODWORD(v23) = sub_246116E30(v22, v21);
      swift_bridgeObjectRelease();
      v24 = sub_2461121BC();
      __swift_project_boxed_opaque_existential_1(v45, v46);
      v25 = !sub_246116F64();
      LODWORD(v21) = objc_msgSend(a3, sel_source);
      sub_2461323D0();
      swift_bridgeObjectRetain();
      v26 = sub_2461323DC();
      v27 = sub_2461325C8();
      if (os_log_type_enabled(v26, v27))
      {
        v37 = v21 == 3;
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        v39 = v23;
        v23 = v29;
        v44 = v29;
        *(_DWORD *)v28 = 136316162;
        v38 = v21;
        swift_bridgeObjectRetain();
        v43 = sub_246119920(v40, v18, &v44);
        sub_246132610();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 1024;
        LODWORD(v43) = v39 & 1;
        sub_246132610();
        *(_WORD *)(v28 + 18) = 1024;
        LODWORD(v43) = v37;
        sub_246132610();
        *(_WORD *)(v28 + 24) = 1024;
        LODWORD(v43) = v24 & 1;
        sub_246132610();
        *(_WORD *)(v28 + 30) = 1024;
        LODWORD(v43) = v25;
        LODWORD(v21) = v38;
        sub_246132610();
        _os_log_impl(&dword_246105000, v26, v27, "AppIntentTranscript %s autocomplete eligibility evaluation:\nappBundleIsInstalled: %{BOOL}d\nwasExecutedBySiri: %{BOOL}d\nhasValidSource: %{BOOL}d\nnotContainsPhoneNumber: %{BOOL}d", (uint8_t *)v28, 0x24u);
        swift_arrayDestroy();
        v30 = v23;
        LOBYTE(v23) = v39;
        MEMORY[0x249550A14](v30, -1, -1);
        MEMORY[0x249550A14](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(_BYTE *, uint64_t))(v41 + 8))(v13, v42);
      LOBYTE(v21) = (v23 | ((_DWORD)v21 == 3)) & v24 & v25;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_2461323D0();
      swift_bridgeObjectRetain();
      v31 = sub_2461323DC();
      v32 = sub_2461325C8();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v44 = v34;
        *(_DWORD *)v33 = 136315138;
        swift_bridgeObjectRetain();
        v43 = sub_246119920(v40, v18, &v44);
        sub_246132610();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246105000, v31, v32, "AppIntentTranscript %s: Not eligible for autocomplete. AppIntent is not discoverable", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249550A14](v34, -1, -1);
        MEMORY[0x249550A14](v33, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(_BYTE *, uint64_t))(v41 + 8))(v11, v42);
      LOBYTE(v21) = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v21 & 1;
}

uint64_t sub_246113C8C(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  void *v91;
  uint64_t *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97[2];
  uint64_t v98;
  _QWORD v99[3];
  uint64_t v100;
  _UNKNOWN **v101;

  v96 = a4;
  v92 = a3;
  v6 = sub_2461323E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v93 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v89 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v89 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v89 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v89 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v89 - v22;
  v24 = type metadata accessor for DefaultEligibilityCriteria();
  v100 = v24;
  v101 = &off_25173BBC8;
  v99[0] = a2;
  swift_retain();
  v25 = objc_msgSend(a1, sel_eventBody);
  if (!v25)
  {
    sub_2461323D0();
    v42 = sub_2461323DC();
    v43 = sub_2461325D4();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_246105000, v42, v43, "nil eventBody for lnTranscriptActionRecord", v44, 2u);
      MEMORY[0x249550A14](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
  }
  v26 = v25;
  v90 = v12;
  v94 = v7;
  v95 = v6;
  v27 = objc_msgSend(v25, sel_action);
  v28 = objc_msgSend(v27, sel_identifier);

  v29 = sub_246132484();
  v31 = v30;

  v32 = sub_246109834(v26, (SEL *)&selRef_bundleIdentifier);
  if (!v33)
  {
    sub_2461323D0();
    swift_bridgeObjectRetain();
    v45 = sub_2461323DC();
    v46 = sub_2461325D4();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v97[0] = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v98 = sub_246119920(v29, v31, v97);
      sub_246132610();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246105000, v45, v46, "AppIntentTranscript %s: nil bundleId for lnTranscriptActionRecord. Skipping processing.", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v48, -1, -1);
      MEMORY[0x249550A14](v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v21, v95);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
  }
  v34 = v32;
  v35 = v33;
  v89 = v29;
  sub_246112F30();
  v91 = v36;
  if (!v36)
  {
    swift_bridgeObjectRelease();
    sub_2461323D0();
    swift_bridgeObjectRetain();
    v49 = sub_2461323DC();
    v50 = sub_2461325C8();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v97[0] = v52;
      *(_DWORD *)v51 = 136315138;
      swift_bridgeObjectRetain();
      v98 = sub_246119920(v89, v31, v97);
      sub_246132610();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246105000, v49, v50, "AppIntentTranscript %s: no metadata. Skipping processing.", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v52, -1, -1);
      MEMORY[0x249550A14](v51, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v18, v95);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
  }
  v37 = sub_246109834(v26, (SEL *)&selRef_clientLabel);
  v39 = v38;
  if (qword_25754A768 != -1)
    swift_once();
  if (v39)
  {
    if (v37 == qword_25754ACE8 && v39 == unk_25754ACF0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v41 = sub_2461327CC();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0)
        goto LABEL_24;
    }
    v53 = objc_msgSend(v91, sel_identifier);
    sub_246132484();

    v97[0] = v34;
    v97[1] = v35;
    swift_bridgeObjectRetain();
    sub_2461324A8();
    swift_bridgeObjectRetain();
    sub_2461324A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_246110EE8();
    swift_bridgeObjectRelease();
    swift_release();
    v24 = v100;
  }
LABEL_24:
  __swift_project_boxed_opaque_existential_1(v99, v24);
  v54 = v34;
  v55 = v89;
  v56 = sub_246116EC8(v54, v35);
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0 || objc_msgSend(v26, sel_source) == 3)
  {
    sub_246112308();
    if (v57)
    {
      swift_retain();
      sub_246132334();
      sub_246110EE8();
      swift_release();
      swift_bridgeObjectRelease();
      v58 = sub_246132334();
      v60 = v59;
      v61 = __swift_project_boxed_opaque_existential_1(v99, v100);
      LOBYTE(v58) = sub_246113798(v58, v60, v26, *v61, v91);
      swift_bridgeObjectRelease();
      if ((v58 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v62 = *v92;
        swift_bridgeObjectRetain();
        v63 = sub_246132334();
        if (*(_QWORD *)(v62 + 16))
        {
          sub_24612ACE4(v63, v64);
          v66 = v65;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v66 & 1) != 0)
          {

            swift_release();
            return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v85 = sub_246132334();
        v87 = v86;
        v88 = swift_retain();
        sub_2461116C4(v88, v85, v87);

        swift_release();
        swift_bridgeObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
      }
      v78 = v90;
      sub_2461323D0();
      swift_bridgeObjectRetain();
      v79 = sub_2461323DC();
      v80 = sub_2461325C8();
      if (os_log_type_enabled(v79, v80))
      {
        v81 = (uint8_t *)swift_slowAlloc();
        v82 = v55;
        v83 = swift_slowAlloc();
        v97[0] = v83;
        *(_DWORD *)v81 = 136315138;
        swift_bridgeObjectRetain();
        v98 = sub_246119920(v82, v31, v97);
        sub_246132610();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246105000, v79, v80, "AppIntentTranscript %s: not eligible for auto complete criteria. Skipping processing", v81, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249550A14](v83, -1, -1);
        MEMORY[0x249550A14](v81, -1, -1);
        swift_release();

        (*(void (**)(char *, uint64_t))(v94 + 8))(v90, v95);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
        (*(void (**)(char *, uint64_t))(v94 + 8))(v78, v95);
      }
    }
    else
    {
      sub_2461323D0();
      swift_bridgeObjectRetain();
      v67 = sub_2461323DC();
      v68 = sub_2461325C8();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        v70 = v55;
        v71 = swift_slowAlloc();
        v97[0] = v71;
        *(_DWORD *)v69 = 136315138;
        swift_bridgeObjectRetain();
        v98 = sub_246119920(v70, v31, v97);
        sub_246132610();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246105000, v67, v68, "AppIntentTranscript %s: could not get the autocomplete phrase. Skipping processing", v69, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249550A14](v71, -1, -1);
        MEMORY[0x249550A14](v69, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v94 + 8))(v15, v95);
    }
  }
  else
  {
    v72 = v93;
    sub_2461323D0();
    swift_bridgeObjectRetain();
    v73 = sub_2461323DC();
    v74 = sub_2461325C8();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      v76 = v55;
      v77 = swift_slowAlloc();
      v97[0] = v77;
      *(_DWORD *)v75 = 136315138;
      swift_bridgeObjectRetain();
      v98 = sub_246119920(v76, v31, v97);
      sub_246132610();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246105000, v73, v74, "AppIntentTranscript %s: not supported by Siri. Skipping processing.", v75, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v77, -1, -1);
      MEMORY[0x249550A14](v75, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v72, v95);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_246132610();
}

void OUTLINED_FUNCTION_6_3()
{
  void *v0;

}

void OUTLINED_FUNCTION_9_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_2461322C8();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_24613252C();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_2461323D0();
}

void OUTLINED_FUNCTION_26_0()
{
  sub_24612FC00();
}

uint64_t OUTLINED_FUNCTION_27_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return sub_246132034();
}

uint64_t sub_246114910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_246114918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void sub_246114920(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = OUTLINED_FUNCTION_51();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  v29 = MEMORY[0x24BEE4B08];
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60128]), sel_init);
  v10 = (void *)sub_246132478();
  v30[0] = 0;
  v11 = objc_msgSend(v9, sel_examplePhrasesForBundleIdentifier_error_, v10, v30);

  v12 = v30[0];
  if (v11)
  {
    sub_24610A844(0, (unint64_t *)&unk_25754AE38);
    v13 = sub_24613252C();
    v14 = v12;

    v30[0] = (id)MEMORY[0x24BEE4AF8];
    if (v13 >> 62)
    {
      OUTLINED_FUNCTION_11_3();
      v15 = sub_246132724();
      OUTLINED_FUNCTION_17_0();
      if (v15)
        goto LABEL_4;
    }
    else
    {
      v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v15)
      {
LABEL_4:
        if (v15 < 1)
          __break(1u);
        for (i = 0; i != v15; ++i)
        {
          if ((v13 & 0xC000000000000001) != 0)
            v17 = (id)MEMORY[0x249550420](i, v13);
          else
            v17 = *(id *)(v13 + 8 * i + 32);
          v18 = v17;
          if (objc_msgSend(v17, sel_kind))
          {

          }
          else
          {
            sub_2461326B8();
            sub_2461326DC();
            sub_2461326E8();
            sub_2461326C4();
          }
        }
        OUTLINED_FUNCTION_17_0();
        v19 = v30[0];
        goto LABEL_19;
      }
    }
    OUTLINED_FUNCTION_17_0();
    v19 = (id)MEMORY[0x24BEE4AF8];
LABEL_19:
    OUTLINED_FUNCTION_49();
    sub_2461158E8((unint64_t)v19, a1, a2, &v29);
    swift_release();
    goto LABEL_20;
  }
  v20 = v30[0];
  v21 = (void *)sub_246131FC8();

  swift_willThrow();
  sub_2461323D0();
  OUTLINED_FUNCTION_49();
  v22 = v21;
  OUTLINED_FUNCTION_49();
  v23 = v21;
  v24 = sub_2461323DC();
  v25 = sub_2461325D4();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = OUTLINED_FUNCTION_2();
    v30[0] = (id)OUTLINED_FUNCTION_2();
    *(_DWORD *)v26 = 136315650;
    sub_246119920(0xD000000000000024, 0x8000000246134660, (uint64_t *)v30);
    OUTLINED_FUNCTION_8_1();
    *(_WORD *)(v26 + 12) = 2080;
    OUTLINED_FUNCTION_49();
    sub_246119920(a1, a2, (uint64_t *)v30);
    OUTLINED_FUNCTION_8_1();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 22) = 2080;
    swift_getErrorValue();
    v27 = sub_246132808();
    sub_246119920(v27, v28, (uint64_t *)v30);
    sub_246132610();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_4_4();
    _os_log_impl(&dword_246105000, v24, v25, "Function: %s > Error encountered while attempting to get phrase templates for bundleIdentifier '%s': %s", (uint8_t *)v26, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_4_4();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_4_4();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
LABEL_20:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_28();
}

void sub_246114D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v4 = OUTLINED_FUNCTION_51();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  if (qword_25754A770 != -1)
    swift_once();
  if (qword_25754AE28)
  {
    v9 = (id)qword_25754AE28;
    v10 = (void *)sub_246132478();
    OUTLINED_FUNCTION_11_3();
    v11 = sub_2461324D8();
    OUTLINED_FUNCTION_17_0();
    v12 = objc_msgSend(v9, sel_matchesInString_options_range_, v10, 0, 0, v11);

    sub_24610A844(0, (unint64_t *)&qword_25754AE20);
    v13 = OUTLINED_FUNCTION_13_1();

    OUTLINED_FUNCTION_11_3();
    sub_2461134BC(v13, a1, a2);
    swift_bridgeObjectRelease();

  }
  else
  {
    sub_2461323D0();
    v14 = sub_2461323DC();
    v15 = sub_2461325D4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_2();
      v17 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v16 = 136315138;
      sub_246119920(0xD000000000000021, 0x8000000246134630, &v17);
      sub_246132610();
      _os_log_impl(&dword_246105000, v14, v15, "Function: %s > Unable to get variable names since variable name regex could not be initialized", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  }
  OUTLINED_FUNCTION_28();
}

void sub_246114F98(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  void (*v31)(_QWORD *@<X8>);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(_QWORD *@<X8>);
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v60 = OUTLINED_FUNCTION_51();
  v61 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_41();
  v6 = v5 - v4;
  sub_246114920(a1, a2);
  v8 = v7;
  v9 = (_QWORD *)sub_24613246C();
  v10 = *(_QWORD *)(v8 + 16);
  if (v10)
  {
    v59 = v6;
    v11 = (uint64_t *)(v8 + 56);
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v13 = *(v11 - 2);
      v65 = v12;
      v66 = *(v11 - 3);
      v14 = *(v11 - 1);
      v15 = *v11;
      v16 = qword_25754A770;
      swift_bridgeObjectRetain();
      v63 = v15;
      swift_bridgeObjectRetain();
      if (v16 != -1)
        swift_once();
      if (!qword_25754AE28)
        break;
      v17 = (id)qword_25754AE28;
      v18 = (void *)sub_246132478();
      if ((v13 & 0x1000000000000000) != 0)
        v19 = sub_2461324C0();
      else
        v19 = sub_2461324CC();
      v20 = objc_msgSend(v17, sel_matchesInString_options_range_, v18, 0, 0, v19);

      sub_24610A844(0, (unint64_t *)&qword_25754AE20);
      v21 = OUTLINED_FUNCTION_13_1();

      swift_bridgeObjectRetain();
      v22 = sub_2461134BC(v21, v66, v13);
      OUTLINED_FUNCTION_4_1();

      v23 = *(_QWORD *)(v22 + 16);
      swift_bridgeObjectRelease();
      if (!v23)
        goto LABEL_14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v65;
LABEL_19:
      v11 += 4;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    sub_2461323D0();
    v24 = sub_2461323DC();
    v25 = sub_2461325D4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = OUTLINED_FUNCTION_2();
      v68 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v26 = 136315138;
      *(_QWORD *)(v26 + 4) = sub_246119920(0xD000000000000021, 0x8000000246134630, &v68);
      _os_log_impl(&dword_246105000, v24, v25, "Function: %s > Unable to get variable names since variable name regex could not be initialized", (uint8_t *)v26, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v60);
LABEL_14:
    v12 = v65;
    v69 = v65;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24611377C();
      v12 = v69;
    }
    v27 = v12[2];
    if (v27 >= v12[3] >> 1)
    {
      sub_24611377C();
      v12 = v69;
    }
    v12[2] = v27 + 1;
    v28 = &v12[4 * v27];
    v28[4] = v66;
    v28[5] = v13;
    v28[6] = v14;
    v28[7] = v63;
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
  v29 = v12[2];
  if (!v29)
  {
    v62 = 0;
LABEL_49:
    swift_release();
    swift_bridgeObjectRelease();
    sub_246115C3C((uint64_t)v62);
    OUTLINED_FUNCTION_28();
    return;
  }
  v30 = v12;
  v31 = 0;
  v32 = MEMORY[0x24BEE4AF8];
  v33 = v30 + 7;
  v62 = sub_2461155A8;
  while (1)
  {
    v34 = *(v33 - 2);
    v64 = *(v33 - 3);
    v36 = *(v33 - 1);
    v35 = *v33;
    swift_bridgeObjectRetain_n();
    v67 = v34;
    swift_bridgeObjectRetain();
    sub_246115C3C((uint64_t)v31);
    swift_isUniquelyReferenced_nonNull_native();
    v69 = v9;
    v37 = OUTLINED_FUNCTION_2_2();
    if (__OFADD__(v9[2], (v38 & 1) == 0))
      break;
    v39 = v37;
    v40 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754AE30);
    v9 = v69;
    if ((sub_2461326F4() & 1) != 0)
    {
      v41 = OUTLINED_FUNCTION_2_2();
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_53;
      v39 = v41;
    }
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0)
    {
      v69[(v39 >> 6) + 8] |= 1 << v39;
      v43 = (_QWORD *)(v9[6] + 16 * v39);
      *v43 = v36;
      v43[1] = v35;
      *(_QWORD *)(v9[7] + 8 * v39) = 0;
      v44 = v9[2];
      v45 = v44 + 1;
      v46 = __OFADD__(v44, 1);
      OUTLINED_FUNCTION_49();
      if (v46)
        goto LABEL_52;
      v9[2] = v45;
    }
    swift_bridgeObjectRetain();
    v47 = v9[7];
    swift_bridgeObjectRelease();
    v48 = *(_QWORD *)(v47 + 8 * v39);
    v49 = __OFADD__(v48, 1);
    v50 = v48 + 1;
    if (v49)
      goto LABEL_51;
    *(_QWORD *)(v47 + 8 * v39) = v50;
    OUTLINED_FUNCTION_4_1();
    if (!v9[2])
      goto LABEL_41;
    swift_bridgeObjectRetain();
    v51 = OUTLINED_FUNCTION_2_2();
    if ((v52 & 1) == 0)
    {
      OUTLINED_FUNCTION_4_1();
LABEL_41:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_12_1(0, *(_QWORD *)(v32 + 16) + 1);
        v32 = v57;
      }
      v55 = *(_QWORD *)(v32 + 16);
      v54 = *(_QWORD *)(v32 + 24);
      if (v55 >= v54 >> 1)
      {
        OUTLINED_FUNCTION_12_1(v54 > 1, v55 + 1);
        v32 = v58;
      }
      *(_QWORD *)(v32 + 16) = v55 + 1;
      v56 = (_QWORD *)(v32 + 32 * v55);
      v56[4] = v64;
      v56[5] = v67;
      v56[6] = v36;
      v56[7] = v35;
      goto LABEL_46;
    }
    v53 = *(_QWORD *)(v9[7] + 8 * v51);
    OUTLINED_FUNCTION_4_1();
    if (v53 <= 1)
      goto LABEL_41;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_1();
LABEL_46:
    v33 += 4;
    v31 = sub_2461155A8;
    if (!--v29)
      goto LABEL_49;
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  sub_2461327FC();
  __break(1u);
}

void sub_2461155A8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

double sub_2461155B0@<D0>(id *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_t v31;
  double result;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  os_log_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a5;
  v9 = sub_2461323E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = objc_msgSend(*a1, sel_parentIdentifier);
  v39 = sub_246132484();
  v16 = v15;

  v17 = sub_246115C4C(v13);
  if (v18)
  {
    v19 = v17;
    v20 = v18;
    v21 = *a4;
    swift_bridgeObjectRetain();
    sub_246127778(v19, v20, v21);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_24612B5A4(&v41, v19, v20);
      swift_bridgeObjectRelease();
      v33 = v39;
      v34 = v40;
      *v40 = v19;
      v34[1] = v20;
      v34[2] = v33;
      v34[3] = v16;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v38 = a2;
    sub_2461323D0();
    v24 = a3;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v25 = sub_2461323DC();
    v26 = sub_2461325D4();
    v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v28 = swift_slowAlloc();
      v37 = v27;
      v36 = v25;
      v29 = v28;
      v30 = swift_slowAlloc();
      v41 = v30;
      *(_DWORD *)v29 = 136315650;
      v42 = sub_246119920(0xD000000000000024, 0x8000000246134660, &v41);
      sub_246132610();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      v42 = sub_246119920(v38, v24, &v41);
      sub_246132610();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 22) = 2080;
      swift_bridgeObjectRetain();
      v42 = sub_246119920(v39, v16, &v41);
      sub_246132610();
      swift_bridgeObjectRelease_n();
      v31 = v36;
      _os_log_impl(&dword_246105000, v36, (os_log_type_t)v37, "Function: %s > No phrase template found for bundleId: %s, actionIdentifier: %s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v30, -1, -1);
      MEMORY[0x249550A14](v29, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  result = 0.0;
  v35 = v40;
  *(_OWORD *)v40 = 0u;
  *((_OWORD *)v35 + 1) = 0u;
  return result;
}

void sub_2461158E8(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_246132724())
  {
    v24 = v5 & 0xC000000000000001;
    v28 = MEMORY[0x24BEE4AF8];
    v7 = 4;
    v22 = v6;
    v23 = v5;
    while (1)
    {
      v8 = v24 ? (id)MEMORY[0x249550420](v7 - 4, v5) : *(id *)(v5 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v33 = v8;
      sub_2461155B0(&v33, a2, a3, a4, &v29);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }

      v11 = v30;
      if (v30)
      {
        v12 = v28;
        v13 = v29;
        v15 = v31;
        v14 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24612FCB0(0, *(_QWORD *)(v28 + 16) + 1, 1, v28);
          v12 = v20;
        }
        v16 = v12;
        v17 = *(_QWORD *)(v12 + 16);
        v28 = v16;
        v18 = *(_QWORD *)(v16 + 24);
        if (v17 >= v18 >> 1)
        {
          sub_24612FCB0(v18 > 1, v17 + 1, 1, v28);
          v28 = v21;
        }
        *(_QWORD *)(v28 + 16) = v17 + 1;
        v19 = (_QWORD *)(v28 + 32 * v17);
        v19[4] = v13;
        v19[5] = v11;
        v19[6] = v15;
        v19[7] = v14;
        v6 = v22;
        v5 = v23;
      }
      ++v7;
      if (v10 == v6)
        goto LABEL_20;
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_246115AE8()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  result = sub_246115B64(0x775C5B287B5C245CLL, 0xEE007D5C292B5D2ELL, 0);
  qword_25754AE28 = (uint64_t)result;
  return result;
}

id sub_246115B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_246131FC8();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_246115C3C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_246115C4C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_phraseTemplate);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246132484();

  return v3;
}

ValueMetadata *type metadata accessor for DefaultExamplePhrasesProvider()
{
  return &type metadata for DefaultExamplePhrasesProvider;
}

unint64_t OUTLINED_FUNCTION_2_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24612ACE4(v1, v0);
}

void OUTLINED_FUNCTION_4_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_12_1(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_24612FCC4(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_24613252C();
}

uint64_t sub_246115D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_246115D88;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_246115D88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_246115DD8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = a2;
  v3 = sub_2461323E8();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246115E48()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[9];
  v1 = v0[10];
  v3 = swift_task_alloc();
  v0[15] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_246115EF0;
  return sub_2461327E4();
}

uint64_t sub_246115EF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_246115F5C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(unsigned __int8 *)(v0 + 148);
  sub_2461323D0();
  swift_bridgeObjectRetain_n();
  v2 = sub_2461323DC();
  v3 = sub_2461325C8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 72);
    v6 = OUTLINED_FUNCTION_2();
    v11 = OUTLINED_FUNCTION_2();
    *(_DWORD *)v6 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_246119920(v5, v4, &v11);
    sub_246132610();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 144) = v1;
    sub_246132610();
    _os_log_impl(&dword_246105000, v2, v3, "DefaultSiriShortcutsEnablementProvider: %s enabled for siri: %{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 88);
  v9 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRelease_n();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_246116128()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = *(void **)(v0 + 136);
  swift_task_dealloc();
  sub_2461323D0();
  swift_bridgeObjectRetain();
  v2 = v1;
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = sub_2461323DC();
  v5 = sub_2461325D4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 72);
    v8 = OUTLINED_FUNCTION_2();
    v15 = OUTLINED_FUNCTION_2();
    *(_DWORD *)v8 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_246119920(v7, v6, &v15);
    sub_246132610();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getErrorValue();
    v9 = sub_246132808();
    *(_QWORD *)(v0 + 64) = sub_246119920(v9, v10, &v15);
    sub_246132610();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_6_3();
    _os_log_impl(&dword_246105000, v4, v5, "DefaultSiriShortcutsEnablementProvider: Could not determine if App Shortcuts for %s are enabled %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  v12 = *(_QWORD *)(v0 + 96);
  v11 = *(_QWORD *)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 88);
  OUTLINED_FUNCTION_4_5();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_4_5();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

void sub_246116378(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AEF0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v6 = (void *)sub_246132478();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_2461166C0;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24611655C;
  aBlock[3] = &block_descriptor;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v5, sel_getSiriAutoShortcutsEnablementForBundleIdentifier_completion_, v6, v9);
  _Block_release(v9);

}

uint64_t sub_2461164EC(int a1, id a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754AEF0);
    return sub_246132574();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754AEF0);
    return sub_246132580();
  }
}

void sub_24611655C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_2461165BC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultSiriShortcutsEnablementProvider()
{
  return objc_opt_self();
}

uint64_t sub_2461165EC()
{
  return sub_246132610();
}

uint64_t sub_246116610(uint64_t (*a1)(void))
{
  return OUTLINED_FUNCTION_54(a1) & 1;
}

uint64_t sub_246116630@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_54(a1);
  *a2 = result;
  return result;
}

void sub_246116654(uint64_t a1)
{
  sub_246116378(a1);
}

uint64_t sub_24611665C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AEF0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2461166C0(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AEF0);
  return sub_2461164EC(a1, a2);
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

void OUTLINED_FUNCTION_4_5()
{
  void *v0;

}

uint64_t sub_246116730(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_246116738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_246116740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_246116748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t sub_246116750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_246116758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = OUTLINED_FUNCTION_8_2(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 24 * v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_2461167C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a3 + 16) && (v4 = OUTLINED_FUNCTION_8_2(a1, a2), (v5 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v4);
  else
    return 0;
}

uint64_t sub_246116808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (OUTLINED_FUNCTION_8_2(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

char *sub_246116844()
{
  uint64_t v0;
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
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
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  void (*v41)(char *, unint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, unint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = sub_246132454();
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_7_2();
  v3 = sub_246132418();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2461323E8();
  v53 = *(_QWORD *)(v7 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v52 = (void (*)(char *, unint64_t, uint64_t))((char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v48 - v10;
  sub_24613243C();
  v12 = sub_246132430();
  v50 = v11;
  v51 = v7;
  v56 = v0;
  v57 = v4;
  v54 = v2;
  v55 = v1;
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25754AEF8);
  v14 = sub_2461323F4();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_246132D70;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104))(v17 + v16, *MEMORY[0x24BEB8E50], v14);
  v19 = sub_246132424();
  v48[1] = v13;
  swift_bridgeObjectRelease();
  v20 = v50;
  sub_2461323D0();
  swift_bridgeObjectRetain();
  v21 = sub_2461323DC();
  v22 = sub_2461325BC();
  v23 = OUTLINED_FUNCTION_4_6(v22);
  v49 = v19;
  if (v23)
  {
    v24 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v24 = 134217984;
    v58 = *(_QWORD *)(v49 + 16);
    sub_246132610();
    OUTLINED_FUNCTION_55();
    _os_log_impl(&dword_246105000, v21, OS_LOG_TYPE_DEFAULT, "Number of assistantInvocable tools: %ld", v24, 0xCu);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_55();
  v25 = v56;
  v26 = v57;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v20, v51);
  v27 = *(_QWORD *)(v19 + 16);
  if (v27)
  {
    OUTLINED_FUNCTION_2_3();
    v28 = v26;
    v29 = v19 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    v30 = *(_QWORD *)(v28 + 72);
    v52 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
    v53 = v30;
    v31 = v27;
    do
    {
      v52(v6, v29, v3);
      v32 = (uint64_t)v6;
      v33 = sub_24613240C();
      v35 = v34;
      OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));
      if ((OUTLINED_FUNCTION_9_3() & 1) == 0)
      {
        OUTLINED_FUNCTION_3_2();
        v32 = v58;
      }
      v36 = *(_QWORD *)(v32 + 16);
      if (v36 >= *(_QWORD *)(v32 + 24) >> 1)
      {
        sub_246113760();
        v32 = v58;
      }
      *(_QWORD *)(v32 + 16) = v36 + 1;
      v37 = v32 + 16 * v36;
      *(_QWORD *)(v37 + 32) = v33;
      *(_QWORD *)(v37 + 40) = v35;
      v29 += v53;
      --v31;
    }
    while (v31);
    v25 = v56;
    v26 = v57;
    v19 = v49;
  }
  else
  {
    v32 = MEMORY[0x24BEE4AF8];
  }
  v38 = sub_246111E28(v32);
  v39 = (char *)v38;
  if (v27)
  {
    v52 = (void (*)(char *, unint64_t, uint64_t))v38;
    OUTLINED_FUNCTION_2_3();
    v40 = v19 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    v53 = *(_QWORD *)(v26 + 72);
    v41 = *(void (**)(char *, unint64_t, uint64_t))(v26 + 16);
    do
    {
      v41(v6, v40, v3);
      sub_246132400();
      v42 = v25;
      v43 = sub_246132448();
      v45 = v44;
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v25, v55);
      OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
      if ((OUTLINED_FUNCTION_9_3() & 1) == 0)
      {
        OUTLINED_FUNCTION_3_2();
        v42 = v58;
      }
      v46 = *(_QWORD *)(v42 + 16);
      if (v46 >= *(_QWORD *)(v42 + 24) >> 1)
      {
        sub_246113760();
        v42 = v58;
      }
      *(_QWORD *)(v42 + 16) = v46 + 1;
      v47 = v42 + 16 * v46;
      *(_QWORD *)(v47 + 32) = v43;
      *(_QWORD *)(v47 + 40) = v45;
      v40 += v53;
      --v27;
      v25 = v56;
      v26 = v57;
    }
    while (v27);
    swift_bridgeObjectRelease();
    v39 = (char *)v52;
  }
  else
  {
    OUTLINED_FUNCTION_55();
    v42 = MEMORY[0x24BEE4AF8];
  }
  sub_246111E28(v42);
  swift_release();
  return v39;
}

uint64_t sub_246116E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  char v6;

  if (*(_QWORD *)(*(_QWORD *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40))
                             + 16)
                 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24612ACE4(a1, a2);
    v6 = v5;
    if ((v5 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_246116EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  sub_2461324A8();
  swift_bridgeObjectRetain();
  sub_2461324A8();
  swift_bridgeObjectRelease();
  sub_246127778(a1, a2, *(_QWORD *)(v2 + 56));
  v4 = v3;
  OUTLINED_FUNCTION_46();
  return v4 & 1;
}

BOOL sub_246116F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;

  v1 = sub_2461323E8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_27_0();
  v3 = objc_allocWithZone(MEMORY[0x24BDD14E8]);
  v4 = sub_2461171B8(2048);
  v9 = v4;
  if (v4)
  {
    v10 = (void *)sub_246132478();
    swift_bridgeObjectRetain();
    v11 = sub_2461324D8();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_matchesInString_options_range_, v10, 0, 0, v11);

    sub_246117268();
    v13 = sub_24613252C();

    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      v14 = sub_246132724();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

    }
    return v14 != 0;
  }
  else
  {
    sub_2461323D0();
    v5 = sub_2461323DC();
    v6 = sub_2461325D4();
    if (OUTLINED_FUNCTION_4_6(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_246105000, v5, OS_LOG_TYPE_DEFAULT, "Unable to initialize an NSDataDetector with checking type 'phoneNumber'", v7, 2u);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    return 0;
  }
}

uint64_t sub_246117144()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246117170()
{
  sub_246117144();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultEligibilityCriteria()
{
  return objc_opt_self();
}

uint64_t sub_2461171B0()
{
  return 0;
}

id sub_2461171B8(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v2 = objc_msgSend(v1, sel_initWithTypes_error_, a1, v6);
  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_246131FC8();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_246117268()
{
  unint64_t result;

  result = qword_25754AE20;
  if (!qword_25754AE20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25754AE20);
  }
  return result;
}

uint64_t sub_2461172A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21[3];
  uint64_t v22;
  uint64_t v23;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_27_0();
  v22 = v12;
  v23 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  type metadata accessor for DefaultEligibilityCriteria();
  v15 = swift_allocObject();
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t *))(v17 + 16))(v6);
  v18 = *v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v5, a2, a5);
  v19 = sub_246117434(v18, v5, v15, a5);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, a5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v19;
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

uint64_t sub_246117434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _UNKNOWN **v17;

  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 32))(v9);
  v16 = type metadata accessor for DefaultInstalledAppProvider();
  v17 = &off_25173BDF8;
  *(_QWORD *)&v15 = a1;
  if ((sub_24613222C() & 1) != 0)
  {
    type metadata accessor for DefaultEligibilityCriteria();
    v10 = sub_246116844();
    v12 = v11;
  }
  else
  {
    v12 = MEMORY[0x24BEE4B08];
    v10 = (char *)MEMORY[0x24BEE4B08];
  }
  sub_24611751C(&v15, a3 + 16);
  *(_QWORD *)(a3 + 56) = v10;
  *(_QWORD *)(a3 + 64) = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a4);
  return a3;
}

uint64_t sub_24611751C(__int128 *a1, uint64_t a2)
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

void OUTLINED_FUNCTION_2_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = v0;
  sub_246113760();
}

void OUTLINED_FUNCTION_3_2()
{
  sub_246113760();
}

BOOL OUTLINED_FUNCTION_4_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_8_2(uint64_t a1, uint64_t a2)
{
  return sub_24612ACE4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void sub_2461175B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_2461175BC(a1, a2, a3, a4, (void (*)(uint64_t))sub_24611A3F0);
}

void sub_2461175BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_2461327D8();
  swift_unknownObjectRetain_n();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    OUTLINED_FUNCTION_207();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v10 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    v8 = OUTLINED_FUNCTION_256();
    a5(v8);
    goto LABEL_9;
  }
  if (!swift_dynamicCastClass())
    OUTLINED_FUNCTION_207();
LABEL_9:
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_177();
}

uint64_t sub_24611768C(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_24611A65C(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v3 >= v5)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

void sub_2461176F8(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = a1;
    v5 = a2 >> 62;
    if (!(a2 >> 62))
    {
      OUTLINED_FUNCTION_242();
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_49();
  v4 = OUTLINED_FUNCTION_174();
  OUTLINED_FUNCTION_47();
LABEL_4:
  v6 = sub_24611A65C(0, v3, v4);
  if ((v7 & 1) != 0)
    v8 = v4;
  else
    v8 = v6;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v5)
  {
    OUTLINED_FUNCTION_49();
    v9 = OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_47();
    if (v9 < 0)
    {
LABEL_23:
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_49();
    v4 = OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_47();
  }
  else
  {
    OUTLINED_FUNCTION_242();
  }
  if (v4 < v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    OUTLINED_FUNCTION_137();
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      sub_246132688();
      v10 = v11;
    }
    while (v8 != v11);
  }
  if (v5)
  {
    OUTLINED_FUNCTION_49();
    sub_246132730();
    OUTLINED_FUNCTION_44_1();
  }
}

void sub_246117864(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  OUTLINED_FUNCTION_135();
  v4 = a2;
  v3();
  OUTLINED_FUNCTION_48_0();

}

uint64_t sub_2461178AC()
{
  uint64_t result;

  result = sub_246132214();
  qword_25754B910 = result;
  return result;
}

void SiriAutoCompleteIndexBuilder.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_2461321F0();
  v24 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v25[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v25[-1] - v4;
  sub_2461321E4();
  type metadata accessor for DefaultInstalledAppProvider();
  v6 = OUTLINED_FUNCTION_125();
  *(_QWORD *)(v6 + 16) = sub_246124EFC();
  OUTLINED_FUNCTION_224((uint64_t)v3);
  v7 = swift_retain();
  v8 = sub_24611CD84(v7, (uint64_t)v3);
  v9 = sub_246132208();
  v10 = MEMORY[0x24BE91808];
  v30 = v0;
  v31 = MEMORY[0x24BE91808];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
  sub_2461321E4();
  v11 = sub_2461321FC();
  v12 = sub_2461321A8();
  v14 = v13;
  v30 = v9;
  v31 = MEMORY[0x24BE91828];
  v28 = v10;
  *(_QWORD *)&v29 = v11;
  v27 = v0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  OUTLINED_FUNCTION_224((uint64_t)boxed_opaque_existential_1);
  v16 = type metadata accessor for DefaultEligibilityCriteria();
  v25[3] = v16;
  v25[4] = &off_25173BBC8;
  v25[0] = v8;
  type metadata accessor for SiriAutoCompleteIndexBuilder();
  v17 = (_QWORD *)OUTLINED_FUNCTION_125();
  v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v16);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_41();
  v21 = (uint64_t *)(v20 - v19);
  (*(void (**)(uint64_t))(v22 + 16))(v20 - v19);
  v23 = *v21;
  v17[17] = v16;
  v17[18] = &off_25173BBC8;
  v17[14] = v23;
  sub_24611751C(&v29, (uint64_t)(v17 + 2));
  v17[7] = v12;
  v17[8] = v14;
  sub_24611751C(&v26, (uint64_t)(v17 + 9));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  swift_release();
  OUTLINED_FUNCTION_51_0((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  OUTLINED_FUNCTION_28();
}

uint64_t sub_246117AB8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[9] = a1;
  v2[10] = v1;
  v3 = sub_2461323C4();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = OUTLINED_FUNCTION_223();
  v4 = OUTLINED_FUNCTION_51();
  v2[14] = v4;
  v2[15] = *(_QWORD *)(v4 - 8);
  v2[16] = OUTLINED_FUNCTION_154();
  v2[17] = OUTLINED_FUNCTION_154();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246117B30()
{
  uint64_t v0;
  os_log_type_t v1;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  void (*v18)(uint64_t);
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
  _QWORD *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  uint64_t v33;

  v2 = (_QWORD *)OUTLINED_FUNCTION_138();
  __swift_project_boxed_opaque_existential_1(v2, v3);
  OUTLINED_FUNCTION_151();
  if ((sub_246132220() & 1) != 0)
  {
    v4 = *(NSObject **)(v0 + 72);
    OUTLINED_FUNCTION_189();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_210();
    v5 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_208(v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_2();
      v33 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v6 = 136315138;
      v7 = OUTLINED_FUNCTION_251();
      v8 = MEMORY[0x2495502C4](v7, MEMORY[0x24BEE0D00]);
      v10 = v9;
      OUTLINED_FUNCTION_178();
      *(_QWORD *)(v0 + 64) = sub_246119920(v8, v10, &v33);
      OUTLINED_FUNCTION_201();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_22(&dword_246105000, v4, v1, "SiriAutoCompleteIndexBuilder updateIndexForAppInstall with %s", v6);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_44_1();

    v17 = OUTLINED_FUNCTION_151();
    v18(v17);
    v31 = *(_QWORD *)(v0 + 72);
    v19 = type metadata accessor for DefaultEligibilityCriteria();
    v20 = type metadata accessor for DefaultInstalledAppProvider();
    v21 = OUTLINED_FUNCTION_125();
    *(_QWORD *)(v21 + 16) = sub_246124EFC();
    v22 = OUTLINED_FUNCTION_256();
    sub_2461238D0(v22, v23);
    v24 = *(_QWORD *)(v0 + 40);
    v25 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v24);
    v26 = *(_QWORD *)(v24 - 8);
    v27 = OUTLINED_FUNCTION_223();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v27, v25, v24);
    *(_QWORD *)(v0 + 56) = v21;
    OUTLINED_FUNCTION_102();
    v28 = sub_2461172A4(v0 + 56, v27, v19, v20, v24);
    *(_QWORD *)(v0 + 144) = v28;
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    OUTLINED_FUNCTION_110();
    OUTLINED_FUNCTION_245();
    v29 = type metadata accessor for AppLaunchSource();
    OUTLINED_FUNCTION_135();
    *(_QWORD *)(v0 + 152) = sub_24611DC78(v31, v28, v29);
    OUTLINED_FUNCTION_48_0();
    v32 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25754AF08 + dword_25754AF08);
    OUTLINED_FUNCTION_135();
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v30;
    *v30 = v0;
    v30[1] = sub_246117E84;
    return v32(v28, *(_QWORD *)(v0 + 72));
  }
  else
  {
    v11 = *(void **)(v0 + 136);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v12 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_35_1(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_113(&dword_246105000, v13, v14, "SiriAutoCompleteIndexBuilder: index build is not enabled. Not running updateIndexForAppInstall");
      OUTLINED_FUNCTION_0();
    }
    v15 = *(_QWORD *)(v0 + 120);

    OUTLINED_FUNCTION_117(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    swift_task_dealloc();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    return OUTLINED_FUNCTION_103(0, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_246117E84()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 168) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246117EC8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t i;
  char v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;

  OUTLINED_FUNCTION_182();
  v6 = v1[19];
  sub_2461195EC(v1[21]);
  if (!(v6 >> 62))
  {
    OUTLINED_FUNCTION_242();
    if (v0)
      goto LABEL_3;
LABEL_15:
    OUTLINED_FUNCTION_47();
    v4 = v1[10];
    sub_2461323B8();
    OUTLINED_FUNCTION_67_0();
    OUTLINED_FUNCTION_55_0();
    OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_28_1((_QWORD *)(v4 + 16));
    v5 = (_QWORD *)swift_task_alloc();
    v1[22] = v5;
    OUTLINED_FUNCTION_15_3(v5, (uint64_t)sub_246118068);
    sub_246132244();
    return;
  }
  OUTLINED_FUNCTION_49();
  v0 = OUTLINED_FUNCTION_249();
  OUTLINED_FUNCTION_47();
  if (!v0)
    goto LABEL_15;
LABEL_3:
  if (v0 >= 1)
  {
    for (i = 0; i != v0; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      if (qword_25441C4F0 != -1)
        swift_once();
      sub_24610C75C();
      if ((v3 & 1) != 0)
      {
        OUTLINED_FUNCTION_109();
      }
      else
      {
        sub_2461326B8();
        sub_2461326DC();
        OUTLINED_FUNCTION_204();
        sub_2461326E8();
        sub_2461326C4();
      }
    }
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_246118068()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 184) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_2461180A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  OUTLINED_FUNCTION_116(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  v2 = *(_QWORD *)(v0 + 184);
  swift_task_dealloc();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_65_0();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_246118108(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  OUTLINED_FUNCTION_8_3();
  return swift_task_switch();
}

uint64_t sub_246118124()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_28_1((_QWORD *)(*(_QWORD *)(v0 + 24) + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_246118194;
  return sub_246132238();
}

uint64_t sub_246118194(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_11_4();
  return OUTLINED_FUNCTION_142(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2461181C8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 368) = a1;
  v3 = OUTLINED_FUNCTION_51();
  *(_QWORD *)(v2 + 24) = v3;
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 40) = OUTLINED_FUNCTION_154();
  *(_QWORD *)(v2 + 48) = OUTLINED_FUNCTION_154();
  *(_QWORD *)(v2 + 56) = OUTLINED_FUNCTION_154();
  *(_QWORD *)(v2 + 64) = OUTLINED_FUNCTION_154();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246118234()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  _QWORD *v6;
  os_log_type_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v28)(void);

  if (*(_BYTE *)(v1 + 368) == 1)
  {
    v2 = *(NSObject **)(v1 + 64);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v3 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_4_6(v3))
    {
      v4 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v4 = 0;
      v5 = "SiriAutoCompleteIndexBuilder: index build upon first installation is currently disabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v6 = *(_QWORD **)(v1 + 16);
  v0 = v6[13];
  __swift_project_boxed_opaque_existential_1(v6 + 9, v6[12]);
  OUTLINED_FUNCTION_138();
  if ((sub_246132220() & 1) == 0)
  {
    v2 = *(NSObject **)(v1 + 56);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v8 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_4_6(v8))
    {
      v4 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v4 = 0;
      v5 = "SiriAutoCompleteIndexBuilder: index build is not enabled. Not running";
LABEL_10:
      _os_log_impl(&dword_246105000, v2, (os_log_type_t)v0, v5, v4, 2u);
      OUTLINED_FUNCTION_0();
    }
LABEL_11:
    v9 = *(_QWORD *)(v1 + 32);

    OUTLINED_FUNCTION_117(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    swift_task_dealloc();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_65_0();
    return OUTLINED_FUNCTION_92(0, *(uint64_t (**)(void))(v1 + 8));
  }
  swift_getObjectType();
  if ((sub_24613219C() & 1) != 0)
  {
    v2 = *(NSObject **)(v1 + 48);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v7 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_4_6(v7))
    {
      v4 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v4 = 0;
      v5 = "SiriAutoCompleteIndexBuilder: automatic index building is disabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  sub_246118E20();
  v12 = v11;
  *(_QWORD *)(v1 + 72) = v11;
  *(_QWORD *)(v1 + 80) = OUTLINED_FUNCTION_121();
  if (qword_25754A778 != -1)
    swift_once();
  v13 = *(_QWORD *)(v1 + 16);
  sub_246132268();
  OUTLINED_FUNCTION_66_0();
  type metadata accessor for AppLaunchHistogramBuilder();
  v14 = sub_246126D94();
  *(_QWORD *)(v1 + 88) = v14;
  type metadata accessor for AppLaunchSource();
  v15 = OUTLINED_FUNCTION_57_0();
  *(_QWORD *)(v1 + 96) = v15;
  v16 = v15 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_source;
  v17 = *MEMORY[0x24BE91938];
  v18 = sub_2461322C8();
  *(_QWORD *)(v1 + 104) = v18;
  v19 = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v1 + 112) = v19;
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 104);
  *(_QWORD *)(v1 + 120) = v20;
  v20(v16, v17, v18);
  *(_QWORD *)(v15 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_histogram) = v14;
  OUTLINED_FUNCTION_173();
  v21 = sub_246132274();
  v23 = v22;
  v25 = v24;
  v26 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v13 + 112), *(_QWORD *)(v13 + 136));
  v27 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v1 + 128) = v27;
  *v27 = v1;
  v27[1] = sub_246118538;
  return OUTLINED_FUNCTION_13_2(v15, v12, v26, v21, v23, v25, *(_QWORD *)(v1 + 16), v28);
}

uint64_t sub_246118538()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 136) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_246();
  sub_246126CF4();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246118580()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  void *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_97();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[2] + 72), *(_QWORD *)(v0[2] + 96));
  OUTLINED_FUNCTION_138();
  if ((sub_24613222C() & 1) != 0)
  {
    type metadata accessor for AppIntentTranscriptSource();
    OUTLINED_FUNCTION_57_0();
    v0[18] = sub_246111EF8();
    sub_2461322B0();
    OUTLINED_FUNCTION_42_1();
    v1 = (_QWORD *)OUTLINED_FUNCTION_12_3();
    v0[19] = v1;
    v2 = OUTLINED_FUNCTION_14_2(v1, (uint64_t)sub_246118700);
    return OUTLINED_FUNCTION_13_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    v11 = (void *)v0[5];
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v12 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_35_1(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_113(&dword_246105000, v13, v14, "SiriAutoCompleteIndexBuilder: appIntentSources feature flag is not enabled. Not indexing phrases from the App Intent sources");
      OUTLINED_FUNCTION_0();
    }
    v15 = v0[4];
    v16 = v0[2];

    OUTLINED_FUNCTION_117(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    type metadata accessor for AppIntentTranscriptSource();
    OUTLINED_FUNCTION_57_0();
    v17 = sub_246111EF8();
    v0[26] = v17;
    sub_2461322B0();
    v0[27] = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v16 + 112), *(_QWORD *)(v16 + 136));
    v20 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25754AF28 + dword_25754AF28);
    OUTLINED_FUNCTION_135();
    OUTLINED_FUNCTION_54_0();
    v18 = (_QWORD *)swift_task_alloc();
    v0[28] = v18;
    v19 = OUTLINED_FUNCTION_191(v18, (uint64_t)sub_246118920);
    return v20(v19, v17);
  }
}

uint64_t sub_246118700()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 160) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_24611873C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t);
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);

  v1 = v0[20];
  v2 = v0[17];
  v3 = __OFADD__(v2, v1);
  v4 = v2 + v1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = v0[18];
    v6 = (void (*)(uint64_t, _QWORD, uint64_t))v0[15];
    v7 = v0[13];
    v8 = v0[11];
    v9 = v0[2];
    v0[21] = v4;
    v0[22] = *(_QWORD *)(v5 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram);
    type metadata accessor for AssistantIntentExamplePhrasesSource();
    v10 = OUTLINED_FUNCTION_57_0();
    v0[23] = v10;
    v6(v10 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_source, *MEMORY[0x24BE91930], v7);
    *(_QWORD *)(v10 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_histogram) = v8;
    OUTLINED_FUNCTION_54_0();
    OUTLINED_FUNCTION_165();
    v11 = sub_2461322BC();
    v13 = v12;
    v15 = v14;
    v16 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v9 + 112), *(_QWORD *)(v9 + 136));
    v17 = (_QWORD *)OUTLINED_FUNCTION_9_4();
    v0[24] = v17;
    OUTLINED_FUNCTION_226(v17, (uint64_t)sub_246118850);
    OUTLINED_FUNCTION_13_2(v10, v18, v16, v11, v13, v15, v19, v20);
  }
}

uint64_t sub_246118850()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 200) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_246();
  sub_24610DF60();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246118894()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);

  OUTLINED_FUNCTION_97();
  v1 = v0[25];
  v2 = v0[21];
  result = swift_release();
  if (__OFADD__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    v0[29] = v0[22];
    v0[30] = v2 + v1;
    OUTLINED_FUNCTION_196();
    OUTLINED_FUNCTION_57_0();
    v4 = OUTLINED_FUNCTION_135();
    v5 = sub_24612D938(v4);
    OUTLINED_FUNCTION_255(v5);
    OUTLINED_FUNCTION_42_1();
    v6 = (_QWORD *)OUTLINED_FUNCTION_12_3();
    v0[32] = v6;
    v7 = OUTLINED_FUNCTION_14_2(v6, (uint64_t)sub_2461189E8);
    return OUTLINED_FUNCTION_13_2(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return result;
}

uint64_t sub_246118920()
{
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611895C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);

  OUTLINED_FUNCTION_97();
  v1 = *(_QWORD *)(v0[26] + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram);
  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_72();
  v2 = v0[17];
  v0[29] = v1;
  v0[30] = v2;
  OUTLINED_FUNCTION_196();
  OUTLINED_FUNCTION_57_0();
  v3 = OUTLINED_FUNCTION_173();
  v4 = sub_24612D938(v3);
  OUTLINED_FUNCTION_255(v4);
  OUTLINED_FUNCTION_42_1();
  v5 = (_QWORD *)OUTLINED_FUNCTION_12_3();
  v0[32] = v5;
  v6 = OUTLINED_FUNCTION_14_2(v5, (uint64_t)sub_2461189E8);
  return OUTLINED_FUNCTION_13_2(v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_2461189E8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 264) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246118A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_97();
  v12 = v10[33];
  v13 = v10[30];
  v14 = __OFADD__(v13, v12);
  v15 = v13 + v12;
  if (v14)
  {
    __break(1u);
  }
  else
  {
    v16 = (void (*)(uint64_t, _QWORD, uint64_t))v10[15];
    v17 = v10[13];
    v18 = v10[2];
    v10[34] = v15;
    type metadata accessor for VoiceShortcutSource();
    v19 = OUTLINED_FUNCTION_57_0();
    v10[35] = v19;
    v16(v19 + OBJC_IVAR____TtC16SiriAutoComplete19VoiceShortcutSource_source, *MEMORY[0x24BE91908], v17);
    v20 = sub_246132298();
    OUTLINED_FUNCTION_42_1();
    v21 = (_QWORD *)OUTLINED_FUNCTION_12_3();
    v10[36] = v21;
    OUTLINED_FUNCTION_226(v21, (uint64_t)sub_246118AF0);
    OUTLINED_FUNCTION_13_2(v19, v22, v18 + 112, v20, (uint64_t)v16, v11, v23, a10);
  }
}

uint64_t sub_246118AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26_1();
  v1 = v0[35];
  v2 = v0[14];
  v0[37] = v3;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_246();
  OUTLINED_FUNCTION_51_0(v1 + OBJC_IVAR____TtC16SiriAutoComplete19VoiceShortcutSource_source, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_deallocClassInstance();
  OUTLINED_FUNCTION_8_3();
  return swift_task_switch();
}

uint64_t sub_246118B78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);

  OUTLINED_FUNCTION_97();
  v1 = v0[37];
  v2 = v0[34];
  v0[38] = v2 + v1;
  if (__OFADD__(v2, v1))
  {
    __break(1u);
    goto LABEL_5;
  }
  type metadata accessor for DefaultLocaleProvider();
  swift_initStaticObject();
  if (qword_25754A780 != -1)
LABEL_5:
    swift_once();
  type metadata accessor for DefaultAppFinderForIntentProvider();
  OUTLINED_FUNCTION_173();
  swift_initStaticObject();
  v3 = OUTLINED_FUNCTION_247();
  v0[39] = sub_2461234BC(v3, v4, v5);
  sub_2461322A4();
  OUTLINED_FUNCTION_42_1();
  v6 = (_QWORD *)OUTLINED_FUNCTION_12_3();
  v0[40] = v6;
  v7 = OUTLINED_FUNCTION_14_2(v6, (uint64_t)sub_246118C64);
  return OUTLINED_FUNCTION_13_2(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_246118C64()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 328) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246118CA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);

  OUTLINED_FUNCTION_97();
  v1 = v0[41];
  v2 = v0[38];
  v3 = __OFADD__(v2, v1);
  v4 = v2 + v1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v0[42] = v4;
    type metadata accessor for SiriKitIntentSource();
    OUTLINED_FUNCTION_57_0();
    v0[43] = sub_246106F7C();
    sub_24613228C();
    OUTLINED_FUNCTION_42_1();
    v5 = (_QWORD *)OUTLINED_FUNCTION_12_3();
    v0[44] = v5;
    v6 = OUTLINED_FUNCTION_14_2(v5, (uint64_t)sub_246118D30);
    OUTLINED_FUNCTION_13_2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

uint64_t sub_246118D30()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 360) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_145();
}

uint64_t sub_246118D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 336);
  swift_release();
  result = OUTLINED_FUNCTION_48_0();
  v4 = __OFADD__(v2, v1);
  v5 = v2 + v1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    sub_246132268();
    OUTLINED_FUNCTION_253();
    swift_task_dealloc();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_71();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
  }
  return result;
}

void sub_246118E20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  _QWORD *v13;
  unint64_t isUniquelyReferenced_nonNull_native;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _BOOL8 v31;
  char v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  _QWORD v49[2];
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;

  v1 = OUTLINED_FUNCTION_51();
  v53 = *(_QWORD *)(v1 - 8);
  v54 = v1;
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_41();
  v4 = v3 - v2;
  v5 = OUTLINED_FUNCTION_45_1();
  v57 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v60 = (uint64_t)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v52 = (_QWORD *)((char *)v49 - v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41();
  v12 = v11 - v10;
  v13 = (_QWORD *)sub_24613246C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_138();
  isUniquelyReferenced_nonNull_native = sub_246132250();
  if (isUniquelyReferenced_nonNull_native >> 62)
  {
LABEL_30:
    OUTLINED_FUNCTION_15_1();
    v16 = OUTLINED_FUNCTION_90();
    OUTLINED_FUNCTION_2_1();
    if (v16)
      goto LABEL_3;
LABEL_26:
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_28();
    return;
  }
  v16 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v16)
    goto LABEL_26;
LABEL_3:
  v59 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
  v17 = 4;
  *(_QWORD *)&v15 = 136315138;
  v50 = v15;
  v49[1] = MEMORY[0x24BEE4AD8] + 8;
  v55 = v5;
  v56 = isUniquelyReferenced_nonNull_native;
  v51 = v12;
  v58 = v16;
  while (1)
  {
    if (v59)
      MEMORY[0x249550420](v17 - 4, isUniquelyReferenced_nonNull_native);
    else
      OUTLINED_FUNCTION_54_0();
    if (__OFADD__(v17 - 4, 1))
    {
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v61 = v17 - 3;
    v18 = OUTLINED_FUNCTION_161();
    if (v13[2] && (v20 = sub_24612ACE4(v18, v19), (v21 & 1) != 0))
    {
      sub_24612384C(v13[7] + *(_QWORD *)(v57 + 72) * v20, v12);
      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    __swift_storeEnumTagSinglePayload(v12, v22, 1, v5);
    OUTLINED_FUNCTION_17_0();
    v23 = OUTLINED_FUNCTION_180(v12);
    sub_2461239E0(v12, &qword_25754AF78);
    if (v23 != 1)
    {
      sub_2461323D0();
      OUTLINED_FUNCTION_157();
      v38 = sub_2461323DC();
      v39 = sub_2461325D4();
      if (OUTLINED_FUNCTION_139(v38))
      {
        v40 = OUTLINED_FUNCTION_2();
        v62 = (_QWORD *)OUTLINED_FUNCTION_2();
        *(_DWORD *)v40 = v50;
        v41 = OUTLINED_FUNCTION_161();
        *(_QWORD *)(v40 + 4) = sub_246119920(v41, v42, (uint64_t *)&v62);
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_72();
        OUTLINED_FUNCTION_22(&dword_246105000, v38, v39, "Duplicates in index, phrase: %s", (uint8_t *)v40);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }
      swift_release_n();

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v4, v54);
      goto LABEL_25;
    }
    v12 = v4;
    v4 = OUTLINED_FUNCTION_161();
    v25 = v24;
    v26 = sub_246132358();
    v27 = v52;
    sub_246132310();
    *v27 = v26;
    sub_246123A60((uint64_t)v27, v60);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v62 = v13;
    v28 = sub_24612ACE4(v4, v25);
    v30 = v13[2];
    v31 = (v29 & 1) == 0;
    v13 = (_QWORD *)(v30 + v31);
    if (__OFADD__(v30, v31))
      goto LABEL_28;
    v5 = v28;
    v32 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B010);
    v33 = sub_2461326F4();
    isUniquelyReferenced_nonNull_native = v56;
    if ((v33 & 1) != 0)
      break;
LABEL_17:
    v13 = v62;
    if ((v32 & 1) != 0)
    {
      v36 = OUTLINED_FUNCTION_211();
      sub_246123AA4(v36, v37);
    }
    else
    {
      v62[(v5 >> 6) + 8] |= 1 << v5;
      v43 = (uint64_t *)(v13[6] + 16 * v5);
      *v43 = v4;
      v43[1] = v25;
      v44 = OUTLINED_FUNCTION_211();
      sub_246123A60(v44, v45);
      v46 = v13[2];
      v47 = __OFADD__(v46, 1);
      v48 = v46 + 1;
      if (v47)
        goto LABEL_29;
      v13[2] = v48;
      OUTLINED_FUNCTION_40();
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_55_0();
    v4 = v12;
    v5 = v55;
    v12 = v51;
LABEL_25:
    ++v17;
    if (v61 == v58)
      goto LABEL_26;
  }
  v34 = sub_24612ACE4(v4, v25);
  if ((v32 & 1) == (v35 & 1))
  {
    v5 = v34;
    goto LABEL_17;
  }
  sub_2461327FC();
  __break(1u);
}

uint64_t SiriAutoCompleteIndexBuilder.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  return v0;
}

uint64_t SiriAutoCompleteIndexBuilder.__deallocating_deinit()
{
  SiriAutoCompleteIndexBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_246119318(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_2461193B0(a1, a2, a3, &qword_25754AFE8, 0x24BEC1310, sub_246124184);
}

uint64_t sub_246119334(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFF0);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_246119384(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_246119394(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_2461193B0(a1, a2, a3, (unint64_t *)&qword_25441C570, 0x24BE5FFE0, sub_246119384);
}

uint64_t sub_2461193B0(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v8;

  v6 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_246119334(v6, (uint64_t)a3);
  sub_24610A844(0, a4);
  v8 = sub_24613252C();
  return a6(v6, v8);
}

void sub_246119428(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_246119438(unint64_t a1)
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
    v3 = sub_246132724();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_246132724();
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
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24955042C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_24611A6A8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_246132724();
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
    return sub_246132544();
  }
  __break(1u);
  return result;
}

uint64_t sub_2461195EC(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
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
    OUTLINED_FUNCTION_49();
    v2 = OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_47();
  }
  else
  {
    OUTLINED_FUNCTION_242();
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    OUTLINED_FUNCTION_56();
    v5 = sub_246132724();
    OUTLINED_FUNCTION_55();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v2;
  if (__OFADD__(v5, v2))
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
    OUTLINED_FUNCTION_56();
    v4 = MEMORY[0x24955042C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_24611A838(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v2)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_56();
    v9 = OUTLINED_FUNCTION_214();
    OUTLINED_FUNCTION_55();
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
    return sub_246132544();
  }
  __break(1u);
  return result;
}

void sub_246119778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);

  v6 = v5;
  v12 = OUTLINED_FUNCTION_94();
  v13 = 0;
  if (OUTLINED_FUNCTION_180(a1) != 1)
  {
    v13 = (void *)sub_24613201C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  if (OUTLINED_FUNCTION_180(a2) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_24613201C();
    v15 = OUTLINED_FUNCTION_219();
    v16(v15, v12);
  }
  objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  OUTLINED_FUNCTION_177();
}

uint64_t sub_246119850(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_246119860(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_246119894(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2461198B4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_246119920(v6, v7, a3);
  v8 = *a1 + 8;
  sub_246132610();
  result = OUTLINED_FUNCTION_46();
  *a1 = v8;
  return result;
}

uint64_t sub_246119920(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_8_3();
  v9 = sub_2461199E8(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_246123B04((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_246123B04((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    OUTLINED_FUNCTION_11_3();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  return v10;
}

uint64_t sub_2461199E8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_246119B3C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24613261C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_246119C00(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2461326AC();
    if (!v8)
    {
      result = sub_246132718();
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

void *sub_246119B3C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246132748();
  __break(1u);
  return result;
}

uint64_t sub_246119C00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246119C94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246119E68(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246119E68((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246119C94(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2461324B4();
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
  v3 = sub_246119E04(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_24613267C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_246132748();
  __break(1u);
LABEL_14:
  result = sub_246132718();
  __break(1u);
  return result;
}

_QWORD *sub_246119E04(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246119E68(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B018);
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
    sub_24611A000(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246119F3C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_246119F3C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246132748();
  __break(1u);
  return result;
}

char *sub_24611A000(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_246132748();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_24611A080(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

_QWORD *sub_24611A090(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFB0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_24611A9C8(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24610A83C();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_24611A170(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF90);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 32);
    }
    if (v4 != a3)
    {
      sub_2461303D4(a2 + 32 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

_QWORD *sub_24611A22C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF88);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  v5 = sub_24611ABE4((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24610A83C();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_24611A310(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C5B8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_24611ADDC((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24610A83C();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_24611A3F0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF88);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = (2 * ((uint64_t)(v9 - 32) / 8)) | 1;
    }
    if (v4 != a3)
    {
      sub_24613048C(a2 + 8 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

void sub_24611A4B0(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  sub_24611A580(v6, a2, a3);
  v6[4] = v7;
  OUTLINED_FUNCTION_229();
}

uint64_t (*sub_24611A500(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_24611A5E8(v6, a2, a3);
  return sub_24611A4FC;
}

void sub_24611A554(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_24611A580(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  sub_246113738(a2, (a3 & 0xC000000000000001) == 0);
  if (v6)
    v7 = MEMORY[0x249550420](a2, a3);
  else
    v7 = swift_retain();
  *a1 = v7;
  OUTLINED_FUNCTION_229();
}

void (*sub_24611A5E8(_QWORD *a1, uint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_246113738(a2, (a3 & 0xC000000000000001) == 0);
  if (v6)
    v7 = (id)MEMORY[0x249550420](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_24611A654;
}

void sub_24611A654(id *a1)
{

}

uint64_t sub_24611A65C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t sub_24611A6A8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_246132724();
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
      v8 = sub_246132724();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_246123B40(&qword_25754B040, &qword_25441C560);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_25441C560);
            v10 = sub_24611A500(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
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
        sub_246130480((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

uint64_t sub_24611A838(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(uint64_t **, _QWORD);
  void (*v11)(uint64_t **, _QWORD);
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_246132724();
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
      v8 = sub_246132724();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_246123B40(&qword_25754B028, &qword_25754B020);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_25754B020);
            sub_24611A4B0(v14, i, a3);
            v11 = v10;
            v13 = *v12;
            swift_retain();
            v11(v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
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
        sub_24613048C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

_QWORD *sub_24611A9C8(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v22 = -1 << *(_BYTE *)(a4 + 32);
  v23 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (_QWORD *)(*(_QWORD *)(a4 + 56) + 24 * v15);
    v20 = v19[1];
    v21 = v19[2];
    *v10 = *v19;
    v10[1] = v20;
    v10[2] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_38;
    }
    v10 += 3;
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_retain();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v22;
      result = v23;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24611ABE4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_retain();
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

uint64_t sub_24611ADDC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_24611AFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;

  v3[22] = a1;
  v6 = sub_2461323E8();
  v3[23] = v6;
  v3[24] = *(_QWORD *)(v6 - 8);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFA8);
  v3[28] = swift_task_alloc();
  v3[5] = type metadata accessor for DefaultEligibilityCriteria();
  v3[6] = &off_25173BBC8;
  v3[2] = a2;
  v3[10] = type metadata accessor for DefaultAppFinderForIntentProvider();
  v3[11] = &off_25173BE30;
  v3[7] = a3;
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611B0C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  char v38;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + 16);
  *(_QWORD *)(v0 + 232) = v1;
  if (!v1)
  {
LABEL_15:
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    OUTLINED_FUNCTION_216();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_71();
    return OUTLINED_FUNCTION_104(*(uint64_t (**)(void))(v0 + 8));
  }
  v43 = (_QWORD *)(v0 + 56);
  v49 = v0 + 112;
  swift_bridgeObjectRetain();
  v2 = 0;
  *(_QWORD *)&v3 = 136315394;
  v45 = v3;
  v44 = MEMORY[0x24BEE4AD8] + 8;
  v4 = (_QWORD *)(v0 + 16);
  while (1)
  {
    *(_QWORD *)(v0 + 240) = v2;
    v5 = (_QWORD *)(*(_QWORD *)(v0 + 176) + 24 * v2);
    *(_QWORD *)(v0 + 248) = v5[4];
    v6 = v5[5];
    *(_QWORD *)(v0 + 256) = v6;
    v7 = v5[6];
    *(_QWORD *)(v0 + 264) = v7;
    OUTLINED_FUNCTION_85(v4, *(_QWORD *)(v0 + 40));
    v9 = *(_QWORD *)(v8 + 16);
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_157();
    v10 = sub_24613234C();
    if (*(_QWORD *)(v9 + 16))
    {
      v12 = OUTLINED_FUNCTION_222(v10, v11);
      if ((v13 & 1) != 0)
        break;
    }
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_17_0();
LABEL_12:
    OUTLINED_FUNCTION_133();
    if (v38)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  v14 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 24 * v12);
  v15 = *v14;
  *(_QWORD *)(v0 + 272) = *v14;
  *(_QWORD *)(v0 + 280) = v14[1];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_17_0();
  if (!v7)
  {
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_13_0();
    goto LABEL_12;
  }
  v16 = *(_QWORD *)(v0 + 224);
  OUTLINED_FUNCTION_119();
  v17 = OUTLINED_FUNCTION_161();
  v19 = OUTLINED_FUNCTION_205(v17, v18);
  v20 = OUTLINED_FUNCTION_206(v19);
  OUTLINED_FUNCTION_156(v20, v21, v22, v23, v24, v25, v26, v27, v41, v42, (uint64_t)v43, v44, v45, *((uint64_t *)&v45 + 1), v46, v47, v48, v49);
  sub_246132640();
  v29 = v28;
  sub_2461239E0(v16, &qword_25754AFA8);
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0)
  {
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_157();
    OUTLINED_FUNCTION_11();
    v30 = sub_2461323DC();
    v31 = sub_2461325BC();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = OUTLINED_FUNCTION_2();
      v50 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v32 = v45;
      OUTLINED_FUNCTION_11();
      *(_QWORD *)(v32 + 4) = OUTLINED_FUNCTION_187(v15, v33, &v50);
      OUTLINED_FUNCTION_89();
      *(_WORD *)(v32 + 12) = 2080;
      v34 = OUTLINED_FUNCTION_161();
      *(_QWORD *)(v32 + 14) = OUTLINED_FUNCTION_243(v34, v35);
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_152(&dword_246105000, v30, v31, "SiriKitIntentSource: %s already in \"%s\", not adding app mention suffix", (uint8_t *)v32);
      OUTLINED_FUNCTION_240();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_239();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_44_1();

    v36 = OUTLINED_FUNCTION_247();
    v37(v36);
    v4 = (_QWORD *)(v0 + 16);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_108(v43, *(_QWORD *)(v0 + 80));
  v40 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v40;
  *v40 = v0;
  v40[1] = sub_24611B3F8;
  return OUTLINED_FUNCTION_105(v6, v7);
}

uint64_t sub_24611B3F8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  *(_QWORD *)(v1 + 296) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611B43C()
{
  uint64_t v0;
  os_log_type_t v1;
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  os_log_type_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  _QWORD *v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
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
  char v53;
  char v54;
  NSObject *v55;
  os_log_type_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v2 = *(_QWORD *)(v0 + 296);
  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_24_0();
    v3 = OUTLINED_FUNCTION_90();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v73 = (_QWORD *)(v0 + 56);
  v4 = *(NSObject **)(v0 + 296);
  if (v3 <= 1)
  {
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_189();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_210();
    v16 = OUTLINED_FUNCTION_62();
    v17 = OUTLINED_FUNCTION_199(v16);
    v18 = *(_QWORD *)(v0 + 264);
    if (v17)
    {
      v19 = *(_QWORD *)(v0 + 256);
      v20 = OUTLINED_FUNCTION_2();
      v77 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v20 = 134218242;
      OUTLINED_FUNCTION_10_0();
      *(_QWORD *)(v20 + 4) = v3;
      OUTLINED_FUNCTION_10_0();
      *(_WORD *)(v20 + 12) = 2080;
      OUTLINED_FUNCTION_49();
      *(_QWORD *)(v20 + 14) = sub_246119920(v19, v18, &v77);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_152(&dword_246105000, v4, v1, "SiriKitIntentSource: %ld app detected for %s, not adding app mention suffix", (uint8_t *)v20);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }
    v25 = *(_QWORD *)(v0 + 192);
    v24 = *(_QWORD *)(v0 + 200);
    v26 = *(_QWORD *)(v0 + 184);
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_72();

    OUTLINED_FUNCTION_89();
    v23 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v21 = v24;
    v22 = v26;
  }
  else
  {
    OUTLINED_FUNCTION_46();
    v5 = sub_246132334();
    v7 = v6;
    *(_QWORD *)(v0 + 128) = 0x20676E69737520;
    *(_QWORD *)(v0 + 136) = 0xE700000000000000;
    sub_2461324A8();
    OUTLINED_FUNCTION_2_1();
    *(_QWORD *)(v0 + 144) = v5;
    *(_QWORD *)(v0 + 152) = v7;
    OUTLINED_FUNCTION_11_3();
    sub_2461324A8();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_17_0();
    sub_2461322E0();
    OUTLINED_FUNCTION_168();
    OUTLINED_FUNCTION_157();
    swift_bridgeObjectRetain();
    v8 = OUTLINED_FUNCTION_160();
    v9 = sub_2461325BC();
    if (OUTLINED_FUNCTION_225(v8))
    {
      v10 = OUTLINED_FUNCTION_2();
      v77 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v10 = 136315394;
      OUTLINED_FUNCTION_40();
      v11 = OUTLINED_FUNCTION_151();
      *(_QWORD *)(v0 + 160) = sub_246119920(v11, v12, v13);
      sub_246132610();
      OUTLINED_FUNCTION_89();
      *(_WORD *)(v10 + 12) = 2080;
      v14 = sub_2461322D4();
      *(_QWORD *)(v0 + 168) = OUTLINED_FUNCTION_243(v14, v15);
      sub_246132610();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_152(&dword_246105000, v8, v9, "SiriKitIntentSource: More than one apps detected for %s, constructed invocation phrase of \"%s\"", (uint8_t *)v10);
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_239();

    OUTLINED_FUNCTION_89();
    v21 = OUTLINED_FUNCTION_247();
  }
  v23(v21, v22);
  OUTLINED_FUNCTION_133();
  v29 = (_QWORD *)(v0 + 16);
  if (v30)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_216();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_71();
    return OUTLINED_FUNCTION_104(*(uint64_t (**)(void))(v0 + 8));
  }
  v76 = v0 + 112;
  *(_QWORD *)&v28 = 136315394;
  v72 = v28;
  v71 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    *(_QWORD *)(v0 + 240) = v27;
    v31 = (_QWORD *)(*(_QWORD *)(v0 + 176) + 24 * v27);
    *(_QWORD *)(v0 + 248) = v31[4];
    *(_QWORD *)(v0 + 256) = v31[5];
    v32 = v31[6];
    *(_QWORD *)(v0 + 264) = v32;
    OUTLINED_FUNCTION_85(v29, *(_QWORD *)(v0 + 40));
    v34 = *(_QWORD *)(v33 + 16);
    OUTLINED_FUNCTION_251();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_157();
    v35 = sub_24613234C();
    if (*(_QWORD *)(v34 + 16))
    {
      v37 = sub_24612ACE4(v35, v36);
      if ((v38 & 1) != 0)
        break;
    }
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_10_0();
LABEL_21:
    OUTLINED_FUNCTION_133();
    if (v30)
      goto LABEL_23;
  }
  v39 = (uint64_t *)(*(_QWORD *)(v34 + 56) + 24 * v37);
  v40 = *v39;
  *(_QWORD *)(v0 + 272) = *v39;
  *(_QWORD *)(v0 + 280) = v39[1];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_10_0();
  if (!v32)
  {
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_13_0();
    goto LABEL_21;
  }
  v41 = *(_QWORD *)(v0 + 224);
  OUTLINED_FUNCTION_251();
  v42 = OUTLINED_FUNCTION_198();
  v44 = OUTLINED_FUNCTION_205(v42, v43);
  v45 = OUTLINED_FUNCTION_206(v44);
  OUTLINED_FUNCTION_156(v45, v46, v47, v48, v49, v50, v51, v52, v68, v69, v70, v71, v72, *((uint64_t *)&v72 + 1), (uint64_t)v73, v74, v75, v76);
  sub_246132640();
  v54 = v53;
  sub_2461239E0(v41, &qword_25754AFA8);
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_157();
    OUTLINED_FUNCTION_11();
    v55 = sub_2461323DC();
    v56 = sub_2461325BC();
    v57 = OUTLINED_FUNCTION_139(v55);
    v58 = *(_QWORD *)(v0 + 216);
    v59 = *(_QWORD *)(v0 + 184);
    v60 = *(_QWORD *)(v0 + 192);
    if (v57)
    {
      v61 = OUTLINED_FUNCTION_2();
      v77 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v61 = v72;
      OUTLINED_FUNCTION_11();
      *(_QWORD *)(v61 + 4) = OUTLINED_FUNCTION_187(v40, v62, &v77);
      OUTLINED_FUNCTION_89();
      *(_WORD *)(v61 + 12) = 2080;
      v63 = OUTLINED_FUNCTION_198();
      *(_QWORD *)(v61 + 14) = OUTLINED_FUNCTION_243(v63, v64);
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_152(&dword_246105000, v55, v56, "SiriKitIntentSource: %s already in \"%s\", not adding app mention suffix", (uint8_t *)v61);
      OUTLINED_FUNCTION_240();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_239();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_44_1();

    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
    v29 = (_QWORD *)(v0 + 16);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_108(v73, *(_QWORD *)(v0 + 80));
  v66 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v66;
  v67 = OUTLINED_FUNCTION_191(v66, (uint64_t)sub_24611B3F8);
  return OUTLINED_FUNCTION_105(v67, v32);
}

uint64_t sub_24611BAD4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;

  v2[31] = a2;
  v4 = sub_2461323E8();
  v2[32] = v4;
  v2[33] = *(_QWORD *)(v4 - 8);
  v2[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[22] = type metadata accessor for DefaultEligibilityCriteria();
  v2[23] = &off_25173BBC8;
  v2[19] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611BB8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t inited;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  NSObject *v25;
  uint64_t (*v26)(void);

  v2 = v0[35];
  v1 = v0[36];
  v24 = v0[31];
  v25 = v0[34];
  v3 = OUTLINED_FUNCTION_125();
  v0[37] = v3;
  *(_QWORD *)(v3 + 16) = sub_24613246C();
  v4 = objc_msgSend((id)BiomeLibrary(), sel_App);
  OUTLINED_FUNCTION_207();
  v5 = objc_msgSend(v4, sel_Intent);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_209(v1);
  OUTLINED_FUNCTION_209(v2);
  v6 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  sub_246119778(v1, v2, 1000, 1000, 0);
  v8 = v7;
  v9 = objc_msgSend(v5, sel_publisherWithOptions_, v7);

  v0[12] = sub_24610700C;
  v0[13] = 0;
  v10 = MEMORY[0x24BDAC760];
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_2461175AC;
  v0[11] = &block_descriptor_0;
  v11 = _Block_copy(v0 + 8);
  v26 = (uint64_t (*)(void))(v0 + 19);
  sub_2461238D0((uint64_t)(v0 + 19), (uint64_t)(v0 + 14));
  v12 = OUTLINED_FUNCTION_125();
  *(_QWORD *)(v12 + 16) = v24;
  sub_24611751C((__int128 *)v0 + 7, v12 + 24);
  *(_QWORD *)(v12 + 64) = v3;
  v0[2] = v10;
  v0[6] = sub_246123914;
  v0[7] = v12;
  v0[3] = 1107296256;
  v0[4] = sub_2461175AC;
  v0[5] = &block_descriptor_29;
  v13 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_74();
  v14 = objc_msgSend(v9, sel_sinkWithCompletion_receiveInput_, v11, v13);
  _Block_release(v13);
  _Block_release(v11);

  OUTLINED_FUNCTION_25_0();
  swift_retain();
  sub_2461323DC();
  v15 = OUTLINED_FUNCTION_62();
  if (OUTLINED_FUNCTION_35_1(v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v16 = 134217984;
    OUTLINED_FUNCTION_23_2();
    v0[30] = *(_QWORD *)(*(_QWORD *)(v3 + 16) + 16);
    OUTLINED_FUNCTION_201();
    OUTLINED_FUNCTION_215();
    OUTLINED_FUNCTION_22(&dword_246105000, v25, (os_log_type_t)v13, "%ld phrase(s) created from the SiriKit Intents Biome stream", v16);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_215();

  (*(void (**)(_QWORD, _QWORD))(v0[33] + 8))(v0[34], v0[32]);
  OUTLINED_FUNCTION_23_2();
  v17 = OUTLINED_FUNCTION_37();
  v0[38] = sub_24611A090(v17);
  OUTLINED_FUNCTION_46();
  type metadata accessor for DefaultAppFinderForIntentProvider();
  inited = swift_initStaticObject();
  __swift_project_boxed_opaque_existential_1(v26, v0[22]);
  v19 = (_QWORD *)OUTLINED_FUNCTION_176();
  v0[39] = v19;
  *v19 = v0;
  v19[1] = sub_24611BF38;
  v20 = OUTLINED_FUNCTION_138();
  return OUTLINED_FUNCTION_140(v20, v21, inited, v22, v26);
}

uint64_t sub_24611BF38()
{
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611BF6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v6 = MEMORY[0x24BEE4AF8];
    sub_2461326D0();
    v3 = v1 + 32;
    do
    {
      v3 += 24;
      OUTLINED_FUNCTION_173();
      sub_2461326B8();
      sub_2461326DC();
      sub_2461326E8();
      sub_2461326C4();
      --v2;
    }
    while (v2);
    v4 = v6;
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_236();
    v4 = MEMORY[0x24BEE4AF8];
  }
  sub_246108968(v4);
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_164();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_146();
  return OUTLINED_FUNCTION_92(v4, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24611C05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, _QWORD, uint64_t);
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  void (*v50)(char *, _QWORD, uint64_t);
  unsigned int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;

  v59 = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  MEMORY[0x24BDAC7A8](v10);
  v56 = (uint64_t)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  MEMORY[0x24BDAC7A8](v12);
  v55 = (uint64_t)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_2461322C8();
  v14 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v53 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8);
  v57 = a1;
  v58 = a2;
  v17 = v16(a1, a2, a4, a5);
  v18 = sub_24611768C(500, v17);
  sub_2461175BC(v18, v19, v20, v21, (void (*)(uint64_t))sub_24611A170);
  v23 = v22;
  v24 = *(_QWORD *)(v22 + 16);
  if (!v24)
    return swift_bridgeObjectRelease();
  v52 = sub_246132370();
  v51 = *MEMORY[0x24BE91930];
  v25 = *(void (**)(char *, _QWORD, uint64_t))(v14 + 104);
  v49 = v23;
  v50 = v25;
  for (i = v23 + 56; ; i += 32)
  {
    v28 = *(_QWORD *)(i - 24);
    v27 = *(_QWORD *)(i - 16);
    v50(v53, v51, v54);
    v29 = sub_2461321D8();
    __swift_storeEnumTagSinglePayload(v55, 1, 1, v29);
    v30 = sub_246132034();
    __swift_storeEnumTagSinglePayload(v56, 1, 1, v30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v31 = sub_246132328();
    if (*(_QWORD *)(*v59 + 16))
    {
      swift_bridgeObjectRetain();
      sub_24612ACE4(v28, v27);
      v33 = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v33 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_16;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_retain();
    v34 = v59;
    swift_isUniquelyReferenced_nonNull_native();
    v60 = (_QWORD *)*v34;
    v35 = v60;
    *v34 = 0x8000000000000000;
    v36 = sub_24612ACE4(v28, v27);
    if (__OFADD__(v35[2], (v37 & 1) == 0))
      break;
    v38 = v36;
    v39 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754ACE0);
    if ((sub_2461326F4() & 1) != 0)
    {
      v40 = sub_24612ACE4(v28, v27);
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_21;
      v38 = v40;
    }
    v42 = v60;
    if ((v39 & 1) != 0)
    {
      v43 = v60[7];
      swift_release();
      *(_QWORD *)(v43 + 8 * v38) = v31;
    }
    else
    {
      v60[(v38 >> 6) + 8] |= 1 << v38;
      v44 = (uint64_t *)(v42[6] + 16 * v38);
      *v44 = v28;
      v44[1] = v27;
      *(_QWORD *)(v42[7] + 8 * v38) = v31;
      v45 = v42[2];
      v46 = __OFADD__(v45, 1);
      v47 = v45 + 1;
      if (v46)
        goto LABEL_20;
      v42[2] = v47;
      swift_bridgeObjectRetain();
    }
    *v59 = v42;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_16:
    if (!--v24)
      return swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_2461327FC();
  __break(1u);
  return result;
}

uint64_t sub_24611C45C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2[15] = a2;
  v4 = sub_2461323E8();
  v2[16] = v4;
  v2[17] = *(_QWORD *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v5 = type metadata accessor for DefaultEligibilityCriteria();
  v2[19] = v5;
  v2[5] = v5;
  v2[6] = &off_25173BBC8;
  v2[2] = a1;
  swift_retain();
  return swift_task_switch();
}

void sub_24611C4E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t (*v31)(void);
  uint64_t v32;
  _QWORD *v33;

  OUTLINED_FUNCTION_184();
  v1 = v0[19];
  OUTLINED_FUNCTION_137();
  v0[13] = sub_24613246C();
  v33 = v0 + 2;
  v2 = *(_QWORD *)(*__swift_project_boxed_opaque_existential_1(v0 + 2, v1) + 64);
  v32 = v2 + 56;
  OUTLINED_FUNCTION_175();
  v5 = v4 & v3;
  v7 = (unint64_t)(63 - v6) >> 6;
  OUTLINED_FUNCTION_37();
  v8 = 0;
  if (!v5)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (i = v9 | (v8 << 6); ; i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v20 = *v19;
    v21 = v19[1];
    v22 = *__swift_project_boxed_opaque_existential_1(v33, v0[5]);
    OUTLINED_FUNCTION_17_2();
    sub_24611C05C(v20, v21, v22, (uint64_t)&type metadata for DefaultExamplePhrasesProvider, (uint64_t)&off_25173BB48, v0 + 13);
    OUTLINED_FUNCTION_4_1();
    if (v5)
      goto LABEL_2;
LABEL_3:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v11 >= v7)
      goto LABEL_23;
    v12 = *(_QWORD *)(v32 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        goto LABEL_23;
      OUTLINED_FUNCTION_195();
      if (!v12)
      {
        v8 = v13 + 2;
        if (v13 + 2 >= v7)
          goto LABEL_23;
        OUTLINED_FUNCTION_195();
        if (!v12)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            goto LABEL_23;
          OUTLINED_FUNCTION_195();
          if (!v12)
          {
            v8 = v15 + 4;
            if (v15 + 4 >= v7)
              goto LABEL_23;
            OUTLINED_FUNCTION_195();
            if (!v12)
              break;
          }
        }
      }
    }
LABEL_20:
    v5 = (v12 - 1) & v12;
  }
  v17 = v16 + 5;
  if (v17 < v7)
  {
    v12 = *(_QWORD *)(v32 + 8 * v17);
    if (!v12)
    {
      while (1)
      {
        v8 = v17 + 1;
        if (__OFADD__(v17, 1))
          goto LABEL_27;
        if (v8 >= v7)
          goto LABEL_23;
        OUTLINED_FUNCTION_195();
        v17 = v18 + 1;
        if (v12)
          goto LABEL_20;
      }
    }
    v8 = v17;
    goto LABEL_20;
  }
LABEL_23:
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_230();
  v23 = OUTLINED_FUNCTION_221();
  v24 = sub_2461325BC();
  if (OUTLINED_FUNCTION_225(v23))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v25 = 134217984;
    OUTLINED_FUNCTION_23_2();
    v0[14] = *(_QWORD *)(v0[13] + 16);
    sub_246132610();
    OUTLINED_FUNCTION_22(&dword_246105000, v23, v24, "%ld phrase(s) created from Assistant Intent example phrases", v25);
    OUTLINED_FUNCTION_0();
  }
  v26 = v0[17];
  v27 = v0[18];

  OUTLINED_FUNCTION_185(v27, *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  OUTLINED_FUNCTION_23_2();
  v28 = OUTLINED_FUNCTION_11_3();
  v29 = sub_24611A22C(v28);
  OUTLINED_FUNCTION_17_0();
  sub_24610DE44((unint64_t)v29);
  OUTLINED_FUNCTION_17_0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  OUTLINED_FUNCTION_164();
  v30 = OUTLINED_FUNCTION_233();
  OUTLINED_FUNCTION_53_1(v30, v31);
}

uint64_t sub_24611C7C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;

  v2[37] = a2;
  v4 = sub_2461323E8();
  v2[38] = v4;
  v2[39] = *(_QWORD *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[17] = type metadata accessor for DefaultEligibilityCriteria();
  v2[18] = &off_25173BBC8;
  v2[14] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611C888()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v1 = OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_137();
  *(_QWORD *)(v1 + 16) = sub_24613246C();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE601F8]), sel_init);
  v3 = (void *)sub_246132478();
  sub_24610A844(0, &qword_25754B000);
  v4 = (void *)sub_2461325F8();
  *(_QWORD *)(v0 + 272) = 0;
  v5 = objc_msgSend(v2, sel_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error_, v3, 0, 0, v4, 1, v0 + 272);

  v6 = *(void **)(v0 + 272);
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 296);
    *(_QWORD *)(v0 + 96) = sub_246111F84;
    *(_QWORD *)(v0 + 104) = 0;
    v8 = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 64) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 72) = 1107296256;
    *(_QWORD *)(v0 + 80) = sub_2461175AC;
    *(_QWORD *)(v0 + 88) = &block_descriptor_51;
    v9 = _Block_copy((const void *)(v0 + 64));
    v10 = OUTLINED_FUNCTION_204();
    sub_2461238D0(v10, v11);
    v12 = OUTLINED_FUNCTION_125();
    *(_QWORD *)(v12 + 16) = v7;
    sub_24611751C((__int128 *)(v0 + 152), v12 + 24);
    *(_QWORD *)(v12 + 64) = v1;
    *(_QWORD *)(v0 + 16) = v8;
    *(_QWORD *)(v0 + 48) = sub_246123A50;
    *(_QWORD *)(v0 + 56) = v12;
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_2461175AC;
    *(_QWORD *)(v0 + 40) = &block_descriptor_57;
    v13 = _Block_copy((const void *)(v0 + 16));
    v14 = v6;
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_165();
    OUTLINED_FUNCTION_109();

    _Block_release(v13);
    _Block_release(v9);

  }
  else
  {
    v9 = v6;
    v15 = (void *)sub_246131FC8();

    swift_willThrow();
    OUTLINED_FUNCTION_25_0();
    v16 = v15;
    v17 = v15;
    v18 = sub_2461323DC();
    LOBYTE(v9) = sub_2461325D4();
    v19 = os_log_type_enabled(v18, (os_log_type_t)v9);
    v20 = *(_QWORD *)(v0 + 328);
    v21 = *(_QWORD *)(v0 + 304);
    v22 = *(_QWORD *)(v0 + 312);
    if (v19)
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_2();
      v34[0] = OUTLINED_FUNCTION_2();
      *(_DWORD *)v23 = 136315138;
      swift_getErrorValue();
      v24 = sub_246132808();
      *(_QWORD *)(v0 + 264) = sub_246119920(v24, v25, v34);
      sub_246132610();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_22(&dword_246105000, v18, (os_log_type_t)v9, "Unexpected error while attempting to read the App Intent Transcript: %s", v23);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_155();

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  }
  v26 = *(NSObject **)(v0 + 320);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_165();
  sub_2461323DC();
  v27 = OUTLINED_FUNCTION_62();
  if (OUTLINED_FUNCTION_35_1(v27))
  {
    v28 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v28 = 134217984;
    OUTLINED_FUNCTION_23_2();
    *(_QWORD *)(v0 + 280) = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
    sub_246132610();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_22(&dword_246105000, v26, (os_log_type_t)v9, "%ld phrase(s) created from the App Intent transcript", v28);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_74();

  v29 = OUTLINED_FUNCTION_219();
  v30(v29);
  OUTLINED_FUNCTION_23_2();
  v31 = OUTLINED_FUNCTION_15_1();
  v32 = sub_24611A22C(v31);
  OUTLINED_FUNCTION_2_1();
  sub_246113328((unint64_t)v32);
  OUTLINED_FUNCTION_74();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_129();
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v32);
}

uint64_t sub_24611CD84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v18[5];

  v4 = sub_2461321F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DefaultInstalledAppProvider();
  v18[3] = v8;
  v18[4] = &off_25173BDF8;
  v18[0] = a1;
  type metadata accessor for DefaultEligibilityCriteria();
  v9 = swift_allocObject();
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (_QWORD *)((char *)&v18[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  v14 = *v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v15 = sub_24611CEE4(v14, (uint64_t)v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  return v15;
}

uint64_t type metadata accessor for SiriAutoCompleteIndexBuilder()
{
  return objc_opt_self();
}

uint64_t sub_24611CEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _UNKNOWN **v17;

  v6 = sub_2461321F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v9, a2, v6);
  v16 = type metadata accessor for DefaultInstalledAppProvider();
  v17 = &off_25173BDF8;
  *(_QWORD *)&v15 = a1;
  if ((sub_24613222C() & 1) != 0)
  {
    type metadata accessor for DefaultEligibilityCriteria();
    v10 = sub_246116844();
    v12 = v11;
  }
  else
  {
    v12 = MEMORY[0x24BEE4B08];
    v10 = (char *)MEMORY[0x24BEE4B08];
  }
  sub_24611751C(&v15, a3 + 16);
  *(_QWORD *)(a3 + 56) = v10;
  *(_QWORD *)(a3 + 64) = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return a3;
}

uint64_t sub_24611CFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;

  v5[24] = a1;
  v5[25] = a5;
  v9 = sub_2461323E8();
  v5[26] = v9;
  v5[27] = *(_QWORD *)(v9 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[5] = type metadata accessor for DefaultEligibilityCriteria();
  v5[6] = &off_25173BBC8;
  v5[2] = a2;
  v10 = type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider();
  v5[31] = v10;
  v5[10] = v10;
  v5[11] = &off_25173B5D8;
  v5[7] = a3;
  v5[15] = type metadata accessor for DefaultSiriShortcutsEnablementProvider();
  v5[16] = &off_25173BB60;
  v5[12] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611D0DC()
{
  os_log_type_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;

  v36 = (_QWORD *)(v1 + 96);
  v3 = *(_QWORD *)(v1 + 192);
  if (!v3)
  {
    v31 = *(NSObject **)(v1 + 240);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v32 = OUTLINED_FUNCTION_62();
    if (OUTLINED_FUNCTION_35_1(v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_246105000, v31, v0, "No autoshortcuts were returned by LNAutoShortcutsProvider", v33, 2u);
      OUTLINED_FUNCTION_0();
    }

    v34 = OUTLINED_FUNCTION_256();
    v35(v34);
LABEL_35:
    __swift_destroy_boxed_opaque_existential_1Tm(v1 + 16);
    __swift_destroy_boxed_opaque_existential_1Tm(v1 + 56);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_164();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  v4 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(v1 + 312) = v4;
  v5 = 1 << v4;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v3 + 64);
  *(_QWORD *)(v1 + 304) = 0;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  if (!v7)
    goto LABEL_7;
LABEL_6:
  OUTLINED_FUNCTION_213();
  v11 = v10 | (v9 << 6);
  result = *(_QWORD *)(v1 + 192);
  while (1)
  {
    *(_QWORD *)(v1 + 256) = v9;
    *(_QWORD *)(v1 + 264) = v7;
    v18 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v11);
    v19 = *v18;
    *(_QWORD *)(v1 + 272) = *v18;
    *(_QWORD *)(v1 + 280) = v18[1];
    *(_QWORD *)(v1 + 288) = *(_QWORD *)(*(_QWORD *)(result + 56) + 8 * v11);
    OUTLINED_FUNCTION_108((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_49();
    v20 = OUTLINED_FUNCTION_204();
    if ((sub_246116E30(v20, v21) & 1) != 0)
    {
      OUTLINED_FUNCTION_108(v36, *(_QWORD *)(v1 + 120));
      v28 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 296) = v28;
      *v28 = v1;
      v28[1] = sub_24611D484;
      v29 = OUTLINED_FUNCTION_204();
      return sub_246115DD8(v29, v30);
    }
    v22 = *(NSObject **)(v1 + 232);
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_11();
    sub_2461323DC();
    v23 = OUTLINED_FUNCTION_62();
    v24 = OUTLINED_FUNCTION_21(v23);
    v37 = *(_QWORD *)(v1 + 232);
    v25 = *(_QWORD *)(v1 + 216);
    if (v24)
    {
      v26 = OUTLINED_FUNCTION_2();
      v38 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v26 = 136315138;
      OUTLINED_FUNCTION_11();
      *(_QWORD *)(v26 + 4) = OUTLINED_FUNCTION_187(v19, v27, &v38);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_22(&dword_246105000, v22, v2, "Skipping App Shortcut since it is associated with an app that is not installed: %s", (uint8_t *)v26);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_44_1();

    result = OUTLINED_FUNCTION_51_0(v37, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    if (v7)
      goto LABEL_6;
LABEL_7:
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    result = OUTLINED_FUNCTION_181();
    if (v13 >= (uint64_t)(v12 >> 6))
      goto LABEL_34;
    v14 = result + 64;
    v15 = *(_QWORD *)(result + 64 + 8 * v13);
    v9 = v13;
    if (!v15)
    {
      v16 = v12 >> 6;
      v9 = v13 + 1;
      if (v13 + 1 >= v16)
        goto LABEL_34;
      v15 = *(_QWORD *)(v14 + 8 * v9);
      if (!v15)
      {
        v9 = v13 + 2;
        if (v13 + 2 >= v16)
          goto LABEL_34;
        v15 = *(_QWORD *)(v14 + 8 * v9);
        if (!v15)
        {
          v9 = v13 + 3;
          if (v13 + 3 >= v16)
            goto LABEL_34;
          v15 = *(_QWORD *)(v14 + 8 * v9);
          if (!v15)
          {
            v9 = v13 + 4;
            if (v13 + 4 >= v16)
              goto LABEL_34;
            v15 = *(_QWORD *)(v14 + 8 * v9);
            if (!v15)
              break;
          }
        }
      }
    }
LABEL_24:
    v7 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v9 << 6);
  }
  v17 = v13 + 5;
  if (v17 >= v16)
  {
LABEL_34:
    swift_release();
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v14 + 8 * v17);
  if (v15)
  {
    v9 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v16)
      goto LABEL_34;
    v15 = *(_QWORD *)(v14 + 8 * v9);
    ++v17;
    if (v15)
      goto LABEL_24;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24611D484()
{
  char v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_BYTE *)(v1 + 313) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_24611D4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15, uint64_t a16, _QWORD *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  BOOL v49;
  unint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  char v74;
  unint64_t v75;
  char v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  unint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  void (*v104)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, unint64_t, _QWORD, _QWORD, _QWORD *, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  unint64_t v116;
  __int128 v117;
  uint64_t v118;

  OUTLINED_FUNCTION_183();
  a29 = v33;
  a30 = v34;
  a28 = v30;
  v35 = *(_QWORD *)(v30 + 288);
  v36 = MEMORY[0x24BEE4AD8];
  v118 = v30;
  v112 = v30 + 56;
  if ((*(_BYTE *)(v30 + 313) & 1) != 0)
  {
    a17 = (_QWORD *)(v30 + 136);
    v37 = *(_QWORD *)(v30 + 248);
    v38 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v30 + 56), *(_QWORD *)(v30 + 80));
    *(_QWORD *)(v30 + 160) = v37;
    *(_QWORD *)(v30 + 168) = &off_25173B5D8;
    *(_QWORD *)(v30 + 136) = v38;
    *(_QWORD *)(v30 + 176) = MEMORY[0x24BEE4AF8];
    if (v35 >> 62)
      goto LABEL_46;
    v32 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_165();
    while (v32)
    {
      v39 = 0;
      v40 = v35 & 0xC000000000000001;
      a15 = (_QWORD *)(*(_QWORD *)(v30 + 288) + 32);
      v36 = *(_QWORD *)(v30 + 304);
      while (1)
      {
        v41 = v40 ? (id)MEMORY[0x249550420](v39, *(_QWORD *)(v30 + 288)) : (id)a15[v39];
        v42 = v41;
        v43 = v39 + 1;
        if (__OFADD__(v39, 1))
          break;
        v44 = v32;
        v46 = *(_QWORD *)(v118 + 272);
        v45 = *(_QWORD *)(v118 + 280);
        v47 = (void *)MEMORY[0x24955063C]();
        v48 = v45;
        v35 = v36;
        sub_24612D9C8((uint64_t)v42, v46, v48, a17);
        objc_autoreleasePoolPop(v47);
        if (v36)
        {
          OUTLINED_FUNCTION_186();
          return;
        }

        v36 = 0;
        ++v39;
        v32 = v44;
        v49 = v43 == v44;
        v30 = v118;
        if (v49)
        {
          a9 = 0;
          swift_bridgeObjectRelease();
          v113 = 0;
          v50 = *(_QWORD *)(v118 + 176);
          v36 = MEMORY[0x24BEE4AD8];
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_165();
      v32 = OUTLINED_FUNCTION_90();
    }
    swift_bridgeObjectRelease();
    v113 = *(_QWORD *)(v30 + 304);
    v50 = MEMORY[0x24BEE4AF8];
LABEL_18:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a17);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_47();
    if (v50 >> 62)
    {
      OUTLINED_FUNCTION_15_1();
      v60 = OUTLINED_FUNCTION_249();
      OUTLINED_FUNCTION_2_1();
      if (v60)
        goto LABEL_20;
    }
    else
    {
      v60 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v60)
      {
LABEL_20:
        v36 = 0;
        a15 = (_QWORD *)(v30 + 184);
        a17 = (_QWORD *)(v50 & 0xC000000000000001);
        v115 = v60;
        v116 = v50;
        while (1)
        {
          if (a17)
          {
            v61 = MEMORY[0x249550420](v36, v50);
          }
          else
          {
            v61 = *(_QWORD *)(v50 + 8 * v36 + 32);
            swift_retain();
          }
          v35 = v36 + 1;
          if (__OFADD__(v36, 1))
            goto LABEL_43;
          v62 = **(_QWORD **)(v30 + 200);
          OUTLINED_FUNCTION_49();
          v63 = OUTLINED_FUNCTION_198();
          if (!*(_QWORD *)(v62 + 16))
            break;
          sub_24612ACE4(v63, v64);
          v66 = v65;
          OUTLINED_FUNCTION_10_0();
          OUTLINED_FUNCTION_47();
          if ((v66 & 1) == 0)
            goto LABEL_29;
          OUTLINED_FUNCTION_244();
LABEL_38:
          ++v36;
          if (v35 == v60)
          {
            OUTLINED_FUNCTION_2_1();
            v36 = MEMORY[0x24BEE4AD8];
            goto LABEL_49;
          }
        }
        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_47();
LABEL_29:
        v67 = *(uint64_t **)(v30 + 200);
        v32 = OUTLINED_FUNCTION_198();
        v69 = v68;
        swift_retain();
        swift_isUniquelyReferenced_nonNull_native();
        v70 = *v67;
        *(_QWORD *)(v30 + 184) = *v67;
        *v67 = 0x8000000000000000;
        v71 = OUTLINED_FUNCTION_252();
        if (__OFADD__(*(_QWORD *)(v70 + 16), (v72 & 1) == 0))
          goto LABEL_44;
        v73 = v71;
        v74 = v72;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25754ACE0);
        v30 = v118;
        if ((sub_2461326F4() & 1) != 0)
        {
          v75 = OUTLINED_FUNCTION_252();
          if ((v74 & 1) != (v76 & 1))
          {
            OUTLINED_FUNCTION_186();
            sub_2461327FC();
            return;
          }
          v73 = v75;
        }
        v77 = (_QWORD *)*a15;
        if ((v74 & 1) != 0)
        {
          v78 = v77[7];
          swift_release();
          *(_QWORD *)(v78 + 8 * v73) = v61;
        }
        else
        {
          v77[(v73 >> 6) + 8] |= 1 << v73;
          v79 = (uint64_t *)(v77[6] + 16 * v73);
          *v79 = v32;
          v79[1] = v69;
          *(_QWORD *)(v77[7] + 8 * v73) = v61;
          v80 = v77[2];
          v81 = __OFADD__(v80, 1);
          v82 = v80 + 1;
          if (v81)
            goto LABEL_45;
          v77[2] = v82;
          OUTLINED_FUNCTION_49();
        }
        **(_QWORD **)(v118 + 200) = v77;
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_47();
        OUTLINED_FUNCTION_244();
        v60 = v115;
        v50 = v116;
        goto LABEL_38;
      }
    }
    OUTLINED_FUNCTION_2_1();
LABEL_49:
    v59 = v113;
  }
  else
  {
    v51 = *(NSObject **)(v30 + 280);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_168();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_160();
    v52 = OUTLINED_FUNCTION_62();
    v53 = OUTLINED_FUNCTION_21(v52);
    v54 = *(_QWORD *)(v30 + 280);
    if (v53)
    {
      v55 = *(_QWORD *)(v30 + 272);
      v56 = OUTLINED_FUNCTION_2();
      a18 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v56 = 136315138;
      OUTLINED_FUNCTION_17_2();
      *(_QWORD *)(v56 + 4) = sub_246119920(v55, v54, &a18);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_22(&dword_246105000, v51, v31, "Skipping App Shortcut since it is associated with an app that is not enabled for Siri: %s", (uint8_t *)v56);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }
    v57 = *(_QWORD *)(v30 + 216);
    OUTLINED_FUNCTION_44_1();

    OUTLINED_FUNCTION_117(*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));
    v59 = *(_QWORD *)(v30 + 304);
    v36 = MEMORY[0x24BEE4AD8];
  }
  v114 = (_QWORD *)(v30 + 96);
  v83 = *(_QWORD *)(v30 + 256);
  v84 = *(_QWORD *)(v30 + 264);
  *(_QWORD *)(v30 + 304) = v59;
  *(_QWORD *)&v58 = 136315138;
  v117 = v58;
  if (!v84)
    goto LABEL_52;
LABEL_51:
  v85 = __clz(__rbit64(v84));
  v84 &= v84 - 1;
  v86 = v85 | (v83 << 6);
  v87 = *(_QWORD *)(v30 + 192);
  while (1)
  {
    *(_QWORD *)(v30 + 256) = v83;
    *(_QWORD *)(v30 + 264) = v84;
    v93 = (uint64_t *)(*(_QWORD *)(v87 + 48) + 16 * v86);
    v94 = *v93;
    *(_QWORD *)(v30 + 272) = *v93;
    v95 = v93[1];
    *(_QWORD *)(v30 + 280) = v95;
    *(_QWORD *)(v30 + 288) = *(_QWORD *)(*(_QWORD *)(v87 + 56) + 8 * v86);
    OUTLINED_FUNCTION_108((_QWORD *)(v30 + 16), *(_QWORD *)(v30 + 40));
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_11_3();
    if ((sub_246116E30(v94, v95) & 1) != 0)
    {
      OUTLINED_FUNCTION_108(v114, *(_QWORD *)(v30 + 120));
      v102 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v30 + 296) = v102;
      v103 = OUTLINED_FUNCTION_191(v102, (uint64_t)sub_24611D484);
      OUTLINED_FUNCTION_101(v103, v95);
      return;
    }
    a17 = (_QWORD *)v83;
    v96 = *(NSObject **)(v30 + 232);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_119();
    sub_2461323DC();
    v97 = OUTLINED_FUNCTION_62();
    v98 = OUTLINED_FUNCTION_199(v97);
    v99 = *(_QWORD *)(v30 + 232);
    v100 = *(_QWORD *)(v30 + 216);
    if (v98)
    {
      v101 = OUTLINED_FUNCTION_2();
      a18 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v101 = v117;
      OUTLINED_FUNCTION_119();
      *(_QWORD *)(v101 + 4) = sub_246119920(v94, v95, &a18);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_22(&dword_246105000, v96, (os_log_type_t)v32, "Skipping App Shortcut since it is associated with an app that is not installed: %s", (uint8_t *)v101);
      OUTLINED_FUNCTION_240();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_44_1();

    OUTLINED_FUNCTION_185(v99, *(uint64_t (**)(uint64_t, uint64_t))(v100 + 8));
    v83 = (uint64_t)a17;
    if (v84)
      goto LABEL_51;
LABEL_52:
    v81 = __OFADD__(v83++, 1);
    if (v81)
    {
      __break(1u);
      goto LABEL_79;
    }
    v87 = OUTLINED_FUNCTION_181();
    if (v83 >= (uint64_t)(v88 >> 6))
      goto LABEL_77;
    v89 = v87 + 64;
    v90 = *(_QWORD *)(v87 + 64 + 8 * v83);
    if (!v90)
      break;
LABEL_66:
    v84 = (v90 - 1) & v90;
    v86 = __clz(__rbit64(v90)) + (v83 << 6);
  }
  v91 = v88 >> 6;
  v92 = v83 + 1;
  if (v83 + 1 >= v91)
    goto LABEL_77;
  v90 = *(_QWORD *)(v89 + 8 * v92);
  if (v90)
    goto LABEL_65;
  v92 = v83 + 2;
  if (v83 + 2 >= v91)
    goto LABEL_77;
  v90 = *(_QWORD *)(v89 + 8 * v92);
  if (v90)
    goto LABEL_65;
  v92 = v83 + 3;
  if (v83 + 3 >= v91)
    goto LABEL_77;
  v90 = *(_QWORD *)(v89 + 8 * v92);
  if (v90)
    goto LABEL_65;
  v92 = v83 + 4;
  if (v83 + 4 >= v91)
    goto LABEL_77;
  v90 = *(_QWORD *)(v89 + 8 * v92);
  if (v90)
    goto LABEL_65;
  v92 = v83 + 5;
  if (v83 + 5 >= v91)
  {
LABEL_77:
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm(v30 + 16);
    __swift_destroy_boxed_opaque_existential_1Tm(v112);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v114);
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_186();
    v104(v104, v105, v106, v107, v108, v109, v110, v111, a9, v112, v114, v36 + 8, v117, *((_QWORD *)&v117 + 1), a15, v118, a17, a18, a19,
      a20,
      a21,
      a22);
    return;
  }
  v90 = *(_QWORD *)(v89 + 8 * v92);
  if (v90)
  {
LABEL_65:
    v83 = v92;
    goto LABEL_66;
  }
  while (1)
  {
    v83 = v92 + 1;
    if (__OFADD__(v92, 1))
      break;
    if (v83 >= v91)
      goto LABEL_77;
    v90 = *(_QWORD *)(v89 + 8 * v83);
    ++v92;
    if (v90)
      goto LABEL_66;
  }
LABEL_79:
  __break(1u);
}

uint64_t sub_24611DC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  _UNKNOWN **v30;

  v23[2] = a3;
  v5 = sub_2461323E8();
  v25 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for DefaultEligibilityCriteria();
  v30 = &off_25173BBC8;
  v28[0] = a2;
  v27 = MEMORY[0x24BEE4AF8];
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
    swift_retain();
    v21 = MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v23[1] = a1;
  v9 = (unint64_t *)(a1 + 40);
  *(_QWORD *)&v10 = 136315138;
  v24 = v10;
  v23[3] = MEMORY[0x24BEE4AD8] + 8;
  do
  {
    v12 = *(v9 - 1);
    v11 = *v9;
    v13 = __swift_project_boxed_opaque_existential_1(v28, v29);
    v14 = *(_QWORD *)(*(_QWORD *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(*v13 + 16), *(_QWORD *)(*v13 + 40))+ 16)+ 16);
    swift_bridgeObjectRetain();
    if (!v14)
      goto LABEL_9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24612ACE4(v12, v11);
    if ((v15 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      sub_2461323D0();
      swift_bridgeObjectRetain();
      v17 = sub_2461323DC();
      v18 = sub_2461325C8();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v26 = v20;
        *(_DWORD *)v19 = v24;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v19 + 4) = sub_246119920(v12, v11, &v26);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246105000, v17, v18, "SiriAutoCompleteIndexBuilder updateIndexForAppInstall:%s not able to get app metadata. Not updating index", (uint8_t *)v19, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249550A14](v20, -1, -1);
        MEMORY[0x249550A14](v19, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v5);
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_246126A40();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = swift_retain();
    MEMORY[0x2495502AC](v16);
    if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_246132550();
    sub_246132568();
    sub_246132544();
    swift_release();
LABEL_13:
    v9 += 2;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  v21 = v27;
LABEL_16:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v21;
}

uint64_t sub_24611DFCC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;

  v2[23] = a2;
  v4 = sub_2461323E8();
  v2[24] = v4;
  v2[25] = *(_QWORD *)(v4 - 8);
  v2[26] = swift_task_alloc();
  v2[13] = type metadata accessor for DefaultEligibilityCriteria();
  v2[14] = &off_25173BBC8;
  v2[10] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611E050()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);

  v1 = v0[23];
  v0[27] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60008]), sel_init);
  OUTLINED_FUNCTION_137();
  v0[20] = OUTLINED_FUNCTION_203();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C560);
  v2 = OUTLINED_FUNCTION_203();
  v3 = *(_QWORD *)(v1 + 16);
  v0[28] = v3;
  if (v3)
  {
    type metadata accessor for DefaultLocaleProvider();
    OUTLINED_FUNCTION_11_3();
    inited = swift_initStaticObject();
    v0[31] = 0;
    v0[32] = 0;
    v0[29] = inited;
    v0[30] = v2;
    v5 = (void *)v0[27];
    v6 = v0[23];
    v0[33] = *(_QWORD *)(v6 + 32);
    v0[34] = *(_QWORD *)(v6 + 40);
    OUTLINED_FUNCTION_15_1();
    v7 = sub_246132478();
    v0[35] = v7;
    sub_246125B0C();
    v8 = OUTLINED_FUNCTION_197();
    v0[36] = v8;
    OUTLINED_FUNCTION_46();
    v0[7] = v0 + 21;
    v9 = OUTLINED_FUNCTION_96((uint64_t)sub_24611E20C);
    v0[15] = MEMORY[0x24BDAC760];
    v10 = v0 + 15;
    v10[1] = 0x40000000;
    OUTLINED_FUNCTION_212(v9, (uint64_t)sub_246119394);
    objc_msgSend(v5, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_, v7, v8, v10);
    return OUTLINED_FUNCTION_122();
  }
  else
  {
    v12 = (void *)v0[27];
    OUTLINED_FUNCTION_46();
    v13 = OUTLINED_FUNCTION_37();
    sub_24611A22C(v13);
    OUTLINED_FUNCTION_44_1();

    sub_246115C3C(0);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 10));
    OUTLINED_FUNCTION_65_0();
    v14 = OUTLINED_FUNCTION_233();
    return OUTLINED_FUNCTION_68(v14, v15);
  }
}

uint64_t sub_24611E20C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_163();
  *(_QWORD *)(v0 + 296) = v1;
  if (v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611E254()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t inited;
  uint64_t v35;
  _QWORD *v36;
  uint64_t (*v37)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(void **)(v0 + 280);

  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_11_3();
    v4 = OUTLINED_FUNCTION_249();
    OUTLINED_FUNCTION_17_0();
  }
  else
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = *(_QWORD *)(v0 + 272);
  if (v4)
  {
    v6 = *(_QWORD *)(v0 + 264);
    v7 = *(_QWORD *)(v0 + 240);
    sub_246115C3C(*(_QWORD *)(v0 + 248));
    isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v0 + 176) = v7;
    v9 = sub_24612ACE4(v6, v5);
    if (__OFADD__(*(_QWORD *)(v7 + 16), (v10 & 1) == 0))
    {
      __break(1u);
      goto LABEL_22;
    }
    v11 = v9;
    v12 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B030);
    v13 = sub_2461326F4();
    isUniquelyReferenced_nonNull_native = *(_QWORD **)(v0 + 176);
    *(_QWORD *)(v0 + 304) = isUniquelyReferenced_nonNull_native;
    if ((v13 & 1) != 0)
    {
      v14 = OUTLINED_FUNCTION_222(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 272));
      if ((v12 & 1) != (v15 & 1))
        return sub_2461327FC();
      v11 = v14;
    }
    swift_bridgeObjectRelease();
    v26 = *(_QWORD *)(v0 + 272);
    if ((v12 & 1) != 0)
    {
LABEL_18:
      v1 = v0 + 160;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_10_0();
      sub_246119438(v2);
      OUTLINED_FUNCTION_13_0();
      v32 = qword_25754A760;
      OUTLINED_FUNCTION_40();
      if (v32 == -1)
      {
LABEL_19:
        v33 = qword_25754B8F8;
        *(_QWORD *)(v0 + 312) = qword_25754B8F8;
        type metadata accessor for DefaultSiriShortcutsEnablementProvider();
        OUTLINED_FUNCTION_135();
        inited = swift_initStaticObject();
        v35 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104));
        v36 = (_QWORD *)OUTLINED_FUNCTION_12_3();
        *(_QWORD *)(v0 + 320) = v36;
        *v36 = v0;
        v36[1] = sub_24611E7FC;
        return v37(isUniquelyReferenced_nonNull_native, v35, v33, inited, v1);
      }
LABEL_22:
      swift_once();
      goto LABEL_19;
    }
    v27 = *(_QWORD *)(v0 + 264);
    isUniquelyReferenced_nonNull_native[(v11 >> 6) + 8] |= 1 << v11;
    v28 = (_QWORD *)(isUniquelyReferenced_nonNull_native[6] + 16 * v11);
    *v28 = v27;
    v28[1] = v26;
    *(_QWORD *)(isUniquelyReferenced_nonNull_native[7] + 8 * v11) = MEMORY[0x24BEE4AF8];
    v29 = isUniquelyReferenced_nonNull_native[2];
    v30 = v29 + 1;
    v31 = __OFADD__(v29, 1);
    result = OUTLINED_FUNCTION_40();
    if (!v31)
    {
      isUniquelyReferenced_nonNull_native[2] = v30;
      goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_133();
    if (v18)
    {
      v19 = *(_QWORD *)(v0 + 248);
      OUTLINED_FUNCTION_250();
      v20 = *(void **)(v0 + 216);
      OUTLINED_FUNCTION_46();
      v21 = OUTLINED_FUNCTION_37();
      v22 = sub_24611A22C(v21);
      OUTLINED_FUNCTION_44_1();

      sub_246115C3C(v19);
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
      OUTLINED_FUNCTION_71();
      return OUTLINED_FUNCTION_91((uint64_t)v22, *(uint64_t (**)(void))(v0 + 8));
    }
    else
    {
      *(_QWORD *)(v0 + 256) = v17;
      OUTLINED_FUNCTION_52_0(v17);
      v23 = OUTLINED_FUNCTION_166();
      OUTLINED_FUNCTION_179(v23);
      *(_QWORD *)(v0 + 288) = OUTLINED_FUNCTION_197();
      OUTLINED_FUNCTION_46();
      *(_QWORD *)(v0 + 56) = v0 + 168;
      v24 = OUTLINED_FUNCTION_96((uint64_t)sub_24611E20C);
      *(_QWORD *)(v0 + 120) = MEMORY[0x24BDAC760];
      *(_QWORD *)(v0 + 128) = 0x40000000;
      v25 = OUTLINED_FUNCTION_212(v24, (uint64_t)sub_246119394);
      OUTLINED_FUNCTION_111(v25, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
      return swift_continuation_await();
    }
  }
  return result;
}

uint64_t sub_24611E5EC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_97();
  v1 = *(void **)(v0 + 288);
  v2 = *(void **)(v0 + 280);
  swift_willThrow();

  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_202();
  OUTLINED_FUNCTION_202();
  v3 = OUTLINED_FUNCTION_160();
  v4 = sub_2461325D4();
  v5 = OUTLINED_FUNCTION_21(v4);
  v6 = *(void **)(v0 + 296);
  if (v5)
  {
    v7 = OUTLINED_FUNCTION_2();
    v8 = (_QWORD *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v7 + 4) = v10;
    *v8 = v10;
    OUTLINED_FUNCTION_159();
    OUTLINED_FUNCTION_159();
    OUTLINED_FUNCTION_22(&dword_246105000, v3, (os_log_type_t)v1, "Unexpected error when attempting to fetch shortcuts via LNAutoShortcutsProvider. Error: %@", (uint8_t *)v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754A920);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_159();

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  OUTLINED_FUNCTION_133();
  if (v12)
  {
    v13 = *(_QWORD *)(v0 + 248);
    OUTLINED_FUNCTION_250();
    v14 = *(void **)(v0 + 216);
    OUTLINED_FUNCTION_46();
    v15 = OUTLINED_FUNCTION_37();
    v16 = sub_24611A22C(v15);
    OUTLINED_FUNCTION_44_1();

    sub_246115C3C(v13);
    OUTLINED_FUNCTION_237();
    OUTLINED_FUNCTION_71();
    return OUTLINED_FUNCTION_92((uint64_t)v16, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    *(_QWORD *)(v0 + 256) = v11;
    OUTLINED_FUNCTION_52_0(v11);
    v17 = OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_179(v17);
    *(_QWORD *)(v0 + 288) = OUTLINED_FUNCTION_197();
    OUTLINED_FUNCTION_46();
    *(_QWORD *)(v0 + 56) = v0 + 168;
    v18 = OUTLINED_FUNCTION_96((uint64_t)sub_24611E20C);
    *(_QWORD *)(v0 + 120) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 128) = 0x40000000;
    v19 = OUTLINED_FUNCTION_212(v18, (uint64_t)sub_246119394);
    OUTLINED_FUNCTION_111(v19, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
    return swift_continuation_await();
  }
}

uint64_t sub_24611E7FC()
{
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_145();
}

uint64_t sub_24611E83C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[38];
  OUTLINED_FUNCTION_133();
  if (v3)
  {
    OUTLINED_FUNCTION_250();
    v4 = (void *)v0[27];
    OUTLINED_FUNCTION_46();
    v5 = OUTLINED_FUNCTION_37();
    sub_24611A22C(v5);
    OUTLINED_FUNCTION_44_1();

    sub_246115C3C((uint64_t)sub_246119428);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 10));
    OUTLINED_FUNCTION_65_0();
    v6 = OUTLINED_FUNCTION_233();
    return OUTLINED_FUNCTION_68(v6, v7);
  }
  else
  {
    v0[31] = sub_246119428;
    v0[32] = v2;
    v0[30] = v1;
    OUTLINED_FUNCTION_52_0(v2);
    v8 = OUTLINED_FUNCTION_166();
    OUTLINED_FUNCTION_179(v8);
    v0[36] = OUTLINED_FUNCTION_197();
    OUTLINED_FUNCTION_46();
    v0[7] = v0 + 21;
    v9 = OUTLINED_FUNCTION_96((uint64_t)sub_24611E20C);
    v0[15] = MEMORY[0x24BDAC760];
    v0[16] = 0x40000000;
    v10 = OUTLINED_FUNCTION_212(v9, (uint64_t)sub_246119394);
    OUTLINED_FUNCTION_111(v10, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
    return OUTLINED_FUNCTION_122();
  }
}

uint64_t sub_24611E948(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2[12] = a2;
  v2[13] = *a2;
  v4 = sub_2461323E8();
  v2[14] = v4;
  v2[15] = *(_QWORD *)(v4 - 8);
  v2[16] = swift_task_alloc();
  v5 = type metadata accessor for DefaultEligibilityCriteria();
  v2[17] = v5;
  v2[5] = v5;
  v2[6] = &off_25173BBC8;
  v2[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611E9D8()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int64_t v27;

  OUTLINED_FUNCTION_184();
  *(_QWORD *)(v1 + 80) = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_85((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 136));
  v26 = *(_QWORD *)(v4 + 16) + 64;
  OUTLINED_FUNCTION_175();
  v7 = v6 & v5;
  v27 = (unint64_t)(63 - v8) >> 6;
  OUTLINED_FUNCTION_15_1();
  v9 = 0;
  if (!v7)
    goto LABEL_3;
LABEL_2:
  OUTLINED_FUNCTION_213();
  while (1)
  {
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_40();
    v2 = sub_246126A40();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_10_0();
    v20 = OUTLINED_FUNCTION_102();
    MEMORY[0x2495502AC](v20);
    v3 = *(uint8_t **)((*(_QWORD *)(v1 + 80) & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v3 >= *(_QWORD *)((*(_QWORD *)(v1 + 80) & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_246132550();
    v0 = (v1 + 80);
    sub_246132568();
    sub_246132544();
    OUTLINED_FUNCTION_110();
    if (v7)
      goto LABEL_2;
LABEL_3:
    v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v10 >= v27)
      break;
    v11 = *(_QWORD *)(v26 + 8 * v10);
    ++v9;
    if (v11)
      goto LABEL_25;
    v9 = v10 + 1;
    OUTLINED_FUNCTION_194();
    if (v12 == v13)
      break;
    OUTLINED_FUNCTION_192();
    if (v11)
      goto LABEL_25;
    v9 = v14 + 2;
    OUTLINED_FUNCTION_194();
    if (v12 == v13)
      break;
    OUTLINED_FUNCTION_192();
    if (v11)
      goto LABEL_25;
    v9 = v15 + 3;
    OUTLINED_FUNCTION_194();
    if (v12 == v13)
      break;
    OUTLINED_FUNCTION_192();
    if (v11)
      goto LABEL_25;
    v9 = v16 + 4;
    OUTLINED_FUNCTION_194();
    if (v12 == v13)
      break;
    OUTLINED_FUNCTION_192();
    if (v11)
      goto LABEL_25;
    v18 = v17 + 5;
    if (v18 >= v27)
      break;
    v11 = *(_QWORD *)(v26 + 8 * v18);
    if (!v11)
    {
      while (1)
      {
        v9 = v18 + 1;
        if (__OFADD__(v18, 1))
          break;
        OUTLINED_FUNCTION_194();
        if (v12 == v13)
          goto LABEL_30;
        OUTLINED_FUNCTION_192();
        v18 = v19 + 1;
        if (v11)
          goto LABEL_25;
      }
LABEL_36:
      __break(1u);
LABEL_37:
      OUTLINED_FUNCTION_15_1();
      v22 = sub_246132724();
      OUTLINED_FUNCTION_2_1();
      goto LABEL_33;
    }
    v9 = v18;
LABEL_25:
    v7 = (v11 - 1) & v11;
  }
LABEL_30:
  v0 = *(NSObject **)(v1 + 128);
  OUTLINED_FUNCTION_215();
  OUTLINED_FUNCTION_25_0();
  v21 = *(_QWORD *)(v1 + 80);
  OUTLINED_FUNCTION_136();
  sub_2461323DC();
  v2 = OUTLINED_FUNCTION_62();
  if (OUTLINED_FUNCTION_126(v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v3 = 134217984;
    if (v21 >> 62)
      goto LABEL_37;
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_33:
    OUTLINED_FUNCTION_2_1();
    *(_QWORD *)(v1 + 88) = v22;
    sub_246132610();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_22(&dword_246105000, v0, v2, "%ld phrase(s) created from the App Launch source", v3);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_44_1();

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 120) + 8))(*(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 112));
  OUTLINED_FUNCTION_23_2();
  v23 = OUTLINED_FUNCTION_11_3();
  sub_246126BE0(v23);
  OUTLINED_FUNCTION_17_0();
  v24 = *(_QWORD *)(v1 + 80);
  __swift_destroy_boxed_opaque_existential_1Tm(v1 + 16);
  OUTLINED_FUNCTION_71();
  return OUTLINED_FUNCTION_53_1(v24, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_24611ED04(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2[8] = a2;
  v4 = sub_2461323E8();
  v2[9] = v4;
  v2[10] = *(_QWORD *)(v4 - 8);
  v2[11] = swift_task_alloc();
  v5 = type metadata accessor for DefaultEligibilityCriteria();
  v2[12] = v5;
  v2[5] = v5;
  v2[6] = &off_25173BBC8;
  v2[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611ED8C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t);

  OUTLINED_FUNCTION_85(v0 + 2, v0[12]);
  v1 = OUTLINED_FUNCTION_49();
  v0[13] = sub_24611A310(v1);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_108(v0 + 2, v0[5]);
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  v0[14] = v2;
  OUTLINED_FUNCTION_227(v2, (uint64_t)sub_24611EE10);
  v3 = OUTLINED_FUNCTION_247();
  return v5(v3);
}

uint64_t sub_24611EE10()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 120) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611EE50()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  unint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(NSObject **)(v0 + 120);
  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_160();
  v2 = OUTLINED_FUNCTION_62();
  v3 = OUTLINED_FUNCTION_126(v2);
  v4 = *(_QWORD *)(v0 + 120);
  if (v3)
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v5 = 134217984;
    if (v4 >> 62)
    {
      OUTLINED_FUNCTION_17_2();
      v6 = OUTLINED_FUNCTION_214();
      OUTLINED_FUNCTION_4_1();
    }
    else
    {
      v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    OUTLINED_FUNCTION_4_1();
    *(_QWORD *)(v0 + 56) = v6;
    sub_246132610();
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_22(&dword_246105000, v1, v2, "%ld phrase(s) created from App Shortcuts using LNAutoShortcutsProvider", v5);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_44_1();

  v7 = *(_QWORD *)(v0 + 120);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  sub_24612E1E8(v7);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  OUTLINED_FUNCTION_65_0();
  return OUTLINED_FUNCTION_68(*(_QWORD *)(v0 + 120), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24611EF84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;

  v3[16] = a1;
  v6 = sub_2461323E8();
  v3[17] = v6;
  v3[18] = *(_QWORD *)(v6 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v7 = type metadata accessor for DefaultEligibilityCriteria();
  v3[21] = v7;
  v3[5] = v7;
  v3[6] = &off_25173BBC8;
  v3[2] = a2;
  v3[10] = type metadata accessor for DefaultSiriShortcutsEnablementProvider();
  v3[11] = &off_25173BB60;
  v3[7] = a3;
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611F048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v44;
  void *v45;
  id v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  os_log_type_t v60;

  OUTLINED_FUNCTION_183();
  a29 = v31;
  a30 = v32;
  a28 = v30;
  v33 = *(_QWORD *)(v30 + 168);
  v34 = objc_msgSend(*(id *)(v30 + 128), sel_associatedAppBundleIdentifier);
  v35 = sub_246132484();
  v37 = v36;

  *(_QWORD *)(v30 + 176) = v35;
  *(_QWORD *)(v30 + 184) = v37;
  OUTLINED_FUNCTION_108((_QWORD *)(v30 + 16), v33);
  v38 = OUTLINED_FUNCTION_217();
  if ((sub_246116E30(v38, v39) & 1) != 0)
  {
    OUTLINED_FUNCTION_108((_QWORD *)(v30 + 56), *(_QWORD *)(v30 + 80));
    v40 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v30 + 192) = v40;
    OUTLINED_FUNCTION_227(v40, (uint64_t)sub_24611F2CC);
    v41 = OUTLINED_FUNCTION_217();
    return OUTLINED_FUNCTION_101(v41, v42);
  }
  else
  {
    v44 = *(NSObject **)(v30 + 160);
    v45 = *(void **)(v30 + 128);
    OUTLINED_FUNCTION_25_0();
    v46 = v45;
    OUTLINED_FUNCTION_40();
    sub_2461323DC();
    v60 = OUTLINED_FUNCTION_61_0();
    v47 = os_log_type_enabled(v44, v60);
    v48 = *(_QWORD *)(v30 + 160);
    v49 = *(_QWORD *)(v30 + 136);
    v50 = *(_QWORD *)(v30 + 144);
    v51 = *(void **)(v30 + 128);
    if (v47)
    {
      v52 = OUTLINED_FUNCTION_2();
      a19 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v52 = 136315394;
      v53 = objc_msgSend(v51, sel_shortcutName);
      v54 = sub_246132484();
      v56 = v55;

      *(_QWORD *)(v30 + 96) = sub_246119920(v54, v56, &a19);
      sub_246132610();
      swift_bridgeObjectRelease();

      *(_WORD *)(v52 + 12) = 2080;
      OUTLINED_FUNCTION_40();
      v57 = OUTLINED_FUNCTION_217();
      *(_QWORD *)(v30 + 104) = sub_246119920(v57, v58, v59);
      sub_246132610();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_152(&dword_246105000, v44, v60, "VoiceShortcut: %s's appBundleId %s is not installed. Not eligible for autocomplete", (uint8_t *)v52);
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_44_1();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v48, v49);
    OUTLINED_FUNCTION_237();
    __swift_destroy_boxed_opaque_existential_1Tm(v30 + 56);
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_71();
    return OUTLINED_FUNCTION_100(0, *(uint64_t (**)(void))(v30 + 8));
  }
}

uint64_t sub_24611F2CC()
{
  char v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_BYTE *)(v1 + 200) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611F308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  os_log_type_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  os_log_type_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_183();
  a29 = v31;
  a30 = v32;
  a28 = v30;
  v33 = *(unsigned __int8 *)(v30 + 200);
  v34 = *(NSObject **)(v30 + 184);
  if ((_DWORD)v33 == 1)
  {
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v35 = *(void **)(v30 + 128);
    v36 = *(_QWORD *)(v30 + 152);
    OUTLINED_FUNCTION_189();
    v37 = v35;
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_210();
    v38 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_4_6(v38))
    {
      v51 = *(_QWORD *)(v30 + 176);
      v39 = *(void **)(v30 + 128);
      v40 = OUTLINED_FUNCTION_2();
      a19 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v40 = 136315394;
      v41 = objc_msgSend(v39, sel_shortcutName);
      v50 = v36;
      v42 = sub_246132484();
      v44 = v43;

      *(_QWORD *)(v30 + 112) = sub_246119920(v42, v44, &a19);
      sub_246132610();
      OUTLINED_FUNCTION_4_1();

      *(_WORD *)(v40 + 12) = 2080;
      OUTLINED_FUNCTION_11();
      *(_QWORD *)(v30 + 120) = OUTLINED_FUNCTION_187(v51, v45, &a19);
      sub_246132610();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_152(&dword_246105000, v34, v50, "VoiceShortcut: %s's appBundleId %s is not enabled for Siri. Not eligible for autocomplete", (uint8_t *)v40);
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_0();
    }
    v46 = *(void **)(v30 + 128);

    OUTLINED_FUNCTION_44_1();
    v47 = OUTLINED_FUNCTION_151();
    v48(v47);
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v30 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v30 + 56);
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_71();
  return OUTLINED_FUNCTION_100(v33, *(uint64_t (**)(void))(v30 + 8));
}

uint64_t sub_24611F514(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;

  v2[34] = a2;
  v4 = sub_2461323E8();
  v2[35] = v4;
  v2[36] = *(_QWORD *)(v4 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[13] = type metadata accessor for DefaultEligibilityCriteria();
  v2[14] = &off_25173BBC8;
  v2[10] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24611F5B4()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_137();
  v0[32] = sub_24613246C();
  v1 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v0[40] = v1;
  v0[7] = v0 + 29;
  v0[2] = v0;
  v0[3] = sub_24611F698;
  v2 = swift_continuation_init();
  v0[15] = MEMORY[0x24BDAC760];
  v3 = v0 + 15;
  v3[1] = 0x40000000;
  OUTLINED_FUNCTION_212(v2, (uint64_t)sub_246119318);
  objc_msgSend(v1, sel_getVoiceShortcutsWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_24611F698()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_163();
  *(_QWORD *)(v0 + 328) = v1;
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_24611F6D8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(uint64_t);

  OUTLINED_FUNCTION_182();
  v2 = *(void **)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 232);
  *(_QWORD *)(v0 + 336) = v3;

  if (v3 >> 62)
  {
    OUTLINED_FUNCTION_37();
    v4 = OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(v0 + 344) = v4;
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
    }
    else
    {
      type metadata accessor for DefaultSiriShortcutsEnablementProvider();
      *(_QWORD *)(v0 + 352) = swift_initStaticObject();
      *(_QWORD *)(v0 + 360) = 0;
      v5 = *(_QWORD *)(v0 + 336);
      if ((v5 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x249550420](0);
      else
        v6 = *(id *)(v5 + 32);
      *(_QWORD *)(v0 + 368) = v6;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104));
      v12 = (_QWORD *)OUTLINED_FUNCTION_9_4();
      *(_QWORD *)(v0 + 376) = v12;
      v13 = OUTLINED_FUNCTION_167(v12, (uint64_t)sub_24611FB7C);
      v14(v13);
    }
  }
  else
  {
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_25_0();
    v7 = sub_2461323DC();
    v8 = sub_2461325BC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_DWORD *)v9 = 134217984;
      OUTLINED_FUNCTION_23_2();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_22(&dword_246105000, v7, v8, "%ld phrase(s) created from Voice Shortcuts", v9);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_258();

    OUTLINED_FUNCTION_124(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_23_2();
    v10 = OUTLINED_FUNCTION_11_3();
    v11 = sub_24611A22C(v10);
    OUTLINED_FUNCTION_17_0();
    sub_246126654((unint64_t)v11);
    OUTLINED_FUNCTION_257();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_91((uint64_t)v11, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_24611F8E0()
{
  _QWORD *v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v19;

  v1 = (void *)v0[40];
  swift_willThrow();

  OUTLINED_FUNCTION_230();
  OUTLINED_FUNCTION_202();
  OUTLINED_FUNCTION_202();
  v2 = OUTLINED_FUNCTION_221();
  v3 = sub_2461325D4();
  if (OUTLINED_FUNCTION_225(v2))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_2();
    v19 = OUTLINED_FUNCTION_2();
    *(_DWORD *)v4 = 136315138;
    swift_getErrorValue();
    v5 = sub_246132808();
    v0[33] = sub_246119920(v5, v6, &v19);
    sub_246132610();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_22(&dword_246105000, v2, v3, "Unexpected error occurred while fetching voice shortcuts: %s", v4);
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_0();
  }
  v7 = v0[39];
  v9 = v0[35];
  v8 = v0[36];
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_4_5();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  OUTLINED_FUNCTION_25_0();
  v10 = sub_2461323DC();
  v11 = sub_2461325BC();
  if (OUTLINED_FUNCTION_139(v10))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v12 = 134217984;
    OUTLINED_FUNCTION_23_2();
    v0[30] = *(_QWORD *)(v0[32] + 16);
    OUTLINED_FUNCTION_201();
    OUTLINED_FUNCTION_22(&dword_246105000, v10, v11, "%ld phrase(s) created from Voice Shortcuts", v12);
    OUTLINED_FUNCTION_0();
  }
  v13 = v0[36];

  OUTLINED_FUNCTION_124(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
  OUTLINED_FUNCTION_23_2();
  v14 = OUTLINED_FUNCTION_49();
  v15 = sub_24611A22C(v14);
  OUTLINED_FUNCTION_47();
  sub_246126654((unint64_t)v15);
  OUTLINED_FUNCTION_257();
  OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_146();
  OUTLINED_FUNCTION_65_0();
  v16 = OUTLINED_FUNCTION_233();
  return OUTLINED_FUNCTION_103(v16, v17);
}

uint64_t sub_24611FB7C()
{
  char v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_BYTE *)(v1 + 384) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_24611FBB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(void), uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  void *v35;
  NSObject *v36;
  id v37;
  os_log_type_t v38;
  BOOL v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v61;
  id v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  OUTLINED_FUNCTION_184();
  a23 = v27;
  a24 = v28;
  a22 = v24;
  v29 = *(void **)(v24 + 368);
  if ((*(_BYTE *)(v24 + 384) & 1) != 0)
  {
    sub_246126424();
    v30 = *(_QWORD *)(v24 + 256);
    OUTLINED_FUNCTION_40();
    v31 = sub_246132334();
    if (*(_QWORD *)(v30 + 16))
    {
      OUTLINED_FUNCTION_222(v31, v32);
      v34 = v33;
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_10_0();
      if ((v34 & 1) != 0)
      {
        v35 = *(void **)(v24 + 368);
        OUTLINED_FUNCTION_236();

        goto LABEL_10;
      }
    }
    else
    {
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_10_0();
    }
    v48 = *(void **)(v24 + 368);
    v49 = sub_246132334();
    v51 = v50;
    v52 = sub_246126424();
    v53 = *(_QWORD *)(v24 + 256);
    swift_isUniquelyReferenced_nonNull_native();
    a13 = v53;
    *(_QWORD *)(v24 + 256) = 0x8000000000000000;
    sub_2461118E0(v52, v49, v51);
    *(_QWORD *)(v24 + 256) = a13;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_236();

  }
  else
  {
    v36 = *(NSObject **)(v24 + 296);
    OUTLINED_FUNCTION_25_0();
    v37 = v29;
    sub_2461323DC();
    v38 = OUTLINED_FUNCTION_61_0();
    v39 = OUTLINED_FUNCTION_208(v38);
    v40 = *(void **)(v24 + 368);
    if (v39)
    {
      v41 = OUTLINED_FUNCTION_2();
      a13 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v41 = 136315138;
      v42 = objc_msgSend(v40, sel_shortcutName);
      v43 = sub_246132484();
      v45 = v44;

      *(_QWORD *)(v41 + 4) = sub_246119920(v43, v45, &a13);
      OUTLINED_FUNCTION_17_0();

      OUTLINED_FUNCTION_22(&dword_246105000, v36, v25, "VoiceShortcut %s is not eligible for autocomplete. Skipping processing", (uint8_t *)v41);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }

    v46 = OUTLINED_FUNCTION_138();
    v47(v46);
  }
LABEL_10:
  v54 = *(_QWORD *)(v24 + 360) + 1;
  if (v54 == *(_QWORD *)(v24 + 344))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_0();
    v55 = sub_2461323DC();
    v56 = sub_2461325BC();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_DWORD *)v57 = 134217984;
      OUTLINED_FUNCTION_23_2();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_22(&dword_246105000, v55, v56, "%ld phrase(s) created from Voice Shortcuts", v57);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_258();

    OUTLINED_FUNCTION_124(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
    OUTLINED_FUNCTION_23_2();
    v58 = OUTLINED_FUNCTION_49();
    v59 = sub_24611A22C(v58);
    OUTLINED_FUNCTION_47();
    sub_246126654((unint64_t)v59);
    OUTLINED_FUNCTION_257();
    __swift_destroy_boxed_opaque_existential_1Tm(v24 + 80);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_71();
    return OUTLINED_FUNCTION_53_1((uint64_t)v59, *(uint64_t (**)(void))(v24 + 8));
  }
  else
  {
    *(_QWORD *)(v24 + 360) = v54;
    v61 = *(_QWORD *)(v24 + 336);
    if ((v61 & 0xC000000000000001) != 0)
      v62 = (id)MEMORY[0x249550420]();
    else
      v62 = *(id *)(v61 + 8 * v54 + 32);
    *(_QWORD *)(v24 + 368) = v62;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v24 + 80), *(_QWORD *)(v24 + 104));
    v63 = (_QWORD *)OUTLINED_FUNCTION_176();
    *(_QWORD *)(v24 + 376) = v63;
    v64 = OUTLINED_FUNCTION_167(v63, (uint64_t)sub_24611FB7C);
    return OUTLINED_FUNCTION_140(v64, v65, v66, v67, a12);
  }
}

uint64_t sub_24611FF5C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[14] = a2;
  v2[15] = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  v2[16] = swift_task_alloc();
  v3 = sub_2461322C8();
  v2[17] = v3;
  v2[18] = *(_QWORD *)(v3 - 8);
  v2[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4A8);
  v2[22] = swift_task_alloc();
  v4 = sub_246131FF8();
  v2[23] = v4;
  v2[24] = *(_QWORD *)(v4 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFC0);
  v2[27] = swift_task_alloc();
  v5 = sub_246132178();
  v2[28] = v5;
  v2[29] = *(_QWORD *)(v5 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v6 = sub_2461323E8();
  v2[32] = v6;
  v2[33] = *(_QWORD *)(v6 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246120148()
{
  NSObject *v0;
  NSObject *v1;
  Class isa;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  Class v6;
  uint64_t v7;
  uint8_t *v8;
  Class v9;
  objc_class *v10;
  uint64_t v11;
  Class v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  Class v16;
  char v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  id v20;
  Class v21;
  Class v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, Class, uint64_t);
  NSObject *v26;
  objc_class *v27;
  objc_class *v28;
  Class v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t result;
  objc_class *v40;
  Class v41;
  objc_class *v42;
  objc_class *v43;
  Class v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t isa_low;
  Class v55;
  Class v56;
  Class v57;
  uint64_t v58;
  Class v59;
  char v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t isa_high;
  _QWORD *v73;
  Class v74;
  uint64_t v75;
  Class v76;
  uint64_t v77;
  void (*v78)(objc_class *, uint64_t, Class);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  BOOL v83;
  _QWORD *v85;
  uint64_t v86;
  Class v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  void (*v93)(uint64_t);
  uint64_t v94;
  Class v95;
  Class v96;
  Class v97;
  Class v98;
  uint64_t v99;
  Class v100;
  _QWORD *v101;
  objc_class *v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;

  v1 = v0;
  isa = v0[40].isa;
  OUTLINED_FUNCTION_25_0();
  sub_2461323DC();
  v3 = OUTLINED_FUNCTION_61_0();
  if (OUTLINED_FUNCTION_35_1(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_2() = 0;
    OUTLINED_FUNCTION_113(&dword_246105000, v4, v5, "StaticSuggestionsSource: fetching phrases from static list file");
    OUTLINED_FUNCTION_0();
  }
  v6 = v0[33].isa;
  v8 = (uint8_t *)v1[27].isa;
  v7 = (uint64_t)v1[28].isa;
  v9 = v1[14].isa;

  v10 = (objc_class *)*((_QWORD *)v6 + 1);
  v1[41].isa = v10;
  v11 = OUTLINED_FUNCTION_138();
  ((void (*)(uint64_t))v10)(v11);
  OUTLINED_FUNCTION_108((Class)((char *)v9 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider), *(_QWORD *)((char *)v9 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider + 24));
  sub_246125D34((uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v7) == 1)
  {
    v12 = v1[39].isa;
    sub_2461239E0((uint64_t)v1[27].isa, &qword_25754AFC0);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v13 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_35_1(v13))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_112(&dword_246105000, v14, v15, "StaticSuggestionsSource: unable to get the currentDeviceType. Returning 0 phrases");
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_171();
    goto LABEL_18;
  }
  v16 = v1[14].isa;
  (*((void (**)(Class, Class, Class))v1[29].isa + 4))(v1[31].isa, v1[27].isa, v1[28].isa);
  OUTLINED_FUNCTION_108((Class)((char *)v16 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider), *(_QWORD *)((char *)v16 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider + 24));
  sub_246125B0C();
  v17 = sub_2461324E4();
  OUTLINED_FUNCTION_46();
  if ((v17 & 1) == 0)
  {
    v29 = v1[38].isa;
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v30 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_35_1(v30))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_112(&dword_246105000, v31, v32, "SiriSuggestionsPoolSource: siriLocale not en. Returning 0 phrases");
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_17;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v20 = sub_24612CB94(0xD000000000000019, 0x80000002461348F0, 0x7473696C70, 0xE500000000000000, v19);

  if (!v20)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v1[22].isa, 1, 1, (uint64_t)v1[23].isa);
LABEL_15:
    v29 = v1[34].isa;
    sub_2461239E0((uint64_t)v1[22].isa, &qword_25441C4A8);
    OUTLINED_FUNCTION_25_0();
    sub_2461323DC();
    v33 = OUTLINED_FUNCTION_61_0();
    if (OUTLINED_FUNCTION_35_1(v33))
    {
      *(_WORD *)OUTLINED_FUNCTION_2() = 0;
      OUTLINED_FUNCTION_112(&dword_246105000, v34, v35, "SiriSuggestionsPoolSource: unable to get URL to filePath. Returning 0 phrases");
      OUTLINED_FUNCTION_0();
    }
LABEL_17:

    OUTLINED_FUNCTION_171();
    v36 = OUTLINED_FUNCTION_151();
    v37(v36);
LABEL_18:
    v38 = MEMORY[0x24BEE4AF8];
LABEL_19:
    v111 = v38;
    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_164();
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_146();
    swift_task_dealloc();
    OUTLINED_FUNCTION_245();
    OUTLINED_FUNCTION_115();
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_71();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_98(v111, (uint64_t (*)(void))v1[1].isa);
  }
  v22 = v1[24].isa;
  v21 = v1[25].isa;
  v24 = (uint64_t)v1[22].isa;
  v23 = (uint64_t)v1[23].isa;
  sub_246131FEC();

  v25 = (void (*)(uint64_t, Class, uint64_t))*((_QWORD *)v22 + 4);
  v25(v24, v21, v23);
  __swift_storeEnumTagSinglePayload(v24, 0, 1, v23);
  if (__swift_getEnumTagSinglePayload(v24, 1, v23) == 1)
    goto LABEL_15;
  v25((uint64_t)v1[26].isa, v1[22].isa, (uint64_t)v1[23].isa);
  sub_246131FBC();
  OUTLINED_FUNCTION_57_0();
  v26 = sub_246131FB0();
  v1[42].isa = (Class)v26;
  v1[43].isa = (Class)sub_246132004();
  v1[44].isa = v27;
  v110 = v1;
  LOBYTE(v28) = (_BYTE)v27;
  sub_246123924();
  sub_246131FA4();
  v40 = (objc_class *)MEMORY[0x24BEE4AF8];
  v103 = v1 + 9;
  v41 = v1[11].isa;
  v1[45].isa = v41;
  v1[9].isa = v40;
  v42 = (objc_class *)*((_QWORD *)v41 + 2);
  v1[46].isa = v42;
  if (!v42)
  {
    swift_bridgeObjectRelease();
    v88 = (Class)MEMORY[0x24BEE4AF8];
LABEL_80:
    v26 = v1[14].isa;
    v89 = OUTLINED_FUNCTION_11_3();
    sub_24612F748(v89);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_230();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_221();
    LOBYTE(v28) = OUTLINED_FUNCTION_61_0();
    if (!OUTLINED_FUNCTION_126((os_log_type_t)v28))
    {
      OUTLINED_FUNCTION_17_0();
      v91 = OUTLINED_FUNCTION_217();
      sub_2461098E4(v91, v92);
      OUTLINED_FUNCTION_17_0();
      v93 = (void (*)(uint64_t))v1[41].isa;
      v94 = (uint64_t)v1[31].isa;
      v95 = v1[29].isa;
      v96 = v110[26].isa;
      v97 = v110[24].isa;
      v98 = v110[23].isa;
      swift_release();

      v99 = OUTLINED_FUNCTION_151();
      v93(v99);
      v100 = v96;
      v1 = v110;
      (*((void (**)(Class, Class))v97 + 1))(v100, v98);
      OUTLINED_FUNCTION_185(v94, *((uint64_t (**)(uint64_t, uint64_t))v95 + 1));
      OUTLINED_FUNCTION_23_2();
      v38 = (uint64_t)v110[9].isa;
      goto LABEL_19;
    }
    v8 = (uint8_t *)OUTLINED_FUNCTION_2();
    *(_DWORD *)v8 = 134217984;
    if (!((unint64_t)v88 >> 62))
    {
      v90 = *(_QWORD *)(((unint64_t)v88 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_83;
    }
LABEL_87:
    OUTLINED_FUNCTION_11_3();
    v90 = sub_246132724();
    OUTLINED_FUNCTION_17_0();
LABEL_83:
    OUTLINED_FUNCTION_17_0();
    v110[10].isa = (Class)v90;
    sub_246132610();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_22(&dword_246105000, v26, (os_log_type_t)v28, "%ld phrase(s) created from static list using StaticSuggestionsSource", v8);
    OUTLINED_FUNCTION_0();
  }
  v43 = 0;
  v1[47].isa = (Class)OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider;
  LODWORD(v1[65].isa) = *MEMORY[0x24BEA6E40];
  HIDWORD(v1[65].isa) = *MEMORY[0x24BE91910];
  while (1)
  {
    v1[48].isa = v43;
    v44 = v1[45].isa;
    if ((unint64_t)v43 >= *((_QWORD *)v44 + 2))
    {
      __break(1u);
      goto LABEL_87;
    }
    v45 = (_QWORD *)((char *)v44 + 104 * (_QWORD)v43);
    v1[49].isa = (Class)v45[4];
    v1[50].isa = (Class)v45[5];
    v1[51].isa = (Class)v45[6];
    v8 = (uint8_t *)v45[7];
    v1[52].isa = (Class)v8;
    v1[53].isa = (Class)v45[8];
    v1[54].isa = (Class)v45[9];
    v46 = (_QWORD *)v45[10];
    v1[55].isa = (Class)v46;
    v47 = v45[12];
    v112 = v45[11];
    v1[56].isa = (Class)v47;
    v1[57].isa = (Class)v45[13];
    v28 = (objc_class *)v45[14];
    v1[58].isa = v28;
    v107 = v45[15];
    v1[59].isa = (Class)v107;
    v48 = v45[16];
    v1[60].isa = (Class)v48;
    v108 = v48;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_49();
    v109 = v47;
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_40();
    v49 = sub_24613216C();
    v51 = v50;
    v26 = v46[2];
    if (v26)
    {
      v52 = v49;
      v53 = v46[4] == v49 && v46[5] == v50;
      if (v53 || (OUTLINED_FUNCTION_83() & 1) != 0)
      {
LABEL_29:
        isa_low = LODWORD(v1[65].isa);
        v55 = v1[30].isa;
        v56 = v1[28].isa;
        v57 = v1[29].isa;
        OUTLINED_FUNCTION_11_2();
        OUTLINED_FUNCTION_4_1();
        (*((void (**)(Class, uint64_t, Class))v57 + 13))(v55, isa_low, v56);
        sub_246123960();
        v58 = v109;
        OUTLINED_FUNCTION_17_2();
        OUTLINED_FUNCTION_234();
        OUTLINED_FUNCTION_234();
        v59 = v1[29].isa;
        if (v1[7].isa == v1[5].isa && v1[8].isa == v1[6].isa)
        {
          OUTLINED_FUNCTION_44_1();
          OUTLINED_FUNCTION_116(*((uint64_t (**)(uint64_t, uint64_t))v59 + 1));
        }
        else
        {
          v61 = OUTLINED_FUNCTION_188();
          OUTLINED_FUNCTION_10_0();
          OUTLINED_FUNCTION_17_0();
          OUTLINED_FUNCTION_116(*((uint64_t (**)(uint64_t, uint64_t))v59 + 1));
          if ((v61 & 1) == 0)
          {
            v62 = v112;
LABEL_45:
            v1[61].isa = (Class)v62;
            v1[62].isa = (Class)v58;
            if (v108)
            {
              v101 = (_QWORD *)((char *)v1[14].isa + (unint64_t)v1[47].isa);
              OUTLINED_FUNCTION_108(v101, v101[3]);
              OUTLINED_FUNCTION_49();
              v102 = (objc_class *)swift_task_alloc();
              v1[63].isa = v102;
              *(_QWORD *)v102 = v1;
              *((_QWORD *)v102 + 1) = sub_246120D54;
              return OUTLINED_FUNCTION_99(v107, v108);
            }
            v68 = (uint64_t)v1[52].isa;
            v69 = (uint64_t)v1[53].isa;
            v104 = (uint64_t)v1[54].isa;
            v70 = (uint64_t)v1[51].isa;
            v71 = v62;
            isa_high = HIDWORD(v1[65].isa);
            v8 = (uint8_t *)v1[20].isa;
            v73 = v1[21].isa;
            v28 = v1[19].isa;
            v74 = v110[18].isa;
            v75 = v58;
            v76 = v110[17].isa;
            v77 = (uint64_t)v110[16].isa;
            sub_24612F540(v70, v68, v69, v104, v71, v75, v73);
            OUTLINED_FUNCTION_137();
            v78 = (void (*)(objc_class *, uint64_t, Class))*((_QWORD *)v74 + 13);
            v1 = v110;
            v78(v28, isa_high, v76);
            sub_2461239A0((uint64_t)v73, (uint64_t)v8, &qword_25441C538);
            v79 = OUTLINED_FUNCTION_94();
            __swift_storeEnumTagSinglePayload(v77, 1, 1, v79);
            OUTLINED_FUNCTION_119();
            OUTLINED_FUNCTION_56();
            sub_246132328();
            OUTLINED_FUNCTION_11_2();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_220();
            OUTLINED_FUNCTION_55();
            OUTLINED_FUNCTION_200();
            v80 = OUTLINED_FUNCTION_54_0();
            v26 = v103;
            MEMORY[0x2495502AC](v80);
            if (*(_QWORD *)(((uint64_t)v1[9].isa & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((uint64_t)v1[9].isa & 0xFFFFFFFFFFFFFF8)
                                                                                             + 0x18) >> 1)
              OUTLINED_FUNCTION_169();
            v81 = (uint64_t)v110[21].isa;
            OUTLINED_FUNCTION_238();
            sub_246132544();
            OUTLINED_FUNCTION_55_0();
            sub_2461239E0(v81, &qword_25441C538);
            goto LABEL_49;
          }
        }
        OUTLINED_FUNCTION_4_1();
        v63 = sub_2461321B4();
        if (*(_QWORD *)(v63 + 16))
        {
          OUTLINED_FUNCTION_17_2();
          v64 = sub_24612ACE4(v112, v109);
          if ((v65 & 1) != 0)
          {
            v66 = (uint64_t *)(*(_QWORD *)(v63 + 56) + 16 * v64);
            v62 = *v66;
            v67 = v66[1];
            OUTLINED_FUNCTION_49();
          }
          else
          {
            v62 = 0;
            v67 = 0xE000000000000000;
          }
          OUTLINED_FUNCTION_4_1();
        }
        else
        {
          v62 = 0;
          v67 = 0xE000000000000000;
        }
        OUTLINED_FUNCTION_46();
        v58 = v67;
        goto LABEL_45;
      }
      if (v26 != 1)
      {
        v82 = v46[6] == v52 && v46[7] == v51;
        if (v82 || (OUTLINED_FUNCTION_83() & 1) != 0)
          goto LABEL_29;
        if (v26 != 2)
        {
          v83 = v46[8] == v52 && v46[9] == v51;
          if (v83 || (OUTLINED_FUNCTION_83() & 1) != 0)
            goto LABEL_29;
          if (v26 != 3)
          {
            if (v46[10] == v52 && v46[11] == v51)
              goto LABEL_29;
            result = OUTLINED_FUNCTION_83();
            if ((result & 1) != 0)
              goto LABEL_29;
            if (v26 != 4)
              break;
          }
        }
      }
    }
LABEL_40:
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_200();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_220();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_44_1();
LABEL_49:
    OUTLINED_FUNCTION_133();
    if (v53)
    {
      swift_bridgeObjectRelease();
      v88 = v1[9].isa;
      goto LABEL_80;
    }
  }
  v85 = v46 + 13;
  v86 = 4;
  while (!__OFADD__(v86, 1))
  {
    v105 = (v86 + 1);
    v106 = v86;
    if (*(v85 - 1) == v52 && *v85 == v51)
      goto LABEL_29;
    result = OUTLINED_FUNCTION_83();
    if ((result & 1) != 0)
      goto LABEL_29;
    v86 = v106 + 1;
    v85 += 2;
    if (v105 == v26)
      goto LABEL_40;
  }
  __break(1u);
  return result;
}

uint64_t sub_246120D54()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_38_1();
  *(_QWORD *)(v1 + 512) = v0;
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246120D90()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  _QWORD *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  unint64_t v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v1 = *(_QWORD *)(v0 + 512);
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_3;
LABEL_12:
    OUTLINED_FUNCTION_46();
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_37();
  v16 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (v16 != 1)
    goto LABEL_12;
  OUTLINED_FUNCTION_37();
  v17 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v17)
    goto LABEL_12;
LABEL_3:
  sub_246113738(0, (v1 & 0xC000000000000001) == 0);
  v2 = *(_QWORD *)(v0 + 512);
  if ((v1 & 0xC000000000000001) != 0)
LABEL_76:
    MEMORY[0x249550420](0, v2);
  else
    OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_47();
  v3 = sub_246132118();
  v5 = v4;
  OUTLINED_FUNCTION_48_0();
  if (v5)
  {
    v6 = *(NSObject **)(v0 + 480);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_168();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_160();
    v7 = OUTLINED_FUNCTION_62();
    v8 = OUTLINED_FUNCTION_21(v7);
    v9 = *(_QWORD *)(v0 + 480);
    if (v8)
    {
      v10 = *(_QWORD *)(v0 + 472);
      v11 = (uint8_t *)OUTLINED_FUNCTION_2();
      v80 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v11 = 136315138;
      OUTLINED_FUNCTION_15_1();
      *(_QWORD *)(v0 + 104) = sub_246119920(v10, v9, &v80);
      OUTLINED_FUNCTION_201();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_22(&dword_246105000, v6, (os_log_type_t)v1, "StaticSuggestionApprovedPhrase: 1 app detected for %s changing to the app's bundleId", v11);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_0();
    }
    v12 = *(void (**)(uint64_t))(v0 + 328);

    OUTLINED_FUNCTION_44_1();
    v13 = OUTLINED_FUNCTION_138();
    v12(v13);
    v14 = v5;
    v15 = v3;
    goto LABEL_14;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(v0 + 488);
  v14 = *(_QWORD *)(v0 + 496);
LABEL_14:
  while (2)
  {
    v18 = *(unsigned int *)(v0 + 524);
    v19 = *(_QWORD **)(v0 + 168);
    v20 = *(_QWORD *)(v0 + 144);
    v21 = *(_QWORD *)(v0 + 152);
    v22 = *(_QWORD *)(v0 + 136);
    v72 = *(_QWORD *)(v0 + 160);
    v73 = *(_QWORD *)(v0 + 128);
    sub_24612F540(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 432), v15, v14, v19);
    OUTLINED_FUNCTION_137();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 104))(v21, v18, v22);
    sub_2461239A0((uint64_t)v19, v72, &qword_25441C538);
    v23 = OUTLINED_FUNCTION_94();
    __swift_storeEnumTagSinglePayload(v73, 1, 1, v23);
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_17_2();
    v2 = sub_246132328();
    OUTLINED_FUNCTION_11_2();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_200();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_1();
    swift_bridgeObjectRelease();
    v24 = OUTLINED_FUNCTION_54_0();
    MEMORY[0x2495502AC](v24);
    if (*(_QWORD *)((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      OUTLINED_FUNCTION_169();
    v1 = *(_QWORD *)(v0 + 168);
    OUTLINED_FUNCTION_238();
    sub_246132544();
    OUTLINED_FUNCTION_55_0();
    sub_2461239E0(v1, &qword_25441C538);
    while (1)
    {
      OUTLINED_FUNCTION_133();
      if (v36)
      {
        swift_bridgeObjectRelease();
        v57 = *(_QWORD *)(v0 + 72);
        v58 = *(NSObject **)(v0 + 112);
        v59 = OUTLINED_FUNCTION_49();
        sub_24612F748(v59);
        OUTLINED_FUNCTION_47();
        OUTLINED_FUNCTION_189();
        OUTLINED_FUNCTION_136();
        OUTLINED_FUNCTION_210();
        v60 = OUTLINED_FUNCTION_61_0();
        if (OUTLINED_FUNCTION_126(v60))
        {
          v61 = (uint8_t *)OUTLINED_FUNCTION_2();
          *(_DWORD *)v61 = 134217984;
          if (v57 >> 62)
          {
            OUTLINED_FUNCTION_49();
            v62 = OUTLINED_FUNCTION_214();
            OUTLINED_FUNCTION_47();
          }
          else
          {
            v62 = *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          OUTLINED_FUNCTION_47();
          *(_QWORD *)(v0 + 80) = v62;
          sub_246132610();
          OUTLINED_FUNCTION_47();
          OUTLINED_FUNCTION_22(&dword_246105000, v58, v60, "%ld phrase(s) created from static list using StaticSuggestionsSource", v61);
          OUTLINED_FUNCTION_0();
        }
        v64 = *(_QWORD *)(v0 + 344);
        v63 = *(_QWORD *)(v0 + 352);
        OUTLINED_FUNCTION_47();
        sub_2461098E4(v64, v63);
        OUTLINED_FUNCTION_47();
        v65 = *(void (**)(uint64_t))(v0 + 328);
        v77 = *(_QWORD *)(v0 + 248);
        v66 = *(_QWORD *)(v0 + 232);
        v67 = *(_QWORD *)(v0 + 192);
        swift_release();

        v68 = OUTLINED_FUNCTION_151();
        v65(v68);
        OUTLINED_FUNCTION_124(*(uint64_t (**)(uint64_t, uint64_t))(v67 + 8));
        OUTLINED_FUNCTION_185(v77, *(uint64_t (**)(uint64_t, uint64_t))(v66 + 8));
        OUTLINED_FUNCTION_23_2();
        v79 = *(_QWORD *)(v0 + 72);
        OUTLINED_FUNCTION_62_0();
        OUTLINED_FUNCTION_164();
        OUTLINED_FUNCTION_129();
        OUTLINED_FUNCTION_146();
        swift_task_dealloc();
        OUTLINED_FUNCTION_245();
        OUTLINED_FUNCTION_115();
        OUTLINED_FUNCTION_107();
        OUTLINED_FUNCTION_65_0();
        OUTLINED_FUNCTION_71();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return OUTLINED_FUNCTION_98(v79, *(uint64_t (**)(void))(v0 + 8));
      }
      *(_QWORD *)(v0 + 384) = v25;
      v26 = *(_QWORD *)(v0 + 360);
      if (v25 >= *(_QWORD *)(v26 + 16))
      {
        __break(1u);
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
      v27 = (_QWORD *)(v26 + 104 * v25);
      *(_QWORD *)(v0 + 392) = v27[4];
      v1 = v27[5];
      *(_QWORD *)(v0 + 400) = v1;
      *(_QWORD *)(v0 + 408) = v27[6];
      *(_QWORD *)(v0 + 416) = v27[7];
      *(_QWORD *)(v0 + 424) = v27[8];
      *(_QWORD *)(v0 + 432) = v27[9];
      v28 = (_QWORD *)v27[10];
      *(_QWORD *)(v0 + 440) = v28;
      v29 = v27[11];
      v2 = v27[12];
      *(_QWORD *)(v0 + 448) = v2;
      *(_QWORD *)(v0 + 456) = v27[13];
      *(_QWORD *)(v0 + 464) = v27[14];
      v74 = v27[15];
      v75 = v29;
      *(_QWORD *)(v0 + 472) = v74;
      v30 = v27[16];
      *(_QWORD *)(v0 + 480) = v30;
      v76 = v30;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_136();
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_15_1();
      OUTLINED_FUNCTION_17_2();
      v78 = v2;
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_11();
      v31 = sub_24613216C();
      v33 = v32;
      v34 = v28[2];
      if (v34)
        break;
LABEL_52:
      OUTLINED_FUNCTION_200();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_220();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_13_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_44_1();
    }
    v35 = v31;
    v36 = v28[4] == v31 && v28[5] == v32;
    if (!v36 && (OUTLINED_FUNCTION_73() & 1) == 0)
    {
      if (v34 != 1)
      {
        v37 = v28[6] == v35 && v28[7] == v33;
        if (v37 || (OUTLINED_FUNCTION_73() & 1) != 0)
          goto LABEL_53;
        if (v34 != 2)
        {
          v38 = v28[8] == v35 && v28[9] == v33;
          if (v38 || (OUTLINED_FUNCTION_73() & 1) != 0)
            goto LABEL_53;
          if (v34 != 3)
          {
            v39 = v28[10] == v35 && v28[11] == v33;
            if (v39 || (OUTLINED_FUNCTION_73() & 1) != 0)
              goto LABEL_53;
            if (v34 != 4)
            {
              v40 = v28 + 13;
              v2 = 4;
              while (1)
              {
                v1 = v2 + 1;
                if (__OFADD__(v2, 1))
                  goto LABEL_75;
                v41 = *(v40 - 1) == v35 && *v40 == v33;
                if (v41 || (OUTLINED_FUNCTION_73() & 1) != 0)
                  goto LABEL_53;
                ++v2;
                v40 += 2;
                if (v1 == v34)
                  goto LABEL_52;
              }
            }
          }
        }
      }
      goto LABEL_52;
    }
LABEL_53:
    v42 = *(unsigned int *)(v0 + 520);
    v43 = *(_QWORD *)(v0 + 240);
    v44 = *(_QWORD *)(v0 + 224);
    v45 = *(_QWORD *)(v0 + 232);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_17_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 104))(v43, v42, v44);
    sub_246123960();
    v46 = v78;
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_218();
    OUTLINED_FUNCTION_218();
    v47 = *(_QWORD *)(v0 + 232);
    if (*(_QWORD *)(v0 + 56) == *(_QWORD *)(v0 + 40) && *(_QWORD *)(v0 + 64) == *(_QWORD *)(v0 + 48))
    {
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_116(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
      goto LABEL_60;
    }
    v49 = OUTLINED_FUNCTION_188();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_116(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
    if ((v49 & 1) != 0)
    {
LABEL_60:
      OUTLINED_FUNCTION_13_0();
      v52 = sub_2461321B4();
      v51 = v76;
      if (*(_QWORD *)(v52 + 16))
      {
        OUTLINED_FUNCTION_11();
        v53 = sub_24612ACE4(v75, v78);
        if ((v54 & 1) != 0)
        {
          v55 = (uint64_t *)(*(_QWORD *)(v52 + 56) + 16 * v53);
          v50 = *v55;
          v56 = v55[1];
          OUTLINED_FUNCTION_49();
        }
        else
        {
          v50 = 0;
          v56 = 0xE000000000000000;
        }
        OUTLINED_FUNCTION_13_0();
      }
      else
      {
        v50 = 0;
        v56 = 0xE000000000000000;
      }
      OUTLINED_FUNCTION_46();
      v46 = v56;
      goto LABEL_67;
    }
    v50 = v75;
    v51 = v76;
LABEL_67:
    *(_QWORD *)(v0 + 488) = v50;
    *(_QWORD *)(v0 + 496) = v46;
    v14 = v46;
    v15 = v50;
    if (!v51)
      continue;
    break;
  }
  v69 = (_QWORD *)(*(_QWORD *)(v0 + 112) + *(_QWORD *)(v0 + 376));
  OUTLINED_FUNCTION_108(v69, v69[3]);
  OUTLINED_FUNCTION_11_3();
  v70 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 504) = v70;
  OUTLINED_FUNCTION_227(v70, (uint64_t)sub_246120D54);
  return OUTLINED_FUNCTION_99(v74, v51);
}

uint64_t sub_246121640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (_QWORD *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider);
  v8[3] = type metadata accessor for DefaultLocaleProvider();
  v8[4] = &off_25173BE50;
  *v8 = a1;
  v9 = (_QWORD *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider);
  v9[3] = type metadata accessor for DefaultDeviceTypeProvider();
  v9[4] = &off_25173BE40;
  *v9 = a2;
  v10 = (_QWORD *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider);
  v10[3] = type metadata accessor for DefaultAppFinderForIntentProvider();
  v10[4] = &off_25173BE30;
  *v10 = a3;
  v11 = a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_source;
  v12 = *MEMORY[0x24BE91910];
  v13 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
  return a4;
}

uint64_t sub_246121730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_246121814()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246121898);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246121898(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_2461218C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_246121B24()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246121B50()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_27_2();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  OUTLINED_FUNCTION_15_3(v1, (uint64_t)sub_246121B94);
  return OUTLINED_FUNCTION_10_2();
}

uint64_t sub_246121B94(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246121BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_246121CA4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246121D28);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246121D28(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246121D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_246121FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_246122098()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_24612211C);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_24612211C(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246122148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_2461223A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_24612248C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246122510);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246122510(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_24612253C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_24612279C);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_24612279C()
{
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_2461227C8()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_27_2();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  OUTLINED_FUNCTION_15_3(v1, (uint64_t)sub_24612280C);
  return OUTLINED_FUNCTION_10_2();
}

uint64_t sub_24612280C(uint64_t a1)
{
  OUTLINED_FUNCTION_3_3(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246122838()
{
  uint64_t v0;

  OUTLINED_FUNCTION_182();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_253();
  OUTLINED_FUNCTION_244();
  swift_release();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_71();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_91(*(_QWORD *)(v0 + 152), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2461228E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2461229C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246122A48);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246122A48(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246122A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_246122CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_246122DB8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246122E3C);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246122E3C(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_246122E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_2461230C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v7 + 160) = a6;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a7;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754AF78);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  v8 = sub_2461323C4();
  *(_QWORD *)(v7 + 88) = v8;
  *(_QWORD *)(v7 + 96) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  swift_retain();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2461231AC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_158(v1);
  if (qword_25754A778 != -1)
    swift_once();
  OUTLINED_FUNCTION_66_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v0 + 120) = v2;
  v3 = OUTLINED_FUNCTION_21_2(v2, (uint64_t)sub_246123230);
  return OUTLINED_FUNCTION_19_3(v3, v4, v5);
}

uint64_t sub_246123230(uint64_t a1)
{
  OUTLINED_FUNCTION_2_4(a1);
  OUTLINED_FUNCTION_8_3();
  return OUTLINED_FUNCTION_0_2();
}

void sub_24612325C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_147();
  if (!v17)
  {
    OUTLINED_FUNCTION_148();
    if (v11)
      goto LABEL_3;
LABEL_17:
    OUTLINED_FUNCTION_70();
    v20 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_24_0();
  v11 = OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_46();
  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_22_0();
  do
  {
    if (v15)
      OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_150();
    if (!v18)
      swift_once();
    OUTLINED_FUNCTION_76();
    if ((v19 & 1) != 0)
    {
      OUTLINED_FUNCTION_110();
    }
    else
    {
      OUTLINED_FUNCTION_131();
      OUTLINED_FUNCTION_34_1();
      OUTLINED_FUNCTION_51_1();
      OUTLINED_FUNCTION_132();
    }
    OUTLINED_FUNCTION_149();
  }
  while (!v18);
  OUTLINED_FUNCTION_70();
  v20 = a11;
  if (a11 < 0)
    goto LABEL_40;
LABEL_18:
  if ((v20 & 0x4000000000000000) == 0)
  {
    v21 = *(_QWORD *)(v20 + 16);
    OUTLINED_FUNCTION_54_0();
    if (!v21)
    {
LABEL_39:
      OUTLINED_FUNCTION_32_1();
      sub_2461323B8();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_74();
      OUTLINED_FUNCTION_28_1((_QWORD *)(v14 + 16));
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v12 + 136) = v36;
      OUTLINED_FUNCTION_39_1(v36, (uint64_t)sub_246121B24);
      OUTLINED_FUNCTION_4_7();
      return;
    }
    goto LABEL_20;
  }
LABEL_40:
  OUTLINED_FUNCTION_54_0();
  v21 = sub_246132724();
  if (!v21)
    goto LABEL_39;
LABEL_20:
  if (v21 >= 1)
  {
    OUTLINED_FUNCTION_56_0();
    do
    {
      if (a10)
        OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_82();
      if (v23 && (OUTLINED_FUNCTION_30_1(v22), (v24 & 1) != 0))
      {
        v25 = OUTLINED_FUNCTION_33_1();
        OUTLINED_FUNCTION_7_3(v25);
        v26 = OUTLINED_FUNCTION_153();
      }
      else
      {
        OUTLINED_FUNCTION_45_1();
        v26 = OUTLINED_FUNCTION_88();
      }
      OUTLINED_FUNCTION_84(v26, v27);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_45_1();
      v28 = OUTLINED_FUNCTION_18_3();
      if (v18)
        sub_2461239E0(v28, &qword_25754AF78);
      else
        OUTLINED_FUNCTION_130(v28);
      OUTLINED_FUNCTION_80();
      sub_246132334();
      OUTLINED_FUNCTION_82();
      if (v30 && (v29 = OUTLINED_FUNCTION_30_1(v29), (v31 & 1) != 0))
      {
        v29 = OUTLINED_FUNCTION_20_3(v29);
        v32 = 0;
      }
      else
      {
        v32 = 1;
      }
      OUTLINED_FUNCTION_16_2(v29, v32);
      OUTLINED_FUNCTION_29_1();
      if (v18)
      {
        sub_2461239E0(v16, &qword_25754AF78);
        v33 = OUTLINED_FUNCTION_94();
        OUTLINED_FUNCTION_36_1(v33);
      }
      else
      {
        v34 = OUTLINED_FUNCTION_87();
        sub_2461239A0(v34, v35, &qword_25441C4B0);
        OUTLINED_FUNCTION_134();
      }
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_109();
    }
    while (v21 != v13);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

uint64_t sub_2461234BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v22[3];
  uint64_t v23;
  _UNKNOWN **v24;
  _QWORD v25[3];
  uint64_t v26;
  _UNKNOWN **v27;
  _QWORD v28[3];
  uint64_t v29;
  _UNKNOWN **v30;

  v29 = type metadata accessor for DefaultLocaleProvider();
  v30 = &off_25173BE50;
  v28[0] = a1;
  v26 = type metadata accessor for DefaultDeviceTypeProvider();
  v27 = &off_25173BE40;
  v25[0] = a2;
  v23 = type metadata accessor for DefaultAppFinderForIntentProvider();
  v24 = &off_25173BE30;
  v22[0] = a3;
  type metadata accessor for StaticSuggestionsSource();
  v6 = swift_allocObject();
  v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)&v22[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (_QWORD *)((char *)&v22[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (_QWORD *)((char *)&v22[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = sub_246121640(*v9, *v13, *v17, v6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v19;
}

uint64_t method lookup function for SiriAutoCompleteIndexBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.updateIndexForAppInstall(bundleIds:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_12_3();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_228(v1, (uint64_t)sub_2461236C8);
  return OUTLINED_FUNCTION_141(v2, v3);
}

uint64_t sub_2461236C8(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_11_4();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.deletePhrasesFromApp(bundleIds:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_12_3();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_228(v1, (uint64_t)sub_24612374C);
  return OUTLINED_FUNCTION_141(v2, v3);
}

uint64_t sub_24612374C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_11_4();
  return OUTLINED_FUNCTION_142(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.run(firstBuildPostOSInstall:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v3 = (_QWORD *)OUTLINED_FUNCTION_12_3();
  *(_QWORD *)(v1 + 16) = v3;
  OUTLINED_FUNCTION_227(v3, (uint64_t)sub_246124160);
  return v5(a1);
}

uint64_t type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo()
{
  uint64_t result;

  result = qword_25754B0A0;
  if (!qword_25754B0A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246123810(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24612384C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246123894()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

void sub_2461238D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_27();
}

void sub_246123914(void *a1)
{
  uint64_t v1;

  sub_2461071B8(a1, *(_QWORD *)(v1 + 16), v1 + 24, *(_QWORD *)(v1 + 64));
}

unint64_t sub_246123924()
{
  unint64_t result;

  result = qword_25754AFC8;
  if (!qword_25754AFC8)
  {
    result = MEMORY[0x249550960](&unk_246133FEC, &type metadata for StaticSuggestionAprovedPhraseList);
    atomic_store(result, (unint64_t *)&qword_25754AFC8);
  }
  return result;
}

unint64_t sub_246123960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754AFD0;
  if (!qword_25754AFD0)
  {
    v1 = sub_246132178();
    result = MEMORY[0x249550960](MEMORY[0x24BEA6EA0], v1);
    atomic_store(result, (unint64_t *)&qword_25754AFD0);
  }
  return result;
}

void sub_2461239A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_27();
}

void sub_2461239E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_27();
}

uint64_t objectdestroy_25Tm()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246123A50(void *a1)
{
  uint64_t *v1;

  return sub_246112148(a1, v1[2], v1 + 3, v1[8]);
}

uint64_t sub_246123A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246123AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return OUTLINED_FUNCTION_162();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_246123B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_246123B40(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x249550960](MEMORY[0x24BEE12E0], v3), a1);
  }
  OUTLINED_FUNCTION_27();
}

uint64_t *sub_246123B7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_246132034();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_246123C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_246132034();
  result = __swift_getEnumTagSinglePayload(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return result;
}

_QWORD *sub_246123CB0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_246132034();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *sub_246123D5C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_246132034();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    v10 = *(_QWORD *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  return a1;
}

_QWORD *sub_246123E58(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_246132034();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *sub_246123F04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_246132034();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    v10 = *(_QWORD *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  return a1;
}

uint64_t sub_246124000()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24612400C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_246124048()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246124054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

void sub_246124094()
{
  unint64_t v0;

  sub_24612410C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_24612410C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25754B0B0)
  {
    sub_246132034();
    v0 = sub_246132604();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25754B0B0);
  }
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 128) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 152) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return sub_24613225C();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_24612384C(v2 + *(_QWORD *)(*(_QWORD *)(a1 - 8) + 72) * v3, v1);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_246132244();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  return a8();
}

uint64_t OUTLINED_FUNCTION_14_2@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_15_3@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 104);
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v2 + 72), a2, 1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_getEnumTagSinglePayload(v0, 1, v2);
  return *(_QWORD *)(v1 + 80);
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_20_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_24612384C(*(_QWORD *)(v2 + 56) + *(_QWORD *)(*(_QWORD *)(v3 - 8) + 72) * a1, *(_QWORD *)(v1 + 72));
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 32);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_26_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

_QWORD *OUTLINED_FUNCTION_27_2()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 56) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 40));
}

_QWORD *OUTLINED_FUNCTION_28_1(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

unint64_t OUTLINED_FUNCTION_30_1(uint64_t a1)
{
  uint64_t v1;

  return sub_24612ACE4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_2461326DC();
}

BOOL OUTLINED_FUNCTION_35_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_36_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_38_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_39_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

_QWORD *OUTLINED_FUNCTION_42_1()
{
  _QWORD *v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(v0, *(_QWORD *)(v1 + 136));
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return sub_24613231C();
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return sub_2461326E8();
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[23] + 16 * a1;
  v1[33] = *(_QWORD *)(v2 + 32);
  v1[34] = *(_QWORD *)(v2 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_53_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return sub_2461325C8();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v0[19];
  *(_QWORD *)(v1 - 112) = v0[20];
  *(_QWORD *)(v1 - 104) = v2;
  *(_QWORD *)(v1 - 96) = v0[16];
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_63_0()
{
  JUMPOUT(0x249550420);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_2461323AC();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return sub_246132388();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_2461323A0();
}

uint64_t OUTLINED_FUNCTION_68(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_release();
}

void OUTLINED_FUNCTION_76()
{
  sub_24610C75C();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_78()
{
  JUMPOUT(0x249550420);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_246132364();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

_QWORD *OUTLINED_FUNCTION_85(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = __swift_project_boxed_opaque_existential_1(a1, a2);
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(*v2 + 16), *(_QWORD *)(*v2 + 40));
}

uint64_t OUTLINED_FUNCTION_87()
{
  uint64_t v0;
  uint64_t v1;

  return v1 + *(int *)(v0 + 20);
}

uint64_t OUTLINED_FUNCTION_88()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return sub_246132724();
}

uint64_t OUTLINED_FUNCTION_91(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_92(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_246132034();
}

uint64_t OUTLINED_FUNCTION_96@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = a1;
  return swift_continuation_init();
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_99(uint64_t a1, uint64_t a2)
{
  return sub_24612603C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_100(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_101(uint64_t a1, uint64_t a2)
{
  return sub_246115DD8(a1, a2);
}

uint64_t OUTLINED_FUNCTION_102()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_103(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_104(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_105(uint64_t a1, uint64_t a2)
{
  return sub_24612603C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_task_dealloc();
}

_QWORD *OUTLINED_FUNCTION_108(_QWORD *a1, uint64_t a2)
{
  return __swift_project_boxed_opaque_existential_1(a1, a2);
}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_release();
}

id OUTLINED_FUNCTION_111(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, a2, v4, v5, v3);
}

void OUTLINED_FUNCTION_112(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void OUTLINED_FUNCTION_113(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_115()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_116@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_117@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_119()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_120()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 240) = *(_QWORD *)(*(_QWORD *)(v0 + 256) + 16);
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return sub_246132394();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_continuation_await();
}

uint64_t OUTLINED_FUNCTION_124@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_125()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_126(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_246132334();
}

uint64_t OUTLINED_FUNCTION_129()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_130(uint64_t a1)
{
  return sub_246123810(a1);
}

uint64_t OUTLINED_FUNCTION_131()
{
  return sub_2461326B8();
}

uint64_t OUTLINED_FUNCTION_132()
{
  return sub_2461326C4();
}

uint64_t OUTLINED_FUNCTION_134()
{
  uint64_t v0;

  return sub_246123810(v0);
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_137()
{
  return sub_246132370();
}

uint64_t OUTLINED_FUNCTION_138()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_139(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_141(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_142(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_143()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_145()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_146()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_151()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_152(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_153()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_155()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_156(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return a18;
}

uint64_t OUTLINED_FUNCTION_157()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_158(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 112) = result;
  return result;
}

void OUTLINED_FUNCTION_159()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_160()
{
  return sub_2461323DC();
}

uint64_t OUTLINED_FUNCTION_161()
{
  return sub_246132334();
}

uint64_t OUTLINED_FUNCTION_162()
{
  return swift_release();
}

void OUTLINED_FUNCTION_163()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

uint64_t OUTLINED_FUNCTION_164()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_165()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_166()
{
  return sub_246132478();
}

uint64_t OUTLINED_FUNCTION_167@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_168()
{
  return sub_2461323D0();
}

uint64_t OUTLINED_FUNCTION_169()
{
  return sub_246132550();
}

uint64_t OUTLINED_FUNCTION_171()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_173()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_174()
{
  return sub_246132724();
}

uint64_t OUTLINED_FUNCTION_176()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_178()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_179(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 280) = a1;
  return sub_246125B0C();
}

uint64_t OUTLINED_FUNCTION_180(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_181()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 192);
}

uint64_t OUTLINED_FUNCTION_185@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_187(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_246119920(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_188()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_189()
{
  return sub_2461323D0();
}

uint64_t OUTLINED_FUNCTION_191@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_196()
{
  return type metadata accessor for AppShortcutsSource();
}

uint64_t OUTLINED_FUNCTION_197()
{
  return sub_246132478();
}

uint64_t OUTLINED_FUNCTION_198()
{
  return sub_246132334();
}

BOOL OUTLINED_FUNCTION_199(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_200()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_201()
{
  return sub_246132610();
}

id OUTLINED_FUNCTION_202()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_203()
{
  return sub_24613246C();
}

uint64_t OUTLINED_FUNCTION_204()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_205(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[12] = a1;
  v2[13] = a2;
  v2[14] = v3;
  v2[15] = v4;
  return sub_246132040();
}

unint64_t OUTLINED_FUNCTION_206(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_246109704();
}

uint64_t OUTLINED_FUNCTION_207()
{
  return swift_unknownObjectRelease();
}

BOOL OUTLINED_FUNCTION_208(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_209(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_210()
{
  return sub_2461323DC();
}

uint64_t OUTLINED_FUNCTION_211()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_212@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;

  v3[2] = a2;
  v3[3] = v2;
  v3[4] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_214()
{
  return sub_246132724();
}

uint64_t OUTLINED_FUNCTION_215()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_216()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_217()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_218()
{
  return sub_2461324FC();
}

uint64_t OUTLINED_FUNCTION_219()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_220()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_221()
{
  return sub_2461323DC();
}

unint64_t OUTLINED_FUNCTION_222(uint64_t a1, uint64_t a2)
{
  return sub_24612ACE4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_223()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_224(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

BOOL OUTLINED_FUNCTION_225(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

_QWORD *OUTLINED_FUNCTION_226@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

_QWORD *OUTLINED_FUNCTION_227@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_228@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_230()
{
  return sub_2461323D0();
}

uint64_t OUTLINED_FUNCTION_233()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_234()
{
  return sub_2461324FC();
}

uint64_t OUTLINED_FUNCTION_236()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_237()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_238()
{
  return sub_246132568();
}

uint64_t OUTLINED_FUNCTION_239()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_240()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_241()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_243(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246119920(a1, a2, (uint64_t *)(v2 - 80));
}

uint64_t OUTLINED_FUNCTION_244()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_245()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_246()
{
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_247()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_249()
{
  return sub_246132724();
}

uint64_t OUTLINED_FUNCTION_250()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_251()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_252()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24612ACE4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_253()
{
  return sub_24613237C();
}

uint64_t OUTLINED_FUNCTION_255(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 248) = a1;
  return sub_246132280();
}

uint64_t OUTLINED_FUNCTION_256()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_257()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_246124EFC()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = sub_24613246C();
  v0 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 0);
  aBlock[4] = sub_246125048;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_246125090;
  aBlock[3] = &block_descriptor_1;
  v1 = _Block_copy(aBlock);
  objc_msgSend(v0, sel_setFilter_, v1);
  _Block_release(v1);
  v2 = OUTLINED_FUNCTION_0_3();
  if (v2)
  {
    v3 = v2;
    v4 = 1001;
    while (--v4)
    {
      v5 = (void *)MEMORY[0x24955063C]();
      sub_2461250E0(v3, (uint64_t)&v8);
      objc_autoreleasePoolPop(v5);

      v3 = OUTLINED_FUNCTION_0_3();
      if (!v3)
        goto LABEL_7;
    }

  }
LABEL_7:

  return v8;
}

id sub_246125048(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(a1, sel_applicationState);
  v2 = objc_msgSend(v1, sel_isInstalled);

  return v2;
}

uint64_t sub_246125090(uint64_t a1, void *a2)
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

uint64_t sub_2461250E0(void *a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  id v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  char *v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  int v47;
  uint8_t *v48;
  uint8_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _DWORD *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v5 = sub_2461323E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_24612597C(a1);
  if (!v10)
    return result;
  v11 = v10;
  v61 = a2;
  v62 = result;
  v12 = sub_2461259DC(objc_msgSend(a1, sel_compatibilityObject));
  v14 = v13;
  v15 = sub_246132484();
  if (v14)
  {
    if (v12 == v15 && v14 == v16)
      goto LABEL_17;
    v60 = v8;
    v18 = sub_2461327CC();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v60 = v8;
    swift_bridgeObjectRelease();
  }
  v19 = sub_246132484();
  if (!v14)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v12 == v19 && v14 == v20)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v22 = sub_2461327CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    return swift_bridgeObjectRelease();
LABEL_19:
  v23 = objc_msgSend(a1, sel_appTags);
  v24 = sub_24613252C();

  v25 = *(_QWORD *)(v24 + 16);
  if (v25)
  {
    v57 = v5;
    v58 = v6;
    v59 = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26 = sub_2461324E4();
    result = swift_bridgeObjectRelease();
    if ((v26 & 1) != 0)
    {
LABEL_21:
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    if (v25 != 1)
    {
      v27 = v24 + 56;
      v28 = 1;
      while (1)
      {
        v29 = v28 + 1;
        if (__OFADD__(v28, 1))
          break;
        swift_bridgeObjectRetain();
        v30 = sub_2461324E4();
        result = swift_bridgeObjectRelease();
        if ((v30 & 1) != 0)
          goto LABEL_21;
        ++v28;
        v27 += 16;
        if (v29 == v25)
          goto LABEL_28;
      }
      __break(1u);
      return result;
    }
LABEL_28:
    swift_bridgeObjectRelease_n();
    v6 = v58;
    v5 = v57;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if ((objc_msgSend(a1, sel_isLaunchProhibited) & 1) != 0)
    return swift_bridgeObjectRelease();
  v31 = objc_msgSend(a1, sel_appClipMetadata);

  if (v31)
    return swift_bridgeObjectRelease();
  v32 = objc_msgSend(a1, sel_applicationState);
  v33 = objc_msgSend(v32, sel_isRestricted);

  if (v33)
    return swift_bridgeObjectRelease();
  v34 = v62;
  if ((sub_2461324E4() & 1) != 0)
    return swift_bridgeObjectRelease();
  type metadata accessor for DefaultInstalledAppProvider();
  if ((sub_2461256A0(v34, v11) & 1) != 0)
    return swift_bridgeObjectRelease();
  v35 = objc_msgSend((id)objc_opt_self(), sel_appInfoWithApplicationRecord_, a1);
  if (v35)
  {
    v36 = v35;
    v37 = objc_msgSend(a1, sel_localizedName);
    v38 = sub_246132484();
    v40 = v39;

    v41 = objc_msgSend(v36, sel_supportedIntents);
    v42 = sub_24613258C();

    sub_24611173C(v38, v40, v42, v62, v11);
    return swift_bridgeObjectRelease();
  }
  v58 = v6;
  swift_bridgeObjectRelease();
  v43 = v60;
  sub_2461323D0();
  v44 = a1;
  v45 = sub_2461323DC();
  v46 = sub_2461325D4();
  v47 = v46;
  if (os_log_type_enabled(v45, v46))
  {
    LODWORD(v62) = v47;
    v48 = (uint8_t *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    v64 = v61;
    *(_DWORD *)v48 = 136315138;
    v59 = v48 + 4;
    v49 = v48;
    v50 = objc_msgSend(v44, sel_localizedName);
    v51 = sub_246132484();
    v60 = v43;
    v52 = v51;
    v54 = v53;

    v63 = sub_246119920(v52, v54, &v64);
    sub_246132610();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246105000, v45, (os_log_type_t)v62, "Unable to fetch App Info for bundleId: %s", v49, 0xCu);
    v55 = v61;
    swift_arrayDestroy();
    MEMORY[0x249550A14](v55, -1, -1);
    MEMORY[0x249550A14](v49, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v60, v5);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v43, v5);
  }
}

uint64_t sub_2461256A0(uint64_t a1, uint64_t a2)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C5B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2461338A0;
  *(_QWORD *)(inited + 32) = 0xD000000000000016;
  *(_QWORD *)(inited + 40) = 0x8000000246134CC0;
  *(_QWORD *)(inited + 48) = 0xD000000000000011;
  *(_QWORD *)(inited + 56) = 0x8000000246134CE0;
  strcpy((char *)(inited + 64), "com.apple.siri");
  *(_BYTE *)(inited + 79) = -18;
  LOBYTE(a2) = sub_246108384(a1, a2, (_QWORD *)inited);
  swift_setDeallocating();
  sub_24612594C();
  return a2 & 1;
}

uint64_t type metadata accessor for DefaultInstalledAppProvider()
{
  return objc_opt_self();
}

uint64_t destroy for AppMetadata()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16SiriAutoComplete11AppMetadataVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for AppMetadata(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for AppMetadata(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppMetadata(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppMetadata(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppMetadata()
{
  return &type metadata for AppMetadata;
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

uint64_t sub_24612594C()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24612597C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_bundleIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246132484();

  return v3;
}

uint64_t sub_2461259DC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_applicationType);

  if (!v2)
    return 0;
  v3 = sub_246132484();

  return v3;
}

id OUTLINED_FUNCTION_0_3()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 252));
}

uint64_t sub_246125A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_246125ACC;
  return v9(a1, a2, a3);
}

uint64_t sub_246125ACC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_11_4();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v0);
}

uint64_t sub_246125B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_246125B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v1 = sub_246125B74();
    *(_QWORD *)(v0 + 16) = v1;
    *(_QWORD *)(v0 + 24) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246125B74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v0 = sub_2461323E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  result = sub_24612638C(v4);
  if (!v6)
  {
    sub_2461323D0();
    v7 = sub_2461323DC();
    v8 = sub_2461325D4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_246105000, v7, v8, "Unable to fetch Siri locale", v9, 2u);
      MEMORY[0x249550A14](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return result;
}

uint64_t sub_246125C8C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultLocaleProvider()
{
  return objc_opt_self();
}

uint64_t sub_246125CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  type metadata accessor for DefaultDeviceTypeProvider();
  v0 = swift_allocObject();
  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFC0);
  result = __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  qword_25754B920 = v0;
  return result;
}

uint64_t sub_246125D34@<X0>(uint64_t a1@<X8>)
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
  _BYTE v12[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B270);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v12[-v7];
  v9 = v1 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType;
  swift_beginAccess();
  sub_2461262B8(v9, (uint64_t)v8, &qword_25754B270);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFC0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10) != 1)
    return sub_246126344((uint64_t)v8, a1);
  sub_246126278((uint64_t)v8);
  sub_2461320E8();
  sub_2461320DC();
  sub_2461262B8(a1, (uint64_t)v6, &qword_25754AFC0);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v10);
  swift_beginAccess();
  sub_2461262FC((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_246125E94()
{
  uint64_t v0;

  sub_246126278(v0 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType);
  return swift_deallocClassInstance();
}

uint64_t sub_246125EC4()
{
  return type metadata accessor for DefaultDeviceTypeProvider();
}

uint64_t type metadata accessor for DefaultDeviceTypeProvider()
{
  uint64_t result;

  result = qword_25754B118;
  if (!qword_25754B118)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246125F04()
{
  unint64_t v0;

  sub_246125F70();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_246125F70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25754B128[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754AFC0);
    v0 = sub_246132604();
    if (!v1)
      atomic_store(v0, qword_25754B128);
  }
}

uint64_t sub_246125FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2461263F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24612603C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_246132130();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = OUTLINED_FUNCTION_0_4();
  v4 = sub_246132124();
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = OUTLINED_FUNCTION_0_4();
  v5 = sub_246132148();
  v2[10] = v5;
  v2[11] = *(_QWORD *)(v5 - 8);
  v2[12] = OUTLINED_FUNCTION_0_4();
  return swift_task_switch();
}

uint64_t sub_2461260C8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD);

  v9 = (uint64_t (*)(_QWORD))v0[12];
  v2 = v0[8];
  v1 = (_QWORD *)v0[9];
  v4 = v0[6];
  v3 = v0[7];
  v6 = v0[4];
  v5 = v0[5];
  sub_246132160();
  v0[13] = sub_246132154();
  *v1 = &unk_25173B310;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE90BF8], v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, *MEMORY[0x24BE90C08], v6);
  swift_bridgeObjectRetain();
  sub_24613213C();
  v7 = (_QWORD *)OUTLINED_FUNCTION_9_4();
  v0[14] = v7;
  *v7 = v0;
  v7[1] = sub_2461261CC;
  return v9(v0[12]);
}

uint64_t sub_2461261CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_4();
  v4 = v2[11];
  v3 = v2[12];
  v5 = v2[10];
  OUTLINED_FUNCTION_11_4();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v0);
}

uint64_t type metadata accessor for DefaultAppFinderForIntentProvider()
{
  return objc_opt_self();
}

uint64_t sub_246126278(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B270);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461262B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2461262FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_246126344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754AFC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24612638C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2)
    return 0;
  v3 = sub_246132484();

  return v3;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_3_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_246126424()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v27[3];
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_42();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2461322C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_246132370();
  v9 = OUTLINED_FUNCTION_0_5(v28, sel_phrase);
  v10 = sub_246132484();
  v27[1] = v11;
  v27[2] = v10;

  v13 = OUTLINED_FUNCTION_0_5(v12, sel_associatedAppBundleIdentifier);
  sub_246132484();
  v27[0] = v14;

  v16 = OUTLINED_FUNCTION_0_5(v15, sel_identifier);
  sub_246132484();

  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE91908], v5);
  v17 = sub_2461321D8();
  OUTLINED_FUNCTION_63((uint64_t)v4, v18, v19, v17);
  v20 = sub_246132034();
  OUTLINED_FUNCTION_63(v0, v21, v22, v20);
  v23 = sub_246132328();
  v24 = OUTLINED_FUNCTION_0_5(v23, sel_runEventsCount);
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, sel_doubleValue);

  }
  sub_2461322F8();
  return v23;
}

uint64_t sub_246126654(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  double v19;
  char v20;
  uint64_t result;
  char *v22;

  v3 = sub_2461323E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_42();
  sub_2461323D0();
  v5 = sub_2461323DC();
  v6 = sub_2461325BC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246105000, v5, v6, "Ranking Voice Shortcut phrases", v7, 2u);
    MEMORY[0x249550A14](v7, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_49();
    v8 = sub_246132724();
    if (v8)
      goto LABEL_5;
LABEL_19:
    v10 = MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_bridgeObjectRelease();
    v22 = (char *)v10;
    swift_bridgeObjectRetain();
    sub_246130774(&v22);
    swift_bridgeObjectRelease();
    v17 = v22;
    if (!v8)
      return swift_release();
    OUTLINED_FUNCTION_49();
    v18 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x249550420](v18, a1);
      else
        OUTLINED_FUNCTION_2_5();
      ++v18;
      v19 = COERCE_DOUBLE(sub_2461322EC());
      if ((v20 & 1) != 0)
        v19 = 0.0;
      sub_246131A9C((uint64_t)v17, v19);
      sub_2461322F8();
      swift_release();
    }
    while (v8 != v18);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_49();
  if (!v8)
    goto LABEL_19;
LABEL_5:
  if (v8 >= 1)
  {
    v9 = 0;
    v10 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x249550420](v9, a1);
      else
        OUTLINED_FUNCTION_2_5();
      v11 = sub_2461322EC();
      if ((v12 & 1) != 0)
      {
        v13 = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
LABEL_17:
          OUTLINED_FUNCTION_3_5();
          v10 = v15;
        }
      }
      else
      {
        v13 = v11;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          goto LABEL_17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      if (v14 >= *(_QWORD *)(v10 + 24) >> 1)
      {
        OUTLINED_FUNCTION_3_5();
        v10 = v16;
      }
      ++v9;
      *(_QWORD *)(v10 + 16) = v14 + 1;
      *(_QWORD *)(v10 + 8 * v14 + 32) = v13;
      swift_release();
      if (v8 == v9)
        goto LABEL_20;
    }
  }
  __break(1u);
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_246126924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete19VoiceShortcutSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_246126974()
{
  return type metadata accessor for VoiceShortcutSource();
}

uint64_t type metadata accessor for VoiceShortcutSource()
{
  uint64_t result;

  result = qword_25754B2A0;
  if (!qword_25754B2A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461269B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461322C8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id OUTLINED_FUNCTION_0_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_3_5()
{
  sub_24612FB50();
}

uint64_t sub_246126A40()
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

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_41();
  v3 = v2 - v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v7 = v6 - v5;
  v8 = sub_2461322C8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_41();
  v12 = v11 - v10;
  sub_246132370();
  sub_2461324A8();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE91938], v8);
  v13 = sub_2461321D8();
  OUTLINED_FUNCTION_63(v7, v14, v15, v13);
  v16 = sub_246132034();
  OUTLINED_FUNCTION_63(v3, v17, v18, v16);
  swift_bridgeObjectRetain();
  return sub_246132328();
}

uint64_t sub_246126BE0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v2 = sub_2461323E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_41();
  v6 = v5 - v4;
  sub_2461323D0();
  v7 = sub_2461323DC();
  v8 = sub_2461325BC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_246105000, v7, v8, "Ranking App Launch phrases", v9, 2u);
    MEMORY[0x249550A14](v9, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  swift_retain();
  sub_246111034(a1);
  return swift_release();
}

uint64_t sub_246126CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_246126D54()
{
  return type metadata accessor for AppLaunchSource();
}

uint64_t type metadata accessor for AppLaunchSource()
{
  uint64_t result;

  result = qword_25441C4C8;
  if (!qword_25441C4C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246126D94()
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;

  v42 = sub_246132034();
  v0 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_41();
  v3 = v2 - v1;
  v4 = sub_246132064();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  v9 = sub_246132070();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41();
  v13 = v12 - v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v43 = (uint64_t)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v41 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v41 - v20;
  type metadata accessor for SiriAutoCompleteHistogram();
  v22 = swift_allocObject();
  v44 = v22;
  *(_QWORD *)(v22 + 16) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v22 + 24) = 0;
  sub_246132058();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BDCF250], v4);
  sub_246132028();
  sub_24613204C();
  v23 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
  v24 = v42;
  v23(v3, v42);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  v25 = objc_msgSend((id)BiomeLibrary(), sel_App);
  swift_unknownObjectRelease();
  v26 = objc_msgSend(v25, sel_InFocus);
  swift_unknownObjectRelease();
  v27 = (uint64_t)v21;
  sub_246127654((uint64_t)v21, (uint64_t)v19);
  v28 = v43;
  __swift_storeEnumTagSinglePayload(v43, 1, 1, v24);
  v29 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  sub_246119778((uint64_t)v19, v28, 1000, 0, 0);
  v31 = v30;
  v32 = objc_msgSend(v26, sel_publisherWithOptions_, v30);

  v47 = sub_246127170;
  v48 = 0;
  v33 = MEMORY[0x24BDAC760];
  v45 = MEMORY[0x24BDAC760];
  v46 = 1107296256;
  v34 = OUTLINED_FUNCTION_0_6((uint64_t)sub_246125090);
  v35 = objc_msgSend(v32, sel_filterWithIsIncluded_, v34);
  _Block_release(v34);

  v47 = sub_24612729C;
  v48 = 0;
  v45 = v33;
  v46 = 1107296256;
  v36 = OUTLINED_FUNCTION_0_6((uint64_t)sub_2461175AC);
  v37 = v44;
  v47 = sub_2461276B4;
  v48 = v44;
  v45 = v33;
  v46 = 1107296256;
  v38 = OUTLINED_FUNCTION_0_6((uint64_t)sub_2461275C0);
  swift_retain();
  swift_release();
  v39 = objc_msgSend(v35, sel_sinkWithCompletion_receiveInput_, v36, v38);
  _Block_release(v38);
  _Block_release(v36);

  sub_2461276BC(v27);
  return v37;
}

id sub_246127170(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v2 = sub_2461323E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_eventBody);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_starting);

  }
  else
  {
    sub_2461323D0();
    v9 = sub_2461323DC();
    v10 = sub_2461325D4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246105000, v9, v10, "Skipping Biome event with missing body", v11, 2u);
      MEMORY[0x249550A14](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return v8;
}

id sub_24612729C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id result;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[3];
  uint64_t v22;

  v2 = sub_2461323E8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v21 - v7;
  if (objc_msgSend(a1, sel_state))
  {
    sub_2461323D0();
    v9 = sub_2461323DC();
    v10 = sub_2461325D4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246105000, v9, v10, "Publisher completion state was not 'success'", v11, 2u);
      MEMORY[0x249550A14](v11, -1, -1);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    result = objc_msgSend(a1, sel_error);
    if (result)
    {
      v13 = result;
      sub_2461323D0();
      v14 = v13;
      v15 = sub_2461323DC();
      v16 = sub_2461325D4();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        v18 = swift_slowAlloc();
        v22 = v18;
        *(_DWORD *)v17 = 136315138;
        v21[1] = v17 + 4;
        swift_getErrorValue();
        v19 = sub_246132808();
        v21[2] = sub_246119920(v19, v20, &v22);
        sub_246132610();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_246105000, v15, v16, "Error encountered while attempting to build the app launch histogram: %s", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249550A14](v18, -1, -1);
        MEMORY[0x249550A14](v17, -1, -1);

      }
      else
      {

      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

void sub_24612753C(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = objc_msgSend(a1, sel_eventBody);
  if (v1)
  {
    v3 = v1;
    sub_2461276FC(v1);
    if (v2)
    {
      sub_246110EE8();

      swift_bridgeObjectRelease();
    }
    else
    {

    }
  }
}

void sub_2461275C0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_246127610()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppLaunchHistogramBuilder()
{
  return objc_opt_self();
}

uint64_t sub_246127654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

void sub_2461276B4(void *a1)
{
  sub_24612753C(a1);
}

uint64_t sub_2461276BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461276FC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_bundleID);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246132484();

  return v3;
}

void *OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

void sub_246127778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  char v18;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_33_2();
    sub_24613249C();
    v6 = OUTLINED_FUNCTION_33_0();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    OUTLINED_FUNCTION_3_6();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (OUTLINED_FUNCTION_8_4() & 1) == 0)
      {
        v13 = ~v7;
        v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_3_6();
        if ((v15 & 1) != 0)
        {
          do
          {
            v16 = (_QWORD *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2)
              break;
            if ((OUTLINED_FUNCTION_8_4() & 1) != 0)
              break;
            v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_3_6();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_246127878(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  _BYTE v17[72];

  if (!*(_QWORD *)(a2 + 16))
    goto LABEL_9;
  sub_246132814();
  sub_24612CFBC((uint64_t)v17, a1);
  v4 = sub_24613282C();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    goto LABEL_9;
  v8 = swift_bridgeObjectRetain();
  sub_246127D04(v8, a1);
  v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    v11 = 1;
    return v11 & 1;
  }
  v12 = ~v5;
  v13 = (v6 + 1) & v12;
  if (((*(_QWORD *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
  {
LABEL_9:
    v11 = 0;
    return v11 & 1;
  }
  do
  {
    v14 = swift_bridgeObjectRetain();
    sub_246127D04(v14, a1);
    v11 = v15;
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      break;
    v13 = (v13 + 1) & v12;
  }
  while (((*(_QWORD *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  return v11 & 1;
}

uint64_t sub_2461279A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = a1 + 40;
    do
    {
      v4 = OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_26_2(v4);
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
    OUTLINED_FUNCTION_47();
    return a2;
  }
  else
  {
    v5 = a2;
    OUTLINED_FUNCTION_47();
  }
  return v5;
}

uint64_t sub_246127A24(uint64_t result, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;

  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  for (v6 &= v6 - 1; ; v6 = (v9 - 1) & v9)
  {
    v11 = OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_26_2(v11);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_5:
    v8 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v8 >= v7)
      goto LABEL_23;
    v9 = *(_QWORD *)(v3 + 8 * v8);
    ++v2;
    if (!v9)
    {
      v2 = v8 + 1;
      if (v8 + 1 >= v7)
        goto LABEL_23;
      v9 = *(_QWORD *)(v3 + 8 * v2);
      if (!v9)
      {
        v2 = v8 + 2;
        if (v8 + 2 >= v7)
          goto LABEL_23;
        v9 = *(_QWORD *)(v3 + 8 * v2);
        if (!v9)
        {
          v2 = v8 + 3;
          if (v8 + 3 >= v7)
            goto LABEL_23;
          v9 = *(_QWORD *)(v3 + 8 * v2);
          if (!v9)
            break;
        }
      }
    }
LABEL_20:
    ;
  }
  v10 = v8 + 4;
  if (v10 >= v7)
  {
LABEL_23:
    OUTLINED_FUNCTION_55_0();
    return a2;
  }
  v9 = *(_QWORD *)(v3 + 8 * v10);
  if (v9)
  {
    v2 = v10;
    goto LABEL_20;
  }
  while (1)
  {
    v2 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v2 >= v7)
      goto LABEL_23;
    v9 = *(_QWORD *)(v3 + 8 * v2);
    ++v10;
    if (v9)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_246127B8C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = result;
  v3 = 0;
  v16 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v9 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    swift_bridgeObjectRetain();
    sub_24612B6F4(&v15, v14);
    result = swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_4;
LABEL_5:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_20:
    v7 = (v12 - 1) & v12;
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v16;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_246127D04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  unint64_t j;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v29 = a1 + 56;
  OUTLINED_FUNCTION_21_3();
  v7 = v6 & v5;
  v30 = (unint64_t)(v8 + 63) >> 6;
  v9 = a2 + 56;
  if ((v6 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v31 = v4;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    v16 = v3;
    v17 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * i + 8);
    sub_246132814();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_47_1();
    v18 = sub_24613282C();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v9 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_36;
    v21 = *(_QWORD *)(a2 + 48);
    OUTLINED_FUNCTION_41_0(v21 + 16 * v20);
    v23 = v23 && v22 == v17;
    if (!v23 && (OUTLINED_FUNCTION_6_5() & 1) == 0)
    {
      v24 = ~v19;
      for (j = v20 + 1; ; j = v26 + 1)
      {
        v26 = j & v24;
        if (((*(_QWORD *)(v9 + (((j & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v24)) & 1) == 0)
          break;
        OUTLINED_FUNCTION_41_0(v21 + 16 * v26);
        v28 = v23 && v27 == v17;
        if (v28 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
          goto LABEL_25;
      }
LABEL_36:
      OUTLINED_FUNCTION_55();
      return;
    }
LABEL_25:
    OUTLINED_FUNCTION_55();
    v3 = v16;
    v4 = v31;
    if (v7)
      goto LABEL_4;
LABEL_5:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v30)
      return;
    v13 = *(_QWORD *)(v29 + 8 * v12);
    v14 = v4 + 1;
    if (!v13)
    {
      v14 = v4 + 2;
      if (v4 + 2 >= v30)
        return;
      v13 = *(_QWORD *)(v29 + 8 * v14);
      if (!v13)
      {
        v14 = v4 + 3;
        if (v4 + 3 >= v30)
          return;
        v13 = *(_QWORD *)(v29 + 8 * v14);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v7 = (v13 - 1) & v13;
    v31 = v14;
  }
  v15 = v4 + 4;
  if (v4 + 4 >= v30)
    return;
  v13 = *(_QWORD *)(v29 + 8 * v15);
  if (v13)
  {
    v14 = v4 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v30)
      return;
    v13 = *(_QWORD *)(v29 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_18;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_246127F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(_BYTE *)(v5 + 48) = a5;
  return v5;
}

uint64_t sub_246127F58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = v1;
  v4 = sub_2461323E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  v10 = *(_QWORD *)(v2 + 16);
  v9 = *(_QWORD *)(v2 + 24);
  v12 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v13 = v10 == v12 && v9 == v11;
  if (v13 || (OUTLINED_FUNCTION_217(), (OUTLINED_FUNCTION_8_4() & 1) != 0))
  {
    v14 = *(_QWORD *)(v2 + 32);
    OUTLINED_FUNCTION_40();
    swift_bridgeObjectRetain();
    v15 = OUTLINED_FUNCTION_11_3();
    v16 = sub_246127B8C(v15, v14);
    v17 = *(_QWORD *)(v2 + 40);
    OUTLINED_FUNCTION_11_3();
    v18 = OUTLINED_FUNCTION_17_2();
    v19 = sub_246127A24(v18, v17);
    if ((*(_BYTE *)(v2 + 48) & 1) != 0)
      v20 = 1;
    else
      v20 = *(_BYTE *)(a1 + 48);
    type metadata accessor for DeniedIntent();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v10;
    *(_QWORD *)(v2 + 24) = v9;
    *(_QWORD *)(v2 + 32) = v16;
    *(_QWORD *)(v2 + 40) = v19;
    *(_BYTE *)(v2 + 48) = v20;
  }
  else
  {
    v30 = v5;
    sub_2461323D0();
    swift_retain_n();
    swift_retain_n();
    v21 = sub_2461323DC();
    v29 = sub_2461325D4();
    if (os_log_type_enabled(v21, v29))
    {
      v22 = OUTLINED_FUNCTION_2();
      v31 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v22 = 136315650;
      v23 = sub_246132868();
      sub_246119920(v23, v24, &v31);
      sub_246132610();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      OUTLINED_FUNCTION_40();
      v25 = OUTLINED_FUNCTION_217();
      sub_246119920(v25, v26, v27);
      sub_246132610();
      OUTLINED_FUNCTION_72();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 22) = 2080;
      OUTLINED_FUNCTION_17_2();
      sub_246119920(v12, v11, &v31);
      sub_246132610();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_45_2(&dword_246105000, v21, v29, "%s Error: The intentClass of the objects being unioned should be the same: %s and %s", (uint8_t *)v22);
      OUTLINED_FUNCTION_44_2();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_72();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v8, v4);
    swift_retain();
  }
  return v2;
}

uint64_t sub_246128254(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C43746E65746E69 && a2 == 0xEB00000000737361;
  if (v3 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000246134F00 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000246134F20 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000246134F40)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_2461327CC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2461283FC()
{
  return 4;
}

uint64_t sub_246128404(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246128444 + 4 * byte_246133B50[a1]))(0xD00000000000001BLL, 0x8000000246134F00);
}

uint64_t sub_246128444()
{
  return 0x6C43746E65746E69;
}

unint64_t sub_246128464()
{
  return 0xD000000000000010;
}

uint64_t sub_246128480()
{
  uint64_t v0;

  return v0 + 6;
}

uint64_t sub_246128498()
{
  unsigned __int8 *v0;

  return sub_246128404(*v0);
}

uint64_t sub_2461284A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246128254(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2461284C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2461283FC();
  *a1 = result;
  return result;
}

uint64_t sub_2461284E8()
{
  sub_24612D154();
  return sub_246132850();
}

uint64_t sub_246128510()
{
  sub_24612D154();
  return sub_24613285C();
}

uint64_t sub_246128538()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246128564()
{
  sub_246128538();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeniedIntent()
{
  return objc_opt_self();
}

void sub_2461285A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5A0);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24612D154();
  OUTLINED_FUNCTION_34_2();
  sub_24613279C();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B588);
    sub_24612D190((uint64_t)&unk_25754B5A8);
    OUTLINED_FUNCTION_11_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
    sub_24612D1E4((uint64_t)&unk_25754B5B0);
    OUTLINED_FUNCTION_11_5();
    sub_2461327A8();
  }
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v8, v4);
  OUTLINED_FUNCTION_18_4();
}

uint64_t sub_246128724(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_246128770(a1);
  return v2;
}

_QWORD *sub_246128770(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B578);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_41();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24612D154();
  sub_246132838();
  if (v2)
  {
    type metadata accessor for DeniedIntent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v9) = 0;
    OUTLINED_FUNCTION_42_2();
    v1[2] = sub_24613276C();
    v1[3] = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B588);
    sub_24612D190((uint64_t)&unk_25754B590);
    OUTLINED_FUNCTION_17_3();
    sub_246132784();
    v1[4] = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
    sub_24612D1E4((uint64_t)&unk_25754B598);
    OUTLINED_FUNCTION_17_3();
    sub_246132784();
    v1[5] = v9;
    OUTLINED_FUNCTION_42_2();
    v8 = sub_246132778();
    OUTLINED_FUNCTION_2_6();
    *((_BYTE *)v3 + 48) = v8 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_246128994()
{
  return 1;
}

uint64_t sub_24612899C()
{
  return sub_246132820();
}

uint64_t sub_2461289C0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E496465696E6564 && a2 == 0xED000073746E6574)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2461327CC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_246128A5C()
{
  sub_246132814();
  sub_246132820();
  return sub_24613282C();
}

uint64_t sub_246128A9C()
{
  return 0x6E496465696E6564;
}

void sub_246128AC0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B620);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_41();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24612D4A0();
  OUTLINED_FUNCTION_34_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B608);
  sub_24612D4DC((uint64_t)&unk_25754B628);
  sub_2461327B4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v7, v3);
  OUTLINED_FUNCTION_18_4();
}

_QWORD *sub_246128BB8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5F8);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_41();
  v8 = v7 - v6;
  v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24612D4A0();
  sub_246132838();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B608);
    sub_24612D4DC((uint64_t)&unk_25754B610);
    sub_246132784();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v8, v4);
    v9 = v11;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_246128CF4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_246128724(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_246128D1C(_QWORD *a1)
{
  sub_2461285A4(a1);
}

uint64_t sub_246128D48()
{
  sub_246132814();
  sub_246132820();
  return sub_24613282C();
}

uint64_t sub_246128D88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2461289C0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_246128DB0()
{
  return sub_24610E700();
}

uint64_t sub_246128DC8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246128994();
  *a1 = result & 1;
  return result;
}

uint64_t sub_246128DF0()
{
  sub_24612D4A0();
  return sub_246132850();
}

uint64_t sub_246128E18()
{
  sub_24612D4A0();
  return sub_24613285C();
}

_QWORD *sub_246128E40@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_246128BB8(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_246128E68(_QWORD *a1)
{
  sub_246128AC0(a1);
}

uint64_t sub_246128E80()
{
  uint64_t result;

  type metadata accessor for INIntentParameterCombinationDenyListProvider();
  swift_allocObject();
  result = sub_246128F28();
  qword_25754B938 = result;
  return result;
}

void sub_246128EB8()
{
  qword_25754B3F0 = 0x7473696C70;
  *(_QWORD *)algn_25754B3F8 = 0xE500000000000000;
}

unint64_t sub_246128ED8()
{
  if (qword_25754A790 != -1)
    swift_once();
  return 0xD00000000000002ALL;
}

uint64_t sub_246128F28()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_246128F54();
  return v0;
}

uint64_t sub_246128F54()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_246128F94();
  v1 = sub_246129460();
  return sub_246129BB4(v1, v0);
}

uint64_t sub_246128F94()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjCClassFromMetadata;
  id v29;
  id v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  void (*v33)(uint64_t, char *, uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4A8);
  MEMORY[0x24BDAC7A8](v2);
  v51 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_246131FF8();
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v48 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v44 - v7;
  v9 = sub_2461323E8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - v14;
  sub_2461323D0();
  v16 = sub_2461323DC();
  v17 = sub_2461325C8();
  v18 = os_log_type_enabled(v16, v17);
  v46 = v8;
  if (v18)
  {
    v45 = v13;
    v19 = swift_slowAlloc();
    v47 = v1;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v53 = v21;
    *(_DWORD *)v20 = 136315138;
    v22 = sub_246132868();
    v52 = sub_246119920(v22, v23, &v53);
    v13 = v45;
    sub_246132610();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246105000, v16, v17, "%s: loading INIntent deny list from project resources.", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249550A14](v21, -1, -1);
    MEMORY[0x249550A14](v20, -1, -1);
  }

  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v15, v9);
  v26 = v50;
  v25 = (uint64_t)v51;
  v27 = v49;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v29 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v30 = sub_24612CB94(0xD000000000000024, 0x8000000246133C20, 0x7473696C70, 0xE500000000000000, v29);

  if (v30)
  {
    v31 = v24;
    v32 = v48;
    sub_246131FEC();

    v33 = *(void (**)(uint64_t, char *, uint64_t))(v27 + 32);
    v34 = v32;
    v24 = v31;
    v33(v25, v34, v26);
    __swift_storeEnumTagSinglePayload(v25, 0, 1, v26);
    if (__swift_getEnumTagSinglePayload(v25, 1, v26) != 1)
    {
      v35 = v46;
      v33((uint64_t)v46, (char *)v25, v26);
      v36 = sub_246129C30();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v26);
      return v36;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
  }
  sub_24610FCD0(v25);
  sub_2461323D0();
  v37 = sub_2461323DC();
  v38 = sub_2461325D4();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v53 = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = sub_246132868();
    v52 = sub_246119920(v41, v42, &v53);
    sub_246132610();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246105000, v37, v38, "%s: unable to get a path to the list of denied parameter combinations for INIntents", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249550A14](v40, -1, -1);
    MEMORY[0x249550A14](v39, -1, -1);
  }

  v24(v13, v9);
  type metadata accessor for DeniedIntent();
  return sub_24613246C();
}

uint64_t sub_246129460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v16;
  char *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  char *v41;
  NSObject *v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[2];
  uint64_t v62;

  v1 = v0;
  v2 = sub_246131FF8();
  v54 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v53 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v50 - v5;
  v7 = sub_2461320AC();
  v59 = *(_QWORD *)(v7 - 8);
  v60 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2461323E8();
  v58 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v50 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v50 - v16;
  v18 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 134);
  sub_2461323D0();
  v19 = sub_2461323DC();
  v20 = sub_2461325C8();
  v21 = os_log_type_enabled(v19, v20);
  v56 = v1;
  v57 = v13;
  v55 = v6;
  if (v21)
  {
    v51 = v18;
    v22 = swift_slowAlloc();
    v50 = v2;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc();
    v61[0] = v24;
    *(_DWORD *)v23 = 136315138;
    v25 = sub_246132868();
    v62 = sub_246119920(v25, v26, v61);
    sub_246132610();
    v18 = v51;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246105000, v19, v20, "%s: looking for INIntent deny list on Trial.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249550A14](v24, -1, -1);
    v27 = v23;
    v2 = v50;
    MEMORY[0x249550A14](v27, -1, -1);
  }

  v28 = *(void (**)(char *, uint64_t))(v58 + 8);
  v28(v17, v10);
  v30 = v59;
  v29 = v60;
  sub_246132094();
  v31 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v9, *MEMORY[0x24BEA6A30], v29);
  sub_2461320A0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v29);
  v32 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  v33 = objc_msgSend(v18, sel_levelForFactor_withNamespaceName_, v31, v32);

  v34 = sub_24613207C();
  if (v35)
  {
    v61[0] = v34;
    v61[1] = v35;
    swift_bridgeObjectRetain();
    sub_2461324A8();
    swift_bridgeObjectRelease();
    v36 = v53;
    sub_246131FD4();
    swift_bridgeObjectRelease();
    sub_246128ED8();
    v37 = v55;
    sub_246131FE0();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v54 + 8);
    v38(v36, v2);
    v39 = sub_246129C30();

    v38(v37, v2);
  }
  else
  {
    v41 = v52;
    sub_2461323D0();
    v42 = sub_2461323DC();
    v43 = sub_2461325C8();
    if (os_log_type_enabled(v42, (os_log_type_t)v43))
    {
      v60 = v10;
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v61[0] = v45;
      *(_DWORD *)v44 = 136315138;
      v46 = sub_246132868();
      v62 = sub_246119920(v46, v47, v61);
      sub_246132610();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_246105000, v42, (os_log_type_t)v43, "%s: No INIntent deny list on Trial.", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249550A14](v45, -1, -1);
      MEMORY[0x249550A14](v44, -1, -1);

      v48 = v52;
      v49 = v60;
    }
    else
    {

      v48 = v41;
      v49 = v10;
    }
    v28(v48, v49);
    type metadata accessor for DeniedIntent();
    v39 = sub_24613246C();

  }
  return v39;
}

uint64_t sub_246129BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_24612C96C(a1, (uint64_t)sub_24612CC3C, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_246129C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51[3];
  uint64_t v52;

  v0 = sub_2461323E8();
  v47 = *(_QWORD *)(v0 - 8);
  v48 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v40 - v2;
  sub_246131FBC();
  swift_allocObject();
  v4 = sub_246131FB0();
  v5 = sub_246132004();
  v44 = v3;
  v7 = v6;
  v8 = v5;
  sub_24612D240();
  sub_246131FA4();
  v41 = v8;
  v42 = v7;
  v43 = v4;
  v10 = v51[0];
  type metadata accessor for DeniedIntent();
  isUniquelyReferenced_nonNull_native = (_QWORD *)sub_24613246C();
  v52 = (uint64_t)isUniquelyReferenced_nonNull_native;
  if (v10 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    v12 = sub_246132724();
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v12 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
    {
LABEL_3:
      v49 = v10 & 0xC000000000000001;
      v13 = 4;
      v45 = v12;
      v46 = v10;
      do
      {
        if (v49)
        {
          v14 = MEMORY[0x249550420](v13 - 4, v10);
        }
        else
        {
          v14 = *(_QWORD *)(v10 + 8 * v13);
          swift_retain();
        }
        v15 = v13 - 3;
        if (__OFADD__(v13 - 4, 1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (!isUniquelyReferenced_nonNull_native[2])
          goto LABEL_11;
        v17 = *(_QWORD *)(v14 + 16);
        v16 = *(_QWORD *)(v14 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24612ACE4(v17, v16);
        LOBYTE(v17) = v18;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) != 0)
        {
          swift_release();
        }
        else
        {
LABEL_11:
          v19 = *(_QWORD *)(v14 + 16);
          v20 = *(_QWORD *)(v14 + 24);
          swift_bridgeObjectRetain();
          swift_retain();
          isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
          v21 = v52;
          v51[0] = v52;
          v22 = sub_24612ACE4(v19, v20);
          if (__OFADD__(*(_QWORD *)(v21 + 16), (v23 & 1) == 0))
            goto LABEL_26;
          v10 = v22;
          v24 = v23;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5C0);
          if ((sub_2461326F4() & 1) != 0)
          {
            v25 = sub_24612ACE4(v19, v20);
            if ((v24 & 1) != (v26 & 1))
            {
              result = sub_2461327FC();
              __break(1u);
              return result;
            }
            v10 = v25;
          }
          isUniquelyReferenced_nonNull_native = (_QWORD *)v51[0];
          if ((v24 & 1) != 0)
          {
            v27 = *(_QWORD *)(v51[0] + 56);
            swift_release();
            *(_QWORD *)(v27 + 8 * v10) = v14;
          }
          else
          {
            *(_QWORD *)(v51[0] + 8 * (v10 >> 6) + 64) |= 1 << v10;
            v28 = (uint64_t *)(isUniquelyReferenced_nonNull_native[6] + 16 * v10);
            *v28 = v19;
            v28[1] = v20;
            *(_QWORD *)(isUniquelyReferenced_nonNull_native[7] + 8 * v10) = v14;
            v29 = isUniquelyReferenced_nonNull_native[2];
            v30 = __OFADD__(v29, 1);
            v31 = v29 + 1;
            if (v30)
              goto LABEL_27;
            isUniquelyReferenced_nonNull_native[2] = v31;
            swift_bridgeObjectRetain();
          }
          v52 = (uint64_t)isUniquelyReferenced_nonNull_native;
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v12 = v45;
          v10 = v46;
        }
        ++v13;
      }
      while (v15 != v12);
    }
  }
  swift_bridgeObjectRelease();
  v32 = v44;
  sub_2461323D0();
  swift_bridgeObjectRetain_n();
  v33 = sub_2461323DC();
  v34 = sub_2461325C8();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v51[0] = v36;
    *(_DWORD *)v35 = 136315394;
    v37 = sub_246132868();
    v50 = sub_246119920(v37, v38, v51);
    sub_246132610();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2048;
    v39 = isUniquelyReferenced_nonNull_native[2];
    swift_bridgeObjectRelease();
    v50 = v39;
    sub_246132610();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246105000, v33, v34, "%s: loaded %ld intents", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249550A14](v36, -1, -1);
    MEMORY[0x249550A14](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  sub_2461098E4(v41, v42);

  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v32, v48);
  swift_beginAccess();
  return v52;
}

uint64_t sub_24612A340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  _QWORD *v55;
  BOOL v56;
  NSObject *v57;
  os_log_type_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95[10];

  v7 = *v3;
  v8 = sub_2461323E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = ((char *)&v85 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v18 = ((char *)&v85 - v17);
  v19 = v3[2];
  if (!*(_QWORD *)(v19 + 16))
    return 0;
  v91 = v16;
  v89 = v15;
  OUTLINED_FUNCTION_56();
  v20 = sub_24612ACE4(a1, a2);
  if ((v21 & 1) == 0)
  {
    OUTLINED_FUNCTION_55();
    return 0;
  }
  v88 = v7;
  v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
  swift_retain();
  OUTLINED_FUNCTION_55();
  if ((*(_BYTE *)(v22 + 48) & 1) != 0)
  {
    sub_2461323D0();
    OUTLINED_FUNCTION_136();
    sub_2461323DC();
    v23 = OUTLINED_FUNCTION_62();
    if (os_log_type_enabled(v18, v23))
    {
      v24 = OUTLINED_FUNCTION_2();
      v86 = a1;
      v25 = v24;
      v95[0] = OUTLINED_FUNCTION_2();
      *(_DWORD *)v25 = 136315394;
      v26 = OUTLINED_FUNCTION_16_3();
      v93 = v22;
      v94 = sub_246119920(v26, v27, v95);
      v87 = v9;
      sub_246132610();
      OUTLINED_FUNCTION_47();
      *(_WORD *)(v25 + 12) = 2080;
      OUTLINED_FUNCTION_56();
      v94 = OUTLINED_FUNCTION_15_4(v86, v28, v95);
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_9_5();
      _os_log_impl(&dword_246105000, v18, v23, "%s: Not adding any parameter combinations for intent class %s since areAllParametersDenied = YES", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_55_0();
    OUTLINED_FUNCTION_44_1();
    v66 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v67 = (uint64_t)v18;
LABEL_46:
    v68 = v8;
LABEL_47:
    v66(v67, v68);
    return 1;
  }
  v30 = *(_QWORD *)(*(_QWORD *)(v22 + 40) + 16);
  v86 = a1;
  v87 = v9;
  v93 = v22;
  if (!v30 && !*(_QWORD *)(*(_QWORD *)(v22 + 32) + 16))
  {
    sub_2461323D0();
    swift_bridgeObjectRetain_n();
    sub_2461323DC();
    v69 = OUTLINED_FUNCTION_62();
    if (os_log_type_enabled(v14, v69))
    {
      v70 = OUTLINED_FUNCTION_2();
      v95[0] = OUTLINED_FUNCTION_2();
      *(_DWORD *)v70 = 136315650;
      v71 = OUTLINED_FUNCTION_16_3();
      v94 = OUTLINED_FUNCTION_22_1(v71, v72);
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_17_0();
      *(_WORD *)(v70 + 12) = 2080;
      v73 = OUTLINED_FUNCTION_56();
      v94 = OUTLINED_FUNCTION_14_3(v73, v74, v95);
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_9_5();
      *(_WORD *)(v70 + 22) = 2080;
      v75 = OUTLINED_FUNCTION_56();
      v94 = OUTLINED_FUNCTION_14_3(v75, v76, v95);
      OUTLINED_FUNCTION_1_1();
      OUTLINED_FUNCTION_9_5();
      OUTLINED_FUNCTION_45_2(&dword_246105000, v14, v69, "%s: %s is in the deny list but has empty parameters and parameterCombinations. The entire INIntent  %s is denied.", (uint8_t *)v70);
      OUTLINED_FUNCTION_44_2();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_55_0();
    swift_bridgeObjectRelease_n();
    v66 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v67 = (uint64_t)v14;
    goto LABEL_46;
  }
  v85 = v8;
  v90 = a3 + 56;
  OUTLINED_FUNCTION_21_3();
  v33 = v32 & v31;
  v92 = ((unint64_t)(v34 + 63) >> 6);
  result = OUTLINED_FUNCTION_11();
  v35 = 0;
  while (1)
  {
    do
    {
      if (v33)
      {
        v36 = __clz(__rbit64(v33));
        v33 &= v33 - 1;
        v37 = v36 | (v35 << 6);
      }
      else
      {
        v38 = v35 + 1;
        if (__OFADD__(v35, 1))
        {
          __break(1u);
LABEL_60:
          __break(1u);
          return result;
        }
        if (v38 >= (uint64_t)v92)
          goto LABEL_53;
        v39 = *(_QWORD *)(v90 + 8 * v38);
        ++v35;
        if (!v39)
        {
          v35 = v38 + 1;
          if (v38 + 1 >= (uint64_t)v92)
            goto LABEL_53;
          v39 = *(_QWORD *)(v90 + 8 * v35);
          if (!v39)
          {
            v35 = v38 + 2;
            if (v38 + 2 >= (uint64_t)v92)
              goto LABEL_53;
            v39 = *(_QWORD *)(v90 + 8 * v35);
            if (!v39)
            {
              v40 = v38 + 3;
              if (v40 >= (uint64_t)v92)
              {
LABEL_53:
                swift_release();
                if ((sub_246127878(a3, *(_QWORD *)(v22 + 32)) & 1) == 0)
                {
                  OUTLINED_FUNCTION_55_0();
                  return 0;
                }
                v77 = v89;
                sub_2461323D0();
                OUTLINED_FUNCTION_136();
                OUTLINED_FUNCTION_136();
                sub_2461323DC();
                v78 = OUTLINED_FUNCTION_62();
                if (os_log_type_enabled(v77, v78))
                {
                  v79 = OUTLINED_FUNCTION_2();
                  v92 = OUTLINED_FUNCTION_2();
                  v95[0] = (uint64_t)v92;
                  *(_DWORD *)v79 = 136315650;
                  v80 = OUTLINED_FUNCTION_16_3();
                  v94 = OUTLINED_FUNCTION_22_1(v80, v81);
                  OUTLINED_FUNCTION_1_1();
                  OUTLINED_FUNCTION_17_0();
                  *(_WORD *)(v79 + 12) = 2080;
                  OUTLINED_FUNCTION_56();
                  v94 = OUTLINED_FUNCTION_15_4(v86, v82, v95);
                  OUTLINED_FUNCTION_1_1();
                  OUTLINED_FUNCTION_9_5();
                  *(_WORD *)(v79 + 22) = 2080;
                  OUTLINED_FUNCTION_11();
                  sub_246132598();
                  v83 = swift_bridgeObjectRelease();
                  v94 = OUTLINED_FUNCTION_14_3(v83, v84, v95);
                  OUTLINED_FUNCTION_1_1();
                  OUTLINED_FUNCTION_44_1();
                  OUTLINED_FUNCTION_55();
                  OUTLINED_FUNCTION_45_2(&dword_246105000, v77, v78, "%s: Not adding intent class %s, parameter combination: %s", (uint8_t *)v79);
                  OUTLINED_FUNCTION_44_2();
                  OUTLINED_FUNCTION_0();
                }

                OUTLINED_FUNCTION_44_1();
                OUTLINED_FUNCTION_44_1();
                OUTLINED_FUNCTION_55_0();
                v67 = OUTLINED_FUNCTION_217();
                goto LABEL_47;
              }
              v39 = *(_QWORD *)(v90 + 8 * v40);
              if (!v39)
              {
                while (1)
                {
                  v35 = v40 + 1;
                  if (__OFADD__(v40, 1))
                    goto LABEL_60;
                  if (v35 >= (uint64_t)v92)
                    goto LABEL_53;
                  v39 = *(_QWORD *)(v90 + 8 * v35);
                  ++v40;
                  if (v39)
                    goto LABEL_26;
                }
              }
              v35 = v40;
            }
          }
        }
LABEL_26:
        v33 = (v39 - 1) & v39;
        v37 = __clz(__rbit64(v39)) + (v35 << 6);
      }
      v41 = *(_QWORD *)(v22 + 40);
    }
    while (!*(_QWORD *)(v41 + 16));
    v42 = a3;
    v43 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v37);
    v44 = *v43;
    v45 = v43[1];
    sub_246132814();
    OUTLINED_FUNCTION_119();
    sub_24613249C();
    v46 = sub_24613282C();
    v47 = -1 << *(_BYTE *)(v41 + 32);
    v48 = v46 & ~v47;
    OUTLINED_FUNCTION_50_1();
    if ((v49 & 1) != 0)
      break;
LABEL_42:
    result = swift_bridgeObjectRelease();
    v22 = v93;
    a3 = v42;
  }
  v50 = *(_QWORD *)(v41 + 48);
  v51 = (_QWORD *)(v50 + 16 * v48);
  v52 = *v51 == v44 && v51[1] == v45;
  if (!v52 && (OUTLINED_FUNCTION_8_4() & 1) == 0)
  {
    v53 = ~v47;
    do
    {
      v48 = (v48 + 1) & v53;
      OUTLINED_FUNCTION_50_1();
      if ((v54 & 1) == 0)
        goto LABEL_42;
      v55 = (_QWORD *)(v50 + 16 * v48);
      v56 = *v55 == v44 && v55[1] == v45;
    }
    while (!v56 && (OUTLINED_FUNCTION_8_4() & 1) == 0);
  }
  sub_2461323D0();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_119();
  v57 = sub_2461323DC();
  v58 = sub_2461325BC();
  v59 = v58;
  v92 = v57;
  if (os_log_type_enabled(v57, v58))
  {
    v60 = OUTLINED_FUNCTION_2();
    v90 = OUTLINED_FUNCTION_2();
    v95[0] = v90;
    *(_DWORD *)v60 = 136315906;
    v61 = OUTLINED_FUNCTION_16_3();
    v94 = OUTLINED_FUNCTION_22_1(v61, v62);
    LODWORD(v89) = v59;
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_17_0();
    *(_WORD *)(v60 + 12) = 2080;
    OUTLINED_FUNCTION_56();
    v94 = OUTLINED_FUNCTION_15_4(v86, v63, v95);
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_9_5();
    *(_WORD *)(v60 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_246132598();
    v64 = swift_bridgeObjectRelease();
    v94 = OUTLINED_FUNCTION_14_3(v64, v65, v95);
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_55();
    *(_WORD *)(v60 + 32) = 2080;
    OUTLINED_FUNCTION_119();
    v94 = sub_246119920(v44, v45, v95);
    OUTLINED_FUNCTION_4_8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246105000, v92, (os_log_type_t)v89, "%s: Not adding intent class %s, parameter combination: %s since it contains a denied parameter: '%s'", (uint8_t *)v60, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_25_2();

  OUTLINED_FUNCTION_24_1();
  swift_release();
  return 1;
}

uint64_t type metadata accessor for INIntentParameterCombinationDenyListProvider()
{
  return objc_opt_self();
}

unint64_t sub_24612ACE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_31_1();
  v4 = OUTLINED_FUNCTION_33_0();
  return sub_24612ADBC(a1, a2, v4);
}

unint64_t sub_24612AD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_40();
  sub_24613249C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_33_0();
  v6 = OUTLINED_FUNCTION_217();
  return sub_24612AE9C(v6, v7, a3, a4, v8);
}

unint64_t sub_24612ADBC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2461327CC() & 1) == 0)
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
      while (!v14 && (sub_2461327CC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24612AE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;

  v6 = v5 + 64;
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = a5 & ~v7;
  if (((*(_QWORD *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v13 = ~v7;
    v14 = *(_QWORD *)(v5 + 48);
    do
    {
      v15 = (_QWORD *)(v14 + 32 * v8);
      v16 = v15[2];
      v17 = v15[3];
      v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_2461327CC() & 1) != 0)
      {
        v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_2461327CC() & 1) != 0)
          break;
      }
      v8 = (v8 + 1) & v13;
    }
    while (((*(_QWORD *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

uint64_t sub_24612AF94(uint64_t a1, char a2)
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
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5C8);
  v36 = a2;
  v6 = sub_24613273C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
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
    v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_246132814();
    sub_24613249C();
    result = sub_24613282C();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
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
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v22;
    v32[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v27) = v23;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v34)
    {
      swift_release();
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v35 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v34)
        goto LABEL_32;
      v18 = *(_QWORD *)(v35 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v34)
  {
    v18 = *(_QWORD *)(v35 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v34)
          goto LABEL_32;
        v18 = *(_QWORD *)(v35 + 8 * v13);
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
LABEL_34:
  if ((v36 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_24612B588(0, (unint64_t)(v33 + 63) >> 6, v17);
    else
      *v17 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24612B298(uint64_t a1, char a2)
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
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5D8);
  v36 = a2;
  v6 = sub_24613273C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
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
    v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v36 & 1) == 0)
    {
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_17_2();
    }
    sub_246132814();
    sub_24613249C();
    result = sub_24613282C();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
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
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v22;
    v32[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v27) = v23;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v34)
    {
      OUTLINED_FUNCTION_236();
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v35 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v34)
        goto LABEL_32;
      v18 = *(_QWORD *)(v35 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v34)
  {
    v18 = *(_QWORD *)(v35 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v34)
          goto LABEL_32;
        v18 = *(_QWORD *)(v35 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  OUTLINED_FUNCTION_236();
LABEL_34:
  if ((v36 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_24612B588(0, (unint64_t)(v33 + 63) >> 6, v17);
    else
      *v17 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = OUTLINED_FUNCTION_236();
  *v3 = v7;
  return result;
}

uint64_t sub_24612B588(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_24612B5A4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;

  v7 = *v3;
  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_47_1();
  v8 = OUTLINED_FUNCTION_33_0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  OUTLINED_FUNCTION_3_6();
  if ((v11 & 1) != 0)
  {
    v12 = *(_QWORD *)(v7 + 48);
    OUTLINED_FUNCTION_41_0(v12 + 16 * v10);
    v14 = v14 && v13 == a3;
    if (v14 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
    {
LABEL_7:
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_4_1();
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_3_6();
      if ((v19 & 1) == 0)
        break;
      OUTLINED_FUNCTION_41_0(v12 + 16 * v10);
      v21 = v14 && v20 == a3;
      if (v21 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
        goto LABEL_7;
    }
  }
  OUTLINED_FUNCTION_4_1();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v3;
  *v3 = 0x8000000000000000;
  OUTLINED_FUNCTION_56();
  sub_24612BDA4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24612B6F4(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  _QWORD v19[9];

  v5 = *v2;
  sub_246132814();
  swift_bridgeObjectRetain();
  sub_24612CFBC((uint64_t)v19, a2);
  v6 = sub_24613282C();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v9 = swift_bridgeObjectRetain();
    sub_246127D04(v9, a2);
    v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
      swift_bridgeObjectRetain();
      return 0;
    }
    v12 = ~v7;
    while (1)
    {
      v8 = (v8 + 1) & v12;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        break;
      v13 = swift_bridgeObjectRetain();
      sub_246127D04(v13, a2);
      v15 = v14;
      swift_bridgeObjectRelease();
      if ((v15 & 1) != 0)
        goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19[0] = *v2;
  *v2 = 0x8000000000000000;
  v18 = swift_bridgeObjectRetain();
  sub_24612BF3C(v18, v8, isUniquelyReferenced_nonNull_native);
  *v2 = v19[0];
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

uint64_t sub_24612B884()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C578);
  v3 = sub_246132670();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_246132814();
      sub_24613249C();
      result = sub_24613282C();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_24612B588(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_24612BB5C()
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
  unint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20[72];

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5B8);
  v3 = sub_246132670();
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
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      sub_246132814();
      sub_24612CFBC((uint64_t)v20, v18);
      sub_24613282C();
      result = sub_246132658();
      *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * result) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v15 >= v9)
        goto LABEL_23;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_23;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_23;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_23:
              swift_release();
              v19 = 1 << *(_BYTE *)(v2 + 32);
              if (v19 > 63)
                sub_24612B588(0, (unint64_t)(v19 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v19;
              v1 = v0;
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
                  goto LABEL_29;
                if (v12 >= v9)
                  goto LABEL_23;
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

uint64_t sub_24612BDA4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_24612B884();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_24612C0C8();
      goto LABEL_22;
    }
    sub_24612C420();
  }
  v11 = *v4;
  sub_246132814();
  sub_24613249C();
  result = sub_24613282C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2461327CC(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2461327F0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_2461327CC();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_24612BF3C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _BYTE v21[72];

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_24612BB5C();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_24612C278();
      goto LABEL_14;
    }
    sub_24612C6C8();
  }
  v8 = *v3;
  sub_246132814();
  sub_24612CFBC((uint64_t)v21, v5);
  result = sub_24613282C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = swift_bridgeObjectRetain();
    sub_246127D04(v10, v5);
    v12 = v11;
    result = swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441C568);
      result = sub_2461327F0();
      __break(1u);
    }
    else
    {
      v13 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = swift_bridgeObjectRetain();
        sub_246127D04(v14, v5);
        v16 = v15;
        result = swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v17 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * a2) = v5;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    *(_QWORD *)(v17 + 16) = v20;
  return result;
}

void *sub_24612C0C8()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C578);
  v2 = *v0;
  v3 = sub_246132664();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24612C278()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5B8);
  v2 = *v0;
  v3 = sub_246132664();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24612C420()
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
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C578);
  v3 = sub_246132670();
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
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_246132814();
    swift_bridgeObjectRetain();
    sub_24613249C();
    result = sub_24613282C();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_24612C6C8()
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
  unint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  char v19[72];

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5B8);
  v3 = sub_246132670();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = swift_release();
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
    sub_246132814();
    swift_bridgeObjectRetain();
    sub_24612CFBC((uint64_t)v19, v18);
    sub_24613282C();
    result = sub_246132658();
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * result) = v18;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v9)
      goto LABEL_23;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_23;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_23;
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
LABEL_23:
    swift_release();
    v1 = v0;
    goto LABEL_24;
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
      goto LABEL_23;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24612C8DC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a2;
}

uint64_t sub_24612C924(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_24612C96C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  __int128 v32;

  sub_24612CC80(a1, &v32);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_24612CCA8();
  if (v8)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (_QWORD *)*a5;
      v15 = sub_24612ACE4(v10, v11);
      v16 = v13[2];
      v17 = (v14 & 1) == 0;
      v18 = v16 + v17;
      if (__OFADD__(v16, v17))
        break;
      v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25754B5C0);
          sub_246132700();
        }
      }
      else
      {
        sub_24612AF94(v18, a4 & 1);
        v20 = sub_24612ACE4(v10, v11);
        if ((v19 & 1) != (v21 & 1))
          goto LABEL_17;
        v15 = v20;
      }
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
      {
        swift_retain();
        v23 = sub_246127F58(v12);
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        v24 = v22[7];
        swift_release();
        *(_QWORD *)(v24 + 8 * v15) = v23;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        v25 = (uint64_t *)(v22[6] + 16 * v15);
        *v25 = v10;
        v25[1] = v11;
        *(_QWORD *)(v22[7] + 8 * v15) = v12;
        v26 = v22[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
          goto LABEL_16;
        v22[2] = v28;
      }
      v10 = sub_24612CCA8();
      v11 = v29;
      v12 = v30;
      a4 = 1;
      if (!v29)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2461327FC();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_24610A83C();
    return swift_release();
  }
  return result;
}

id sub_24612CB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  OUTLINED_FUNCTION_37_1();
  v6 = (void *)sub_246132478();
  OUTLINED_FUNCTION_55();
  v7 = (void *)sub_246132478();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_24612CC18@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  result = OUTLINED_FUNCTION_40_1(a1, a2);
  if (v8 != v9)
    v5 = ~v7;
  v3[1] = result;
  v3[2] = ~v4;
  v3[3] = 0;
  v3[4] = v5 & v6;
  return result;
}

uint64_t sub_24612CC3C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_24612C8DC(&v6, *a1, a1[1], a1[2]);
  v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

uint64_t sub_24612CC80@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;

  result = OUTLINED_FUNCTION_40_1(a1, a2);
  v5[1] = result;
  v5[2] = ~v9;
  if (v10 != v11)
    v12 = ~v8;
  else
    v12 = v6;
  v5[3] = 0;
  v5[4] = v12 & v7;
  v5[5] = v3;
  v5[6] = v4;
  return result;
}

uint64_t sub_24612CCA8()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    v11(&v19, v20);
    swift_release();
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v18 < v14)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_24612CE38()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_11_3();
    v11(&v19, v20);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_47();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v18 < v14)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_24612CFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;

  sub_24613282C();
  v3 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  for (v6 &= v6 - 1; ; v6 = (v12 - 1) & v12)
  {
    sub_246132814();
    swift_bridgeObjectRetain();
    sub_24613249C();
    v14 = sub_24613282C();
    result = swift_bridgeObjectRelease();
    v9 ^= v14;
    if (v6)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v10++, 1))
      goto LABEL_19;
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_246132820();
    }
    v12 = *(_QWORD *)(v3 + 8 * v10);
    if (!v12)
      break;
LABEL_14:
    ;
  }
  v13 = v10 + 1;
  if (v10 + 1 >= v7)
    goto LABEL_17;
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    ++v10;
    goto LABEL_14;
  }
  while (1)
  {
    v10 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v10 >= v7)
      goto LABEL_17;
    v12 = *(_QWORD *)(v3 + 8 * v10);
    ++v13;
    if (v12)
      goto LABEL_14;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

unint64_t sub_24612D154()
{
  unint64_t result;

  result = qword_25754B580;
  if (!qword_25754B580)
  {
    result = MEMORY[0x249550960](&unk_246133D78, &type metadata for DeniedIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B580);
  }
  return result;
}

void sub_24612D190(uint64_t a1)
{
  uint64_t v1;

  if (!OUTLINED_FUNCTION_53_2(a1))
  {
    OUTLINED_FUNCTION_37_1();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754B588);
    sub_24612D1E4(v1);
    OUTLINED_FUNCTION_20_4();
  }
  OUTLINED_FUNCTION_19_4();
}

unint64_t sub_24612D1E4(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = OUTLINED_FUNCTION_53_2(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441C568);
    v8 = v6;
    result = MEMORY[0x249550960](v5, v7, &v8);
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_24612D240()
{
  unint64_t result;

  result = qword_25754B5D0;
  if (!qword_25754B5D0)
  {
    result = MEMORY[0x249550960](&unk_246133D50, &type metadata for INIntentParameterCombinationDenyList);
    atomic_store(result, (unint64_t *)&qword_25754B5D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for INIntentParameterCombinationDenyList()
{
  return &type metadata for INIntentParameterCombinationDenyList;
}

uint64_t getEnumTagSinglePayload for DeniedIntent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DeniedIntent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24612D360 + 4 * byte_246133B59[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24612D394 + 4 * byte_246133B54[v4]))();
}

uint64_t sub_24612D394(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24612D39C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24612D3A4);
  return result;
}

uint64_t sub_24612D3B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24612D3B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24612D3BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24612D3C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeniedIntent.CodingKeys()
{
  return &type metadata for DeniedIntent.CodingKeys;
}

unint64_t sub_24612D3E4()
{
  unint64_t result;

  result = qword_25754B5E0;
  if (!qword_25754B5E0)
  {
    result = MEMORY[0x249550960](&unk_246133D00, &type metadata for DeniedIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B5E0);
  }
  return result;
}

unint64_t sub_24612D424()
{
  unint64_t result;

  result = qword_25754B5E8;
  if (!qword_25754B5E8)
  {
    result = MEMORY[0x249550960](&unk_246133C70, &type metadata for DeniedIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B5E8);
  }
  return result;
}

unint64_t sub_24612D464()
{
  unint64_t result;

  result = qword_25754B5F0;
  if (!qword_25754B5F0)
  {
    result = MEMORY[0x249550960](&unk_246133C98, &type metadata for DeniedIntent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B5F0);
  }
  return result;
}

unint64_t sub_24612D4A0()
{
  unint64_t result;

  result = qword_25754B600;
  if (!qword_25754B600)
  {
    result = MEMORY[0x249550960](&unk_246133E80, &type metadata for INIntentParameterCombinationDenyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B600);
  }
  return result;
}

void sub_24612D4DC(uint64_t a1)
{
  uint64_t v1;

  if (!OUTLINED_FUNCTION_53_2(a1))
  {
    OUTLINED_FUNCTION_37_1();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754B608);
    sub_24612D52C(v1);
    OUTLINED_FUNCTION_20_4();
  }
  OUTLINED_FUNCTION_19_4();
}

unint64_t sub_24612D52C(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = OUTLINED_FUNCTION_53_2(a1);
  if (!result)
  {
    v4 = v3;
    v5 = type metadata accessor for DeniedIntent();
    result = MEMORY[0x249550960](v4, v5);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for INIntentParameterCombinationDenyList.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for INIntentParameterCombinationDenyList.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24612D5F8 + 4 * byte_246133B5E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24612D618 + 4 * byte_246133B63[v4]))();
}

_BYTE *sub_24612D5F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24612D618(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24612D620(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24612D628(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24612D630(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24612D638(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24612D644()
{
  return 0;
}

ValueMetadata *type metadata accessor for INIntentParameterCombinationDenyList.CodingKeys()
{
  return &type metadata for INIntentParameterCombinationDenyList.CodingKeys;
}

unint64_t sub_24612D660()
{
  unint64_t result;

  result = qword_25754B638;
  if (!qword_25754B638)
  {
    result = MEMORY[0x249550960](&unk_246133E58, &type metadata for INIntentParameterCombinationDenyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B638);
  }
  return result;
}

unint64_t sub_24612D6A0()
{
  unint64_t result;

  result = qword_25754B640;
  if (!qword_25754B640)
  {
    result = MEMORY[0x249550960](&unk_246133DC8, &type metadata for INIntentParameterCombinationDenyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B640);
  }
  return result;
}

unint64_t sub_24612D6E0()
{
  unint64_t result;

  result = qword_25754B648;
  if (!qword_25754B648)
  {
    result = MEMORY[0x249550960](&unk_246133DF0, &type metadata for INIntentParameterCombinationDenyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B648);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_2461327CC();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_2461327B4();
}

uint64_t OUTLINED_FUNCTION_14_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_246119920(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_15_4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_246119920(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_246132868();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_20_4()
{
  JUMPOUT(0x249550960);
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246119920(a1, a2, (uint64_t *)(v2 - 160));
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 224) + 8))(v0, *(_QWORD *)(v1 - 240));
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_26_2(uint64_t a1, ...)
{
  uint64_t v1;
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return sub_24612B5A4((uint64_t *)va, v1, v2);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_24613249C();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_246132814();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return sub_246132844();
}

uint64_t OUTLINED_FUNCTION_40_1@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return a1 + 64;
}

uint64_t OUTLINED_FUNCTION_41_0@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_45_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return sub_24613249C();
}

uint64_t OUTLINED_FUNCTION_53_2(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_24612D938(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_source;
  v4 = *MEMORY[0x24BE91900];
  v5 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v3, v4, v5);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_histogram) = a1;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60008]), sel_init);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_appShortcutProvider) = v6;
  return v1;
}

void sub_24612D9C8(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
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
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  char v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v80[4];
  unint64_t v81;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C4B0);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_60();
  v70 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C538);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_60();
  v69 = v9;
  v10 = sub_2461322C8();
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_60();
  v66 = v12;
  v64 = *(_QWORD *)(sub_2461323E8() - 8);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_60();
  v63 = v14;
  v81 = MEMORY[0x24BEE4AF8];
  v16 = OUTLINED_FUNCTION_8_5(v15, sel_orderedPhrases);
  sub_24612E454();
  v17 = sub_24613252C();

  if (v17 >> 62)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    v18 = sub_246132724();
    OUTLINED_FUNCTION_46();
    if (v18)
      goto LABEL_3;
LABEL_33:
    OUTLINED_FUNCTION_46();
    v55 = OUTLINED_FUNCTION_1_2();
    v56 = v81;
    if ((v55 & 1) == 0)
    {
      sub_2461176F8(1, v81);
      sub_2461175B0(v57, v58, v59, v60);
      v56 = v61;
    }
    sub_2461195EC(v56);
    return;
  }
  v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v18)
    goto LABEL_33;
LABEL_3:
  if (v18 >= 1)
  {
    v19 = 0;
    v73 = v17 & 0xC000000000000001;
    v65 = *MEMORY[0x24BE91900];
    v74 = (void *)a1;
    v71 = v17;
    v72 = v18;
    v78 = a2;
    while (1)
    {
      v76 = v19;
      if (v73)
        v20 = (id)MEMORY[0x249550420]();
      else
        v20 = *(id *)(v17 + 8 * v19 + 32);
      v77 = v20;
      v21 = objc_msgSend(v20, sel_localizedPhrase);
      sub_246132484();

      v22 = sub_2461321C0();
      v23 = *(_QWORD *)(v22 + 16);
      v24 = a3;
      OUTLINED_FUNCTION_40();
      v25 = a2;
      if (v23)
      {
        v24 = a3;
        v26 = sub_24612ACE4(a2, a3);
        v25 = a2;
        if ((v27 & 1) != 0)
        {
          v28 = (uint64_t *)(*(_QWORD *)(v22 + 56) + 16 * v26);
          v25 = *v28;
          v24 = v28[1];
          OUTLINED_FUNCTION_40();
          swift_bridgeObjectRelease();
        }
      }
      OUTLINED_FUNCTION_46();
      v29 = OUTLINED_FUNCTION_1_2();
      sub_24610A364((uint64_t)a4, (uint64_t)v80);
      if ((v29 & 1) != 0)
      {
        v30 = (uint64_t)__swift_project_boxed_opaque_existential_1(v80, v80[3]);
        v31 = OUTLINED_FUNCTION_8_5(v30, sel_actionIdentifier);
        sub_246132484();

        LOBYTE(v30) = sub_24610FA54();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
        if ((v30 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          sub_2461323D0();
          swift_bridgeObjectRetain_n();
          v45 = (id)a1;
          OUTLINED_FUNCTION_40();
          v46 = sub_2461323DC();
          v47 = sub_2461325C8();
          if (os_log_type_enabled(v46, v47))
          {
            v62 = v47;
            v48 = swift_slowAlloc();
            v80[0] = swift_slowAlloc();
            *(_DWORD *)v48 = 136315650;
            v49 = objc_msgSend(v45, sel_actionIdentifier);
            v50 = sub_246132484();
            v52 = v51;

            sub_246119920(v50, v52, v80);
            sub_246132610();

            swift_bridgeObjectRelease();
            *(_WORD *)(v48 + 12) = 2080;
            swift_bridgeObjectRetain();
            v53 = sub_246119920(v78, a3, v80);
            OUTLINED_FUNCTION_5_2(v53);
            sub_246132610();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v48 + 22) = 2080;
            OUTLINED_FUNCTION_40();
            v54 = sub_246119920(v25, v24, v80);
            OUTLINED_FUNCTION_5_2(v54);
            sub_246132610();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_246105000, v46, v62, "First party app shortcut not approved in the allow list\nactionIdentifier: %s\nappBundleId: %s\niosVersionBundleId: %s", (uint8_t *)v48, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0();
          }

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();

          OUTLINED_FUNCTION_11_6(v63, *(uint64_t (**)(uint64_t, _QWORD))(v64 + 8));
          a2 = v78;
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
      }
      v32 = __swift_project_boxed_opaque_existential_1(a4, a4[3]);
      v33 = OUTLINED_FUNCTION_8_5((uint64_t)v32, sel_actionIdentifier);
      sub_246132484();
      OUTLINED_FUNCTION_7_4();
      sub_24610FB40();
      v35 = v34;
      swift_bridgeObjectRelease();
      if (v35)
        swift_bridgeObjectRelease();
      sub_246132370();
      swift_bridgeObjectRetain();
      v36 = objc_msgSend(v74, sel_actionIdentifier);
      sub_246132484();
      OUTLINED_FUNCTION_7_4();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v67 + 104))(v66, v65, v68);
      v37 = sub_2461321D8();
      OUTLINED_FUNCTION_63(v69, v38, v39, v37);
      v40 = sub_246132034();
      OUTLINED_FUNCTION_63(v70, v41, v42, v40);
      v43 = sub_246132328();
      if (objc_msgSend(v77, sel_isPrimary))
      {
        v17 = v81;
        if (v81 >> 62)
        {
          OUTLINED_FUNCTION_165();
          swift_bridgeObjectRetain();
          a1 = sub_246132724();
          OUTLINED_FUNCTION_46();
          a2 = v78;
          if (a1 < 0)
          {
            __break(1u);
            goto LABEL_32;
          }
        }
        else
        {
          OUTLINED_FUNCTION_165();
          a2 = v78;
        }
        sub_24612E490(0, 0, v43);
        a1 = (uint64_t)v74;
      }
      else
      {
        v44 = OUTLINED_FUNCTION_165();
        MEMORY[0x2495502AC](v44);
        if (*(_QWORD *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246132550();
        sub_246132568();
        sub_246132544();
        a1 = (uint64_t)v74;
        a2 = v78;
      }
      swift_release();

LABEL_25:
      v17 = v71;
      v19 = v76 + 1;
      if (v72 == v76 + 1)
        goto LABEL_33;
    }
  }
  __break(1u);
}

uint64_t sub_24612E1E8(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v2 = sub_2461323E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461323D0();
  v6 = sub_2461323DC();
  v7 = sub_2461325BC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_246105000, v6, v7, "Ranking App Shortcut phrases", v8, 2u);
    MEMORY[0x249550A14](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_retain();
  sub_246111034(a1);
  return swift_release();
}

uint64_t sub_24612E304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return v0;
}

uint64_t sub_24612E368()
{
  sub_24612E304();
  return swift_deallocClassInstance();
}

uint64_t sub_24612E38C()
{
  return type metadata accessor for AppShortcutsSource();
}

uint64_t type metadata accessor for AppShortcutsSource()
{
  uint64_t result;

  result = qword_25754B680;
  if (!qword_25754B680)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24612E3CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461322C8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_24612E454()
{
  unint64_t result;

  result = qword_25754B740;
  if (!qword_25754B740)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25754B740);
  }
  return result;
}

uint64_t sub_24612E490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v5 = a2;
    v6 = a1;
    v7 = *v4;
    if (!(*v4 >> 62))
    {
      v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v9 = sub_246132724();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v9 < v5)
  {
    __break(1u);
    goto LABEL_32;
  }
  v10 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v8 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v7 = *v4;
  if (!(*v4 >> 62))
  {
    v11 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  swift_bridgeObjectRetain();
  v11 = sub_246132724();
  swift_bridgeObjectRelease();
LABEL_9:
  v12 = v11 + v8;
  if (__OFADD__(v11, v8))
  {
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v15 = sub_246132724();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v7 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v7;
  v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v14 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v12 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v11 = 1;
  }
  if (v7 >> 62)
    goto LABEL_36;
  v15 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v15 <= v12)
    v15 = v12;
  swift_bridgeObjectRetain();
  v7 = MEMORY[0x24955042C](v11, v15, 1, v7);
  swift_bridgeObjectRelease();
  *v4 = v7;
  v14 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v16 = v14 + 32 + 8 * v6;
  sub_246132370();
  swift_arrayDestroy();
  if (!v8)
  {
LABEL_28:
    *(_QWORD *)v16 = v3;
    return sub_246132544();
  }
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_246132724();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)(v14 + 16);
  }
  if (__OFSUB__(v17, v5))
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)sub_2461301DC((char *)(v14 + 32 + 8 * v5), v17 - v5, (char *)(v16 + 8));
    if (!(v7 >> 62))
    {
      v19 = *(_QWORD *)(v14 + 16);
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain();
  v19 = sub_246132724();
  result = swift_bridgeObjectRelease();
LABEL_26:
  if (!__OFADD__(v19, v8))
  {
    *(_QWORD *)(v14 + 16) = v19 + v8;
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2461324E4();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return v1 - 136;
}

void OUTLINED_FUNCTION_7_4()
{
  void *v0;

}

id OUTLINED_FUNCTION_8_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_11_6@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 264));
}

uint64_t sub_24612E744(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x657361726870 && a2 == 0xE600000000000000;
  if (v3 || (sub_2461327CC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x657079546E6F6369 && a2 == 0xE800000000000000;
    if (v6 || (sub_2461327CC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E6564496E6F6369 && a2 == 0xEE00726569666974;
      if (v7 || (sub_2461327CC() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x4464656C62616E65 && a2 == 0xEE00736563697665;
        if (v8 || (sub_2461327CC() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6C646E7542534F69 && a2 == 0xEB00000000644965;
          if (v9 || (sub_2461327CC() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x8000000246134470 || (sub_2461327CC() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v11 = sub_2461327CC();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 6;
            else
              return 7;
          }
        }
      }
    }
  }
}

uint64_t sub_24612EA14()
{
  return 7;
}

uint64_t sub_24612EA1C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24612EA54 + 4 * byte_246133F20[a1]))(0xD000000000000010, 0x8000000246134470);
}

uint64_t sub_24612EA54()
{
  return 0x657361726870;
}

uint64_t sub_24612EA68()
{
  return 0x657079546E6F6369;
}

uint64_t sub_24612EA80()
{
  return 0x6E6564496E6F6369;
}

uint64_t sub_24612EAA4()
{
  return 0x4464656C62616E65;
}

uint64_t sub_24612EAC8()
{
  return 0x6C646E7542534F69;
}

uint64_t sub_24612EAE8()
{
  return 0x746E65746E69;
}

void sub_24612EAFC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v10[16];
  uint64_t v11;
  char v12;
  char v13;
  char v14;

  v4 = v1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B8C0);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v10[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24613169C();
  OUTLINED_FUNCTION_34_2();
  v14 = 0;
  OUTLINED_FUNCTION_2_7();
  if (!v2)
  {
    v13 = 1;
    OUTLINED_FUNCTION_2_7();
    v12 = 2;
    OUTLINED_FUNCTION_2_7();
    v11 = *(_QWORD *)(v4 + 48);
    v10[15] = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
    sub_2461316D8(&qword_25754B8C8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_2461327B4();
    v10[14] = 4;
    OUTLINED_FUNCTION_2_7();
    v10[13] = 5;
    OUTLINED_FUNCTION_2_7();
    v10[12] = 6;
    sub_246132790();
  }
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v9, v6);
  OUTLINED_FUNCTION_18_4();
}

uint64_t sub_24612ECB4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
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
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754B8B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24613169C();
  sub_246132838();
  if (v2)
    return OUTLINED_FUNCTION_29_2();
  v50 = 0;
  v9 = OUTLINED_FUNCTION_3_7();
  v11 = v10;
  v49 = 1;
  OUTLINED_FUNCTION_32_2();
  v38 = OUTLINED_FUNCTION_3_7();
  v39 = v9;
  v48 = 2;
  v13 = v12;
  OUTLINED_FUNCTION_32_2();
  v14 = OUTLINED_FUNCTION_3_7();
  v42 = v13;
  v37 = v14;
  v16 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C550);
  v47 = 3;
  sub_2461316D8((unint64_t *)&qword_25441C558, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  v41 = v16;
  swift_bridgeObjectRetain();
  sub_246132784();
  v46 = 4;
  v36 = v43;
  swift_bridgeObjectRetain();
  v35 = OUTLINED_FUNCTION_3_7();
  v45 = 5;
  v40 = v17;
  swift_bridgeObjectRetain();
  v33 = OUTLINED_FUNCTION_3_7();
  v34 = v18;
  v44 = 6;
  OUTLINED_FUNCTION_32_2();
  v19 = sub_246132760();
  v21 = v20;
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v32 = v19;
  v22(v8, v5);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_29_2();
  swift_bridgeObjectRelease();
  v23 = v34;
  swift_bridgeObjectRelease();
  v24 = v40;
  swift_bridgeObjectRelease();
  v25 = v36;
  swift_bridgeObjectRelease();
  v26 = v41;
  swift_bridgeObjectRelease();
  v27 = v42;
  swift_bridgeObjectRelease();
  result = OUTLINED_FUNCTION_10_0();
  *a2 = v39;
  a2[1] = v11;
  a2[2] = v38;
  a2[3] = v27;
  a2[4] = v37;
  a2[5] = v26;
  v29 = v35;
  a2[6] = v25;
  a2[7] = v29;
  v30 = v33;
  a2[8] = v24;
  a2[9] = v30;
  v31 = v32;
  a2[10] = v23;
  a2[11] = v31;
  a2[12] = v21;
  return result;
}

uint64_t sub_24612F0CC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6465766F72707061 && a2 == 0xEF73657361726850)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2461327CC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24612F168()
{
  return 0x6465766F72707061;
}

void sub_24612F18C(_QWORD *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B880);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_28_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2461310F4();
  OUTLINED_FUNCTION_34_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B868);
  sub_24613116C(&qword_25754B888, (uint64_t (*)(void))sub_2461311C8, MEMORY[0x24BEE12A0]);
  sub_2461327B4();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_18_4();
}

_QWORD *sub_24612F268(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754B858);
  OUTLINED_FUNCTION_38_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_28_0();
  v4 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2461310F4();
  sub_246132838();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B868);
    sub_24613116C(&qword_25754B870, (uint64_t (*)(void))sub_246131130, MEMORY[0x24BEE12D0]);
    sub_246132784();
    OUTLINED_FUNCTION_23_3();
    v4 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v4;
}

uint64_t sub_24612F388()
{
  unsigned __int8 *v0;

  return sub_24612EA1C(*v0);
}

uint64_t sub_24612F390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24612E744(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24612F3B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24612EA14();
  *a1 = result;
  return result;
}

uint64_t sub_24612F3D8()
{
  sub_24613169C();
  return sub_246132850();
}

uint64_t sub_24612F400()
{
  sub_24613169C();
  return sub_24613285C();
}

void *sub_24612F428@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  void *result;
  uint64_t __src[13];

  result = (void *)sub_24612ECB4(a1, __src);
  if (!v2)
    return memcpy(a2, __src, 0x68uLL);
  return result;
}

void sub_24612F470(_QWORD *a1)
{
  sub_24612EAFC(a1);
}

uint64_t sub_24612F488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24612F0CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24612F4B0()
{
  sub_2461310F4();
  return sub_246132850();
}

uint64_t sub_24612F4D8()
{
  sub_2461310F4();
  return sub_24613285C();
}

_QWORD *sub_24612F500@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_24612F268(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_24612F528(_QWORD *a1)
{
  sub_24612F18C(a1);
}

uint64_t sub_24612F540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  BOOL v10;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unsigned int *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v10 = a1 == 0x6E6F6349707061 && a2 == 0xE700000000000000;
  if (v10 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
  {
    *a7 = a5;
    a7[1] = a6;
    v15 = *MEMORY[0x24BEA75E8];
    v16 = OUTLINED_FUNCTION_36_2();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(a7, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)a7, 0, 1, v16);
    return swift_bridgeObjectRetain();
  }
  v17 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
  if (v17 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
  {
    *a7 = a3;
    a7[1] = a4;
    v18 = (unsigned int *)MEMORY[0x24BEA75D8];
LABEL_19:
    v22 = *v18;
    v23 = OUTLINED_FUNCTION_36_2();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(a7, v22, v23);
    __swift_storeEnumTagSinglePayload((uint64_t)a7, 0, 1, v23);
    return swift_bridgeObjectRetain();
  }
  v19 = a1 == 0x6C6F626D7973 && a2 == 0xE600000000000000;
  if (v19 || (OUTLINED_FUNCTION_6_5() & 1) != 0)
  {
    v20 = (uint64_t)a7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754B838) + 48);
    *a7 = a3;
    a7[1] = a4;
    v21 = sub_2461321CC();
    __swift_storeEnumTagSinglePayload(v20, 1, 1, v21);
    v18 = (unsigned int *)MEMORY[0x24BEA75E0];
    goto LABEL_19;
  }
  v25 = OUTLINED_FUNCTION_36_2();
  return __swift_storeEnumTagSinglePayload((uint64_t)a7, 1, 1, v25);
}

uint64_t sub_24612F748(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  char v14;
  uint64_t result;
  char *v16;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_49();
    v2 = sub_246132724();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_49();
    if (v2)
    {
LABEL_3:
      if (v2 >= 1)
      {
        v3 = 0;
        v4 = MEMORY[0x24BEE4AF8];
        while (1)
        {
          if ((a1 & 0xC000000000000001) != 0)
            MEMORY[0x249550420](v3, a1);
          else
            OUTLINED_FUNCTION_2_5();
          v5 = sub_2461322EC();
          if ((v6 & 1) != 0)
          {
            v7 = 0;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
LABEL_15:
              OUTLINED_FUNCTION_3_5();
              v4 = v9;
            }
          }
          else
          {
            v7 = v5;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              goto LABEL_15;
          }
          v8 = *(_QWORD *)(v4 + 16);
          if (v8 >= *(_QWORD *)(v4 + 24) >> 1)
          {
            OUTLINED_FUNCTION_3_5();
            v4 = v10;
          }
          ++v3;
          *(_QWORD *)(v4 + 16) = v8 + 1;
          *(_QWORD *)(v4 + 8 * v8 + 32) = v7;
          swift_release();
          if (v2 == v3)
            goto LABEL_18;
        }
      }
      __break(1u);
LABEL_30:
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
  }
  v4 = MEMORY[0x24BEE4AF8];
LABEL_18:
  OUTLINED_FUNCTION_47();
  v16 = (char *)v4;
  swift_bridgeObjectRetain();
  sub_246130774(&v16);
  swift_bridgeObjectRelease();
  v11 = v16;
  if (!v2)
    return swift_release();
  if (v2 < 1)
    goto LABEL_30;
  OUTLINED_FUNCTION_49();
  v12 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      MEMORY[0x249550420](v12, a1);
    else
      OUTLINED_FUNCTION_2_5();
    ++v12;
    v13 = COERCE_DOUBLE(sub_2461322EC());
    if ((v14 & 1) != 0)
      v13 = 0.0;
    sub_246131A9C((uint64_t)v11, v13);
    sub_2461322F8();
    swift_release();
  }
  while (v2 != v12);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24612F980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_source;
  v2 = sub_2461322C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_31_2(OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider);
  OUTLINED_FUNCTION_31_2(OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider);
  OUTLINED_FUNCTION_31_2(OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider);
  return v0;
}

uint64_t sub_24612F9E8()
{
  sub_24612F980();
  return swift_deallocClassInstance();
}

uint64_t sub_24612FA0C()
{
  return type metadata accessor for StaticSuggestionsSource();
}

uint64_t type metadata accessor for StaticSuggestionsSource()
{
  uint64_t result;

  result = qword_25754B770;
  if (!qword_25754B770)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24612FA4C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461322C8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24612FAC4(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    result = sub_246132718();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_24613255C();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

void sub_24612FB50()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char *v7;
  size_t v8;
  char *v9;

  OUTLINED_FUNCTION_37_2();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_6();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_3();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_14_4();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B830);
    v7 = (char *)OUTLINED_FUNCTION_4_9();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_13_3(v8 - 32);
  }
  else
  {
    v7 = (char *)MEMORY[0x24BEE4AF8];
  }
  v9 = v7 + 32;
  if ((v1 & 1) != 0)
  {
    sub_246130070((char *)(v0 + 32), v2, v9);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    sub_24612FDB0(0, v2, v9, v0);
  }
  OUTLINED_FUNCTION_229();
}

void sub_24612FC00()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char *v7;
  size_t v8;
  char *v9;

  OUTLINED_FUNCTION_37_2();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_6();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_3();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_14_4();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C5B8);
    v7 = (char *)OUTLINED_FUNCTION_4_9();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_13_3(v8 - 32);
  }
  else
  {
    v7 = (char *)MEMORY[0x24BEE4AF8];
  }
  v9 = v7 + 32;
  if ((v1 & 1) != 0)
  {
    sub_2461300F4((char *)(v0 + 32), v2, v9);
    *(_QWORD *)(v0 + 16) = 0;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    sub_24612FEA0(0, v2, (unint64_t)v9, v0);
  }
  OUTLINED_FUNCTION_229();
}

void sub_24612FCB0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_24612FCD8(a1, a2, a3, a4, &qword_25754B848, &qword_25754B850);
}

void sub_24612FCC4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_24612FCD8(a1, a2, a3, a4, &qword_25754AF90, &qword_25754B840);
}

void sub_24612FCD8(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_6();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_25_3();
      if (v10)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  else
  {
    v9 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v9;
  if (v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v14 = (char *)OUTLINED_FUNCTION_4_9();
    v15 = _swift_stdlib_malloc_size(v14);
    *((_QWORD *)v14 + 2) = v12;
    *((_QWORD *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 32);
  }
  else
  {
    v14 = (char *)MEMORY[0x24BEE4AF8];
  }
  v16 = v14 + 32;
  if ((a1 & 1) != 0)
  {
    sub_246130178((char *)(a4 + 32), v12, v16);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_47();
  }
  else
  {
    sub_24612FF94(0, v12, (unint64_t)v16, a4, a6);
  }
}

char *sub_24612FDB0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_246132748();
  __break(1u);
  return result;
}

uint64_t sub_24612FEA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246132748();
  __break(1u);
  return result;
}

uint64_t sub_24612FF94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_27_3();
    goto LABEL_11;
  }
  v6 = a4 + 32 * a1 + 32;
  v7 = a3 + 32 * v5;
  if (v6 >= v7 || v6 + 32 * v5 <= a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    swift_arrayInitWithCopy();
    OUTLINED_FUNCTION_47();
    return v7;
  }
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_26_3();
LABEL_11:
  result = OUTLINED_FUNCTION_5_3();
  __break(1u);
  return result;
}

char *sub_246130070(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246132748();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2461300F4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246132748();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_246130178(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    result = (char *)OUTLINED_FUNCTION_5_3();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_3(a3, result);
  }
  return result;
}

char *sub_2461301DC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    result = (char *)OUTLINED_FUNCTION_5_3();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_10_3(a3, result);
  }
  return result;
}

void *sub_246130240(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)sub_246132748();
  __break(1u);
  return result;
}

uint64_t sub_246130308(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_246132748();
  __break(1u);
  return result;
}

uint64_t sub_2461303D4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2461303E0(a1, a2, a3, &qword_25754B840);
}

uint64_t sub_2461303E0(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_27_3();
  }
  else
  {
    v4 = a1 + 32 * a2;
    if (a3 + 32 * a2 > a1)
    {
      v5 = v4 >= a3;
      v6 = v4 == a3;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    if (v6 || !v5)
    {
      __swift_instantiateConcreteTypeFromMangledName(a4);
      OUTLINED_FUNCTION_28_2();
      return OUTLINED_FUNCTION_11_7();
    }
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_26_3();
  }
  result = OUTLINED_FUNCTION_5_3();
  __break(1u);
  return result;
}

uint64_t sub_246130480(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_246130498(a1, a2, a3, (void (*)(_QWORD))sub_2461310A8);
}

uint64_t sub_24613048C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_246130498(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE919E0]);
}

uint64_t sub_246130498(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_27_3();
  }
  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      a4(0);
      OUTLINED_FUNCTION_28_2();
      return OUTLINED_FUNCTION_11_7();
    }
    OUTLINED_FUNCTION_0_7();
    OUTLINED_FUNCTION_26_3();
  }
  result = OUTLINED_FUNCTION_5_3();
  __break(1u);
  return result;
}

char *sub_246130538(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B830);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246130070(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246130240(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_246130618()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char *v7;
  size_t v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_37_2();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_6();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_3();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_14_4();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C5B8);
    v7 = (char *)OUTLINED_FUNCTION_4_9();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_13_3(v8 - 32);
  }
  else
  {
    v7 = (char *)MEMORY[0x24BEE4AF8];
  }
  v9 = v7 + 32;
  v10 = (char *)(v0 + 32);
  if ((v1 & 1) != 0)
  {
    sub_2461300F4(v10, v2, v9);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_246130308((unint64_t)v10, v2, (unint64_t)v9);
  }
  swift_release();
  OUTLINED_FUNCTION_229();
}

void sub_2461306C0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char *v7;
  size_t v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_37_2();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_6();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_25_3();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_14_4();
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B848);
    v7 = (char *)OUTLINED_FUNCTION_4_9();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_13_3(v8 - 32);
  }
  else
  {
    v7 = (char *)MEMORY[0x24BEE4AF8];
  }
  v9 = v7 + 32;
  v10 = (char *)(v0 + 32);
  if ((v1 & 1) != 0)
  {
    sub_246130178(v10, v2, v9);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_2461303E0((unint64_t)v10, v2, (unint64_t)v9, &qword_25754B850);
  }
  swift_release();
  OUTLINED_FUNCTION_229();
}

uint64_t sub_246130774(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_246131094((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_2461307DC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2461307DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  double *v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  unint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *__dst;

  v3 = a1[1];
  result = sub_2461327C0();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_246130DBC(0, v3, 1, a1);
      return result;
    }
    goto LABEL_124;
  }
  v5 = result;
  result = sub_24612FAC4(v3 / 2);
  v85 = a1;
  v86 = result;
  __dst = v6;
  v88 = v3;
  if (v3 <= 0)
  {
    v9 = MEMORY[0x24BEE4AF8];
    v28 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_90:
    if (v28 < 2)
    {
LABEL_101:
      result = swift_bridgeObjectRelease();
      if (v88 >= -1)
      {
        *(_QWORD *)(v86 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_129;
    }
    v78 = *v85;
    while (1)
    {
      v79 = v28 - 2;
      if (v28 < 2)
        break;
      if (!v78)
        goto LABEL_133;
      v80 = *(_QWORD *)(v9 + 32 + 16 * v79);
      v81 = *(_QWORD *)(v9 + 32 + 16 * (v28 - 1) + 8);
      result = sub_246130E14((char *)(v78 + 8 * v80), (char *)(v78 + 8 * *(_QWORD *)(v9 + 32 + 16 * (v28 - 1))), v78 + 8 * v81, __dst);
      if (v1)
        goto LABEL_86;
      if (v81 < v80)
        goto LABEL_119;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_246131080(v9);
        v9 = result;
      }
      if (v79 >= *(_QWORD *)(v9 + 16))
        goto LABEL_120;
      v82 = (_QWORD *)(v9 + 32 + 16 * v79);
      *v82 = v80;
      v82[1] = v81;
      v83 = *(_QWORD *)(v9 + 16);
      if (v28 > v83)
        goto LABEL_121;
      result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v28 - 1)), (const void *)(v9 + 32 + 16 * v28), 16 * (v83 - v28));
      *(_QWORD *)(v9 + 16) = v83 - 1;
      v28 = v83 - 1;
      if (v83 <= 2)
        goto LABEL_101;
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return result;
  }
  v7 = 0;
  v8 = *a1;
  v84 = *a1 - 8;
  v9 = MEMORY[0x24BEE4AF8];
  v87 = v5;
  v89 = *a1;
  while (1)
  {
    v10 = v7++;
    if (v7 < v3)
    {
      v11 = *(double *)(v8 + 8 * v7);
      v12 = *(double *)(v8 + 8 * v10);
      v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        v13 = v11;
        while (1)
        {
          v14 = v13;
          v13 = *(double *)(v8 + 8 * v7);
          if (v11 < v12 == v13 >= v14)
            break;
          if (++v7 >= v3)
          {
            v7 = v3;
            break;
          }
        }
      }
      if (v11 < v12)
      {
        if (v7 < v10)
          goto LABEL_126;
        if (v10 < v7)
        {
          v15 = (uint64_t *)(v84 + 8 * v7);
          v16 = v7;
          v17 = v10;
          v18 = (uint64_t *)(v8 + 8 * v10);
          do
          {
            if (v17 != --v16)
            {
              if (!v8)
                goto LABEL_132;
              v19 = *v18;
              *v18 = *v15;
              *v15 = v19;
            }
            ++v17;
            --v15;
            ++v18;
          }
          while (v17 < v16);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_123;
      if (v7 - v10 < v5)
      {
        v20 = v10 + v5;
        if (__OFADD__(v10, v5))
          goto LABEL_127;
        if (v20 >= v3)
          v20 = v3;
        if (v20 < v10)
          goto LABEL_128;
        if (v7 != v20)
        {
          v21 = (double *)(v84 + 8 * v7);
          do
          {
            v22 = *(double *)(v8 + 8 * v7);
            v23 = v10;
            v24 = v21;
            do
            {
              v25 = *v24;
              if (v22 >= *v24)
                break;
              if (!v8)
                goto LABEL_130;
              *v24 = v22;
              v24[1] = v25;
              --v24;
              ++v23;
            }
            while (v7 != v23);
            ++v7;
            ++v21;
          }
          while (v7 != v20);
          v7 = v20;
        }
      }
    }
    if (v7 < v10)
      goto LABEL_122;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_246130F8C(0, *(_QWORD *)(v9 + 16) + 1, 1, (char *)v9);
      v9 = result;
    }
    v27 = *(_QWORD *)(v9 + 16);
    v26 = *(_QWORD *)(v9 + 24);
    v28 = v27 + 1;
    v8 = v89;
    if (v27 >= v26 >> 1)
    {
      result = (uint64_t)sub_246130F8C((char *)(v26 > 1), v27 + 1, 1, (char *)v9);
      v8 = v89;
      v9 = result;
    }
    *(_QWORD *)(v9 + 16) = v28;
    v29 = v9 + 32;
    v30 = (uint64_t *)(v9 + 32 + 16 * v27);
    *v30 = v10;
    v30[1] = v7;
    if (v27)
      break;
    v28 = 1;
LABEL_81:
    v5 = v87;
    v3 = v88;
    if (v7 >= v88)
      goto LABEL_90;
  }
  while (1)
  {
    v31 = v28 - 1;
    if (v28 >= 4)
    {
      v36 = v29 + 16 * v28;
      v37 = *(_QWORD *)(v36 - 64);
      v38 = *(_QWORD *)(v36 - 56);
      v42 = __OFSUB__(v38, v37);
      v39 = v38 - v37;
      if (v42)
        goto LABEL_107;
      v41 = *(_QWORD *)(v36 - 48);
      v40 = *(_QWORD *)(v36 - 40);
      v42 = __OFSUB__(v40, v41);
      v34 = v40 - v41;
      v35 = v42;
      if (v42)
        goto LABEL_108;
      v43 = v28 - 2;
      v44 = (uint64_t *)(v29 + 16 * (v28 - 2));
      v46 = *v44;
      v45 = v44[1];
      v42 = __OFSUB__(v45, v46);
      v47 = v45 - v46;
      if (v42)
        goto LABEL_109;
      v42 = __OFADD__(v34, v47);
      v48 = v34 + v47;
      if (v42)
        goto LABEL_111;
      if (v48 >= v39)
      {
        v66 = (uint64_t *)(v29 + 16 * v31);
        v68 = *v66;
        v67 = v66[1];
        v42 = __OFSUB__(v67, v68);
        v69 = v67 - v68;
        if (v42)
          goto LABEL_117;
        v59 = v34 < v69;
        goto LABEL_70;
      }
    }
    else
    {
      if (v28 != 3)
      {
        v60 = *(_QWORD *)(v9 + 32);
        v61 = *(_QWORD *)(v9 + 40);
        v42 = __OFSUB__(v61, v60);
        v53 = v61 - v60;
        v54 = v42;
        goto LABEL_64;
      }
      v33 = *(_QWORD *)(v9 + 32);
      v32 = *(_QWORD *)(v9 + 40);
      v42 = __OFSUB__(v32, v33);
      v34 = v32 - v33;
      v35 = v42;
    }
    if ((v35 & 1) != 0)
      goto LABEL_110;
    v43 = v28 - 2;
    v49 = (uint64_t *)(v29 + 16 * (v28 - 2));
    v51 = *v49;
    v50 = v49[1];
    v52 = __OFSUB__(v50, v51);
    v53 = v50 - v51;
    v54 = v52;
    if (v52)
      goto LABEL_112;
    v55 = (uint64_t *)(v29 + 16 * v31);
    v57 = *v55;
    v56 = v55[1];
    v42 = __OFSUB__(v56, v57);
    v58 = v56 - v57;
    if (v42)
      goto LABEL_114;
    if (__OFADD__(v53, v58))
      goto LABEL_116;
    if (v53 + v58 >= v34)
    {
      v59 = v34 < v58;
LABEL_70:
      if (v59)
        v31 = v43;
      goto LABEL_72;
    }
LABEL_64:
    if ((v54 & 1) != 0)
      goto LABEL_113;
    v62 = (uint64_t *)(v29 + 16 * v31);
    v64 = *v62;
    v63 = v62[1];
    v42 = __OFSUB__(v63, v64);
    v65 = v63 - v64;
    if (v42)
      goto LABEL_115;
    if (v65 < v53)
      goto LABEL_81;
LABEL_72:
    v70 = v9;
    v71 = v31 - 1;
    if (v31 - 1 >= v28)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8)
      goto LABEL_131;
    v72 = (uint64_t *)(v29 + 16 * v71);
    v73 = *v72;
    v74 = v29;
    v75 = (_QWORD *)(v29 + 16 * v31);
    v76 = v75[1];
    result = sub_246130E14((char *)(v8 + 8 * *v72), (char *)(v8 + 8 * *v75), v8 + 8 * v76, __dst);
    if (v1)
      break;
    if (v76 < v73)
      goto LABEL_104;
    if (v31 > *(_QWORD *)(v70 + 16))
      goto LABEL_105;
    *v72 = v73;
    *(_QWORD *)(v74 + 16 * v71 + 8) = v76;
    v77 = *(_QWORD *)(v70 + 16);
    if (v31 >= v77)
      goto LABEL_106;
    v9 = v70;
    v28 = v77 - 1;
    result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v31));
    v29 = v74;
    *(_QWORD *)(v70 + 16) = v77 - 1;
    v8 = v89;
    if (v77 <= 2)
      goto LABEL_81;
  }
LABEL_86:
  result = swift_bridgeObjectRelease();
  if (v88 < -1)
    goto LABEL_125;
  *(_QWORD *)(v86 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_246130DBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v6 = *(double *)(v4 + 8 * a3);
      v7 = result;
      v8 = (double *)v5;
      do
      {
        v9 = *v8;
        if (v6 >= *v8)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_246130E14(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double v14;
  BOOL v15;
  double *v18;
  char *v19;
  double v20;
  BOOL v21;
  BOOL v22;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 8;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v9 >= v11)
  {
    sub_246130070(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, __dst);
    v12 = &v4[8 * v11];
    if (v7 >= v6 || v10 < 8)
      goto LABEL_39;
    v18 = (double *)(a3 - 8);
    while (1)
    {
      v19 = (char *)(v18 + 1);
      v20 = *((double *)v6 - 1);
      if (*((double *)v12 - 1) >= v20)
      {
        v22 = v19 != v12 || v18 >= (double *)v12;
        v20 = *((double *)v12 - 1);
        v12 -= 8;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v21 = v19 != v6 || v18 >= (double *)v6;
        v6 -= 8;
        if (!v21)
          goto LABEL_35;
      }
      *v18 = v20;
LABEL_35:
      --v18;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_39;
    }
  }
  sub_246130070(__src, (a2 - __src) / 8, __dst);
  v12 = &v4[8 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v14 = *(double *)v6;
      if (*(double *)v6 < *(double *)v4)
        break;
      v14 = *(double *)v4;
      v15 = v7 == v4;
      v4 += 8;
      if (!v15)
        goto LABEL_11;
LABEL_12:
      v7 += 8;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_17;
    }
    v15 = v7 == v6;
    v6 += 8;
    if (v15)
      goto LABEL_12;
LABEL_11:
    *(double *)v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  sub_246130070(v4, (v12 - v4) / 8, v6);
  return 1;
}

char *sub_246130F8C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754B828);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_246131080(uint64_t a1)
{
  return sub_246130F8C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_246131094(uint64_t a1)
{
  return sub_246130538(0, *(_QWORD *)(a1 + 16), 0, a1);
}

unint64_t sub_2461310A8()
{
  unint64_t result;

  result = qword_25441C570;
  if (!qword_25441C570)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25441C570);
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionAprovedPhraseList()
{
  return &type metadata for StaticSuggestionAprovedPhraseList;
}

unint64_t sub_2461310F4()
{
  unint64_t result;

  result = qword_25754B860;
  if (!qword_25754B860)
  {
    result = MEMORY[0x249550960](&unk_246134148, &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B860);
  }
  return result;
}

unint64_t sub_246131130()
{
  unint64_t result;

  result = qword_25754B878;
  if (!qword_25754B878)
  {
    result = MEMORY[0x249550960](&unk_246134120, &type metadata for StaticSuggestionApprovedPhrase);
    atomic_store(result, (unint64_t *)&qword_25754B878);
  }
  return result;
}

void sub_24613116C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754B868);
    v7 = a2();
    atomic_store(MEMORY[0x249550960](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_20_5();
}

unint64_t sub_2461311C8()
{
  unint64_t result;

  result = qword_25754B890;
  if (!qword_25754B890)
  {
    result = MEMORY[0x249550960](&unk_2461340F8, &type metadata for StaticSuggestionApprovedPhrase);
    atomic_store(result, (unint64_t *)&qword_25754B890);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for StaticSuggestionAprovedPhraseList.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246131244 + 4 * byte_246133F27[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246131264 + 4 * byte_246133F2C[v4]))();
}

_BYTE *sub_246131244(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246131264(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24613126C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246131274(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24613127C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246131284(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionAprovedPhraseList.CodingKeys()
{
  return &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys;
}

uint64_t destroy for StaticSuggestionApprovedPhrase()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for StaticSuggestionApprovedPhrase(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for StaticSuggestionApprovedPhrase(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for StaticSuggestionApprovedPhrase(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StaticSuggestionApprovedPhrase(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
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

uint64_t storeEnumTagSinglePayload for StaticSuggestionApprovedPhrase(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionApprovedPhrase()
{
  return &type metadata for StaticSuggestionApprovedPhrase;
}

unint64_t sub_2461315E0()
{
  unint64_t result;

  result = qword_25754B898;
  if (!qword_25754B898)
  {
    result = MEMORY[0x249550960](&unk_2461340D0, &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B898);
  }
  return result;
}

unint64_t sub_246131620()
{
  unint64_t result;

  result = qword_25754B8A0;
  if (!qword_25754B8A0)
  {
    result = MEMORY[0x249550960](&unk_246134040, &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8A0);
  }
  return result;
}

unint64_t sub_246131660()
{
  unint64_t result;

  result = qword_25754B8A8;
  if (!qword_25754B8A8)
  {
    result = MEMORY[0x249550960](&unk_246134068, &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8A8);
  }
  return result;
}

unint64_t sub_24613169C()
{
  unint64_t result;

  result = qword_25754B8B8;
  if (!qword_25754B8B8)
  {
    result = MEMORY[0x249550960](&unk_246134250, &type metadata for StaticSuggestionApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8B8);
  }
  return result;
}

void sub_2461316D8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441C550);
    v7 = a2;
    atomic_store(MEMORY[0x249550960](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_20_5();
}

uint64_t getEnumTagSinglePayload for StaticSuggestionApprovedPhrase.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StaticSuggestionApprovedPhrase.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_246131800 + 4 * byte_246133F36[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_246131834 + 4 * byte_246133F31[v4]))();
}

uint64_t sub_246131834(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24613183C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246131844);
  return result;
}

uint64_t sub_246131850(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246131858);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_24613185C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246131864(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionApprovedPhrase.CodingKeys()
{
  return &type metadata for StaticSuggestionApprovedPhrase.CodingKeys;
}

unint64_t sub_246131884()
{
  unint64_t result;

  result = qword_25754B8D0;
  if (!qword_25754B8D0)
  {
    result = MEMORY[0x249550960](&unk_246134228, &type metadata for StaticSuggestionApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8D0);
  }
  return result;
}

unint64_t sub_2461318C4()
{
  unint64_t result;

  result = qword_25754B8D8;
  if (!qword_25754B8D8)
  {
    result = MEMORY[0x249550960](&unk_246134198, &type metadata for StaticSuggestionApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8D8);
  }
  return result;
}

unint64_t sub_246131904()
{
  unint64_t result;

  result = qword_25754B8E0;
  if (!qword_25754B8E0)
  {
    result = MEMORY[0x249550960](&unk_2461341C0, &type metadata for StaticSuggestionApprovedPhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754B8E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_24613279C();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_24613276C();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_246132748();
}

void *OUTLINED_FUNCTION_10_3@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  return swift_arrayInitWithCopy();
}

void OUTLINED_FUNCTION_13_3(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_15_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_31_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return sub_2461321D8();
}

uint64_t sub_246131A9C(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t result;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  uint64_t v33;

  v4 = sub_2461323E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v32 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v32 - v12;
  if (*(_QWORD *)(a1 + 16) > 1uLL)
  {
    v18 = sub_246131E0C(a1, a2);
    if ((v19 & 1) != 0)
    {
      sub_2461323D0();
      v22 = sub_2461323DC();
      v23 = sub_2461325D4();
      if (OUTLINED_FUNCTION_21(v23))
      {
        v24 = (_DWORD *)OUTLINED_FUNCTION_2();
        v33 = OUTLINED_FUNCTION_2();
        *v24 = 136315394;
        v25 = OUTLINED_FUNCTION_1_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
        OUTLINED_FUNCTION_3_8(v25);
        OUTLINED_FUNCTION_2_8();
        OUTLINED_FUNCTION_6_7(&dword_246105000, v22, v26, "Function: %s > Unable to calculate a normalized score for value %f since it does not exist in the list");
        OUTLINED_FUNCTION_4_10();
        OUTLINED_FUNCTION_0();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      v20 = v18;
      v33 = *(_QWORD *)&a2;
      MEMORY[0x24BDAC7A8](v18);
      v32[-2] = &v33;
      result = sub_246131E78((uint64_t (*)(uint64_t *))sub_246131F10, (uint64_t)&v32[-4], a1);
      if ((v21 & 1) != 0)
      {
        sub_2461323D0();
        v27 = sub_2461323DC();
        v28 = sub_2461325D4();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (_DWORD *)OUTLINED_FUNCTION_2();
          v33 = OUTLINED_FUNCTION_2();
          *v29 = 136315394;
          v30 = OUTLINED_FUNCTION_1_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
          OUTLINED_FUNCTION_3_8(v30);
          OUTLINED_FUNCTION_2_8();
          OUTLINED_FUNCTION_6_7(&dword_246105000, v27, v31, "Function: %s > Unable to calculate a normalized score for value %f since it does not exist in the list");
          OUTLINED_FUNCTION_4_10();
          OUTLINED_FUNCTION_0();
        }

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      }
      else if (__OFADD__(v20, result))
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_2461323D0();
    v14 = sub_2461323DC();
    v15 = sub_2461325D4();
    if (OUTLINED_FUNCTION_21(v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_2();
      v33 = OUTLINED_FUNCTION_2();
      *(_DWORD *)v16 = 136315138;
      v32[2] = OUTLINED_FUNCTION_1_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
      sub_246132610();
      _os_log_impl(&dword_246105000, v14, (os_log_type_t)a1, "Function: %s > Skipping normalized score calculation for a list with less than two elements", v16, 0xCu);
      OUTLINED_FUNCTION_4_10();
      OUTLINED_FUNCTION_0();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  return result;
}

uint64_t sub_246131E0C(uint64_t a1, double a2)
{
  uint64_t v2;
  double v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  double v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v4 = *(double *)(a1 + 32);
  result = 0;
  if (v4 != a2)
  {
    v6 = v2 - 1;
    v7 = a1 + 40;
    while (v6 != result)
    {
      v8 = *(double *)(v7 + 8 * result++);
      if (v8 == a2)
        return result;
    }
    return 0;
  }
  return result;
}

BOOL sub_246131E6C(double a1, double a2)
{
  return a1 == a2;
}

uint64_t sub_246131E78(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a3 + 16);
  if (v4)
  {
    v6 = a3 + 24;
    do
    {
      v9 = *(_QWORD *)(v6 + 8 * v4);
      v7 = a1(&v9);
      if (v3)
        break;
      --v4;
    }
    while (!(v7 & 1 | (v4 == 0)));
  }
  return v4;
}

BOOL sub_246131EF0(double *a1, double *a2)
{
  return sub_246131E6C(*a1, *a2);
}

BOOL sub_246131F10(double *a1)
{
  uint64_t v1;

  return sub_246131EF0(a1, *(double **)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_1_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246119920(0xD000000000000026, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(v0 + 12) = 2048;
  *(_QWORD *)(v1 - 112) = v2;
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_3_8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_246132610();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_6_7(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0x16u);
}

uint64_t sub_246131FA4()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_246131FB0()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_246131FBC()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_246131FC8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_246131FD4()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_246131FE0()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_246131FEC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_246131FF8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_246132004()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_246132010()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24613201C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_246132028()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_246132034()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_246132040()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24613204C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_246132058()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_246132064()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_246132070()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24613207C()
{
  return MEMORY[0x24BEA6A18]();
}

uint64_t sub_246132088()
{
  return MEMORY[0x24BEA6A20]();
}

uint64_t sub_246132094()
{
  return MEMORY[0x24BEA6A28]();
}

uint64_t sub_2461320A0()
{
  return MEMORY[0x24BEA6A38]();
}

uint64_t sub_2461320AC()
{
  return MEMORY[0x24BEA6A40]();
}

uint64_t sub_2461320B8()
{
  return MEMORY[0x24BEA6A48]();
}

uint64_t sub_2461320C4()
{
  return MEMORY[0x24BEA6A58]();
}

uint64_t sub_2461320D0()
{
  return MEMORY[0x24BEA6A60]();
}

uint64_t sub_2461320DC()
{
  return MEMORY[0x24BEA6A68]();
}

uint64_t sub_2461320E8()
{
  return MEMORY[0x24BEA6A70]();
}

uint64_t sub_2461320F4()
{
  return MEMORY[0x24BEA6A78]();
}

uint64_t sub_246132100()
{
  return MEMORY[0x24BEA6A80]();
}

uint64_t sub_24613210C()
{
  return MEMORY[0x24BEA6A88]();
}

uint64_t sub_246132118()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_246132124()
{
  return MEMORY[0x24BE90C00]();
}

uint64_t sub_246132130()
{
  return MEMORY[0x24BE90C10]();
}

uint64_t sub_24613213C()
{
  return MEMORY[0x24BE90C18]();
}

uint64_t sub_246132148()
{
  return MEMORY[0x24BE90C20]();
}

uint64_t sub_246132154()
{
  return MEMORY[0x24BE90C28]();
}

uint64_t sub_246132160()
{
  return MEMORY[0x24BE90C38]();
}

uint64_t sub_24613216C()
{
  return MEMORY[0x24BEA6E80]();
}

uint64_t sub_246132178()
{
  return MEMORY[0x24BEA6E90]();
}

uint64_t sub_246132184()
{
  return MEMORY[0x24BEA7438]();
}

uint64_t sub_246132190()
{
  return MEMORY[0x24BEA7440]();
}

uint64_t sub_24613219C()
{
  return MEMORY[0x24BEA7520]();
}

uint64_t sub_2461321A8()
{
  return MEMORY[0x24BEA7568]();
}

uint64_t sub_2461321B4()
{
  return MEMORY[0x24BEA7578]();
}

uint64_t sub_2461321C0()
{
  return MEMORY[0x24BEA7580]();
}

uint64_t sub_2461321CC()
{
  return MEMORY[0x24BEA75C8]();
}

uint64_t sub_2461321D8()
{
  return MEMORY[0x24BEA75F0]();
}

uint64_t sub_2461321E4()
{
  return MEMORY[0x24BE91810]();
}

uint64_t sub_2461321F0()
{
  return MEMORY[0x24BE91818]();
}

uint64_t sub_2461321FC()
{
  return MEMORY[0x24BE91820]();
}

uint64_t sub_246132208()
{
  return MEMORY[0x24BE91830]();
}

uint64_t sub_246132214()
{
  return MEMORY[0x24BE91838]();
}

uint64_t sub_246132220()
{
  return MEMORY[0x24BE91848]();
}

uint64_t sub_24613222C()
{
  return MEMORY[0x24BE91850]();
}

uint64_t sub_246132238()
{
  return MEMORY[0x24BE91868]();
}

uint64_t sub_246132244()
{
  return MEMORY[0x24BE91878]();
}

uint64_t sub_246132250()
{
  return MEMORY[0x24BE91888]();
}

uint64_t sub_24613225C()
{
  return MEMORY[0x24BE91890]();
}

uint64_t sub_246132268()
{
  return MEMORY[0x24BE918C0]();
}

uint64_t sub_246132274()
{
  return MEMORY[0x24BE918C8]();
}

uint64_t sub_246132280()
{
  return MEMORY[0x24BE918D0]();
}

uint64_t sub_24613228C()
{
  return MEMORY[0x24BE918D8]();
}

uint64_t sub_246132298()
{
  return MEMORY[0x24BE918E0]();
}

uint64_t sub_2461322A4()
{
  return MEMORY[0x24BE918E8]();
}

uint64_t sub_2461322B0()
{
  return MEMORY[0x24BE918F0]();
}

uint64_t sub_2461322BC()
{
  return MEMORY[0x24BE918F8]();
}

uint64_t sub_2461322C8()
{
  return MEMORY[0x24BE91940]();
}

uint64_t sub_2461322D4()
{
  return MEMORY[0x24BE91958]();
}

uint64_t sub_2461322E0()
{
  return MEMORY[0x24BE91960]();
}

uint64_t sub_2461322EC()
{
  return MEMORY[0x24BE91970]();
}

uint64_t sub_2461322F8()
{
  return MEMORY[0x24BE91978]();
}

uint64_t sub_246132304()
{
  return MEMORY[0x24BE91988]();
}

uint64_t sub_246132310()
{
  return MEMORY[0x24BE91998]();
}

uint64_t sub_24613231C()
{
  return MEMORY[0x24BE919A0]();
}

uint64_t sub_246132328()
{
  return MEMORY[0x24BE919A8]();
}

uint64_t sub_246132334()
{
  return MEMORY[0x24BE919B0]();
}

uint64_t sub_246132340()
{
  return MEMORY[0x24BE919B8]();
}

uint64_t sub_24613234C()
{
  return MEMORY[0x24BE919C0]();
}

uint64_t sub_246132358()
{
  return MEMORY[0x24BE919D0]();
}

uint64_t sub_246132364()
{
  return MEMORY[0x24BE919D8]();
}

uint64_t sub_246132370()
{
  return MEMORY[0x24BE919E0]();
}

uint64_t sub_24613237C()
{
  return MEMORY[0x24BE919F0]();
}

uint64_t sub_246132388()
{
  return MEMORY[0x24BE919F8]();
}

uint64_t sub_246132394()
{
  return MEMORY[0x24BE91A00]();
}

uint64_t sub_2461323A0()
{
  return MEMORY[0x24BE91A08]();
}

uint64_t sub_2461323AC()
{
  return MEMORY[0x24BE91A10]();
}

uint64_t sub_2461323B8()
{
  return MEMORY[0x24BE91A18]();
}

uint64_t sub_2461323C4()
{
  return MEMORY[0x24BE91A20]();
}

uint64_t sub_2461323D0()
{
  return MEMORY[0x24BE91A28]();
}

uint64_t sub_2461323DC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2461323E8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2461323F4()
{
  return MEMORY[0x24BEB8E58]();
}

uint64_t sub_246132400()
{
  return MEMORY[0x24BEB8F58]();
}

uint64_t sub_24613240C()
{
  return MEMORY[0x24BEB8FB0]();
}

uint64_t sub_246132418()
{
  return MEMORY[0x24BEB8FE0]();
}

uint64_t sub_246132424()
{
  return MEMORY[0x24BEB9490]();
}

uint64_t sub_246132430()
{
  return MEMORY[0x24BEB94E0]();
}

uint64_t sub_24613243C()
{
  return MEMORY[0x24BEB94E8]();
}

uint64_t sub_246132448()
{
  return MEMORY[0x24BEBA2A0]();
}

uint64_t sub_246132454()
{
  return MEMORY[0x24BEBA2F0]();
}

uint64_t sub_246132460()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24613246C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_246132478()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246132484()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246132490()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24613249C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2461324A8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2461324B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2461324C0()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_2461324CC()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_2461324D8()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_2461324E4()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2461324F0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2461324FC()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_246132508()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_246132514()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_246132520()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24613252C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_246132538()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_246132544()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_246132550()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24613255C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_246132568()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_246132574()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_246132580()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24613258C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_246132598()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2461325A4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2461325B0()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_2461325BC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2461325C8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2461325D4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2461325E0()
{
  return MEMORY[0x24BEA6A08]();
}

uint64_t sub_2461325EC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_2461325F8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_246132604()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246132610()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24613261C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246132628()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_246132634()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_246132640()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_24613264C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_246132658()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_246132664()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246132670()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24613267C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246132688()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_246132694()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2461326A0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2461326AC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2461326B8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2461326C4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2461326D0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2461326DC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2461326E8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2461326F4()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_246132700()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_24613270C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_246132718()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246132724()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246132730()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_24613273C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_246132748()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_246132754()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246132760()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_24613276C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_246132778()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_246132784()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_246132790()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_24613279C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2461327A8()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2461327B4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2461327C0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2461327CC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2461327D8()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2461327E4()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2461327F0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2461327FC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_246132808()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_246132814()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246132820()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24613282C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_246132838()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_246132844()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_246132850()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24613285C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_246132868()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

