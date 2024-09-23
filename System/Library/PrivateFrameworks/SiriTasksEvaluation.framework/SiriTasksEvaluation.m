uint64_t sub_2132E9D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  void (*v5)(char *, uint64_t);
  unint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_2132F2574();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2132F25B0();
  v4 = sub_2132F2544();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_2132F25B0();
  v6 = sub_2132F2568();
  result = ((uint64_t (*)(char *, uint64_t))v5)(v3, v0);
  if (v6 >= v4)
    return v6 - v4 < 0xEA61;
  __break(1u);
  return result;
}

uint64_t sub_2132E9E10()
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
  char *v10;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  char v93;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v110)(char *, uint64_t, uint64_t);
  uint64_t v111;
  void (*v112)(char *, uint64_t, uint64_t);
  unint64_t v113;
  void (*v114)(char *, unint64_t, uint64_t);
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  os_log_type_t v120;
  uint8_t *v121;
  void (*v122)(char *, uint64_t);
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(char *, uint64_t);
  void (*v131)(char *, uint64_t);
  _QWORD v132[4];
  uint64_t v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;

  v0 = sub_2132F2658();
  v156 = *(_QWORD *)(v0 - 8);
  v157 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v143 = (char *)v132 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v139 = (char *)v132 - v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v132 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v132 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v151 = (char *)v132 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v147 = (char *)v132 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B932C0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v138 = (char *)v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v144 = (char *)v132 - v17;
  v146 = sub_2132F240C();
  v150 = *(_QWORD *)(v146 - 8);
  v18 = MEMORY[0x24BDAC7A8](v146);
  v137 = (char *)v132 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v145 = (char *)v132 - v20;
  v142 = sub_2132F23F4();
  v148 = *(_QWORD *)(v142 - 8);
  MEMORY[0x24BDAC7A8](v142);
  v149 = (char *)v132 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_2132F2634();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v140 = (char *)v132 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = sub_2132F2430();
  v26 = *(_QWORD *)(v25 - 8);
  v152 = v25;
  v153 = v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v141 = (char *)v132 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v154 = (char *)v132 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v132 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v155 = (char *)v132 - v34;
  v35 = sub_2132F2574();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)v132 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)v132 - v40;
  sub_2132F25B0();
  v42 = sub_2132F252C();
  v43 = *(void (**)(char *, uint64_t))(v36 + 8);
  v43(v41, v35);
  v44 = *(_QWORD *)(v42 + 16);
  if (!v44)
    goto LABEL_9;
  v135 = v33;
  v45 = v10;
  v46 = v42 + 16 * v44;
  v48 = *(_QWORD *)(v46 + 16);
  v47 = *(_QWORD *)(v46 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2132F25B0();
  v49 = (_QWORD *)sub_2132F252C();
  v43(v39, v35);
  if (!v49[2])
  {
    swift_bridgeObjectRelease();
LABEL_9:
    v71 = v156;
    v70 = v157;
    swift_bridgeObjectRelease();
    v72 = sub_2132F0884();
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v7, v72, v70);
    v73 = sub_2132F264C();
    v74 = sub_2132F276C();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_2132E5000, v73, v74, "One of the tasks has no requests.", v75, 2u);
      MEMORY[0x2199B15EC](v75, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v7, v70);
    goto LABEL_23;
  }
  v51 = v49[4];
  v50 = v49[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v134 = v48;
  v159 = v48;
  v160 = v47;
  swift_bridgeObjectRetain();
  sub_2132F26DC();
  v52 = v159;
  v53 = v160;
  v133 = v51;
  v159 = v51;
  v160 = v50;
  v136 = v50;
  swift_bridgeObjectRetain();
  sub_2132F26DC();
  v55 = v159;
  v54 = v160;
  type metadata accessor for FeatureStoreUtils();
  v56 = sub_2132F17E0();
  v57 = (void *)static FeatureStoreUtils.retrieveFeature(streamId:interactionId:dataVersion:)(0xD000000000000014, 0x80000002132F3C10, v52, v53, v56);
  swift_bridgeObjectRelease();
  if (!v57)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v76 = sub_2132F0884();
    v78 = v156;
    v77 = v157;
    (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v45, v76, v157);
    swift_bridgeObjectRetain();
    v79 = sub_2132F264C();
    v80 = sub_2132F276C();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      v82 = swift_slowAlloc();
      v159 = v82;
      *(_DWORD *)v81 = 136315138;
      swift_bridgeObjectRetain();
      v158 = sub_2132EB140(v134, v47, &v159);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v79, v80, "Could not get NLU stream for previous request %s", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v82, -1, -1);
      MEMORY[0x2199B15EC](v81, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v83 = *(void (**)(char *, uint64_t))(v78 + 8);
    v84 = v45;
    goto LABEL_22;
  }
  v58 = objc_msgSend(v57, sel_json);
  v59 = v57;
  if (!v58)
  {
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  v60 = v58;
  v132[3] = v59;
  sub_2132F26A0();

  v61 = sub_2132F17E0();
  v62 = (void *)static FeatureStoreUtils.retrieveFeature(streamId:interactionId:dataVersion:)(0xD000000000000014, 0x80000002132F3C10, v55, v54, v61);
  swift_bridgeObjectRelease();
  if (!v62)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v85 = sub_2132F0884();
    v86 = v156;
    v77 = v157;
    v87 = v151;
    (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v151, v85, v157);
    v88 = v136;
    swift_bridgeObjectRetain();
    v89 = sub_2132F264C();
    v90 = sub_2132F276C();
    if (os_log_type_enabled(v89, v90))
    {
      v91 = (uint8_t *)swift_slowAlloc();
      v92 = swift_slowAlloc();
      v159 = v92;
      *(_DWORD *)v91 = 136315138;
      swift_bridgeObjectRetain();
      v158 = sub_2132EB140(v133, v88, &v159);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v89, v90, "Could not get NLU stream for current request %s", v91, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v92, -1, -1);
      MEMORY[0x2199B15EC](v91, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    v83 = *(void (**)(char *, uint64_t))(v86 + 8);
    v84 = v87;
LABEL_22:
    v83(v84, v77);
    goto LABEL_23;
  }
  v63 = objc_msgSend(v62, sel_json);
  if (!v63)
  {
    swift_unknownObjectRelease();
    goto LABEL_18;
  }
  v64 = v63;
  v132[1] = sub_2132F26A0();
  v66 = v65;

  v67 = v155;
  sub_2132F2424();
  sub_2132F2628();
  sub_2132EB210();
  v68 = v135;
  v69 = v152;
  sub_2132F2640();
  v132[2] = v62;
  v151 = v66;
  v95 = v153;
  (*(void (**)(char *, uint64_t))(v153 + 8))(v67, v69);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v67, v68, v69);
  v96 = v156;
  v97 = v154;
  v98 = v141;
  sub_2132F2424();
  sub_2132F2628();
  sub_2132F2640();
  v99 = v96;
  (*(void (**)(char *, uint64_t))(v95 + 8))(v97, v69);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v97, v98, v69);
  v100 = v147;
  v101 = v142;
  v102 = v149;
  sub_2132F2418();
  v103 = sub_2132F23E8();
  v104 = *(void (**)(char *, uint64_t))(v148 + 8);
  v104(v102, v101);
  sub_2132F2418();
  v105 = sub_2132F23E8();
  v104(v102, v101);
  v106 = v150;
  if (*(_QWORD *)(v103 + 16))
  {
    v107 = (uint64_t)v144;
    v108 = v146;
    (*(void (**)(char *, unint64_t, uint64_t))(v150 + 16))(v144, v103 + ((*(unsigned __int8 *)(v150 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v150 + 80)), v146);
    v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56);
    v109(v107, 0, 1, v108);
  }
  else
  {
    v109 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v150 + 56);
    v107 = (uint64_t)v144;
    v108 = v146;
    v109((uint64_t)v144, 1, 1, v146);
  }
  swift_bridgeObjectRelease();
  v110 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v106 + 48);
  if (v110((char *)v107, 1, v108) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v111 = v107;
    v112 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 32);
    v112(v145, v111, v108);
    if (*(_QWORD *)(v105 + 16))
    {
      v113 = v105 + ((*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80));
      v114 = *(void (**)(char *, unint64_t, uint64_t))(v106 + 16);
      v115 = v138;
      v114(v138, v113, v108);
      v116 = 0;
    }
    else
    {
      v116 = 1;
      v115 = v138;
    }
    v109((uint64_t)v115, v116, 1, v108);
    swift_bridgeObjectRelease();
    if (v110(v115, 1, v108) != 1)
    {
      v123 = v137;
      v112(v137, (uint64_t)v115, v108);
      v124 = v145;
      v125 = sub_2132F2400();
      v127 = v126;
      v128 = sub_2132F2400();
      v93 = sub_2132EC900(v128, v129, v125, v127);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v130 = *(void (**)(char *, uint64_t))(v150 + 8);
      v130(v123, v108);
      v130(v124, v108);
      v131 = *(void (**)(char *, uint64_t))(v153 + 8);
      v131(v154, v69);
      v131(v155, v69);
      return v93 & 1;
    }
    (*(void (**)(char *, uint64_t))(v150 + 8))(v145, v108);
    v107 = (uint64_t)v115;
  }
  sub_2132EB258(v107);
  v117 = sub_2132F0884();
  v118 = v157;
  (*(void (**)(char *, uint64_t, uint64_t))(v99 + 16))(v100, v117, v157);
  v119 = sub_2132F264C();
  v120 = sub_2132F276C();
  if (os_log_type_enabled(v119, v120))
  {
    v121 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v121 = 0;
    _os_log_impl(&dword_2132E5000, v119, v120, "At least one requests generated no ASR outputs.", v121, 2u);
    MEMORY[0x2199B15EC](v121, -1, -1);
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v118);
  v122 = *(void (**)(char *, uint64_t))(v153 + 8);
  v122(v154, v69);
  v122(v155, v69);
