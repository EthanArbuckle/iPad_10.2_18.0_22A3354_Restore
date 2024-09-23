uint64_t sub_229204D14(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[40];

  v3 = v2;
  sub_2292274C4();
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_36();
  sub_2292086D8(a1, v3 + 16);
  *(_BYTE *)(v3 + 64) = a2;
  type metadata accessor for RestartShutdownCATs();
  sub_2292274B8();
  sub_22922744C();
  sub_2292086D8(a1, (uint64_t)v9);
  sub_229227440();
  v7 = sub_229227470();
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v3 + 56) = v7;
  return v3;
}

uint64_t sub_229204DE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[12] = a1;
  v2[13] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v2[14] = OUTLINED_FUNCTION_7();
  v3 = sub_22922729C();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = OUTLINED_FUNCTION_7();
  v4 = sub_229227230();
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = OUTLINED_FUNCTION_1();
  v2[21] = OUTLINED_FUNCTION_4();
  v5 = sub_229227278();
  v2[22] = v5;
  v2[23] = *(_QWORD *)(v5 - 8);
  v2[24] = OUTLINED_FUNCTION_1();
  v2[25] = OUTLINED_FUNCTION_4();
  v6 = sub_2292272B4();
  v2[26] = v6;
  v2[27] = *(_QWORD *)(v6 - 8);
  v2[28] = OUTLINED_FUNCTION_1();
  v2[29] = OUTLINED_FUNCTION_4();
  v7 = sub_2292270C8();
  v2[30] = v7;
  v2[31] = *(_QWORD *)(v7 - 8);
  v2[32] = OUTLINED_FUNCTION_7();
  sub_2292274C4();
  v2[33] = OUTLINED_FUNCTION_7();
  v8 = sub_2292270EC();
  v2[34] = v8;
  v2[35] = *(_QWORD *)(v8 - 8);
  v2[36] = OUTLINED_FUNCTION_1();
  v2[37] = OUTLINED_FUNCTION_4();
  v2[38] = OUTLINED_FUNCTION_4();
  v2[39] = OUTLINED_FUNCTION_4();
  v9 = OUTLINED_FUNCTION_98();
  v2[40] = v9;
  v2[41] = *(_QWORD *)(v9 - 8);
  v2[42] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229204F28()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  if (qword_255A3B748 != -1)
    swift_once();
  v2 = v0[41];
  v1 = v0[42];
  v3 = v0[40];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_255A3E6C8);
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  sub_2292274D0();
  v5 = OUTLINED_FUNCTION_127();
  if (os_log_type_enabled(v1, v5))
  {
    v6 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_54(v6);
    _os_log_impl(&dword_229202000, v1, v5, "SCSystemCommandsYesNoStrategy | making prompt for Yes/No response", (uint8_t *)v2, 2u);
    OUTLINED_FUNCTION_2();
  }
  v7 = v0[13];

  v8 = OUTLINED_FUNCTION_121();
  v9(v8);
  if (*(_BYTE *)(v7 + 64))
  {
    if (*(_BYTE *)(v7 + 64) == 1)
    {
      v10 = (_QWORD *)swift_task_alloc();
      v0[45] = v10;
      *v10 = v0;
      v10[1] = sub_2292052C4;
      return sub_22920ADE8(v0[37]);
    }
    else
    {
      v13 = v0[13];
      type metadata accessor for ScreenRecordingCATs();
      sub_2292274B8();
      sub_22922744C();
      sub_2292086D8(v13 + 16, (uint64_t)(v0 + 2));
      sub_229227440();
      v0[47] = sub_229227470();
      v14 = (_QWORD *)swift_task_alloc();
      v0[48] = v14;
      *v14 = v0;
      v14[1] = sub_229205448;
      return sub_229220F00();
    }
  }
  else
  {
    v12 = (_QWORD *)swift_task_alloc();
    v0[43] = v12;
    *v12 = v0;
    v12[1] = sub_229205144;
    return sub_22920AD30(v0[38]);
  }
}

uint64_t sub_229205144()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_59();
  *v2 = *v1;
  *(_QWORD *)(v3 + 352) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

#error "22920520C: call analysis failed (funcsize=73)"

uint64_t sub_2292052C4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_59();
  *v2 = *v1;
  *(_QWORD *)(v3 + 368) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

#error "229205390: call analysis failed (funcsize=74)"

uint64_t sub_229205448()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_59();
  *v2 = *v1;
  *(_QWORD *)(v3 + 392) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

#error "22920552C: call analysis failed (funcsize=80)"

uint64_t sub_2292055E4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_86();
  return OUTLINED_FUNCTION_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920564C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_86();
  return OUTLINED_FUNCTION_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292056B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_83();
  swift_release();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_86();
  return OUTLINED_FUNCTION_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229205724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t (**v34)(uint64_t, uint64_t);
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject **v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  void (*v58)(NSObject *, char *, uint64_t (**)(uint64_t, uint64_t));
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  BOOL v65;
  NSObject *v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(NSObject *, uint64_t (**)(uint64_t, uint64_t));
  uint64_t (**v71)(uint64_t, uint64_t);
  uint64_t v72;
  NSObject *v73;
  void *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  void (*v89)(NSObject *, uint64_t (**)(uint64_t, uint64_t));
  uint64_t v90;
  uint64_t (*isa)(char *, uint64_t);
  uint64_t v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  uint64_t (**v105)(uint64_t, uint64_t);
  uint64_t v106;
  os_log_type_t v107;
  _WORD *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  os_log_type_t v123;
  _BOOL4 v124;
  uint64_t v125;
  uint64_t v126;
  _WORD *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(uint64_t, NSObject **, uint64_t);
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  os_log_type_t v143;
  _BOOL4 v144;
  uint64_t v145;
  _WORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void (*v150)(uint64_t, uint64_t);
  int v151;
  void (*v152)(void *, uint64_t, uint64_t);
  void *v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  char v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  os_log_type_t v164;
  _BOOL4 v165;
  uint64_t v166;
  _WORD *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  os_log_type_t v177;
  _BOOL4 v178;
  _WORD *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void (*v183)(uint64_t, uint64_t);
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  os_log_type_t v189;
  _BOOL4 v190;
  _DWORD *v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  os_log_type_t v205;
  _WORD *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  NSObject *v211;
  uint64_t v212;
  uint64_t v213;
  os_log_type_t v214;
  _DWORD *v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void (*v221)(uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  NSObject *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  NSObject *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  NSObject *v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t (**v256)(uint64_t, uint64_t);
  uint64_t v257;

  v254 = a2;
  type metadata accessor for SystemCommandsIntent();
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_57(v5 - v4);
  v238 = sub_229227188();
  v245 = *(_QWORD *)(v238 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_57(v9);
  v236 = sub_229227278();
  v256 = *(uint64_t (***)(uint64_t, uint64_t))(v236 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_12();
  v250 = v11;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_33();
  v252 = v13;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_57(v15);
  v243 = sub_22922720C();
  v235 = *(_QWORD *)(v243 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_57(v19);
  v244 = sub_2292271DC();
  v242 = *(_QWORD *)(v244 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_80();
  v248 = v22;
  v253 = OUTLINED_FUNCTION_98();
  v251 = *(_QWORD *)(v253 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_12();
  v241 = v24;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_80();
  v247 = v33;
  v34 = (uint64_t (**)(uint64_t, uint64_t))sub_2292271A0();
  v35 = (uint64_t)*(v34 - 1);
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_12();
  v240 = v36;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v37);
  v39 = ((char *)&v222 - v38);
  v40 = sub_2292271AC();
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
  v43 = MEMORY[0x24BDAC7A8](v42);
  v45 = (char *)&v222 - v44;
  v46 = MEMORY[0x24BDAC7A8](v43);
  v48 = (char *)&v222 - v47;
  v49 = MEMORY[0x24BDAC7A8](v46);
  v51 = (NSObject **)((char *)&v222 - v50);
  MEMORY[0x24BDAC7A8](v49);
  v53 = (char *)&v222 - v52;
  v239 = a1;
  sub_22922717C();
  v54 = (*(uint64_t (**)(char *, uint64_t))(v41 + 88))(v53, v40);
  v55 = *MEMORY[0x24BE98E88];
  v255 = v41;
  if ((_DWORD)v54 == v55)
  {
    v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
    v249 = v53;
    OUTLINED_FUNCTION_97((uint64_t)v48, (uint64_t)v53, v56);
    OUTLINED_FUNCTION_53((uint64_t)v48, *(uint64_t (**)(uint64_t, uint64_t))(v41 + 96));
    v57 = v35;
    v58 = *(void (**)(NSObject *, char *, uint64_t (**)(uint64_t, uint64_t)))(v35 + 16);
    v59 = (uint64_t)v48;
    v256 = v34;
    v58(v39, v48, v34);
    sub_229227194();
    v60 = (void *)OUTLINED_FUNCTION_132();
    v61 = objc_msgSend(v60, sel_identifier);

    v62 = sub_229227524();
    v64 = v63;

    v65 = v35 == v62 && v39 == v64;
    v66 = v39;
    if (v65)
    {
      OUTLINED_FUNCTION_20();
      v68 = v251;
    }
    else
    {
      v67 = OUTLINED_FUNCTION_117();
      OUTLINED_FUNCTION_46();
      swift_bridgeObjectRelease();
      v68 = v251;
      if ((v67 & 1) == 0)
      {
        v69 = v57;
        v70 = *(void (**)(NSObject *, uint64_t (**)(uint64_t, uint64_t)))(v57 + 8);
        v71 = v256;
        v70(v39, v256);
        (*(void (**)(NSObject *, uint64_t, uint64_t (**)(uint64_t, uint64_t)))(v69 + 32))(v240, v59, v71);
        v72 = sub_229227194();
        v39 = v73;
        v74 = (void *)sub_229226F60();
        v75 = objc_msgSend(v74, sel_identifier);

        v76 = sub_229227524();
        v78 = v77;

        if (v72 == v76 && v39 == v78)
        {
          OUTLINED_FUNCTION_20();
          OUTLINED_FUNCTION_114();
        }
        else
        {
          v80 = OUTLINED_FUNCTION_117();
          OUTLINED_FUNCTION_85();
          OUTLINED_FUNCTION_60();
          OUTLINED_FUNCTION_114();
          if ((v80 & 1) == 0)
          {
            v246 = v40;
            v54 = ((uint64_t (*)(NSObject *, _QWORD))v70)(v240, v256);
            v53 = v249;
            goto LABEL_79;
          }
        }
        v105 = v256;
        if (qword_255A3B748 != -1)
          swift_once();
        v106 = __swift_project_value_buffer(v59, (uint64_t)qword_255A3E6C8);
        OUTLINED_FUNCTION_34((uint64_t)v75, v106, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v68 + 16));
        OUTLINED_FUNCTION_89();
        v107 = OUTLINED_FUNCTION_40();
        if (OUTLINED_FUNCTION_10(v107))
        {
          v108 = (_WORD *)OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_54(v108);
          OUTLINED_FUNCTION_5(&dword_229202000, v109, v110, "SCSystemCommandsYesNoStrategy actionForInput | cancel pressed");
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_58((uint64_t)v75, *(uint64_t (**)(uint64_t, uint64_t))(v68 + 8));
        OUTLINED_FUNCTION_79();
        v70(v240, v105);
        isa = (uint64_t (*)(char *, uint64_t))v66[1].isa;
        goto LABEL_35;
      }
    }
    if (qword_255A3B748 != -1)
      swift_once();
    v84 = v253;
    v85 = __swift_project_value_buffer(v253, (uint64_t)qword_255A3E6C8);
    v86 = v247;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v68 + 16))(v247, v85, v84);
    sub_2292274D0();
    v87 = OUTLINED_FUNCTION_127();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v88 = 0;
      _os_log_impl(&dword_229202000, v86, v87, "SCSystemCommandsYesNoStrategy actionForInput | confirm pressed", v88, 2u);
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(NSObject *, uint64_t))(v68 + 8))(v86, v84);
    OUTLINED_FUNCTION_62();
    v89 = *(void (**)(NSObject *, uint64_t (**)(uint64_t, uint64_t)))(v57 + 8);
    v89(v39, v256);
    v90 = OUTLINED_FUNCTION_121();
    ((void (*)(uint64_t))v89)(v90);
    isa = *(uint64_t (**)(char *, uint64_t))(v255 + 8);
LABEL_35:
    v111 = v249;
    v112 = v40;
    return isa(v111, v112);
  }
  v246 = v40;
  if ((_DWORD)v54 == *MEMORY[0x24BE98E10])
  {
    v81 = v255;
    v82 = v246;
    (*(void (**)(NSObject **, char *, uint64_t))(v255 + 16))(v51, v53, v246);
    (*(void (**)(NSObject **, uint64_t))(v81 + 96))(v51, v82);
    v39 = *v51;
    objc_opt_self();
    if (OUTLINED_FUNCTION_71() || (objc_opt_self(), OUTLINED_FUNCTION_71()))
    {
      (*(void (**)(char *, uint64_t))(v81 + 8))(v53, v82);
      OUTLINED_FUNCTION_118();
      return OUTLINED_FUNCTION_79();
    }
    objc_opt_self();
    v132 = OUTLINED_FUNCTION_71();
    v59 = v253;
    if (v132)
    {
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_118();
      isa = *(uint64_t (**)(char *, uint64_t))(v81 + 8);
      v111 = v53;
LABEL_84:
      v112 = v82;
      return isa(v111, v112);
    }
    v54 = OUTLINED_FUNCTION_118();
LABEL_79:
    v249 = v53;
    if (qword_255A3B748 != -1)
      v54 = swift_once();
    OUTLINED_FUNCTION_27(v54, (uint64_t)qword_255A3E6C8);
    v184 = v251;
    v185 = v241;
    OUTLINED_FUNCTION_34(v241, v186, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
    v187 = v245;
    v188 = v237;
    OUTLINED_FUNCTION_97(v237, v239, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v245 + 16));
    sub_2292274D0();
    v189 = OUTLINED_FUNCTION_40();
    v190 = os_log_type_enabled(v39, v189);
    v82 = v246;
    if (v190)
    {
      v191 = (_DWORD *)OUTLINED_FUNCTION_16();
      v257 = OUTLINED_FUNCTION_16();
      *v191 = 136315138;
      sub_22920865C(&qword_255A3B9D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE98DD0], MEMORY[0x24BE98DE0]);
      v192 = sub_229227728();
      v194 = OUTLINED_FUNCTION_128(v192, v193);
      OUTLINED_FUNCTION_39(v194);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_53(v188, *(uint64_t (**)(uint64_t, uint64_t))(v245 + 8));
      OUTLINED_FUNCTION_69(&dword_229202000, v195, v196, "SCSystemCommandsYesNoStrategy actionForInput | ignoring unknown parse: %s");
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_53(v188, *(uint64_t (**)(uint64_t, uint64_t))(v187 + 8));

    (*(void (**)(uint64_t, uint64_t))(v184 + 8))(v185, v59);
    v197 = v249;
    sub_229227044();
    isa = *(uint64_t (**)(char *, uint64_t))(v255 + 8);
    v111 = v197;
    goto LABEL_84;
  }
  v92 = v255;
  v59 = v253;
  if ((_DWORD)v54 != *MEMORY[0x24BE98E98])
    goto LABEL_79;
  v93 = *(void (**)(char *, char *, uint64_t))(v255 + 16);
  v249 = v53;
  v94 = v246;
  v93(v45, v53, v246);
  (*(void (**)(char *, uint64_t))(v92 + 96))(v45, v94);
  v95 = v244;
  OUTLINED_FUNCTION_97(v248, (uint64_t)v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v242 + 32));
  v96 = v234;
  sub_2292271D0();
  v97 = (_QWORD *)sub_229227200();
  v98 = *(NSObject **)(v235 + 8);
  ((void (*)(uint64_t, uint64_t))v98)(v96, v243);
  v99 = v97[2];
  if (v99)
  {
    OUTLINED_FUNCTION_38();
    v101 = *(_QWORD *)(v100 + 72);
    OUTLINED_FUNCTION_120();
    v102 = v236;
    v103 = v233;
    while (1)
    {
      OUTLINED_FUNCTION_133(v103);
      v104 = sub_22922723C();
      v256[1](v103, v102);
      if ((v104 & 1) != 0)
        break;
      v51 = (NSObject **)((char *)v51 + v101);
      if (!--v99)
      {
        OUTLINED_FUNCTION_20();
        v92 = v255;
        v95 = v244;
        goto LABEL_37;
      }
    }
    v119 = OUTLINED_FUNCTION_20();
    if (qword_255A3B748 != -1)
      v119 = swift_once();
    OUTLINED_FUNCTION_27(v119, (uint64_t)qword_255A3E6C8);
    v120 = v251;
    v121 = v230;
    OUTLINED_FUNCTION_34(v230, v122, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
    OUTLINED_FUNCTION_124();
    v123 = OUTLINED_FUNCTION_40();
    v124 = OUTLINED_FUNCTION_10(v123);
    v125 = v246;
    v126 = v255;
    if (v124)
    {
      v127 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v127);
      OUTLINED_FUNCTION_5(&dword_229202000, v128, v129, "SCSystemCommandsYesNoStrategy actionForInput | hasAccepted");
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_58(v121, *(uint64_t (**)(uint64_t, uint64_t))(v120 + 8));
    OUTLINED_FUNCTION_62();
    v130 = OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_53(v130, v131);
    isa = *(uint64_t (**)(char *, uint64_t))(v126 + 8);
    goto LABEL_60;
  }
  OUTLINED_FUNCTION_85();
  v102 = v236;
LABEL_37:
  OUTLINED_FUNCTION_95();
  sub_229227200();
  OUTLINED_FUNCTION_75();
  v113 = v97[2];
  v114 = v245;
  if (v113)
  {
    v247 = v98;
    OUTLINED_FUNCTION_38();
    v116 = *(_QWORD *)(v115 + 72);
    OUTLINED_FUNCTION_120();
    v117 = v252;
    while (1)
    {
      OUTLINED_FUNCTION_133(v117);
      v118 = sub_229227248();
      OUTLINED_FUNCTION_32(v256[1]);
      if ((v118 & 1) != 0)
        break;
      v51 = (NSObject **)((char *)v51 + v116);
      if (!--v113)
      {
        OUTLINED_FUNCTION_20();
        v95 = v244;
        v114 = v245;
        goto LABEL_50;
      }
    }
    v139 = OUTLINED_FUNCTION_20();
    if (qword_255A3B748 != -1)
      v139 = swift_once();
    OUTLINED_FUNCTION_27(v139, (uint64_t)qword_255A3E6C8);
    v140 = v251;
    v141 = v226;
    OUTLINED_FUNCTION_34(v226, v142, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
    OUTLINED_FUNCTION_124();
    v143 = OUTLINED_FUNCTION_40();
    v144 = OUTLINED_FUNCTION_10(v143);
    v125 = v246;
    v145 = v244;
    if (v144)
    {
      v146 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v146);
      OUTLINED_FUNCTION_5(&dword_229202000, v147, v148, "SCSystemCommandsYesNoStrategy actionForInput | hasRejected");
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_58(v141, *(uint64_t (**)(uint64_t, uint64_t))(v140 + 8));
    OUTLINED_FUNCTION_79();
    v149 = OUTLINED_FUNCTION_76();
    v150(v149, v145);
    isa = *(uint64_t (**)(char *, uint64_t))(v92 + 8);
LABEL_60:
    v111 = v249;
    v112 = v125;
    return isa(v111, v112);
  }
  OUTLINED_FUNCTION_85();
LABEL_50:
  OUTLINED_FUNCTION_95();
  sub_229227200();
  OUTLINED_FUNCTION_75();
  v133 = v97[2];
  if (v133)
  {
    OUTLINED_FUNCTION_38();
    v135 = *(_QWORD *)(v134 + 72);
    v136 = *(void (**)(uint64_t, NSObject **, uint64_t))(v134 + 16);
    OUTLINED_FUNCTION_120();
    v137 = v250;
    while (1)
    {
      v136(v137, v51, v102);
      v138 = sub_229227254();
      OUTLINED_FUNCTION_32(v256[1]);
      if ((v138 & 1) != 0)
        break;
      v51 = (NSObject **)((char *)v51 + v135);
      if (!--v133)
      {
        OUTLINED_FUNCTION_20();
        v59 = v253;
        v95 = v244;
        goto LABEL_62;
      }
    }
    OUTLINED_FUNCTION_20();
    if (qword_255A3B748 != -1)
      swift_once();
    v173 = v253;
    v174 = __swift_project_value_buffer(v253, (uint64_t)qword_255A3E6C8);
    v175 = v251;
    v176 = v224;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 16))(v224, v174, v173);
    sub_2292274D0();
    v177 = OUTLINED_FUNCTION_40();
    v178 = OUTLINED_FUNCTION_10(v177);
    v160 = v246;
    if (v178)
    {
      v179 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v179);
      OUTLINED_FUNCTION_5(&dword_229202000, v180, v181, "SCSystemCommandsYesNoStrategy actionForInput | hasCancelled");
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v176, v173);
    OUTLINED_FUNCTION_79();
    v182 = OUTLINED_FUNCTION_76();
    v183(v182, v244);
    return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v249, v160);
  }
  OUTLINED_FUNCTION_85();
LABEL_62:
  v151 = *(unsigned __int8 *)(v232 + 64);
  v152 = *(void (**)(void *, uint64_t, uint64_t))(v114 + 16);
  v153 = v231;
  v154 = v238;
  v152(v231, v239, v238);
  if (v151 == 2)
  {
    sub_22922717C();
    v155 = v228;
    sub_2292107B8();
    sub_229210AD4();
    v157 = v156;
    sub_22920869C(v155);
    v158 = *(uint64_t (**)(uint64_t, uint64_t))(v114 + 8);
    v159 = OUTLINED_FUNCTION_70();
    if ((v157 & 1) != 0)
    {
      v160 = v246;
      if (qword_255A3B748 != -1)
        v159 = swift_once();
      OUTLINED_FUNCTION_27(v159, (uint64_t)qword_255A3E6C8);
      v161 = v251;
      v162 = v223;
      OUTLINED_FUNCTION_34(v223, v163, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
      OUTLINED_FUNCTION_89();
      v164 = OUTLINED_FUNCTION_40();
      v165 = OUTLINED_FUNCTION_10(v164);
      v166 = v242;
      if (v165)
      {
        v167 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_54(v167);
        OUTLINED_FUNCTION_5(&dword_229202000, v168, v169, "SCSystemCommandsYesNoStrategy actionForInput | accepting confirmation for StartRecording parse");
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_58(v162, *(uint64_t (**)(uint64_t, uint64_t))(v161 + 8));
      OUTLINED_FUNCTION_62();
      (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v248, v95);
      return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v249, v160);
    }
  }
  else
  {
    v158 = *(uint64_t (**)(uint64_t, uint64_t))(v114 + 8);
    OUTLINED_FUNCTION_70();
  }
  v170 = v227;
  v152(v227, v239, v154);
  if (v151)
  {
    v171 = OUTLINED_FUNCTION_70();
    v172 = v246;
  }
  else
  {
    sub_22922717C();
    v198 = v228;
    OUTLINED_FUNCTION_129();
    sub_229210AE8();
    v199 = (uint64_t)v170;
    v201 = v200;
    sub_22920869C(v198);
    v171 = v158(v199, v154);
    v172 = v246;
    if ((v201 & 1) != 0)
    {
      v202 = v242;
      if (qword_255A3B748 != -1)
        v171 = swift_once();
      OUTLINED_FUNCTION_27(v171, (uint64_t)qword_255A3E6C8);
      v203 = v222;
      OUTLINED_FUNCTION_34(v222, v204, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
      OUTLINED_FUNCTION_89();
      v205 = OUTLINED_FUNCTION_40();
      if (OUTLINED_FUNCTION_10(v205))
      {
        v206 = (_WORD *)OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_54(v206);
        OUTLINED_FUNCTION_5(&dword_229202000, v207, v208, "SCSystemCommandsYesNoStrategy actionForInput | accepting confirmation for Restart parse");
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_58(v203, *(uint64_t (**)(uint64_t, uint64_t))(v251 + 8));
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_53(v248, *(uint64_t (**)(uint64_t, uint64_t))(v202 + 8));
      return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v249, v172);
    }
  }
  v209 = v242;
  if (qword_255A3B748 != -1)
    v171 = swift_once();
  OUTLINED_FUNCTION_27(v171, (uint64_t)qword_255A3E6C8);
  v210 = v251;
  v211 = v229;
  OUTLINED_FUNCTION_34((uint64_t)v229, v212, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v251 + 16));
  v213 = v225;
  OUTLINED_FUNCTION_97(v225, v248, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v209 + 16));
  sub_2292274D0();
  v214 = OUTLINED_FUNCTION_127();
  v256 = (uint64_t (**)(uint64_t, uint64_t))v211;
  if (os_log_type_enabled(v211, v214))
  {
    v215 = (_DWORD *)OUTLINED_FUNCTION_16();
    v257 = OUTLINED_FUNCTION_16();
    *v215 = 136315138;
    v216 = sub_2292271C4();
    v218 = OUTLINED_FUNCTION_128(v216, v217);
    OUTLINED_FUNCTION_39(v218);
    OUTLINED_FUNCTION_46();
    (*(void (**)(uint64_t, uint64_t))(v242 + 8))(v213, v244);
    OUTLINED_FUNCTION_69(&dword_229202000, v219, v220, "SCSystemCommandsYesNoStrategy actionForInput | ignoring usoParse: %s");
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  v221 = *(void (**)(uint64_t, uint64_t))(v209 + 8);
  v221(v213, v95);

  (*(void (**)(NSObject *, uint64_t))(v210 + 8))(v211, v59);
  sub_229227044();
  v221(v248, v95);
  return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v249, v172);
}

BOOL sub_229206904(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_229206914(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v4 = OUTLINED_FUNCTION_98();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = OUTLINED_FUNCTION_1();
  v3[10] = OUTLINED_FUNCTION_4();
  type metadata accessor for SystemCommandsIntent();
  v3[11] = OUTLINED_FUNCTION_7();
  v5 = sub_229227188();
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = OUTLINED_FUNCTION_1();
  v3[15] = OUTLINED_FUNCTION_4();
  v3[16] = OUTLINED_FUNCTION_4();
  v6 = sub_229227278();
  v3[17] = v6;
  v3[18] = *(_QWORD *)(v6 - 8);
  v3[19] = OUTLINED_FUNCTION_1();
  v3[20] = OUTLINED_FUNCTION_4();
  v7 = sub_22922720C();
  v3[21] = v7;
  v3[22] = *(_QWORD *)(v7 - 8);
  v3[23] = OUTLINED_FUNCTION_1();
  v3[24] = OUTLINED_FUNCTION_4();
  v8 = sub_2292271DC();
  v3[25] = v8;
  v3[26] = *(_QWORD *)(v8 - 8);
  v3[27] = OUTLINED_FUNCTION_1();
  v3[28] = OUTLINED_FUNCTION_4();
  v9 = sub_2292271A0();
  v3[29] = v9;
  v3[30] = *(_QWORD *)(v9 - 8);
  v3[31] = OUTLINED_FUNCTION_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9D0);
  v3[32] = OUTLINED_FUNCTION_7();
  v10 = sub_2292271AC();
  v3[33] = v10;
  v3[34] = *(_QWORD *)(v10 - 8);
  v3[35] = OUTLINED_FUNCTION_1();
  v3[36] = OUTLINED_FUNCTION_4();
  v3[37] = OUTLINED_FUNCTION_4();
  v3[38] = OUTLINED_FUNCTION_4();
  v3[39] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229206A80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, id);
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _DWORD *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(void);
  int v76;
  void (*v77)(_QWORD, _QWORD, _QWORD);
  uint64_t v78;
  void (*v79)(_QWORD, _QWORD);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  os_log_type_t v92;
  _BOOL4 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _DWORD *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(_QWORD);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t, uint64_t);
  uint64_t v109;

  v1 = v0[39];
  v3 = v0[33];
  v2 = v0[34];
  sub_22922717C();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BE98E88])
  {
    v6 = v0[33];
    v5 = v0[34];
    v8 = v0[30];
    v7 = v0[31];
    OUTLINED_FUNCTION_26(v0[37], v0[39], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    OUTLINED_FUNCTION_32(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 96));
    OUTLINED_FUNCTION_94(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
    v9 = v7;
    sub_229227194();
    v10 = (void *)OUTLINED_FUNCTION_132();
    v11 = objc_msgSend(v10, sel_identifier);

    v12 = sub_229227524();
    v14 = v13;

    if (v6 == v12 && v9 == v14)
    {
      OUTLINED_FUNCTION_20();
    }
    else
    {
      v16 = OUTLINED_FUNCTION_117();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46();
      if ((v16 & 1) == 0)
      {
        (*(void (**)(_QWORD, _QWORD))(v0[30] + 8))(v0[31], v0[29]);
        goto LABEL_30;
      }
    }
LABEL_12:
    v20 = *MEMORY[0x24BE98400];
    OUTLINED_FUNCTION_73();
    v21 = OUTLINED_FUNCTION_111();
    v22(v21, v20, v11);
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_82();
    v23 = OUTLINED_FUNCTION_121();
    v24(v23);
    goto LABEL_35;
  }
  if (v4 == *MEMORY[0x24BE98E10])
  {
    v17 = v0[34];
    OUTLINED_FUNCTION_26(v0[38], v0[39], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
    OUTLINED_FUNCTION_32(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 96));
    objc_opt_self();
    if (OUTLINED_FUNCTION_125())
    {
      v18 = v0[32];
      v19 = (unsigned int *)MEMORY[0x24BE98400];
    }
    else
    {
      objc_opt_self();
      if (!OUTLINED_FUNCTION_125())
      {
        swift_unknownObjectRelease();
        goto LABEL_30;
      }
      v18 = v0[32];
      v19 = (unsigned int *)MEMORY[0x24BE983F8];
    }
    v39 = *v19;
    v40 = OUTLINED_FUNCTION_73();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v18, v39, v40);
    __swift_storeEnumTagSinglePayload(v18, 0, 1, v40);
    sub_229227170();
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  if (v4 != *MEMORY[0x24BE98E98])
  {
LABEL_30:
    if (qword_255A3B748 != -1)
      swift_once();
    v53 = v0[13];
    v54 = v0[14];
    v56 = v0[8];
    v55 = v0[9];
    v57 = v0[7];
    v58 = v0[5];
    v59 = __swift_project_value_buffer(v57, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v55, v59, v57);
    OUTLINED_FUNCTION_26(v54, v58, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 16));
    v60 = (void *)OUTLINED_FUNCTION_89();
    v61 = sub_229227620();
    v62 = OUTLINED_FUNCTION_88(v61);
    v63 = v0[13];
    v64 = v0[14];
    v66 = v0[8];
    v65 = v0[9];
    v67 = v0[7];
    if (v62)
    {
      v68 = (_DWORD *)OUTLINED_FUNCTION_16();
      v109 = OUTLINED_FUNCTION_16();
      *v68 = 136315138;
      sub_22920865C(&qword_255A3B9D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE98DD0], MEMORY[0x24BE98DE0]);
      v69 = sub_229227728();
      v0[2] = sub_229209A10(v69, v70, &v109);
      sub_229227680();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_53(v64, *(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));
      OUTLINED_FUNCTION_72(&dword_229202000, v71, v72, "SCSystemCommandsYesNoStrategy parseConfirmationResponse | Unable to parse a confirmation response for: %s");
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_53(v0[14], *(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));

    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
    v73 = OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_66(v73);
    OUTLINED_FUNCTION_82();
    goto LABEL_35;
  }
  v25 = v0[34];
  v26 = v0[26];
  v27 = v0[24];
  v28 = v0[21];
  v29 = v0[22];
  OUTLINED_FUNCTION_26(v0[36], v0[39], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
  OUTLINED_FUNCTION_32(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 96));
  OUTLINED_FUNCTION_94(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 32));
  sub_2292271D0();
  v30 = sub_229227200();
  v31 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v31(v27, v28);
  v32 = *(_QWORD *)(v30 + 16);
  if (v32)
  {
    v108 = v31;
    v33 = v0[18];
    v34 = v30 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
    v35 = *(_QWORD *)(v33 + 72);
    v36 = *(void (**)(uint64_t))(v33 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v37 = OUTLINED_FUNCTION_134();
      v36(v37);
      v38 = sub_22922723C();
      OUTLINED_FUNCTION_113(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
      if ((v38 & 1) != 0)
        break;
      v34 += v35;
      if (!--v32)
      {
        OUTLINED_FUNCTION_20();
        v31 = v108;
        goto LABEL_23;
      }
    }
    v50 = v0[28];
    v51 = v0[26];
    OUTLINED_FUNCTION_20();
    v52 = (unsigned int *)MEMORY[0x24BE98400];
    goto LABEL_44;
  }
  OUTLINED_FUNCTION_60();
LABEL_23:
  v41 = v0[23];
  v42 = v0[21];
  sub_2292271D0();
  v43 = sub_229227200();
  v31(v41, v42);
  v44 = *(_QWORD *)(v43 + 16);
  if (v44)
  {
    v45 = v0[18];
    v46 = v43 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
    v47 = *(_QWORD *)(v45 + 72);
    v48 = *(void (**)(uint64_t))(v45 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v49 = OUTLINED_FUNCTION_134();
      v48(v49);
      v38 = sub_229227248();
      OUTLINED_FUNCTION_113(*(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
      if ((v38 & 1) != 0)
        break;
      v46 += v47;
      if (!--v44)
      {
        OUTLINED_FUNCTION_20();
        goto LABEL_37;
      }
    }
    v50 = v0[28];
    v51 = v0[26];
    OUTLINED_FUNCTION_20();
    v52 = (unsigned int *)MEMORY[0x24BE983F8];
LABEL_44:
    v81 = *v52;
    OUTLINED_FUNCTION_73();
    v82 = OUTLINED_FUNCTION_111();
    v83(v82, v81, v38);
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_82();
    (*(void (**)(uint64_t))(v51 + 8))(v50);
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_60();
LABEL_37:
  v76 = *(unsigned __int8 *)(v0[6] + 64);
  v77 = *(void (**)(_QWORD, _QWORD, _QWORD))(v0[13] + 16);
  v77(v0[16], v0[5], v0[12]);
  if (v76 == 2)
  {
    v78 = v0[13];
    v11 = (id)v0[11];
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_129();
    sub_229210AD4();
    OUTLINED_FUNCTION_115();
    v79 = *(void (**)(_QWORD, _QWORD))(v78 + 8);
    OUTLINED_FUNCTION_126();
    if ((v11 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    v79 = *(void (**)(_QWORD, _QWORD))(v0[13] + 8);
    v79(v0[16], v0[12]);
  }
  v77(v0[15], v0[5], v0[12]);
  if (v76)
  {
    v80 = ((uint64_t (*)(_QWORD, _QWORD))v79)(v0[15], v0[12]);
  }
  else
  {
    v11 = (id)v0[11];
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_129();
    sub_229210AE8();
    OUTLINED_FUNCTION_115();
    v80 = OUTLINED_FUNCTION_126();
    if ((v11 & 1) != 0)
      goto LABEL_12;
  }
  if (qword_255A3B748 != -1)
    v80 = swift_once();
  v85 = v0[27];
  v84 = v0[28];
  v87 = v0[25];
  v86 = v0[26];
  v88 = v0[10];
  v89 = v0[8];
  OUTLINED_FUNCTION_27(v80, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_34(v88, v90, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v85, v84, v87);
  v91 = (void *)sub_2292274D0();
  v92 = sub_229227620();
  v93 = OUTLINED_FUNCTION_88(v92);
  v94 = v0[26];
  v95 = v0[27];
  v96 = v0[10];
  v97 = v0[7];
  v98 = v0[8];
  if (v93)
  {
    v107 = v0[25];
    v99 = (_DWORD *)OUTLINED_FUNCTION_16();
    v109 = OUTLINED_FUNCTION_16();
    *v99 = 136315138;
    v100 = sub_2292271C4();
    v0[3] = sub_229209A10(v100, v101, &v109);
    sub_229227680();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v95, v107);
    OUTLINED_FUNCTION_72(&dword_229202000, v102, v103, "SCSystemCommandsYesNoStrategy parseConfirmationResponse | Unknown usoParse: %s");
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  v104 = *(void (**)(_QWORD))(v94 + 8);
  ((void (*)(_QWORD, _QWORD))v104)(v0[27], v0[25]);

  (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v96, v97);
  v105 = OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_66(v105);
  OUTLINED_FUNCTION_82();
  v106 = OUTLINED_FUNCTION_121();
  v104(v106);
LABEL_35:
  (*(void (**)(_QWORD, _QWORD))(v0[34] + 8))(v0[39], v0[33]);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  swift_task_dealloc();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_86();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v74 = (uint64_t (*)(void))OUTLINED_FUNCTION_100();
  return v74();
}

uint64_t sub_2292073D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9C0);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_36();
  if (*(_BYTE *)(v0 + 64))
  {
    if (*(_BYTE *)(v0 + 64) == 1)
      sub_22920ACF0();
    else
      sub_22920ACD0();
  }
  else
  {
    sub_22920AD10();
  }
  v2 = sub_22922777C();
  OUTLINED_FUNCTION_96(v2, &qword_255A3B9C0);
  return v2;
}

uint64_t sub_229207488()
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
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  os_log_type_t v44;
  _WORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v56;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_36();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9C0);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_36();
  v10 = v9 - v8;
  if (qword_255A3B730 != -1)
    swift_once();
  v11 = sub_2292073D0();
  if (v12)
  {
    v13 = v11;
    sub_22920ACB0();
    v14 = sub_22922777C();
    v16 = v15;
    sub_229208758(v10, &qword_255A3B9C0);
    if (v16)
    {
      v56 = v14;
      v17 = (void *)objc_opt_self();
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
      v18 = (void *)OUTLINED_FUNCTION_67();
      v19 = (void *)sub_229226F6C();
      v20 = objc_msgSend(v19, sel_identifier, v16, v56, v13);

      sub_229227524();
      OUTLINED_FUNCTION_130(v21, &qword_255A3B9C8);
      swift_bridgeObjectRetain();
      v22 = sub_229207CA4();
      v23 = sub_229227500();
      sub_2292083F4(v23, v22);
      v24 = swift_bridgeObjectRelease();
      v25 = OUTLINED_FUNCTION_78(v24, sel_runSiriKitExecutorCommandWithContext_payload_);

      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
      v26 = (void *)OUTLINED_FUNCTION_67();
      v27 = (void *)sub_229226F60();
      v28 = objc_msgSend(v27, sel_identifier);

      sub_229227524();
      swift_bridgeObjectRetain();
      v29 = sub_229207CA4();
      v30 = sub_229227500();
      sub_2292083F4(v30, v29);
      v31 = swift_bridgeObjectRelease();
      v32 = OUTLINED_FUNCTION_78(v31, sel_runSiriKitExecutorCommandWithContext_payload_);

      v33 = objc_msgSend(v17, sel_wrapCommandInStartLocalRequest_, v25);
      v34 = objc_msgSend(v17, sel_wrapCommandInStartLocalRequest_, v32);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
      if ((sub_229226FD8() & 1) != 0)
      {
        v35 = OUTLINED_FUNCTION_63();
        v41 = sub_229207A64(v35, v36, v37, v38, v39, v40);
      }
      else
      {
        v49 = OUTLINED_FUNCTION_63();
        v41 = sub_22920788C(v49, v50, v51, v52, v53, v54);
      }
      v48 = v41;
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_46();

      return v48;
    }
    OUTLINED_FUNCTION_60();
  }
  if (qword_255A3B748 != -1)
    swift_once();
  v42 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_34(v6, v42, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  v43 = (void *)OUTLINED_FUNCTION_124();
  v44 = sub_229227638();
  if (OUTLINED_FUNCTION_10(v44))
  {
    v45 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_54(v45);
    OUTLINED_FUNCTION_5(&dword_229202000, v46, v47, "Failed to localize labels for confirmation dialog.");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_58(v6, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22920788C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v35;

  OUTLINED_FUNCTION_130(a1, (unint64_t *)&qword_255A3B9B0);
  v9 = sub_229227524();
  v11 = v10;
  v12 = sub_229227524();
  v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C4E0);
  v15 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v15 + 16) = xmmword_229227C70;
  *(_QWORD *)(v15 + 32) = a3;
  OUTLINED_FUNCTION_61();
  swift_bridgeObjectRetain();
  v16 = a3;
  v17 = OUTLINED_FUNCTION_104(a1, a2, v9, v11, v12, v14);
  v18 = sub_229227524();
  v20 = v19;
  v21 = sub_229227524();
  v23 = v22;
  v24 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v24 + 16) = xmmword_229227C70;
  *(_QWORD *)(v24 + 32) = a6;
  OUTLINED_FUNCTION_61();
  swift_bridgeObjectRetain();
  v25 = a6;
  v26 = OUTLINED_FUNCTION_104(a4, a5, v18, v20, v21, v23);
  OUTLINED_FUNCTION_130((uint64_t)v26, &qword_255A3B9B8);
  v27 = v26;
  v28 = v17;
  v29 = sub_22920F4D0(v27, v28);
  v30 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v30 + 16) = xmmword_229227C70;
  *(_QWORD *)(v30 + 32) = v29;
  OUTLINED_FUNCTION_61();

  return v35;
}

uint64_t sub_229207A64(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v27;

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81600]), sel_init);
  v13 = sub_229227524();
  sub_229208460(v13, v14, v12);
  sub_2292084B0(a1, a2, v12);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), (SEL)0x24F1E9DC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C4E0);
  v16 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v16 + 16) = xmmword_229227C70;
  *(_QWORD *)(v16 + 32) = a3;
  OUTLINED_FUNCTION_50();
  v17 = a3;
  OUTLINED_FUNCTION_122(v27, v15);
  OUTLINED_FUNCTION_119((uint64_t)objc_msgSend(v12, sel_setPrimaryButtonAction_, v15), sel_setPrimaryButtonEnabled_);
  v18 = (void *)sub_229227020();
  objc_msgSend(v12, sel_setPrimaryButtonTextColor_, v18);

  sub_229208534(a4, a5, v12);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
  v20 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v20 + 16) = xmmword_229227C70;
  *(_QWORD *)(v20 + 32) = a6;
  OUTLINED_FUNCTION_50();
  v21 = a6;
  OUTLINED_FUNCTION_122(v27, v19);
  OUTLINED_FUNCTION_119((uint64_t)objc_msgSend(v12, sel_setSecondaryButtonAction_, v19), sel_setSecondaryButtonEnabled_);
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815E8]), sel_init);
  v23 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v23 + 16) = xmmword_229227C70;
  *(_QWORD *)(v23 + 32) = v12;
  OUTLINED_FUNCTION_50();
  v24 = v12;
  sub_229208578(v27, v22, &qword_255A3B9A0, (SEL *)&selRef_setTemplateItems_);
  v25 = OUTLINED_FUNCTION_19();
  *(_OWORD *)(v25 + 16) = xmmword_229227C70;
  *(_QWORD *)(v25 + 32) = v22;
  OUTLINED_FUNCTION_50();

  return v27;
}

id sub_229207CA4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_229227518();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_229207D14()
{
  return sub_229227764();
}

uint64_t sub_229207D38()
{
  sub_229227758();
  sub_229227764();
  return sub_229227770();
}

BOOL sub_229207D7C(char *a1, char *a2)
{
  return sub_229206904(*a1, *a2);
}

uint64_t sub_229207D88()
{
  return sub_229207D38();
}

uint64_t sub_229207D90()
{
  return sub_229207D14();
}

uint64_t sub_229207D98()
{
  sub_229227758();
  sub_229227764();
  return sub_229227770();
}

uint64_t sub_229207DD8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SCSystemCommandsYesNoStrategy()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SCSystemCommandsYesNoStrategy.ResponseType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SCSystemCommandsYesNoStrategy.ResponseType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229207F08 + 4 * byte_229227C95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_229207F3C + 4 * byte_229227C90[v4]))();
}

uint64_t sub_229207F3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229207F44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229207F4CLL);
  return result;
}

uint64_t sub_229207F58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229207F60);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_229207F64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229207F6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229207F78(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_229207F84(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SCSystemCommandsYesNoStrategy.ResponseType()
{
  return &type metadata for SCSystemCommandsYesNoStrategy.ResponseType;
}

unint64_t sub_229207FA0()
{
  unint64_t result;

  result = qword_255A3B880;
  if (!qword_255A3B880)
  {
    result = MEMORY[0x22E2C5CD8](&unk_229227D4C, &type metadata for SCSystemCommandsYesNoStrategy.ResponseType);
    atomic_store(result, (unint64_t *)&qword_255A3B880);
  }
  return result;
}

uint64_t sub_229207FDC(uint64_t a1, uint64_t a2)
{
  return sub_22920865C(qword_255A3B888, a2, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227DA4);
}

uint64_t sub_229208008(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292087B4;
  return sub_229204DE0(a1);
}

uint64_t sub_229208058()
{
  return MEMORY[0x24BE98D10];
}

uint64_t sub_229208068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2292087B4;
  return sub_229206914(a1, a2);
}

uint64_t sub_2292080C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SCSystemCommandsYesNoStrategy();
  sub_22920865C(&qword_255A3B8D0, v2, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227D74);
  *v1 = v0;
  v1[1] = sub_2292087B4;
  return sub_229226E34();
}

uint64_t sub_229208150()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SCSystemCommandsYesNoStrategy();
  sub_22920865C(&qword_255A3B8D0, v2, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227D74);
  *v1 = v0;
  v1[1] = sub_2292087B4;
  return sub_229226E40();
}

uint64_t sub_2292081D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SCSystemCommandsYesNoStrategy();
  sub_22920865C(&qword_255A3B8D0, v2, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227D74);
  *v1 = v0;
  v1[1] = sub_2292087B4;
  return sub_229226E4C();
}

uint64_t sub_229208260()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2292087B4;
  return sub_229226E7C();
}

uint64_t sub_2292082CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_229208338;
  return sub_229226E70();
}

uint64_t sub_229208338()
{
  uint64_t *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_59();
  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_229208378()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2292087B4;
  return sub_229226E88();
}

void sub_2292083F4(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_2292274F4();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);

}

void sub_229208460(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_229227518();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setButtonsViewStyle_, v4);

}

void sub_2292084B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_229227518();
  objc_msgSend(a3, sel_setPrimaryButtonLabel_, v4);

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C5CC0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_229208534(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_229227518();
  objc_msgSend(a3, sel_setSecondaryButtonLabel_, v4);

}

void sub_229208578(uint64_t a1, void *a2, uint64_t *a3, SEL *a4)
{
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v6 = (id)sub_22922759C();
  OUTLINED_FUNCTION_60();
  objc_msgSend(a2, *a4, v6);

}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_229208618(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_22920865C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x22E2C5CD8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22920869C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SystemCommandsIntent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2292086D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_229208758(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[36];
  *(_QWORD *)(v1 - 160) = v0[37];
  *(_QWORD *)(v1 - 152) = v2;
  *(_QWORD *)(v1 - 144) = v0[33];
  *(_QWORD *)(v1 - 128) = v0[30];
  *(_QWORD *)(v1 - 88) = v0[24];
  *(_QWORD *)(v1 - 104) = v0[22];
  *(_QWORD *)(v1 - 96) = v0[20];
  v3 = v0[18];
  *(_QWORD *)(v1 - 120) = v0[19];
  *(_QWORD *)(v1 - 112) = v3;
  *(_QWORD *)(v1 - 136) = v0[16];
  return sub_2292270BC();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x22E2C5D5CLL);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_6()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t (*a1)(void))
{
  return a1();
}

BOOL OUTLINED_FUNCTION_10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a14 + 16), *(_QWORD *)(a14 + 40));
  return sub_229226FB4();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_229227068();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a17 + 16))(a16, v17, *(_QWORD *)(v18 - 128));
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_21(__n128 *a1, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  a1[1] = a2;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)a1 + v14, v16, a14);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 136) + 8))(a15, v15);
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_2292271E8();
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 120) + 16))(*(_QWORD *)(v1 - 96), v0, *(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v1 + 16))(*(_QWORD *)(v2 - 88), v0, *(_QWORD *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_26@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a25 + 8))(a23, a24);
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  return (*(uint64_t (**)(uint64_t, _QWORD))(a21 + 8))(a20, *(_QWORD *)(v21 - 104));
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v18 - 120) + 8))(a18, *(_QWORD *)(v18 - 112));
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_229227284();
}

uint64_t OUTLINED_FUNCTION_32@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

double OUTLINED_FUNCTION_35()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_229227680();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_229227620();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a27 + 8))(v28, a28);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_task_dealloc();
}

uint64_t *OUTLINED_FUNCTION_44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13)
{
  a13[3] = a1;
  a13[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1(a13);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_2292270B0();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_2292275C0();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_53@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

_WORD *OUTLINED_FUNCTION_54(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return sub_229227260();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_57@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_58@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_59()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_2292275C0();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_229227038();
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 96);
}

uint64_t OUTLINED_FUNCTION_64()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_229227218();
}

uint64_t OUTLINED_FUNCTION_66(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_229226FF0();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_229207488();
}

void OUTLINED_FUNCTION_69(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_70()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_dynamicCastObjCClass();
}

void OUTLINED_FUNCTION_72(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_22922711C();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_2292272A8();
}

uint64_t OUTLINED_FUNCTION_75()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(v0, *(_QWORD *)(v2 - 216));
}

uint64_t OUTLINED_FUNCTION_76()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 176);
}

id OUTLINED_FUNCTION_78(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  return objc_msgSend(v4, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return sub_22922702C();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_229227170();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_88(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_2292274D0();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_94@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_2292271D0();
}

uint64_t OUTLINED_FUNCTION_96(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_229208758(v2, a2);
}

uint64_t OUTLINED_FUNCTION_97@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_98()
{
  return sub_2292274DC();
}

uint64_t OUTLINED_FUNCTION_99()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_100()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_101()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_103()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_22920F414(a1, a2, a3, a4, a5, a6, v6);
}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_22922717C();
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_111()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_112(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v2 + 280) + 32))(a1, a2, *(_QWORD *)(v2 + 272));
}

uint64_t OUTLINED_FUNCTION_113@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_115()
{
  uint64_t v0;

  return sub_22920869C(v0);
}

uint64_t OUTLINED_FUNCTION_116(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_229208758(v2, a2);
}

uint64_t OUTLINED_FUNCTION_117()
{
  return sub_229227734();
}

uint64_t OUTLINED_FUNCTION_118()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_119(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 1);
}

uint64_t OUTLINED_FUNCTION_120()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_121()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_122(uint64_t a1, void *a2)
{
  uint64_t *v2;
  SEL *v3;

  sub_229208578(a1, a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_123()
{
  return sub_229227290();
}

uint64_t OUTLINED_FUNCTION_124()
{
  return sub_2292274D0();
}

uint64_t OUTLINED_FUNCTION_125()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_126()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_229227620();
}

uint64_t OUTLINED_FUNCTION_128(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_229209A10(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_2292107B8();
}

uint64_t OUTLINED_FUNCTION_130(uint64_t a1, unint64_t *a2)
{
  return sub_229208618(0, a2);
}

uint64_t OUTLINED_FUNCTION_131()
{
  return sub_229227224();
}

uint64_t OUTLINED_FUNCTION_132()
{
  return sub_229226F6C();
}

uint64_t OUTLINED_FUNCTION_133(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_134()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_135()
{
  return sub_22922726C();
}

uint64_t SCSoftwareUpdateFlow.__allocating_init(sharedObjects:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SCSoftwareUpdateFlow.init(sharedObjects:)(a1);
  return v2;
}

uint64_t SCSoftwareUpdateFlow.init(sharedObjects:)(uint64_t a1)
{
  uint64_t v1;
  __int128 v4[2];

  sub_2292086D8(a1 + 40, v1 + 16);
  sub_2292086D8(a1 + 80, (uint64_t)v4);
  sub_229209094(a1);
  sub_2292090C8(v4, v1 + 56);
  return v1;
}

uint64_t sub_229209094(uint64_t a1)
{
  destroy for SharedObjects(a1);
  return a1;
}

uint64_t sub_2292090C8(__int128 *a1, uint64_t a2)
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

uint64_t SCSoftwareUpdateFlow.on(input:)()
{
  return 1;
}

uint64_t SCSoftwareUpdateFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[15] = a1;
  v2[16] = v1;
  sub_229227008();
  v2[17] = OUTLINED_FUNCTION_7();
  v3 = sub_22922714C();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[21] = v4;
  v2[22] = *(_QWORD *)(v4 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  sub_2292274C4();
  v2[25] = OUTLINED_FUNCTION_7();
  return swift_task_switch();
}

uint64_t sub_22920919C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(char, uint64_t, uint64_t);

  v1 = v0[16];
  type metadata accessor for SystemControlCATPatternsExecutor();
  sub_22922744C();
  sub_2292086D8(v1 + 16, (uint64_t)(v0 + 2));
  sub_229227440();
  sub_2292274B8();
  v2 = sub_229227470();
  v0[26] = v2;
  v5 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_255A3BFC8 + dword_255A3BFC8);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[27] = v3;
  *v3 = v0;
  v3[1] = sub_22920927C;
  return v5(0, v2, v0[16]);
}

uint64_t sub_22920927C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2292092F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = sub_2292274D0();
  v6 = sub_22922762C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_229202000, v5, v6, "SCSoftwareUpdateFlow execute | software update pattern successfully executed", v7, 2u);
    OUTLINED_FUNCTION_2();
  }
  v8 = *(void **)(v0 + 224);
  v9 = *(_QWORD *)(v0 + 192);
  v11 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 160);
  v15 = *(_QWORD *)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  sub_229226FFC();
  sub_229227140();
  sub_2292086D8(v13 + 56, v0 + 56);
  sub_2292270E0();
  OUTLINED_FUNCTION_5_0();
  sub_2292270D4();
  sub_229226ED0();
  OUTLINED_FUNCTION_5_0();
  *(_QWORD *)(v0 + 112) = sub_229226EC4();
  sub_229226EDC();
  swift_release();
  sub_229227098();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v16);
  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229209508()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;

  swift_release();
  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(void **)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 232);
  v13 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 168);
  if (v10)
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_16();
    v21 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v0 + 96) = v11;
    v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v17 = sub_229227530();
    *(_QWORD *)(v0 + 104) = sub_229209A10(v17, v18, &v21);
    sub_229227680();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
    _os_log_impl(&dword_229202000, v8, v9, "SCSoftwareUpdateFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_0();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  v19 = *(void **)(v0 + 232);
  sub_2292270A4();

  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void SCSoftwareUpdateFlow.execute(completion:)()
{
  type metadata accessor for SCSoftwareUpdateFlow();
  sub_22920A1A8();
  sub_229226EF4();
  OUTLINED_FUNCTION_6_0();
}

uint64_t SCSoftwareUpdateFlow.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SCSoftwareUpdateFlow.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_2292097DC()
{
  return 1;
}

uint64_t sub_2292097E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22920984C;
  return sub_229226F0C();
}

uint64_t sub_22920984C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void sub_229209880()
{
  SCSoftwareUpdateFlow.execute(completion:)();
}

uint64_t sub_2292098A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCSoftwareUpdateFlow.execute()(a1);
}

uint64_t sub_2292098F4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229209920()
{
  type metadata accessor for SCSoftwareUpdateFlow();
  return sub_229226F18();
}

uint64_t sub_229209948(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_229209958(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22920998C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2292099AC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_229209A10(v6, v7, a3);
  v8 = *a1 + 8;
  sub_229227680();
  swift_bridgeObjectRelease();
  *a1 = v8;
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_229209A10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_229209AE0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22920A1E4((uint64_t)v12, *a3);
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
      sub_22920A1E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_229209AE0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_229209C34((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22922768C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_229209CF8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2292276BC();
    if (!v8)
    {
      result = sub_2292276F8();
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

void *sub_229209C34(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_229209CF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_229209D8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_229209F60(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_229209F60((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_229209D8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_22922756C();
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
  v3 = sub_229209EFC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2292276A4();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_229227710();
  __break(1u);
LABEL_14:
  result = sub_2292276F8();
  __break(1u);
  return result;
}

_QWORD *sub_229209EFC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BE40);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_229209F60(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BE40);
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
    sub_22920A0F8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22920A034(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22920A034(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_229227710();
  __break(1u);
  return result;
}

char *sub_22920A0F8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_229227710();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_22920A178(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SCSoftwareUpdateFlow()
{
  return objc_opt_self();
}

unint64_t sub_22920A1A8()
{
  unint64_t result;
  uint64_t updated;

  result = qword_255A3BD68[0];
  if (!qword_255A3BD68[0])
  {
    updated = type metadata accessor for SCSoftwareUpdateFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCSoftwareUpdateFlow, updated);
    atomic_store(result, qword_255A3BD68);
  }
  return result;
}

uint64_t sub_22920A1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_4_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_allocObject();
}

uint64_t *LocalizationProvider.shared.unsafeMutableAddressor()
{
  if (qword_255A3B730 != -1)
    swift_once();
  return &static LocalizationProvider.shared;
}

uint64_t sub_22920A2C0()
{
  uint64_t result;

  type metadata accessor for LocalizationProvider();
  result = swift_initStaticObject();
  static LocalizationProvider.shared = result;
  return result;
}

uint64_t static LocalizationProvider.shared.getter()
{
  type metadata accessor for LocalizationProvider();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for LocalizationProvider()
{
  return objc_opt_self();
}

uint64_t LocalizationProvider.localizedString(key:table:locale:)(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = sub_229226E1C();
  v18 = v2;
  v16 = sub_22920A504();
  v15 = MEMORY[0x24BEE0D00];
  v3 = sub_229227698();
  v5 = v4;
  swift_bridgeObjectRelease();
  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance, v15, v16, v16, v16, 95, 0xE100000000000000, 45, 0xE100000000000000, v17, v18);
  if (v6)
  {
    v7 = v6;
    v8 = (a1 & 1) == 0;
    if ((a1 & 1) != 0)
      v9 = 0x8000000229229110;
    else
      v9 = 0x80000002292290F0;
    if (v8)
      v10 = 0xD000000000000013;
    else
      v10 = 0xD000000000000014;
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v13 = sub_22920A868(v10, v9, 0x736C6562614CLL, 0xE600000000000000, (uint64_t)v12, v3, v5, v7);

  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v13;
}

unint64_t LocalizationKey.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0xD000000000000013;
}

uint64_t LocalizationTable.rawValue.getter()
{
  return 0x736C6562614CLL;
}

unint64_t sub_22920A504()
{
  unint64_t result;

  result = qword_255A3BE48;
  if (!qword_255A3BE48)
  {
    result = MEMORY[0x22E2C5CD8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255A3BE48);
  }
  return result;
}

uint64_t LocalizationProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LocalizationProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22920A558(char a1)
{
  return LocalizationProvider.localizedString(key:table:locale:)(a1 & 1);
}

BOOL LocalizationTable.init(rawValue:)()
{
  uint64_t v0;

  sub_22922771C();
  OUTLINED_FUNCTION_0_1();
  return v0 != 0;
}

uint64_t sub_22920A5C0()
{
  sub_229227758();
  sub_229227548();
  return sub_229227770();
}

uint64_t sub_22920A60C()
{
  return sub_22920A68C();
}

uint64_t sub_22920A61C()
{
  return sub_229227548();
}

uint64_t sub_22920A630()
{
  sub_229227548();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22920A68C()
{
  sub_229227758();
  sub_229227548();
  swift_bridgeObjectRelease();
  return sub_229227770();
}

uint64_t sub_22920A708()
{
  sub_229227758();
  sub_229227548();
  return sub_229227770();
}

BOOL sub_22920A750@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = LocalizationTable.init(rawValue:)();
  *a1 = result;
  return result;
}

uint64_t sub_22920A784@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LocalizationTable.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriSystemCommandsIntents::LocalizationKey_optional __swiftcall LocalizationKey.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  SiriSystemCommandsIntents::LocalizationKey_optional v2;

  sub_22922771C();
  OUTLINED_FUNCTION_0_1();
  if (v1 == 1)
    v2.value = SiriSystemCommandsIntents_LocalizationKey_confirmationConfirm;
  else
    v2.value = SiriSystemCommandsIntents_LocalizationKey_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

void sub_22920A7F0(char *a1, char *a2)
{
  sub_229210E50(*a1, *a2);
}

uint64_t sub_22920A7FC()
{
  return sub_22920A60C();
}

uint64_t sub_22920A804()
{
  return sub_22920A630();
}

uint64_t sub_22920A80C()
{
  return sub_22920A68C();
}

SiriSystemCommandsIntents::LocalizationKey_optional sub_22920A814@<W0>(Swift::String *a1@<X0>, SiriSystemCommandsIntents::LocalizationKey_optional *a2@<X8>)
{
  SiriSystemCommandsIntents::LocalizationKey_optional result;

  result.value = LocalizationKey.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t sub_22920A840@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = LocalizationKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22920A868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v10 = (void *)sub_229227518();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_229227518();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_229227518();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  if (!v13)
    return 0;
  v14 = sub_229227524();

  return v14;
}

unint64_t sub_22920A95C()
{
  unint64_t result;

  result = qword_255A3BE50;
  if (!qword_255A3BE50)
  {
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for LocalizationTable, &type metadata for LocalizationTable);
    atomic_store(result, (unint64_t *)&qword_255A3BE50);
  }
  return result;
}

unint64_t sub_22920A99C()
{
  unint64_t result;

  result = qword_255A3BE58;
  if (!qword_255A3BE58)
  {
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for LocalizationKey, &type metadata for LocalizationKey);
    atomic_store(result, (unint64_t *)&qword_255A3BE58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizationTable(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizationTable(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22920AA6C + 4 * asc_229227EF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22920AA8C + 4 * byte_229227EF5[v4]))();
}

_BYTE *sub_22920AA6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22920AA8C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22920AA94(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22920AA9C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22920AAA4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22920AAAC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_22920AAB8()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalizationTable()
{
  return &type metadata for LocalizationTable;
}

uint64_t getEnumTagSinglePayload for LocalizationKey(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizationKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22920ABA4 + 4 * byte_229227EFF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22920ABD8 + 4 * byte_229227EFA[v4]))();
}

uint64_t sub_22920ABD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22920ABE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22920ABE8);
  return result;
}

uint64_t sub_22920ABF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22920ABFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22920AC00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22920AC08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22920AC14(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocalizationKey()
{
  return &type metadata for LocalizationKey;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for RestartShutdownCATs()
{
  uint64_t result;

  result = qword_255A3BF00;
  if (!qword_255A3BF00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22920AC74()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22920ACB0()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_22920ACD0()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_22920ACF0()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_22920AD10()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_22920AD30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v3 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920ADA0;
  return OUTLINED_FUNCTION_1_0(a1, 0xD00000000000001DLL, 0x8000000229229790, MEMORY[0x24BEE4AF8], v5);
}

uint64_t sub_22920ADA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22920ADE8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v3 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920B054;
  return OUTLINED_FUNCTION_1_0(a1, 0xD00000000000001ELL, 0x8000000229229770, MEMORY[0x24BEE4AF8], v5);
}

uint64_t sub_22920AE58(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_22920AEA8(a1, a2);
}

uint64_t sub_22920AEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = sub_2292274C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  MEMORY[0x24BDAC7A8](v8);
  sub_22920AFCC(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v10 = sub_229227458();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_22920B014(a1);
  return v10;
}

uint64_t sub_22920AFA8()
{
  sub_22922747C();
  return swift_deallocClassInstance();
}

uint64_t sub_22920AFC4()
{
  return type metadata accessor for RestartShutdownCATs();
}

uint64_t sub_22920AFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22920B014(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_229227464();
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_alloc();
}

uint64_t type metadata accessor for SystemControlCATPatternsExecutor()
{
  uint64_t result;

  result = qword_255A3BF60;
  if (!qword_255A3BF60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22920B0B8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22920B0F4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  *(_BYTE *)(v3 + 112) = a1;
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_22920B108()
{
  unint64_t v0;
  _QWORD *v1;
  unsigned __int8 v2;
  __n128 *v3;
  __n128 *v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  v1[9] = OUTLINED_FUNCTION_10_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BFB8);
  v3 = (__n128 *)OUTLINED_FUNCTION_8_0();
  v1[10] = v3;
  v4 = OUTLINED_FUNCTION_2_1(v3, (__n128)xmmword_229228140);
  v4[4].n128_u64[1] = v0;
  v4[5].n128_u64[0] = 0xD000000000000017;
  v4[5].n128_u64[1] = 0x80000002292298B0;
  v4[7].n128_u64[1] = MEMORY[0x24BEE1328];
  v4[6].n128_u8[0] = v2;
  v7 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92868] + MEMORY[0x24BE92868]);
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  v1[11] = v5;
  *v5 = v1;
  v5[1] = sub_22920B200;
  return OUTLINED_FUNCTION_5_1(0xD000000000000013, 0x80000002292298D0, (uint64_t)v3, v7);
}

uint64_t sub_22920B200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 104) = v0;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22920B250(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  *(_BYTE *)(v3 + 112) = a1;
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_22920B264()
{
  unint64_t v0;
  _QWORD *v1;
  unsigned __int8 v2;
  __n128 *v3;
  __n128 *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  v1[9] = OUTLINED_FUNCTION_10_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BFB8);
  v3 = (__n128 *)OUTLINED_FUNCTION_8_0();
  v1[10] = v3;
  v4 = OUTLINED_FUNCTION_2_1(v3, (__n128)xmmword_229228140);
  v4[5].n128_u64[1] = 0x80000002292298B0;
  v4[7].n128_u64[1] = MEMORY[0x24BEE1328];
  v4[6].n128_u8[0] = v2;
  v9 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92868] + MEMORY[0x24BE92868]);
  v3[4].n128_u64[1] = v0;
  v3[5].n128_u64[0] = 0xD000000000000017;
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  v1[11] = v5;
  *v5 = v1;
  v5[1] = sub_22920B350;
  v6 = OUTLINED_FUNCTION_9_0(0xD00000000000001CLL);
  return OUTLINED_FUNCTION_5_1(v6, v7, (uint64_t)v3, v9);
}

uint64_t sub_22920B350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 104) = v0;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22920B3A0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 104));
}

uint64_t sub_22920B3E0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920B414(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return OUTLINED_FUNCTION_0_3();
}

uint64_t sub_22920B428()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(uint64_t);

  v1 = *(_BYTE *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BFB8);
  v2 = OUTLINED_FUNCTION_8_0();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x80000002292298B0;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  v3 = (int *)MEMORY[0x24BE92868];
  *(_BYTE *)(v2 + 48) = v1;
  v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_229227C60;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = sub_22920B4F4;
  v5 = OUTLINED_FUNCTION_9_0(0xD000000000000025);
  return v7(v5);
}

uint64_t sub_22920B4F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_22920B57C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920B5A8()
{
  return type metadata accessor for SystemControlCATPatternsExecutor();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 96) = v0;
  return swift_task_dealloc();
}

__n128 *OUTLINED_FUNCTION_2_1(__n128 *result, __n128 a2)
{
  unint64_t v2;

  result[1] = a2;
  result[2].n128_u64[0] = 0x7453656369766564;
  result[2].n128_u64[1] = 0xEB00000000657461;
  result[3].n128_u64[0] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_2292274AC();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2292086D8(v1 + 16, v0);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_2292274A0();
}

uint64_t type metadata accessor for SystemQueryCATs()
{
  uint64_t result;

  result = qword_255A3BFD0;
  if (!qword_255A3BFD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22920B6C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22920B6FC()
{
  return type metadata accessor for SystemQueryCATs();
}

uint64_t SystemCommandsFlowProvider.__allocating_init(featureFlags:sharedObjects:)(uint64_t a1, const void *a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_8_0();
  *(_QWORD *)(v4 + 16) = a1;
  memcpy((void *)(v4 + 24), a2, 0x78uLL);
  return v4;
}

uint64_t SystemCommandsFlowProvider.init(featureFlags:sharedObjects:)(uint64_t a1, const void *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  memcpy((void *)(v2 + 24), a2, 0x78uLL);
  return v2;
}

void SystemCommandsFlowProvider.makeFlowSearchResult(for:)(uint64_t a1@<X0>, NSObject *a2@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint8_t *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint8_t *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v4 = type metadata accessor for SystemCommandsIntent();
  MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2292274DC();
  v7 = *(_QWORD *)(v6 - 8);
  v66 = v6;
  v67 = v7;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_2();
  v10 = v8 - v9;
  MEMORY[0x24BDAC7A8](v11);
  v61 = (char *)&v54 - v12;
  v13 = sub_2292271DC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_12();
  v58 = v15;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v54 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v54 - v20;
  v22 = sub_2292271AC();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_12();
  v60 = v24;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v54 - v26;
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v63 = a1;
  v59 = v28;
  v28((uint64_t)&v54 - v26, a1, v22);
  if ((*(unsigned int (**)(char *, uint64_t))(v23 + 88))(v27, v22) == *MEMORY[0x24BE98E98])
  {
    v65 = a2;
    OUTLINED_FUNCTION_9_1(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 96));
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v27, v13);
    if (qword_255A3B748 != -1)
      swift_once();
    v29 = v66;
    v30 = __swift_project_value_buffer(v66, (uint64_t)qword_255A3E6C8);
    v31 = v61;
    OUTLINED_FUNCTION_16_0(v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16));
    v32 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    v57 = v21;
    v33 = v21;
    v34 = v31;
    v32(v19, v33, v13);
    v35 = sub_2292274D0();
    v36 = sub_229227620();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)OUTLINED_FUNCTION_16();
      v56 = OUTLINED_FUNCTION_16();
      v69 = v56;
      v55 = v37;
      *(_DWORD *)v37 = 136315138;
      v54 = v37 + 4;
      v32(v58, v19, v13);
      v38 = sub_229227530();
      v40 = sub_229209A10(v38, v39, &v69);
      OUTLINED_FUNCTION_8_1(v40);
      sub_229227680();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v35, v36, "SystemCommandsFlowProvider makeFlow | uso parse: %s", v55);
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_7_1();

    (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v29);
    v59(v60, v63, v22);
    v53 = (uint64_t)v62;
    sub_2292107B8();
    sub_22920BC90(v53, v65);
    sub_22920869C(v53);
    ((void (*)(char *, uint64_t))v27)(v57, v13);
  }
  else
  {
    v41 = a2;
    if (qword_255A3B748 != -1)
      swift_once();
    v42 = v66;
    v43 = __swift_project_value_buffer(v66, (uint64_t)qword_255A3E6C8);
    v44 = v67;
    OUTLINED_FUNCTION_16_0(v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16));
    v45 = sub_2292274D0();
    v46 = sub_229227620();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = OUTLINED_FUNCTION_16();
      v65 = v41;
      v48 = (uint8_t *)v47;
      v49 = OUTLINED_FUNCTION_16();
      v68 = v22;
      v69 = v49;
      *(_DWORD *)v48 = 136315138;
      v64 = v48 + 4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C020);
      v50 = sub_229227530();
      v52 = sub_229209A10(v50, v51, &v69);
      OUTLINED_FUNCTION_8_1(v52);
      sub_229227680();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v45, v46, "SystemCommandsFlowProvider makeFlow | unable to make flow with parse: %s", v48);
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v10, v42);
    sub_229226F24();
    OUTLINED_FUNCTION_9_1(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  }
  OUTLINED_FUNCTION_4_2();
}

void sub_22920BC90(uint64_t a1@<X0>, NSObject *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t (*v32)();
  unint64_t *v33;
  void *v34;
  uint64_t (*v35)();
  uint64_t started;
  uint64_t *v37;
  void *v38;
  char v39;
  uint64_t v40;
  char v41;
  id v42;
  uint64_t v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  os_log_t v68[2];
  uint64_t v69;
  __int128 v70;
  uint64_t v71[16];

  v4 = type metadata accessor for SystemCommandsIntent();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5_2();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v68 - v9;
  v11 = sub_2292274DC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_5_2();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v68 - v17;
  sub_229210FA0();
  if ((v19 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_0();
    v20 = OUTLINED_FUNCTION_8_0();
    *(_BYTE *)(v20 + 16) = 0;
LABEL_5:
    v71[0] = v20;
    OUTLINED_FUNCTION_17_0((unint64_t *)&qword_255A3C138, v21, (uint64_t)&protocol conformance descriptor for SCTakePhotoFlow);
    OUTLINED_FUNCTION_6_2();
    swift_release();
LABEL_25:
    sub_229226F30();
    goto LABEL_26;
  }
  sub_229210FAC();
  if ((v22 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_0();
    v20 = OUTLINED_FUNCTION_8_0();
    *(_BYTE *)(v20 + 16) = 1;
    goto LABEL_5;
  }
  v68[1] = a2;
  sub_22921129C();
  if ((v23 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_0();
    v25 = OUTLINED_FUNCTION_8_0();
    *(_BYTE *)(v25 + 16) = 2;
    v71[0] = v25;
    v26 = &qword_255A3C138;
    v27 = &protocol conformance descriptor for SCTakePhotoFlow;
LABEL_8:
    OUTLINED_FUNCTION_17_0((unint64_t *)v26, v24, (uint64_t)v27);
    OUTLINED_FUNCTION_6_2();
LABEL_24:
    swift_release();
    goto LABEL_25;
  }
  v68[0] = *(os_log_t *)(v69 + 16);
  v28 = sub_229216DF4();
  sub_229210AD4();
  if ((v28 & 1) != 0)
  {
    if ((v29 & 1) != 0)
    {
      sub_2292112A8();
      v31 = v30;
      type metadata accessor for SCStartScreenRecordingFlow();
      v32 = type metadata accessor for SCStartScreenRecordingFlow;
      OUTLINED_FUNCTION_8_0();
      v71[0] = SCStartScreenRecordingFlow.init(confirmationRequired:)(v31 & 1);
      v33 = (unint64_t *)&unk_255A3C130;
      v34 = &protocol conformance descriptor for SCStartScreenRecordingFlow;
LABEL_12:
      sub_22920C708(v33, (uint64_t (*)(uint64_t))v32, (uint64_t)v34);
      sub_229226EE8();
      swift_release();
      sub_229226F30();
LABEL_26:
      swift_release();
      goto LABEL_27;
    }
    sub_229211400();
    if ((v39 & 1) != 0)
    {
      type metadata accessor for SCStopScreenRecordingFlow();
      v40 = OUTLINED_FUNCTION_8_0();
      *(_BYTE *)(v40 + 16) = 0;
      v71[0] = v40;
      v26 = &qword_255A3C128;
      v27 = &protocol conformance descriptor for SCStopScreenRecordingFlow;
      goto LABEL_8;
    }
  }
  else if ((v29 & 1) != 0)
  {
    type metadata accessor for SCInformationalStartScreenRecordingFlow();
    v35 = type metadata accessor for SCInformationalStartScreenRecordingFlow;
    OUTLINED_FUNCTION_8_0();
    started = SCInformationalStartScreenRecordingFlow.init()();
    OUTLINED_FUNCTION_12_0(started);
    v37 = &qword_255A3C120;
    v38 = &protocol conformance descriptor for SCInformationalStartScreenRecordingFlow;
LABEL_15:
    sub_22920C708((unint64_t *)v37, (uint64_t (*)(uint64_t))v35, (uint64_t)v38);
LABEL_23:
    sub_229226EE8();
    goto LABEL_24;
  }
  sub_229210AE8();
  if ((v41 & 1) != 0)
  {
    v42 = objc_msgSend((id)objc_opt_self(), sel_sharedService);
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_8_0();
    *(_QWORD *)(v15 + 64) = OUTLINED_FUNCTION_11_0();
    *(_QWORD *)(v15 + 72) = &off_24F1E65A0;
    *(_QWORD *)(v15 + 40) = v28;
    *(_WORD *)(v15 + 16) = 0;
LABEL_22:
    *(_QWORD *)(v15 + 24) = sub_229221084;
    *(_QWORD *)(v15 + 32) = 0;
    v71[0] = v15;
    OUTLINED_FUNCTION_17_0(&qword_255A3C118, v43, (uint64_t)&protocol conformance descriptor for SCRestartShutdownFlow);
    goto LABEL_23;
  }
  sub_229211684();
  if ((v44 & 1) != 0)
  {
    v45 = objc_msgSend((id)objc_opt_self(), sel_sharedService);
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_8_0();
    *(_QWORD *)(v15 + 64) = OUTLINED_FUNCTION_11_0();
    *(_QWORD *)(v15 + 72) = &off_24F1E65A0;
    *(_QWORD *)(v15 + 40) = v28;
    *(_WORD *)(v15 + 16) = 256;
    goto LABEL_22;
  }
  if ((sub_229212188() & 1) != 0)
  {
    OUTLINED_FUNCTION_2_2();
    type metadata accessor for SCResetFlow();
    v35 = type metadata accessor for SCResetFlow;
    OUTLINED_FUNCTION_8_0();
    v46 = SCResetFlow.init(sharedObjects:)((uint64_t)v71);
    OUTLINED_FUNCTION_12_0(v46);
    v37 = &qword_255A3C108;
    v38 = &protocol conformance descriptor for SCResetFlow;
    goto LABEL_15;
  }
  if ((sub_229212194() & 1) != 0)
  {
    OUTLINED_FUNCTION_2_2();
    type metadata accessor for SCSoftwareUpdateFlow();
    v35 = type metadata accessor for SCSoftwareUpdateFlow;
    OUTLINED_FUNCTION_8_0();
    v47 = SCSoftwareUpdateFlow.init(sharedObjects:)((uint64_t)v71);
    OUTLINED_FUNCTION_12_0(v47);
    v37 = (uint64_t *)qword_255A3BD68;
    v38 = &protocol conformance descriptor for SCSoftwareUpdateFlow;
    goto LABEL_15;
  }
  v48 = sub_229216DEC();
  v49 = 0x255A3B000uLL;
  if ((v48 & 1) != 0)
  {
    sub_22921222C();
    if ((v50 & 1) != 0)
    {
      type metadata accessor for SCScreenshotFlow();
      v71[0] = OUTLINED_FUNCTION_8_0();
      v26 = &qword_255A3C100;
      v27 = &protocol conformance descriptor for SCScreenshotFlow;
      goto LABEL_8;
    }
    sub_229212384();
    if ((v51 & 1) != 0)
    {
      type metadata accessor for SCLockFlow();
      v71[0] = OUTLINED_FUNCTION_8_0();
      v26 = &qword_255A3C0F8;
      v27 = &protocol conformance descriptor for SCLockFlow;
      goto LABEL_8;
    }
    if (qword_255A3B748 != -1)
      swift_once();
    v52 = __swift_project_value_buffer(v11, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v52, v11);
    v53 = sub_2292274D0();
    v54 = sub_229227620();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)OUTLINED_FUNCTION_16();
      v68[0] = v53;
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_229202000, v68[0], v54, "SystemCommandsIntent isGuestMode | Did not find guestUserMode identifier", v55, 2u);
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
    sub_2292126A0();
    if ((v56 & 1) != 0 && sub_22920C51C())
    {
      OUTLINED_FUNCTION_2_2();
      sub_229226F9C();
      type metadata accessor for SCUnlockFlow();
      v35 = type metadata accessor for SCUnlockFlow;
      swift_allocObject();
      v57 = sub_22920C808(&v70, (uint64_t)v71);
      OUTLINED_FUNCTION_12_0(v57);
      v37 = &qword_255A3C0F0;
      v38 = &unk_2292282D0;
      goto LABEL_15;
    }
    v58 = sub_229212AE0();
    v49 = 0x255A3B000;
    if (v59)
    {
      v60 = v58;
      v61 = v59;
      OUTLINED_FUNCTION_2_2();
      type metadata accessor for SCSystemQueryFlow();
      v32 = type metadata accessor for SCSystemQueryFlow;
      OUTLINED_FUNCTION_8_0();
      v71[0] = SCSystemQueryFlow.init(systemCategory:sharedObjects:)(v60, v61, (uint64_t)v71);
      v33 = (unint64_t *)&qword_255A3C0E8;
      v34 = &protocol conformance descriptor for SCSystemQueryFlow;
      goto LABEL_12;
    }
  }
  if (*(_QWORD *)(v49 + 1864) != -1)
    swift_once();
  v62 = __swift_project_value_buffer(v11, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, v62, v11);
  sub_22920C64C(a1, (uint64_t)v10);
  v63 = sub_2292274D0();
  v64 = sub_229227620();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = OUTLINED_FUNCTION_16();
    v69 = OUTLINED_FUNCTION_16();
    v71[0] = v69;
    *(_DWORD *)v65 = 136315138;
    v68[0] = (os_log_t)(v65 + 4);
    sub_22920C64C((uint64_t)v10, v7);
    v66 = sub_229227530();
    *(_QWORD *)&v70 = sub_229209A10(v66, v67, v71);
    sub_229227680();
    swift_bridgeObjectRelease();
    sub_22920869C((uint64_t)v10);
    OUTLINED_FUNCTION_15_0(&dword_229202000, v63, v64, "SystemCommandsFlowProvider getSupportedFlowFor | no flow found for intent: %s", (uint8_t *)v65);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  sub_22920869C((uint64_t)v10);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  sub_229226F24();
LABEL_27:
  OUTLINED_FUNCTION_4_2();
}

BOOL sub_22920C51C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  _QWORD v7[4];

  v0 = sub_229227110();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_229227104();
  v4 = sub_229226FA8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return (v4 & 1) == 0;
}

uint64_t SystemCommandsFlowProvider.deinit()
{
  uint64_t v0;

  swift_release();
  sub_229209094(v0 + 24);
  return v0;
}

uint64_t SystemCommandsFlowProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  sub_229209094(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SystemCommandsFlowProvider()
{
  return objc_opt_self();
}

uint64_t sub_22920C64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SystemCommandsIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22920C690(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for SharedObjects(a2, a1);
  return a2;
}

unint64_t sub_22920C6CC()
{
  unint64_t result;

  result = qword_255A3C110;
  if (!qword_255A3C110)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A3C110);
  }
  return result;
}

uint64_t sub_22920C708(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2C5CD8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *OUTLINED_FUNCTION_2_2()
{
  uint64_t v0;

  return sub_22920C690((_OWORD *)(*(_QWORD *)(v0 - 256) + 24), (_OWORD *)(v0 - 208));
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_229226EE8();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

unint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_22920C6CC();
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 208) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return type metadata accessor for SCTakePhotoFlow();
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_17_0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_22920C708(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return type metadata accessor for SCRestartShutdownFlow();
}

uint64_t sub_22920C808(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10[2];

  v5 = v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_input;
  v6 = sub_229227188();
  OUTLINED_FUNCTION_17_1(v5, v7, v8, v6);
  sub_2292090C8(a1, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_aceService);
  sub_2292086D8(a2 + 40, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState);
  sub_2292086D8(a2 + 80, (uint64_t)v10);
  sub_229209094(a2);
  sub_2292090C8(v10, v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher);
  return v2;
}

uint64_t sub_22920C8AC(uint64_t a1)
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
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C288);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  v9 = sub_229227188();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_22920D7B8((uint64_t)v8, (uint64_t)v6);
  v10 = v1 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_input;
  swift_beginAccess();
  sub_22920D800((uint64_t)v6, v10);
  swift_endAccess();
  return 1;
}

uint64_t sub_22920C9B0()
{
  type metadata accessor for SCUnlockFlow();
  sub_22920D778();
  return sub_229226EF4();
}

uint64_t sub_22920CA0C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[26] = a1;
  v2[27] = v1;
  sub_229227008();
  v2[28] = OUTLINED_FUNCTION_7();
  v3 = sub_22922714C();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[32] = v4;
  v2[33] = *(_QWORD *)(v4 - 8);
  v2[34] = OUTLINED_FUNCTION_4();
  v2[35] = OUTLINED_FUNCTION_4();
  v2[36] = OUTLINED_FUNCTION_4();
  sub_2292274C4();
  v2[37] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920CAB4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  if ((sub_229226FCC() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
LABEL_4:
    v2 = *(_QWORD *)(v0 + 216);
    type metadata accessor for SystemControlCATPatternsExecutor();
    sub_22922744C();
    sub_2292086D8(v2 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState, v0 + 136);
    sub_229227440();
    sub_2292274B8();
    *(_QWORD *)(v0 + 304) = sub_229227470();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v3;
    *v3 = v0;
    v3[1] = sub_22920CD38;
    return sub_22920B414(0);
  }
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  v1 = sub_229226FC0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v1 & 1) != 0)
    goto LABEL_4;
  if (qword_255A3B748 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(*(_QWORD *)(v0 + 256), (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_8_2(v5);
  v6 = (void *)sub_2292274D0();
  v7 = sub_229227620();
  if (OUTLINED_FUNCTION_14_1(v7))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9_2(&dword_229202000, v8, v9, "SCUnlockFlow execute | cannot unlock device on watchOS");
    OUTLINED_FUNCTION_2();
  }
  v10 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 256);
  v12 = *(_QWORD *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_retain();
  sub_229227134();
  sub_229226E64();
  OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v0 + 192) = sub_229226E58();
  sub_22922708C();
  swift_release();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920CD38(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 320) = a1;
  *(_QWORD *)(v3 + 328) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22920CDA0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  if (qword_255A3B748 != -1)
    swift_once();
  v1 = __swift_project_value_buffer(*(_QWORD *)(v0 + 256), (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_8_2(v1);
  v2 = (void *)sub_2292274D0();
  v3 = sub_22922762C();
  if (OUTLINED_FUNCTION_14_1(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9_2(&dword_229202000, v4, v5, "SCUnlockFlow execute | capturing unlock request and throwing usupported dialog");
    OUTLINED_FUNCTION_2();
  }
  v6 = *(void **)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 288);
  v9 = *(_QWORD *)(v0 + 256);
  v8 = *(_QWORD *)(v0 + 264);
  v10 = *(_QWORD *)(v0 + 248);
  v13 = *(_QWORD *)(v0 + 240);
  v14 = *(_QWORD *)(v0 + 232);
  v11 = *(_QWORD *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  sub_229226FFC();
  sub_229227140();
  sub_2292086D8(v11 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher, v0 + 96);
  sub_2292270E0();
  OUTLINED_FUNCTION_7_2();
  sub_2292270D4();
  sub_229226ED0();
  OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v0 + 200) = sub_229226EC4();
  sub_229226EDC();
  swift_release();
  sub_229227098();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v14);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920CF90()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;

  swift_release();
  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(void **)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 256);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 328);
  v13 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD *)(v0 + 272);
  v14 = *(_QWORD *)(v0 + 256);
  if (v10)
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_16();
    v21 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v0 + 176) = v11;
    v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v17 = sub_229227530();
    *(_QWORD *)(v0 + 184) = sub_229209A10(v17, v18, &v21);
    sub_229227680();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
    _os_log_impl(&dword_229202000, v8, v9, "SCUnlockFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_0();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  v19 = *(void **)(v0 + 328);
  sub_2292270A4();

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920D1BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22920D230(a1);
}

uint64_t sub_22920D20C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920D230(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920D290()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22920D2F0;
  return sub_2292270F8();
}

uint64_t sub_22920D2F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  sub_229208758(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22920D35C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  v11 = *(_QWORD *)(v0 + 192);
  v4 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v5 = sub_2292270C8();
  OUTLINED_FUNCTION_17_1(v3, v6, v7, v5);
  v8 = sub_2292271E8();
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v9 = MEMORY[0x24BE99088];
  v4[3] = v8;
  v4[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_229227074();
  sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  sub_229208758(v3, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v11);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920D4B0()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920D4E4()
{
  uint64_t v0;

  sub_229208758(v0 + OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_input, &qword_255A3C288);
  OUTLINED_FUNCTION_19_0(OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_aceService);
  OUTLINED_FUNCTION_19_0(OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_deviceState);
  OUTLINED_FUNCTION_19_0(OBJC_IVAR____TtC25SiriSystemCommandsIntents12SCUnlockFlow_outputPublisher);
  return v0;
}

uint64_t sub_22920D534()
{
  sub_22920D4E4();
  return swift_deallocClassInstance();
}

uint64_t sub_22920D558()
{
  return type metadata accessor for SCUnlockFlow();
}

uint64_t type metadata accessor for SCUnlockFlow()
{
  uint64_t result;

  result = qword_255A3C178;
  if (!qword_255A3C178)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22920D598()
{
  unint64_t v0;

  sub_22920D610();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_22920D610()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A3C198[0])
  {
    sub_229227188();
    v0 = sub_22922765C();
    if (!v1)
      atomic_store(v0, qword_255A3C198);
  }
}

uint64_t sub_22920D664(uint64_t a1)
{
  sub_22920C8AC(a1);
  return 1;
}

uint64_t sub_22920D688()
{
  return sub_22920C9B0();
}

uint64_t sub_22920D6A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return sub_22920CA0C(a1);
}

uint64_t sub_22920D6FC()
{
  type metadata accessor for SCUnlockFlow();
  return sub_229226F18();
}

uint64_t sub_22920D724(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22920D1BC(a1);
}

unint64_t sub_22920D778()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C0F0;
  if (!qword_255A3C0F0)
  {
    v1 = type metadata accessor for SCUnlockFlow();
    result = MEMORY[0x22E2C5CD8](&unk_2292282D0, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C0F0);
  }
  return result;
}

uint64_t sub_22920D7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22920D800(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, a1, v1);
}

void OUTLINED_FUNCTION_9_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_14_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_19_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1(v1 + a1);
}

uint64_t SCResetFlow.__allocating_init(sharedObjects:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SCResetFlow.init(sharedObjects:)(a1);
  return v2;
}

uint64_t SCResetFlow.init(sharedObjects:)(uint64_t a1)
{
  uint64_t v1;
  __int128 v4[2];

  sub_2292086D8(a1 + 40, v1 + 16);
  sub_2292086D8(a1 + 80, (uint64_t)v4);
  sub_229209094(a1);
  sub_2292090C8(v4, v1 + 56);
  return v1;
}

uint64_t SCResetFlow.on(input:)()
{
  return 1;
}

uint64_t SCResetFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[15] = a1;
  v2[16] = v1;
  sub_229227008();
  v2[17] = OUTLINED_FUNCTION_7();
  v3 = sub_22922714C();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[21] = v4;
  v2[22] = *(_QWORD *)(v4 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  sub_2292274C4();
  v2[25] = OUTLINED_FUNCTION_7();
  return swift_task_switch();
}

uint64_t sub_22920DA0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(char, uint64_t, uint64_t);

  v1 = v0[16];
  type metadata accessor for SystemControlCATPatternsExecutor();
  sub_22922744C();
  sub_2292086D8(v1 + 16, (uint64_t)(v0 + 2));
  sub_229227440();
  sub_2292274B8();
  v2 = sub_229227470();
  v0[26] = v2;
  v5 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_255A3BFC0 + dword_255A3BFC0);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[27] = v3;
  *v3 = v0;
  v3[1] = sub_22920DAEC;
  return v5(0, v2, v0[16]);
}

uint64_t sub_22920DAEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_22920DB60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = sub_2292274D0();
  v6 = sub_22922762C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_229202000, v5, v6, "SCResetFlow execute | reset pattern successfully executed", v7, 2u);
    OUTLINED_FUNCTION_2();
  }
  v8 = *(void **)(v0 + 224);
  v9 = *(_QWORD *)(v0 + 192);
  v11 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 160);
  v15 = *(_QWORD *)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 128);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  sub_229226FFC();
  sub_229227140();
  sub_2292086D8(v13 + 56, v0 + 56);
  sub_2292270E0();
  OUTLINED_FUNCTION_5_0();
  sub_2292270D4();
  sub_229226ED0();
  OUTLINED_FUNCTION_5_0();
  *(_QWORD *)(v0 + 112) = sub_229226EC4();
  sub_229226EDC();
  swift_release();
  sub_229227098();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v16);
  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920DD78()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;

  swift_release();
  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(void **)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 232);
  v13 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 168);
  if (v10)
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_16();
    v21 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v0 + 96) = v11;
    v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v17 = sub_229227530();
    *(_QWORD *)(v0 + 104) = sub_229209A10(v17, v18, &v21);
    sub_229227680();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_4_0();
    _os_log_impl(&dword_229202000, v8, v9, "SCResetFlow execute | error: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_0();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  v19 = *(void **)(v0 + 232);
  sub_2292270A4();

  OUTLINED_FUNCTION_3_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SCResetFlow.execute(completion:)()
{
  type metadata accessor for SCResetFlow();
  sub_22920E110();
  return sub_229226EF4();
}

uint64_t SCResetFlow.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SCResetFlow.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_22920E058()
{
  return SCResetFlow.execute(completion:)();
}

uint64_t sub_22920E078(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCResetFlow.execute()(a1);
}

uint64_t sub_22920E0CC()
{
  type metadata accessor for SCResetFlow();
  return sub_229226F18();
}

uint64_t type metadata accessor for SCResetFlow()
{
  return objc_opt_self();
}

unint64_t sub_22920E110()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C108;
  if (!qword_255A3C108)
  {
    v1 = type metadata accessor for SCResetFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCResetFlow, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C108);
  }
  return result;
}

uint64_t SCInformationalStartScreenRecordingFlow.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SCInformationalStartScreenRecordingFlow.init()();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.init()()
{
  uint64_t v0;
  uint64_t v1;

  sub_2292274C4();
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_3();
  *(_BYTE *)(v0 + 16) = 0;
  type metadata accessor for ScreenRecordingCATs();
  sub_2292274B8();
  sub_22922744C();
  sub_2292271B8();
  sub_229227440();
  *(_QWORD *)(v0 + 24) = sub_229227470();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCInformationalStartScreenRecordingFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[10] = a1;
  v2[11] = v1;
  v3 = sub_2292274DC();
  v2[12] = v3;
  v2[13] = *(_QWORD *)(v3 - 8);
  v2[14] = OUTLINED_FUNCTION_4();
  v2[15] = OUTLINED_FUNCTION_4();
  v2[16] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920E280()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v30[5];

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v1 = sub_229226FD8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 104);
    v3 = *(_QWORD *)(v0 + 96);
    v4 = __swift_project_value_buffer(v3, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_22_0(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    v5 = sub_2292274D0();
    v6 = sub_229227620();
    if (OUTLINED_FUNCTION_12_1(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_6_3(&dword_229202000, v5, (os_log_type_t)v3, "SCInformationalStartScreenRecordingFlow execute | cannot screen record on watchOS");
      OUTLINED_FUNCTION_2();
    }
    v7 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 88);

    OUTLINED_FUNCTION_19_1(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    *(_BYTE *)(v8 + 16) = 2;
    swift_retain();
    sub_229227134();
    sub_229226E64();
    OUTLINED_FUNCTION_11_1();
    *(_QWORD *)(v0 + 72) = OUTLINED_FUNCTION_14_2();
LABEL_17:
    sub_22922708C();
    swift_release();
    goto LABEL_19;
  }
  v9 = *(_QWORD *)(v0 + 88);
  if (!*(_BYTE *)(v9 + 16))
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v24 = *(_QWORD *)(v0 + 96);
    v23 = *(_QWORD *)(v0 + 104);
    v25 = __swift_project_value_buffer(v24, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_22_0(v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16));
    v26 = sub_2292274D0();
    v27 = sub_229227620();
    if (OUTLINED_FUNCTION_12_1(v27))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_6_3(&dword_229202000, v26, (os_log_type_t)v24, "SCInformationalStartScreenRecordingFlow execute");
      OUTLINED_FUNCTION_2();
    }
    v28 = *(_QWORD *)(v0 + 104);

    OUTLINED_FUNCTION_19_1(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
    swift_retain();
    sub_229227134();
    sub_229226E64();
    OUTLINED_FUNCTION_11_1();
    *(_QWORD *)(v0 + 64) = OUTLINED_FUNCTION_14_2();
    goto LABEL_17;
  }
  if (qword_255A3B748 != -1)
    swift_once();
  v10 = *(_QWORD *)(v0 + 120);
  v12 = *(_QWORD *)(v0 + 96);
  v11 = *(_QWORD *)(v0 + 104);
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v13, v12);
  swift_retain_n();
  v14 = sub_2292274D0();
  v15 = sub_229227620();
  v16 = os_log_type_enabled(v14, v15);
  v17 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 96);
  v19 = *(_QWORD *)(v0 + 104);
  if (v16)
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_16();
    v30[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v20 = 136315138;
    *(_BYTE *)(v0 + 136) = *(_BYTE *)(v9 + 16);
    v21 = sub_229227530();
    *(_QWORD *)(v0 + 56) = sub_229209A10(v21, v22, v30);
    sub_229227680();
    OUTLINED_FUNCTION_20_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_229202000, v14, v15, "SCInformationalStartScreenRecordingFlow execute | flow completed with state: %s", v20, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_20_0();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  sub_2292270A4();
LABEL_19:
  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22920E6CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_22920ED38(a1);
}

uint64_t sub_22920E71C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22920E7C8(a1);
}

uint64_t SCInformationalStartScreenRecordingFlow.execute(completion:)()
{
  type metadata accessor for SCInformationalStartScreenRecordingFlow();
  sub_22920F11C();
  return sub_229226EF4();
}

uint64_t sub_22920E7C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[17] = a1;
  v2[18] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v2[19] = OUTLINED_FUNCTION_7();
  v3 = sub_2292270EC();
  v2[20] = v3;
  v2[21] = *(_QWORD *)(v3 - 8);
  v2[22] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920E828()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v1;
  *v1 = v0;
  v1[1] = sub_22920E87C;
  return sub_229220E98(*(_QWORD *)(v0 + 176));
}

uint64_t sub_22920E87C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920E8D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 160);
  v2 = *(uint64_t **)(v0 + 136);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  sub_229226FB4();
  sub_22920EA48();
  v3 = sub_2292270C8();
  v4 = OUTLINED_FUNCTION_8_3(v3);
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  v5 = MEMORY[0x24BE99088];
  v2[3] = v4;
  v2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v2);
  sub_229227050();
  swift_bridgeObjectRelease();
  v6 = sub_229208758(v0 + 96, (uint64_t *)&unk_255A3B9F0);
  OUTLINED_FUNCTION_17_2(v6, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_3_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920EA14()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22920EA48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  __int128 v25;
  uint64_t v26;

  v1 = sub_2292274DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_3();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9C0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229220E1C();
  v9 = sub_22922777C();
  v11 = v10;
  sub_229208758((uint64_t)v8, &qword_255A3B9C0);
  if (v11)
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81948]), sel_init);
    sub_229226E04();
    v13 = sub_229226E10();
    v14 = 0;
    if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v13) != 1)
    {
      v14 = (void *)sub_229226DF8();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v5, v13);
    }
    objc_msgSend(v12, sel_setRef_, v14);

    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81888]), sel_init);
    sub_22920F270(v9, v11, v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C4E0);
    v16 = OUTLINED_FUNCTION_19();
    v25 = xmmword_229227C70;
    *(_OWORD *)(v16 + 16) = xmmword_229227C70;
    *(_QWORD *)(v16 + 32) = v12;
    OUTLINED_FUNCTION_15_1(v16);
    v17 = v26;
    v18 = v12;
    sub_22920F2C0(v17, v15);
    v19 = OUTLINED_FUNCTION_19();
    *(_OWORD *)(v19 + 16) = v25;
    *(_QWORD *)(v19 + 32) = v15;
    OUTLINED_FUNCTION_15_1(v19);
    v20 = v26;

  }
  else
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v1, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v21, v1);
    v22 = sub_2292274D0();
    v23 = sub_229227638();
    if (os_log_type_enabled(v22, v23))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_6_3(&dword_229202000, v22, v23, "Failed to localize button label.");
      OUTLINED_FUNCTION_2();
    }

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    return MEMORY[0x24BEE4AF8];
  }
  return v20;
}

uint64_t sub_22920ED38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22920ED98()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22920EDF8;
  return sub_2292270F8();
}

uint64_t sub_22920EDF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  v2 = swift_task_dealloc();
  OUTLINED_FUNCTION_17_2(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return swift_task_switch();
}

uint64_t sub_22920EE68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v9 = *(_QWORD *)(v0 + 192);
  v3 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v4 = sub_2292270C8();
  v5 = OUTLINED_FUNCTION_8_3(v4);
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v6 = MEMORY[0x24BE99088];
  v3[3] = v5;
  v3[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_229227074();
  v7 = sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  OUTLINED_FUNCTION_17_2(v7, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_3_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t SCInformationalStartScreenRecordingFlow.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t SCInformationalStartScreenRecordingFlow.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22920EFD4()
{
  return SCInformationalStartScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_22920EFF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCInformationalStartScreenRecordingFlow.execute()(a1);
}

uint64_t sub_22920F048()
{
  type metadata accessor for SCInformationalStartScreenRecordingFlow();
  return sub_229226F18();
}

uint64_t sub_22920F06C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_22920E71C(v2);
}

uint64_t sub_22920F0B4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_22920E6CC(v2);
}

uint64_t type metadata accessor for SCInformationalStartScreenRecordingFlow()
{
  return objc_opt_self();
}

unint64_t sub_22920F11C()
{
  unint64_t result;
  uint64_t started;

  result = qword_255A3C120;
  if (!qword_255A3C120)
  {
    started = type metadata accessor for SCInformationalStartScreenRecordingFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCInformationalStartScreenRecordingFlow, started);
    atomic_store(result, (unint64_t *)&qword_255A3C120);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SCInformationalStartScreenRecordingFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22920F1A4 + 4 * byte_2292283D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22920F1D8 + 4 * asc_2292283D0[v4]))();
}

uint64_t sub_22920F1D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22920F1E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22920F1E8);
  return result;
}

uint64_t sub_22920F1F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22920F1FCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22920F200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22920F208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCInformationalStartScreenRecordingFlow.State()
{
  return &type metadata for SCInformationalStartScreenRecordingFlow.State;
}

unint64_t sub_22920F228()
{
  unint64_t result;

  result = qword_255A3C4B0;
  if (!qword_255A3C4B0)
  {
    result = MEMORY[0x22E2C5CD8](&unk_2292284E0, &type metadata for SCInformationalStartScreenRecordingFlow.State);
    atomic_store(result, (unint64_t *)&qword_255A3C4B0);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_22920F270(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_229227518();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);

}

void sub_22920F2C0(uint64_t a1, void *a2)
{
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9A8);
  v3 = (id)sub_22922759C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);

}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_6_3(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_8_3(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_2292271E8();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_12_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_229226E58();
}

uint64_t OUTLINED_FUNCTION_15_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_2292275C0();
}

uint64_t OUTLINED_FUNCTION_17_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_229208758(v2, a2);
}

uint64_t OUTLINED_FUNCTION_19_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_24_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

id sub_22920F414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  OUTLINED_FUNCTION_3_4(a1, a2, v15, (SEL *)&selRef_setLabel_);
  OUTLINED_FUNCTION_3_4(a3, a4, v16, (SEL *)&selRef_setType_);
  OUTLINED_FUNCTION_3_4(a5, a6, v17, (SEL *)&selRef_setIconType_);
  sub_22920F2C0(a7, v14);

  return v14;
}

id sub_22920F4D0(void *a1, void *a2)
{
  void *v2;
  id v5;
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

  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v6 = sub_22920F66C(a2);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9A8);
    OUTLINED_FUNCTION_2_3();
    v6 = OUTLINED_FUNCTION_1_2();
  }
  else
  {
    v2 = 0;
  }
  OUTLINED_FUNCTION_0_4(v6, sel_setConfirmCommands_);

  v7 = sub_22920F66C(a1);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9A8);
    OUTLINED_FUNCTION_2_3();
    v7 = OUTLINED_FUNCTION_1_2();
  }
  else
  {
    v2 = 0;
  }
  OUTLINED_FUNCTION_0_4(v7, sel_setDenyCommands_);

  v8 = sub_22920F6CC(a2);
  if (v9)
  {
    sub_229227518();
    v8 = OUTLINED_FUNCTION_1_2();
  }
  else
  {
    v2 = 0;
  }
  OUTLINED_FUNCTION_0_4(v8, sel_setConfirmText_);

  v10 = sub_22920F6CC(a1);
  if (v11)
  {
    sub_229227518();
    v10 = OUTLINED_FUNCTION_1_2();
  }
  else
  {
    v2 = 0;
  }
  OUTLINED_FUNCTION_0_4(v10, sel_setDenyText_);

  v12 = sub_229227524();
  sub_22920F72C(v12, v13, v5, (SEL *)&selRef_setCancelTrigger_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C4E0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_229228510;
  *(_QWORD *)(v14 + 32) = a1;
  *(_QWORD *)(v14 + 40) = a2;
  v16 = v14;
  sub_2292275C0();
  sub_22920F784(v16, v5);

  return v5;
}

uint64_t sub_22920F66C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_commands);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9A8);
  v3 = sub_2292275A8();

  return v3;
}

uint64_t sub_22920F6CC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_label);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_229227524();

  return v3;
}

void sub_22920F72C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_229227518();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);

}

void sub_22920F784(uint64_t a1, void *a2)
{
  id v3;

  sub_22920F7E4();
  v3 = (id)sub_22922759C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setAllConfirmationOptions_, v3);

}

unint64_t sub_22920F7E4()
{
  unint64_t result;

  result = qword_255A3B9B0;
  if (!qword_255A3B9B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A3B9B0);
  }
  return result;
}

id OUTLINED_FUNCTION_0_4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_22922759C();
}

void OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  sub_22920F72C(a1, a2, v4, a4);
}

uint64_t type metadata accessor for SystemControlCATs()
{
  uint64_t result;

  result = qword_255A3C4E8;
  if (!qword_255A3C4E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22920F884()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22920F8C0()
{
  return type metadata accessor for SystemControlCATs();
}

uint64_t sub_22920F8C8@<X0>(uint64_t a1@<X8>)
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
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = a1;
  v2 = sub_2292274DC();
  v38 = *(_QWORD *)(v2 - 8);
  v39 = v2;
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_3(v3, v36);
  __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8]();
  v40 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22922720C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  v9 = v8 - v7;
  v10 = sub_2292271DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  v14 = v13 - v12;
  v15 = sub_2292271AC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  v19 = v18 - v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v18 - v17, v1, v15);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v19, v15) == *MEMORY[0x24BE98E98])
  {
    OUTLINED_FUNCTION_8_4(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 96));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v14, v19, v10);
    sub_2292271D0();
    v20 = sub_229227200();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    v21 = v40;
    sub_229213090(v20, v40);
    swift_bridgeObjectRelease();
    v22 = OUTLINED_FUNCTION_10_2();
    if (__swift_getEnumTagSinglePayload(v21, 1, v22) == 1)
    {
      v36 = v14;
      sub_229210064(v21);
      v23 = v41;
      if (qword_255A3B748 != -1)
        swift_once();
      v24 = v39;
      v25 = __swift_project_value_buffer(v39, (uint64_t)qword_255A3E6C8);
      v27 = v37;
      v26 = v38;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v25, v24);
      v28 = sub_2292274D0();
      v29 = sub_229227644();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)OUTLINED_FUNCTION_2_4();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_229202000, v28, v29, "Parse-Extension#firstUserDialogAct No user dialog act found in userParse.", v30, 2u);
        OUTLINED_FUNCTION_2();
      }

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v24);
      OUTLINED_FUNCTION_11_2(v36, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
      v31 = v23;
      v32 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_11_2(v14, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
      v35 = v41;
      OUTLINED_FUNCTION_12_2(v41, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32));
      v31 = v35;
      v32 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v31, v32, 1, v22);
  }
  else
  {
    v33 = OUTLINED_FUNCTION_10_2();
    __swift_storeEnumTagSinglePayload(v41, 1, 1, v33);
    return OUTLINED_FUNCTION_8_4(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  }
}

uint64_t sub_22920FBF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  unint64_t v26;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = sub_2292274DC();
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  OUTLINED_FUNCTION_37();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = ((char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - v6;
  __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_36();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_10_2();
  v38 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_37();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_3(v14, v36);
  v15 = sub_2292271AC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_36();
  v19 = v18 - v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v18 - v17, v0, v15);
  v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v19, v15) == *MEMORY[0x24BE98E98])
  {
    sub_22920F8C8(v11);
    if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
    {
      sub_229210064(v11);
      if (qword_255A3B748 != -1)
        swift_once();
      v21 = v40;
      v22 = __swift_project_value_buffer(v40, (uint64_t)qword_255A3E6C8);
      v23 = v39;
      OUTLINED_FUNCTION_12_2((uint64_t)v4, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16));
      sub_2292274D0();
      v24 = OUTLINED_FUNCTION_9_4();
      if (os_log_type_enabled(v4, v24))
      {
        v25 = (uint8_t *)OUTLINED_FUNCTION_2_4();
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_229202000, v4, v24, "Parse-Extension#firstUsoTask No user dialog act found in userParse.", v25, 2u);
        OUTLINED_FUNCTION_2();
      }

      (*(void (**)(NSObject *, uint64_t))(v23 + 8))(v4, v21);
LABEL_9:
      v20 = 0;
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v37, v11, v12);
    v26 = sub_2292272C0();
    v28 = v26;
    v30 = v39;
    v29 = v40;
    if (v26 >> 62)
    {
      swift_bridgeObjectRetain();
      v31 = sub_229227704();
      OUTLINED_FUNCTION_46();
      if (v31)
        goto LABEL_13;
    }
    else if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_13:
      if ((v28 & 0xC000000000000001) != 0)
      {
        v20 = MEMORY[0x22E2C58E8](0, v28);
        goto LABEL_16;
      }
      if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v20 = *(_QWORD *)(v28 + 32);
        swift_retain();
LABEL_16:
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_11_2(v37, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));
        goto LABEL_10;
      }
      __break(1u);
      goto LABEL_24;
    }
    OUTLINED_FUNCTION_46();
    if (qword_255A3B748 == -1)
    {
LABEL_19:
      v32 = __swift_project_value_buffer(v29, (uint64_t)qword_255A3E6C8);
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v7, v32, v29);
      sub_2292274D0();
      v33 = OUTLINED_FUNCTION_9_4();
      if (OUTLINED_FUNCTION_12_1(v33))
      {
        *(_WORD *)OUTLINED_FUNCTION_2_4() = 0;
        OUTLINED_FUNCTION_3_5(&dword_229202000, v34, v35, "Parse-Extension#firstUsoTask No tasks found in input");
        OUTLINED_FUNCTION_2();
      }

      (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v29);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v12);
      goto LABEL_9;
    }
LABEL_24:
    swift_once();
    goto LABEL_19;
  }
LABEL_10:
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
  return v20;
}

uint64_t sub_229210064(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_4_3(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_8_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return sub_229227644();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_229227278();
}

uint64_t OUTLINED_FUNCTION_11_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t *sub_22921010C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_229227278();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_2292101E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_229227278();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

char *sub_229210248(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_229227278();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  return a1;
}

char *sub_2292102F8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_229227278();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_229210404(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_229227278();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2292104B0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_229227278();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  return a1;
}

uint64_t sub_2292105B4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2292105C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_78_0();
}

uint64_t sub_229210640()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22921064C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_255A3C538);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return OUTLINED_FUNCTION_40_0(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for SystemCommandsIntent()
{
  uint64_t result;

  result = qword_255A3C598;
  if (!qword_255A3C598)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2292106F4()
{
  unint64_t v0;

  sub_229210764();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_229210764()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A3C5A8[0])
  {
    sub_229227278();
    v0 = sub_22922765C();
    if (!v1)
      atomic_store(v0, qword_255A3C5A8);
  }
}

uint64_t sub_2292107B8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t result;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_16_1();
  v47 = v1;
  v48 = v2;
  v4 = v3;
  v44 = v5;
  v6 = sub_2292271AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v36 - v9;
  v11 = OUTLINED_FUNCTION_98();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_5_2();
  v43 = v13 - v14;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v36 - v16;
  if (qword_255A3B748 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v11, (uint64_t)qword_255A3E6C8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v40 = v18;
  v41 = v19;
  OUTLINED_FUNCTION_7_3((uint64_t)v17, v18, v19);
  v42 = v12;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v20(v10, v4, v6);
  v21 = sub_2292274D0();
  v22 = sub_229227620();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = OUTLINED_FUNCTION_16();
    v39 = v4;
    v24 = (uint8_t *)v23;
    v37 = OUTLINED_FUNCTION_16();
    v46 = v37;
    v38 = v11;
    *(_DWORD *)v24 = 136315138;
    v36[1] = v24 + 4;
    v20(v0, (uint64_t)v10, v6);
    v25 = sub_229227530();
    v45 = sub_229209A10(v25, v26, &v46);
    sub_229227680();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_54_0();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v21, v22, "SystemCommandsIntent init | parse: %s", v24);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_54_0();

  v27 = *(void (**)(char *, uint64_t))(v42 + 8);
  v27(v17, v11);
  v28 = v11;
  sub_22920F8C8(v44);
  v29 = sub_22920FBF4();
  v30 = v43;
  if (v29)
  {
    v31 = v29;
    OUTLINED_FUNCTION_77_0();
  }
  else
  {
    v41(v43, v40, v11);
    v32 = sub_2292274D0();
    v33 = sub_22922762C();
    if (OUTLINED_FUNCTION_10(v33))
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v34 = 0;
      OUTLINED_FUNCTION_14_3(&dword_229202000, v32, (os_log_type_t)v30, "No tasks found in usoTasks input, might be a confirmation response.", v34);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_77_0();
    v27((char *)v30, v28);
    v31 = 0;
  }
  result = OUTLINED_FUNCTION_18_1();
  *(_QWORD *)(v44 + *(int *)(result + 20)) = v31;
  return result;
}

void sub_229210AD4()
{
  sub_229211414();
}

void sub_229210AE8()
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_16_1();
  v2 = sub_2292273B0();
  v3 = OUTLINED_FUNCTION_55_0(v2);
  MEMORY[0x24BDAC7A8](v3);
  v27 = (uint64_t)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5F0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5F8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_4();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - v14;
  OUTLINED_FUNCTION_18_1();
  v16 = OUTLINED_FUNCTION_63_0();
  if (v30)
  {
    sub_2292273EC();
    if (OUTLINED_FUNCTION_3_6())
      goto LABEL_12;
  }
  else
  {
    OUTLINED_FUNCTION_30_0(v16, &qword_255A3C5E0);
  }
  OUTLINED_FUNCTION_63_0();
  if (!v30)
  {
    v19 = &qword_255A3C5E0;
    v20 = &v29;
    goto LABEL_23;
  }
  sub_229227380();
  if ((OUTLINED_FUNCTION_3_6() & 1) != 0)
  {
    swift_retain();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_44_0();
    v17 = v29;
    OUTLINED_FUNCTION_22_1();
    if (!v17)
    {
LABEL_12:
      swift_release();
      goto LABEL_24;
    }
    swift_retain();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_44_0();
    if (v29 && (v18 = sub_22922732C(), OUTLINED_FUNCTION_56_0(), v18))
    {
      sub_2292273A4();
      OUTLINED_FUNCTION_22_1();
    }
    else
    {
      OUTLINED_FUNCTION_9_5((uint64_t)v15);
    }
    v21 = v28;
    OUTLINED_FUNCTION_7_3((uint64_t)v13, *MEMORY[0x24BEA1800], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 104));
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v0);
    v22 = (uint64_t)&v8[*(int *)(v5 + 48)];
    sub_2292134F8((uint64_t)v15, (uint64_t)v8);
    sub_2292134F8((uint64_t)v13, v22);
    OUTLINED_FUNCTION_6_4((uint64_t)v8);
    if (v23)
    {
      OUTLINED_FUNCTION_44_0();
      sub_229208758((uint64_t)v13, &qword_255A3C5F8);
      sub_229208758((uint64_t)v15, &qword_255A3C5F8);
      OUTLINED_FUNCTION_6_4(v22);
      if (v23)
      {
        sub_229208758((uint64_t)v8, &qword_255A3C5F8);
        goto LABEL_24;
      }
    }
    else
    {
      sub_2292134F8((uint64_t)v8, v1);
      OUTLINED_FUNCTION_6_4(v22);
      if (!v23)
      {
        v24 = v27;
        OUTLINED_FUNCTION_7_3(v27, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 32));
        sub_22920C708(&qword_255A3C600, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1808], MEMORY[0x24BEA1818]);
        sub_22922750C();
        OUTLINED_FUNCTION_44_0();
        v25 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
        v25(v24, v0);
        OUTLINED_FUNCTION_76_0((uint64_t)v13);
        OUTLINED_FUNCTION_76_0((uint64_t)v15);
        v25(v1, v0);
        OUTLINED_FUNCTION_76_0((uint64_t)v8);
        goto LABEL_24;
      }
      OUTLINED_FUNCTION_44_0();
      sub_229208758((uint64_t)v13, &qword_255A3C5F8);
      sub_229208758((uint64_t)v15, &qword_255A3C5F8);
      OUTLINED_FUNCTION_50_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
    }
    v19 = &qword_255A3C5F0;
    v20 = (uint64_t *)v8;
LABEL_23:
    sub_229208758((uint64_t)v20, v19);
  }
LABEL_24:
  OUTLINED_FUNCTION_4_2();
}

void sub_229210E50(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0xD000000000000013;
  if (v2)
    v4 = 0x80000002292290F0;
  else
    v4 = 0x8000000229229110;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0xD000000000000013;
  if ((a2 & 1) != 0)
    v6 = 0x8000000229229110;
  else
    v6 = 0x80000002292290F0;
  if (v3 != v5 || v4 != v6)
    OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_78_0();
}

uint64_t sub_229210ED8()
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_2292273E0();
  sub_22920C708(&qword_255A3C5E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA2180], MEMORY[0x24BEA2190]);
  sub_229227590();
  sub_229227590();
  if (v5 == v3 && v6 == v4)
    v1 = 1;
  else
    v1 = sub_229227734();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void sub_229210FA0()
{
  sub_229210FB8();
}

void sub_229210FAC()
{
  sub_229210FB8();
}

void sub_229210FB8()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int *v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unsigned int *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  unsigned int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_16_1();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5D8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - v6;
  v8 = sub_2292273E0();
  v9 = OUTLINED_FUNCTION_55_0(v8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_47_0();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  OUTLINED_FUNCTION_18_1();
  v16 = OUTLINED_FUNCTION_25_0();
  if (!v31)
  {
    OUTLINED_FUNCTION_30_0(v16, &qword_255A3C5E0);
    goto LABEL_11;
  }
  sub_2292272CC();
  if ((OUTLINED_FUNCTION_3_6() & 1) == 0)
    goto LABEL_11;
  v27 = v0;
  v28 = v3;
  swift_retain();
  sub_229227374();
  OUTLINED_FUNCTION_56_0();
  if (!v30 || (v17 = sub_22922738C(), OUTLINED_FUNCTION_22_1(), !v17))
  {
    OUTLINED_FUNCTION_9_5((uint64_t)v7);
    goto LABEL_10;
  }
  sub_2292273A4();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_6_4((uint64_t)v7);
  if (v18)
  {
LABEL_10:
    OUTLINED_FUNCTION_56_0();
    sub_229208758((uint64_t)v7, &qword_255A3C5D8);
    v0 = v27;
    v3 = v28;
    goto LABEL_11;
  }
  v19 = v29;
  OUTLINED_FUNCTION_7_3((uint64_t)v15, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32));
  v20 = v28;
  OUTLINED_FUNCTION_7_3((uint64_t)v13, *v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 104));
  v21 = sub_229210ED8();
  v3 = v20;
  swift_release();
  OUTLINED_FUNCTION_20_1((uint64_t)v13);
  OUTLINED_FUNCTION_20_1((uint64_t)v15);
  v0 = v27;
  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_11:
  OUTLINED_FUNCTION_25_0();
  if (!v31)
  {
    v25 = &qword_255A3C5E0;
    v26 = &v30;
LABEL_21:
    sub_229208758((uint64_t)v26, v25);
    goto LABEL_22;
  }
  sub_22922741C();
  if ((OUTLINED_FUNCTION_3_6() & 1) != 0)
  {
    v22 = v0;
    OUTLINED_FUNCTION_80_0();
    sub_229227374();
    OUTLINED_FUNCTION_29_0();
    if (v30 && (v23 = sub_22922738C(), OUTLINED_FUNCTION_4_4(), v23))
    {
      sub_2292273A4();
      OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_6_4(v1);
      if (!v18)
      {
        v24 = v29;
        OUTLINED_FUNCTION_7_3(v22, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32));
        OUTLINED_FUNCTION_7_3((uint64_t)v13, *v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 104));
        sub_229210ED8();
        OUTLINED_FUNCTION_29_0();
        OUTLINED_FUNCTION_20_1((uint64_t)v13);
        OUTLINED_FUNCTION_20_1(v22);
        goto LABEL_22;
      }
    }
    else
    {
      OUTLINED_FUNCTION_9_5(v1);
    }
    OUTLINED_FUNCTION_29_0();
    v25 = &qword_255A3C5D8;
    v26 = (uint64_t *)v1;
    goto LABEL_21;
  }
LABEL_22:
  OUTLINED_FUNCTION_4_2();
}

void sub_22921129C()
{
  sub_229210FB8();
}

void sub_2292112A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5D8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_85_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_32_0();
  if (!v12[3])
  {
    v10 = &qword_255A3C5E0;
    v11 = v12;
    goto LABEL_10;
  }
  sub_2292272CC();
  if ((OUTLINED_FUNCTION_10_3() & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    OUTLINED_FUNCTION_59_0();
    OUTLINED_FUNCTION_17_3();
    if (v12[0] && (v7 = OUTLINED_FUNCTION_68_0(), OUTLINED_FUNCTION_29_0(), v7))
    {
      OUTLINED_FUNCTION_58_0();
      OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_6_4(v0);
      if (!v8)
      {
        v9 = OUTLINED_FUNCTION_7_3(v2, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
        OUTLINED_FUNCTION_34_0(v9, *MEMORY[0x24BEA2160]);
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_17_3();
        OUTLINED_FUNCTION_20_1(v1);
        OUTLINED_FUNCTION_20_1(v2);
        goto LABEL_11;
      }
    }
    else
    {
      OUTLINED_FUNCTION_9_5(v0);
    }
    OUTLINED_FUNCTION_17_3();
    v10 = &qword_255A3C5D8;
    v11 = (_QWORD *)v0;
LABEL_10:
    sub_229208758((uint64_t)v11, v10);
  }
LABEL_11:
  OUTLINED_FUNCTION_23_0();
}

void sub_229211400()
{
  sub_229211414();
}

void sub_229211414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(_QWORD);
  void (*v4)(_QWORD);
  void (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD);
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_16_1();
  v23 = v3;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5D8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v6);
  v7 = OUTLINED_FUNCTION_13_0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12_3();
  v10 = OUTLINED_FUNCTION_25_0();
  if (!v25)
  {
    OUTLINED_FUNCTION_30_0(v10, &qword_255A3C5E0);
    goto LABEL_12;
  }
  v5(0);
  if ((OUTLINED_FUNCTION_3_6() & 1) == 0)
    goto LABEL_12;
  v22 = v8;
  OUTLINED_FUNCTION_81_0();
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_19_2();
  if (!v24)
  {
    OUTLINED_FUNCTION_19_2();
    goto LABEL_12;
  }
  v21 = v1;
  v11 = sub_22922735C();
  v13 = v12;
  OUTLINED_FUNCTION_56_0();
  if (!v13)
  {
    OUTLINED_FUNCTION_19_2();
    v1 = v21;
    v8 = v22;
    goto LABEL_12;
  }
  if (v11 != 0xD000000000000010 || v13 != 0x8000000229229B10)
  {
    v14 = sub_229227734();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_19_2();
    v1 = v21;
    v8 = v22;
    if ((v14 & 1) != 0)
      goto LABEL_23;
LABEL_12:
    OUTLINED_FUNCTION_25_0();
    if (v25)
    {
      v23(0);
      if ((OUTLINED_FUNCTION_3_6() & 1) == 0)
        goto LABEL_23;
      v15 = v8;
      swift_retain();
      OUTLINED_FUNCTION_59_0();
      OUTLINED_FUNCTION_17_3();
      if (v24 && (v16 = OUTLINED_FUNCTION_68_0(), OUTLINED_FUNCTION_29_0(), v16))
      {
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_22_1();
        OUTLINED_FUNCTION_6_4(v0);
        if (!v17)
        {
          v18 = OUTLINED_FUNCTION_7_3(v2, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
          OUTLINED_FUNCTION_34_0(v18, *MEMORY[0x24BEA2160]);
          OUTLINED_FUNCTION_45_0();
          OUTLINED_FUNCTION_17_3();
          OUTLINED_FUNCTION_20_1(v1);
          OUTLINED_FUNCTION_20_1(v2);
          goto LABEL_23;
        }
      }
      else
      {
        OUTLINED_FUNCTION_9_5(v0);
      }
      OUTLINED_FUNCTION_17_3();
      v19 = &qword_255A3C5D8;
      v20 = (uint64_t *)v0;
    }
    else
    {
      v19 = &qword_255A3C5E0;
      v20 = &v24;
    }
    sub_229208758((uint64_t)v20, v19);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_19_2();
LABEL_23:
  OUTLINED_FUNCTION_4_2();
}

void sub_229211684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v46;
  uint8_t *v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  os_log_type_t v70;
  uint8_t *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  OUTLINED_FUNCTION_16_1();
  v3 = v0;
  v4 = OUTLINED_FUNCTION_98();
  v91 = *(_QWORD *)(v4 - 8);
  v92 = v4;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_47_0();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = ((char *)&v86 - v7);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v86 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v88 = (uint64_t)&v86 - v12;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v13);
  v89 = (char *)&v86 - v14;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v15);
  v87 = (char *)&v86 - v16;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v17);
  v90 = (char *)&v86 - v18;
  v19 = OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v86 - v23;
  v25 = OUTLINED_FUNCTION_25_0();
  if (v95)
  {
    sub_2292273BC();
    if ((OUTLINED_FUNCTION_3_6() & 1) != 0)
    {
      v8 = v93;
      OUTLINED_FUNCTION_52_0();
      v26 = sub_229227404();
      OUTLINED_FUNCTION_4_4();
      if (v26)
      {
        v27 = OUTLINED_FUNCTION_43_0();
        v28 = sub_229213540(v27);
        OUTLINED_FUNCTION_24_1();
        sub_22920C64C(v0, (uint64_t)v24);
        if ((v28 & 1) != 0)
        {
          sub_22920869C((uint64_t)v24);
          OUTLINED_FUNCTION_65_0();
LABEL_26:
          sub_22920869C(v1);
LABEL_27:
          if (qword_255A3B748 != -1)
            swift_once();
          v49 = (uint64_t)v92;
          v50 = __swift_project_value_buffer((uint64_t)v92, (uint64_t)qword_255A3E6C8);
          v51 = v90;
          v52 = v91;
          (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v90, v50, v49);
          OUTLINED_FUNCTION_43_0();
          OUTLINED_FUNCTION_89();
          v53 = OUTLINED_FUNCTION_40();
          if (OUTLINED_FUNCTION_31_0(v28))
          {
            v54 = (uint8_t *)OUTLINED_FUNCTION_16();
            v94 = OUTLINED_FUNCTION_16();
            *(_DWORD *)v54 = 136315138;
            v89 = (char *)(v54 + 4);
            OUTLINED_FUNCTION_43_0();
            v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C630);
            v56 = MEMORY[0x22E2C57EC](v26, v55);
            v58 = v57;
            OUTLINED_FUNCTION_24_1();
            v59 = sub_229209A10(v56, v58, &v94);
            OUTLINED_FUNCTION_69_0(v59);
            sub_229227680();
            OUTLINED_FUNCTION_20();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_15_0(&dword_229202000, v28, v53, "SystemCommandsIntent isShutDown | contains userEntities from other domain: %s", v54);
            OUTLINED_FUNCTION_99();
            OUTLINED_FUNCTION_2();
          }

          OUTLINED_FUNCTION_4_4();
          OUTLINED_FUNCTION_20();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v49);
          goto LABEL_32;
        }
        v48 = OUTLINED_FUNCTION_43_0();
        v28 = sub_229214164(v48);
        OUTLINED_FUNCTION_24_1();
        sub_22920869C((uint64_t)v24);
        OUTLINED_FUNCTION_65_0();
        if ((v28 & 1) != 0)
          goto LABEL_26;
        v60 = OUTLINED_FUNCTION_43_0();
        v28 = sub_229214D88(v60);
        OUTLINED_FUNCTION_24_1();
        sub_22920869C(v1);
        if ((v28 & 1) != 0)
          goto LABEL_27;
        OUTLINED_FUNCTION_24_1();
      }
      OUTLINED_FUNCTION_52_0();
      sub_2292273F8();
      OUTLINED_FUNCTION_4_4();
      v61 = v94;
      swift_release();
      if (!v61)
      {
        if (qword_255A3B748 != -1)
          swift_once();
        v72 = v92;
        v73 = __swift_project_value_buffer((uint64_t)v92, (uint64_t)qword_255A3E6C8);
        v74 = v88;
        OUTLINED_FUNCTION_7_3(v88, v73, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 16));
        OUTLINED_FUNCTION_89();
        v75 = OUTLINED_FUNCTION_40();
        if (OUTLINED_FUNCTION_10(v75))
        {
          v76 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v76 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v72, (os_log_type_t)v8, "SystemCommandsIntent isShutDown | no references found", v76);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_4_4();
        (*(void (**)(uint64_t, NSObject *))(v91 + 8))(v74, v92);
        goto LABEL_32;
      }
      OUTLINED_FUNCTION_52_0();
      v19 = sub_229227404();
      OUTLINED_FUNCTION_4_4();
      if (v19)
      {
        if (v19 >> 62)
        {
          OUTLINED_FUNCTION_120();
          v62 = sub_229227704();
          if (v62)
          {
LABEL_40:
            v63 = 4;
            while (1)
            {
              v0 = v63 - 4;
              if ((v19 & 0xC000000000000001) != 0)
              {
                v30 = MEMORY[0x22E2C58E8](v63 - 4, v19);
              }
              else
              {
                v30 = *(_QWORD *)(v19 + 8 * v63);
                OUTLINED_FUNCTION_80_0();
              }
              v2 = v63 - 3;
              if (__OFADD__(v0, 1))
              {
                __break(1u);
                goto LABEL_68;
              }
              sub_229227314();
              if (v94)
              {
                v24 = (char *)sub_229227320();
                OUTLINED_FUNCTION_22_1();
                OUTLINED_FUNCTION_17_3();
                if (v24)
                  break;
              }
              OUTLINED_FUNCTION_29_0();
              ++v63;
              if (v2 == v62)
                goto LABEL_48;
            }
            OUTLINED_FUNCTION_20();
            if (qword_255A3B748 != -1)
              swift_once();
            v77 = (uint64_t)v92;
            v78 = __swift_project_value_buffer((uint64_t)v92, (uint64_t)qword_255A3E6C8);
            v79 = v91;
            v80 = v87;
            (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v87, v78, v77);
            swift_retain_n();
            sub_2292274D0();
            v81 = OUTLINED_FUNCTION_40();
            if (OUTLINED_FUNCTION_31_0(v19))
            {
              v82 = (uint8_t *)OUTLINED_FUNCTION_16();
              v83 = OUTLINED_FUNCTION_16();
              v93 = v30;
              v94 = v83;
              *(_DWORD *)v82 = 136315138;
              OUTLINED_FUNCTION_80_0();
              __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C630);
              v84 = sub_229227530();
              v93 = OUTLINED_FUNCTION_67_0(v84, v85);
              sub_229227680();
              OUTLINED_FUNCTION_86_0();
              OUTLINED_FUNCTION_24_1();
              OUTLINED_FUNCTION_15_0(&dword_229202000, v19, v81, "SystemCommandsIntent isShutDown | rejecting parse containing %s", v82);
              OUTLINED_FUNCTION_99();
              OUTLINED_FUNCTION_2();
            }

            OUTLINED_FUNCTION_4_4();
            swift_release_n();
            (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v77);
            goto LABEL_32;
          }
        }
        else
        {
          v62 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
          OUTLINED_FUNCTION_120();
          if (v62)
            goto LABEL_40;
        }
LABEL_48:
        OUTLINED_FUNCTION_20();
      }
      v64 = v3;
      v65 = sub_2292158C0();
      v67 = v91;
      v66 = (uint64_t)v92;
      if (v65)
      {
        if (qword_255A3B748 != -1)
          swift_once();
        v68 = __swift_project_value_buffer(v66, (uint64_t)qword_255A3E6C8);
        v69 = v89;
        (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v89, v68, v66);
        OUTLINED_FUNCTION_53_0();
        v70 = OUTLINED_FUNCTION_40();
        if (OUTLINED_FUNCTION_10(v70))
        {
          v71 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v71 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v19, v64, "SystemCommandsIntent isShutDown | power reference found", v71);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_4_4();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v69, v66);
      }
      else
      {
        OUTLINED_FUNCTION_4_4();
      }
      goto LABEL_32;
    }
  }
  else
  {
    OUTLINED_FUNCTION_30_0(v25, &qword_255A3C5E0);
  }
  v29 = OUTLINED_FUNCTION_25_0();
  v30 = v91;
  v24 = (char *)v92;
  if (v95)
  {
    OUTLINED_FUNCTION_72_0();
    if ((OUTLINED_FUNCTION_3_6() & 1) != 0)
    {
      swift_retain();
      sub_2292273F8();
      OUTLINED_FUNCTION_39_0();
      if (v94
        && (v19 = sub_22921310C(0), OUTLINED_FUNCTION_22_1(), v19)
        && (sub_229215934(), v32 = v31, OUTLINED_FUNCTION_85(), (v32 & 1) != 0))
      {
        if (qword_255A3B748 != -1)
          swift_once();
        OUTLINED_FUNCTION_26_0((uint64_t)v24, (uint64_t)qword_255A3E6C8);
        OUTLINED_FUNCTION_70_0((uint64_t)v11, v33, v34);
        sub_2292274D0();
        v35 = OUTLINED_FUNCTION_40();
        if (OUTLINED_FUNCTION_10(v35))
        {
          v36 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v36 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v19, (os_log_type_t)v11, "SystemCommandsIntent isShutDown | Found shutdown identifier", v36);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_39_0();
        (*(void (**)(char *, char *))(v30 + 8))(v11, v24);
      }
      else
      {
        if (qword_255A3B748 != -1)
          swift_once();
        OUTLINED_FUNCTION_26_0((uint64_t)v24, (uint64_t)qword_255A3E6C8);
        OUTLINED_FUNCTION_70_0((uint64_t)v8, v44, v45);
        sub_2292274D0();
        v46 = OUTLINED_FUNCTION_40();
        if (OUTLINED_FUNCTION_10(v46))
        {
          v47 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v47 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v19, (os_log_type_t)v8, "SystemCommandsIntent isShutDown | Did not find shutdown identifier", v47);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_39_0();
        (*(void (**)(NSObject *, char *))(v30 + 8))(v8, v24);
      }
      goto LABEL_32;
    }
  }
  else
  {
    OUTLINED_FUNCTION_30_0(v29, &qword_255A3C5E0);
  }
  if (qword_255A3B748 != -1)
LABEL_68:
    swift_once();
  OUTLINED_FUNCTION_26_0((uint64_t)v24, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_70_0(v0, v37, v38);
  sub_22920C64C(v3, v2);
  sub_2292274D0();
  v39 = OUTLINED_FUNCTION_74_0();
  if (os_log_type_enabled(v8, v39))
  {
    v40 = (uint8_t *)OUTLINED_FUNCTION_16();
    v41 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v40 = 136315138;
    v94 = v41;
    v93 = *(_QWORD *)(v2 + *(int *)(v19 + 20));
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C628);
    v42 = sub_229227530();
    v93 = OUTLINED_FUNCTION_67_0(v42, v43);
    sub_229227680();
    OUTLINED_FUNCTION_85();
    sub_22920869C(v2);
    OUTLINED_FUNCTION_15_0(&dword_229202000, v8, v39, "SystemCommandsIntent isShutDown | no flow found for task: %s", v40);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  sub_22920869C(v2);

  (*(void (**)(uint64_t, char *))(v30 + 8))(v0, v24);
LABEL_32:
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_229212188()
{
  return sub_2292121A0(MEMORY[0x24BEA1C70]);
}

uint64_t sub_229212194()
{
  return sub_2292121A0(MEMORY[0x24BEA30C8]);
}

uint64_t sub_2292121A0(void (*a1)(_QWORD))
{
  uint64_t result;
  _BYTE v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_18_1();
  sub_229227368();
  if (v4)
  {
    a1(0);
    result = OUTLINED_FUNCTION_10_3();
    if ((_DWORD)result)
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    sub_229208758((uint64_t)v3, &qword_255A3C5E0);
    return 0;
  }
  return result;
}

void sub_22921222C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5D8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_85_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_32_0();
  if (!v12[3])
  {
    v10 = &qword_255A3C5E0;
    v11 = v12;
    goto LABEL_10;
  }
  sub_22922741C();
  if ((OUTLINED_FUNCTION_10_3() & 1) != 0)
  {
    OUTLINED_FUNCTION_60_0();
    OUTLINED_FUNCTION_59_0();
    OUTLINED_FUNCTION_17_3();
    if (v12[0] && (v7 = OUTLINED_FUNCTION_68_0(), OUTLINED_FUNCTION_29_0(), v7))
    {
      OUTLINED_FUNCTION_58_0();
      OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_6_4(v0);
      if (!v8)
      {
        v9 = OUTLINED_FUNCTION_7_3(v2, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
        OUTLINED_FUNCTION_34_0(v9, *MEMORY[0x24BEA2158]);
        OUTLINED_FUNCTION_45_0();
        OUTLINED_FUNCTION_17_3();
        OUTLINED_FUNCTION_20_1(v1);
        OUTLINED_FUNCTION_20_1(v2);
        goto LABEL_11;
      }
    }
    else
    {
      OUTLINED_FUNCTION_9_5(v0);
    }
    OUTLINED_FUNCTION_17_3();
    v10 = &qword_255A3C5D8;
    v11 = (_QWORD *)v0;
LABEL_10:
    sub_229208758((uint64_t)v11, v10);
  }
LABEL_11:
  OUTLINED_FUNCTION_23_0();
}

void sub_229212384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v23;
  uint8_t *v24;
  NSObject *v25;
  _QWORD v26[4];

  v3 = OUTLINED_FUNCTION_98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5_2();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_32_0();
  if (v26[3])
  {
    OUTLINED_FUNCTION_72_0();
    if ((OUTLINED_FUNCTION_10_3() & 1) != 0)
    {
      OUTLINED_FUNCTION_52_0();
      v10 = v25;
      sub_2292273F8();
      OUTLINED_FUNCTION_4_4();
      if (v26[0]
        && (v10 = sub_22921310C(1u), OUTLINED_FUNCTION_17_3(), v10)
        && (sub_229215934(), v12 = v11, OUTLINED_FUNCTION_46(), (v12 & 1) != 0))
      {
        if (qword_255A3B748 != -1)
          swift_once();
        OUTLINED_FUNCTION_26_0(v3, (uint64_t)qword_255A3E6C8);
        OUTLINED_FUNCTION_7_3(v2, v13, v14);
        OUTLINED_FUNCTION_89();
        v15 = OUTLINED_FUNCTION_127();
        if (OUTLINED_FUNCTION_31_0(v10))
        {
          v16 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v16 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v10, v15, "SystemCommandsIntent isLock | found lock identifier", v16);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_4_4();
        v7 = v2;
      }
      else
      {
        if (qword_255A3B748 != -1)
          swift_once();
        OUTLINED_FUNCTION_26_0(v3, (uint64_t)qword_255A3E6C8);
        OUTLINED_FUNCTION_7_3(v1, v21, v22);
        OUTLINED_FUNCTION_53_0();
        v23 = OUTLINED_FUNCTION_127();
        if (os_log_type_enabled(v10, v23))
        {
          v24 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_WORD *)v24 = 0;
          OUTLINED_FUNCTION_14_3(&dword_229202000, v10, v23, "SystemCommandsIntent isLock | lock identifier not found", v24);
          OUTLINED_FUNCTION_2();
        }

        OUTLINED_FUNCTION_4_4();
        v7 = v1;
      }
      goto LABEL_21;
    }
  }
  else
  {
    sub_229208758((uint64_t)v26, &qword_255A3C5E0);
  }
  if (qword_255A3B748 != -1)
    swift_once();
  OUTLINED_FUNCTION_26_0(v3, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_7_3(v7, v17, v18);
  sub_2292274D0();
  v19 = OUTLINED_FUNCTION_74_0();
  if (OUTLINED_FUNCTION_31_0(v0))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v20 = 0;
    OUTLINED_FUNCTION_14_3(&dword_229202000, v0, v19, "SystemCommandsIntent isLock | task is not UsoTask_enable_common_Setting", v20);
    OUTLINED_FUNCTION_2();
  }

LABEL_21:
  OUTLINED_FUNCTION_50_0(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_23_0();
}

void sub_2292126A0()
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
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  Class isa;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD v42[2];
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;

  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5_2();
  v5 = v3 - v4;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x24BDAC7A8](v7);
  v9 = ((char *)v42 - v8);
  v10 = OUTLINED_FUNCTION_71_0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_18_1();
  v14 = OUTLINED_FUNCTION_25_0();
  if (!v50)
  {
    v15 = OUTLINED_FUNCTION_30_0(v14, &qword_255A3C5E0);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_72_0();
  v15 = OUTLINED_FUNCTION_3_6();
  if ((v15 & 1) == 0)
  {
LABEL_14:
    if (qword_255A3B748 != -1)
      v15 = swift_once();
    OUTLINED_FUNCTION_21_0(v15, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_7_3(v5, v27, v28);
    sub_2292274D0();
    v29 = OUTLINED_FUNCTION_74_0();
    if (OUTLINED_FUNCTION_31_0(v9))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v30 = 0;
      OUTLINED_FUNCTION_14_3(&dword_229202000, v9, v29, "SystemCommandsIntent isUnlock | task is not UsoTask_enable_common_Setting", v30);
      OUTLINED_FUNCTION_2();
    }

    v31 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v32 = v5;
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_81_0();
  OUTLINED_FUNCTION_62_0();
  v16 = OUTLINED_FUNCTION_19_2();
  v17 = v49;
  if (!v49)
    goto LABEL_25;
  v17 = sub_229227338();
  v16 = swift_release();
  if (!v17)
    goto LABEL_25;
  v44 = v9;
  v45 = v0;
  v46 = v5;
  isa = v17[2].isa;
  if (isa)
  {
    v43 = v1;
    v19 = (char *)v17 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v20 = *(_QWORD *)(v11 + 72);
    v47 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v48 = v20;
    v42[1] = v17;
    swift_bridgeObjectRetain();
    v21 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v47(v13, v19, v10);
      v22 = sub_2292272F0();
      v9 = v23;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v21 = OUTLINED_FUNCTION_83_0(0, *((_QWORD *)v21 + 2) + 1);
      v25 = *((_QWORD *)v21 + 2);
      v24 = *((_QWORD *)v21 + 3);
      if (v25 >= v24 >> 1)
        v21 = OUTLINED_FUNCTION_83_0((char *)(v24 > 1), v25 + 1);
      *((_QWORD *)v21 + 2) = v25 + 1;
      v26 = &v21[16 * v25];
      *((_QWORD *)v26 + 4) = v22;
      *((_QWORD *)v26 + 5) = v9;
      v19 += v48;
      isa = (Class)((char *)isa - 1);
    }
    while (isa);
    OUTLINED_FUNCTION_46();
    v1 = v43;
  }
  else
  {
    v21 = (char *)MEMORY[0x24BEE4AF8];
  }
  OUTLINED_FUNCTION_46();
  v17 = sub_229215B20(0x6B636F6C6E75, 0xE600000000000000, v21);
  v16 = OUTLINED_FUNCTION_24_1();
  v0 = v45;
  v33 = (uint64_t)v44;
  if ((v17 & 1) == 0)
  {
LABEL_25:
    if (qword_255A3B748 != -1)
      v16 = swift_once();
    OUTLINED_FUNCTION_21_0(v16, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_7_3(v0, v38, v39);
    OUTLINED_FUNCTION_53_0();
    v40 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_12_1(v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v41 = 0;
      OUTLINED_FUNCTION_14_3(&dword_229202000, v17, (os_log_type_t)v9, "SystemCommandsIntent isUnlock | unlock identifier not found", v41);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_19_2();
    v31 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v32 = v0;
LABEL_30:
    OUTLINED_FUNCTION_50_0(v32, v31);
    goto LABEL_31;
  }
  if (qword_255A3B748 != -1)
    v16 = swift_once();
  OUTLINED_FUNCTION_21_0(v16, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_7_3(v33, v34, v35);
  OUTLINED_FUNCTION_89();
  v36 = OUTLINED_FUNCTION_127();
  if (OUTLINED_FUNCTION_12_1(v36))
  {
    v37 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v37 = 0;
    OUTLINED_FUNCTION_14_3(&dword_229202000, v17, (os_log_type_t)v9, "SystemCommandsIntent isUnlock | does not have required userEntity", v37);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_50_0(v33, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
LABEL_31:
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_229212AE0()
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
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v34;
  uint8_t *v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v45;
  uint64_t v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t);
  char *v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  OUTLINED_FUNCTION_16_1();
  v62 = v3;
  v63 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C608);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_84_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_2();
  v11 = (v9 - v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v52 - v14;
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_5();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v52 - v17;
  OUTLINED_FUNCTION_18_1();
  v19 = OUTLINED_FUNCTION_25_0();
  if (!v61)
  {
    v20 = OUTLINED_FUNCTION_30_0(v19, &qword_255A3C5E0);
    goto LABEL_8;
  }
  sub_2292273C8();
  v20 = OUTLINED_FUNCTION_10_3();
  if ((v20 & 1) == 0)
  {
LABEL_8:
    if (qword_255A3B748 != -1)
      v20 = swift_once();
    OUTLINED_FUNCTION_21_0(v20, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_7_3((uint64_t)v11, v32, v33);
    sub_2292274D0();
    v34 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_31_0(v11))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v35 = 0;
      OUTLINED_FUNCTION_14_3(&dword_229202000, v11, v34, "SystemCommandsIntent isQueryFor | task is not UsoTask_summarise_common_Setting", v35);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_50_0((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    return 0;
  }
  v57 = v7;
  v21 = v58;
  if (qword_255A3B748 != -1)
    v20 = swift_once();
  OUTLINED_FUNCTION_21_0(v20, (uint64_t)qword_255A3E6C8);
  v55 = v22;
  v56 = v23;
  OUTLINED_FUNCTION_7_3((uint64_t)v18, v22, v23);
  swift_retain_n();
  v24 = sub_2292274D0();
  v25 = sub_229227620();
  v26 = os_log_type_enabled(v24, v25);
  v54 = v1;
  if (v26)
  {
    v27 = (uint64_t)v21;
    v28 = (uint8_t *)OUTLINED_FUNCTION_16();
    v53 = OUTLINED_FUNCTION_16();
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v27;
    v59 = v53;
    *(_DWORD *)v28 = 136315138;
    v52[1] = v28 + 4;
    swift_retain();
    v29 = sub_229227530();
    v31 = OUTLINED_FUNCTION_67_0(v29, v30);
    OUTLINED_FUNCTION_69_0(v31);
    sub_229227680();
    OUTLINED_FUNCTION_86_0();
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v24, v25, "SystemCommandsIntent isQueryFor | parse: %s", v28);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_86_0();
  v36 = *(char **)(v2 + 8);
  OUTLINED_FUNCTION_75_0((uint64_t)v18);
  v37 = (uint64_t)v57;
  OUTLINED_FUNCTION_52_0();
  v38 = v21;
  sub_229227374();
  OUTLINED_FUNCTION_4_4();
  if (!v59 || (v38 = sub_22921310C(0), OUTLINED_FUNCTION_39_0(), !v38))
  {
    OUTLINED_FUNCTION_7_3((uint64_t)v15, v55, v56);
    OUTLINED_FUNCTION_89();
    v42 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_31_0(v38))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v43 = 0;
      OUTLINED_FUNCTION_14_3(&dword_229202000, v38, v42, "SystemCommandsIntent isQueryFor | systemCategory identifier not found", v43);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_75_0((uint64_t)v15);
    return 0;
  }
  sub_22921309C((uint64_t)v38, (uint64_t (*)(_QWORD))MEMORY[0x24BE9F9A0], v37);
  OUTLINED_FUNCTION_46();
  v39 = OUTLINED_FUNCTION_71_0();
  if (__swift_getEnumTagSinglePayload(v37, 1, v39) == 1)
  {
    sub_229208758(v37, &qword_255A3C608);
    v40 = 0;
    v41 = 0;
  }
  else
  {
    v38 = v37;
    v40 = sub_2292272F0();
    v41 = v45;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 8))(v37, v39);
  }
  v46 = v54;
  v56(v54, v55, v0);
  swift_bridgeObjectRetain_n();
  OUTLINED_FUNCTION_53_0();
  v47 = OUTLINED_FUNCTION_127();
  if (os_log_type_enabled(v38, v47))
  {
    v48 = (uint8_t *)OUTLINED_FUNCTION_16();
    v49 = OUTLINED_FUNCTION_16();
    v57 = v36;
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
    v56 = v21;
    *(_DWORD *)v48 = 136315138;
    v59 = v40;
    v60 = v41;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C610);
    v50 = sub_229227530();
    v59 = sub_229209A10(v50, v51, (uint64_t *)&v58);
    sub_229227680();
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v38, v47, "SystemCommandsIntent isQueryFor | found systemCategory identifier: %s", v48);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_75_0(v46);
  return v40;
}

uint64_t sub_229213090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22921309C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828], a2);
}

uint64_t sub_22921309C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = a2(0);
  v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return OUTLINED_FUNCTION_40_0(a3, v8, 1, v7);
}

uint64_t sub_22921310C(unsigned __int8 a1)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = sub_229227308();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  v9 = sub_229227338();
  if (!v9)
    return 0;
  v10 = MEMORY[0x24BEE4AF8];
  v16 = *(_QWORD *)(v9 + 16);
  v17 = MEMORY[0x24BEE4AF8];
  if (v16)
  {
    v13 = a1;
    v14 = "7SystemControlCATs";
    v12 = v6;
    v15 = v9;
    if (*(_QWORD *)(v9 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
      sub_2292272FC();
      __asm { BR              X8 }
    }
    __break(1u);
    JUMPOUT(0x2292134C0);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2292134F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C5F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_229213540(int64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  int v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  int isUniquelyReferenced_nonNull_native;
  int64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(uint64_t, unint64_t, uint64_t);
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  void (*v80)(char *, uint64_t);
  char *v81;
  char *v82;
  unsigned __int8 v83;
  int v84;
  void (*v85)(char *, uint64_t);
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t result;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  int64_t v111;
  int64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint8_t *v122;
  uint64_t v123;
  uint64_t v124;

  v2 = sub_2292274DC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v109 = (char *)&v104 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v106 = (char *)&v104 - v9;
  v10 = sub_229227350();
  v117 = *(_QWORD *)(v10 - 8);
  v118 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v116 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v115 = (char *)&v104 - v13;
  v14 = sub_229227308();
  v122 = *(uint8_t **)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v114 = (char *)&v104 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v23 = (uint64_t)&v104 - v22;
  if (!a1)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v52 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v52, v2);
    v53 = sub_2292274D0();
    v54 = sub_22922762C();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_229202000, v53, v54, "SystemCommandsIntent isHomeAutomationParse | No UserEntities found", v55, 2u);
      MEMORY[0x22E2C5D5C](v55, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  v104 = v21;
  v105 = v20;
  v121 = v19;
  if ((unint64_t)a1 >> 62)
    goto LABEL_120;
  v24 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v119 = v23;
    v107 = v2;
    v108 = v3;
    if (v24)
      break;
    swift_bridgeObjectRelease();
    v26 = (char *)MEMORY[0x24BEE4AF8];
LABEL_67:
    v56 = *((_QWORD *)v26 + 2);
    if (!v56)
    {
      v58 = MEMORY[0x24BEE4AF8];
LABEL_90:
      swift_bridgeObjectRelease();
      v70 = *(_QWORD *)(v58 + 16);
      if (v70)
      {
        v71 = v121;
        v72 = v58 + ((v122[80] + 32) & ~(unint64_t)v122[80]);
        LODWORD(v120) = *MEMORY[0x24BEA0050];
        v73 = (void (*)(uint64_t, unint64_t, uint64_t))*((_QWORD *)v122 + 2);
        v74 = v119;
        v112 = *((_QWORD *)v122 + 9);
        v113 = (unint64_t)v73;
        v75 = v116;
        while (1)
        {
          v73(v74, v72, v71);
          v76 = v115;
          sub_2292272E4();
          v78 = v117;
          v77 = v118;
          (*(void (**)(char *, _QWORD, uint64_t))(v117 + 104))(v75, v120, v118);
          v79 = MEMORY[0x22E2C557C](v76, v75);
          v80 = *(void (**)(char *, uint64_t))(v78 + 8);
          v80(v75, v77);
          v81 = v76;
          v73 = (void (*)(uint64_t, unint64_t, uint64_t))v113;
          v80(v81, v77);
          v82 = v114;
          v73((uint64_t)v114, v74, v71);
          if ((v79 & 1) != 0)
            break;
          sub_2292272FC();
          sub_229215BE4();
          v84 = v83;
          v85 = (void (*)(char *, uint64_t))*((_QWORD *)v122 + 1);
          v85(v82, v71);
          if (v84 != 10)
            goto LABEL_105;
          v74 = v119;
          v85((char *)v119, v71);
          v72 += v112;
          if (!--v70)
          {
            swift_bridgeObjectRelease();
            v2 = v107;
            v3 = v108;
            goto LABEL_97;
          }
        }
        v85 = (void (*)(char *, uint64_t))*((_QWORD *)v122 + 1);
        v85(v82, v71);
LABEL_105:
        swift_bridgeObjectRelease();
        v92 = v106;
        v93 = v119;
        if (qword_255A3B748 != -1)
          swift_once();
        v94 = v107;
        v95 = __swift_project_value_buffer(v107, (uint64_t)qword_255A3E6C8);
        (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v92, v95, v94);
        v96 = v105;
        v97 = v121;
        v73((uint64_t)v105, v93, v121);
        v98 = sub_2292274D0();
        v99 = sub_22922762C();
        if (os_log_type_enabled(v98, v99))
        {
          v100 = (uint8_t *)swift_slowAlloc();
          v101 = swift_slowAlloc();
          v124 = v101;
          *(_DWORD *)v100 = 136315138;
          v122 = v100 + 4;
          v73(v104, (unint64_t)v96, v97);
          v102 = sub_229227530();
          v123 = sub_229209A10(v102, v103, &v124);
          sub_229227680();
          swift_bridgeObjectRelease();
          v85(v96, v97);
          _os_log_impl(&dword_229202000, v98, v99, "SystemCommandsIntent isHomeAutomationParse | Found HA identifier: %s", v100, 0xCu);
          v90 = 1;
          swift_arrayDestroy();
          MEMORY[0x22E2C5D5C](v101, -1, -1);
          MEMORY[0x22E2C5D5C](v100, -1, -1);

          (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
          v85((char *)v119, v97);
        }
        else
        {

          v85(v96, v97);
          (*(void (**)(char *, uint64_t))(v108 + 8))(v92, v94);
          v85((char *)v93, v97);
          return 1;
        }
        return v90;
      }
      swift_bridgeObjectRelease();
LABEL_97:
      if (qword_255A3B748 != -1)
        swift_once();
      v86 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v109, v86, v2);
      v87 = sub_2292274D0();
      v88 = sub_22922762C();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        _os_log_impl(&dword_229202000, v87, v88, "SystemCommandsIntent isHomeAutomationParse | No HA identifiers found, parse is not HomeAutomation", v89, 2u);
        MEMORY[0x22E2C5D5C](v89, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v109, v2);
      return 0;
    }
    swift_bridgeObjectRetain();
    v57 = 0;
    v58 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v59 = *(_QWORD *)&v26[8 * v57 + 32];
      v23 = *(_QWORD *)(v59 + 16);
      a1 = *(_QWORD *)(v58 + 16);
      v60 = (char *)(a1 + v23);
      if (__OFADD__(a1, v23))
        break;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t)v60 > *(_QWORD *)(v58 + 24) >> 1)
      {
        if (a1 <= (uint64_t)v60)
          v62 = a1 + v23;
        else
          v62 = a1;
        v58 = sub_229215C94(isUniquelyReferenced_nonNull_native, v62, 1, v58);
      }
      if (*(_QWORD *)(v59 + 16))
      {
        v63 = *(_QWORD *)(v58 + 16);
        if ((*(_QWORD *)(v58 + 24) >> 1) - v63 < v23)
          goto LABEL_117;
        v64 = (v122[80] + 32) & ~(unint64_t)v122[80];
        v65 = *((_QWORD *)v122 + 9);
        v66 = v58 + v64 + v65 * v63;
        if (v59 + v64 < v66 + v65 * v23 && v66 < v59 + v64 + v65 * v23)
          goto LABEL_121;
        swift_arrayInitWithCopy();
        if (v23)
        {
          v68 = *(_QWORD *)(v58 + 16);
          v27 = __OFADD__(v68, v23);
          v69 = (char *)(v68 + v23);
          if (v27)
            goto LABEL_118;
          *(_QWORD *)(v58 + 16) = v69;
        }
      }
      else if (v23)
      {
        goto LABEL_115;
      }
      swift_bridgeObjectRelease();
      if (v56 == ++v57)
      {
        swift_bridgeObjectRelease();
        goto LABEL_90;
      }
    }
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    swift_bridgeObjectRetain();
    v24 = sub_229227704();
  }
  v3 = 0;
  v25 = a1 & 0xC000000000000001;
  v26 = (char *)MEMORY[0x24BEE4AF8];
  v110 = v24;
  v111 = a1;
  v112 = a1 + 32;
  v113 = a1 & 0xC000000000000001;
  while (1)
  {
    v120 = v26;
    if (v25)
      MEMORY[0x22E2C58E8](v3, a1);
    else
      swift_retain();
    v27 = __OFADD__(v3++, 1);
    if (v27)
      goto LABEL_116;
    sub_229227314();
    if (!v124)
    {
      swift_release();
      goto LABEL_28;
    }
    sub_2292272D8();
    swift_release();
    v28 = sub_229227434();
    swift_release();
    if (*(_QWORD *)(v28 + 16))
    {
      v29 = sub_22921665C(0x73656D616ELL, 0xE500000000000000);
      if ((v30 & 1) != 0)
        break;
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_28:
    v26 = v120;
LABEL_29:
    if (v3 == v24)
    {
      swift_bridgeObjectRelease();
      v2 = v107;
      v3 = v108;
      goto LABEL_67;
    }
  }
  v23 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v29);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((unint64_t)v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v31 = sub_229227704();
    if (!v31)
      goto LABEL_32;
LABEL_15:
    if (v31 < 1)
      goto LABEL_119;
    v32 = 0;
    v2 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((v23 & 0xC000000000000001) != 0)
        MEMORY[0x22E2C58E8](v32, v23);
      else
        swift_retain();
      v33 = sub_229227428();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = (uint64_t)sub_229215E64(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
      v35 = *(_QWORD *)(v2 + 16);
      v34 = *(_QWORD *)(v2 + 24);
      if (v35 >= v34 >> 1)
        v2 = (uint64_t)sub_229215E64((char *)(v34 > 1), v35 + 1, 1, v2);
      ++v32;
      *(_QWORD *)(v2 + 16) = v35 + 1;
      *(_QWORD *)(v2 + 8 * v35 + 32) = v33;
    }
    while (v31 != v32);
  }
  else
  {
    v31 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v31)
      goto LABEL_15;
LABEL_32:
    v2 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease_n();
  v36 = *(_QWORD *)(v2 + 16);
  if (!v36)
  {
    swift_release();
    v38 = MEMORY[0x24BEE4AF8];
LABEL_56:
    swift_bridgeObjectRelease();
    v26 = v120;
    v50 = swift_isUniquelyReferenced_nonNull_native();
    v24 = v110;
    a1 = v111;
    if ((v50 & 1) == 0)
      v26 = sub_229215E64(0, *((_QWORD *)v26 + 2) + 1, 1, (uint64_t)v26);
    v25 = v113;
    v23 = *((_QWORD *)v26 + 2);
    v51 = *((_QWORD *)v26 + 3);
    if (v23 >= v51 >> 1)
      v26 = sub_229215E64((char *)(v51 > 1), v23 + 1, 1, (uint64_t)v26);
    *((_QWORD *)v26 + 2) = v23 + 1;
    *(_QWORD *)&v26[8 * v23 + 32] = v38;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  v37 = 0;
  v38 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v23 = *(_QWORD *)(v2 + 8 * v37 + 32);
    v39 = *(_QWORD *)(v23 + 16);
    a1 = *(_QWORD *)(v38 + 16);
    v40 = a1 + v39;
    if (__OFADD__(a1, v39))
    {
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
      goto LABEL_114;
    }
    swift_bridgeObjectRetain();
    v41 = swift_isUniquelyReferenced_nonNull_native();
    if (!v41 || v40 > *(_QWORD *)(v38 + 24) >> 1)
    {
      if (a1 <= v40)
        v42 = a1 + v39;
      else
        v42 = a1;
      v38 = sub_229215C94(v41, v42, 1, v38);
    }
    if (*(_QWORD *)(v23 + 16))
      break;
    if (v39)
      goto LABEL_111;
LABEL_53:
    ++v37;
    swift_bridgeObjectRelease();
    if (v36 == v37)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
  }
  v43 = *(_QWORD *)(v38 + 16);
  if ((*(_QWORD *)(v38 + 24) >> 1) - v43 < v39)
    goto LABEL_112;
  v44 = (v122[80] + 32) & ~(unint64_t)v122[80];
  v45 = *((_QWORD *)v122 + 9);
  v46 = v38 + v44 + v45 * v43;
  if (v23 + v44 >= v46 + v45 * v39 || v46 >= v23 + v44 + v45 * v39)
  {
    swift_arrayInitWithCopy();
    if (v39)
    {
      v48 = *(_QWORD *)(v38 + 16);
      v27 = __OFADD__(v48, v39);
      v49 = v48 + v39;
      if (v27)
        goto LABEL_113;
      *(_QWORD *)(v38 + 16) = v49;
    }
    goto LABEL_53;
  }
LABEL_121:
  result = sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_229214164(int64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  int v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  int isUniquelyReferenced_nonNull_native;
  int64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(uint64_t, unint64_t, uint64_t);
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  void (*v80)(char *, uint64_t);
  char *v81;
  char *v82;
  unsigned __int8 v83;
  int v84;
  void (*v85)(char *, uint64_t);
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t result;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  int64_t v111;
  int64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint8_t *v122;
  uint64_t v123;
  uint64_t v124;

  v2 = sub_2292274DC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v109 = (char *)&v104 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v106 = (char *)&v104 - v9;
  v10 = sub_229227350();
  v117 = *(_QWORD *)(v10 - 8);
  v118 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v116 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v115 = (char *)&v104 - v13;
  v14 = sub_229227308();
  v122 = *(uint8_t **)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v114 = (char *)&v104 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v23 = (uint64_t)&v104 - v22;
  if (!a1)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v52 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v52, v2);
    v53 = sub_2292274D0();
    v54 = sub_22922762C();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_229202000, v53, v54, "SystemCommandsIntent isMediaPlayerParse | No UserEntities found", v55, 2u);
      MEMORY[0x22E2C5D5C](v55, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  v104 = v21;
  v105 = v20;
  v121 = v19;
  if ((unint64_t)a1 >> 62)
    goto LABEL_120;
  v24 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v119 = v23;
    v107 = v2;
    v108 = v3;
    if (v24)
      break;
    swift_bridgeObjectRelease();
    v26 = (char *)MEMORY[0x24BEE4AF8];
LABEL_67:
    v56 = *((_QWORD *)v26 + 2);
    if (!v56)
    {
      v58 = MEMORY[0x24BEE4AF8];
LABEL_90:
      swift_bridgeObjectRelease();
      v70 = *(_QWORD *)(v58 + 16);
      if (v70)
      {
        v71 = v121;
        v72 = v58 + ((v122[80] + 32) & ~(unint64_t)v122[80]);
        LODWORD(v120) = *MEMORY[0x24BEA0050];
        v73 = (void (*)(uint64_t, unint64_t, uint64_t))*((_QWORD *)v122 + 2);
        v74 = v119;
        v112 = *((_QWORD *)v122 + 9);
        v113 = (unint64_t)v73;
        v75 = v116;
        while (1)
        {
          v73(v74, v72, v71);
          v76 = v115;
          sub_2292272E4();
          v78 = v117;
          v77 = v118;
          (*(void (**)(char *, _QWORD, uint64_t))(v117 + 104))(v75, v120, v118);
          v79 = MEMORY[0x22E2C557C](v76, v75);
          v80 = *(void (**)(char *, uint64_t))(v78 + 8);
          v80(v75, v77);
          v81 = v76;
          v73 = (void (*)(uint64_t, unint64_t, uint64_t))v113;
          v80(v81, v77);
          v82 = v114;
          v73((uint64_t)v114, v74, v71);
          if ((v79 & 1) != 0)
            break;
          sub_2292272FC();
          sub_229215C20();
          v84 = v83;
          v85 = (void (*)(char *, uint64_t))*((_QWORD *)v122 + 1);
          v85(v82, v71);
          if (v84 != 8)
            goto LABEL_105;
          v74 = v119;
          v85((char *)v119, v71);
          v72 += v112;
          if (!--v70)
          {
            swift_bridgeObjectRelease();
            v2 = v107;
            v3 = v108;
            goto LABEL_97;
          }
        }
        v85 = (void (*)(char *, uint64_t))*((_QWORD *)v122 + 1);
        v85(v82, v71);
LABEL_105:
        swift_bridgeObjectRelease();
        v92 = v106;
        v93 = v119;
        if (qword_255A3B748 != -1)
          swift_once();
        v94 = v107;
        v95 = __swift_project_value_buffer(v107, (uint64_t)qword_255A3E6C8);
        (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v92, v95, v94);
        v96 = v105;
        v97 = v121;
        v73((uint64_t)v105, v93, v121);
        v98 = sub_2292274D0();
        v99 = sub_22922762C();
        if (os_log_type_enabled(v98, v99))
        {
          v100 = (uint8_t *)swift_slowAlloc();
          v101 = swift_slowAlloc();
          v124 = v101;
          *(_DWORD *)v100 = 136315138;
          v122 = v100 + 4;
          v73(v104, (unint64_t)v96, v97);
          v102 = sub_229227530();
          v123 = sub_229209A10(v102, v103, &v124);
          sub_229227680();
          swift_bridgeObjectRelease();
          v85(v96, v97);
          _os_log_impl(&dword_229202000, v98, v99, "SystemCommandsIntent isMediaPlayerParse | Found MP identifier: %s", v100, 0xCu);
          v90 = 1;
          swift_arrayDestroy();
          MEMORY[0x22E2C5D5C](v101, -1, -1);
          MEMORY[0x22E2C5D5C](v100, -1, -1);

          (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
          v85((char *)v119, v97);
        }
        else
        {

          v85(v96, v97);
          (*(void (**)(char *, uint64_t))(v108 + 8))(v92, v94);
          v85((char *)v93, v97);
          return 1;
        }
        return v90;
      }
      swift_bridgeObjectRelease();
LABEL_97:
      if (qword_255A3B748 != -1)
        swift_once();
      v86 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v109, v86, v2);
      v87 = sub_2292274D0();
      v88 = sub_22922762C();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        _os_log_impl(&dword_229202000, v87, v88, "SystemCommandsIntent isMediaPlayerParse | No MP identifiers found, parse is not MediaPlayer", v89, 2u);
        MEMORY[0x22E2C5D5C](v89, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v109, v2);
      return 0;
    }
    swift_bridgeObjectRetain();
    v57 = 0;
    v58 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v59 = *(_QWORD *)&v26[8 * v57 + 32];
      v23 = *(_QWORD *)(v59 + 16);
      a1 = *(_QWORD *)(v58 + 16);
      v60 = (char *)(a1 + v23);
      if (__OFADD__(a1, v23))
        break;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t)v60 > *(_QWORD *)(v58 + 24) >> 1)
      {
        if (a1 <= (uint64_t)v60)
          v62 = a1 + v23;
        else
          v62 = a1;
        v58 = sub_229215C94(isUniquelyReferenced_nonNull_native, v62, 1, v58);
      }
      if (*(_QWORD *)(v59 + 16))
      {
        v63 = *(_QWORD *)(v58 + 16);
        if ((*(_QWORD *)(v58 + 24) >> 1) - v63 < v23)
          goto LABEL_117;
        v64 = (v122[80] + 32) & ~(unint64_t)v122[80];
        v65 = *((_QWORD *)v122 + 9);
        v66 = v58 + v64 + v65 * v63;
        if (v59 + v64 < v66 + v65 * v23 && v66 < v59 + v64 + v65 * v23)
          goto LABEL_121;
        swift_arrayInitWithCopy();
        if (v23)
        {
          v68 = *(_QWORD *)(v58 + 16);
          v27 = __OFADD__(v68, v23);
          v69 = (char *)(v68 + v23);
          if (v27)
            goto LABEL_118;
          *(_QWORD *)(v58 + 16) = v69;
        }
      }
      else if (v23)
      {
        goto LABEL_115;
      }
      swift_bridgeObjectRelease();
      if (v56 == ++v57)
      {
        swift_bridgeObjectRelease();
        goto LABEL_90;
      }
    }
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    swift_bridgeObjectRetain();
    v24 = sub_229227704();
  }
  v3 = 0;
  v25 = a1 & 0xC000000000000001;
  v26 = (char *)MEMORY[0x24BEE4AF8];
  v110 = v24;
  v111 = a1;
  v112 = a1 + 32;
  v113 = a1 & 0xC000000000000001;
  while (1)
  {
    v120 = v26;
    if (v25)
      MEMORY[0x22E2C58E8](v3, a1);
    else
      swift_retain();
    v27 = __OFADD__(v3++, 1);
    if (v27)
      goto LABEL_116;
    sub_229227314();
    if (!v124)
    {
      swift_release();
      goto LABEL_28;
    }
    sub_2292272D8();
    swift_release();
    v28 = sub_229227434();
    swift_release();
    if (*(_QWORD *)(v28 + 16))
    {
      v29 = sub_22921665C(0x73656D616ELL, 0xE500000000000000);
      if ((v30 & 1) != 0)
        break;
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_28:
    v26 = v120;
LABEL_29:
    if (v3 == v24)
    {
      swift_bridgeObjectRelease();
      v2 = v107;
      v3 = v108;
      goto LABEL_67;
    }
  }
  v23 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v29);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ((unint64_t)v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v31 = sub_229227704();
    if (!v31)
      goto LABEL_32;
LABEL_15:
    if (v31 < 1)
      goto LABEL_119;
    v32 = 0;
    v2 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((v23 & 0xC000000000000001) != 0)
        MEMORY[0x22E2C58E8](v32, v23);
      else
        swift_retain();
      v33 = sub_229227428();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = (uint64_t)sub_229215E64(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
      v35 = *(_QWORD *)(v2 + 16);
      v34 = *(_QWORD *)(v2 + 24);
      if (v35 >= v34 >> 1)
        v2 = (uint64_t)sub_229215E64((char *)(v34 > 1), v35 + 1, 1, v2);
      ++v32;
      *(_QWORD *)(v2 + 16) = v35 + 1;
      *(_QWORD *)(v2 + 8 * v35 + 32) = v33;
    }
    while (v31 != v32);
  }
  else
  {
    v31 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v31)
      goto LABEL_15;
LABEL_32:
    v2 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease_n();
  v36 = *(_QWORD *)(v2 + 16);
  if (!v36)
  {
    swift_release();
    v38 = MEMORY[0x24BEE4AF8];
LABEL_56:
    swift_bridgeObjectRelease();
    v26 = v120;
    v50 = swift_isUniquelyReferenced_nonNull_native();
    v24 = v110;
    a1 = v111;
    if ((v50 & 1) == 0)
      v26 = sub_229215E64(0, *((_QWORD *)v26 + 2) + 1, 1, (uint64_t)v26);
    v25 = v113;
    v23 = *((_QWORD *)v26 + 2);
    v51 = *((_QWORD *)v26 + 3);
    if (v23 >= v51 >> 1)
      v26 = sub_229215E64((char *)(v51 > 1), v23 + 1, 1, (uint64_t)v26);
    *((_QWORD *)v26 + 2) = v23 + 1;
    *(_QWORD *)&v26[8 * v23 + 32] = v38;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  v37 = 0;
  v38 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v23 = *(_QWORD *)(v2 + 8 * v37 + 32);
    v39 = *(_QWORD *)(v23 + 16);
    a1 = *(_QWORD *)(v38 + 16);
    v40 = a1 + v39;
    if (__OFADD__(a1, v39))
    {
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
      goto LABEL_114;
    }
    swift_bridgeObjectRetain();
    v41 = swift_isUniquelyReferenced_nonNull_native();
    if (!v41 || v40 > *(_QWORD *)(v38 + 24) >> 1)
    {
      if (a1 <= v40)
        v42 = a1 + v39;
      else
        v42 = a1;
      v38 = sub_229215C94(v41, v42, 1, v38);
    }
    if (*(_QWORD *)(v23 + 16))
      break;
    if (v39)
      goto LABEL_111;
LABEL_53:
    ++v37;
    swift_bridgeObjectRelease();
    if (v36 == v37)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_56;
    }
  }
  v43 = *(_QWORD *)(v38 + 16);
  if ((*(_QWORD *)(v38 + 24) >> 1) - v43 < v39)
    goto LABEL_112;
  v44 = (v122[80] + 32) & ~(unint64_t)v122[80];
  v45 = *((_QWORD *)v122 + 9);
  v46 = v38 + v44 + v45 * v43;
  if (v23 + v44 >= v46 + v45 * v39 || v46 >= v23 + v44 + v45 * v39)
  {
    swift_arrayInitWithCopy();
    if (v39)
    {
      v48 = *(_QWORD *)(v38 + 16);
      v27 = __OFADD__(v48, v39);
      v49 = v48 + v39;
      if (v27)
        goto LABEL_113;
      *(_QWORD *)(v38 + 16) = v49;
    }
    goto LABEL_53;
  }
LABEL_121:
  result = sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_229214D88(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int v33;
  int64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  int isUniquelyReferenced_nonNull_native;
  int64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(_QWORD, _QWORD, _QWORD);
  char *v69;
  void (*v70)(_QWORD, _QWORD, _QWORD);
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t result;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v2 = sub_2292274DC();
  v106 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v100 = (char *)&v96 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v96 - v8;
  v10 = sub_229227308();
  v109 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  v101 = (char *)&v96 - v15;
  if (!a1)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v45 = __swift_project_value_buffer(v2, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v106 + 16))(v5, v45, v2);
    v46 = sub_2292274D0();
    v47 = sub_22922762C();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = v2;
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_229202000, v46, v47, "SystemCommandsIntent isSettingsParse | No UserEntities found", v49, 2u);
      v50 = v49;
      v2 = v48;
      MEMORY[0x22E2C5D5C](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v106 + 8))(v5, v2);
    return 0;
  }
  v96 = v14;
  v97 = v13;
  if (a1 >> 62)
    goto LABEL_115;
  v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v98 = v9;
    v99 = v2;
    v108 = v10;
    if (v16)
      break;
    swift_bridgeObjectRelease();
    v17 = (char *)MEMORY[0x24BEE4AF8];
LABEL_66:
    a1 = *((_QWORD *)v17 + 2);
    if (!a1)
    {
      v2 = MEMORY[0x24BEE4AF8];
LABEL_89:
      swift_bridgeObjectRelease();
      v64 = *(_QWORD *)(v2 + 16);
      if (v64)
      {
        v65 = v2 + ((*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80));
        v66 = *(_QWORD *)(v109 + 72);
        v67 = v10;
        v68 = *(void (**)(_QWORD, _QWORD, _QWORD))(v109 + 16);
        v69 = v101;
        while (1)
        {
          v70 = v68;
          v68(v69, v65, v67);
          sub_2292272FC();
          v71 = sub_22922771C();
          swift_bridgeObjectRelease();
          if (!v71)
            break;
          (*(void (**)(char *, uint64_t))(v109 + 8))(v69, v67);
          v65 += v66;
          --v64;
          v68 = v70;
          if (!v64)
            goto LABEL_93;
        }
        swift_bridgeObjectRelease();
        if (qword_255A3B748 != -1)
          swift_once();
        v81 = v99;
        v82 = __swift_project_value_buffer(v99, (uint64_t)qword_255A3E6C8);
        v83 = v106;
        v84 = v98;
        (*(void (**)(char *, uint64_t, uint64_t))(v106 + 16))(v98, v82, v81);
        v85 = v97;
        v86 = v101;
        v87 = v108;
        v70(v97, v101, v108);
        v88 = sub_2292274D0();
        v89 = sub_22922762C();
        if (os_log_type_enabled(v88, v89))
        {
          v90 = (uint8_t *)swift_slowAlloc();
          v91 = swift_slowAlloc();
          v111 = v91;
          *(_DWORD *)v90 = 136315138;
          v70(v96, v85, v87);
          v92 = sub_229227530();
          v110 = sub_229209A10(v92, v93, &v111);
          sub_229227680();
          swift_bridgeObjectRelease();
          v94 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
          v94(v85, v87);
          _os_log_impl(&dword_229202000, v88, v89, "SystemCommandsIntent isSettingsParse | Found MP identifier: %s", v90, 0xCu);
          v79 = 1;
          swift_arrayDestroy();
          MEMORY[0x22E2C5D5C](v91, -1, -1);
          MEMORY[0x22E2C5D5C](v90, -1, -1);

          (*(void (**)(char *, uint64_t))(v106 + 8))(v98, v99);
          v94((uint64_t)v101, v87);
        }
        else
        {

          v95 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
          v95(v85, v87);
          (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v81);
          v95((uint64_t)v86, v87);
          return 1;
        }
        return v79;
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v72 = v99;
      v73 = v100;
      v74 = v106;
      if (qword_255A3B748 != -1)
        swift_once();
      v75 = __swift_project_value_buffer(v72, (uint64_t)qword_255A3E6C8);
      (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v73, v75, v72);
      v76 = sub_2292274D0();
      v77 = sub_22922762C();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_229202000, v76, v77, "SystemCommandsIntent isMediaPlayerParse | No MP identifiers found, parse is not MediaPlayer", v78, 2u);
        MEMORY[0x22E2C5D5C](v78, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v106 + 8))(v73, v72);
      return 0;
    }
    swift_bridgeObjectRetain();
    v51 = 0;
    v2 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v52 = *(_QWORD *)&v17[8 * v51 + 32];
      v53 = *(_QWORD *)(v52 + 16);
      v9 = *(char **)(v2 + 16);
      v54 = &v9[v53];
      if (__OFADD__(v9, v53))
        break;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (uint64_t)v54 > *(_QWORD *)(v2 + 24) >> 1)
      {
        if ((uint64_t)v9 <= (uint64_t)v54)
          v56 = (int64_t)&v9[v53];
        else
          v56 = (int64_t)v9;
        v2 = sub_229215C94(isUniquelyReferenced_nonNull_native, v56, 1, v2);
      }
      if (*(_QWORD *)(v52 + 16))
      {
        v57 = *(_QWORD *)(v2 + 16);
        if ((*(_QWORD *)(v2 + 24) >> 1) - v57 < v53)
          goto LABEL_112;
        v58 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
        v59 = *(_QWORD *)(v109 + 72);
        v60 = v2 + v58 + v59 * v57;
        if (v52 + v58 < v60 + v59 * v53 && v60 < v52 + v58 + v59 * v53)
          goto LABEL_116;
        swift_arrayInitWithCopy();
        if (v53)
        {
          v62 = *(_QWORD *)(v2 + 16);
          v18 = __OFADD__(v62, v53);
          v63 = v62 + v53;
          if (v18)
            goto LABEL_113;
          *(_QWORD *)(v2 + 16) = v63;
        }
      }
      else if (v53)
      {
        goto LABEL_110;
      }
      swift_bridgeObjectRelease();
      if (a1 == ++v51)
      {
        swift_bridgeObjectRelease();
        goto LABEL_89;
      }
    }
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
    swift_bridgeObjectRetain();
    v16 = sub_229227704();
  }
  v2 = 0;
  v9 = (char *)(a1 & 0xC000000000000001);
  v17 = (char *)MEMORY[0x24BEE4AF8];
  v104 = v16;
  v105 = a1;
  v102 = a1 + 32;
  v103 = a1 & 0xC000000000000001;
  while (1)
  {
    if (v9)
      MEMORY[0x22E2C58E8](v2, a1);
    else
      swift_retain();
    v18 = __OFADD__(v2++, 1);
    if (v18)
      goto LABEL_111;
    sub_229227314();
    if (!v111)
    {
      swift_release();
      goto LABEL_58;
    }
    sub_2292272D8();
    swift_release();
    v19 = sub_229227434();
    swift_release();
    if (*(_QWORD *)(v19 + 16))
    {
      v20 = sub_22921665C(0x73656D616ELL, 0xE500000000000000);
      if ((v21 & 1) != 0)
        break;
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_58:
    if (v2 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
  }
  v107 = v17;
  v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    v23 = sub_229227704();
    if (!v23)
      goto LABEL_29;
LABEL_15:
    if (v23 < 1)
      goto LABEL_114;
    v24 = 0;
    v25 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v22 & 0xC000000000000001) != 0)
        MEMORY[0x22E2C58E8](v24, v22);
      else
        swift_retain();
      v26 = sub_229227428();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v25 = sub_229215E64(0, *((_QWORD *)v25 + 2) + 1, 1, (uint64_t)v25);
      v28 = *((_QWORD *)v25 + 2);
      v27 = *((_QWORD *)v25 + 3);
      if (v28 >= v27 >> 1)
        v25 = sub_229215E64((char *)(v27 > 1), v28 + 1, 1, (uint64_t)v25);
      ++v24;
      *((_QWORD *)v25 + 2) = v28 + 1;
      *(_QWORD *)&v25[8 * v28 + 32] = v26;
    }
    while (v23 != v24);
  }
  else
  {
    v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v23)
      goto LABEL_15;
LABEL_29:
    v25 = (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease_n();
  v10 = *((_QWORD *)v25 + 2);
  if (!v10)
  {
    swift_release();
    v30 = MEMORY[0x24BEE4AF8];
LABEL_53:
    swift_bridgeObjectRelease();
    v17 = v107;
    v42 = swift_isUniquelyReferenced_nonNull_native();
    v10 = v108;
    if ((v42 & 1) == 0)
      v17 = sub_229215E64(0, *((_QWORD *)v17 + 2) + 1, 1, (uint64_t)v17);
    v16 = v104;
    a1 = v105;
    v44 = *((_QWORD *)v17 + 2);
    v43 = *((_QWORD *)v17 + 3);
    if (v44 >= v43 >> 1)
      v17 = sub_229215E64((char *)(v43 > 1), v44 + 1, 1, (uint64_t)v17);
    *((_QWORD *)v17 + 2) = v44 + 1;
    *(_QWORD *)&v17[8 * v44 + 32] = v30;
    v9 = (char *)v103;
    goto LABEL_58;
  }
  swift_bridgeObjectRetain();
  v29 = 0;
  v30 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v31 = *(_QWORD *)&v25[8 * v29 + 32];
    a1 = *(_QWORD *)(v31 + 16);
    v9 = *(char **)(v30 + 16);
    v32 = &v9[a1];
    if (__OFADD__(v9, a1))
    {
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
      goto LABEL_109;
    }
    swift_bridgeObjectRetain();
    v33 = swift_isUniquelyReferenced_nonNull_native();
    if (!v33 || (uint64_t)v32 > *(_QWORD *)(v30 + 24) >> 1)
    {
      if ((uint64_t)v9 <= (uint64_t)v32)
        v34 = (int64_t)&v9[a1];
      else
        v34 = (int64_t)v9;
      v30 = sub_229215C94(v33, v34, 1, v30);
    }
    if (*(_QWORD *)(v31 + 16))
      break;
    if (a1)
      goto LABEL_106;
LABEL_50:
    ++v29;
    swift_bridgeObjectRelease();
    if (v10 == v29)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
  }
  v35 = *(_QWORD *)(v30 + 16);
  if ((*(_QWORD *)(v30 + 24) >> 1) - v35 < (uint64_t)a1)
    goto LABEL_107;
  v36 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
  v37 = *(_QWORD *)(v109 + 72);
  v38 = v30 + v36 + v37 * v35;
  if (v31 + v36 >= v38 + v37 * a1 || v38 >= v31 + v36 + v37 * a1)
  {
    swift_arrayInitWithCopy();
    if (a1)
    {
      v40 = *(_QWORD *)(v30 + 16);
      v18 = __OFADD__(v40, a1);
      v41 = v40 + a1;
      if (v18)
        goto LABEL_108;
      *(_QWORD *)(v30 + 16) = v41;
    }
    goto LABEL_50;
  }
LABEL_116:
  result = sub_229227710();
  __break(1u);
  return result;
}

BOOL sub_2292158C0()
{
  uint64_t v0;
  char v1;
  char v2;
  _BOOL8 result;
  uint64_t v4;

  sub_2292273F8();
  result = 0;
  if (v4)
  {
    v0 = sub_22921310C(0);
    swift_release();
    if (v0)
    {
      sub_229215934();
      v2 = v1;
      swift_bridgeObjectRelease();
      if ((v2 & 1) != 0)
        return 1;
    }
  }
  return result;
}

void sub_229215934()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  int v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  OUTLINED_FUNCTION_16_1();
  v1 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_71_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 16);
  if (v8)
  {
    v30 = v3;
    v9 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v10 = *(_QWORD *)(v5 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v32 = v10;
    v29 = v1;
    OUTLINED_FUNCTION_120();
    v11 = (char *)MEMORY[0x24BEE4AF8];
    v12 = v5;
    do
    {
      v31(v7, v9, v4);
      v13 = sub_2292272F0();
      v15 = v14;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v11 = OUTLINED_FUNCTION_82_0(0, *((_QWORD *)v11 + 2) + 1);
      v17 = *((_QWORD *)v11 + 2);
      v16 = *((_QWORD *)v11 + 3);
      if (v17 >= v16 >> 1)
        v11 = OUTLINED_FUNCTION_82_0((char *)(v16 > 1), v17 + 1);
      *((_QWORD *)v11 + 2) = v17 + 1;
      v18 = &v11[16 * v17];
      *((_QWORD *)v18 + 4) = v13;
      *((_QWORD *)v18 + 5) = v15;
      v9 += v32;
      --v8;
      v5 = v12;
    }
    while (v8);
    swift_bridgeObjectRelease();
    LOBYTE(v3) = v30;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v19 = sub_229216FB0(v3);
  v21 = v20;
  v22 = *((_QWORD *)v11 + 2);
  if (!v22
    || ((v23 = v19, *((_QWORD *)v11 + 4) == v19) ? (v24 = *((_QWORD *)v11 + 5) == v20) : (v24 = 0),
        v24 || (OUTLINED_FUNCTION_51_0() & 1) != 0 || v22 == 1))
  {
LABEL_26:
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_4_2();
  }
  else
  {
    v25 = v11 + 56;
    v26 = 1;
    while (1)
    {
      v27 = v26 + 1;
      if (__OFADD__(v26, 1))
        break;
      if ((*(v25 - 1) != v23 || *v25 != v21) && (OUTLINED_FUNCTION_51_0() & 1) == 0)
      {
        v25 += 2;
        ++v26;
        if (v27 != v22)
          continue;
      }
      goto LABEL_26;
    }
    __break(1u);
  }
}

uint64_t sub_229215B20(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_229227734();
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
    if (v12 || (sub_229227734() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_229215BE4()
{
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_73_0();
}

void sub_229215C20()
{
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_73_0();
}

void sub_229215C5C()
{
  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_73_0();
}

uint64_t sub_229215C94(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C618);
  v10 = *(_QWORD *)(sub_229227308() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_2292276F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_229227308() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_229216364(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22921603C(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_229215E64(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C638);
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
  if ((v5 & 1) != 0)
  {
    sub_229216460((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22921615C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_229215F50(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C620);
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
  if ((v5 & 1) != 0)
  {
    sub_2292164E4((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_229216270(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_22921603C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_229227308() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_22921615C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C640);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_229216270(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_229227710();
  __break(1u);
  return result;
}

uint64_t sub_229216364(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_229227710();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_229227308(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_229227308();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_229216460(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_229227710();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2292164E4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_229227710();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_229216568(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_229227308() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_229227710();
  __break(1u);
  return result;
}

unint64_t sub_22921665C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_229227758();
  sub_229227548();
  v4 = sub_229227770();
  return sub_2292166C0(a1, a2, v4);
}

unint64_t sub_2292166C0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_229227734() & 1) == 0)
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
      while (!v14 && (sub_229227734() & 1) == 0);
    }
  }
  return v6;
}

size_t sub_2292167A0(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2292167BC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_2292167BC(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C618);
  v10 = *(_QWORD *)(sub_229227308() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_229227308() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_229216364(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_229216568(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_7_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_9_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return type metadata accessor for SystemCommandsIntent();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_2292273E0();
}

void OUTLINED_FUNCTION_14_3(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return type metadata accessor for SystemCommandsIntent();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_229227368();
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_229208758(v2 - 112, a2);
}

BOOL OUTLINED_FUNCTION_31_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_229227368();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_229210ED8();
}

uint64_t OUTLINED_FUNCTION_50_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return sub_229227734();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return sub_2292274D0();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_55_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_2292273A4();
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return sub_229227374();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return sub_2292273F8();
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return sub_2292273F8();
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return sub_229227368();
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return sub_22922771C();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22920C64C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_67_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_229209A10(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return sub_22922738C();
}

uint64_t OUTLINED_FUNCTION_69_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_70_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return sub_229227308();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return sub_229227398();
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return sub_229227620();
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_76_0(uint64_t a1)
{
  uint64_t *v1;

  return sub_229208758(a1, v1);
}

uint64_t OUTLINED_FUNCTION_77_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_80_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return swift_retain();
}

char *OUTLINED_FUNCTION_82_0(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_229215F50(a1, a2, 1, v2);
}

char *OUTLINED_FUNCTION_83_0(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_229215F50(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_86_0()
{
  return swift_release_n();
}

uint64_t *SystemCommandsFeatureFlags.shared.unsafeMutableAddressor()
{
  if (qword_255A3B738 != -1)
    swift_once();
  return &static SystemCommandsFeatureFlags.shared;
}

const char *sub_229216CA4()
{
  return "SiriSystemCommands";
}

const char *sub_229216CB8(char a1)
{
  if ((a1 & 1) != 0)
    return "ScreenRecording";
  else
    return "NLX";
}

BOOL sub_229216CE4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_229216CF4()
{
  return sub_229227764();
}

uint64_t sub_229216D18()
{
  sub_229227758();
  sub_229227764();
  return sub_229227770();
}

BOOL sub_229216D5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_229216CE4(*a1, *a2);
}

uint64_t sub_229216D68()
{
  return sub_229216D18();
}

uint64_t sub_229216D70()
{
  return sub_229216CF4();
}

const char *sub_229216D78()
{
  return sub_229216CA4();
}

const char *sub_229216D80()
{
  char *v0;

  return sub_229216CB8(*v0);
}

uint64_t sub_229216D88()
{
  uint64_t result;

  type metadata accessor for SystemCommandsFeatureFlags();
  result = swift_initStaticObject();
  static SystemCommandsFeatureFlags.shared = result;
  return result;
}

uint64_t static SystemCommandsFeatureFlags.shared.getter()
{
  type metadata accessor for SystemCommandsFeatureFlags();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for SystemCommandsFeatureFlags()
{
  return objc_opt_self();
}

uint64_t sub_229216DEC()
{
  return sub_229216DFC(0);
}

uint64_t sub_229216DF4()
{
  return sub_229216DFC(1);
}

uint64_t sub_229216DFC(char a1)
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for SystemCommandsFeatures;
  v6 = sub_229216E68();
  v4[0] = a1;
  v2 = sub_2292271F4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

uint64_t SystemCommandsFeatureFlags.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SystemCommandsFeatureFlags.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_229216E68()
{
  unint64_t result;

  result = qword_255A3C6F0;
  if (!qword_255A3C6F0)
  {
    result = MEMORY[0x22E2C5CD8](&unk_229228690, &type metadata for SystemCommandsFeatures);
    atomic_store(result, (unint64_t *)&qword_255A3C6F0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SystemCommandsFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229216EF0 + 4 * byte_2292285C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_229216F24 + 4 * byte_2292285C0[v4]))();
}

uint64_t sub_229216F24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229216F2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229216F34);
  return result;
}

uint64_t sub_229216F40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229216F48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_229216F4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229216F54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SystemCommandsFeatures()
{
  return &type metadata for SystemCommandsFeatures;
}

unint64_t sub_229216F74()
{
  unint64_t result;

  result = qword_255A3C6F8;
  if (!qword_255A3C6F8)
  {
    result = MEMORY[0x22E2C5CD8](&unk_229228668, &type metadata for SystemCommandsFeatures);
    atomic_store(result, (unint64_t *)&qword_255A3C6F8);
  }
  return result;
}

uint64_t sub_229216FB0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_229216FE8 + 4 * byte_2292286C0[a1]))(0xD000000000000010, 0x8000000229229B10);
}

uint64_t sub_229216FE8()
{
  return 0x61436D6574737973;
}

uint64_t sub_22921700C()
{
  return 0x74416D6574737973;
}

uint64_t sub_229217030()
{
  return 0x656E6F6870;
}

uint64_t sub_229217044()
{
  return 0x656E6F687069;
}

uint64_t sub_229217058()
{
  return 1684107369;
}

uint64_t sub_229217068()
{
  return 0x656369766564;
}

uint64_t sub_22921707C()
{
  return 0x6E6565726373;
}

uint64_t sub_229217090()
{
  return 1801678700;
}

uint64_t sub_2292170A0()
{
  return 0x6B636F6C6E75;
}

uint64_t sub_2292170B4()
{
  return 1701667182;
}

uint64_t sub_2292170C4()
{
  return 0x73656D616ELL;
}

uint64_t sub_2292170D8()
{
  return 0x7265776F70;
}

uint64_t sub_2292170EC()
{
  return 0x6E776F6474756873;
}

uint64_t SCSystemQueryFlow.__allocating_init(systemCategory:sharedObjects:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  SCSystemQueryFlow.init(systemCategory:sharedObjects:)(a1, a2, a3);
  return v6;
}

uint64_t sub_229217158(char a1)
{
  if ((a1 & 1) != 0)
    return 0x646C697562;
  else
    return 0x6E6F6973726576;
}

uint64_t SCSystemQueryFlow.init(systemCategory:sharedObjects:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v6[2];

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  sub_2292086D8(a3 + 40, v3 + 32);
  sub_2292086D8(a3 + 80, (uint64_t)v6);
  sub_229209094(a3);
  sub_2292090C8(v6, v3 + 72);
  return v3;
}

uint64_t SCSystemQueryFlow.on(input:)()
{
  return 1;
}

uint64_t SCSystemQueryFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[26] = a1;
  v2[27] = v1;
  sub_229227008();
  v2[28] = OUTLINED_FUNCTION_7();
  v3 = sub_22922714C();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[32] = v4;
  v2[33] = *(_QWORD *)(v4 - 8);
  v2[34] = OUTLINED_FUNCTION_4();
  v2[35] = OUTLINED_FUNCTION_4();
  v2[36] = OUTLINED_FUNCTION_4();
  v2[37] = OUTLINED_FUNCTION_4();
  sub_2292274C4();
  v2[38] = OUTLINED_FUNCTION_7();
  return swift_task_switch();
}

uint64_t sub_2292172A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t);
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  if (v2 == 0x6E6F6973726576 && v3 == 0xE700000000000000)
    goto LABEL_7;
  if ((OUTLINED_FUNCTION_30_1() & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 216);
LABEL_7:
    type metadata accessor for SystemQueryCATPatternsExecutor(0);
    OUTLINED_FUNCTION_53_1();
    sub_2292086D8(v1 + 32, v0 + 96);
    OUTLINED_FUNCTION_51_1();
    sub_2292274B8();
    v5 = OUTLINED_FUNCTION_52_1();
    *(_QWORD *)(v0 + 312) = v5;
    v19 = (char *)&dword_255A3C840 + dword_255A3C840;
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v6;
    v7 = sub_229217548;
LABEL_14:
    *v6 = v0;
    v6[1] = v7;
    return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v19)(0, v5, *(_QWORD *)(v0 + 216));
  }
  v8 = v2 == 0x646C697562 && v3 == 0xE500000000000000;
  if (v8 || (v9 = OUTLINED_FUNCTION_30_1(), (v9 & 1) != 0))
  {
    v10 = *(_QWORD *)(v0 + 216);
    type metadata accessor for SystemQueryCATPatternsExecutor(0);
    OUTLINED_FUNCTION_53_1();
    sub_2292086D8(v10 + 32, v0 + 16);
    OUTLINED_FUNCTION_51_1();
    sub_2292274B8();
    v5 = OUTLINED_FUNCTION_52_1();
    *(_QWORD *)(v0 + 344) = v5;
    v19 = (char *)&dword_255A3C850 + dword_255A3C850;
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 352) = v6;
    v7 = sub_229217700;
    goto LABEL_14;
  }
  if (qword_255A3B748 != -1)
    v9 = swift_once();
  v12 = *(void **)(v0 + 280);
  OUTLINED_FUNCTION_3_7(v9, (uint64_t)qword_255A3E6C8);
  sub_2292274D0();
  v13 = OUTLINED_FUNCTION_48_0();
  if (OUTLINED_FUNCTION_14_1(v13))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9_2(&dword_229202000, v14, v15, "SCSystemQueryFlow execute | invalid systemCategory");
    OUTLINED_FUNCTION_2();
  }
  v16 = *(_QWORD *)(v0 + 280);
  v17 = *(_QWORD *)(v0 + 256);
  v18 = *(_QWORD *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  sub_2292270A4();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229217548(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2292175B4(uint64_t a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_255A3B748 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_3_7(a1, (uint64_t)qword_255A3E6C8);
  sub_2292274D0();
  v2 = sub_22922762C();
  if (OUTLINED_FUNCTION_14_1(v2))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9_2(&dword_229202000, v3, v4, "SCSystemQueryFlow execute | QueryVersion pattern successfully executed");
    OUTLINED_FUNCTION_2();
  }
  v5 = *(void **)(v1 + 328);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_39_1();
  sub_229226FFC();
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_50_1();
  sub_2292270E0();
  OUTLINED_FUNCTION_5_0();
  sub_2292270D4();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_5_0();
  *(_QWORD *)(v1 + 200) = OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_42_0();
  swift_release();

  OUTLINED_FUNCTION_33_0(v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_6_5(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_229217700(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 360) = a1;
  *(_QWORD *)(v3 + 368) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921776C(uint64_t a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_255A3B748 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_3_7(a1, (uint64_t)qword_255A3E6C8);
  sub_2292274D0();
  v2 = sub_22922762C();
  if (OUTLINED_FUNCTION_14_1(v2))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9_2(&dword_229202000, v3, v4, "SCSystemQueryFlow execute | QueryBuild pattern successfully executed");
    OUTLINED_FUNCTION_2();
  }
  v5 = *(void **)(v1 + 360);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_39_1();
  sub_229226FFC();
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_50_1();
  sub_2292270E0();
  OUTLINED_FUNCTION_5_0();
  sub_2292270D4();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_5_0();
  *(_QWORD *)(v1 + 176) = OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_42_0();
  swift_release();

  OUTLINED_FUNCTION_33_0(v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_6_5(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2292178B8()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  int v27;

  swift_release();
  if (qword_255A3B748 != -1)
    swift_once();
  v2 = *(NSObject **)(v0 + 272);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 256), (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_21_1(v3);
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_17_4();
  sub_2292274D0();
  v4 = OUTLINED_FUNCTION_48_0();
  v5 = OUTLINED_FUNCTION_38_0(v4);
  v7 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 256);
  if (v5)
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_16();
    v27 = OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_10_4(v27, v10, v11, v12, v13, v14, v15, v16, 4.8149e-34, v25, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v17 = OUTLINED_FUNCTION_41_0();
    v23 = OUTLINED_FUNCTION_44_1(v17, v18, v19, v20, v21, v22);
    OUTLINED_FUNCTION_19_3(v23);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v2, v1, "SCSystemQueryFlow execute | error: %s", v9);
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_5_5();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_2292270A4();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_4_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229217A4C()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  int v27;

  swift_release();
  if (qword_255A3B748 != -1)
    swift_once();
  v2 = *(NSObject **)(v0 + 272);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 256), (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_21_1(v3);
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_17_4();
  sub_2292274D0();
  v4 = OUTLINED_FUNCTION_48_0();
  v5 = OUTLINED_FUNCTION_38_0(v4);
  v7 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 256);
  if (v5)
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_16();
    v27 = OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_10_4(v27, v10, v11, v12, v13, v14, v15, v16, 4.8149e-34, v25, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v17 = OUTLINED_FUNCTION_41_0();
    v23 = OUTLINED_FUNCTION_44_1(v17, v18, v19, v20, v21, v22);
    OUTLINED_FUNCTION_19_3(v23);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v2, v1, "SCSystemQueryFlow execute | error: %s", v9);
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_5_5();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_2292270A4();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_4_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t SCSystemQueryFlow.execute(completion:)()
{
  type metadata accessor for SCSystemQueryFlow();
  sub_229218694();
  return sub_229226EF4();
}

void sub_229217C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = OUTLINED_FUNCTION_46_1();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v5, sel_operatingSystemVersion);
  v6 = v21;
  v7 = v22;
  v8 = v23;

  v21 = v6;
  v19 = OUTLINED_FUNCTION_47_1();
  v20 = v9;
  v21 = 46;
  v22 = 0xE100000000000000;
  v18 = v7;
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_20_2();
  if (v8)
  {
    v21 = 46;
    v22 = 0xE100000000000000;
    v18 = v8;
    sub_229227728();
    OUTLINED_FUNCTION_45_1();
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_31_1();
    OUTLINED_FUNCTION_20_2();
  }
  if (qword_255A3B748 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v1, (uint64_t)qword_255A3E6C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v10, v1);
  v12 = v19;
  v11 = v20;
  swift_bridgeObjectRetain_n();
  v13 = sub_2292274D0();
  v14 = sub_229227620();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_16();
    v16 = OUTLINED_FUNCTION_16();
    v17[1] = v0;
    v21 = v16;
    v17[0] = v2;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    v18 = sub_229209A10(v12, v11, &v21);
    sub_229227680();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v13, v14, "SCSystemQueryFlow getVersion | version number is %s", v15);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_20();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_beginAccess();
  OUTLINED_FUNCTION_43_1();
  OUTLINED_FUNCTION_4_2();
}

void sub_229217EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49[16];
  uint64_t *v50;
  uint64_t v51[2];

  v1 = OUTLINED_FUNCTION_46_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v43 - v6;
  v8 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v9 = objc_msgSend(v8, sel_operatingSystemVersionString);

  v10 = sub_229227524();
  v12 = v11;

  v51[0] = 32;
  v51[1] = 0xE100000000000000;
  v50 = v51;
  v13 = sub_229218710(sub_229218838, (uint64_t)v49, v10, v12);
  if ((v14 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v1, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v37, v1);
    swift_bridgeObjectRetain();
    v38 = sub_2292274D0();
    v39 = sub_229227620();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_16();
      v41 = OUTLINED_FUNCTION_16();
      v48 = v2;
      v51[0] = v41;
      v47 = v1;
      *(_DWORD *)v40 = 136315138;
      swift_bridgeObjectRetain();
      v42 = sub_229209A10(v10, v12, v51);
      OUTLINED_FUNCTION_40_1(v42);
      sub_229227680();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v38, v39, "SCSystemQueryFlow getBuild | operatingSystemVersionString is in an unexpected format: %s", v40);
      OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_20();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    sub_229218384(v13, v10, v12);
    v15 = OUTLINED_FUNCTION_11_3();
    sub_229218424(v15, v16);
    v17 = OUTLINED_FUNCTION_11_3();
    v20 = sub_2292184DC(v17, v18, v19);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    if (qword_255A3B748 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v1, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v27, v1);
    swift_bridgeObjectRetain_n();
    v28 = v2;
    v29 = sub_2292274D0();
    v30 = sub_229227620();
    if (os_log_type_enabled(v29, v30))
    {
      v45 = v7;
      v48 = v28;
      v31 = OUTLINED_FUNCTION_16();
      v47 = v24;
      v32 = (uint8_t *)v31;
      v44 = OUTLINED_FUNCTION_16();
      v51[0] = v44;
      v46 = v0;
      *(_DWORD *)v32 = 136315138;
      v43 = v32 + 4;
      swift_bridgeObjectRetain();
      v33 = MEMORY[0x22E2C5774](v20, v22, v47, v26);
      v35 = v34;
      swift_bridgeObjectRelease();
      v36 = sub_229209A10(v33, v35, v51);
      OUTLINED_FUNCTION_40_1(v36);
      sub_229227680();
      OUTLINED_FUNCTION_20();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v29, v30, "SCSystemQueryFlow getBuild | build number is %s", v32);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_20();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v1);
    MEMORY[0x22E2C5774](v20, v22, v24, v26);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_43_1();
  OUTLINED_FUNCTION_4_2();
}

unint64_t sub_229218384(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 < result >> 14)
  {
    __break(1u);
  }
  else
  {
    v4 = sub_229227584();
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

uint64_t sub_229218424(uint64_t result, unint64_t a2)
{
  char v3;
  unint64_t v4;
  uint64_t v5;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = sub_229227668();
    if ((v3 & 1) != 0)
      v4 = a2;
    else
      v4 = result;
    if (v4 >> 14 >= a2 >> 14)
    {
      v5 = sub_229227674();
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2292184DC(unint64_t result, uint64_t a2, unint64_t a3)
{
  char v4;
  uint64_t v5;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    result = sub_229227668();
    if ((v4 & 1) != 0)
      result = a3;
    if (a3 >> 14 >= result >> 14)
    {
      v5 = sub_229227674();
      swift_bridgeObjectRelease();
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t SCSystemQueryFlow.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return v0;
}

uint64_t SCSystemQueryFlow.__deallocating_deinit()
{
  SCSystemQueryFlow.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2292185DC()
{
  return SCSystemQueryFlow.execute(completion:)();
}

uint64_t sub_2292185FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCSystemQueryFlow.execute()(a1);
}

uint64_t sub_229218650()
{
  type metadata accessor for SCSystemQueryFlow();
  return sub_229226F18();
}

uint64_t type metadata accessor for SCSystemQueryFlow()
{
  return objc_opt_self();
}

unint64_t sub_229218694()
{
  unint64_t result;
  uint64_t Flow;

  result = qword_255A3C0E8;
  if (!qword_255A3C0E8)
  {
    Flow = type metadata accessor for SCSystemQueryFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCSystemQueryFlow, Flow);
    atomic_store(result, (unint64_t *)&qword_255A3C0E8);
  }
  return result;
}

uint64_t sub_2292186D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_229227734() & 1;
}

unint64_t sub_229218710(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD v12[2];

  v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v5 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  while (1)
  {
    v7 = sub_229227554();
    v12[0] = sub_229227578();
    v12[1] = v8;
    v9 = a1(v12);
    if (v4)
      break;
    v10 = v9;
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v7;
    if (v7 < 0x4000)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_229218810(uint64_t *a1, uint64_t *a2)
{
  return sub_2292186D0(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_229218838(uint64_t *a1)
{
  uint64_t v1;

  return sub_229218810(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_5_5()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_5(uint64_t (*a1)(void))
{
  return a1();
}

id OUTLINED_FUNCTION_10_4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  float *v12;
  _QWORD *v13;

  *v12 = a9;
  *v13 = v11;
  return v11;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_15_2()
{
  void *v0;

}

id OUTLINED_FUNCTION_17_4()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_229227680();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, a1, v2);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return sub_229227734();
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_229227560();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_229226EDC();
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v12, a12);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_229226ED0();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_229226EC4();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_229227140();
}

BOOL OUTLINED_FUNCTION_38_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_229227530();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_229227098();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return sub_229227488();
}

uint64_t OUTLINED_FUNCTION_44_1(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_229209A10(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return sub_229227560();
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  return sub_2292274DC();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return sub_229227728();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_229227638();
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2292086D8(v0 + 72, v1);
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return sub_229227440();
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return sub_229227470();
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return sub_22922744C();
}

uint64_t type metadata accessor for SystemQueryCATPatternsExecutor(uint64_t a1)
{
  return sub_229219568(a1, qword_255A3C7F0);
}

uint64_t sub_229218AD0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_229218B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  int *QueryBuildParameters;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  OUTLINED_FUNCTION_10_1();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BFB8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_229228780;
  v9 = (uint64_t *)(v8 + 48);
  *(_QWORD *)(v8 + 32) = 0x646C697562;
  *(_QWORD *)(v8 + 40) = 0xE500000000000000;
  sub_2292194EC(v1, (uint64_t)v7, &qword_255A3C848);
  v10 = OUTLINED_FUNCTION_18_2();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) == 1)
  {
    sub_22921952C((uint64_t)v7, &qword_255A3C848);
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(_QWORD *)(v8 + 72) = v10;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v9);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(boxed_opaque_existential_1, v7, v10);
  }
  OUTLINED_FUNCTION_9_6();
  *(_QWORD *)(v8 + 80) = v12;
  *(_QWORD *)(v8 + 88) = v13;
  QueryBuildParameters = (int *)type metadata accessor for SystemQueryQueryBuildParameters(0);
  v15 = *(_QWORD *)(v1 + QueryBuildParameters[5]);
  if (v15)
  {
    v16 = OUTLINED_FUNCTION_17_5();
    v17 = v15;
  }
  else
  {
    v17 = 0;
    v16 = 0;
    *(_QWORD *)(v8 + 104) = 0;
    *(_QWORD *)(v8 + 112) = 0;
  }
  *(_QWORD *)(v8 + 96) = v17;
  *(_QWORD *)(v8 + 120) = v16;
  *(_QWORD *)(v8 + 128) = 0xD000000000000017;
  *(_QWORD *)(v8 + 136) = 0x80000002292298B0;
  *(_BYTE *)(v8 + 144) = *(_BYTE *)(v1 + QueryBuildParameters[6]);
  OUTLINED_FUNCTION_29_1();
  *(_QWORD *)(v8 + 168) = v19;
  *(_QWORD *)(v8 + 176) = v18;
  *(_QWORD *)(v8 + 184) = 0xE700000000000000;
  sub_2292194EC(v1 + QueryBuildParameters[7], (uint64_t)v5, &qword_255A3C848);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v10) == 1)
  {
    swift_retain();
    sub_22921952C((uint64_t)v5, &qword_255A3C848);
    *(_OWORD *)(v8 + 192) = 0u;
    *(_OWORD *)(v8 + 208) = 0u;
  }
  else
  {
    *(_QWORD *)(v8 + 216) = v10;
    v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 192));
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v20, v5, v10);
    swift_retain();
  }
  return v8;
}

uint64_t sub_229218D44()
{
  uint64_t *v0;
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
  uint64_t QueryVersionParameters;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_36();
  v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3BFB8);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_229228790;
  OUTLINED_FUNCTION_9_6();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  v9 = *v0;
  if (*v0)
  {
    v10 = OUTLINED_FUNCTION_17_5();
    v11 = v9;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    *(_QWORD *)(v5 + 56) = 0;
    *(_QWORD *)(v5 + 64) = 0;
  }
  *(_QWORD *)(v5 + 48) = v11;
  *(_QWORD *)(v5 + 72) = v10;
  *(_QWORD *)(v5 + 80) = 0xD000000000000017;
  *(_QWORD *)(v5 + 88) = 0x80000002292298B0;
  *(_BYTE *)(v5 + 96) = *((_BYTE *)v0 + 8);
  OUTLINED_FUNCTION_29_1();
  *(_QWORD *)(v5 + 120) = v13;
  *(_QWORD *)(v5 + 128) = v12;
  *(_QWORD *)(v5 + 136) = 0xE700000000000000;
  QueryVersionParameters = type metadata accessor for SystemQueryQueryVersionParameters(0);
  sub_2292194EC((uint64_t)v0 + *(int *)(QueryVersionParameters + 24), v4, &qword_255A3C848);
  v15 = OUTLINED_FUNCTION_18_2();
  if (__swift_getEnumTagSinglePayload(v4, 1, v15) == 1)
  {
    swift_retain();
    sub_22921952C(v4, &qword_255A3C848);
    *(_OWORD *)(v5 + 144) = 0u;
    *(_OWORD *)(v5 + 160) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 168) = v15;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v5 + 144));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(boxed_opaque_existential_1, v4, v15);
    swift_retain();
  }
  return v5;
}

uint64_t sub_229218EC0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  *(_BYTE *)(v3 + 128) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  *(_QWORD *)(v3 + 72) = OUTLINED_FUNCTION_0_5();
  *(_QWORD *)(v3 + 80) = type metadata accessor for SystemQueryQueryBuildParameters(0);
  *(_QWORD *)(v3 + 88) = OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229218F18()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(unint64_t, unint64_t, uint64_t);

  v2 = *(int **)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_BYTE *)(v0 + 128);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_13_2(v1);
  v4 = v1 + v2[7];
  OUTLINED_FUNCTION_13_2(v4);
  v5 = v2[5];
  *(_QWORD *)(v1 + v5) = 0;
  *(_BYTE *)(v1 + v2[6]) = v3;
  sub_229217C38();
  v6 = OUTLINED_FUNCTION_24_2();
  sub_2292194A4(v6, v4);
  sub_229217EEC();
  v7 = OUTLINED_FUNCTION_24_2();
  sub_2292194A4(v7, v1);
  OUTLINED_FUNCTION_17_5();
  OUTLINED_FUNCTION_19_4();
  v8 = OUTLINED_FUNCTION_26_1();
  swift_release();
  *(_QWORD *)(v1 + v5) = v8;
  v9 = sub_229218B0C();
  *(_QWORD *)(v0 + 96) = v9;
  v10 = (_QWORD *)OUTLINED_FUNCTION_11_4();
  *(_QWORD *)(v0 + 104) = v10;
  *v10 = v0;
  v10[1] = sub_229219034;
  return v12(0xD000000000000016, 0x8000000229229CB0, v9);
}

uint64_t sub_229219034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_4();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 120) = v0;
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_229219080()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_14_4(v1, type metadata accessor for SystemQueryQueryBuildParameters);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_2_5(*(_QWORD *)(v0 + 120), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292190C8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_14_4(v1, type metadata accessor for SystemQueryQueryBuildParameters);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22921910C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = a2;
  *(_QWORD *)(v3 + 64) = a3;
  *(_BYTE *)(v3 + 128) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  *(_QWORD *)(v3 + 72) = OUTLINED_FUNCTION_0_5();
  *(_QWORD *)(v3 + 80) = type metadata accessor for SystemQueryQueryVersionParameters(0);
  *(_QWORD *)(v3 + 88) = OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229219164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_BYTE *)(v0 + 128);
  v4 = v1 + *(int *)(*(_QWORD *)(v0 + 80) + 24);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_30_2(v4, 1);
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = v3;
  sub_229217C38();
  OUTLINED_FUNCTION_30_2(v2, 0);
  sub_2292194A4(v2, v4);
  OUTLINED_FUNCTION_17_5();
  OUTLINED_FUNCTION_19_4();
  v5 = OUTLINED_FUNCTION_26_1();
  swift_release();
  *(_QWORD *)v1 = v5;
  v6 = sub_229218D44();
  *(_QWORD *)(v0 + 96) = v6;
  v7 = (_QWORD *)OUTLINED_FUNCTION_11_4();
  *(_QWORD *)(v0 + 104) = v7;
  *v7 = v0;
  v7[1] = sub_229219264;
  return v9(0xD000000000000018, 0x8000000229229C90, v6);
}

uint64_t sub_229219264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_4();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 120) = v0;
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_2292192B0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_14_4(v1, type metadata accessor for SystemQueryQueryVersionParameters);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_2_5(*(_QWORD *)(v0 + 120), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292192F8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_14_4(v1, type metadata accessor for SystemQueryQueryVersionParameters);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22921933C(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_22921938C(a1, a2);
}

uint64_t sub_22921938C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_2292274C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_36();
  v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_36();
  sub_2292194EC(a1, v11 - v10, (uint64_t *)&unk_255A3C4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  v12 = sub_229227458();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_22921952C(a1, (uint64_t *)&unk_255A3C4D0);
  return v12;
}

uint64_t sub_229219488()
{
  return type metadata accessor for SystemQueryCATPatternsExecutor(0);
}

uint64_t type metadata accessor for SystemQueryQueryVersionParameters(uint64_t a1)
{
  return sub_229219568(a1, qword_255A3C950);
}

uint64_t sub_2292194A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2292194EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_73_0();
}

void sub_22921952C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10_5(v2);
  OUTLINED_FUNCTION_73_0();
}

uint64_t type metadata accessor for SystemQueryQueryBuildParameters(uint64_t a1)
{
  return sub_229219568(a1, (uint64_t *)&unk_255A3C8B0);
}

uint64_t sub_229219568(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_229219598(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_10_5(v2);
  OUTLINED_FUNCTION_73_0();
}

uint64_t *sub_2292195C0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_229227494();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
    v11 = a3[7];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v12, v13, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_229219714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = sub_229227494();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  v5 = a1 + *(int *)(a2 + 28);
  result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v5, v4);
  return result;
}

char *sub_2292197B8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_229227494();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  return a1;
}

char *sub_2292198E0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_229227494();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  swift_retain();
  swift_release();
  a1[a3[6]] = a2[a3[6]];
  v11 = a3[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

char *sub_229219AB0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_229227494();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v10, v11, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v6);
  }
  return a1;
}

char *sub_229219BD4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_229227494();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  swift_release();
  v11 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

uint64_t sub_229219D98()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_229219DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    OUTLINED_FUNCTION_6_6(a1, a2, v6);
  }
  else
  {
    OUTLINED_FUNCTION_5_6(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
    OUTLINED_FUNCTION_78_0();
  }
}

uint64_t sub_229219E04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_229219E10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    OUTLINED_FUNCTION_40_0(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
    OUTLINED_FUNCTION_78_0();
  }
}

void sub_229219E78()
{
  unint64_t v0;

  sub_229219EF4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_229219EF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A3C8C0)
  {
    sub_229227494();
    v0 = sub_22922765C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A3C8C0);
  }
}

uint64_t sub_229219F48(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    v5 = a1;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v6 = *(int *)(a3 + 24);
    v7 = (void *)(a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = sub_229227494();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t sub_22921A034(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_229227494();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t sub_22921A0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_229227494();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_22921A164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_229227494();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_22921A280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_229227494();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_22921A334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_229227494();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_22921A448()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22921A454(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483646)
  {
    OUTLINED_FUNCTION_5_6(*a1);
    OUTLINED_FUNCTION_78_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    OUTLINED_FUNCTION_6_6((uint64_t)a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_22921A4B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_22921A4BC(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 2147483646)
  {
    *a1 = a2;
    OUTLINED_FUNCTION_78_0();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C848);
    OUTLINED_FUNCTION_40_0((uint64_t)a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

void sub_22921A51C()
{
  unint64_t v0;

  sub_229219EF4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 112) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_3_8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_6@<X0>(unint64_t a1@<X8>)
{
  int v1;

  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  v1 = a1 - 1;
  if (v1 < 0)
    v1 = -1;
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_10_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_14_4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_229219598(v2, a2);
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return sub_2292274AC();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_229227494();
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2292086D8(v0 + 32, v1);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_2292274A0();
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t SharedObjects.init(aceServiceInvoker:deviceState:outputPublisher:)@<X0>(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2292090C8(a1, a4);
  sub_2292090C8(a2, a4 + 40);
  return sub_2292090C8(a3, a4 + 80);
}

uint64_t initializeBufferWithCopyOfBuffer for SharedObjects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharedObjects(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

_OWORD *initializeWithCopy for SharedObjects(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for SharedObjects(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for SharedObjects(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharedObjects(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SharedObjects(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharedObjects()
{
  return &type metadata for SharedObjects;
}

uint64_t sub_22921AAE4()
{
  uint64_t result;

  sub_22921AC08();
  result = sub_229227650();
  qword_255A3E6C0 = result;
  return result;
}

uint64_t sub_22921AB48()
{
  uint64_t v0;
  id v1;

  v0 = sub_2292274DC();
  __swift_allocate_value_buffer(v0, qword_255A3E6C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_255A3E6C8);
  if (qword_255A3B740 != -1)
    swift_once();
  v1 = (id)qword_255A3E6C0;
  return sub_2292274E8();
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

unint64_t sub_22921AC08()
{
  unint64_t result;

  result = qword_255A3C990;
  if (!qword_255A3C990)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A3C990);
  }
  return result;
}

uint64_t SCScreenshotFlow.on(input:)()
{
  return 1;
}

uint64_t SCScreenshotFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[26] = a1;
  v2[27] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[28] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = OUTLINED_FUNCTION_4();
  v2[32] = OUTLINED_FUNCTION_4();
  v4 = sub_2292274DC();
  v2[33] = v4;
  v2[34] = *(_QWORD *)(v4 - 8);
  v2[35] = OUTLINED_FUNCTION_4();
  v2[36] = OUTLINED_FUNCTION_4();
  v2[37] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921ACF8()
{
  uint64_t v0;
  os_log_type_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  _QWORD *v43;
  uint64_t v44[5];

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v2 = sub_229226FD8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 288);
    v4 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 272);
    v6 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    v7 = sub_2292274D0();
    v8 = sub_229227620();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_229202000, v7, v8, "SCScreenshotFlow execute | cannot screenshot on watchOS", v9, 2u);
      OUTLINED_FUNCTION_2();
    }
    v10 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 264);
    v12 = *(_QWORD *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_retain();
    sub_229227134();
    sub_229226E64();
    swift_allocObject();
    *(_QWORD *)(v0 + 200) = sub_229226E58();
    sub_22922708C();
    swift_release();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_43();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE811F0]), sel_init);
    *(_QWORD *)(v0 + 304) = v14;
    if (qword_255A3B748 != -1)
      swift_once();
    v15 = *(_QWORD *)(v0 + 296);
    v16 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 272);
    v18 = __swift_project_value_buffer(v16, (uint64_t)qword_255A3E6C8);
    *(_QWORD *)(v0 + 312) = v18;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    *(_QWORD *)(v0 + 320) = v19;
    v19(v15, v18, v16);
    v20 = v14;
    v21 = sub_2292274D0();
    v22 = sub_229227620();
    v23 = OUTLINED_FUNCTION_38_0(v22);
    v24 = *(_QWORD *)(v0 + 296);
    v25 = *(_QWORD *)(v0 + 264);
    v26 = *(_QWORD *)(v0 + 272);
    if (v23)
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_16();
      v44[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v27 = 136315138;
      v28 = v20;
      v29 = objc_msgSend(v28, sel_description);
      v30 = sub_229227524();
      v32 = v31;

      *(_QWORD *)(v0 + 192) = sub_229209A10(v30, v32, v44);
      sub_229227680();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_229202000, v21, v1, "SCScreenshotFlow execute | submitting command: %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v33(v24, v25);
    *(_QWORD *)(v0 + 328) = v33;
    v34 = *(_QWORD *)(v0 + 256);
    v35 = *(_QWORD *)(v0 + 232);
    v36 = *(_QWORD *)(v0 + 240);
    v37 = *(_QWORD *)(v0 + 224);
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    v38 = *MEMORY[0x24BE97888];
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 104);
    *(_QWORD *)(v0 + 336) = v39;
    v39(v34, v38, v35);
    *(_QWORD *)(v0 + 344) = sub_229226F90();
    v40 = *MEMORY[0x24BE970E8];
    v41 = sub_229226F54();
    *(_QWORD *)(v0 + 352) = v41;
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104);
    *(_QWORD *)(v0 + 360) = v42;
    v42(v37, v40, v41);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v41);
    OUTLINED_FUNCTION_9_7();
    sub_229226F84();
    sub_229226F48();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    sub_229226F9C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
    v43 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v43;
    sub_22921B9FC();
    *v43 = v0;
    v43[1] = sub_22921B220;
    return sub_229227128();
  }
}

uint64_t sub_22921B220(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 376) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921B280()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  sub_2292270A4();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921B2EC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (*v21)(uint64_t, _QWORD, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;

  v1 = *(void **)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  v4 = *(_QWORD *)(v0 + 280);
  v5 = *(_QWORD *)(v0 + 264);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  if (OUTLINED_FUNCTION_38_0(v9))
  {
    v10 = *(void **)(v0 + 376);
    v11 = (uint8_t *)OUTLINED_FUNCTION_16();
    v12 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 136315138;
    v29 = v12;
    *(_QWORD *)(v0 + 176) = v10;
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v14 = sub_229227530();
    *(_QWORD *)(v0 + 184) = sub_229209A10(v14, v15, &v29);
    sub_229227680();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_229202000, v8, (os_log_type_t)v5, "SCScreenshotFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  v16 = *(void **)(v0 + 376);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  v18 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 264);

  v17(v18, v19);
  v20 = *(void **)(v0 + 376);
  v22 = *(_QWORD *)(v0 + 352);
  v21 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 360);
  v23 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 336);
  v24 = *(_QWORD *)(v0 + 248);
  v26 = *(_QWORD *)(v0 + 224);
  v25 = *(_QWORD *)(v0 + 232);
  sub_229226F3C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
  v23(v24, *MEMORY[0x24BE97878], v25);
  v21(v26, *MEMORY[0x24BE97068], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(_QWORD *)(swift_allocObject() + 16) = v20;
  v27 = v20;
  OUTLINED_FUNCTION_9_7();
  sub_229226F84();
  sub_229226F48();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_2292270A4();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921B5D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921B6C4(a1);
}

uint64_t sub_22921B620(int a1, id a2)
{
  id v2;

  v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
  sub_229227530();
  return sub_229226F78();
}

uint64_t SCScreenshotFlow.execute(completion:)()
{
  type metadata accessor for SCScreenshotFlow();
  sub_22921BAD8();
  return sub_229226EF4();
}

uint64_t sub_22921B6C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921B724()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22921B784;
  return sub_2292270F8();
}

uint64_t sub_22921B784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  sub_229208758(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921B7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v4 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v5 = sub_2292270C8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  v6 = sub_2292271E8();
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v7 = MEMORY[0x24BE99088];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_229227074();
  sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  sub_229208758(v3, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SCScreenshotFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SCScreenshotFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22921B964()
{
  return SCScreenshotFlow.execute(completion:)();
}

uint64_t sub_22921B984(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCScreenshotFlow.execute()(a1);
}

uint64_t sub_22921B9D8()
{
  type metadata accessor for SCScreenshotFlow();
  return sub_229226F18();
}

unint64_t sub_22921B9FC()
{
  unint64_t result;

  result = qword_255A3C9A8;
  if (!qword_255A3C9A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_255A3C9A8);
  }
  return result;
}

uint64_t sub_22921BA38()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22921BA5C(int a1)
{
  uint64_t v1;

  return sub_22921B620(a1, *(id *)(v1 + 16));
}

uint64_t sub_22921BA64(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921B5D0(a1);
}

uint64_t type metadata accessor for SCScreenshotFlow()
{
  return objc_opt_self();
}

unint64_t sub_22921BAD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C100;
  if (!qword_255A3C100)
  {
    v1 = type metadata accessor for SCScreenshotFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCScreenshotFlow, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C100);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return swift_task_dealloc();
}

uint64_t SCTakePhotoFlow.__allocating_init(captureType:)(char a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = a1;
  return result;
}

uint64_t SCTakePhotoFlow.init(captureType:)(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return v1;
}

uint64_t SCTakePhotoFlow.on(input:)()
{
  return 1;
}

uint64_t SCTakePhotoFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[29] = a1;
  v2[30] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[31] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[32] = v3;
  v2[33] = *(_QWORD *)(v3 - 8);
  v2[34] = OUTLINED_FUNCTION_1();
  v2[35] = OUTLINED_FUNCTION_4();
  v4 = sub_2292274DC();
  v2[36] = v4;
  v2[37] = *(_QWORD *)(v4 - 8);
  v2[38] = OUTLINED_FUNCTION_1();
  v2[39] = OUTLINED_FUNCTION_4();
  v2[40] = OUTLINED_FUNCTION_4();
  v2[41] = OUTLINED_FUNCTION_4();
  v2[42] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  v2[43] = OUTLINED_FUNCTION_1();
  v2[44] = OUTLINED_FUNCTION_4();
  v2[45] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

id sub_22921BC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[5];

  v1 = *(_QWORD *)(v0 + 360);
  v2 = sub_229226E10();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  sub_2292271B8();
  v3 = *(_QWORD *)(v0 + 40);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v3);
  LOBYTE(v1) = sub_229226FD8();
  OUTLINED_FUNCTION_22_2();
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 296);
    v5 = __swift_project_value_buffer(*(_QWORD *)(v0 + 288), (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_25_1(v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    v6 = sub_2292274D0();
    v7 = sub_229227620();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_16_2(&dword_229202000, v6, v7, "SCTakePhotoFlow execute | cannot take photo on watchOS");
      OUTLINED_FUNCTION_2();
    }
    v8 = *(_QWORD *)(v0 + 360);
    v9 = *(_QWORD *)(v0 + 312);
    v10 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 296);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    swift_retain();
    sub_229227134();
    sub_229226E64();
    swift_allocObject();
    *(_QWORD *)(v0 + 224) = sub_229226E58();
    sub_22922708C();
    swift_release();
    v12 = v8;
LABEL_22:
    sub_229208758(v12, (uint64_t *)&unk_255A3C4D0);
    OUTLINED_FUNCTION_1_5();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_48();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_229226E04();
  sub_22921C78C(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360));
  result = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v14 = result;
    v15 = *(_QWORD *)(v0 + 344);
    sub_22920AFCC(*(_QWORD *)(v0 + 360), v15);
    if (__swift_getEnumTagSinglePayload(v15, 1, v2) == 1)
    {
      v16 = 0;
    }
    else
    {
      v3 = *(_QWORD *)(v0 + 344);
      v16 = (void *)sub_229226DF8();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v3, v2);
    }
    v17 = objc_msgSend(v14, sel_openSensitiveURL_withOptions_, v16, 0);

    if (v17)
    {
      if (qword_255A3B748 != -1)
        swift_once();
      v18 = *(_QWORD *)(v0 + 328);
      v20 = *(_QWORD *)(v0 + 288);
      v19 = *(_QWORD *)(v0 + 296);
      v21 = __swift_project_value_buffer(v20, (uint64_t)qword_255A3E6C8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
      v22 = sub_2292274D0();
      v23 = sub_229227620();
      if (OUTLINED_FUNCTION_38_0(v23))
      {
        v25 = *(_QWORD *)(v0 + 352);
        v24 = *(_QWORD *)(v0 + 360);
        v26 = (uint8_t *)OUTLINED_FUNCTION_16();
        v52[0] = OUTLINED_FUNCTION_16();
        *(_DWORD *)v26 = 136315138;
        swift_beginAccess();
        sub_22920AFCC(v24, v25);
        v27 = sub_229227530();
        *(_QWORD *)(v0 + 216) = sub_229209A10(v27, v28, v52);
        sub_229227680();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_229202000, v22, (os_log_type_t)v3, "SCTakePhotoFlow execute | URL was successfully opened %s", v26, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2();
      }
      v49 = *(_QWORD *)(v0 + 328);
      v50 = *(_QWORD *)(v0 + 288);
      v51 = *(_QWORD *)(v0 + 296);

      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
      OUTLINED_FUNCTION_11_5();
      v12 = (uint64_t)v22;
      goto LABEL_22;
    }
    if (qword_255A3B748 != -1)
      swift_once();
    v29 = *(_QWORD *)(v0 + 296);
    v30 = __swift_project_value_buffer(*(_QWORD *)(v0 + 288), (uint64_t)qword_255A3E6C8);
    *(_QWORD *)(v0 + 368) = v30;
    v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
    *(_QWORD *)(v0 + 376) = v31;
    OUTLINED_FUNCTION_25_1(v30, v31);
    v32 = sub_2292274D0();
    v33 = sub_229227620();
    if (os_log_type_enabled(v32, v33))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_16_2(&dword_229202000, v32, v33, "SCTakePhotoFlow execute | fallback using SAAppsLaunchApp");
      OUTLINED_FUNCTION_2();
    }
    v34 = *(_QWORD *)(v0 + 320);
    v36 = *(_QWORD *)(v0 + 288);
    v35 = *(_QWORD *)(v0 + 296);
    v37 = *(_QWORD *)(v0 + 280);
    v39 = *(_QWORD *)(v0 + 256);
    v38 = *(_QWORD *)(v0 + 264);
    v40 = *(_QWORD *)(v0 + 248);

    v41 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    *(_QWORD *)(v0 + 384) = v41;
    v41(v34, v36);
    v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81130]), sel_init);
    *(_QWORD *)(v0 + 392) = v42;
    sub_22921CC4C(0xD000000000000010, 0x8000000229229D90, v42);
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    v43 = *MEMORY[0x24BE97888];
    v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 104);
    *(_QWORD *)(v0 + 400) = v44;
    v44(v37, v43, v39);
    *(_QWORD *)(v0 + 408) = sub_229226F90();
    v45 = *MEMORY[0x24BE970E8];
    v46 = sub_229226F54();
    *(_QWORD *)(v0 + 416) = v46;
    v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 104);
    *(_QWORD *)(v0 + 424) = v47;
    v47(v40, v45, v46);
    __swift_storeEnumTagSinglePayload(v40, 0, 1, v46);
    OUTLINED_FUNCTION_10_6();
    sub_229226F84();
    sub_229226F48();
    swift_release();
    OUTLINED_FUNCTION_22_2();
    sub_229226F9C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
    v48 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 432) = v48;
    sub_22921B9FC();
    *v48 = v0;
    v48[1] = sub_22921C390;
    return (id)sub_229227128();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22921C390(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 440) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921C3F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_11_5();
  sub_229208758(v0 + 96, (uint64_t *)&unk_255A3C4D0);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921C488()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (*v21)(uint64_t, _QWORD, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD *v29;
  uint64_t v30;

  v1 = *(void **)(v0 + 440);
  v2 = *(_QWORD *)(v0 + 368);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 288);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  if (OUTLINED_FUNCTION_38_0(v9))
  {
    v10 = *(void **)(v0 + 440);
    v11 = (uint8_t *)OUTLINED_FUNCTION_16();
    v12 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 136315138;
    v30 = v12;
    *(_QWORD *)(v0 + 208) = v10;
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v14 = sub_229227530();
    *(_QWORD *)(v0 + 200) = sub_229209A10(v14, v15, &v30);
    sub_229227680();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_229202000, v8, (os_log_type_t)v5, "SCTakePhotoFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  v16 = *(void **)(v0 + 440);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
  v18 = *(_QWORD *)(v0 + 304);
  v19 = *(_QWORD *)(v0 + 288);

  v17(v18, v19);
  v20 = *(void **)(v0 + 440);
  v22 = *(_QWORD *)(v0 + 416);
  v21 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 424);
  v23 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 400);
  v24 = *(_QWORD *)(v0 + 272);
  v26 = *(_QWORD *)(v0 + 248);
  v25 = *(_QWORD *)(v0 + 256);
  sub_229226F3C();
  v29 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
  v23(v24, *MEMORY[0x24BE97878], v25);
  v21(v26, *MEMORY[0x24BE97068], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(_QWORD *)(swift_allocObject() + 16) = v20;
  v27 = v20;
  OUTLINED_FUNCTION_10_6();
  sub_229226F84();
  sub_229226F48();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  OUTLINED_FUNCTION_11_5();
  sub_229208758((uint64_t)v29, (uint64_t *)&unk_255A3C4D0);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921C78C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3C4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22921C7D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921C884(a1);
}

uint64_t SCTakePhotoFlow.execute(completion:)()
{
  type metadata accessor for SCTakePhotoFlow();
  sub_22921CD28();
  return sub_229226EF4();
}

SiriSystemCommandsIntents::CaptureType __swiftcall SCTakePhotoFlow.fetchCaptureType()()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 16);
}

uint64_t sub_22921C884(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921C8E4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22921C944;
  return sub_2292270F8();
}

uint64_t sub_22921C944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  sub_229208758(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921C9B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v4 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v5 = sub_2292270C8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  v6 = sub_2292271E8();
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v7 = MEMORY[0x24BE99088];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_229227074();
  sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  sub_229208758(v3, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SCTakePhotoFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SCTakePhotoFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22921CB20()
{
  return SCTakePhotoFlow.execute(completion:)();
}

uint64_t sub_22921CB40(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCTakePhotoFlow.execute()(a1);
}

uint64_t sub_22921CB94()
{
  type metadata accessor for SCTakePhotoFlow();
  return sub_229226F18();
}

BOOL static CaptureType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CaptureType.hash(into:)()
{
  return sub_229227764();
}

uint64_t CaptureType.hashValue.getter()
{
  sub_229227758();
  sub_229227764();
  return sub_229227770();
}

BOOL sub_22921CC30(char *a1, char *a2)
{
  return static CaptureType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_22921CC3C()
{
  return CaptureType.hashValue.getter();
}

uint64_t sub_22921CC44()
{
  return CaptureType.hash(into:)();
}

void sub_22921CC4C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_229227518();
  objc_msgSend(a3, sel_setLaunchId_, v4);

}

uint64_t sub_22921CC90()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22921CCB4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921C7D4(a1);
}

uint64_t type metadata accessor for SCTakePhotoFlow()
{
  return objc_opt_self();
}

unint64_t sub_22921CD28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C138;
  if (!qword_255A3C138)
  {
    v1 = type metadata accessor for SCTakePhotoFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCTakePhotoFlow, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C138);
  }
  return result;
}

unint64_t sub_22921CD68()
{
  unint64_t result;

  result = qword_255A3CAB8;
  if (!qword_255A3CAB8)
  {
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for CaptureType, &type metadata for CaptureType);
    atomic_store(result, (unint64_t *)&qword_255A3CAB8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CaptureType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22921CDF0 + 4 * byte_229228985[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22921CE24 + 4 * asc_229228980[v4]))();
}

uint64_t sub_22921CE24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22921CE2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22921CE34);
  return result;
}

uint64_t sub_22921CE40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22921CE48);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22921CE4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22921CE54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CaptureType()
{
  return &type metadata for CaptureType;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_2292270A4();
}

void OUTLINED_FUNCTION_16_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_25_1@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t SCLockFlow.on(input:)()
{
  return 1;
}

uint64_t SCLockFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[26] = a1;
  v2[27] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[28] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = OUTLINED_FUNCTION_4();
  v2[32] = OUTLINED_FUNCTION_4();
  v4 = sub_2292274DC();
  v2[33] = v4;
  v2[34] = *(_QWORD *)(v4 - 8);
  v2[35] = OUTLINED_FUNCTION_4();
  v2[36] = OUTLINED_FUNCTION_4();
  v2[37] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921CF88()
{
  uint64_t v0;
  os_log_type_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  _QWORD *v43;
  uint64_t v44[5];

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v2 = sub_229226FD8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v2 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 288);
    v4 = *(_QWORD *)(v0 + 264);
    v5 = *(_QWORD *)(v0 + 272);
    v6 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    v7 = sub_2292274D0();
    v8 = sub_229227620();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_229202000, v7, v8, "SCLockFlow execute | cannot lock device on watchOS", v9, 2u);
      OUTLINED_FUNCTION_2();
    }
    v10 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 264);
    v12 = *(_QWORD *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_retain();
    sub_229227134();
    sub_229226E64();
    swift_allocObject();
    *(_QWORD *)(v0 + 200) = sub_229226E58();
    sub_22922708C();
    swift_release();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_43();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE811D8]), sel_init);
    *(_QWORD *)(v0 + 304) = v14;
    if (qword_255A3B748 != -1)
      swift_once();
    v15 = *(_QWORD *)(v0 + 296);
    v16 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 272);
    v18 = __swift_project_value_buffer(v16, (uint64_t)qword_255A3E6C8);
    *(_QWORD *)(v0 + 312) = v18;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    *(_QWORD *)(v0 + 320) = v19;
    v19(v15, v18, v16);
    v20 = v14;
    v21 = sub_2292274D0();
    v22 = sub_229227620();
    v23 = OUTLINED_FUNCTION_38_0(v22);
    v24 = *(_QWORD *)(v0 + 296);
    v25 = *(_QWORD *)(v0 + 264);
    v26 = *(_QWORD *)(v0 + 272);
    if (v23)
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_16();
      v44[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v27 = 136315138;
      v28 = v20;
      v29 = objc_msgSend(v28, sel_description);
      v30 = sub_229227524();
      v32 = v31;

      *(_QWORD *)(v0 + 192) = sub_229209A10(v30, v32, v44);
      sub_229227680();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_229202000, v21, v1, "SCLockFlow execute | submitting command: %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    v33 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v33(v24, v25);
    *(_QWORD *)(v0 + 328) = v33;
    v34 = *(_QWORD *)(v0 + 256);
    v35 = *(_QWORD *)(v0 + 232);
    v36 = *(_QWORD *)(v0 + 240);
    v37 = *(_QWORD *)(v0 + 224);
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    v38 = *MEMORY[0x24BE97888];
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 104);
    *(_QWORD *)(v0 + 336) = v39;
    v39(v34, v38, v35);
    *(_QWORD *)(v0 + 344) = sub_229226F90();
    v40 = *MEMORY[0x24BE970E8];
    v41 = sub_229226F54();
    *(_QWORD *)(v0 + 352) = v41;
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104);
    *(_QWORD *)(v0 + 360) = v42;
    v42(v37, v40, v41);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v41);
    sub_229226F84();
    sub_229226F48();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    sub_229226F9C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
    v43 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v43;
    sub_22921B9FC();
    *v43 = v0;
    v43[1] = sub_22921D4B8;
    return sub_229227128();
  }
}

uint64_t sub_22921D4B8(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 376) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921D518()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (*v21)(uint64_t, _QWORD, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;

  v1 = *(void **)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  v4 = *(_QWORD *)(v0 + 280);
  v5 = *(_QWORD *)(v0 + 264);

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  if (OUTLINED_FUNCTION_38_0(v9))
  {
    v10 = *(void **)(v0 + 376);
    v11 = (uint8_t *)OUTLINED_FUNCTION_16();
    v12 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 136315138;
    v29 = v12;
    *(_QWORD *)(v0 + 176) = v10;
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v14 = sub_229227530();
    *(_QWORD *)(v0 + 184) = sub_229209A10(v14, v15, &v29);
    sub_229227680();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_229202000, v8, (os_log_type_t)v5, "SCLockFlow execute | error: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  v16 = *(void **)(v0 + 376);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  v18 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 264);

  v17(v18, v19);
  v20 = *(void **)(v0 + 376);
  v22 = *(_QWORD *)(v0 + 352);
  v21 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 360);
  v23 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 336);
  v24 = *(_QWORD *)(v0 + 248);
  v26 = *(_QWORD *)(v0 + 224);
  v25 = *(_QWORD *)(v0 + 232);
  sub_229226F3C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
  v23(v24, *MEMORY[0x24BE97878], v25);
  v21(v26, *MEMORY[0x24BE97068], v22);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v22);
  *(_QWORD *)(swift_allocObject() + 16) = v20;
  v27 = v20;
  sub_229226F84();
  sub_229226F48();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_2292270A4();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921D804(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921B6C4(a1);
}

uint64_t SCLockFlow.execute(completion:)()
{
  type metadata accessor for SCLockFlow();
  sub_22921D9F4();
  return sub_229226EF4();
}

uint64_t SCLockFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SCLockFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22921D8C4()
{
  return SCLockFlow.execute(completion:)();
}

uint64_t sub_22921D8E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCLockFlow.execute()(a1);
}

uint64_t sub_22921D938()
{
  type metadata accessor for SCLockFlow();
  return sub_229226F18();
}

uint64_t sub_22921D95C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22921D980(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921D804(a1);
}

uint64_t type metadata accessor for SCLockFlow()
{
  return objc_opt_self();
}

unint64_t sub_22921D9F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C0F8;
  if (!qword_255A3C0F8)
  {
    v1 = type metadata accessor for SCLockFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCLockFlow, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C0F8);
  }
  return result;
}

void SCStartScreenRecordingFlow.__allocating_init(confirmationRequired:)(char a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_8_0();
  *(_BYTE *)(v2 + 16) = 0;
  *(_BYTE *)(v2 + 17) = a1;
  *(_QWORD *)(v2 + 24) = sub_22921DA84;
  *(_QWORD *)(v2 + 32) = 0;
  OUTLINED_FUNCTION_73_0();
}

uint64_t SCStartScreenRecordingFlow.init(confirmationRequired:)(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 17) = a1;
  *(_QWORD *)(v1 + 24) = sub_22921DA84;
  *(_QWORD *)(v1 + 32) = 0;
  return v1;
}

void sub_22921DA84()
{
  type metadata accessor for SCStartScreenRecordingFlow();
  sub_22921DA9C();
}

void sub_22921DA9C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CE10);
  sub_229226EB8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_229227C60;
  sub_229226EAC();
  sub_229226E28();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73_0();
}

uint64_t SCStartScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCStartScreenRecordingFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[35] = a1;
  v2[36] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[37] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[38] = v3;
  v2[39] = *(_QWORD *)(v3 - 8);
  v2[40] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[41] = v4;
  v2[42] = *(_QWORD *)(v4 - 8);
  v2[43] = OUTLINED_FUNCTION_4();
  v2[44] = OUTLINED_FUNCTION_4();
  v2[45] = OUTLINED_FUNCTION_4();
  v2[46] = OUTLINED_FUNCTION_4();
  v2[47] = OUTLINED_FUNCTION_4();
  v2[48] = OUTLINED_FUNCTION_4();
  v2[49] = OUTLINED_FUNCTION_4();
  v2[50] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921DBE4()
{
  uint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  void *v14;
  os_log_type_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint8_t *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  void *v73;
  os_log_type_t v74;
  _WORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82[5];

  sub_2292271B8();
  v1 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_55_1();
  sub_229226FE4();
  v2 = OUTLINED_FUNCTION_53_2();
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      v2 = swift_once();
    OUTLINED_FUNCTION_9_8(v2, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v3 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_12_1(v3))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_3_5(&dword_229202000, v4, v5, "SCStartScreenRecordingFlow execute | cannot screen record in Carplay");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_49_1();
    OUTLINED_FUNCTION_47_2();
    OUTLINED_FUNCTION_46_2();
    OUTLINED_FUNCTION_61_1();
    OUTLINED_FUNCTION_7_2();
    *(_QWORD *)(v0 + 256) = OUTLINED_FUNCTION_14_2();
LABEL_13:
    sub_22922708C();
LABEL_14:
    swift_release();
LABEL_15:
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_48();
    return OUTLINED_FUNCTION_11_6(*(uint64_t (**)(void))(v0 + 8));
  }
  sub_2292271B8();
  v6 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  OUTLINED_FUNCTION_55_1();
  sub_229226FD8();
  v7 = OUTLINED_FUNCTION_53_2();
  if ((v6 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      v7 = swift_once();
    OUTLINED_FUNCTION_9_8(v7, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v8 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_12_1(v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_3_5(&dword_229202000, v9, v10, "SCStartScreenRecordingFlow execute | cannot screen record on watchOS");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_49_1();
    OUTLINED_FUNCTION_47_2();
    OUTLINED_FUNCTION_46_2();
    OUTLINED_FUNCTION_61_1();
    OUTLINED_FUNCTION_7_2();
    *(_QWORD *)(v0 + 272) = OUTLINED_FUNCTION_14_2();
    goto LABEL_13;
  }
  v12 = *(_QWORD *)(v0 + 288);
  v13 = *(unsigned __int8 *)(v12 + 16);
  if (v13 == 4)
  {
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE811E0]), sel_init);
    *(_QWORD *)(v0 + 424) = v23;
    if (qword_255A3B748 != -1)
      swift_once();
    v24 = *(_QWORD *)(v0 + 376);
    v25 = *(_QWORD *)(v0 + 328);
    v26 = *(_QWORD *)(v0 + 336);
    v27 = __swift_project_value_buffer(v25, (uint64_t)qword_255A3E6C8);
    *(_QWORD *)(v0 + 432) = v27;
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    *(_QWORD *)(v0 + 440) = v28;
    v28(v24, v27, v25);
    v29 = v23;
    v30 = sub_2292274D0();
    v31 = sub_229227620();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 336);
    if (v32)
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_16();
      v82[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v34 = 136315138;
      v35 = v29;
      v36 = objc_msgSend(v35, sel_description);
      v37 = sub_229227524();
      v39 = v38;

      *(_QWORD *)(v0 + 224) = sub_229209A10(v37, v39, v82);
      sub_229227680();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v30, v31, "SCStartScreenRecordingFlow execute | submitting command: %s", v34);
      OUTLINED_FUNCTION_50_2();
      OUTLINED_FUNCTION_2();
    }

    v58 = *(void (**)(uint64_t))(v33 + 8);
    v59 = OUTLINED_FUNCTION_55_1();
    v58(v59);
    *(_QWORD *)(v0 + 448) = v58;
    v61 = *(_QWORD *)(v0 + 312);
    v60 = *(_QWORD *)(v0 + 320);
    v63 = *(_QWORD *)(v0 + 296);
    v62 = *(_QWORD *)(v0 + 304);
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 200));
    *(_QWORD *)(v0 + 456) = sub_229226F90();
    v64 = *MEMORY[0x24BE97888];
    v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 104);
    *(_QWORD *)(v0 + 464) = v65;
    v65(v60, v64, v62);
    v66 = *MEMORY[0x24BE970E8];
    v67 = sub_229226F54();
    *(_QWORD *)(v0 + 472) = v67;
    v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 104);
    *(_QWORD *)(v0 + 480) = v68;
    v68(v63, v66, v67);
    OUTLINED_FUNCTION_51_2();
    __swift_storeEnumTagSinglePayload(v69, v70, v71, v67);
    sub_229226F84();
    sub_229226F48();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 176);
    sub_229226F9C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
    v72 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v72;
    sub_22921B9FC();
    *v72 = v0;
    v72[1] = sub_22921E708;
    OUTLINED_FUNCTION_43_2();
    return sub_229227128();
  }
  else if (v13 == 2)
  {
    if (*(_BYTE *)(v12 + 17) == 1)
    {
      if (qword_255A3B748 != -1)
        v7 = swift_once();
      v40 = *(void **)(v0 + 392);
      OUTLINED_FUNCTION_9_8(v7, (uint64_t)qword_255A3E6C8);
      sub_2292274D0();
      v41 = OUTLINED_FUNCTION_127();
      if (OUTLINED_FUNCTION_12_1(v41))
      {
        *(_WORD *)OUTLINED_FUNCTION_16() = 0;
        OUTLINED_FUNCTION_3_5(&dword_229202000, v42, v43, "SCStartScreenRecordingFlow execute | prompting for confirmation");
        OUTLINED_FUNCTION_2();
      }

      v44 = OUTLINED_FUNCTION_62_1();
      v45(v44);
      *(_BYTE *)(v12 + 16) = 3;
      sub_2292271B8();
      type metadata accessor for SCSystemCommandsYesNoStrategy();
      OUTLINED_FUNCTION_8_0();
      sub_229204D14((uint64_t)v82, 2);
      OUTLINED_FUNCTION_46_2();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CC90);
      OUTLINED_FUNCTION_7_2();
      sub_229220184(qword_255A3B888, 255, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227DA4);
      *(_QWORD *)(v0 + 264) = sub_229226E94();
      sub_22921FE38();
      swift_retain();
      sub_229227080();
      swift_release();
      goto LABEL_14;
    }
    if (qword_255A3B748 != -1)
      v7 = swift_once();
    v73 = *(void **)(v0 + 384);
    OUTLINED_FUNCTION_3_7(v7, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v74 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v74))
    {
      v75 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v75);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v76, v77, "SCStartScreenRecordingFlow execute | confirmation is not required, proceeding to next flow");
      OUTLINED_FUNCTION_2();
    }
    v78 = *(_QWORD *)(v0 + 384);
    v79 = *(_QWORD *)(v0 + 336);

    OUTLINED_FUNCTION_24_3(v78, *(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
    *(_BYTE *)(v12 + 16) = 4;
    v80 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v80;
    *v80 = v0;
    v80[1] = sub_22921E6A4;
    OUTLINED_FUNCTION_43_2();
    return SCStartScreenRecordingFlow.execute()(v81);
  }
  else
  {
    if (*(_BYTE *)(v12 + 16))
    {
      if (qword_255A3B748 != -1)
        swift_once();
      v46 = *(_QWORD *)(v0 + 368);
      v47 = *(_QWORD *)(v0 + 336);
      v48 = __swift_project_value_buffer(*(_QWORD *)(v0 + 328), (uint64_t)qword_255A3E6C8);
      OUTLINED_FUNCTION_26(v46, v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 16));
      swift_retain_n();
      v49 = sub_2292274D0();
      v50 = sub_229227620();
      v51 = os_log_type_enabled(v49, v50);
      v52 = *(_QWORD *)(v0 + 368);
      v53 = *(_QWORD *)(v0 + 328);
      v54 = *(_QWORD *)(v0 + 336);
      if (v51)
      {
        v55 = (uint8_t *)OUTLINED_FUNCTION_16();
        v82[0] = OUTLINED_FUNCTION_16();
        *(_DWORD *)v55 = 136315138;
        *(_BYTE *)(v0 + 504) = *(_BYTE *)(v12 + 16);
        v56 = sub_229227530();
        *(_QWORD *)(v0 + 216) = sub_229209A10(v56, v57, v82);
        sub_229227680();
        OUTLINED_FUNCTION_67_1();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_15_0(&dword_229202000, v49, v50, "SCStartScreenRecordingFlow execute | flow completed with state: %s", v55);
        OUTLINED_FUNCTION_50_2();
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_67_1();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
      sub_2292270A4();
      goto LABEL_15;
    }
    if (qword_255A3B748 != -1)
      v7 = swift_once();
    v14 = *(void **)(v0 + 400);
    OUTLINED_FUNCTION_3_7(v7, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v15 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v15))
    {
      v16 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v16);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v17, v18, "SCStartScreenRecordingFlow execute | checking if device unlock is required");
      OUTLINED_FUNCTION_2();
    }
    v19 = *(_QWORD *)(v0 + 400);
    v20 = *(_QWORD *)(v0 + 336);

    OUTLINED_FUNCTION_24_3(v19, *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v21;
    *v21 = v0;
    v21[1] = sub_22921E640;
    OUTLINED_FUNCTION_43_2();
    return sub_22921F24C(v22);
  }
}

uint64_t sub_22921E640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_45_2();
  a19 = v21;
  a20 = v22;
  a18 = v20;
  a18 = (_QWORD *)*v20;
  v23 = *v20;
  OUTLINED_FUNCTION_22_3(&a18);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_3_10(*(uint64_t (**)(void))(v23 + 8));
}

uint64_t sub_22921E6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_45_2();
  a19 = v21;
  a20 = v22;
  a18 = v20;
  a18 = (_QWORD *)*v20;
  v23 = *v20;
  OUTLINED_FUNCTION_22_3(&a18);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_3_10(*(uint64_t (**)(void))(v23 + 8));
}

uint64_t sub_22921E708(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_59();
  *v4 = *v2;
  *(_QWORD *)(v5 + 496) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921E760()
{
  uint64_t v0;

  OUTLINED_FUNCTION_45_2();

  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  sub_2292270A4();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_3_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22921E7CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  void *v18;
  void (*v19)(uint64_t, _QWORD, uint64_t);
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v32[5];

  v1 = *(void **)(v0 + 496);
  v2 = *(_QWORD *)(v0 + 432);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 440);
  v4 = *(_QWORD *)(v0 + 344);
  v5 = *(_QWORD *)(v0 + 328);

  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_2292274D0();
  v9 = sub_229227638();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 496);
    v11 = (uint8_t *)OUTLINED_FUNCTION_16();
    v12 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 136315138;
    v32[0] = v12;
    *(_QWORD *)(v0 + 240) = v10;
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v14 = sub_229227530();
    *(_QWORD *)(v0 + 248) = sub_229209A10(v14, v15, v32);
    sub_229227680();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_15_0(&dword_229202000, v8, v9, "SCStartScreenRecordingFlow execute | unable to start recording: %s", v11);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  v16 = *(void (**)(uint64_t))(v0 + 448);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_5_5();

  v17 = OUTLINED_FUNCTION_55_1();
  v16(v17);
  v18 = *(void **)(v0 + 496);
  v20 = *(_QWORD *)(v0 + 472);
  v19 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 480);
  v21 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 464);
  v22 = *(_QWORD *)(v0 + 320);
  v24 = *(_QWORD *)(v0 + 296);
  v23 = *(_QWORD *)(v0 + 304);
  *(_BYTE *)(*(_QWORD *)(v0 + 288) + 16) = 7;
  sub_229226F3C();
  v25 = (_QWORD *)OUTLINED_FUNCTION_62_1();
  __swift_project_boxed_opaque_existential_1(v25, v26);
  v21(v22, *MEMORY[0x24BE97878], v23);
  v19(v24, *MEMORY[0x24BE97068], v20);
  OUTLINED_FUNCTION_51_2();
  __swift_storeEnumTagSinglePayload(v27, v28, v29, v20);
  *(_QWORD *)(OUTLINED_FUNCTION_8_0() + 16) = v18;
  v30 = v18;
  sub_229226F84();
  sub_229226F48();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_retain();
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v0 + 232) = sub_229226E58();
  sub_22922708C();
  OUTLINED_FUNCTION_5_5();
  swift_release();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_11_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22921EB1C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_22921F7D0(a1);
}

uint64_t sub_22921EB6C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22921F7D0(a1);
}

uint64_t sub_22921EBBC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_22921FA0C(a1);
}

uint64_t SCStartScreenRecordingFlow.execute(completion:)()
{
  uint64_t v0;

  type metadata accessor for SCStartScreenRecordingFlow();
  sub_229220184(&qword_255A3C130, v0, (uint64_t (*)(uint64_t))type metadata accessor for SCStartScreenRecordingFlow, (uint64_t)&protocol conformance descriptor for SCStartScreenRecordingFlow);
  return sub_229226EF4();
}

void sub_22921EC7C(uint64_t a1)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
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
  void (*v33)(char *, _QWORD, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int EnumTagSinglePayload;
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
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  char v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v83 = a1;
  v1 = sub_22922711C();
  v81 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_36();
  v75 = v3 - v2;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CDF8);
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_12();
  v78 = v4;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v70 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9D0);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12();
  v74 = v9;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v10);
  v79 = (char *)&v70 - v11;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v12);
  v77 = (char *)&v70 - v13;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v14);
  v76 = (uint64_t)&v70 - v15;
  OUTLINED_FUNCTION_17();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v70 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v70 - v20;
  v22 = sub_229227164();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_36();
  v26 = v25 - v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CE00);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_36();
  v31 = v30 - v29;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v30 - v29, v83, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v28 + 88))(v31, v27) != *MEMORY[0x24BE97938])
  {
    *(_BYTE *)(v82 + 16) = 6;
    OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
    return;
  }
  OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 96));
  v83 = v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v26, v31, v22);
  v73 = v26;
  sub_229227158();
  v32 = v81;
  v33 = *(void (**)(char *, _QWORD, uint64_t))(v81 + 104);
  v33(v19, *MEMORY[0x24BE98400], v1);
  OUTLINED_FUNCTION_51_2();
  __swift_storeEnumTagSinglePayload(v34, v35, v36, v1);
  v37 = v80;
  v38 = (uint64_t)&v7[*(int *)(v80 + 48)];
  sub_229220104((uint64_t)v21, (uint64_t)v7);
  sub_229220104((uint64_t)v19, v38);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v1);
  v40 = v1;
  v41 = v37;
  v42 = (uint64_t)v21;
  v72 = v22;
  if (EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_28_0((uint64_t)v19);
    OUTLINED_FUNCTION_28_0((uint64_t)v21);
    OUTLINED_FUNCTION_12_4(v38);
    v43 = v83;
    if (!v59)
      goto LABEL_10;
    sub_22922014C((uint64_t)v7, &qword_255A3B9D0);
    v44 = v82;
    goto LABEL_21;
  }
  v45 = v76;
  sub_229220104((uint64_t)v7, v76);
  OUTLINED_FUNCTION_12_4(v38);
  if (v59)
  {
    OUTLINED_FUNCTION_28_0((uint64_t)v19);
    OUTLINED_FUNCTION_28_0(v42);
    OUTLINED_FUNCTION_24_3(v45, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
LABEL_10:
    sub_22922014C((uint64_t)v7, &qword_255A3CDF8);
    v44 = v82;
    goto LABEL_11;
  }
  v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 32);
  v70 = v42;
  v71 = v7;
  v61 = v75;
  OUTLINED_FUNCTION_26(v75, v38, v60);
  sub_229220184(&qword_255A3CE08, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE98408], MEMORY[0x24BE98418]);
  v62 = OUTLINED_FUNCTION_63_1();
  v63 = v45;
  v64 = v32;
  v65 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v65(v61, v40);
  OUTLINED_FUNCTION_33_1((uint64_t)v19);
  OUTLINED_FUNCTION_33_1(v70);
  v65(v63, v40);
  v32 = v64;
  OUTLINED_FUNCTION_33_1((uint64_t)v71);
  v44 = v82;
  v43 = v83;
  if ((v62 & 1) != 0)
  {
LABEL_21:
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v73, v72);
    v66 = 4;
LABEL_24:
    *(_BYTE *)(v44 + 16) = v66;
    return;
  }
LABEL_11:
  v46 = (uint64_t)v77;
  v47 = v73;
  sub_229227158();
  v48 = (uint64_t)v79;
  v33(v79, *MEMORY[0x24BE983F8], v40);
  OUTLINED_FUNCTION_51_2();
  __swift_storeEnumTagSinglePayload(v49, v50, v51, v40);
  v52 = *(int *)(v41 + 48);
  v53 = v78;
  v54 = v78 + v52;
  sub_229220104(v46, v78);
  sub_229220104(v48, v54);
  OUTLINED_FUNCTION_12_4(v53);
  if (v59)
  {
    v55 = OUTLINED_FUNCTION_62_1();
    sub_22922014C(v55, v56);
    sub_22922014C(v46, &qword_255A3B9D0);
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v47, v72);
    v57 = OUTLINED_FUNCTION_12_4(v54);
    if (v59)
    {
      OUTLINED_FUNCTION_68_1(v57, &qword_255A3B9D0);
LABEL_23:
      v66 = 5;
      goto LABEL_24;
    }
LABEL_19:
    OUTLINED_FUNCTION_68_1(v57, &qword_255A3CDF8);
    return;
  }
  v58 = v74;
  sub_229220104(v53, v74);
  OUTLINED_FUNCTION_12_4(v54);
  if (v59)
  {
    OUTLINED_FUNCTION_28_0((uint64_t)v79);
    OUTLINED_FUNCTION_28_0(v46);
    OUTLINED_FUNCTION_34_2();
    v57 = OUTLINED_FUNCTION_24_3(v58, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    goto LABEL_19;
  }
  v67 = v75;
  OUTLINED_FUNCTION_26(v75, v54, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 32));
  sub_229220184(&qword_255A3CE08, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE98408], MEMORY[0x24BE98418]);
  OUTLINED_FUNCTION_62_1();
  LODWORD(v82) = OUTLINED_FUNCTION_63_1();
  v68 = v46;
  v69 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v69(v67, v40);
  OUTLINED_FUNCTION_33_1((uint64_t)v79);
  OUTLINED_FUNCTION_33_1(v68);
  OUTLINED_FUNCTION_34_2();
  v69(v58, v40);
  OUTLINED_FUNCTION_33_1(v53);
  if ((v82 & 1) != 0)
    goto LABEL_23;
}

uint64_t sub_22921F24C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_2292274DC();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = OUTLINED_FUNCTION_4();
  v2[8] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921F2A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  os_log_type_t v13;
  _WORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = sub_22921F718();
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      v1 = swift_once();
    v2 = *(void **)(v0 + 64);
    OUTLINED_FUNCTION_3_7(v1, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v3 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v3))
    {
      v4 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v4);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v5, v6, "SCStartScreenRecordingFlow handleUnlockCheck | unlock is required, waiting for device to be unlocked");
      OUTLINED_FUNCTION_2();
    }
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 32);

    v10 = OUTLINED_FUNCTION_24_3(v7, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    *(_BYTE *)(v9 + 16) = 1;
    *(_QWORD *)(v0 + 16) = (*(uint64_t (**)(uint64_t))(v9 + 24))(v10);
    sub_229226EA0();
    swift_retain();
    sub_229227080();
    swift_release();
    swift_release();
    swift_task_dealloc();
    OUTLINED_FUNCTION_81();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_255A3B748 != -1)
      v1 = swift_once();
    v12 = *(void **)(v0 + 56);
    OUTLINED_FUNCTION_3_7(v1, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v13 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v13))
    {
      v14 = (_WORD *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_54(v14);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v15, v16, "SCStartScreenRecordingFlow handleUnlockCheck | unlock is not required, proceeding to next flow");
      OUTLINED_FUNCTION_2();
    }
    v18 = *(_QWORD *)(v0 + 48);
    v17 = *(_QWORD *)(v0 + 56);
    v19 = *(_QWORD *)(v0 + 32);

    OUTLINED_FUNCTION_24_3(v17, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    *(_BYTE *)(v19 + 16) = 2;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v20;
    *v20 = v0;
    v20[1] = sub_22921F4AC;
    return SCStartScreenRecordingFlow.execute()(*(_QWORD *)(v0 + 24));
  }
}

uint64_t sub_22921F4AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_22_3(&v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22921F4F0(_BYTE *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  char v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t result;
  uint64_t v19;

  v4 = sub_2292274DC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  if (*a1 == 1)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_2292274D0();
    v13 = sub_229227620();
    if (!os_log_type_enabled(v12, v13))
    {
      v15 = 7;
      goto LABEL_13;
    }
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_229202000, v12, v13, "SCStartScreenRecordingFlow processDeviceUnlockResult | unable to unlock device due to error", v14, 2u);
    v15 = 7;
  }
  else
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    v12 = sub_2292274D0();
    v17 = sub_229227620();
    v15 = 2;
    if (!os_log_type_enabled(v12, v17))
    {
      v10 = v8;
      goto LABEL_13;
    }
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_229202000, v12, v17, "SCStartScreenRecordingFlow processDeviceUnlockResult | unlocked device, authenticated", v14, 2u);
    v10 = v8;
  }
  MEMORY[0x22E2C5D5C](v14, -1, -1);
LABEL_13:

  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(_BYTE *)(a2 + 16) = v15;
  return result;
}

BOOL sub_22921F718()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[4];

  v0 = sub_229227110();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_36();
  v4 = v3 - v2;
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_229227104();
  v5 = sub_229226FA8();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return (v5 & 1) == 0;
}

uint64_t sub_22921F7D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921F830()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22921F890;
  return sub_2292270F8();
}

uint64_t sub_22921F890()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_59();
  *v2 = *v1;
  *(_QWORD *)(v3 + 224) = v0;
  v4 = swift_task_dealloc();
  OUTLINED_FUNCTION_58_1(v4, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22921F8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v9 = *(_QWORD *)(v0 + 192);
  v3 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v4 = OUTLINED_FUNCTION_54_1();
  v5 = OUTLINED_FUNCTION_8_3(v4);
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v6 = MEMORY[0x24BE99088];
  v3[3] = v5;
  v3[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_19_5();
  sub_22922014C(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  OUTLINED_FUNCTION_58_1(v7, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921FA0C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[18] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = OUTLINED_FUNCTION_7();
  sub_2292274C4();
  v1[22] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921FA80()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for ScreenRecordingCATs();
  sub_2292274B8();
  sub_22922744C();
  sub_2292271B8();
  sub_229227440();
  *(_QWORD *)(v0 + 184) = sub_229227470();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_22921FB20;
  return sub_229220E40();
}

uint64_t sub_22921FB20()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_59();
  *v2 = *v1;
  *(_QWORD *)(v3 + 200) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22921FB70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 152);
  v2 = *(uint64_t **)(v0 + 136);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  sub_229226FB4();
  v3 = OUTLINED_FUNCTION_54_1();
  v4 = OUTLINED_FUNCTION_8_3(v3);
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  v5 = MEMORY[0x24BE99088];
  v2[3] = v4;
  v2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v2);
  OUTLINED_FUNCTION_19_5();
  v6 = swift_release();
  OUTLINED_FUNCTION_68_1(v6, (uint64_t *)&unk_255A3B9F0);
  OUTLINED_FUNCTION_58_1(v7, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22921FCA0()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SCStartScreenRecordingFlow.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t SCStartScreenRecordingFlow.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22921FD30()
{
  return SCStartScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_22921FD50(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return SCStartScreenRecordingFlow.execute()(a1);
}

uint64_t sub_22921FDA4()
{
  type metadata accessor for SCStartScreenRecordingFlow();
  return sub_229226F18();
}

uint64_t sub_22921FDC8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22921FDEC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_22921EBBC(v2);
}

unint64_t sub_22921FE38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3CC98;
  if (!qword_255A3CC98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A3CC90);
    result = MEMORY[0x22E2C5CD8](MEMORY[0x24BE96660], v1);
    atomic_store(result, &qword_255A3CC98);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C5CCC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22921FEC0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_22921EB6C(v2);
}

uint64_t sub_22921FF08()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_22921EB1C(v2);
}

uint64_t type metadata accessor for SCStartScreenRecordingFlow()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for SCStartScreenRecordingFlow.State(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SCStartScreenRecordingFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229220044 + 4 * byte_229228B35[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_229220078 + 4 * asc_229228B30[v4]))();
}

uint64_t sub_229220078(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229220080(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229220088);
  return result;
}

uint64_t sub_229220094(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22922009CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2292200A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2292200A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCStartScreenRecordingFlow.State()
{
  return &type metadata for SCStartScreenRecordingFlow.State;
}

unint64_t sub_2292200C8()
{
  unint64_t result;

  result = qword_255A3CDF0;
  if (!qword_255A3CDF0)
  {
    result = MEMORY[0x22E2C5CD8](&unk_229228C34, &type metadata for SCStartScreenRecordingFlow.State);
    atomic_store(result, (unint64_t *)&qword_255A3CDF0);
  }
  return result;
}

uint64_t sub_229220104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22922014C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_73_0();
}

void sub_229220184(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x22E2C5CD8](a4, v6), a1);
  }
  OUTLINED_FUNCTION_73_0();
}

uint64_t sub_2292201C0(_BYTE *a1)
{
  uint64_t v1;

  return sub_22921F4F0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_3_10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_9_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v3, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
}

uint64_t OUTLINED_FUNCTION_11_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return sub_229227074();
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_22_3@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_24_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  uint64_t *v1;

  sub_22922014C(a1, v1);
}

void OUTLINED_FUNCTION_33_1(uint64_t a1)
{
  uint64_t *v1;

  sub_22922014C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 88) + 8))(*(_QWORD *)(v1 - 168), v0);
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return sub_229227134();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 16) = 7;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_54_1()
{
  return sub_2292270C8();
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_56_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_58_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22922014C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return sub_229226E64();
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_63_1()
{
  return sub_22922750C();
}

void OUTLINED_FUNCTION_65_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_67_1()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_68_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22922014C(v2, a2);
}

uint64_t SCGuestModeFlow.on(input:)()
{
  return 1;
}

uint64_t SCGuestModeFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v3 = sub_2292274DC();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229220414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16[5];

  if (qword_255A3B748 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain();
  v5 = sub_2292274D0();
  v6 = sub_229227620();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 40);
  v10 = *(_QWORD *)(v0 + 48);
  if (v7)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    v13 = *(_QWORD *)(v11 + 16);
    v14 = *(_QWORD *)(v11 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 24) = sub_229209A10(v13, v14, v16);
    sub_229227680();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_229202000, v5, v6, "#GUM %s execute | guest mode is only on visionOS", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_retain();
  sub_229227134();
  sub_229226E64();
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_229226E58();
  sub_22922708C();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22922066C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_229220768(a1);
}

uint64_t sub_2292206BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_22922066C(a1);
}

uint64_t SCGuestModeFlow.execute(completion:)()
{
  type metadata accessor for SCGuestModeFlow();
  sub_229220BD8();
  return sub_229226EF4();
}

uint64_t sub_229220768(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292207CC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22922082C;
  return sub_2292270F8();
}

uint64_t sub_22922082C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  sub_229208758(v2, (uint64_t *)&unk_255A3C4C0);
  return swift_task_switch();
}

uint64_t sub_2292208A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v4 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v5 = sub_2292270C8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  v6 = sub_2292271E8();
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v7 = MEMORY[0x24BE99088];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_229227074();
  sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  sub_229208758(v3, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229220A08()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t SCGuestModeFlow.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return v0;
}

uint64_t SCGuestModeFlow.__deallocating_deinit()
{
  SCGuestModeFlow.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_229220A8C()
{
  return SCGuestModeFlow.execute(completion:)();
}

uint64_t sub_229220AAC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCGuestModeFlow.execute()(a1);
}

uint64_t sub_229220B00()
{
  type metadata accessor for SCGuestModeFlow();
  return sub_229226F18();
}

BOOL static RequestType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t RequestType.hash(into:)()
{
  return sub_229227764();
}

uint64_t RequestType.hashValue.getter()
{
  sub_229227758();
  sub_229227764();
  return sub_229227770();
}

BOOL sub_229220B9C(char *a1, char *a2)
{
  return static RequestType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_229220BA8()
{
  return RequestType.hashValue.getter();
}

uint64_t sub_229220BB0()
{
  return RequestType.hash(into:)();
}

uint64_t type metadata accessor for SCGuestModeFlow()
{
  return objc_opt_self();
}

unint64_t sub_229220BD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3CE30[0];
  if (!qword_255A3CE30[0])
  {
    v1 = type metadata accessor for SCGuestModeFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCGuestModeFlow, v1);
    atomic_store(result, qword_255A3CE30);
  }
  return result;
}

unint64_t sub_229220C18()
{
  unint64_t result;

  result = qword_255A3CE48;
  if (!qword_255A3CE48)
  {
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for RequestType, &type metadata for RequestType);
    atomic_store(result, (unint64_t *)&qword_255A3CE48);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RequestType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RequestType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229220D28 + 4 * byte_229228C65[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_229220D5C + 4 * byte_229228C60[v4]))();
}

uint64_t sub_229220D5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229220D64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229220D6CLL);
  return result;
}

uint64_t sub_229220D78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229220D80);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_229220D84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229220D8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RequestType()
{
  return &type metadata for RequestType;
}

uint64_t type metadata accessor for ScreenRecordingCATs()
{
  uint64_t result;

  result = qword_255A3CF38;
  if (!qword_255A3CF38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_229220DE0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_229220E1C()
{
  return sub_229227464();
}

uint64_t sub_229220E40()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = OUTLINED_FUNCTION_2_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_4_6(v1);
  *v2 = v0;
  v2[1] = sub_22920B054;
  OUTLINED_FUNCTION_3_11();
  v3 = OUTLINED_FUNCTION_2_6();
  return OUTLINED_FUNCTION_1_0(v3, v4, v5, v6, v7);
}

uint64_t sub_229220E98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(void);

  v3 = OUTLINED_FUNCTION_2_0();
  v4 = (_QWORD *)OUTLINED_FUNCTION_4_6(v3);
  *v4 = v1;
  v4[1] = sub_22920B054;
  OUTLINED_FUNCTION_3_11();
  return OUTLINED_FUNCTION_1_0(a1, 0xD00000000000002FLL, v5, MEMORY[0x24BEE4AF8], v7);
}

uint64_t sub_229220F00()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = OUTLINED_FUNCTION_2_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_4_6(v1);
  *v2 = v0;
  v2[1] = sub_22920B054;
  OUTLINED_FUNCTION_3_11();
  v3 = OUTLINED_FUNCTION_2_6();
  return OUTLINED_FUNCTION_1_0(v3, v4, v5, v6, v7);
}

uint64_t sub_229220F58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(void);

  v3 = OUTLINED_FUNCTION_2_0();
  v4 = (_QWORD *)OUTLINED_FUNCTION_4_6(v3);
  *v4 = v1;
  v4[1] = sub_22920ADA0;
  OUTLINED_FUNCTION_3_11();
  return OUTLINED_FUNCTION_1_0(a1, 0xD000000000000029, v5, MEMORY[0x24BEE4AF8], v7);
}

uint64_t sub_229220FC0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = OUTLINED_FUNCTION_2_0();
  v2 = (_QWORD *)OUTLINED_FUNCTION_4_6(v1);
  *v2 = v0;
  v2[1] = sub_22920B054;
  OUTLINED_FUNCTION_3_11();
  v3 = OUTLINED_FUNCTION_2_6();
  return OUTLINED_FUNCTION_1_0(v3, v4, v5, v6, v7);
}

uint64_t sub_229221018()
{
  return type metadata accessor for ScreenRecordingCATs();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

id sub_229221050(uint64_t a1)
{
  return sub_229221070(a1);
}

id sub_229221070(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_shutdownWithOptions_, a1);
}

void sub_229221084()
{
  type metadata accessor for SCRestartShutdownFlow();
  sub_22921DA9C();
}

uint64_t SCRestartShutdownFlow.on(input:)()
{
  return 1;
}

uint64_t SCRestartShutdownFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[15] = a1;
  v2[16] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[17] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = OUTLINED_FUNCTION_7();
  v4 = OUTLINED_FUNCTION_98();
  v2[21] = v4;
  v2[22] = *(_QWORD *)(v4 - 8);
  v2[23] = OUTLINED_FUNCTION_4();
  v2[24] = OUTLINED_FUNCTION_4();
  v2[25] = OUTLINED_FUNCTION_4();
  v2[26] = OUTLINED_FUNCTION_4();
  v2[27] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229221148()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  os_log_type_t v13;
  _WORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint8_t *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[5];

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v1 = sub_229226FE4();
  v2 = __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 176);
    v3 = *(NSObject **)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = __swift_project_value_buffer(v5, (uint64_t)qword_255A3E6C8);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    sub_2292274D0();
    v7 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_12_1(v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_4() = 0;
      OUTLINED_FUNCTION_6_3(&dword_229202000, v3, (os_log_type_t)v5, "SCRestartShutdownFlow execute | cannot shutdown in Carplay");
      OUTLINED_FUNCTION_2();
    }
    v8 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 128);

    OUTLINED_FUNCTION_19_1(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    *(_BYTE *)(v9 + 16) = 7;
    swift_retain();
    sub_229227134();
    sub_229226E64();
    OUTLINED_FUNCTION_7_2();
    *(_QWORD *)(v0 + 112) = sub_229226E58();
    sub_22922708C();
LABEL_24:
    swift_release();
LABEL_32:
    swift_task_dealloc();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = *(_QWORD *)(v0 + 128);
  v11 = *(unsigned __int8 *)(v10 + 16);
  if (v11 == 4)
  {
    if (qword_255A3B748 != -1)
    {
      swift_once();
      v10 = *(_QWORD *)(v0 + 128);
    }
    v19 = *(NSObject **)(v0 + 200);
    v21 = *(_QWORD *)(v0 + 168);
    v20 = *(_QWORD *)(v0 + 176);
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_255A3E6C8);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
    swift_retain();
    sub_2292274D0();
    v23 = OUTLINED_FUNCTION_127();
    v24 = OUTLINED_FUNCTION_12_1(v23);
    v25 = *(_QWORD *)(v0 + 128);
    if (v24)
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_DWORD *)v26 = 67109120;
      *(_DWORD *)(v0 + 232) = *(unsigned __int8 *)(v25 + 17);
      OUTLINED_FUNCTION_49_2();
      sub_229227680();
      swift_release();
      _os_log_impl(&dword_229202000, v19, (os_log_type_t)v10, "SCRestartShutdownFlow execute | isShutdownOnly: %{BOOL}d", v26, 8u);
      OUTLINED_FUNCTION_2();
    }
    swift_release();

    v50 = *(_QWORD *)(v0 + 152);
    v51 = *(_QWORD *)(v0 + 160);
    v52 = *(_QWORD *)(v0 + 136);
    v53 = *(_QWORD *)(v0 + 144);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 168));
    sub_229221A84(40000000000000000, 0);
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v50 + 104))(v51, *MEMORY[0x24BE97888], v53);
    sub_229226F90();
    v54 = *MEMORY[0x24BE970E8];
    v55 = sub_229226F54();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(v52, v54, v55);
    __swift_storeEnumTagSinglePayload(v52, 0, 1, v55);
    OUTLINED_FUNCTION_20_3();
    sub_229226F84();
    sub_229226F48();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    goto LABEL_31;
  }
  if (v11 == 2)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v27 = *(NSObject **)(v0 + 208);
    v28 = *(_QWORD *)(v0 + 168);
    v29 = *(_QWORD *)(v0 + 176);
    v30 = __swift_project_value_buffer(v28, (uint64_t)qword_255A3E6C8);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v29 + 16))(v27, v30, v28);
    sub_2292274D0();
    v31 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v31))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_4() = 0;
      OUTLINED_FUNCTION_6_3(&dword_229202000, v27, (os_log_type_t)v28, "SCRestartShutdownFlow execute | prompting for confirmation");
      OUTLINED_FUNCTION_2();
    }
    v32 = *(_QWORD *)(v0 + 208);
    v33 = *(_QWORD *)(v0 + 168);
    v34 = *(_QWORD *)(v0 + 176);
    v35 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
    *(_BYTE *)(v10 + 16) = 3;
    sub_2292271B8();
    v36 = *(_BYTE *)(v35 + 17);
    type metadata accessor for SCSystemCommandsYesNoStrategy();
    swift_allocObject();
    sub_229204D14((uint64_t)v56, v36);
    sub_229227134();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CC90);
    OUTLINED_FUNCTION_7_2();
    sub_229220184(qword_255A3B888, 255, (uint64_t (*)(uint64_t))type metadata accessor for SCSystemCommandsYesNoStrategy, (uint64_t)&unk_229227DA4);
    *(_QWORD *)(v0 + 104) = sub_229226E94();
    sub_22921FE38();
    OUTLINED_FUNCTION_48_1();
    sub_229227080();
    swift_release();
    goto LABEL_24;
  }
  if (*(_BYTE *)(v10 + 16))
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v37 = *(_QWORD *)(v0 + 192);
    v38 = *(_QWORD *)(v0 + 168);
    v39 = *(_QWORD *)(v0 + 176);
    v40 = __swift_project_value_buffer(v38, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v37, v40, v38);
    swift_retain_n();
    v41 = sub_2292274D0();
    v42 = sub_229227620();
    v43 = os_log_type_enabled(v41, v42);
    v44 = *(_QWORD *)(v0 + 192);
    v45 = *(_QWORD *)(v0 + 168);
    v46 = *(_QWORD *)(v0 + 176);
    if (v43)
    {
      v47 = (uint8_t *)OUTLINED_FUNCTION_16();
      v56[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v47 = 136315138;
      *(_BYTE *)(v0 + 236) = *(_BYTE *)(v10 + 16);
      v48 = sub_229227530();
      *(_QWORD *)(v0 + 96) = sub_229209A10(v48, v49, v56);
      sub_229227680();
      OUTLINED_FUNCTION_45_3();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_229202000, v41, v42, "SCRestartShutdownFlow execute | flow completed with state: %s", v47, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_45_3();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v45);
LABEL_31:
    sub_2292270A4();
    goto LABEL_32;
  }
  if (qword_255A3B748 != -1)
    v2 = swift_once();
  v12 = *(void **)(v0 + 216);
  OUTLINED_FUNCTION_3_7(v2, (uint64_t)qword_255A3E6C8);
  sub_2292274D0();
  v13 = OUTLINED_FUNCTION_127();
  if (OUTLINED_FUNCTION_14_1(v13))
  {
    v14 = (_WORD *)OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_54(v14);
    OUTLINED_FUNCTION_9_2(&dword_229202000, v15, v16, "SCRestartShutdownFlow execute | checking if device unlock is required");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_10_7();
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v17;
  *v17 = v0;
  v17[1] = sub_229221948;
  return sub_229222920(*(_QWORD *)(v0 + 120));
}

uint64_t sub_229221948()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_22_3(&v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_14_5(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2292219C4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_229222FEC(a1);
}

uint64_t SCRestartShutdownFlow.execute(completion:)()
{
  uint64_t v0;

  type metadata accessor for SCRestartShutdownFlow();
  sub_229220184(&qword_255A3C118, v0, (uint64_t (*)(uint64_t))type metadata accessor for SCRestartShutdownFlow, (uint64_t)&protocol conformance descriptor for SCRestartShutdownFlow);
  return sub_229226EF4();
}

void sub_229221A84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;

  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D230);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9_3();
  v8 = OUTLINED_FUNCTION_98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_36();
  v12 = (v11 - v10);
  sub_229223940();
  v13 = sub_229221D64();
  objc_msgSend(v13, sel_setRebootType_, (*(_BYTE *)(v4 + 17) & 1) == 0);
  objc_msgSend(v13, sel_setSource_, 1);
  if (qword_255A3B748 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_255A3E6C8);
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v9 + 16))(v12, v14, v8);
  v15 = v13;
  sub_2292274D0();
  v16 = OUTLINED_FUNCTION_127();
  if (os_log_type_enabled(v12, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_16();
    v18 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v17 = 138412290;
    v19 = v15;
    sub_229227680();
    *v18 = v15;

    _os_log_impl(&dword_229202000, v12, v16, "SCRestartShutdownFlow execute | submitting shutdown command with: %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D118);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  (*(void (**)(NSObject *, uint64_t))(v9 + 8))(v12, v8);
  sub_2292275D8();
  v20 = sub_2292275F0();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = a1;
  v21[5] = a2;
  v21[6] = v4;
  v21[7] = v15;
  v22 = v15;
  swift_retain();
  sub_2292220B8(v3, (uint64_t)&unk_255A3D110, (uint64_t)v21);
  swift_release();

  sub_22922014C(v3, &qword_255A3D230);
  OUTLINED_FUNCTION_4_2();
}

id sub_229221D64()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_229227518();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithReason_, v1);

  return v2;
}

uint64_t sub_229221DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v8 = sub_2292274DC();
  v7[6] = v8;
  v7[7] = *(_QWORD *)(v8 - 8);
  v7[8] = swift_task_alloc();
  v9 = sub_2292276E0();
  v7[9] = v9;
  v7[10] = *(_QWORD *)(v9 - 8);
  v7[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_229221E60()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_229227794();
  if ((sub_229227788() & 1) != 0)
  {
    sub_2292276D4();
    v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_255A3D130 + dword_255A3D130);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v2;
    *v2 = v0;
    v2[1] = sub_229221F94;
    return v9(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0, 0, 1);
  }
  else
  {
    v4 = OUTLINED_FUNCTION_12_5();
    if (qword_255A3B748 != -1)
      v4 = swift_once();
    OUTLINED_FUNCTION_3_7(v4, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v5 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v5))
    {
      v6 = (_WORD *)OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_54(v6);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v7, v8, "SCRestartShutdownFlow execute | submitted command");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_38_1();
    OUTLINED_FUNCTION_19_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    return OUTLINED_FUNCTION_15_3(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_229221F94()
{
  void *v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  OUTLINED_FUNCTION_22_3(&v3);
  if (v0)

  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_29_2();
}

uint64_t sub_229222008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = OUTLINED_FUNCTION_12_5();
  if (qword_255A3B748 != -1)
    v2 = swift_once();
  OUTLINED_FUNCTION_3_7(v2, (uint64_t)qword_255A3E6C8);
  sub_2292274D0();
  v3 = OUTLINED_FUNCTION_127();
  if (OUTLINED_FUNCTION_14_1(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_54(v4);
    OUTLINED_FUNCTION_9_2(&dword_229202000, v5, v6, "SCRestartShutdownFlow execute | submitted command");
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_19_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_15_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292220B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_22922335C(a1, 0, 0, 0, 1, 0, 0);
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2292275CC();
    swift_unknownObjectRelease();
  }
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_task_create();
}

void sub_2292221B8(uint64_t a1)
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
  _BYTE *v11;
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
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
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
  unsigned int (*v37)(uint64_t);
  uint64_t v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_BYTE *, _QWORD, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  _BYTE *v54;
  char v55;
  _BYTE *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char v71;
  void (*v72)(uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[12];
  int v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(_BYTE *, _QWORD, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[4];

  v98 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_22_4();
  v88 = v2;
  v3 = sub_229227014();
  v85 = *(_QWORD *)(v3 - 8);
  v86 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_22_4();
  v87 = v4;
  v96 = sub_22922711C();
  v5 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  OUTLINED_FUNCTION_22_4();
  v90 = v6;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CDF8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_12();
  v92 = v8;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v77[-v10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9D0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_12();
  v89 = v13;
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v14);
  v93 = &v77[-v15];
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v16);
  v94 = &v77[-v17];
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v18);
  v91 = &v77[-v19];
  OUTLINED_FUNCTION_17();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = &v77[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v77[-v24];
  v26 = sub_229227164();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_36();
  v30 = v29 - v28;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3CE00);
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_36();
  v35 = v34 - v33;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v34 - v33, v98, v31);
  v36 = OUTLINED_FUNCTION_49_2();
  if (v37(v36) != *MEMORY[0x24BE97938])
  {
    *(_BYTE *)(v97 + 16) = 6;
    v51 = OUTLINED_FUNCTION_49_2();
LABEL_26:
    v53(v51, v52);
    goto LABEL_27;
  }
  v38 = OUTLINED_FUNCTION_49_2();
  v39(v38);
  v40 = v35;
  v41 = v26;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v30, v40, v26);
  v98 = v30;
  sub_229227158();
  v42 = *MEMORY[0x24BE98400];
  v84 = v5;
  v43 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104);
  v44 = v96;
  v83 = v43;
  v43(v23, v42, v96);
  OUTLINED_FUNCTION_39_2((uint64_t)v23);
  v45 = v95;
  v46 = (uint64_t)&v11[*(int *)(v95 + 48)];
  sub_2292194EC((uint64_t)v25, (uint64_t)v11, &qword_255A3B9D0);
  sub_2292194EC((uint64_t)v23, v46, &qword_255A3B9D0);
  OUTLINED_FUNCTION_7_5((uint64_t)v11);
  v47 = v27;
  if (!v55)
  {
    v80 = v25;
    v54 = v91;
    sub_2292194EC((uint64_t)v11, (uint64_t)v91, &qword_255A3B9D0);
    OUTLINED_FUNCTION_7_5(v46);
    if (!v55)
    {
      v63 = v84;
      v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 32);
      v79 = v11;
      v65 = v90;
      v64(v90, v46, v44);
      OUTLINED_FUNCTION_33_2(&qword_255A3CE08, v66, (uint64_t (*)(uint64_t))MEMORY[0x24BE98408], MEMORY[0x24BE98418]);
      v78 = OUTLINED_FUNCTION_43_3();
      v67 = v47;
      v68 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
      v68(v65, v44);
      OUTLINED_FUNCTION_25_2((uint64_t)v23);
      OUTLINED_FUNCTION_25_2((uint64_t)v80);
      v68((uint64_t)v54, v44);
      v47 = v67;
      OUTLINED_FUNCTION_25_2((uint64_t)v79);
      v50 = v97;
      v49 = v98;
      if ((v78 & 1) != 0)
        goto LABEL_22;
LABEL_12:
      v81 = v47;
      v82 = v41;
      v56 = v94;
      sub_229227158();
      v57 = v93;
      v83(v93, *MEMORY[0x24BE983F8], v44);
      OUTLINED_FUNCTION_39_2((uint64_t)v57);
      v58 = v92;
      v59 = v92 + *(int *)(v45 + 48);
      sub_2292194EC((uint64_t)v56, v92, &qword_255A3B9D0);
      sub_2292194EC((uint64_t)v57, v59, &qword_255A3B9D0);
      OUTLINED_FUNCTION_7_5(v58);
      if (v55)
      {
        OUTLINED_FUNCTION_33_1((uint64_t)v57);
        OUTLINED_FUNCTION_33_1((uint64_t)v56);
        OUTLINED_FUNCTION_7_5(v59);
        if (v55)
        {
          sub_22922014C(v58, &qword_255A3B9D0);
LABEL_24:
          *(_BYTE *)(v50 + 16) = 5;
          sub_229226F3C();
          __swift_project_boxed_opaque_existential_1(v99, v99[3]);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v85 + 104))(v87, *MEMORY[0x24BE97880], v86);
          sub_229226F90();
          v73 = v49;
          v74 = *MEMORY[0x24BE97090];
          v75 = sub_229226F54();
          v76 = v88;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 104))(v88, v74, v75);
          __swift_storeEnumTagSinglePayload(v76, 0, 1, v75);
          OUTLINED_FUNCTION_20_3();
          sub_229226F84();
          sub_229226F48();
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v73, v82);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
          goto LABEL_27;
        }
      }
      else
      {
        v60 = v89;
        sub_2292194EC(v58, v89, &qword_255A3B9D0);
        OUTLINED_FUNCTION_7_5(v59);
        v62 = v84;
        if (!v61)
        {
          v69 = v90;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 32))(v90, v59, v44);
          OUTLINED_FUNCTION_33_2(&qword_255A3CE08, v70, (uint64_t (*)(uint64_t))MEMORY[0x24BE98408], MEMORY[0x24BE98418]);
          v71 = OUTLINED_FUNCTION_43_3();
          v72 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
          v72(v69, v44);
          OUTLINED_FUNCTION_33_1((uint64_t)v93);
          OUTLINED_FUNCTION_33_1((uint64_t)v94);
          v72(v60, v44);
          OUTLINED_FUNCTION_33_1(v58);
          if ((v71 & 1) != 0)
            goto LABEL_24;
          goto LABEL_25;
        }
        sub_22922014C((uint64_t)v93, &qword_255A3B9D0);
        sub_22922014C((uint64_t)v94, &qword_255A3B9D0);
        OUTLINED_FUNCTION_42_1(v60, *(uint64_t (**)(uint64_t, uint64_t))(v62 + 8));
      }
      sub_22922014C(v58, &qword_255A3CDF8);
LABEL_25:
      v53 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
      v51 = v49;
      v52 = v82;
      goto LABEL_26;
    }
    OUTLINED_FUNCTION_33_1((uint64_t)v23);
    OUTLINED_FUNCTION_33_1((uint64_t)v80);
    v48 = OUTLINED_FUNCTION_42_1((uint64_t)v54, *(uint64_t (**)(uint64_t, uint64_t))(v84 + 8));
    v50 = v97;
    v49 = v98;
LABEL_11:
    OUTLINED_FUNCTION_41_1(v48, &qword_255A3CDF8);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_25_2((uint64_t)v23);
  OUTLINED_FUNCTION_25_2((uint64_t)v25);
  v48 = OUTLINED_FUNCTION_7_5(v46);
  v50 = v97;
  v49 = v98;
  if (!v55)
    goto LABEL_11;
  OUTLINED_FUNCTION_41_1(v48, &qword_255A3B9D0);
LABEL_22:
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, v41);
  *(_BYTE *)(v50 + 16) = 4;
LABEL_27:
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_2292228E8()
{
  return sub_229226F78();
}

uint64_t sub_229222920(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = OUTLINED_FUNCTION_98();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = OUTLINED_FUNCTION_4();
  v2[8] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229222978()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v1 = sub_229222F3C();
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      v1 = swift_once();
    v2 = *(void **)(v0 + 64);
    OUTLINED_FUNCTION_3_7(v1, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v3 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v3))
    {
      v4 = (_WORD *)OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_54(v4);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v5, v6, "SCRestartShutdownFlow handleUnlockCheck | unlock is required, waiting for device to be unlocked");
      OUTLINED_FUNCTION_2();
    }
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 40);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);

    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    *(_BYTE *)(v10 + 16) = 1;
    *(_QWORD *)(v0 + 16) = (*(uint64_t (**)(uint64_t))(v10 + 24))(v11);
    sub_229226EA0();
    OUTLINED_FUNCTION_48_1();
    sub_229227080();
    swift_release();
    swift_release();
    swift_task_dealloc();
    OUTLINED_FUNCTION_81();
    return OUTLINED_FUNCTION_14_5(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    if (qword_255A3B748 != -1)
      v1 = swift_once();
    v13 = *(void **)(v0 + 56);
    OUTLINED_FUNCTION_3_7(v1, (uint64_t)qword_255A3E6C8);
    sub_2292274D0();
    v14 = OUTLINED_FUNCTION_127();
    if (OUTLINED_FUNCTION_14_1(v14))
    {
      v15 = (_WORD *)OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_54(v15);
      OUTLINED_FUNCTION_9_2(&dword_229202000, v16, v17, "SCRestartShutdownFlow handleUnlockCheck | unlock is not required, proceeding to next flow");
      OUTLINED_FUNCTION_2();
    }
    v18 = *(_QWORD *)(v0 + 32);

    OUTLINED_FUNCTION_10_7();
    *(_BYTE *)(v18 + 16) = 2;
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v19;
    *v19 = v0;
    v19[1] = sub_22921F4AC;
    return SCRestartShutdownFlow.execute()(*(_QWORD *)(v0 + 24));
  }
}

uint64_t sub_229222B58(_BYTE *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD v33[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v33[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_229227014();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v33[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2292274DC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v33[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33[-1] - v16;
  if (*a1 == 1)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v11, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v18, v11);
    v19 = sub_2292274D0();
    v20 = sub_229227620();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v32 = a2;
      v22 = v7;
      v23 = v21;
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_229202000, v19, v20, "SCRestartShutdownFlow processDeviceUnlockResult | unable to unlock device due to error", v21, 2u);
      v24 = v23;
      v7 = v22;
      a2 = v32;
      MEMORY[0x22E2C5D5C](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    *(_BYTE *)(a2 + 16) = 7;
    sub_229226F3C();
    __swift_project_boxed_opaque_existential_1(v33, v33[3]);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE97878], v7);
    sub_229226F90();
    v25 = *MEMORY[0x24BE97068];
    v26 = sub_229226F54();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v6, v25, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v26);
    sub_229226F84();
    sub_229226F48();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  else
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v11, (uint64_t)qword_255A3E6C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v28, v11);
    v29 = sub_2292274D0();
    v30 = sub_229227620();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_229202000, v29, v30, "SCRestartShutdownFlow processDeviceUnlockResult | unlocked device, authenticated", v31, 2u);
      MEMORY[0x22E2C5D5C](v31, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    *(_BYTE *)(a2 + 16) = 2;
  }
  return result;
}

uint64_t sub_229222F04()
{
  return sub_229226F78();
}

BOOL sub_229222F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  _QWORD v5[4];

  v1 = sub_229227110();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_3();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_229227104();
  v3 = sub_229226FA8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return (v3 & 1) == 0;
}

uint64_t sub_229222FEC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = sub_2292270EC();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_22922304C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_2292230AC;
  return sub_2292270F8();
}

uint64_t sub_2292230AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  sub_22922014C(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_29_2();
}

uint64_t sub_22922311C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 192);
  v4 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v5 = sub_2292270C8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  v6 = sub_2292271E8();
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v7 = MEMORY[0x24BE99088];
  v4[3] = v6;
  v4[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v4);
  v8 = sub_229227074();
  OUTLINED_FUNCTION_41_1(v8, (uint64_t *)&unk_255A3B9F0);
  sub_22922014C(v3, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SCRestartShutdownFlow.deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
}

uint64_t SCRestartShutdownFlow.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return swift_deallocClassInstance();
}

uint64_t sub_2292232C4()
{
  return SCRestartShutdownFlow.execute(completion:)();
}

uint64_t sub_2292232E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return SCRestartShutdownFlow.execute()(a1);
}

uint64_t sub_229223338()
{
  type metadata accessor for SCRestartShutdownFlow();
  return sub_229226F18();
}

uint64_t sub_22922335C(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  unsigned __int8 v19;
  uint64_t v20;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D230);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2292194EC(a1, (uint64_t)v16, &qword_255A3D230);
  v17 = sub_2292275F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_22922014C((uint64_t)v16, &qword_255A3D230);
    result = 0;
    if ((a2 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v19 = sub_2292275E4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a3 & 1) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if ((a3 & 1) != 0)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if ((a5 & 1) != 0)
LABEL_6:
    result |= 0x1000uLL;
LABEL_7:
  if ((a6 & 1) != 0)
    result |= 0x2000uLL;
  if ((a7 & 1) != 0)
    return result | 0x4000;
  return result;
}

uint64_t sub_22922349C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_229223500;
  return v6(a1);
}

uint64_t sub_229223500()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229223528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_2292276C8();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_2292235CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  _QWORD *v6;

  v1 = v0[10];
  v2 = v0[9];
  sub_2292276E0();
  OUTLINED_FUNCTION_33_2(&qword_255A3D138, v3, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_229227740();
  OUTLINED_FUNCTION_33_2((unint64_t *)&unk_255A3D140, v4, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_2292276EC();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[12] = v5;
  OUTLINED_FUNCTION_42_1(v1, v5);
  v6 = (_QWORD *)swift_task_alloc();
  v0[13] = v6;
  *v6 = v0;
  v6[1] = sub_2292236E0;
  return sub_22922774C();
}

uint64_t sub_2292236E0()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    OUTLINED_FUNCTION_77();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_81();
    return (*(uint64_t (**)(void))(v5 + 8))();
  }
}

uint64_t sub_229223784()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_81();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292237B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_2292219C4(a1);
}

uint64_t type metadata accessor for SCRestartShutdownFlow()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for SCRestartShutdownFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229223878 + 4 * byte_229228DF5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2292238AC + 4 * byte_229228DF0[v4]))();
}

uint64_t sub_2292238AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2292238B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2292238BCLL);
  return result;
}

uint64_t sub_2292238C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2292238D0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2292238D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2292238DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCRestartShutdownFlow.State()
{
  return &type metadata for SCRestartShutdownFlow.State;
}

unint64_t sub_2292238FC()
{
  unint64_t result;

  result = qword_255A3D0F8;
  if (!qword_255A3D0F8)
  {
    result = MEMORY[0x22E2C5CD8](&unk_229228F2C, &type metadata for SCRestartShutdownFlow.State);
    atomic_store(result, (unint64_t *)&qword_255A3D0F8);
  }
  return result;
}

uint64_t sub_229223938(_BYTE *a1)
{
  uint64_t v1;

  return sub_229222B58(a1, v1);
}

unint64_t sub_229223940()
{
  unint64_t result;

  result = qword_255A3D100;
  if (!qword_255A3D100)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_255A3D100);
  }
  return result;
}

uint64_t sub_22922397C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2292239B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_22920D20C;
  return sub_229221DD4(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_229223A3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229223A60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22920F324;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A3D120 + dword_255A3D120))(a1, v4);
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = v1[8];
  v4 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_14_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_15_3(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_25_2(uint64_t a1)
{
  uint64_t *v1;

  sub_22922014C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_33_2(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  sub_229220184(a1, 255, a3, a4);
}

void OUTLINED_FUNCTION_38_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_39_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

void OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22922014C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_42_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_43_3()
{
  return sub_22922750C();
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_49_2()
{
  uint64_t v0;

  return v0;
}

void sub_229223C10(uint64_t a1, void *a2)
{
  sub_229223D70(a1, a2, "SCAppIntentConnectionDelegate got LNConfirmationRequest: %@");
}

void sub_229223C80(uint64_t a1, void *a2)
{
  sub_229223D70(a1, a2, "SCAppIntentConnectionDelegate got LNActionConfirmationRequest: %@");
}

void sub_229223CF0(uint64_t a1, void *a2)
{
  sub_229223D70(a1, a2, "SCAppIntentConnectionDelegate got LNDisambiguationRequest: %@");
}

void sub_229223D60(uint64_t a1, void *a2)
{
  sub_229223D70(a1, a2, "SCAppIntentConnectionDelegate got LNNeedsValueRequest: %@");
}

void sub_229223D70(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D208);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_36();
  v9 = v8 - v7;
  v10 = OUTLINED_FUNCTION_98();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_10_8();
  if (qword_255A3B748 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v10, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v3, v12, v10);
  v13 = a2;
  v21 = v3;
  v14 = sub_2292274D0();
  v15 = sub_22922762C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_16();
    v19 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v16 = 138412290;
    v17 = v13;
    sub_229227680();
    *v19 = v13;

    OUTLINED_FUNCTION_15_0(&dword_229202000, v14, v15, a3, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D118);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v10);
  v18 = v13;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3D210);
  sub_2292275FC();
  OUTLINED_FUNCTION_50_0(v9, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_4_2();
}

void sub_229224028(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD v44[3];
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;

  v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3D210);
  v6 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_10_8();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D208);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_36();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_98();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v44 - v16;
  if (a3)
  {
    OUTLINED_FUNCTION_7_6();
    if (qword_255A3B748 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v12, (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_22_0(v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_7_6();
    v19 = sub_2292274D0();
    v20 = sub_22922762C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = OUTLINED_FUNCTION_16();
      v50 = v13;
      v22 = (uint8_t *)v21;
      v23 = OUTLINED_FUNCTION_16();
      v53 = a3;
      v54 = v23;
      *(_DWORD *)v22 = 136315138;
      OUTLINED_FUNCTION_7_6();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
      v24 = sub_229227530();
      v53 = sub_229209A10(v24, v25, &v54);
      sub_229227680();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_6_7();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v19, v20, "SCAppIntentConnectionDelegate finished with error: %s", v22);
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_6_7();

    OUTLINED_FUNCTION_11_7((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    v54 = a3;
    OUTLINED_FUNCTION_7_6();
    sub_229227608();
    OUTLINED_FUNCTION_6_7();
    goto LABEL_14;
  }
  v26 = v15;
  v48 = v8;
  v49 = v11;
  v46 = v7;
  v47 = v3;
  if (qword_255A3B748 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v12, (uint64_t)qword_255A3E6C8);
  v28 = v26;
  OUTLINED_FUNCTION_22_0(v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  v29 = (uint64_t)a2;
  v30 = a2;
  v31 = sub_2292274D0();
  v32 = sub_22922762C();
  v33 = os_log_type_enabled(v31, v32);
  v34 = v49;
  v45 = v30;
  if (v33)
  {
    v44[2] = v6;
    v50 = v13;
    v35 = v29;
    v36 = (uint8_t *)OUTLINED_FUNCTION_16();
    v37 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v36 = 138412290;
    if (v35)
    {
      v38 = (_QWORD *)v37;
      v44[1] = v36 + 12;
      v54 = (uint64_t)v30;
      v39 = v30;
      sub_229227680();
      *v38 = v35;

      OUTLINED_FUNCTION_15_0(&dword_229202000, v31, v32, "SCAppIntentConnectionDelegate finished with result: %@", v36);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D118);
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }
  }
  else
  {

    OUTLINED_FUNCTION_11_7(v28, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    v40 = v47;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v47, v51 + OBJC_IVAR____TtC25SiriSystemCommandsIntents29SCAppIntentConnectionDelegate_continuation, v52);
    v41 = v48;
    if (v29)
    {
      v54 = v29;
      v55 = 5;
      v42 = v45;
      v43 = v52;
      sub_2292275FC();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v40, v43);
      OUTLINED_FUNCTION_11_7(v34, *(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
      v54 = 0;
      sub_229227608();
LABEL_14:
      OUTLINED_FUNCTION_4_2();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_229224530()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_98();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_229224588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_255A3B748 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 16), (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_25_1(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v3 = sub_2292274D0();
  v4 = sub_22922762C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_14_3(&dword_229202000, v3, v4, "SCAppIntentConnectionDelegate executorEnvironmentForViewSnippet", v5);
    OUTLINED_FUNCTION_2();
  }
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 16);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_2292246EC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_22922475C;
  return sub_229224530();
}

uint64_t sub_22922475C(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_2292247D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D230);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2292275F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_255A3D240;
  v9[5] = v8;
  sub_229225000((uint64_t)v6, (uint64_t)&unk_255A3D250, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2292248B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = OUTLINED_FUNCTION_98();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_9_9();
  if (qword_255A3B748 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_255A3E6C8);
  OUTLINED_FUNCTION_25_1(v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  v4 = sub_2292274D0();
  v5 = sub_22922762C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_14_3(&dword_229202000, v4, v5, "SCAppIntentConnectionDelegate shouldRunShowOutputAction return false", v6);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_50_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return 0;
}

void sub_229224A08(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D208);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_36();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_9();
  if (qword_255A3B748 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v9, (uint64_t)qword_255A3E6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2, v11, v9);
  v12 = sub_2292274D0();
  v13 = sub_22922762C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_14_3(&dword_229202000, v12, v13, "SCAppIntentConnectionDelegate needsContinueInAppWith request", v14);
    OUTLINED_FUNCTION_2();
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  v15 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A3D210);
  sub_2292275FC();
  OUTLINED_FUNCTION_50_0(v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_4_2();
}

void sub_229224C10()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_229224C48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SCAppIntentConnectionDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_229224CD0()
{
  return type metadata accessor for SCAppIntentConnectionDelegate();
}

uint64_t type metadata accessor for SCAppIntentConnectionDelegate()
{
  uint64_t result;

  result = qword_255A3D1E0;
  if (!qword_255A3D1E0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_229224D10()
{
  unint64_t v0;

  sub_229224D88();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_229224D88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A3D1F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A3D200);
    v0 = sub_229227614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A3D1F8);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for LinkConnectionEvent(id *a1)
{

}

uint64_t assignWithCopy for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

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

uint64_t assignWithTake for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for LinkConnectionEvent(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 5)
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

uint64_t storeEnumTagSinglePayload for LinkConnectionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_229224F38(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_229224F40(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkConnectionEvent()
{
  return &type metadata for LinkConnectionEvent;
}

uint64_t sub_229224F58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_229225494;
  return v6();
}

uint64_t sub_229224FAC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_229225494;
  return v7();
}

uint64_t sub_229225000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2292275F0();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2292253BC(a1);
  }
  else
  {
    sub_2292275E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2292275CC();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_22922513C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_229227680();
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

uint64_t sub_2292251EC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_229225220()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2292098F4;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_255A3D220 + dword_255A3D220))(v2, v3, v4);
}

uint64_t sub_229225290()
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
  v5[1] = sub_229225494;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255A3D238 + dword_255A3D238))(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229225338(uint64_t a1)
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
  v7[1] = sub_229225494;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255A3D248 + dword_255A3D248))(a1, v4, v5, v6);
}

uint64_t sub_2292253BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D230);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2292253FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229225420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22920D20C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A3D258 + dword_255A3D258))(a1, v4);
}

void OUTLINED_FUNCTION_6_7()
{
  void *v0;

}

id OUTLINED_FUNCTION_7_6()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_7@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t SCStopScreenRecordingFlow.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  return result;
}

uint64_t SCStopScreenRecordingFlow.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_BYTE *)(v0 + 16) = 0;
  return result;
}

uint64_t SCStopScreenRecordingFlow.on(input:)()
{
  return 1;
}

uint64_t SCStopScreenRecordingFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[35] = a1;
  v2[36] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3C9A0);
  v2[37] = OUTLINED_FUNCTION_7();
  v3 = sub_229227014();
  v2[38] = v3;
  v2[39] = *(_QWORD *)(v3 - 8);
  v2[40] = OUTLINED_FUNCTION_7();
  v4 = sub_2292274DC();
  v2[41] = v4;
  v2[42] = *(_QWORD *)(v4 - 8);
  v2[43] = OUTLINED_FUNCTION_4();
  v2[44] = OUTLINED_FUNCTION_4();
  v2[45] = OUTLINED_FUNCTION_4();
  v2[46] = OUTLINED_FUNCTION_4();
  v2[47] = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292255C0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  id v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  _QWORD *v46;
  uint64_t v47[5];

  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v1 = sub_229226FE4();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v1 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 328), (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_21_1(v2);
    sub_2292274D0();
    v3 = sub_229227620();
    if (OUTLINED_FUNCTION_12_1(v3))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_3_5(&dword_229202000, v4, v5, "SCStopScreenRecordingFlow execute | cannot stop recording in Carplay");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_49_1();
    OUTLINED_FUNCTION_25_3();
    sub_229227134();
    OUTLINED_FUNCTION_61_1();
    OUTLINED_FUNCTION_7_2();
    *(_QWORD *)(v0 + 248) = OUTLINED_FUNCTION_47_3();
LABEL_13:
    sub_22922708C();
    OUTLINED_FUNCTION_22_1();
LABEL_14:
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_56();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  v6 = sub_229226FD8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if ((v6 & 1) != 0)
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v7 = __swift_project_value_buffer(*(_QWORD *)(v0 + 328), (uint64_t)qword_255A3E6C8);
    OUTLINED_FUNCTION_21_1(v7);
    sub_2292274D0();
    v8 = sub_229227620();
    if (OUTLINED_FUNCTION_12_1(v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_3_5(&dword_229202000, v9, v10, "SCStopScreenRecordingFlow execute | cannot stop recording on watchOS");
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_49_1();
    OUTLINED_FUNCTION_25_3();
    sub_229227134();
    OUTLINED_FUNCTION_61_1();
    OUTLINED_FUNCTION_7_2();
    *(_QWORD *)(v0 + 272) = OUTLINED_FUNCTION_47_3();
    goto LABEL_13;
  }
  v12 = *(_QWORD *)(v0 + 288);
  if (*(_BYTE *)(v12 + 16))
  {
    if (qword_255A3B748 != -1)
      swift_once();
    v13 = *(_QWORD *)(v0 + 368);
    v14 = *(_QWORD *)(v0 + 328);
    v15 = *(_QWORD *)(v0 + 336);
    v16 = __swift_project_value_buffer(v14, (uint64_t)qword_255A3E6C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    swift_retain_n();
    v17 = sub_2292274D0();
    v18 = sub_229227620();
    v19 = os_log_type_enabled(v17, v18);
    v20 = *(_QWORD *)(v0 + 368);
    v21 = *(_QWORD *)(v0 + 328);
    v22 = *(_QWORD *)(v0 + 336);
    if (v19)
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_16();
      v47[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v23 = 136315138;
      *(_BYTE *)(v0 + 432) = *(_BYTE *)(v12 + 16);
      v24 = sub_229227530();
      *(_QWORD *)(v0 + 216) = sub_229209A10(v24, v25, v47);
      sub_229227680();
      OUTLINED_FUNCTION_37_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_0(&dword_229202000, v17, v18, "SCStopScreenRecordingFlow execute | flow completed with state: %s", v23);
      OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_37_1();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    sub_2292270A4();
    goto LABEL_14;
  }
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE811E8]), sel_init);
  *(_QWORD *)(v0 + 384) = v26;
  if (qword_255A3B748 != -1)
    swift_once();
  v27 = *(_QWORD *)(v0 + 376);
  v28 = *(_QWORD *)(v0 + 328);
  v29 = *(_QWORD *)(v0 + 336);
  v30 = __swift_project_value_buffer(v28, (uint64_t)qword_255A3E6C8);
  *(_QWORD *)(v0 + 392) = v30;
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
  *(_QWORD *)(v0 + 400) = v31;
  v31(v27, v30, v28);
  v32 = v26;
  v33 = sub_2292274D0();
  v34 = sub_229227620();
  v35 = os_log_type_enabled(v33, v34);
  v36 = *(_QWORD *)(v0 + 376);
  v37 = *(_QWORD *)(v0 + 328);
  v38 = *(_QWORD *)(v0 + 336);
  if (v35)
  {
    v39 = (uint8_t *)OUTLINED_FUNCTION_16();
    v47[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v39 = 136315138;
    v40 = v32;
    v41 = objc_msgSend(v40, sel_description);
    v42 = sub_229227524();
    v44 = v43;

    *(_QWORD *)(v0 + 264) = sub_229209A10(v42, v44, v47);
    sub_229227680();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_0(&dword_229202000, v33, v34, "SCStopScreenRecordingFlow execute | submitting command: %s", v39);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }

  v45 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v45(v36, v37);
  *(_QWORD *)(v0 + 408) = v45;
  sub_229226F9C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 200));
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 416) = v46;
  sub_22921B9FC();
  *v46 = v0;
  v46[1] = sub_229225C68;
  return sub_229227128();
}

uint64_t sub_229225C68(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 424) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_229225CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;

  v8 = *(void **)(v0 + 384);
  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 304);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  sub_229226F3C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226F90();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE97888], v4);
  v5 = *MEMORY[0x24BE970E8];
  v6 = sub_229226F54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v3, v5, v6);
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v6);
  sub_229226F84();
  sub_229226F48();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_retain();
  sub_229227134();
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v0 + 256) = sub_229226E58();
  sub_22922708C();

  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_6_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229225E80()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24[5];

  v1 = *(_QWORD *)(v0 + 392);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  v3 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 328);

  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  v2(v3, v1, v4);
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_17_4();
  v5 = sub_2292274D0();
  v6 = sub_229227638();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 424);
    v8 = (uint8_t *)OUTLINED_FUNCTION_16();
    v9 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v8 = 136315138;
    v24[0] = v9;
    *(_QWORD *)(v0 + 232) = v7;
    v10 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A3D200);
    v11 = sub_229227530();
    *(_QWORD *)(v0 + 240) = sub_229209A10(v11, v12, v24);
    sub_229227680();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_15_0(&dword_229202000, v5, v6, "SCStopScreenRecordingFlow execute | unable to stop recording: %s", v8);
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_2();
  }
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
  v14 = *(_QWORD *)(v0 + 344);
  v15 = *(_QWORD *)(v0 + 328);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_5_5();

  v13(v14, v15);
  v16 = *(_QWORD *)(v0 + 424);
  v18 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD *)(v0 + 296);
  v19 = *(_QWORD *)(v0 + 304);
  *(_BYTE *)(*(_QWORD *)(v0 + 288) + 16) = 2;
  sub_229226F3C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
  sub_229226F90();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, *MEMORY[0x24BE97878], v19);
  v21 = *MEMORY[0x24BE97068];
  v22 = sub_229226F54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v20, v21, v22);
  __swift_storeEnumTagSinglePayload(v20, 0, 1, v22);
  *(_QWORD *)(swift_allocObject() + 16) = v16;
  OUTLINED_FUNCTION_17_4();
  sub_229226F84();
  sub_229226F48();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_retain();
  sub_229227134();
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v0 + 224) = sub_229226E58();
  sub_22922708C();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_56();
  return OUTLINED_FUNCTION_6_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2292261D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_229226370(a1);
}

uint64_t sub_229226228(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920D20C;
  return sub_229226370(a1);
}

uint64_t sub_229226278(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_229226780(a1);
}

uint64_t sub_2292262C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22920F324;
  return sub_2292265B0(a1);
}

uint64_t SCStopScreenRecordingFlow.execute(completion:)()
{
  type metadata accessor for SCStopScreenRecordingFlow();
  sub_229226B70();
  return sub_229226EF4();
}

uint64_t sub_229226370(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[23] = OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_38_2();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292263CC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2292271B8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_22922642C;
  return sub_2292270F8();
}

uint64_t sub_22922642C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  v2 = swift_task_dealloc();
  OUTLINED_FUNCTION_17_2(v2, (uint64_t *)&unk_255A3C4C0);
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_229226494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v9 = *(_QWORD *)(v0 + 192);
  v3 = *(uint64_t **)(v0 + 176);
  sub_2292271B8();
  sub_2292271B8();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
  sub_229226FB4();
  v4 = OUTLINED_FUNCTION_54_1();
  v5 = OUTLINED_FUNCTION_8_3(v4);
  *(_OWORD *)(v0 + 152) = 0u;
  *(_QWORD *)(v0 + 168) = 0;
  *(_OWORD *)(v0 + 136) = 0u;
  v6 = MEMORY[0x24BE99088];
  v3[3] = v5;
  v3[4] = v6;
  __swift_allocate_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_19_5();
  v7 = sub_229208758(v0 + 136, (uint64_t *)&unk_255A3B9F0);
  OUTLINED_FUNCTION_17_2(v7, &qword_255A3B9E0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v9);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2292265B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[18] = OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_38_2();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_43_4(v3);
  v1[22] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_229226618()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_50_3();
  sub_22922744C();
  OUTLINED_FUNCTION_44_2();
  sub_229227440();
  v0[23] = OUTLINED_FUNCTION_31_2();
  v1 = (_QWORD *)swift_task_alloc();
  v0[24] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_229226694;
  return sub_229220F58(v0[21]);
}

uint64_t sub_229226694()
{
  OUTLINED_FUNCTION_11_8();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292266D0()
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_7_7();
  sub_2292271B8();
  OUTLINED_FUNCTION_18_3();
  v3 = OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_8_3(v3);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_49_3(v4, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_19_5();
  swift_release();
  v5 = sub_229208758(v1, (uint64_t *)&unk_255A3B9F0);
  v6 = OUTLINED_FUNCTION_17_2(v5, &qword_255A3B9E0);
  OUTLINED_FUNCTION_29_3(v6, v7, v8, v9, v10, v11, v12, v13, v1, v15, v16, v17);
  __swift_destroy_boxed_opaque_existential_1(v2);
  swift_task_dealloc();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_4_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229226780(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[17] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A3B9E0);
  v1[18] = OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_38_2();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_43_4(v3);
  v1[22] = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292267E8()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_50_3();
  sub_22922744C();
  OUTLINED_FUNCTION_44_2();
  sub_229227440();
  *(_QWORD *)(v0 + 184) = OUTLINED_FUNCTION_31_2();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_229226864;
  return sub_229220FC0();
}

uint64_t sub_229226864()
{
  OUTLINED_FUNCTION_11_8();
  OUTLINED_FUNCTION_77();
  return OUTLINED_FUNCTION_8();
}

uint64_t sub_2292268A0()
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_7_7();
  sub_2292271B8();
  OUTLINED_FUNCTION_18_3();
  v3 = OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_8_3(v3);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_49_3(v4, MEMORY[0x24BE99088]);
  sub_22922705C();
  swift_release();
  v5 = sub_229208758(v1, (uint64_t *)&unk_255A3B9F0);
  v6 = OUTLINED_FUNCTION_17_2(v5, &qword_255A3B9E0);
  OUTLINED_FUNCTION_29_3(v6, v7, v8, v9, v10, v11, v12, v13, v1, v15, v16, v17);
  __swift_destroy_boxed_opaque_existential_1(v2);
  swift_task_dealloc();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_4_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t SCStopScreenRecordingFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SCStopScreenRecordingFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_229226984()
{
  return SCStopScreenRecordingFlow.execute(completion:)();
}

uint64_t sub_2292269A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2292098F4;
  return SCStopScreenRecordingFlow.execute()(a1);
}

uint64_t sub_2292269F8()
{
  type metadata accessor for SCStopScreenRecordingFlow();
  return sub_229226F18();
}

uint64_t sub_229226A1C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_229226A40()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_4_6(v0);
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_2292262C8(v2);
}

uint64_t sub_229226A84()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_4_6(v0);
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_229226278(v2);
}

uint64_t sub_229226AC8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_4_6(v0);
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_229226228(v2);
}

uint64_t sub_229226B0C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_4_6(v0);
  v2 = OUTLINED_FUNCTION_24_0(v1);
  return sub_2292261D8(v2);
}

uint64_t type metadata accessor for SCStopScreenRecordingFlow()
{
  return objc_opt_self();
}

unint64_t sub_229226B70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A3C128;
  if (!qword_255A3C128)
  {
    v1 = type metadata accessor for SCStopScreenRecordingFlow();
    result = MEMORY[0x22E2C5CD8](&protocol conformance descriptor for SCStopScreenRecordingFlow, v1);
    atomic_store(result, (unint64_t *)&qword_255A3C128);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SCStopScreenRecordingFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229226BF8 + 4 * byte_229228FE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_229226C2C + 4 * asc_229228FE0[v4]))();
}

uint64_t sub_229226C2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229226C34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229226C3CLL);
  return result;
}

uint64_t sub_229226C48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229226C50);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_229226C54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229226C5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SCStopScreenRecordingFlow.State()
{
  return &type metadata for SCStopScreenRecordingFlow.State;
}

unint64_t sub_229226C7C()
{
  unint64_t result;

  result = qword_255A3D3C8;
  if (!qword_255A3D3C8)
  {
    result = MEMORY[0x22E2C5CD8](&unk_2292290D0, &type metadata for SCStopScreenRecordingFlow.State);
    atomic_store(result, (unint64_t *)&qword_255A3D3C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return sub_2292271B8();
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 200) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(v1, *(_QWORD *)(v0 + 80));
  return sub_229226FB4();
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 16) = 2;
  return swift_retain();
}

double OUTLINED_FUNCTION_27_1()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_29_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;

  __swift_destroy_boxed_opaque_existential_1(v13);
  return (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v12, a12);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_229227470();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return sub_2292270EC();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return type metadata accessor for ScreenRecordingCATs();
}

uint64_t OUTLINED_FUNCTION_43_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 168) = a1;
  return sub_2292274C4();
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return sub_2292271B8();
}

uint64_t OUTLINED_FUNCTION_47_3()
{
  return sub_229226E58();
}

uint64_t *OUTLINED_FUNCTION_49_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1(v2);
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  return sub_2292274B8();
}

uint64_t sub_229226DF8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_229226E04()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_229226E10()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_229226E1C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_229226E28()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_229226E34()
{
  return MEMORY[0x24BE95FA0]();
}

uint64_t sub_229226E40()
{
  return MEMORY[0x24BE95FB0]();
}

uint64_t sub_229226E4C()
{
  return MEMORY[0x24BE95FC0]();
}

uint64_t sub_229226E58()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_229226E64()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_229226E70()
{
  return MEMORY[0x24BE965E0]();
}

uint64_t sub_229226E7C()
{
  return MEMORY[0x24BE965F0]();
}

uint64_t sub_229226E88()
{
  return MEMORY[0x24BE96600]();
}

uint64_t sub_229226E94()
{
  return MEMORY[0x24BE96630]();
}

uint64_t sub_229226EA0()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_229226EAC()
{
  return MEMORY[0x24BE96A80]();
}

uint64_t sub_229226EB8()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_229226EC4()
{
  return MEMORY[0x24BE96AC0]();
}

uint64_t sub_229226ED0()
{
  return MEMORY[0x24BE96AD0]();
}

uint64_t sub_229226EDC()
{
  return MEMORY[0x24BE96B00]();
}

uint64_t sub_229226EE8()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_229226EF4()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_229226F00()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_229226F0C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_229226F18()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_229226F24()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_229226F30()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_229226F3C()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_229226F48()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_229226F54()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_229226F60()
{
  return MEMORY[0x24BE97278]();
}

uint64_t sub_229226F6C()
{
  return MEMORY[0x24BE97288]();
}

uint64_t sub_229226F78()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_229226F84()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_229226F90()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_229226F9C()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_229226FA8()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_229226FB4()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_229226FC0()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_229226FCC()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_229226FD8()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_229226FE4()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_229226FF0()
{
  return MEMORY[0x24BE97670]();
}

uint64_t sub_229226FFC()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_229227008()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_229227014()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_229227020()
{
  return MEMORY[0x24BE978B8]();
}

uint64_t sub_22922702C()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_229227038()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_229227044()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_229227050()
{
  return MEMORY[0x24BE97C88]();
}

uint64_t sub_22922705C()
{
  return MEMORY[0x24BE97CA0]();
}

uint64_t sub_229227068()
{
  return MEMORY[0x24BE97CB8]();
}

uint64_t sub_229227074()
{
  return MEMORY[0x24BE97CE8]();
}

uint64_t sub_229227080()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_22922708C()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_229227098()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_2292270A4()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2292270B0()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_2292270BC()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_2292270C8()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2292270D4()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_2292270E0()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_2292270EC()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2292270F8()
{
  return MEMORY[0x24BE98138]();
}

uint64_t sub_229227104()
{
  return MEMORY[0x24BE98310]();
}

uint64_t sub_229227110()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_22922711C()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_229227128()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_229227134()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_229227140()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_22922714C()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_229227158()
{
  return MEMORY[0x24BE98D08]();
}

uint64_t sub_229227164()
{
  return MEMORY[0x24BE98D18]();
}

uint64_t sub_229227170()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_22922717C()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_229227188()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_229227194()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2292271A0()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2292271AC()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2292271B8()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2292271C4()
{
  return MEMORY[0x24BE99030]();
}

uint64_t sub_2292271D0()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2292271DC()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2292271E8()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2292271F4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_229227200()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_22922720C()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_229227218()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_229227224()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_229227230()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_22922723C()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_229227248()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_229227254()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_229227260()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_22922726C()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_229227278()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_229227284()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_229227290()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_22922729C()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_2292272A8()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_2292272B4()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_2292272C0()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_2292272CC()
{
  return MEMORY[0x24BE9EE28]();
}

uint64_t sub_2292272D8()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2292272E4()
{
  return MEMORY[0x24BE9F950]();
}

uint64_t sub_2292272F0()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2292272FC()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_229227308()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_229227314()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_229227320()
{
  return MEMORY[0x24BE9FF28]();
}

uint64_t sub_22922732C()
{
  return MEMORY[0x24BE9FF40]();
}

uint64_t sub_229227338()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_229227344()
{
  return MEMORY[0x24BEA0038]();
}

uint64_t sub_229227350()
{
  return MEMORY[0x24BEA0058]();
}

uint64_t sub_22922735C()
{
  return MEMORY[0x24BEA0658]();
}

uint64_t sub_229227368()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_229227374()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_229227380()
{
  return MEMORY[0x24BEA0F70]();
}

uint64_t sub_22922738C()
{
  return MEMORY[0x24BEA1288]();
}

uint64_t sub_229227398()
{
  return MEMORY[0x24BEA1370]();
}

uint64_t sub_2292273A4()
{
  return MEMORY[0x24BEA17F0]();
}

uint64_t sub_2292273B0()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_2292273BC()
{
  return MEMORY[0x24BEA18B0]();
}

uint64_t sub_2292273C8()
{
  return MEMORY[0x24BEA2028]();
}

uint64_t sub_2292273D4()
{
  return MEMORY[0x24BEA2150]();
}

uint64_t sub_2292273E0()
{
  return MEMORY[0x24BEA2180]();
}

uint64_t sub_2292273EC()
{
  return MEMORY[0x24BEA22C0]();
}

uint64_t sub_2292273F8()
{
  return MEMORY[0x24BEA2328]();
}

uint64_t sub_229227404()
{
  return MEMORY[0x24BEA2330]();
}

uint64_t sub_229227410()
{
  return MEMORY[0x24BEA2340]();
}

uint64_t sub_22922741C()
{
  return MEMORY[0x24BEA26E8]();
}

uint64_t sub_229227428()
{
  return MEMORY[0x24BEA3738]();
}

uint64_t sub_229227434()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_229227440()
{
  return MEMORY[0x24BE927F0]();
}

uint64_t sub_22922744C()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_229227458()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_229227464()
{
  return MEMORY[0x24BE92880]();
}

uint64_t sub_229227470()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_22922747C()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_229227488()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_229227494()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_2292274A0()
{
  return MEMORY[0x24BE92A38]();
}

uint64_t sub_2292274AC()
{
  return MEMORY[0x24BE92B00]();
}

uint64_t sub_2292274B8()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2292274C4()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2292274D0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2292274DC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2292274E8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2292274F4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_229227500()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_22922750C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_229227518()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_229227524()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_229227530()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22922753C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_229227548()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_229227554()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_229227560()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22922756C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_229227578()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_229227584()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_229227590()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22922759C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2292275A8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2292275B4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2292275C0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2292275CC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2292275D8()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2292275E4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2292275F0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2292275FC()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_229227608()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_229227614()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_229227620()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22922762C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_229227638()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_229227644()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_229227650()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22922765C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_229227668()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_229227674()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_229227680()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22922768C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_229227698()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2292276A4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2292276B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2292276BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2292276C8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2292276D4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2292276E0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2292276EC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2292276F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_229227704()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_229227710()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22922771C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_229227728()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_229227734()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_229227740()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_22922774C()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_229227758()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_229227764()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_229227770()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22922777C()
{
  return MEMORY[0x24BE92C58]();
}

uint64_t sub_229227788()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_229227794()
{
  return MEMORY[0x24BEE4898]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
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