LABEL_23:
  v93 = 0;
  return v93 & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B1568]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2132EAE84(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = sub_2132EC570(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_2132EC6A4(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_2132EAF00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_2132ECE1C();
  result = sub_2132F279C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2132EAF50(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_2132EC3EC(0, v1, 0);
    v2 = v11;
    v4 = a1 + 56;
    do
    {
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_getAtKeyPath();
      swift_bridgeObjectRelease();
      swift_release();
      v6 = *(_QWORD *)(v11 + 16);
      v5 = *(_QWORD *)(v11 + 24);
      if (v6 >= v5 >> 1)
        sub_2132EC3EC(v5 > 1, v6 + 1, 1);
      *(_QWORD *)(v11 + 16) = v6 + 1;
      v7 = v11 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2132EB078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  char v12;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
  {
    v12 = 1;
    return v12 & 1;
  }
  if (v2 != 1)
  {
    swift_bridgeObjectRetain();
    v12 = sub_2132EB9B4(a1, a2);
LABEL_16:
    swift_bridgeObjectRelease();
    return v12 & 1;
  }
  result = sub_2132EAE84(a2);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
    {
      v9 = result;
      v10 = (_QWORD *)(a1 + 40);
      while (1)
      {
        v11 = *(v10 - 1) == v9 && v7 == *v10;
        if (v11 || (sub_2132F2868() & 1) != 0)
          break;
        v10 += 2;
        if (!--v8)
          goto LABEL_12;
      }
      v12 = 1;
    }
    else
    {
LABEL_12:
      v12 = 0;
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_2132EB140(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2132EB298(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2132ECE84((uint64_t)v12, *a3);
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
      sub_2132ECE84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2132EB210()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B932C8;
  if (!qword_254B932C8)
  {
    v1 = sub_2132F2430();
    result = MEMORY[0x2199B1574](MEMORY[0x24BE9DE20], v1);
    atomic_store(result, (unint64_t *)&qword_254B932C8);
  }
  return result;
}

uint64_t sub_2132EB258(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B932C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132EB298(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2132F2790();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2132EB450(a5, a6);
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
  v8 = sub_2132F2814();
  if (!v8)
  {
    sub_2132F2820();
    __break(1u);
LABEL_17:
    result = sub_2132F285C();
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

uint64_t sub_2132EB450(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2132EB4E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2132EB6BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2132EB6BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2132EB4E4(uint64_t a1, unint64_t a2)
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
      v3 = sub_2132EB658(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2132F27FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2132F2820();
      __break(1u);
LABEL_10:
      v2 = sub_2132F26E8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2132F285C();
    __break(1u);
LABEL_14:
    result = sub_2132F2820();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2132EB658(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B932F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2132EB6BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B932F0);
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
  result = sub_2132F285C();
  __break(1u);
  return result;
}

uint64_t sub_2132EB808(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_2132F2898();
  swift_bridgeObjectRetain();
  sub_2132F26D0();
  v8 = sub_2132F28B0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2132F2868() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2132F2868() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2132EBDF8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2132EB9B4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  size_t v5;
  char v6;
  void *v7;
  _QWORD v9[2];

  v3 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = ((unint64_t)((1 << v4) + 63) >> 3) & 0x1FFFFFFFFFFFFFF8;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_2132EC6FC((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v3, a2);
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_2132EC6FC((uint64_t)v7, v3, a2);
    MEMORY[0x2199B15EC](v7, -1, -1);
  }
  return v6 & 1;
}

uint64_t sub_2132EBB1C()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B932D8);
  v3 = sub_2132F27E4();
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
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_2132F2898();
      sub_2132F26D0();
      result = sub_2132F28B0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2132EBDF8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2132EBB1C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2132EBF90();
      goto LABEL_22;
    }
    sub_2132EC140();
  }
  v11 = *v4;
  sub_2132F2898();
  sub_2132F26D0();
  result = sub_2132F28B0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2132F2868(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2132F2880();
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
          result = sub_2132F2868();
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

void *sub_2132EBF90()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B932D8);
  v2 = *v0;
  v3 = sub_2132F27D8();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2132EC140()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B932D8);
  v3 = sub_2132F27E4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_2132F2898();
    swift_bridgeObjectRetain();
    sub_2132F26D0();
    result = sub_2132F28B0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2132EC3EC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2132EC408(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2132EC408(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B932E8);
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
  result = sub_2132F285C();
  __break(1u);
  return result;
}

uint64_t sub_2132EC570(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_2132EC610(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_2132F2748();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2132EB808(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2132EC6A4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2132EC6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  unint64_t i;
  unint64_t v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = *(_QWORD *)(a2 + 16);
  if (v27)
  {
    v28 = a3 + 56;
    v26 = a2 + 32;
    swift_bridgeObjectRetain();
    v25 = 0;
    v4 = 0;
    while (1)
    {
      v5 = (uint64_t *)(v26 + 16 * v4);
      v7 = *v5;
      v6 = v5[1];
      sub_2132F2898();
      swift_bridgeObjectRetain();
      sub_2132F26D0();
      v8 = sub_2132F28B0();
      v9 = -1 << *(_BYTE *)(a3 + 32);
      v10 = v8 & ~v9;
      v11 = v10 >> 6;
      v12 = 1 << v10;
      if (((1 << v10) & *(_QWORD *)(v28 + 8 * (v10 >> 6))) == 0)
        goto LABEL_3;
      v13 = *(_QWORD *)(a3 + 48);
      v14 = (_QWORD *)(v13 + 16 * v10);
      v15 = *v14 == v7 && v14[1] == v6;
      if (!v15 && (sub_2132F2868() & 1) == 0)
        break;
      result = swift_bridgeObjectRelease();
LABEL_12:
      v17 = *(_QWORD *)(a1 + 8 * v11);
      *(_QWORD *)(a1 + 8 * v11) = v12 | v17;
      if ((v12 & v17) == 0)
      {
        if (__OFADD__(v25, 1))
        {
          __break(1u);
          return result;
        }
        if (++v25 == *(_QWORD *)(a3 + 16))
        {
          v23 = 1;
LABEL_26:
          swift_bridgeObjectRelease();
          return v23;
        }
      }
LABEL_4:
      if (++v4 == v27)
      {
        v23 = 0;
        goto LABEL_26;
      }
    }
    v18 = ~v9;
    for (i = v10 + 1; ; i = v20 + 1)
    {
      v20 = i & v18;
      if (((*(_QWORD *)(v28 + (((i & v18) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v18)) & 1) == 0)
        break;
      v21 = (_QWORD *)(v13 + 16 * v20);
      v22 = *v21 == v7 && v21[1] == v6;
      if (v22 || (sub_2132F2868() & 1) != 0)
      {
        result = swift_bridgeObjectRelease();
        v11 = v20 >> 6;
        v12 = 1 << v20;
        goto LABEL_12;
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  return 0;
}

uint64_t sub_2132EC900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v8 = sub_2132F2658();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v45 - v13;
  v52 = a3;
  v53 = a4;
  v15 = sub_2132ECDD4();
  v16 = MEMORY[0x24BEE0D00];
  v17 = MEMORY[0x2199B1148](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x24BEE0D00], v15);
  v52 = a1;
  v53 = a2;
  v18 = MEMORY[0x2199B1148](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, v16, v15);
  v19 = sub_2132F0884();
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v48 = v9;
  v47(v14, v19, v8);
  swift_bridgeObjectRetain_n();
  v20 = sub_2132F264C();
  v21 = sub_2132F2760();
  v22 = os_log_type_enabled(v20, v21);
  v49 = v8;
  v50 = v12;
  if (v22)
  {
    v23 = swift_slowAlloc();
    v46 = v19;
    v24 = v23;
    v45 = swift_slowAlloc();
    v52 = v45;
    *(_DWORD *)v24 = 134218242;
    v51 = *(_QWORD *)(v17 + 16);
    sub_2132F2784();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v25 = swift_bridgeObjectRetain();
    v26 = MEMORY[0x2199B10D0](v25, MEMORY[0x24BEE1E08]);
    v28 = v27;
    swift_bridgeObjectRelease();
    v51 = sub_2132EB140(v26, v28, &v52);
    v8 = v49;
    v12 = v50;
    sub_2132F2784();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2132E5000, v20, v21, "\n--- FIRST TOKENS (%ld):\n%s\n\n", (uint8_t *)v24, 0x16u);
    v29 = v45;
    swift_arrayDestroy();
    MEMORY[0x2199B15EC](v29, -1, -1);
    v30 = v24;
    v19 = v46;
    MEMORY[0x2199B15EC](v30, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v31 = *(void (**)(char *, uint64_t))(v48 + 8);
  v31(v14, v8);
  v47(v12, v19, v8);
  swift_bridgeObjectRetain_n();
  v32 = sub_2132F264C();
  v33 = sub_2132F2760();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v52 = v35;
    *(_DWORD *)v34 = 134218242;
    v51 = *(_QWORD *)(v18 + 16);
    sub_2132F2784();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    v48 = v17;
    v36 = swift_bridgeObjectRetain();
    v37 = MEMORY[0x2199B10D0](v36, MEMORY[0x24BEE1E08]);
    v47 = (void (*)(char *, uint64_t, uint64_t))v31;
    v38 = v37;
    v40 = v39;
    swift_bridgeObjectRelease();
    v51 = sub_2132EB140(v38, v40, &v52);
    sub_2132F2784();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2132E5000, v32, v33, "\n--- SECOND TOKENS (%ld):\n%s\n\n", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199B15EC](v35, -1, -1);
    MEMORY[0x2199B15EC](v34, -1, -1);

    v17 = v48;
    ((void (*)(char *, uint64_t))v47)(v50, v49);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v31(v12, v8);
  }
  v41 = sub_2132EAF50(v17);
  swift_bridgeObjectRelease();
  v42 = sub_2132EAF50(v18);
  swift_bridgeObjectRelease();
  v43 = sub_2132EC610(v41);
  swift_bridgeObjectRelease();
  LOBYTE(v41) = sub_2132EB078(v42, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v41 & 1;
}

ValueMetadata *type metadata accessor for RestatementChecker()
{
  return &type metadata for RestatementChecker;
}

unint64_t sub_2132ECDD4()
{
  unint64_t result;

  result = qword_254B932D0;
  if (!qword_254B932D0)
  {
    result = MEMORY[0x2199B1574](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254B932D0);
  }
  return result;
}

unint64_t sub_2132ECE1C()
{
  unint64_t result;

  result = qword_254B932E0;
  if (!qword_254B932E0)
  {
    result = MEMORY[0x2199B1574](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_254B932E0);
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

uint64_t sub_2132ECE84(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL sub_2132ECEC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2132ECED4()
{
  sub_2132F2898();
  sub_2132F28A4();
  return sub_2132F28B0();
}

uint64_t sub_2132ECF18()
{
  return sub_2132F28A4();
}

uint64_t sub_2132ECF40()
{
  sub_2132F2898();
  sub_2132F28A4();
  return sub_2132F28B0();
}

unint64_t sub_2132ECF80@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_2132EFA64(*a1);
  *a2 = result;
  return result;
}

void sub_2132ECFA8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_2132ECFB4()
{
  sub_2132F0758();
  return sub_2132F270C();
}

uint64_t sub_2132ED010()
{
  sub_2132F0758();
  return sub_2132F2700();
}

uint64_t sub_2132ED05C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  int v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint8_t *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;

  v42 = sub_2132F2658();
  v2 = *(NSObject **)(v42 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v40 - v6;
  v8 = sub_2132F2610();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v40 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v40 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18((char *)&v40 - v16, a1, v8);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v17, v8);
  if (v19 == *MEMORY[0x24BEA7E48] || v19 == *MEMORY[0x24BEA7E18])
  {
    v21 = sub_2132F0884();
    ((void (*)(char *, uint64_t, uint64_t))v2[2].isa)(v7, v21, v42);
    v18(v15, a1, v8);
    v22 = sub_2132F264C();
    v23 = sub_2132F276C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v41 = v2;
      v25 = v24;
      *(_DWORD *)v24 = 134217984;
      v26 = sub_2132F2604();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
      v43 = v26;
      sub_2132F2784();
      _os_log_impl(&dword_2132E5000, v22, v23, "Unsupported taskEngagementType: %ld", v25, 0xCu);
      v2 = v41;
      MEMORY[0x2199B15EC](v25, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    }

    ((void (*)(char *, uint64_t))v2[1].isa)(v7, v42);
  }
  else
  {
    if (v19 == *MEMORY[0x24BEA7E38])
      return 2;
    if (v19 == *MEMORY[0x24BEA7E08])
      return 4;
    if (v19 == *MEMORY[0x24BEA7DF8]
      || v19 == *MEMORY[0x24BEA7E20]
      || v19 == *MEMORY[0x24BEA7E00]
      || v19 == *MEMORY[0x24BEA7E10]
      || v19 == *MEMORY[0x24BEA7E28]
      || v19 == *MEMORY[0x24BEA7E40])
    {
      return 3;
    }
    v33 = sub_2132F0884();
    ((void (*)(char *, uint64_t, uint64_t))v2[2].isa)(v5, v33, v42);
    v18(v12, a1, v8);
    v34 = sub_2132F264C();
    v35 = sub_2132F276C();
    if (os_log_type_enabled(v34, v35))
    {
      v41 = v34;
      v37 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v37 = 134217984;
      v40 = v37 + 4;
      v38 = sub_2132F2604();
      v39 = *(void (**)(char *, uint64_t))(v9 + 8);
      v39(v12, v8);
      v43 = v38;
      v34 = v41;
      sub_2132F2784();
      _os_log_impl(&dword_2132E5000, v34, v35, "Unknown taskEngagementType: %ld", v37, 0xCu);
      MEMORY[0x2199B15EC](v37, -1, -1);
    }
    else
    {
      v39 = *(void (**)(char *, uint64_t))(v9 + 8);
      v39(v12, v8);
    }

    ((void (*)(char *, uint64_t))v2[1].isa)(v5, v42);
    v39(v17, v8);
  }
  return 0;
}

void *sub_2132ED484(uint64_t a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  void (*v35)(char *, uint64_t);
  char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(char *, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  char *v44;
  char v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  _BOOL8 v52;
  void (*v53)(char *, uint64_t);
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _BOOL8 v58;
  void (*v59)(char *, uint64_t);
  id v60;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v79 = a1;
  v1 = sub_2132F2658();
  v67 = *(void (**)(char *, uint64_t))(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2132F24F0();
  v77 = *(_QWORD *)(v4 - 8);
  v78 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v76 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v75 = (char *)&v62 - v7;
  v8 = sub_2132F24E4();
  v72 = *(_QWORD *)(v8 - 8);
  v73 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v71 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v70 = (char *)&v62 - v11;
  v12 = sub_2132F25E0();
  v68 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v62 - v15;
  v80 = sub_2132F2520();
  v17 = *(_QWORD *)(v80 - 8);
  v18 = MEMORY[0x24BDAC7A8](v80);
  v66 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v62 - v20;
  v22 = sub_2132F2574();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v62 - v27;
  v74 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95140]), sel_init);
  if (v74)
  {
    v29 = v79;
    sub_2132F25B0();
    sub_2132F255C();
    v30 = v28;
    v31 = *(void (**)(char *, uint64_t))(v23 + 8);
    v31(v30, v22);
    v32 = sub_2132F24FC();
    v64 = *(void (**)(char *, uint64_t))(v17 + 8);
    v64(v21, v80);
    v33 = v68;
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
    v34(v16, v29, v12);
    v67 = v31;
    if ((v32 & 1) != 0)
    {
      v35 = *(void (**)(char *, uint64_t))(v33 + 8);
      v35(v16, v12);
      v36 = v69;
      v34(v69, v29, v12);
      LODWORD(v68) = 1;
      v37 = v74;
      v38 = v12;
    }
    else
    {
      sub_2132F25B0();
      v44 = v66;
      sub_2132F255C();
      v31(v26, v22);
      v45 = sub_2132F2508();
      v64(v44, v80);
      v35 = *(void (**)(char *, uint64_t))(v33 + 8);
      v35(v16, v12);
      v46 = v31;
      v36 = v69;
      v63 = v12;
      v34(v69, v29, v12);
      if ((v45 & 1) != 0)
      {
        LODWORD(v68) = 1;
      }
      else
      {
        sub_2132F25B0();
        sub_2132F255C();
        v46(v26, v22);
        LODWORD(v68) = sub_2132F2514();
        v64(v44, v80);
      }
      v37 = v74;
      v38 = v63;
    }
    v65 = v22;
    v35(v36, v38);
    sub_2132F25B0();
    v47 = v70;
    sub_2132F2538();
    v48 = v67;
    v67(v26, v22);
    v50 = v71;
    v49 = v72;
    v51 = v73;
    (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v71, *MEMORY[0x24BEA7BE8], v73);
    sub_2132EFA74(&qword_254B932F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7C10], MEMORY[0x24BEA7C18]);
    sub_2132F26F4();
    sub_2132F26F4();
    v52 = v82 == v81;
    v53 = *(void (**)(char *, uint64_t))(v49 + 8);
    v53(v50, v51);
    v53(v47, v51);
    objc_msgSend(v37, sel_setIsSuccess_, v52);
    sub_2132F25B0();
    v54 = v75;
    sub_2132F2550();
    v48(v26, v65);
    v56 = v76;
    v55 = v77;
    v57 = v78;
    (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v76, *MEMORY[0x24BEA7C40], v78);
    sub_2132EFA74(&qword_254B93300, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7C48], MEMORY[0x24BEA7C50]);
    sub_2132F26F4();
    sub_2132F26F4();
    v58 = v82 == v81;
    v59 = *(void (**)(char *, uint64_t))(v55 + 8);
    v59(v56, v57);
    v59(v54, v57);
    objc_msgSend(v37, sel_setIsExecuted_, v58);
    if ((v68 & 1) != 0)
      v60 = 0;
    else
      v60 = objc_msgSend(v37, sel_isSuccess);
    objc_msgSend(v37, sel_setIsSuccessfulDirectExecution_, v60);
  }
  else
  {
    v39 = sub_2132F0884();
    v40 = (void (**)(char *, uint64_t))v67;
    (*((void (**)(char *, uint64_t, uint64_t))v67 + 2))(v3, v39, v1);
    v41 = sub_2132F264C();
    v42 = sub_2132F276C();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_2132E5000, v41, v42, "Failed to create SELF simpleTaskInfo", v43, 2u);
      MEMORY[0x2199B15EC](v43, -1, -1);
    }

    v40[1](v3, v1);
    return 0;
  }
  return v37;
}

void *sub_2132EDAE4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_2132EE24C(a1, a2, a3, 2);
}

void *sub_2132EDAEC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20[3];
  uint64_t v21;

  v7 = sub_2132F2658();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x60))(a3);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, sel_setTaskSuccessType_, 3);
    type metadata accessor for EditableTaskEvaluator();
    if ((sub_2132F0B70() & 1) != 0)
    {
      objc_msgSend(v12, sel_setIsSuccess_, 0);
      objc_msgSend(v12, sel_setIsSuccessfulDirectExecution_, 0);
    }
  }
  else
  {
    v13 = sub_2132F0884();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
    swift_bridgeObjectRetain_n();
    v14 = sub_2132F264C();
    v15 = sub_2132F276C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v20[0] = a1;
      v18 = v17;
      v21 = v17;
      *(_DWORD *)v16 = 136315138;
      v20[1] = (uint64_t)(v16 + 4);
      swift_bridgeObjectRetain();
      v20[2] = sub_2132EB140(v20[0], a2, &v21);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v14, v15, "Failed to create simpleTaskInfo for %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v18, -1, -1);
      MEMORY[0x2199B15EC](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v12;
}

uint64_t sub_2132EDD44(uint64_t a1, unint64_t a2, unint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  void (**v21)(char *, uint64_t, uint64_t);
  void (**v22)(char *, uint64_t, uint64_t);
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void (*v30)(char *, uint64_t);
  BOOL v31;
  char *v32;
  double v33;
  double v34;
  uint64_t result;
  double v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (**v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;

  v50 = a2;
  v49 = sub_2132F2658();
  v51 = *(void (***)(char *, uint64_t, uint64_t))(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2132F24A8();
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2132F24D8();
  v44 = *(_QWORD *)(v10 - 8);
  v45 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2132F2610();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  v20 = a3;
  v21 = (void (**)(char *, uint64_t, uint64_t))(*(uint64_t (**)(unint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x60))(a3);
  v22 = v21;
  if (!v21)
  {
    v48 = a1;
    v37 = sub_2132F0884();
    v38 = v49;
    v51[2](v7, v37, v49);
    v39 = v50;
    swift_bridgeObjectRetain_n();
    v40 = sub_2132F264C();
    v41 = sub_2132F276C();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v53 = v43;
      *(_DWORD *)v42 = 136315138;
      swift_bridgeObjectRetain();
      v52 = sub_2132EB140(v48, v39, &v53);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v40, v41, "Failed to create simpleTaskInfo for %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v43, -1, -1);
      MEMORY[0x2199B15EC](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(char *, uint64_t))v51[1])(v7, v38);
    return (uint64_t)v22;
  }
  objc_msgSend(v21, sel_setTaskSuccessType_, 1);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95148]), sel_init);
  if (!v23)
    return (uint64_t)v22;
  v24 = v23;
  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95108]), sel_init);
  if (!v25)
  {

    return (uint64_t)v22;
  }
  v26 = v25;
  v50 = v20;
  sub_2132F25A4();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x24BEA7E38], v13);
  sub_2132EFA74(&qword_254B93308, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7E60], MEMORY[0x24BEA7E80]);
  v51 = v22;
  sub_2132F26F4();
  sub_2132F26F4();
  v28 = v52;
  v27 = v53;
  v29 = v26;
  v30 = *(void (**)(char *, uint64_t))(v14 + 8);
  v30(v17, v13);
  v30(v19, v13);
  v31 = v27 == v28;
  v22 = v51;
  if (!v31)
  {
LABEL_11:
    objc_msgSend(v24, sel_setLongRunningTaskInfo_, v29);
    objc_msgSend(v22, sel_setTaskSpecificInfo_, v24);

    return (uint64_t)v22;
  }
  sub_2132F258C();
  v32 = v46;
  sub_2132F24CC();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v45);
  sub_2132F249C();
  v34 = v33;
  result = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v32, v48);
  v36 = v34 * 1000.0;
  if ((~COERCE__INT64(v34 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v36 <= -1.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v36 < 1.84467441e19)
  {
    objc_msgSend(v29, sel_setDurationInMs_, (unint64_t)v36);
    if ((unint64_t)objc_msgSend(v29, sel_durationInMs) >> 3 <= 0x270)
    {
      objc_msgSend(v22, sel_setIsSuccess_, 0);
      objc_msgSend(v22, sel_setIsSuccessfulDirectExecution_, 0);
    }
    goto LABEL_11;
  }
LABEL_20:
  __break(1u);
  return result;
}

void *sub_2132EE244(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_2132EE24C(a1, a2, a3, 4);
}

void *sub_2132EE24C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22[3];
  uint64_t v23;

  v9 = sub_2132F2658();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x60))(a3);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, sel_setTaskSuccessType_, a4);
  }
  else
  {
    v15 = sub_2132F0884();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
    swift_bridgeObjectRetain_n();
    v16 = sub_2132F264C();
    v17 = sub_2132F276C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v22[0] = a1;
      v20 = v19;
      v23 = v19;
      *(_DWORD *)v18 = 136315138;
      v22[1] = (uint64_t)(v18 + 4);
      swift_bridgeObjectRetain();
      v22[2] = sub_2132EB140(v22[0], a2, &v23);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v16, v17, "Failed to create simpleTaskInfo for %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v20, -1, -1);
      MEMORY[0x2199B15EC](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

id sub_2132EE468(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void (*v43)(uint64_t, unint64_t, id);
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  int64_t v71;
  unint64_t v72;
  unint64_t i;
  int64_t v74;
  unint64_t v75;
  int64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id result;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  __int128 v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  char *v105;
  int64_t v106;
  char *v107;
  uint64_t v108[2];
  unint64_t v109;

  v2 = sub_2132F26C4();
  MEMORY[0x24BDAC7A8](v2);
  v107 = (char *)&v91 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2132F2658();
  isUniquelyReferenced_nonNull_native = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v91 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v91 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B93310);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (unint64_t)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (_QWORD *)sub_2132F25E0();
  v103 = *(v17 - 1);
  v104 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v102 = (uint64_t)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t *)sub_2132EEE48(MEMORY[0x24BEE4AF8]);
  v109 = (unint64_t)v19;
  if (a1 >> 62)
    goto LABEL_39;
  v20 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v20)
  {
    while (1)
    {
      if (v20 < 1)
        goto LABEL_68;
      v92 = v13;
      v96 = v11;
      v13 = 0;
      v106 = a1 & 0xC000000000000001;
      *(_QWORD *)&v21 = 136315138;
      v95 = v21;
      v93 = MEMORY[0x24BEE4AD8] + 8;
      v94 = a1;
      v98 = v4;
      v99 = isUniquelyReferenced_nonNull_native;
      v100 = v16;
      v101 = v8;
      v105 = (char *)v20;
      while (1)
      {
        if (v106)
          v22 = (id)MEMORY[0x2199B11A8](v13, a1);
        else
          v22 = *(id *)(a1 + 8 * (_QWORD)v13 + 32);
        v23 = v22;
        v24 = objc_msgSend(v22, sel_eventBody);
        if (!v24
          || (v25 = v24, v26 = objc_msgSend(v24, sel_taskID),
                         v25,
                         !v26))
        {
          v39 = sub_2132F0884();
          (*(void (**)(char *, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 16))(v8, v39, v4);
          v40 = sub_2132F264C();
          v41 = sub_2132F276C();
          if (os_log_type_enabled(v40, v41))
          {
            v42 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_2132E5000, v40, v41, "Could not get taskId from event.", v42, 2u);
            MEMORY[0x2199B15EC](v42, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(isUniquelyReferenced_nonNull_native + 8))(v8, v4);
          goto LABEL_6;
        }
        v27 = sub_2132F26A0();
        v8 = v28;

        sub_2132F261C();
        v30 = v103;
        v29 = v104;
        if ((*(unsigned int (**)(unint64_t, uint64_t, id))(v103 + 48))(v16, 1, v104) != 1)
          break;
        sub_2132EFAF8(v16);
        v31 = sub_2132F0884();
        v32 = v96;
        (*(void (**)(char *, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 16))(v96, v31, v4);
        swift_bridgeObjectRetain();
        v33 = sub_2132F264C();
        v34 = sub_2132F276C();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = swift_slowAlloc();
          v36 = swift_slowAlloc();
          v108[0] = v36;
          *(_DWORD *)v35 = v95;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v35 + 4) = sub_2132EB140(v27, (unint64_t)v8, v108);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2132E5000, v33, v34, "Could not get engagement for taskId %s.", (uint8_t *)v35, 0xCu);
          swift_arrayDestroy();
          v37 = v36;
          isUniquelyReferenced_nonNull_native = v99;
          MEMORY[0x2199B15EC](v37, -1, -1);
          v38 = v35;
          v4 = v98;
          MEMORY[0x2199B15EC](v38, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }

        (*(void (**)(char *, uint64_t))(isUniquelyReferenced_nonNull_native + 8))(v32, v4);
LABEL_35:
        v16 = v100;
        v8 = v101;
LABEL_6:
        if (v105 == ++v13)
        {
          swift_bridgeObjectRelease();
          v19 = (uint64_t *)v109;
          goto LABEL_41;
        }
      }
      v43 = *(void (**)(uint64_t, unint64_t, id))(v30 + 32);
      v44 = v102;
      v43(v102, v16, v29);
      v45 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v97) + 0x90))(v44);
      if (!v45)
        break;
      v11 = v45;
      v19 = (uint64_t *)v109;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v108[0] = (uint64_t)v19;
      v109 = 0x8000000000000000;
      v16 = sub_2132EF464(v27, (uint64_t)v8);
      v47 = v19[2];
      v48 = (v46 & 1) == 0;
      v49 = v47 + v48;
      if (!__OFADD__(v47, v48))
      {
        v4 = v46;
        if (v19[3] >= v49)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v19 = v108;
            sub_2132EF8B4();
          }
        }
        else
        {
          sub_2132EF4C8(v49, isUniquelyReferenced_nonNull_native);
          v19 = (uint64_t *)v108[0];
          v50 = sub_2132EF464(v27, (uint64_t)v8);
          if ((v4 & 1) != (v51 & 1))
            goto LABEL_70;
          v16 = v50;
        }
        isUniquelyReferenced_nonNull_native = v99;
        a1 = v108[0];
        if ((v4 & 1) != 0)
        {
          v60 = *(_QWORD *)(v108[0] + 56);

          *(_QWORD *)(v60 + 8 * v16) = v11;
        }
        else
        {
          *(_QWORD *)(v108[0] + 8 * (v16 >> 6) + 64) |= 1 << v16;
          v61 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v16);
          *v61 = v27;
          v61[1] = (uint64_t)v8;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v16) = v11;
          v62 = *(_QWORD *)(a1 + 16);
          v63 = __OFADD__(v62, 1);
          v64 = v62 + 1;
          if (v63)
            goto LABEL_38;
          *(_QWORD *)(a1 + 16) = v64;
          swift_bridgeObjectRetain();
        }
        v109 = a1;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v65 = v102;
        sub_2132EFB38(v102, (uint64_t)&v109);

        (*(void (**)(uint64_t, id))(v103 + 8))(v65, v104);
        a1 = v94;
        v4 = v98;
        goto LABEL_35;
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      v20 = sub_2132F282C();
      if (!v20)
        goto LABEL_40;
    }
    v52 = sub_2132F0884();
    v53 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 16))(v92, v52, v4);
    swift_bridgeObjectRetain();
    v54 = sub_2132F264C();
    v55 = sub_2132F276C();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      v57 = swift_slowAlloc();
      v108[0] = v57;
      *(_DWORD *)v56 = v95;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v56 + 4) = sub_2132EB140(v27, (unint64_t)v8, v108);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v54, v55, "Could not evaluate %s.", (uint8_t *)v56, 0xCu);
      swift_arrayDestroy();
      v58 = v57;
      isUniquelyReferenced_nonNull_native = v99;
      MEMORY[0x2199B15EC](v58, -1, -1);
      v59 = v56;
      v4 = v98;
      MEMORY[0x2199B15EC](v59, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(isUniquelyReferenced_nonNull_native + 8))(v53, v4);
    (*(void (**)(uint64_t, id))(v103 + 8))(v102, v104);
    goto LABEL_35;
  }
LABEL_40:
  swift_bridgeObjectRelease();
LABEL_41:
  v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init);
  v67 = v19[8];
  v104 = v66;
  v105 = (char *)(v19 + 8);
  v68 = 1 << *((_BYTE *)v19 + 32);
  v69 = -1;
  if (v68 < 64)
    v69 = ~(-1 << v68);
  v70 = v69 & v67;
  v106 = (unint64_t)(v68 + 63) >> 6;
  swift_bridgeObjectRetain();
  v71 = 0;
  if (v70)
    goto LABEL_46;
LABEL_47:
  v74 = v71 + 1;
  if (__OFADD__(v71, 1))
  {
    __break(1u);
    goto LABEL_67;
  }
  if (v74 >= v106)
    goto LABEL_65;
  v75 = *(_QWORD *)&v105[8 * v74];
  ++v71;
  if (v75)
    goto LABEL_60;
  v71 = v74 + 1;
  if (v74 + 1 >= v106)
    goto LABEL_65;
  v75 = *(_QWORD *)&v105[8 * v71];
  if (v75)
    goto LABEL_60;
  v71 = v74 + 2;
  if (v74 + 2 >= v106)
    goto LABEL_65;
  v75 = *(_QWORD *)&v105[8 * v71];
  if (v75)
    goto LABEL_60;
  v76 = v74 + 3;
  if (v76 >= v106)
  {
LABEL_65:
    swift_release();
    swift_bridgeObjectRelease();
    return v104;
  }
  v75 = *(_QWORD *)&v105[8 * v76];
  if (!v75)
  {
    while (1)
    {
      v71 = v76 + 1;
      if (__OFADD__(v76, 1))
        break;
      if (v71 >= v106)
        goto LABEL_65;
      v75 = *(_QWORD *)&v105[8 * v71];
      ++v76;
      if (v75)
        goto LABEL_60;
    }
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  v71 = v76;
LABEL_60:
  v70 = (v75 - 1) & v75;
  for (i = __clz(__rbit64(v75)) + (v71 << 6); ; i = v72 | (v71 << 6))
  {
    v77 = (uint64_t *)(v19[6] + 16 * i);
    v78 = *v77;
    v79 = v77[1];
    v80 = *(void **)(v19[7] + 8 * i);
    swift_bridgeObjectRetain();
    v81 = v80;
    v82 = objc_msgSend(v81, sel_jsonData);
    if (!v82)
      break;
    v83 = v82;
    v84 = sub_2132F23DC();
    v86 = v85;

    sub_2132F26B8();
    sub_2132F26AC();
    v88 = v87;
    sub_2132EFAB4(v84, v86);
    if (v88)
    {
      v89 = (void *)sub_2132F2694();
      swift_bridgeObjectRelease();
      v108[0] = v78;
      v108[1] = v79;
      swift_bridgeObjectRetain();
      objc_msgSend(v104, sel___swift_setObject_forKeyedSubscript_, v89, sub_2132F2874());
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
      if (!v70)
        goto LABEL_47;
    }
    else
    {
      swift_bridgeObjectRelease();

      if (!v70)
        goto LABEL_47;
    }
LABEL_46:
    v72 = __clz(__rbit64(v70));
    v70 &= v70 - 1;
  }
LABEL_69:
  __break(1u);
LABEL_70:
  result = (id)sub_2132F288C();
  __break(1u);
  return result;
}

unint64_t sub_2132EEE48(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93360);
  v2 = (_QWORD *)sub_2132F2850();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2132EF464(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

void sub_2132EEFC8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t v10;

  v1 = sub_2132F25E0();
  v8[4] = *(_QWORD *)(v1 - 8);
  v8[5] = v1;
  MEMORY[0x24BDAC7A8](v1);
  v8[3] = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2132F2658();
  MEMORY[0x24BDAC7A8](v9);
  v3 = sub_2132F2610();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2132F25C8();
  sub_2132F25A4();
  v7 = (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __asm { BR              X10 }
}

uint64_t sub_2132EF110()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v5 = sub_2132F0884();
  v6 = v3;
  v7 = *(_QWORD *)(v4 - 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v7);
  v8 = *(_QWORD *)(v4 - 136);
  v9 = *(_QWORD *)(v4 - 128);
  v10 = *(_QWORD *)(v4 - 120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v2, v10);
  swift_bridgeObjectRetain();
  v11 = sub_2132F264C();
  v12 = sub_2132F276C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    *(_QWORD *)(v4 - 144) = v6;
    v14 = v13;
    v15 = swift_slowAlloc();
    *(_QWORD *)(v4 - 152) = v15;
    *(_QWORD *)(v4 - 88) = v15;
    *(_DWORD *)v14 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v4 - 96) = sub_2132EB140(*(_QWORD *)(v4 - 104), v1, (uint64_t *)(v4 - 88));
    sub_2132F2784();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2080;
    v16 = sub_2132F25D4();
    *(_QWORD *)(v4 - 96) = sub_2132EB140(v16, v17, (uint64_t *)(v4 - 88));
    sub_2132F2784();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD))(v9 + 8))(v8, *(_QWORD *)(v4 - 120));
    _os_log_impl(&dword_2132E5000, v11, v12, "Task %s has unsupported taskType with taskName: %s", (uint8_t *)v14, 0x16u);
    v18 = *(_QWORD *)(v4 - 152);
    swift_arrayDestroy();
    MEMORY[0x2199B15EC](v18, -1, -1);
    MEMORY[0x2199B15EC](v14, -1, -1);

    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 144) + 8))(v0, *(_QWORD *)(v4 - 112));
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v7);
  }
  return 0;
}

id SimpleTaskSuccessEvaluator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SimpleTaskSuccessEvaluator.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator_minStartCallDurationInMs] = 5000;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SimpleTaskSuccessEvaluator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2132EF464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2132F2898();
  sub_2132F26D0();
  v4 = sub_2132F28B0();
  return sub_2132EF7D4(a1, a2, v4);
}

uint64_t sub_2132EF4C8(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93360);
  v38 = a2;
  v6 = sub_2132F2844();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2132F2898();
    sub_2132F26D0();
    result = sub_2132F28B0();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2132EF7D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2132F2868() & 1) == 0)
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
      while (!v14 && (sub_2132F2868() & 1) == 0);
    }
  }
  return v6;
}

id sub_2132EF8B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93360);
  v2 = *v0;
  v3 = sub_2132F2838();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

unint64_t sub_2132EFA64(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

uint64_t sub_2132EFA74(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199B1574](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2132EFAB4(uint64_t a1, unint64_t a2)
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

uint64_t sub_2132EFAF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B93310);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132EFB38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v61;
  void (*v62)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v63;
  _BYTE *v64;
  NSObject *v65;
  os_log_type_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(_BYTE *, uint64_t);
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  _BYTE *v79;
  unint64_t v80;
  NSObject *v81;
  uint64_t v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  void (*v87)(_BYTE *, uint64_t);
  uint64_t v88;
  uint64_t v89;
  void (*v90)(_BYTE *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  id v95;
  unint64_t v96;
  char v97;
  id v98;
  _BYTE v99[4];
  int v100;
  unint64_t v101;
  _BYTE *v102;
  _BYTE *v103;
  _BYTE *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE *v107;
  _BYTE *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  v106 = a2;
  v111 = sub_2132F2658();
  v3 = *(_QWORD *)(v111 - 8);
  v4 = MEMORY[0x24BDAC7A8](v111);
  v108 = &v99[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v99[-v7];
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = &v99[-v10];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v99[-v12];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B93310);
  MEMORY[0x24BDAC7A8](v14);
  v16 = &v99[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = sub_2132F25E0();
  v18 = *(_QWORD *)(v17 - 8);
  v109 = v17;
  v110 = v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v107 = &v99[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v99[-v22];
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = &v99[-v25];
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = &v99[-v28];
  MEMORY[0x24BDAC7A8](v27);
  v31 = &v99[-v30];
  if ((sub_2132F2580() & 1) != 0)
  {
    v102 = v29;
    v103 = v26;
    v104 = v23;
    v32 = v11;
    v108 = v31;
    v33 = v111;
    v34 = (_BYTE *)sub_2132F2598();
    v36 = v35;
    v107 = v34;
    sub_2132F261C();
    v37 = v109;
    v38 = v110;
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v110 + 48))(v16, 1, v109) == 1)
    {
      sub_2132EFAF8((uint64_t)v16);
      v39 = sub_2132F0884();
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v8, v39, v33);
      swift_bridgeObjectRetain();
      v40 = sub_2132F264C();
      v41 = sub_2132F276C();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v43 = swift_slowAlloc();
        v113 = v43;
        *(_DWORD *)v42 = 136315138;
        swift_bridgeObjectRetain();
        v112 = sub_2132EB140((uint64_t)v107, v36, &v113);
        sub_2132F2784();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2132E5000, v40, v41, "Could not get previousTaskEngagement with taskId %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199B15EC](v43, -1, -1);
        MEMORY[0x2199B15EC](v42, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v33);
    }
    else
    {
      v101 = v36;
      v57 = v108;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v38 + 32))(v108, v16, v37);
      if ((sub_2132E9D44() & 1) != 0)
      {
        if ((sub_2132E9E10() & 1) != 0)
        {
          v58 = sub_2132F0884();
          v59 = v3;
          v60 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16);
          v61 = v13;
          v60(v13, v58, v33);
          v62 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v38 + 16);
          v63 = v102;
          v62(v102, a1, v37);
          v64 = v103;
          v62(v103, (uint64_t)v57, v37);
          v104 = v61;
          v65 = sub_2132F264C();
          v66 = sub_2132F2754();
          v67 = v66;
          if (os_log_type_enabled(v65, v66))
          {
            v68 = swift_slowAlloc();
            v105 = v59;
            v69 = v68;
            v70 = swift_slowAlloc();
            v113 = v70;
            *(_DWORD *)v69 = 136315394;
            v100 = v67;
            v71 = sub_2132F25C8();
            v112 = sub_2132EB140(v71, v72, &v113);
            sub_2132F2784();
            swift_bridgeObjectRelease();
            v73 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
            v73(v63, v109);
            *(_WORD *)(v69 + 12) = 2080;
            v74 = sub_2132F25C8();
            v112 = sub_2132EB140(v74, v75, &v113);
            v57 = v108;
            sub_2132F2784();
            swift_bridgeObjectRelease();
            v73(v64, v109);
            _os_log_impl(&dword_2132E5000, v65, (os_log_type_t)v100, "Task %s is a restatement of %s", (uint8_t *)v69, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x2199B15EC](v70, -1, -1);
            v37 = v109;
            MEMORY[0x2199B15EC](v69, -1, -1);

            (*(void (**)(_BYTE *, uint64_t))(v105 + 8))(v104, v33);
          }
          else
          {
            v73 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
            v73(v63, v37);
            v73(v64, v37);

            (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v104, v33);
          }
          v91 = *(_QWORD *)v106;
          v92 = v101;
          if (!*(_QWORD *)(*(_QWORD *)v106 + 16))
            goto LABEL_27;
          swift_bridgeObjectRetain();
          v93 = sub_2132EF464((uint64_t)v107, v92);
          if ((v94 & 1) != 0)
          {
            v95 = *(id *)(*(_QWORD *)(v91 + 56) + 8 * v93);
            swift_bridgeObjectRelease();
            objc_msgSend(v95, sel_setIsSuccess_, 0);

          }
          else
          {
            swift_bridgeObjectRelease();
          }
          if (*(_QWORD *)(v91 + 16) && (v96 = sub_2132EF464((uint64_t)v107, v92), (v97 & 1) != 0))
          {
            v98 = *(id *)(*(_QWORD *)(v91 + 56) + 8 * v96);
            swift_bridgeObjectRelease();
            objc_msgSend(v98, sel_setIsSuccessfulDirectExecution_, 0);

          }
          else
          {
LABEL_27:
            swift_bridgeObjectRelease();
          }
          return ((uint64_t (*)(_BYTE *, uint64_t))v73)(v57, v37);
        }
        else
        {
          (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v57, v37);
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        v76 = sub_2132F0884();
        v105 = v3;
        v77 = v32;
        v78 = v33;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v32, v76, v33);
        v79 = v104;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v38 + 16))(v104, a1, v37);
        v80 = v101;
        swift_bridgeObjectRetain();
        v81 = sub_2132F264C();
        v82 = v37;
        v83 = sub_2132F2754();
        if (os_log_type_enabled(v81, v83))
        {
          v84 = swift_slowAlloc();
          v106 = swift_slowAlloc();
          v113 = v106;
          *(_DWORD *)v84 = 136315394;
          v85 = sub_2132F25C8();
          v112 = sub_2132EB140(v85, v86, &v113);
          sub_2132F2784();
          swift_bridgeObjectRelease();
          v87 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
          v88 = v109;
          v87(v79, v109);
          *(_WORD *)(v84 + 12) = 2080;
          swift_bridgeObjectRetain();
          v112 = sub_2132EB140((uint64_t)v107, v80, &v113);
          sub_2132F2784();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2132E5000, v81, v83, "Tasks %s and %s are ineligible for restatement correction.", (uint8_t *)v84, 0x16u);
          v89 = v106;
          swift_arrayDestroy();
          MEMORY[0x2199B15EC](v89, -1, -1);
          MEMORY[0x2199B15EC](v84, -1, -1);

          (*(void (**)(_BYTE *, uint64_t))(v105 + 8))(v77, v111);
          return ((uint64_t (*)(_BYTE *, uint64_t))v87)(v108, v88);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v90 = *(void (**)(_BYTE *, uint64_t))(v38 + 8);
          v90(v79, v82);
          (*(void (**)(_BYTE *, uint64_t))(v105 + 8))(v32, v78);
          return ((uint64_t (*)(_BYTE *, uint64_t))v90)(v108, v82);
        }
      }
    }
  }
  else
  {
    v44 = sub_2132F0884();
    v45 = v108;
    v46 = v111;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v108, v44, v111);
    v47 = v109;
    v48 = v110;
    v49 = v107;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v110 + 16))(v107, a1, v109);
    v50 = sub_2132F264C();
    v51 = sub_2132F2754();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v113 = v53;
      *(_DWORD *)v52 = 136315138;
      v105 = v3;
      v54 = sub_2132F25C8();
      v112 = sub_2132EB140(v54, v55, &v113);
      sub_2132F2784();
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v110 + 8))(v49, v47);
      _os_log_impl(&dword_2132E5000, v50, v51, "Task %s has no previousTaskId set.", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v53, -1, -1);
      MEMORY[0x2199B15EC](v52, -1, -1);

      return (*(uint64_t (**)(_BYTE *, uint64_t))(v105 + 8))(v45, v111);
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v49, v47);

      return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v45, v46);
    }
  }
}

uint64_t type metadata accessor for SimpleTaskSuccessEvaluator()
{
  return objc_opt_self();
}

unint64_t sub_2132F0550()
{
  unint64_t result;

  result = qword_254B93320;
  if (!qword_254B93320)
  {
    result = MEMORY[0x2199B1574](&unk_2132F30F0, &type metadata for SimpleTaskSuccessEvaluator.TaskSuccessType);
    atomic_store(result, (unint64_t *)&qword_254B93320);
  }
  return result;
}

uint64_t method lookup function for SimpleTaskSuccessEvaluator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SimpleTaskSuccessEvaluator.evaluate(pseEvents:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SimpleTaskSuccessEvaluator.evaluateTask(taskEngagement:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SimpleTaskSuccessEvaluator.TaskSuccessType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SimpleTaskSuccessEvaluator.TaskSuccessType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2132F06C4 + 4 * byte_2132F30EA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132F06F8 + 4 * byte_2132F30E5[v4]))();
}

uint64_t sub_2132F06F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132F0700(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132F0708);
  return result;
}

uint64_t sub_2132F0714(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132F071CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132F0720(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132F0728(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132F0734(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2132F0740(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SimpleTaskSuccessEvaluator.TaskSuccessType()
{
  return &type metadata for SimpleTaskSuccessEvaluator.TaskSuccessType;
}

unint64_t sub_2132F0758()
{
  unint64_t result;

  result = qword_254B93358;
  if (!qword_254B93358)
  {
    result = MEMORY[0x2199B1574](&unk_2132F3158, &type metadata for SimpleTaskSuccessEvaluator.TaskSuccessType);
    atomic_store(result, (unint64_t *)&qword_254B93358);
  }
  return result;
}

uint64_t sub_2132F079C()
{
  uint64_t result;

  sub_2132F0924();
  result = sub_2132F2778();
  qword_254B93710 = result;
  return result;
}

uint64_t sub_2132F0804()
{
  uint64_t v0;
  id v1;

  v0 = sub_2132F2658();
  __swift_allocate_value_buffer(v0, qword_254B93718);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B93718);
  if (qword_254B936F0 != -1)
    swift_once();
  v1 = (id)qword_254B93710;
  return sub_2132F2664();
}

uint64_t sub_2132F0884()
{
  uint64_t v0;

  if (qword_254B936F8 != -1)
    swift_once();
  v0 = sub_2132F2658();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254B93718);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

unint64_t sub_2132F0924()
{
  unint64_t result;

  result = qword_254B93368;
  if (!qword_254B93368)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B93368);
  }
  return result;
}

uint64_t sub_2132F0960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93418);
  v0 = sub_2132F2610();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2132F3230;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x24BEA7E20], v0);
  v6(v5 + v2, *MEMORY[0x24BEA7DF8], v0);
  v6(v5 + 2 * v2, *MEMORY[0x24BEA7E10], v0);
  v6(v5 + 3 * v2, *MEMORY[0x24BEA7E00], v0);
  v7 = sub_2132F0ED4(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  result = swift_deallocClassInstance();
  qword_254B93730 = v7;
  return result;
}

uint64_t sub_2132F0A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B93418);
  v0 = sub_2132F2610();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2132F3240;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x24BEA7E28], v0);
  v6(v5 + v2, *MEMORY[0x24BEA7E40], v0);
  v7 = sub_2132F0ED4(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  result = swift_deallocClassInstance();
  qword_254B93738 = v7;
  return result;
}

uint64_t sub_2132F0B70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v16;

  v0 = sub_2132F2610();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2132F24D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2132F258C();
  v8 = sub_2132F25BC();
  if (qword_254B93700 != -1)
    swift_once();
  v9 = qword_254B93730;
  sub_2132F25A4();
  LOBYTE(v9) = sub_2132F0D40((uint64_t)v3, v9);
  v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v3, v0);
  if ((v9 & 1) != 0)
  {
    v11 = sub_2132F112C((uint64_t)v7, v8);
  }
  else
  {
    if (qword_254B93708 != -1)
      swift_once();
    v12 = qword_254B93738;
    sub_2132F25A4();
    v13 = sub_2132F0D40((uint64_t)v3, v12);
    v10(v3, v0);
    if ((v13 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      v14 = 0;
      return v14 & 1;
    }
    v11 = sub_2132F1354((uint64_t)v7, v8);
  }
  v14 = v11;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14 & 1;
}

uint64_t sub_2132F0D40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_2132F2610();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_2132F17A0(&qword_254B93408, MEMORY[0x24BEA7E70]),
        v6 = sub_2132F267C(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_2132F17A0(&qword_254B93410, MEMORY[0x24BEA7E78]);
      v12 = sub_2132F2688();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_2132F0EB4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2132F0EC4()
{
  return swift_allocObject();
}

uint64_t sub_2132F0ED4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_2132F2610();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B93420);
    v10 = sub_2132F27F0();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_2132F17A0(&qword_254B93408, MEMORY[0x24BEA7E70]);
      v14 = sub_2132F267C();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_2132F17A0(&qword_254B93410, MEMORY[0x24BEA7E78]);
          v20 = sub_2132F2688();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_2132F112C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t);
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = sub_2132F24D8();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2132F2454();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - v11;
  sub_2132F24B4();
  v13 = sub_2132F243C();
  v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v12, v6);
  if ((v13 & 1) != 0)
  {
    sub_2132F24B4();
    v15 = sub_2132F2448();
    v17 = v16;
    v14(v12, v6);
    v18 = *(_QWORD *)(a2 + 16);
    if (v18)
    {
      v29 = v6;
      v19 = *(_QWORD *)(sub_2132F25F8() - 8);
      v20 = a2 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
      v21 = *(_QWORD *)(v19 + 72);
      v28 = a2;
      swift_bridgeObjectRetain();
      v22 = v18 - 1;
      while (1)
      {
        v23 = v22;
        sub_2132F25EC();
        sub_2132F24B4();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v31);
        v24 = sub_2132F2448();
        v26 = v25;
        v14(v10, v29);
        if (v15 == v24 && v17 == v26)
          break;
        LOBYTE(v18) = sub_2132F2868();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          v22 = v23 - 1;
          v20 += v21;
          if (v23)
            continue;
        }
        goto LABEL_11;
      }
      swift_bridgeObjectRelease();
      LOBYTE(v18) = 1;
LABEL_11:
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  return v18 & 1;
}

uint64_t sub_2132F1354(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  char *v63;
  uint64_t v64;

  v50 = a2;
  v64 = sub_2132F24D8();
  v59 = *(_QWORD *)(v64 - 8);
  v2 = MEMORY[0x24BDAC7A8](v64);
  v63 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v49 - v4;
  v5 = sub_2132F25F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v49 - v10;
  v12 = sub_2132F2490();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v49 - v17;
  sub_2132F24C0();
  v19 = sub_2132F2460();
  v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v18, v12);
  if ((v19 & 1) == 0)
    return 0;
  v53 = v9;
  v54 = v16;
  v56 = v11;
  v57 = v6;
  v21 = v63;
  sub_2132F24C0();
  v61 = sub_2132F2478();
  v23 = v22;
  v24 = v20;
  v20(v18, v12);
  v25 = *(char **)(v50 + 16);
  if (!v25)
  {
    v46 = 0;
    goto LABEL_17;
  }
  v52 = v18;
  v26 = v50 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
  v55 = *(_QWORD *)(v57 + 72);
  v62 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
  swift_bridgeObjectRetain();
  v27 = v5;
  v28 = v56;
  v29 = v54;
  v30 = v24;
  v51 = v23;
  while (1)
  {
    v63 = v25;
    v62(v28, v26, v27);
    v31 = v58;
    sub_2132F25EC();
    sub_2132F24C0();
    v32 = *(void (**)(char *, uint64_t))(v59 + 8);
    v32(v31, v64);
    v33 = sub_2132F2478();
    v35 = v34;
    v30(v29, v12);
    if (v61 == v33 && v23 == v35)
      break;
    v36 = sub_2132F2868();
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
      goto LABEL_10;
    v28 = v56;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v27);
LABEL_5:
    v26 += v55;
    v25 = v63 - 1;
    if (v63 == (char *)1)
    {
      swift_bridgeObjectRelease();
      v46 = 0;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v60 = v26;
  v37 = v56;
  sub_2132F25EC();
  v38 = v52;
  sub_2132F24C0();
  v39 = v64;
  v32(v21, v64);
  v40 = sub_2132F246C();
  v30(v38, v12);
  v41 = v12;
  v42 = v27;
  v43 = v53;
  v62(v53, (uint64_t)v37, v42);
  if ((v40 & 1) == 0)
  {
    sub_2132F25EC();
    sub_2132F24C0();
    v32(v21, v39);
    v44 = sub_2132F2484();
    v30(v38, v41);
    v45 = *(void (**)(char *, uint64_t))(v57 + 8);
    v45(v43, v42);
    v45(v37, v42);
    v27 = v42;
    v12 = v41;
    v28 = v37;
    v29 = v54;
    v23 = v51;
    v26 = v60;
    if ((v44 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v46 = 1;
      goto LABEL_17;
    }
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  v47 = *(void (**)(char *, uint64_t))(v57 + 8);
  v47(v43, v42);
  v47(v37, v42);
  v46 = 1;
LABEL_17:
  swift_bridgeObjectRelease();
  return v46;
}

uint64_t type metadata accessor for EditableTaskEvaluator()
{
  return objc_opt_self();
}

uint64_t sub_2132F17A0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2132F2610();
    result = MEMORY[0x2199B1574](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2132F17E0()
{
  return 1;
}

id FeatureStoreUtils.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FeatureStoreUtils.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id FeatureStoreUtils.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2132F19A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2132F27B4();
  return sub_2132F19D8(a1, v2);
}

unint64_t sub_2132F19D8(uint64_t a1, uint64_t a2)
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
      sub_2132F2350(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199B1160](v9, a1);
      sub_2132F22DC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2132F1A9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B932D8);
    v3 = sub_2132F27F0();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_2132F2898();
      swift_bridgeObjectRetain();
      sub_2132F26D0();
      result = sub_2132F28B0();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_2132F2868(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_2132F2868();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t inited;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43[5];
  __int128 v44;
  __int128 v45;

  v8 = sub_2132F2658();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v38 - v13;
  v15 = objc_allocWithZone(MEMORY[0x24BE30C60]);
  swift_bridgeObjectRetain();
  v40 = a1;
  v16 = (void *)sub_2132F2694();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithStreamId_, v16);

  if (v17)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B932E8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2132F3270;
    *(_QWORD *)(inited + 32) = a3;
    *(_QWORD *)(inited + 40) = a4;
    swift_bridgeObjectRetain();
    sub_2132F1A9C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    v19 = (void *)sub_2132F273C();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v17, sel_retrieve_, v19);

    if (v20)
    {
      v21 = sub_2132F2670();

      v41 = a3;
      v42 = a4;
      swift_bridgeObjectRetain();
      sub_2132F27CC();
      if (*(_QWORD *)(v21 + 16) && (v22 = sub_2132F19A8((uint64_t)v43), (v23 & 1) != 0))
      {
        sub_2132ECE84(*(_QWORD *)(v21 + 56) + 32 * v22, (uint64_t)&v44);
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_2132F22DC((uint64_t)v43);
      if (*((_QWORD *)&v45 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B93458);
        if ((swift_dynamicCast() & 1) != 0)
        {

          return v41;
        }
      }
      else
      {
        sub_2132F2310((uint64_t)&v44);
      }
    }
    v31 = sub_2132F0884();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v31, v8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v32 = sub_2132F264C();
    v33 = v9;
    v34 = sub_2132F276C();
    if (os_log_type_enabled(v32, v34))
    {
      v35 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39 = v33;
      v37 = v36;
      v43[0] = v36;
      *(_DWORD *)v35 = 136315394;
      v38 = v8;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v44 = sub_2132EB140(a3, a4, v43);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v44 = sub_2132EB140(v40, a2, v43);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v32, v34, "Interaction %s does not exist in stream %s.", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v37, -1, -1);
      MEMORY[0x2199B15EC](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v38);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v8);
    }

  }
  else
  {
    v24 = sub_2132F0884();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v24, v8);
    swift_bridgeObjectRetain_n();
    v25 = sub_2132F264C();
    v26 = sub_2132F276C();
    if (os_log_type_enabled(v25, (os_log_type_t)v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = v8;
      v29 = swift_slowAlloc();
      v43[0] = v29;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v44 = sub_2132EB140(v40, a2, v43);
      sub_2132F2784();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2132E5000, v25, (os_log_type_t)v26, "Failed to extract to feature store because the stream %s is not found", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B15EC](v29, -1, -1);
      MEMORY[0x2199B15EC](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v28);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return MEMORY[0x24BEE4AF8];
}

id _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD08streamId011interactionI011dataVersionSo20FSFCurareInteraction_pSgSS_SSs6UInt32VtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (_QWORD *)_s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(a1, a2, a3, a4);
  if (v6[2])
  {
    v7 = v6[4];
    v8 = v6[5];
    sub_2132F238C(v7, v8);
    swift_bridgeObjectRelease();
    v9 = (void *)objc_opt_self();
    v10 = (void *)sub_2132F23D0();
    v11 = (void *)sub_2132F2694();
    v12 = objc_msgSend(v9, sel_deserialize_dataVersion_interactionId_, v10, a5, v11);
    sub_2132EFAB4(v7, v8);

  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v12;
}

uint64_t type metadata accessor for FeatureStoreUtils()
{
  return objc_opt_self();
}

uint64_t sub_2132F22DC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2132F2310(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B93450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132F2350(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2132F238C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2132F23D0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2132F23DC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2132F23E8()
{
  return MEMORY[0x24BE9C380]();
}

uint64_t sub_2132F23F4()
{
  return MEMORY[0x24BE9C3C8]();
}

uint64_t sub_2132F2400()
{
  return MEMORY[0x24BE9C668]();
}

uint64_t sub_2132F240C()
{
  return MEMORY[0x24BE9C680]();
}

uint64_t sub_2132F2418()
{
  return MEMORY[0x24BE9DE08]();
}

uint64_t sub_2132F2424()
{
  return MEMORY[0x24BE9DE38]();
}

uint64_t sub_2132F2430()
{
  return MEMORY[0x24BE9DE40]();
}

uint64_t sub_2132F243C()
{
  return MEMORY[0x24BEA7A88]();
}

uint64_t sub_2132F2448()
{
  return MEMORY[0x24BEA7A90]();
}

uint64_t sub_2132F2454()
{
  return MEMORY[0x24BEA7AA8]();
}

uint64_t sub_2132F2460()
{
  return MEMORY[0x24BEA7AB0]();
}

uint64_t sub_2132F246C()
{
  return MEMORY[0x24BEA7AB8]();
}

uint64_t sub_2132F2478()
{
  return MEMORY[0x24BEA7AC0]();
}

uint64_t sub_2132F2484()
{
  return MEMORY[0x24BEA7AC8]();
}

uint64_t sub_2132F2490()
{
  return MEMORY[0x24BEA7AD0]();
}

uint64_t sub_2132F249C()
{
  return MEMORY[0x24BEA7B28]();
}

uint64_t sub_2132F24A8()
{
  return MEMORY[0x24BEA7B30]();
}

uint64_t sub_2132F24B4()
{
  return MEMORY[0x24BEA7B98]();
}

uint64_t sub_2132F24C0()
{
  return MEMORY[0x24BEA7BA8]();
}

uint64_t sub_2132F24CC()
{
  return MEMORY[0x24BEA7BC8]();
}

uint64_t sub_2132F24D8()
{
  return MEMORY[0x24BEA7BD8]();
}

uint64_t sub_2132F24E4()
{
  return MEMORY[0x24BEA7C10]();
}

uint64_t sub_2132F24F0()
{
  return MEMORY[0x24BEA7C48]();
}

uint64_t sub_2132F24FC()
{
  return MEMORY[0x24BEA7C58]();
}

uint64_t sub_2132F2508()
{
  return MEMORY[0x24BEA7C68]();
}

uint64_t sub_2132F2514()
{
  return MEMORY[0x24BEA7C78]();
}

uint64_t sub_2132F2520()
{
  return MEMORY[0x24BEA7C98]();
}

uint64_t sub_2132F252C()
{
  return MEMORY[0x24BEA7CA0]();
}

uint64_t sub_2132F2538()
{
  return MEMORY[0x24BEA7CB0]();
}

uint64_t sub_2132F2544()
{
  return MEMORY[0x24BEA7CC0]();
}

uint64_t sub_2132F2550()
{
  return MEMORY[0x24BEA7CD0]();
}

uint64_t sub_2132F255C()
{
  return MEMORY[0x24BEA7CE0]();
}

uint64_t sub_2132F2568()
{
  return MEMORY[0x24BEA7CF0]();
}

uint64_t sub_2132F2574()
{
  return MEMORY[0x24BEA7D08]();
}

uint64_t sub_2132F2580()
{
  return MEMORY[0x24BEA7D10]();
}

uint64_t sub_2132F258C()
{
  return MEMORY[0x24BEA7D18]();
}

uint64_t sub_2132F2598()
{
  return MEMORY[0x24BEA7D28]();
}

uint64_t sub_2132F25A4()
{
  return MEMORY[0x24BEA7D38]();
}

uint64_t sub_2132F25B0()
{
  return MEMORY[0x24BEA7D48]();
}

uint64_t sub_2132F25BC()
{
  return MEMORY[0x24BEA7D68]();
}

uint64_t sub_2132F25C8()
{
  return MEMORY[0x24BEA7D78]();
}

uint64_t sub_2132F25D4()
{
  return MEMORY[0x24BEA7D88]();
}

uint64_t sub_2132F25E0()
{
  return MEMORY[0x24BEA7DA0]();
}

uint64_t sub_2132F25EC()
{
  return MEMORY[0x24BEA7DB8]();
}

uint64_t sub_2132F25F8()
{
  return MEMORY[0x24BEA7DE8]();
}

uint64_t sub_2132F2604()
{
  return MEMORY[0x24BEA7E50]();
}

uint64_t sub_2132F2610()
{
  return MEMORY[0x24BEA7E60]();
}

uint64_t sub_2132F261C()
{
  return MEMORY[0x24BEA7F60]();
}

uint64_t sub_2132F2628()
{
  return MEMORY[0x24BE5BF90]();
}

uint64_t sub_2132F2634()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t sub_2132F2640()
{
  return MEMORY[0x24BE5C190]();
}

uint64_t sub_2132F264C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2132F2658()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2132F2664()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2132F2670()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2132F267C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2132F2688()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2132F2694()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2132F26A0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2132F26AC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2132F26B8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2132F26C4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2132F26D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2132F26DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2132F26E8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2132F26F4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2132F2700()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2132F270C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2132F2718()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2132F2724()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2132F2730()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2132F273C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2132F2748()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2132F2754()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2132F2760()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2132F276C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2132F2778()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2132F2784()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2132F2790()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2132F279C()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t sub_2132F27A8()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_2132F27B4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2132F27C0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2132F27CC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2132F27D8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2132F27E4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2132F27F0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2132F27FC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2132F2808()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2132F2814()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2132F2820()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2132F282C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2132F2838()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2132F2844()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2132F2850()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2132F285C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2132F2868()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2132F2874()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2132F2880()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2132F288C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2132F2898()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2132F28A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2132F28B0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

