uint64_t sub_22CD7E9A8(uint64_t a1, uint64_t *a2, void (*a3)(uint64_t, _QWORD), void (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_5();
  a3(a1, MEMORY[0x24BEE4AF8]);
  a4(0);
  if (OUTLINED_FUNCTION_6())
  {
    v7 = OUTLINED_FUNCTION_9_1();
    v8 = 1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_4_0();
    v8 = 0;
  }
  return OUTLINED_FUNCTION_1(v7, v8);
}

void sub_22CD7EA44()
{
  char *v0;

  v0 = (char *)sub_22CD7EA88 + 4 * byte_22CD94794[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22CD7EA88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_22CD93994();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

void sub_22CD7EB50()
{
  sub_22CD8DBBC();
}

void sub_22CD7EB64(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42788);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_0();
  v7 = sub_22CD938D4();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93898();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v3, a1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F427E0);
  v12 = sub_22CD938B0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_22CD94350;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v13 + 104))(v15 + v14, *MEMORY[0x24BDDEB10], v12);
  sub_22CD938C8();
  v16 = sub_22CD938A4();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v16);
  v17 = (void *)swift_unknownObjectRetain();
  sub_22CD7ECD8(v17, v3, (uint64_t)v9, v2, a2);
  OUTLINED_FUNCTION_1_0();
}

void sub_22CD7ECD8(id a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
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
  uint64_t (*v22)(uint64_t);
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
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(void);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t (*v60)(_QWORD, _QWORD);
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  void (*v77)(void *, unint64_t, uint64_t);
  void *v78;
  int v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t *v89;
  uint64_t v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t);
  uint64_t v110;
  int v111;
  IMP *p_imp;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(void);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  BOOL v120;
  uint64_t v121;
  uint64_t *v122;
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, _QWORD, _QWORD);
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  BOOL v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  BOOL v139;
  void (*v140)(uint64_t, uint64_t *);
  BOOL v141;
  void (*v142)(uint64_t, uint64_t);
  uint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  id v147;
  void *v148;
  _QWORD *v149;
  void (*v150)(uint64_t);
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, _QWORD, _QWORD);
  uint64_t v157;
  uint64_t v158;
  char v159;
  uint64_t v160;
  id v161;
  id v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  void (*v166)(uint64_t);
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t, uint64_t);
  uint64_t v169;
  uint64_t v170;
  id v171;
  void *v172;
  _QWORD *v173;
  uint64_t v174;
  uint64_t v175;
  BOOL v176;
  char v177;
  uint64_t v178;
  NSObject *v179;
  os_log_type_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int EnumTagSinglePayload;
  id v193;
  uint64_t v194;
  uint64_t v195;
  int v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  id v206;
  id v207;
  uint64_t v208;
  id v209;
  id v210;
  void *v211;
  uint64_t v212;
  int64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  uint64_t v221;
  id v222;
  id v223;
  uint64_t v224;
  id v225;
  id v226;
  id v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  int v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void (*v255)(void);
  uint64_t v256;
  uint64_t *v257;
  uint64_t v258;
  uint64_t (*v259)(_QWORD, _QWORD);
  uint64_t v260;
  int v261;
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
  int v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  int v292;
  uint64_t v293;
  uint64_t v294;
  id v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  void (*v300)(void *, unint64_t, uint64_t);
  int v301;
  void *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;

  v271 = a4;
  v291 = a2;
  v289 = a5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42788);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_4();
  v265 = v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F427F0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_4();
  v251 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42780);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_17_1();
  v264 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v17);
  v281 = sub_22CD93670();
  v241 = *(_QWORD *)(v281 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v20);
  v21 = sub_22CD938D4();
  v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BDDECF8];
  v275 = *(_QWORD *)(v21 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v26);
  v278 = sub_22CD93898();
  v276 = *(_QWORD *)(v278 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v29);
  v270 = sub_22CD93994();
  v252 = *(_QWORD *)(v270 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v33);
  v286 = sub_22CD93964();
  v284 = *(_QWORD *)(v286 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v36);
  v290 = sub_22CD938A4();
  v297 = *(_QWORD *)(v290 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_0_4();
  v302 = v38;
  __swift_instantiateConcreteTypeFromMangledName(qword_253F426F8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_21_1();
  v293 = v41;
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_21_1();
  v288 = v43;
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_17_1();
  v303 = v46;
  v47 = sub_22CD938B0();
  v48 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (char *)&v234 - v52;
  v54 = *(void (**)(void))(v48 + 104);
  v245 = *MEMORY[0x24BDDEB10];
  v255 = v54;
  ((void (*)(char *))v54)((char *)&v234 - v52);
  sub_22CD80D00((unint64_t *)&unk_253F427A0, v22, MEMORY[0x24BDDED08]);
  v287 = v21;
  v260 = v55;
  sub_22CD93CAC();
  OUTLINED_FUNCTION_51();
  v279 = a3;
  v298 = a1;
  if (v176)
  {
    MEMORY[0x24BDAC7A8](v56);
    OUTLINED_FUNCTION_20_0();
    *(_QWORD *)(v57 - 16) = v53;
    v59 = sub_22CD80A2C((uint64_t (*)(char *))sub_22CD80D3C, v58);
    a1 = v298;
  }
  else
  {
    v59 = v56 & 1;
  }
  v268 = v5;
  v60 = *(uint64_t (**)(_QWORD, _QWORD))(v48 + 8);
  v267 = v47;
  v259 = v60;
  v61 = v60(v53, v47);
  v62 = v297;
  if (v59)
  {
    v258 = 0;
    v63 = OUTLINED_FUNCTION_3_5(v61, sel_musicKit_catalogID);
    v64 = OUTLINED_FUNCTION_3_5((uint64_t)v63, sel_musicKit_libraryID);
    v65 = v293;
    if (v64)
    {
      v272 = OUTLINED_FUNCTION_21();
      v67 = v66;

    }
    else
    {
      v272 = 0;
      v67 = 0;
    }
    v68 = v290;
    v69 = OUTLINED_FUNCTION_3_5((uint64_t)v64, sel_musicKit_cloudAlbumLibraryID);
    if (v69)
    {
      v249 = OUTLINED_FUNCTION_21();
      v269 = v70;

    }
    else
    {
      v249 = 0;
      v269 = 0;
    }
    v295 = OUTLINED_FUNCTION_3_5((uint64_t)v69, sel_musicKit_deviceLocalID);
    if (OUTLINED_FUNCTION_3_5((uint64_t)v295, sel_musicKit_occurrenceID))
    {
      v256 = OUTLINED_FUNCTION_21();
      v282 = v71;

    }
    else
    {
      v256 = 0;
      v282 = 0;
    }
    v277 = v67;
    v72 = sub_22CD93688();
    v73 = type metadata accessor for MusicPreferredID();
    OUTLINED_FUNCTION_52(v303, 1);
    v74 = *(_QWORD *)(v72 + 16);
    v296 = v63;
    if (v74)
    {
      v75 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
      v244 = v72;
      v76 = v72 + v75;
      v301 = *MEMORY[0x24BDDEA60];
      v292 = *MEMORY[0x24BDDEA58];
      v273 = *MEMORY[0x24BDDEA68];
      v261 = *MEMORY[0x24BDDEA50];
      v240 = *MEMORY[0x24BDDEF00];
      v239 = *MEMORY[0x24BDDEF20];
      v238 = *MEMORY[0x24BDDEF08];
      v237 = *MEMORY[0x24BDDEF18];
      v236 = *MEMORY[0x24BDDEF28];
      v235 = *MEMORY[0x24BDDEF10];
      HIDWORD(v234) = *MEMORY[0x24BDDEF40];
      v280 = *MEMORY[0x24BDDEF30];
      v77 = *(void (**)(void *, unint64_t, uint64_t))(v62 + 16);
      v299 = *(_QWORD *)(v62 + 72);
      v300 = v77;
      v294 = v73;
      while (1)
      {
        v78 = v302;
        v300(v302, v76, v68);
        v79 = (*(uint64_t (**)(void *, uint64_t))(v62 + 88))(v78, v68);
        if (v79 == v301)
        {
          if (v63)
          {
            v80 = v63;
            v81 = objc_msgSend(v80, sel_value);
            OUTLINED_FUNCTION_21();

            sub_22CD93904();
            switch((unint64_t)objc_msgSend(v80, sel_kind))
            {
              case 0uLL:
              case 1uLL:
              case 2uLL:
              case 3uLL:
              case 4uLL:
              case 5uLL:
              case 6uLL:
              case 7uLL:
                v106 = v284;
                v107 = OUTLINED_FUNCTION_45();
                v108 = v286;
                v109(v107);
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 16))(v285, v73, v108);
                v90 = v283;
                sub_22CD9397C();

                (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v73, v108);
                sub_22CD80930(v303, qword_253F426F8);
                v73 = v294;
                swift_storeEnumTagMultiPayload();
                v62 = v297;
                a1 = v298;
                v63 = v296;
                v68 = v290;
                v65 = v293;
                goto LABEL_31;
              case 8uLL:
                OUTLINED_FUNCTION_14_1();
                v234 = 49;
                goto LABEL_132;
              default:
                goto LABEL_132;
            }
          }
        }
        else
        {
          if (v79 == v292)
          {
            if (!v295)
              goto LABEL_32;
            v82 = v295;
            objc_msgSend(v82, sel_value);
            v274 = sub_22CD93910();
            v83 = OUTLINED_FUNCTION_28_0(v274, sel_databaseID);
            sub_22CD93BF8();
            v84 = v303;

            v85 = v68;
            v62 = v297;
            v86 = v298;
            v87 = v84;
            v88 = v296;
            sub_22CD93904();
            v89 = v288;
            v65 = v293;
            sub_22CD93658();

            sub_22CD80930(v87, qword_253F426F8);
            swift_storeEnumTagMultiPayload();
            v90 = (uint64_t)v89;
            a1 = v86;
            v68 = v85;
            v63 = v88;
            v73 = v294;
            goto LABEL_31;
          }
          if (v79 == v273)
          {
            if (v277)
            {
              OUTLINED_FUNCTION_37_0();
              v91 = v63;
              v92 = a1;
              v93 = OUTLINED_FUNCTION_29_0();
              v95 = v94;
              sub_22CD80930(v303, qword_253F426F8);
              v90 = (uint64_t)v288;
              *v288 = v93;
              *(_QWORD *)(v90 + 8) = v95;
              a1 = v92;
              v63 = v91;
              v62 = v297;
              swift_storeEnumTagMultiPayload();
            }
            else
            {
              if (!v269)
                goto LABEL_32;
              OUTLINED_FUNCTION_37_0();
              v102 = OUTLINED_FUNCTION_29_0();
              v104 = v103;
              sub_22CD80930(v303, qword_253F426F8);
              v105 = v288;
              *v288 = v102;
              v105[1] = v104;
              swift_storeEnumTagMultiPayload();
              v90 = (uint64_t)v105;
              a1 = v298;
            }
            goto LABEL_31;
          }
          if (v79 != v261)
          {
            OUTLINED_FUNCTION_14_1();
            v234 = 70;
            goto LABEL_132;
          }
          if (v282)
          {
            OUTLINED_FUNCTION_37_0();
            v96 = OUTLINED_FUNCTION_29_0();
            v98 = v97;
            sub_22CD80930(v303, qword_253F426F8);
            v99 = v63;
            v100 = a1;
            v101 = v288;
            *v288 = v96;
            v101[1] = v98;
            swift_storeEnumTagMultiPayload();
            v90 = (uint64_t)v101;
            a1 = v100;
            v63 = v99;
            v62 = v297;
LABEL_31:
            OUTLINED_FUNCTION_52(v90, 0);
            sub_22CD8C438(v90, v303);
          }
        }
LABEL_32:
        sub_22CD80968(v303, v65, qword_253F426F8);
        if (OUTLINED_FUNCTION_43(v65) != 1)
        {
          OUTLINED_FUNCTION_23_0();
          OUTLINED_FUNCTION_23_0();
          sub_22CD80930(v65, qword_253F426F8);
          goto LABEL_37;
        }
        sub_22CD80930(v65, qword_253F426F8);
        v76 += v299;
        if (!--v74)
        {
          OUTLINED_FUNCTION_23_0();
          OUTLINED_FUNCTION_23_0();
          goto LABEL_37;
        }
      }
    }
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_23_0();
LABEL_37:
    swift_bridgeObjectRelease();
    v110 = v268;
    sub_22CD80968(v303, v268, qword_253F426F8);
    v111 = OUTLINED_FUNCTION_43(v110);
    p_imp = &stru_24F792FF0.imp;
    v113 = v279;
    if (v111 != 1)
    {
      v119 = (char *)&loc_22CD7F98C + *((int *)qword_22CD8A6F0 + swift_getEnumCaseMultiPayload());
      __asm { BR              X10 }
    }
    v114 = v253;
    v115 = v255;
    ((void (*)(uint64_t, _QWORD, uint64_t))v255)(v253, *MEMORY[0x24BDDEB20], v267);
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_51();
    if (v176)
    {
      MEMORY[0x24BDAC7A8](v116);
      OUTLINED_FUNCTION_20_0();
      *(_QWORD *)(v117 - 16) = v114;
      v120 = OUTLINED_FUNCTION_30_0((uint64_t (*)(char *))sub_22CD81B20, v118);
      v258 = v68;
      v63 = v296;
    }
    else
    {
      v120 = v116 & 1;
    }
    v121 = v275;
    v122 = v257;
    OUTLINED_FUNCTION_34_0();
    v123 = *(void (**)(uint64_t))(v121 + 16);
    OUTLINED_FUNCTION_50((uint64_t)v122, v113);
    if (v120)
    {
      v124 = (id)(*(uint64_t (**)(uint64_t *, uint64_t))(v121 + 8))(v122, v113);
    }
    else
    {
      v128 = v246;
      v115();
      v129 = v122;
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_51();
      if (v176)
      {
        v122 = &v234;
        MEMORY[0x24BDAC7A8](v130);
        OUTLINED_FUNCTION_20_0();
        *(_QWORD *)(v131 - 16) = v128;
        v129 = v257;
        v133 = OUTLINED_FUNCTION_30_0((uint64_t (*)(char *))sub_22CD81B20, v132);
        v258 = v121;
        v121 = v275;
        OUTLINED_FUNCTION_47();
      }
      else
      {
        v133 = v130 & 1;
      }
      OUTLINED_FUNCTION_34_0();
      v134 = v247;
      OUTLINED_FUNCTION_50(v247, (uint64_t)v122);
      if (!v133)
      {
        v140 = *(void (**)(uint64_t, uint64_t *))(v121 + 8);
        v140(v134, v129);
        v124 = (id)((uint64_t (*)(uint64_t *, uint64_t *))v140)(v122, v129);
        goto LABEL_55;
      }
      v135 = v242;
      v255();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_51();
      if (v176)
      {
        v122 = &v234;
        MEMORY[0x24BDAC7A8](v136);
        OUTLINED_FUNCTION_20_0();
        *(_QWORD *)(v137 - 16) = v135;
        v139 = OUTLINED_FUNCTION_30_0((uint64_t (*)(char *))sub_22CD81B20, v138);
        v121 = v275;
        v141 = v139;
        OUTLINED_FUNCTION_47();
      }
      else
      {
        v141 = v136 & 1;
      }
      OUTLINED_FUNCTION_34_0();
      v142 = *(void (**)(uint64_t, uint64_t))(v121 + 8);
      v143 = v287;
      v142(v134, v287);
      v124 = (id)((uint64_t (*)(uint64_t *, uint64_t))v142)(v122, v143);
      if (v141)
      {
LABEL_55:
        v144 = OUTLINED_FUNCTION_39((uint64_t)v124, sel_musicKit_playbackID);
        if (v144)
        {
          v145 = v144;
          sub_22CD93BF8();

          v147 = OUTLINED_FUNCTION_39(v146, sel_musicKit_identifierSetSources);
          if (v147)
          {
            v148 = v147;
            v149 = (_QWORD *)sub_22CD93CD0();

            if (v149[2])
            {
              v150 = v123;
              v152 = v149[4];
              v151 = v149[5];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              if (v152 == 0xD000000000000010 && v151 == 0x800000022CD95570)
              {
                swift_bridgeObjectRelease();
                v153 = 0x1F5562000;
LABEL_64:
                sub_22CD93904();
                OUTLINED_FUNCTION_26_0();
                v155 = OUTLINED_FUNCTION_45();
                OUTLINED_FUNCTION_15_1(v155, v156);
                v157 = OUTLINED_FUNCTION_31_0();
                v150(v157);
                sub_22CD93694();
                v63 = v296;
                p_imp = (IMP *)(&stru_24F792FF0 + 16);
LABEL_88:
                v187 = v63;
                sub_22CD93814();
                v189 = v188;
                swift_bridgeObjectRelease();
                if (v189)
                {
                  OUTLINED_FUNCTION_23_0();
                  v190 = v303;
                }
                else
                {
                  v190 = v303;
                  if (v277)
                  {
                    sub_22CD93904();
                    sub_22CD93820();
                  }
                }
                v191 = v263;
                sub_22CD937D8();
                EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v191, 1, v270);
                sub_22CD80930(v191, &qword_253F427B8);
                if (EnumTagSinglePayload == 1 && v187)
                {
                  v193 = v187;
                  v194 = v254;
                  sub_22CD92E7C(v193);
                  __swift_storeEnumTagSinglePayload(v194, 0, 1, v270);
                  sub_22CD937E4();
                }
                v195 = v264;
                sub_22CD936F4();
                v196 = __swift_getEnumTagSinglePayload(v195, 1, v281);
                sub_22CD80930(v195, &qword_253F42780);
                if (v196 == 1 && v295)
                {
                  v198 = v295;
                  objc_msgSend(v198, sel_value);
                  sub_22CD93910();
                  OUTLINED_FUNCTION_49();
                  v200 = OUTLINED_FUNCTION_28_0(v199, sel_databaseID);
                  OUTLINED_FUNCTION_41();
                  OUTLINED_FUNCTION_19_1();
                  OUTLINED_FUNCTION_8_3();
                  OUTLINED_FUNCTION_5_5();

                  OUTLINED_FUNCTION_16_0();
                }
                v201 = (uint64_t)OUTLINED_FUNCTION_3_5(v197, sel_musicKit_cloudID);
                if (v201)
                {
                  sub_22CD93910();
                  v201 = sub_22CD937C0();
                }
                v202 = OUTLINED_FUNCTION_3_5(v201, sel_musicKit_cloudAlbumLibraryID);
                if (v202)
                {
                  OUTLINED_FUNCTION_21();
                  OUTLINED_FUNCTION_33_0();
                  OUTLINED_FUNCTION_32_0();
                  v202 = (id)sub_22CD93760();
                }
                v203 = (uint64_t)OUTLINED_FUNCTION_3_5((uint64_t)v202, sel_musicKit_reportingAdamID);
                if (v203)
                {
                  sub_22CD93910();
                  v203 = sub_22CD9373C();
                }
                v204 = (uint64_t)OUTLINED_FUNCTION_3_5(v203, sel_musicKit_purchasedAdamID);
                if (v204)
                {
                  sub_22CD93910();
                  v204 = sub_22CD93724();
                }
                v205 = (uint64_t)OUTLINED_FUNCTION_3_5(v204, sel_musicKit_assetAdamID);
                if (v205)
                {
                  sub_22CD93910();
                  v205 = sub_22CD936C4();
                }
                v206 = OUTLINED_FUNCTION_3_5(v205, sel_musicKit_deviceLocalID);
                if (v206)
                {
                  v207 = v206;
                  objc_msgSend(v207, sel_value);
                  sub_22CD93910();
                  OUTLINED_FUNCTION_49();
                  v209 = OUTLINED_FUNCTION_28_0(v208, sel_databaseID);
                  OUTLINED_FUNCTION_41();
                  OUTLINED_FUNCTION_19_1();
                  OUTLINED_FUNCTION_8_3();
                  OUTLINED_FUNCTION_5_5();

                  OUTLINED_FUNCTION_16_0();
                }
                v210 = OUTLINED_FUNCTION_3_5((uint64_t)v206, sel_musicKit_formerIDs);
                if (v210)
                {
                  v211 = v210;
                  v212 = sub_22CD93CD0();

                  v213 = *(_QWORD *)(v212 + 16);
                  if (v213)
                  {
                    v214 = v153;
                    v305 = MEMORY[0x24BEE4AF8];
                    sub_22CD8B5D0(0, v213, 0);
                    v215 = v305;
                    v216 = v212 + 40;
                    do
                    {
                      swift_bridgeObjectRetain();
                      v187 = (void *)sub_22CD93904();
                      v218 = v217;
                      v305 = v215;
                      v220 = *(_QWORD *)(v215 + 16);
                      v219 = *(_QWORD *)(v215 + 24);
                      if (v220 >= v219 >> 1)
                      {
                        sub_22CD8B5D0((_QWORD *)(v219 > 1), v220 + 1, 1);
                        v215 = v305;
                      }
                      v216 += 16;
                      *(_QWORD *)(v215 + 16) = v220 + 1;
                      v221 = v215 + 16 * v220;
                      *(_QWORD *)(v221 + 32) = v187;
                      *(_QWORD *)(v221 + 40) = v218;
                      --v213;
                    }
                    while (v213);
                    OUTLINED_FUNCTION_6_0();
                    v153 = v214;
                    p_imp = (IMP *)(&stru_24F792FF0 + 16);
                    v190 = v303;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_6_0();
                    v215 = MEMORY[0x24BEE4AF8];
                  }
                  sub_22CD8AC48(v215);
                  v210 = (id)sub_22CD937FC();
                }
                v222 = OUTLINED_FUNCTION_3_5((uint64_t)v210, *(const char **)(v153 + 952));
                if (v222)
                {
                  v223 = v222;
                  objc_msgSend(v223, sel_value);
                  sub_22CD93910();
                  OUTLINED_FUNCTION_49();
                  v225 = OUTLINED_FUNCTION_28_0(v224, sel_databaseID);
                  OUTLINED_FUNCTION_41();
                  OUTLINED_FUNCTION_19_1();
                  OUTLINED_FUNCTION_8_3();
                  OUTLINED_FUNCTION_5_5();

                  __swift_storeEnumTagSinglePayload((uint64_t)v187, 0, 1, v281);
                  sub_22CD93784();

                }
                v226 = OUTLINED_FUNCTION_3_5((uint64_t)v222, (const char *)p_imp[111]);
                if (v226)
                {
                  OUTLINED_FUNCTION_21();
                  OUTLINED_FUNCTION_33_0();
                  OUTLINED_FUNCTION_32_0();
                  v226 = (id)sub_22CD936AC();
                }
                v227 = OUTLINED_FUNCTION_3_5((uint64_t)v226, sel_musicKit_syncID);
                v228 = v296;
                if (v227)
                {
                  sub_22CD93910();
                  sub_22CD937A8();
                }
                v229 = sub_22CD93874();
                v230 = dynamic_cast_existential_1_conditional(v229);
                if (v230)
                {
                  v231 = OUTLINED_FUNCTION_3_5(v230, sel_musicKit_modelKind);
                  if (v231)
                  {
                    v232 = v231;
                    sub_22CD93634();

                    v228 = v296;
                    sub_22CD9370C();

                  }
                }
                v233 = v271;
                sub_22CD80968(v271, v265, (uint64_t *)&unk_253F42788);
                sub_22CD9367C();

                swift_unknownObjectRelease();
                sub_22CD80930(v233, (uint64_t *)&unk_253F42788);
                (*(void (**)(uint64_t, uint64_t))(v275 + 8))(v279, v287);
                (*(void (**)(uint64_t, uint64_t))(v276 + 8))(v291, v278);
                sub_22CD80930(v190, qword_253F426F8);
                return;
              }
              v154 = sub_22CD93E50();
              swift_bridgeObjectRelease();
              v153 = 0x1F5562000;
              if ((v154 & 1) != 0)
                goto LABEL_64;
              OUTLINED_FUNCTION_6_0();
              p_imp = &stru_24F792FF0.imp;
            }
            else
            {
              OUTLINED_FUNCTION_6_0();
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            OUTLINED_FUNCTION_6_0();
          }
        }
        v158 = v266;
        sub_22CD93850();
        v159 = sub_22CD93868();
        v160 = (*(uint64_t (**)(uint64_t, uint64_t))(v276 + 8))(v158, v278);
        if ((v159 & 1) != 0)
        {
          v161 = OUTLINED_FUNCTION_39(v160, sel_musicKit_containedDeviceLocalID);
          if (v161)
          {
            v162 = v161;
            objc_msgSend(v162, sel_value);
            sub_22CD93910();
            OUTLINED_FUNCTION_49();
            v164 = OUTLINED_FUNCTION_28_0(v163, sel_databaseID);
            OUTLINED_FUNCTION_41();
            OUTLINED_FUNCTION_19_1();
            OUTLINED_FUNCTION_8_3();
            sub_22CD93658();

            OUTLINED_FUNCTION_15_1(v266, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v276 + 16));
            OUTLINED_FUNCTION_38(v262);
            sub_22CD9376C();

LABEL_86:
            v63 = v296;
            goto LABEL_87;
          }
        }
        sub_22CD938F8();
        v165 = OUTLINED_FUNCTION_45();
        v166(v165);
        v167 = v250;
        sub_22CD9397C();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v252 + 16))(v248, v167, v270);
        v168 = *(void (**)(uint64_t, uint64_t, uint64_t))(v276 + 16);
        v168(v266, v291, v278);
        OUTLINED_FUNCTION_38(v262);
        sub_22CD937CC();
        v169 = (uint64_t)v298;
        v170 = (uint64_t)objc_msgSend(v298, sel_musicKit_hasValidIdentifier);
        if ((v170 & 1) == 0)
        {
          v171 = OUTLINED_FUNCTION_3_5(v170, sel_musicKit_identifierSetSources);
          if (v171)
          {
            v172 = v171;
            v173 = (_QWORD *)sub_22CD93CD0();

            if (v173[2])
            {
              v175 = v173[4];
              v174 = v173[5];
              OUTLINED_FUNCTION_37_0();
              OUTLINED_FUNCTION_21_0();
              v176 = v175 == 0x6D6552616964654DLL && v174 == 0xEB0000000065746FLL;
              if (v176)
              {
                OUTLINED_FUNCTION_6_0();
LABEL_85:
                OUTLINED_FUNCTION_13_1();
                goto LABEL_86;
              }
              v177 = sub_22CD93E50();
              OUTLINED_FUNCTION_6_0();
              if ((v177 & 1) != 0)
                goto LABEL_85;
            }
            else
            {
              OUTLINED_FUNCTION_21_0();
            }
          }
        }
        if (qword_253F428F8 != -1)
          swift_once();
        v178 = sub_22CD935C8();
        __swift_project_value_buffer(v178, (uint64_t)qword_253F42990);
        v168(v243, v291, v278);
        swift_unknownObjectRetain_n();
        v179 = sub_22CD935B0();
        v180 = sub_22CD93D3C();
        if (os_log_type_enabled(v179, v180))
        {
          v181 = swift_slowAlloc();
          v182 = swift_slowAlloc();
          v304 = v169;
          v305 = v182;
          *(_DWORD *)v181 = 136315394;
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42900);
          v183 = sub_22CD93C04();
          v304 = sub_22CD82FBC(v183, v184, &v305);
          sub_22CD93D6C();
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v181 + 12) = 2080;
          v185 = sub_22CD9385C();
          v304 = sub_22CD82FBC(v185, v186, &v305);
          sub_22CD93D6C();
          OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_46();
          _os_log_impl(&dword_22CD7D000, v179, v180, "No catalogID, libraryID, or deviceLocalID was found from underlying identifier set %s. A MusicIdentifierSet with empty string, for type %s, is being used.", (uint8_t *)v181, 0x16u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_4();
        }

        OUTLINED_FUNCTION_46();
        swift_unknownObjectRelease_n();
        OUTLINED_FUNCTION_13_1();
        v63 = v296;
        p_imp = (IMP *)(&stru_24F792FF0 + 16);
        goto LABEL_87;
      }
    }
    v124 = OUTLINED_FUNCTION_39((uint64_t)v124, sel_musicKit_playbackID);
    if (v124)
    {
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_15_1(*(_QWORD *)(v125 - 256), v126);
      v127 = OUTLINED_FUNCTION_31_0();
      v123(v127);
      sub_22CD93694();
LABEL_87:
      v153 = (uint64_t)&stru_24F792FF0.imp;
      goto LABEL_88;
    }
    goto LABEL_55;
  }
  OUTLINED_FUNCTION_14_1();
  v234 = 36;
LABEL_132:
  sub_22CD93E14();
  __break(1u);
}

void sub_22CD80930(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_34();
}

void sub_22CD80968(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_34();
}

uint64_t sub_22CD809A8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_22CD93994();
      goto LABEL_5;
    case 1:
    case 2:
    case 4:
      result = swift_bridgeObjectRelease();
      break;
    case 3:
      v3 = sub_22CD93670();
LABEL_5:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_22CD80A2C(uint64_t (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t *, _QWORD);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[4];
  uint64_t v47;

  v42 = a1;
  v43 = a2;
  v3 = sub_22CD938B0();
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v34 - v7;
  v8 = sub_22CD938D4();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDDECF8];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F427D8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v10;
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v36(v12, v2, v8);
  sub_22CD80D00((unint64_t *)&unk_253F427A0, v9, MEMORY[0x24BDDED08]);
  v37 = v12;
  sub_22CD93C94();
  v16 = &v15[*(int *)(v13 + 36)];
  v17 = v9;
  v18 = v8;
  sub_22CD80D00(&qword_253F427B0, v17, MEMORY[0x24BDDED10]);
  v35 = v15;
  v19 = v39;
  while (1)
  {
    v20 = *(_QWORD *)v16;
    sub_22CD93D0C();
    v44 = v46[0];
    v45 = v20;
    if (v20 == v46[0])
    {
LABEL_5:
      v32 = (uint64_t)v15;
      goto LABEL_7;
    }
    v21 = (void (*)(uint64_t *, _QWORD))sub_22CD93D24();
    v22 = v40;
    v23 = v16;
    v24 = v18;
    v25 = v15;
    v26 = v41;
    (*(void (**)(char *))(v40 + 16))(v19);
    v21(v46, 0);
    v27 = v37;
    v28 = v25;
    v18 = v24;
    v16 = v23;
    v36(v37, (uint64_t)v28, v18);
    sub_22CD93D18();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v18);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v6, v19, v26);
    v29 = v47;
    v30 = v42(v6);
    v47 = v29;
    if (v29)
      break;
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v26);
    v15 = v35;
    if ((v31 & 1) != 0)
      goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v26);
  v32 = (uint64_t)v35;
LABEL_7:
  sub_22CD80930(v32, &qword_253F427D8);
  return v45 != v44;
}

void sub_22CD80D00(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x22E308C18](a3, v5), a1);
  }
  OUTLINED_FUNCTION_34();
}

uint64_t sub_22CD80D3C()
{
  return sub_22CD80D58() & 1;
}

uint64_t sub_22CD80D58()
{
  sub_22CD938B0();
  sub_22CD80D00(&qword_253F42798, (uint64_t (*)(uint64_t))MEMORY[0x24BDDEB28], MEMORY[0x24BDDEB38]);
  return sub_22CD93BE0() & 1;
}

uint64_t type metadata accessor for MusicPreferredID()
{
  uint64_t result;

  result = qword_253F426E0;
  if (!qword_253F426E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22CD80E04(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E308C18](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E308C00]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(v2, a2, 1, v3);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_continuation_await();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_22CD933AC();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 344) + 16))(*(_QWORD *)(v0 - 432), *(_QWORD *)(v0 - 216));
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_17()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 264) + 16))(*(_QWORD *)(v2 - 272), v0, v1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_10_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 224) = a1;
  *(_QWORD *)(v1 - 208) = *(_QWORD *)(v1 + 32);
  return sub_22CD93838();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_22CD93838();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v2, v1);
}

void OUTLINED_FUNCTION_0_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_0_11@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_22CD93AB4();
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return sub_22CD93E14();
}

void OUTLINED_FUNCTION_4()
{
  JUMPOUT(0x22E308C84);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_22CD93E14();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_22CD93BE0();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_2_6@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 16))((char *)&a2 - a1, *(_QWORD *)(v4 - 208), v2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
  return sub_22CD93D9C();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, *(_QWORD *)(v1 - 304));
  return sub_22CD93700();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 264) + 16))(*(_QWORD *)(v2 - 272), v0, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_22CD93C28();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_22CD93E50();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 544) + 8))(*(_QWORD *)(v0 - 560), *(_QWORD *)(v0 - 392));
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_22CD935D4();
}

id OUTLINED_FUNCTION_8(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_8_0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_22CD93C28();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_22CD93904();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return sub_22CD934E4();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_22CD93BF8();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, *(_QWORD *)(v3 - 128), v2);
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 216), *(_QWORD *)(v2 - 328));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = v0;
  return dynamic_cast_existential_1_unconditional(v0);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_22CD93904();
}

double OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 96) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_29_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_22CD93EC8();
}

id OUTLINED_FUNCTION_5_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_22CD93E14();
}

uint64_t OUTLINED_FUNCTION_5_3@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 160) + 8))(*(_QWORD *)(v1 - 128), v0);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_22CD93658();
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

id OUTLINED_FUNCTION_5_6(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13)
{
  void *v13;
  uint64_t v14;
  uint64_t v15;

  return sub_22CD91DF8(a1, a2, a3, a4, *(_QWORD *)(v15 - 168), v14, v13, *(_QWORD *)(v15 - 144), a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_4@<X0>(unsigned int *a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 - 144) + 104))(*(_QWORD *)(v1 - 168), *a1, *(_QWORD *)(v1 - 136));
}

id OUTLINED_FUNCTION_3_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_22_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return sub_22CD93D54();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 464);
}

void OUTLINED_FUNCTION_31_1()
{
  uint64_t v0;
  uint64_t v1;

  sub_22CD7EB64(v1, v0);
}

uint64_t OUTLINED_FUNCTION_31_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v0, v2, v1);
}

id OUTLINED_FUNCTION_4_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

unint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 352) + 16))(*(_QWORD *)(v1 - 464), v0, *(_QWORD *)(v1 - 248));
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_22CD93838();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_continuation_init();
}

void OUTLINED_FUNCTION_33_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_33_1(uint64_t a1)
{
  return dynamic_cast_existential_1_unconditional(a1);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_27_1@<X0>(unsigned int *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(v2 - 168) - 8) + 104))(v1, *a1, *(_QWORD *)(v2 - 168));
}

void OUTLINED_FUNCTION_27_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_22CD80968(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_22CD93CAC();
}

uint64_t OUTLINED_FUNCTION_24_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_24_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_22CD80968(*(_QWORD *)(v4 - 224), v3, a3);
}

void OUTLINED_FUNCTION_35()
{
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 256);
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_35_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 216) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 352) + 16))(*(_QWORD *)(v1 - 464), v0, *(_QWORD *)(v1 - 248));
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_22CD82324(v1, v0);
}

void OUTLINED_FUNCTION_9_2()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = v0 + 120;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_22CD82324(v2, a2);
}

uint64_t OUTLINED_FUNCTION_9_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

void OUTLINED_FUNCTION_7_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_22CD93C28();
}

void OUTLINED_FUNCTION_7_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_7_3()
{
  JUMPOUT(0x22E30851CLL);
}

void OUTLINED_FUNCTION_7_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_22CD93BA4();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_22CD93904();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return 0;
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result;

  result = swift_conformsToProtocol2();
  if (result)
    return a1;
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_6_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v2, v3, v1);
}

void OUTLINED_FUNCTION_6_6(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

id OUTLINED_FUNCTION_39(uint64_t a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSend(*(id *)(v2 - 160), a2);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD, _QWORD);
  uint64_t v2;

  return v1(a1, *(_QWORD *)(v2 - 320), *(_QWORD *)(v2 - 248));
}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_22CD938E0();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11_1()
{
  JUMPOUT(0x22E30851CLL);
}

uint64_t OUTLINED_FUNCTION_36@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_36_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_36_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(*(_QWORD *)(a1 - 256), v2, v3);
}

uint64_t OUTLINED_FUNCTION_36_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 216) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
}

BOOL OUTLINED_FUNCTION_30_0(uint64_t (*a1)(char *), uint64_t a2)
{
  return sub_22CD80A2C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 208) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

id OUTLINED_FUNCTION_28_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_22CD93898();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_22CD93BEC();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v0, v3);
}

uint64_t OUTLINED_FUNCTION_25_2(uint64_t a1, unint64_t *a2)
{
  return sub_22CD85864(0, a2);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvs_0();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_22CD938BC();
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 264));
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_22CD93E20();
}

uint64_t sub_22CD81B20()
{
  return sub_22CD80D3C() & 1;
}

uint64_t dispatch thunk of LegacyModelObjectConvertible.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_22CD81B44(uint64_t a1)
{
  return sub_22CD7E9A8(a1, qword_253F426A8, (void (*)(uint64_t, _QWORD))sub_22CD7EB50, (void (*)(_QWORD))MEMORY[0x24BDDF618]);
}

uint64_t sub_22CD81B60()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22CD93994();
  if (v1 <= 0x3F)
  {
    result = sub_22CD93670();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t Track.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  void (*v27)(uint64_t, uint64_t, uint64_t);
  unsigned int *v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42698);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  v7 = sub_22CD93AE4();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  v33 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42890);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  v14 = sub_22CD938EC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0();
  v18 = v17 - v16;
  v19 = sub_22CD93B20();
  v34 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0();
  v22 = v21 - v20;
  v24 = (uint64_t)OUTLINED_FUNCTION_8(v23, sel_hasVideo);
  if ((_DWORD)v24)
  {
    v24 = (uint64_t)OUTLINED_FUNCTION_8(v24, sel_isArtistUploadedContent);
    if ((v24 & 1) == 0)
    {
      v31 = a1;
      sub_22CD81E9C((uint64_t)v31, &qword_253F42890, (void (*)(_QWORD))MEMORY[0x24BDDEE48], (void (*)(uint64_t, _QWORD))sub_22CD8D6A4);
      if (__swift_getEnumTagSinglePayload(v13, 1, v14) != 1)
      {

        v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
        v29(v18, v13, v14);
        v29(v22, v18, v14);
        v28 = (unsigned int *)MEMORY[0x24BDDF6A0];
        goto LABEL_12;
      }
      v24 = sub_22CD82324(v13, &qword_253F42890);
    }
  }
  if ((OUTLINED_FUNCTION_8(v24, sel_hasVideo) & 1) == 0)
  {
    sub_22CD81E9C((uint64_t)a1, (uint64_t *)&unk_253F42698, (void (*)(_QWORD))MEMORY[0x24BDDF500], (void (*)(uint64_t, _QWORD))sub_22CD8D868);
    if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
    {
      v25 = sub_22CD82324(v6, (uint64_t *)&unk_253F42698);
      goto LABEL_9;
    }
    v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32);
    v27(v33, v6, v7);
    v27(v22, v33, v7);
    v28 = (unsigned int *)MEMORY[0x24BDDF6C8];
LABEL_12:
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v34 + 104))(v22, *v28, v19);
    v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(a2, v22, v19);
    v26 = 0;
    return OUTLINED_FUNCTION_1(v25, v26);
  }

LABEL_9:
  v26 = 1;
  return OUTLINED_FUNCTION_1(v25, v26);
}

uint64_t sub_22CD81E9C(uint64_t a1, uint64_t *a2, void (*a3)(_QWORD), void (*a4)(uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5();
  a3(0);
  a4(a1, MEMORY[0x24BEE4AF8]);
  if (OUTLINED_FUNCTION_6())
  {
    v8 = OUTLINED_FUNCTION_9_1();
    v9 = 1;
  }
  else
  {
    v8 = OUTLINED_FUNCTION_4_0();
    v9 = 0;
  }
  return OUTLINED_FUNCTION_1(v8, v9);
}

uint64_t sub_22CD81F30(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F428E0, (void (*)(_QWORD))MEMORY[0x24BDDFB58], (void (*)(uint64_t, _QWORD))sub_22CD8DB78);
}

uint64_t sub_22CD81F4C(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F428D0, (void (*)(uint64_t, _QWORD))sub_22CD8DB64, (void (*)(_QWORD))MEMORY[0x24BDDF9A8]);
}

uint64_t sub_22CD81F68(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F42890, (void (*)(uint64_t, _QWORD))sub_22CD8D6A4, (void (*)(_QWORD))MEMORY[0x24BDDEE48]);
}

uint64_t sub_22CD81F84(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F42840, (void (*)(_QWORD))MEMORY[0x24BE6A260], (void (*)(uint64_t, _QWORD))sub_22CD8D2D8);
}

uint64_t sub_22CD81FA0(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_255C459A0, (void (*)(_QWORD))MEMORY[0x24BDDFAD0], (void (*)(uint64_t, _QWORD))sub_22CD8DBA8);
}

uint64_t sub_22CD81FBC(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42820, (void (*)(uint64_t, _QWORD))sub_22CD8D144, (void (*)(_QWORD))MEMORY[0x24BE6A170]);
}

uint64_t sub_22CD81FD8(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F42868, (void (*)(uint64_t, _QWORD))sub_22CD8D634, (void (*)(_QWORD))MEMORY[0x24BE6A540]);
}

uint64_t sub_22CD81FF4(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F428A0, (void (*)(uint64_t, _QWORD))sub_22CD8D854, (void (*)(_QWORD))MEMORY[0x24BDDEFB0]);
}

uint64_t sub_22CD82010(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F428E8, (void (*)(uint64_t, _QWORD))sub_22CD8DDA8, (void (*)(_QWORD))MEMORY[0x24BDDFBC0]);
}

uint64_t sub_22CD8202C(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F42870, (void (*)(uint64_t, _QWORD))sub_22CD8D66C, (void (*)(_QWORD))MEMORY[0x24BE6A5E8]);
}

uint64_t sub_22CD82048(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42848, (void (*)(uint64_t, _QWORD))sub_22CD8D2F4, (void (*)(_QWORD))MEMORY[0x24BE6A2D0]);
}

uint64_t sub_22CD82064(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42830, (void (*)(uint64_t, _QWORD))sub_22CD8D160, (void (*)(_QWORD))MEMORY[0x24BE6A1F8]);
}

uint64_t sub_22CD82080(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F428B8, (void (*)(uint64_t, _QWORD))sub_22CD8D9F0, (void (*)(_QWORD))MEMORY[0x24BDDF7E0]);
}

uint64_t sub_22CD8209C(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F428E0, (void (*)(uint64_t, _QWORD))sub_22CD8DB78, (void (*)(_QWORD))MEMORY[0x24BDDFB58]);
}

uint64_t sub_22CD820B8(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F42878, (void (*)(uint64_t, _QWORD))sub_22CD8D688, (void (*)(_QWORD))MEMORY[0x24BE6A698]);
}

uint64_t sub_22CD820D4(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42810, (void (*)(uint64_t, _QWORD))sub_22CD8CF44, (void (*)(_QWORD))MEMORY[0x24BE69DF8]);
}

uint64_t sub_22CD820F0(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_255C459A8, (void (*)(uint64_t, _QWORD))sub_22CD8D650, MEMORY[0x24BE6A580]);
}

uint64_t sub_22CD8210C(uint64_t a1)
{
  return sub_22CD81E9C(a1, qword_253F426A8, (void (*)(_QWORD))MEMORY[0x24BDDF618], (void (*)(uint64_t, _QWORD))sub_22CD7EB50);
}

uint64_t sub_22CD82128(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_253F428B8, (void (*)(_QWORD))MEMORY[0x24BDDF7E0], (void (*)(uint64_t, _QWORD))sub_22CD8D9F0);
}

uint64_t sub_22CD82144(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_253F42820, (void (*)(_QWORD))MEMORY[0x24BE6A170], (void (*)(uint64_t, _QWORD))sub_22CD8D144);
}

uint64_t sub_22CD82160(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F428C8, (void (*)(_QWORD))MEMORY[0x24BDDF938], (void (*)(uint64_t, _QWORD))sub_22CD8DA04);
}

uint64_t sub_22CD8217C(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F428E8, (void (*)(_QWORD))MEMORY[0x24BDDFBC0], (void (*)(uint64_t, _QWORD))sub_22CD8DDA8);
}

uint64_t sub_22CD82198(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_253F42830, (void (*)(_QWORD))MEMORY[0x24BE6A1F8], (void (*)(uint64_t, _QWORD))sub_22CD8D160);
}

uint64_t sub_22CD821B4(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_253F42810, (void (*)(_QWORD))MEMORY[0x24BE69DF8], (void (*)(uint64_t, _QWORD))sub_22CD8CF44);
}

uint64_t sub_22CD821D0(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F428A0, (void (*)(_QWORD))MEMORY[0x24BDDEFB0], (void (*)(uint64_t, _QWORD))sub_22CD8D854);
}

uint64_t sub_22CD821EC(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_253F428D0, (void (*)(_QWORD))MEMORY[0x24BDDF9A8], (void (*)(uint64_t, _QWORD))sub_22CD8DB64);
}

uint64_t sub_22CD82208(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F42878, (void (*)(_QWORD))MEMORY[0x24BE6A698], (void (*)(uint64_t, _QWORD))sub_22CD8D688);
}

uint64_t sub_22CD82224(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F42870, (void (*)(_QWORD))MEMORY[0x24BE6A5E8], (void (*)(uint64_t, _QWORD))sub_22CD8D66C);
}

uint64_t sub_22CD82240(uint64_t a1)
{
  return sub_22CD81E9C(a1, &qword_253F42868, (void (*)(_QWORD))MEMORY[0x24BE6A540], (void (*)(uint64_t, _QWORD))sub_22CD8D634);
}

uint64_t sub_22CD8225C(uint64_t a1)
{
  return sub_22CD81E9C(a1, (uint64_t *)&unk_255C45990, (void (*)(_QWORD))MEMORY[0x24BE6AE98], (void (*)(uint64_t, _QWORD))sub_22CD8DB8C);
}

uint64_t sub_22CD82278(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42698, (void (*)(uint64_t, _QWORD))sub_22CD8D868, (void (*)(_QWORD))MEMORY[0x24BDDF500]);
}

uint64_t sub_22CD82294(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_255C459A0, (void (*)(uint64_t, _QWORD))sub_22CD8DBA8, (void (*)(_QWORD))MEMORY[0x24BDDFAD0]);
}

uint64_t sub_22CD822B0(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F428C8, (void (*)(uint64_t, _QWORD))sub_22CD8DA04, (void (*)(_QWORD))MEMORY[0x24BDDF938]);
}

uint64_t sub_22CD822CC(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_255C45990, (void (*)(uint64_t, _QWORD))sub_22CD8DB8C, (void (*)(_QWORD))MEMORY[0x24BE6AE98]);
}

uint64_t sub_22CD822E8(uint64_t a1)
{
  return sub_22CD7E9A8(a1, (uint64_t *)&unk_253F42858, (void (*)(uint64_t, _QWORD))sub_22CD8D494, (void (*)(_QWORD))MEMORY[0x24BE6A348]);
}

uint64_t sub_22CD82304(uint64_t a1)
{
  return sub_22CD7E9A8(a1, &qword_253F42840, (void (*)(uint64_t, _QWORD))sub_22CD8D2D8, (void (*)(_QWORD))MEMORY[0x24BE6A260]);
}

uint64_t sub_22CD82324(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t MusicCollaborativePlaylist.EndCollaborationRequest.init(playlist:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93BA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  v14 = a1;
  sub_22CD81F30((uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {

    sub_22CD824CC((uint64_t)v6);
    v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_22CD93430();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    v15 = 0;
  }
  v16 = sub_22CD93448();
  return __swift_storeEnumTagSinglePayload(a2, v15, 1, v16);
}

uint64_t sub_22CD824CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MusicCollaborativePlaylist.EndCollaborationRequest.perform()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_22CD82554;
  return sub_22CD9343C();
}

uint64_t sub_22CD82554(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_22CD825C8()
{
  uint64_t v0;
  uint64_t v2;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 48);
  sub_22CD93D9C();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_22CD93C28();
  *(_QWORD *)(v0 + 32) = v2;
  sub_22CD93DFC();
  sub_22CD93C28();
  return sub_22CD93E14();
}

uint64_t Artwork.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v7[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_253F427C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[4] = &type metadata for SoftLinking_ArtworkCatalog;
  v7[5] = sub_22CD827AC();
  v7[1] = a1;
  v5 = sub_22CD93B44();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  return sub_22CD93B50();
}

unint64_t sub_22CD827AC()
{
  unint64_t result;

  result = qword_253F42770;
  if (!qword_253F42770)
  {
    result = MEMORY[0x22E308C18](&unk_22CD943E8, &type metadata for SoftLinking_ArtworkCatalog);
    atomic_store(result, (unint64_t *)&qword_253F42770);
  }
  return result;
}

id static MusicVideo.canBeConverted(from:)(void *a1)
{
  id result;

  result = objc_msgSend(a1, sel_hasVideo);
  if ((_DWORD)result)
    return (id)(objc_msgSend(a1, sel_isArtistUploadedContent) ^ 1);
  return result;
}

uint64_t LegacyModelObjectConvertible<>.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v8 = sub_22CD93D54();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - v10;
  sub_22CD935E0();
  v12 = sub_22CD93CE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, v12, a2, a3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, a2))
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v13 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a4, v11, a2);
    v13 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a4, v13, 1, a2);
}

void LegacyModelObjectConvertible<>.init(_:requestedRelationshipProperties:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD v39[2];
  uint64_t v40;
  uint64_t v41;

  v37 = a4;
  v38 = a6;
  v11 = sub_22CD93898();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3_0();
  v13 = sub_22CD93838();
  v35 = *(_QWORD *)(v13 - 8);
  v36 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v33 - v17;
  if (((*(uint64_t (**)(void *, uint64_t, uint64_t))(a5 + 32))(a1, a3, a5) & 1) == 0)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    v26 = 1;
    v25 = v38;
    goto LABEL_6;
  }
  v33[1] = a2;
  if (!dynamic_cast_existential_1_conditional(a3))
  {
    swift_bridgeObjectRelease();
    if (qword_253F428F8 != -1)
      swift_once();
    v27 = sub_22CD935C8();
    __swift_project_value_buffer(v27, (uint64_t)qword_253F42990);
    v28 = sub_22CD935B0();
    v29 = sub_22CD93D3C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_QWORD *)&v39[0] = swift_slowAlloc();
      *(_DWORD *)v30 = 136315138;
      v31 = OUTLINED_FUNCTION_5_0();
      v41 = sub_22CD82FBC(v31, v32, (uint64_t *)v39);
      sub_22CD93D6C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22CD7D000, v28, v29, "Cannot create a MusicIdentifierSet for item type %s, that does not conform to MusicItemTypeValueProviding.", v30, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
    }

    goto LABEL_5;
  }
  v19 = objc_msgSend(a1, sel_identifiers);
  v34 = a3;
  v20 = v19;
  sub_22CD938BC();
  sub_22CD7EB64(v6, (uint64_t)v18);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v6, v11);
  v22 = v35;
  v21 = v36;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v16, v18, v36);
  v40 = 0;
  memset(v39, 0, sizeof(v39));
  sub_22CD935E0();
  sub_22CD935D4();
  v23 = a1;
  v24 = sub_22CD93DF0();
  OUTLINED_FUNCTION_6_0();
  v25 = v38;
  MEMORY[0x22E30851C](v16, v23, v39, v24, v34, v37);

  a3 = v34;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v18, v21);
  v26 = 0;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v25, v26, 1, a3);
  OUTLINED_FUNCTION_1_0();
}

uint64_t LegacyModelObjectConvertible<>.convertToLegacyModelObject(reason:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  id v13;
  id v14;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_2_0();
  v8 = sub_22CD884D4(v6, v7);
  v9 = objc_msgSend(v8, sel__underlyingModelObject);
  swift_getAssociatedTypeWitness();
  v10 = swift_dynamicCastUnknownClass();
  if (v10)
  {
    v11 = v10;

    return v11;
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, a2);
    sub_22CD93D9C();
    sub_22CD93C28();
    v13 = objc_msgSend(v8, sel__underlyingModelObject, 0, 0xE000000000000000);
    v14 = objc_msgSend(v13, sel_description);
    sub_22CD93BF8();

    sub_22CD93C28();
    swift_bridgeObjectRelease();
    sub_22CD93C28();
    swift_getDynamicType();
    OUTLINED_FUNCTION_5_0();
    sub_22CD93C28();
    OUTLINED_FUNCTION_6_0();
    sub_22CD93C28();
    OUTLINED_FUNCTION_5_0();
    sub_22CD93C28();
    OUTLINED_FUNCTION_6_0();
    sub_22CD93C28();
    result = sub_22CD93E14();
    __break(1u);
  }
  return result;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_22CD82FBC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_22CD8308C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22CD836F0((uint64_t)v12, *a3);
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
      sub_22CD836F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22CD8308C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_22CD831E0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22CD93D78();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_22CD832A4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_22CD93DB4();
    if (!v8)
    {
      result = sub_22CD93E08();
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

void *sub_22CD831E0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22CD93E2C();
  __break(1u);
  return result;
}

uint64_t sub_22CD832A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22CD83338(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22CD834A8(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22CD834A8((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22CD83338(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_22CD93C34();
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
  v3 = sub_22CD85BC8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_22CD93DA8();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_22CD93E2C();
  __break(1u);
LABEL_14:
  result = sub_22CD93E08();
  __break(1u);
  return result;
}

char *sub_22CD834A8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_255C45A68);
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
    sub_22CD83640(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22CD8357C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22CD8357C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22CD93E2C();
  __break(1u);
  return result;
}

char *sub_22CD83640(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22CD93E2C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t dispatch thunk of LegacyModelObjectConvertible.init(_:requestedRelationshipProperties:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of static LegacyModelObjectConvertible.canBeConverted(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
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

uint64_t sub_22CD836F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for SoftLinking_ArtworkCatalog()
{
  return &type metadata for SoftLinking_ArtworkCatalog;
}

uint64_t sub_22CD83740(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_22CD93BC8();

  return v4;
}

uint64_t sub_22CD837A8(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_22CD93BF8();

  return v4;
}

id sub_22CD83804@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id result;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_253F427C0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CD93B44();
  v5 = OUTLINED_FUNCTION_6_1(a1, 1);
  result = OUTLINED_FUNCTION_4_1(v5, sel_musicKit_existingColorAnalysis);
  if (result)
  {
    v7 = OUTLINED_FUNCTION_4_1((uint64_t)objc_msgSend(result, sel_musicKit_backgroundColor), sel_musicKit_primaryTextColor);
    v8 = OUTLINED_FUNCTION_4_1((uint64_t)v7, sel_musicKit_secondaryTextColor);
    v9 = OUTLINED_FUNCTION_4_1((uint64_t)v8, sel_musicKit_tertiaryTextColor);
    sub_22CD93B38();
    swift_unknownObjectRelease();
    sub_22CD84020(a1);
    OUTLINED_FUNCTION_6_1((uint64_t)v4, 0);
    return (id)sub_22CD84060((uint64_t)v4, a1, qword_253F427C0);
  }
  return result;
}

id sub_22CD83950(void *a1)
{
  return objc_msgSend(a1, sel_musicKit_fittingSize);
}

id sub_22CD8395C()
{
  id *v0;

  return objc_msgSend(*v0, sel_musicKit_setFittingSize_);
}

uint64_t sub_22CD8396C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = a1;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22CD8397C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_9_2();
  v0[2] = v0;
  v0[3] = sub_22CD839F4;
  v1 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v2 = v0 + 10;
  v2[1] = 0x40000000;
  v2[2] = sub_22CD83A8C;
  v2[3] = &block_descriptor_4;
  v2[4] = v1;
  OUTLINED_FUNCTION_8_0(v1, sel_musicKit_requestImageDataWithCompletion_);
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_22CD839F4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_7_0();
  *v1 = v0;
  *(_QWORD *)(v2 + 144) = *(_QWORD *)(v2 + 48);
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD83A40()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128));
}

uint64_t sub_22CD83A50()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22CD83A8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_22CD83B04(v3, (uint64_t)a3);
  v5 = a2;
  v6 = sub_22CD9337C();
  v8 = v7;

  return sub_22CD83B54(v3, v6, v8);
}

uint64_t sub_22CD83B04(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45A98);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_22CD83B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 40);
  *v3 = a2;
  v3[1] = a3;
  return swift_continuation_throwingResume();
}

uint64_t sub_22CD83B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22CD83B78()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_9_2();
  v0[2] = v0;
  v0[3] = sub_22CD83BF0;
  v1 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v2 = v0 + 10;
  v2[1] = 0x40000000;
  v2[2] = sub_22CD83D18;
  v2[3] = &block_descriptor;
  v2[4] = v1;
  OUTLINED_FUNCTION_8_0(v1, sel_musicKit_requestColorAnalysisWithCompletionHandler_);
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_22CD83BF0()
{
  OUTLINED_FUNCTION_7_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD83C28(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v1 + 120))
  {
    v2 = OUTLINED_FUNCTION_5_1(a1, sel_musicKit_backgroundColor);
    v3 = OUTLINED_FUNCTION_5_1((uint64_t)v2, sel_musicKit_primaryTextColor);
    v4 = OUTLINED_FUNCTION_5_1((uint64_t)v3, sel_musicKit_secondaryTextColor);
    v5 = OUTLINED_FUNCTION_5_1((uint64_t)v4, sel_musicKit_tertiaryTextColor);
  }
  v6 = *(_QWORD *)(v1 + 128);
  sub_22CD93B38();
  swift_unknownObjectRelease();
  v7 = sub_22CD93B44();
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v7);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_22CD83D18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  swift_unknownObjectRetain();
  return sub_22CD83D48(v3, a2);
}

uint64_t sub_22CD83D48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  sub_22CD84060((uint64_t)&v3, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &qword_255C45A88);
  return swift_continuation_resume();
}

uint64_t sub_22CD83D90@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  a2[3] = swift_getObjectType();
  *a2 = a1;
  return swift_unknownObjectRetain();
}

uint64_t sub_22CD83DC0()
{
  void **v0;

  return sub_22CD837A8(*v0, (SEL *)&selRef_musicKit_artworkDataSourceShortDescription);
}

uint64_t sub_22CD83DE0()
{
  void **v0;

  return sub_22CD837A8(*v0, (SEL *)&selRef_musicKit_artworkDataSourceIdentifier);
}

uint64_t sub_22CD83E00()
{
  void **v0;

  return sub_22CD83740(*v0, (SEL *)&selRef_musicKit_artworkTokenParameters);
}

uint64_t sub_22CD83E34()
{
  void **v0;

  return sub_22CD83740(*v0, (SEL *)&selRef_musicKit_artworkDictionary);
}

uint64_t sub_22CD83E70()
{
  void **v0;

  return sub_22CD837A8(*v0, (SEL *)&selRef_musicKit_visualIdenticalityIdentifier);
}

id sub_22CD83E90@<X0>(uint64_t a1@<X8>)
{
  return sub_22CD83804(a1);
}

id sub_22CD83E98()
{
  void **v0;

  return sub_22CD83950(*v0);
}

id (*sub_22CD83EA4(_QWORD *a1))()
{
  void **v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  sub_22CD83950(*v1);
  *a1 = v3;
  a1[1] = v4;
  return sub_22CD83EDC;
}

id sub_22CD83EDC()
{
  return sub_22CD8395C();
}

uint64_t sub_22CD83F00()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22CD83F4C;
  return sub_22CD8396C(v2);
}

uint64_t sub_22CD83F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = OUTLINED_FUNCTION_0_1();
  if (!v2)
  {
    v6 = a1;
    v7 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v6, v7);
}

uint64_t sub_22CD83F94(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22CD83FEC;
  return sub_22CD83B68(a1, v4);
}

uint64_t sub_22CD83FEC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22CD84018@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_22CD83D90(*v1, a1);
}

uint64_t sub_22CD84020(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_253F427C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22CD84060(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_22CD840A4()
{
  sub_22CD840C8();
}

void sub_22CD840C8()
{
  unint64_t *v0;
  unint64_t *v1;
  uint64_t (*v2)(char *, uint64_t);
  uint64_t (*v3)(char *, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  OUTLINED_FUNCTION_23();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6(0);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_18();
  v10 = v8 - v9;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v23 - v12;
  v14 = sub_22CD93AB4();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0();
  v17 = v16 - v15;
  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v16 - v15, v5);
  OUTLINED_FUNCTION_24((uint64_t)v13);
  v19 = (void *)v3(v13, v17);
  v20 = objc_msgSend(v19, sel__underlyingModelObject);
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {

    OUTLINED_FUNCTION_24(v10);
    v23[0] = 0;
    v23[1] = 0xE000000000000000;
    sub_22CD93D9C();
    OUTLINED_FUNCTION_13();
    v21 = objc_msgSend(v19, sel__underlyingModelObject);
    v22 = objc_msgSend(v21, sel_description);
    sub_22CD93BF8();

    sub_22CD93C28();
    swift_bridgeObjectRelease();
    sub_22CD93C28();
    sub_22CD93EC8();
    sub_22CD93C28();
    OUTLINED_FUNCTION_12();
    sub_22CD93C28();
    sub_22CD85864(0, v1);
    sub_22CD93EC8();
    sub_22CD93C28();
    swift_bridgeObjectRelease();
    sub_22CD93C28();
    OUTLINED_FUNCTION_11();
    v23[0] = 33;
    sub_22CD93E14();
    OUTLINED_FUNCTION_35();
  }

  OUTLINED_FUNCTION_1_0();
}

void MusicLibraryPlaylistEditViewModel.init(_:authorProfile:mediaLibrary:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_23();
  v31 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42840);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_18();
  v16 = v14 - v15;
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_30();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v30 - v19;
  v21 = OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_14((uint64_t)v20, v22, v23, v21);
  if (v8)
  {
    sub_22CD81F30((uint64_t)v8);
    sub_22CD80930((uint64_t)v20, &qword_253F428E0);
    sub_22CD8453C(v2, (uint64_t)v20, &qword_253F428E0);
  }
  v24 = sub_22CD93568();
  OUTLINED_FUNCTION_14((uint64_t)v12, v25, v26, v24);
  if (v6)
  {
    sub_22CD81F84((uint64_t)v6);
    sub_22CD80930((uint64_t)v12, &qword_253F42840);
    sub_22CD8453C(v1, (uint64_t)v12, &qword_253F42840);
  }
  sub_22CD9394C();
  v27 = v4;
  sub_22CD865E4(v27);
  sub_22CD84510((uint64_t)v20, v16, &qword_253F428E0);
  sub_22CD84510((uint64_t)v12, v1, &qword_253F42840);
  v28 = v6;
  v29 = v8;
  sub_22CD93538();

  sub_22CD80930((uint64_t)v12, &qword_253F42840);
  sub_22CD80930((uint64_t)v20, &qword_253F428E0);
  OUTLINED_FUNCTION_1_0();
}

void sub_22CD84510(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_22(a1, a2, a3);
  OUTLINED_FUNCTION_36(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_34();
}

void sub_22CD8453C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_22(a1, a2, a3);
  OUTLINED_FUNCTION_36(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_34();
}

void MusicLibraryPlaylistEditViewModel.init(_:initialTracklist:authorProfile:mediaLibrary:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;

  OUTLINED_FUNCTION_23();
  v36 = v1;
  v40 = v2;
  v4 = v3;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42840);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_29();
  v38 = v8;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_29();
  v37 = v13;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v35 - v15;
  v17 = OUTLINED_FUNCTION_32();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_0();
  v21 = v20 - v19;
  v22 = v6;
  sub_22CD81F30((uint64_t)v22);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_22CD80930((uint64_t)v16, &qword_253F428E0);
    v41 = 0;
    v42 = 0xE000000000000000;
    sub_22CD93D9C();
    OUTLINED_FUNCTION_8_1();
    v34 = objc_msgSend(v22, sel_description);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_11();
    v35 = 43;
    OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_35();
  }
  v23 = v4;
  v39 = v0;
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v16, v17);
  v24 = sub_22CD93568();
  OUTLINED_FUNCTION_14((uint64_t)v11, v25, v26, v24);
  v27 = v38;
  if (v40)
  {
    sub_22CD81F84((uint64_t)v40);
    sub_22CD80930((uint64_t)v11, &qword_253F42840);
    sub_22CD8453C(v27, (uint64_t)v11, &qword_253F42840);
  }
  sub_22CD9394C();
  v28 = v36;
  v36 = (id)sub_22CD865E4(v28);
  v29 = v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v37, v21, v17);
  __swift_storeEnumTagSinglePayload(v29, 0, 1, v17);
  v30 = (uint64_t)v11;
  sub_22CD84510((uint64_t)v11, v27, &qword_253F42840);
  v31 = v22;
  v32 = v18;
  v33 = v23;
  sub_22CD93538();

  sub_22CD80930(v30, &qword_253F42840);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v21, v17);
  OUTLINED_FUNCTION_1_0();
}

uint64_t MusicLibraryPlaylistEditViewModel.tracklist.getter()
{
  uint64_t result;

  result = sub_22CD93514();
  if (result)
  {
    objc_opt_self();
    result = swift_dynamicCastObjCClass();
    if (!result)
    {
      result = sub_22CD93E14();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22CD84908()
{
  swift_bridgeObjectRetain();
  return MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.setter();
}

void (*MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvg_0();
  a1[1] = v3;
  return sub_22CD8497C;
}

void sub_22CD8497C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_26();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_31();
  }
}

uint64_t sub_22CD849C4()
{
  uint64_t result;

  sub_22CD934F0();
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    result = sub_22CD93E14();
    __break(1u);
  }
  return result;
}

uint64_t MusicLibraryPlaylistEditViewModel.append(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22CD84A6C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[15];
  v2 = (void *)sub_22CD849C4();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_22CD84B10;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_22CD84BB4;
  v4[3] = &block_descriptor_0;
  v4[4] = v3;
  objc_msgSend(v2, sel_appendItem_completion_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_22CD84B10()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_17();
  *(_QWORD *)(v0 + 144) = v1;
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD84B50()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_3_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CD84B7C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return OUTLINED_FUNCTION_2_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CD84BB4(uint64_t a1, void *a2)
{
  if (a2)
    return sub_22CD83B00(*(_QWORD *)(a1 + 32), a2);
  else
    return j__swift_continuation_throwingResume();
}

uint64_t MusicLibraryPlaylistEditViewModel.insert(_:after:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[24] = a2;
  v3[25] = v2;
  v3[23] = a1;
  return OUTLINED_FUNCTION_3_1();
}

uint64_t sub_22CD84C04()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (void *)v0[24];
  v2 = v0[23];
  if (v1)
  {
    v3 = v1;
    v4 = (void *)sub_22CD849C4();
    v0[26] = v4;
    v0[10] = v0;
    v0[11] = sub_22CD84D2C;
    v0[22] = OUTLINED_FUNCTION_33();
    v0[18] = MEMORY[0x24BDAC760];
    v0[19] = 0x40000000;
    v0[20] = sub_22CD84BB4;
    v0[21] = &block_descriptor_4_0;
    objc_msgSend(v4, sel_insertItem_afterEntry_completion_, v2, v3, v0 + 18);
  }
  else
  {
    v5 = (void *)sub_22CD849C4();
    v0[28] = v5;
    v0[2] = v0;
    v0[3] = sub_22CD84DB4;
    v0[22] = OUTLINED_FUNCTION_33();
    v0[18] = MEMORY[0x24BDAC760];
    v0[19] = 0x40000000;
    v0[20] = sub_22CD84BB4;
    v0[21] = &block_descriptor_2;
    objc_msgSend(v5, sel_insertItemAtStart_completion_, v2, v0 + 18);
  }
  return swift_continuation_await();
}

uint64_t sub_22CD84D2C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD84D80()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);

  return OUTLINED_FUNCTION_3_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CD84DB4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_17();
  *(_QWORD *)(v0 + 232) = v1;
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD84DF4()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_3_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CD84E20()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 192);
  swift_willThrow();

  return OUTLINED_FUNCTION_2_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22CD84E60()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 224);
  swift_willThrow();

  return OUTLINED_FUNCTION_2_1(*(uint64_t (**)(void))(v0 + 8));
}

void MusicLibraryPlaylistEditViewModel.move(_:after:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[12];
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_23();
  v27 = v2;
  v28 = v3;
  v5 = v4;
  v7 = v6;
  v8 = sub_22CD93B98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_18();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v26 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C459A0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_30();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v26 - v19;
  OUTLINED_FUNCTION_27((uint64_t)v26 - v19, 1);
  v21 = v7;
  sub_22CD81FA0((uint64_t)v21);
  if (OUTLINED_FUNCTION_28(v1) == 1)
  {
    sub_22CD80930(v1, &qword_255C459A0);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_8_1();
    v23 = objc_msgSend(v21, sel_description);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_11();
    v24 = 103;
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_37((uint64_t)v15, v1);
  if (v5)
  {
    v22 = v5;
    sub_22CD81FA0((uint64_t)v22);
    if (OUTLINED_FUNCTION_28(v0) != 1)
    {
      sub_22CD80930((uint64_t)v20, &qword_255C459A0);

      OUTLINED_FUNCTION_37(v12, v0);
      OUTLINED_FUNCTION_37((uint64_t)v20, v12);
      OUTLINED_FUNCTION_27((uint64_t)v20, 0);
      goto LABEL_5;
    }
    sub_22CD80930(v0, &qword_255C459A0);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_8_1();
    v25 = objc_msgSend(v22, sel_description);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_11();
    v24 = 107;
LABEL_8:
    v26[0] = v24;
    OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_35();
  }
LABEL_5:
  sub_22CD93520();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  sub_22CD80930((uint64_t)v20, &qword_255C459A0);
}

uint64_t MusicLibraryPlaylistEditViewModel.remove(_:)(void *a1)
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
  id v11;
  id v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C459A0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  v6 = sub_22CD93B98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0();
  v10 = v9 - v8;
  v11 = a1;
  sub_22CD81FA0((uint64_t)v11);
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_22CD80930(v5, &qword_255C459A0);
    sub_22CD93D9C();
    OUTLINED_FUNCTION_8_1();
    v13 = objc_msgSend(v11, sel_description, 0, 0xE000000000000000);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_35();
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v5, v6);
  sub_22CD9352C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t MusicLibraryPlaylistEditViewModel.commit()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v1 = sub_22CD93AB4();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_20();
  v2 = OUTLINED_FUNCTION_32();
  v0[5] = v2;
  v0[6] = *(_QWORD *)(v2 - 8);
  v3 = OUTLINED_FUNCTION_20();
  v0[7] = v3;
  v6 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE69CE8] + MEMORY[0x24BE69CE8]);
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  *v4 = v0;
  v4[1] = sub_22CD85358;
  return v6(v3);
}

uint64_t sub_22CD85358()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_22CD853B0()
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

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v4, *MEMORY[0x24BDDF398], v5);
  sub_22CD840C8();
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_22CD8547C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void MusicLibraryPlaylistEditViewModel.Error.init(rawValue:)(BOOL *a1@<X8>)
{
  uint64_t v2;

  v2 = sub_22CD93E38();
  swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  OUTLINED_FUNCTION_31();
}

void *static MusicLibraryPlaylistEditViewModel.Error.allCases.getter()
{
  return &unk_24F7923C0;
}

uint64_t MusicLibraryPlaylistEditViewModel.Error.rawValue.getter()
{
  return 0x6C62616464616E75;
}

void sub_22CD85538(BOOL *a1@<X8>)
{
  MusicLibraryPlaylistEditViewModel.Error.init(rawValue:)(a1);
}

uint64_t sub_22CD85544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MusicLibraryPlaylistEditViewModel.Error.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_22CD8557C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C45AE0;
  if (!qword_255C45AE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C45AE8);
    result = MEMORY[0x22E308C18](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255C45AE0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E308C0C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_22CD85604(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F7923C0;
}

unint64_t sub_22CD85618()
{
  unint64_t result;

  result = qword_255C45AF0;
  if (!qword_255C45AF0)
  {
    result = MEMORY[0x22E308C18](&protocol conformance descriptor for MusicLibraryPlaylistEditViewModel.Error, &type metadata for MusicLibraryPlaylistEditViewModel.Error);
    atomic_store(result, (unint64_t *)&qword_255C45AF0);
  }
  return result;
}

uint64_t sub_22CD85658()
{
  sub_22CD93EA4();
  sub_22CD93C1C();
  return sub_22CD93EBC();
}

uint64_t sub_22CD856B8()
{
  return sub_22CD93C1C();
}

uint64_t sub_22CD856E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MusicLibraryPlaylistEditViewModel.rawCoverArtworkRecipe.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _s5ErrorOwet(unsigned int *a1, int a2)
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

uint64_t _s5ErrorOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22CD857A4 + 4 * byte_22CD94490[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22CD857C4 + 4 * byte_22CD94495[v4]))();
}

_BYTE *sub_22CD857A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22CD857C4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22CD857CC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22CD857D4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22CD857DC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22CD857E4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_22CD857F0()
{
  return 0;
}

ValueMetadata *type metadata accessor for MusicLibraryPlaylistEditViewModel.Error()
{
  return &type metadata for MusicLibraryPlaylistEditViewModel.Error;
}

uint64_t sub_22CD8580C()
{
  sub_22CD93EA4();
  sub_22CD93C1C();
  return sub_22CD93EBC();
}

uint64_t sub_22CD85864(uint64_t a1, unint64_t *a2)
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

unint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 96);
  *(_QWORD *)(v0 - 88) = v1;
  return 0xD000000000000027;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_22CD858CC()
{
  char v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 v12;
  char v13;
  char v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  char v28;

  result = sub_22CD93664();
  v3 = v2;
  v4 = HIBYTE(v2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    swift_bridgeObjectRelease();
    v25 = 0;
LABEL_49:
    sub_22CD85D68();
    sub_22CD93640();
    return (uint64_t)sub_22CD85B50(v25);
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    v8 = (uint64_t)sub_22CD85C84(result, v3, 10);
    v0 = v28;
LABEL_46:
    swift_bridgeObjectRelease();
    if ((v0 & 1) != 0)
      v25 = 0;
    else
      v25 = v8;
    goto LABEL_49;
  }
  if ((v3 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_22CD93DB4();
    v8 = (uint64_t)sub_22CD85DA4(v7, v5, 10);
    v0 = v9 & 1;
    goto LABEL_46;
  }
  if (result == 43)
  {
    if (!v4)
      goto LABEL_61;
    if (v4 == 1)
      goto LABEL_32;
    OUTLINED_FUNCTION_1_2();
    if (!v14 & v13)
      goto LABEL_32;
    v8 = v16;
    if (v15 != 2)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13)
        goto LABEL_32;
      v8 = 10 * v8 + v18;
      if (v17 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_3();
          if (!v14 & v13)
            goto LABEL_32;
          OUTLINED_FUNCTION_0_2();
          if (!v14)
            goto LABEL_32;
          v8 = v20 + v19;
          if (__OFADD__(v20, v19))
            goto LABEL_32;
          OUTLINED_FUNCTION_2_2();
          if (v14)
            goto LABEL_46;
        }
      }
    }
LABEL_45:
    v0 = 0;
    goto LABEL_46;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u)
      goto LABEL_32;
    v8 = (result - 48);
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13)
        goto LABEL_32;
      v8 = 10 * v8 + v22;
      if (v21 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_3();
          if (!v14 & v13)
            goto LABEL_32;
          OUTLINED_FUNCTION_0_2();
          if (!v14)
            goto LABEL_32;
          v8 = v24 + v23;
          if (__OFADD__(v24, v23))
            goto LABEL_32;
          OUTLINED_FUNCTION_2_2();
          if (v14)
            goto LABEL_46;
        }
      }
    }
    goto LABEL_45;
  }
  if (v4)
  {
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!(!v14 & v13))
      {
        if (v11 == 2)
        {
          v0 = 0;
          v8 = -(uint64_t)v12;
          goto LABEL_46;
        }
        if ((v10 - 48) <= 9u)
        {
          v8 = -10 * v12 - (v10 - 48);
          if (v11 == 3)
            goto LABEL_45;
          while (1)
          {
            OUTLINED_FUNCTION_3_3();
            if (!v14 & v13)
              break;
            OUTLINED_FUNCTION_0_2();
            if (!v14)
              break;
            v8 = v27 - v26;
            if (__OFSUB__(v27, v26))
              break;
            OUTLINED_FUNCTION_2_2();
            if (v14)
              goto LABEL_46;
          }
        }
      }
    }
LABEL_32:
    v8 = 0;
    v0 = 1;
    goto LABEL_46;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

id sub_22CD85B50(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_22CD93BEC();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithValue_databaseID_, a1, v3);

  return v4;
}

_QWORD *sub_22CD85BC8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_255C45A68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22CD85C2C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_22CD93C70();
    OUTLINED_FUNCTION_4_2(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x22E30869C](15, a1 >> 16);
    OUTLINED_FUNCTION_4_2(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_22CD85C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_22CD93C7C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_22CD86020();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_22CD93DB4();
  }
LABEL_7:
  v11 = sub_22CD85DA4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_22CD85D68()
{
  unint64_t result;

  result = qword_255C45B30;
  if (!qword_255C45B30)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C45B30);
  }
  return result;
}

unsigned __int8 *sub_22CD85DA4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v5 = a2 - 1;
      if (a2 != 1)
      {
        v6 = a3 + 48;
        v7 = a3 + 55;
        v8 = a3 + 87;
        if (a3 > 10)
        {
          v6 = 58;
        }
        else
        {
          v8 = 97;
          v7 = 65;
        }
        if (result)
        {
          v9 = 0;
          for (i = result + 1; ; ++i)
          {
            v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
                v12 = -87;
              }
              else
              {
                v12 = -55;
              }
            }
            else
            {
              v12 = -48;
            }
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
              return 0;
            if (!--v5)
              return (unsigned __int8 *)v9;
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22CD86020()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_22CD8607C();
  v4 = sub_22CD860B0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22CD8607C()
{
  return sub_22CD93C88();
}

uint64_t sub_22CD860B0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_22CD861F4(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_22CD85BC8(v9, 0);
      v12 = sub_22CD862E0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x22E308660](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22E308660);
LABEL_9:
      sub_22CD93DB4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22E308660]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22CD861F4(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_22CD85C2C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_22CD85C2C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_22CD93C58();
  }
  __break(1u);
  return result;
}

unint64_t sub_22CD862E0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_22CD85C2C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_22CD93C64();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_22CD93DB4();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_22CD85C2C(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_22CD93C40();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id MPStoreLyricsRequest.init(song:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v2 = sub_22CD93AB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDDF368], v2);
  v7 = v6;
  sub_22CD840A4();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_setSong_, v9);

  v10 = sub_22CD93AE4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  return v7;
}

uint64_t sub_22CD865E4(void *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];

  v7[3] = sub_22CD86A1C();
  v7[0] = a1;
  v2 = objc_allocWithZone(MEMORY[0x24BDDFBF8]);
  v3 = a1;
  v4 = sub_22CD86948(v7);
  v5 = sub_22CD9391C();

  return v5;
}

uint64_t MusicLibrary.mediaLibrary.getter()
{
  void *v0;
  id v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  if ((sub_22CD93934() & 1) != 0)
    goto LABEL_8;
  if (qword_253F42800 != -1)
    swift_once();
  if (byte_253F42898 != 1)
  {
LABEL_8:
    v3 = sub_22CD93940();
    sub_22CD86908();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v4, *MEMORY[0x24BDDEED0], v3);
    return swift_willThrow();
  }
  else
  {
    if (sub_22CD93928())
    {
      objc_opt_self();
      v0 = (void *)swift_dynamicCastObjCClass();
      if (v0)
      {
        v1 = objc_msgSend(v0, sel__underlyingMediaLibrary);
        swift_unknownObjectRelease();
        return (uint64_t)v1;
      }
      swift_unknownObjectRelease();
    }
    sub_22CD93D9C();
    swift_bridgeObjectRelease();
    sub_22CD93928();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C45B90);
    sub_22CD93C04();
    sub_22CD93C28();
    swift_bridgeObjectRelease();
    sub_22CD93C28();
    result = sub_22CD93E14();
    __break(1u);
  }
  return result;
}

uint64_t sub_22CD86844()
{
  id v0;
  uint64_t result;
  uint64_t v2;
  char v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  result = sub_22CD869B0(v0);
  if (v2)
  {
    if (result == 0x6C7070612E6D6F63 && v2 == 0xEF636973754D2E65)
      v4 = 1;
    else
      v4 = sub_22CD93E50();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  byte_253F42898 = v4 & 1;
  return result;
}

unint64_t sub_22CD86908()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C45B88;
  if (!qword_255C45B88)
  {
    v1 = sub_22CD93940();
    result = MEMORY[0x22E308C18](MEMORY[0x24BDDEEE0], v1);
    atomic_store(result, (unint64_t *)&qword_255C45B88);
  }
  return result;
}

id sub_22CD86948(_QWORD *a1)
{
  void *v1;
  id v3;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v3 = objc_msgSend(v1, sel_initWithUnderlyingMediaLibrary_, sub_22CD93E44());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_22CD869B0(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_22CD93BF8();

  return v3;
}

unint64_t sub_22CD86A1C()
{
  unint64_t result;

  result = qword_255C45B98;
  if (!qword_255C45B98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C45B98);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t MusicCollaborativePlaylist.StartCollaborationRequest.init(playlist:invitationMode:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v25 = a3;
  v5 = sub_22CD93B80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22CD93BA4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v24 - v17;
  v19 = a1;
  sub_22CD81F30((uint64_t)v19);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {

    OUTLINED_FUNCTION_0_3();
    sub_22CD824CC((uint64_t)v11);
    v20 = 1;
    v21 = v25;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    v21 = v25;
    sub_22CD93478();

    OUTLINED_FUNCTION_0_3();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    v20 = 0;
  }
  v22 = sub_22CD93490();
  return __swift_storeEnumTagSinglePayload(v21, v20, 1, v22);
}

uint64_t MusicCollaborativePlaylist.StartCollaborationRequest.perform()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_22CD86CA0;
  return sub_22CD93484();
}

uint64_t sub_22CD86CA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_22CD86D14()
{
  uint64_t v0;
  uint64_t v2;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 48);
  sub_22CD93D9C();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_22CD93C28();
  *(_QWORD *)(v0 + 32) = v2;
  sub_22CD93DFC();
  sub_22CD93C28();
  return sub_22CD93E14();
}

BOOL static RadioShow.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorSubKind) == (id)3;
}

id static UploadedAudio.canBeConverted(from:)(void *a1)
{
  if ((objc_msgSend(a1, sel_hasVideo) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, sel_isArtistUploadedContent);
}

uint64_t sub_22CD86EB4(uint64_t a1)
{
  return sub_22CD86EF4(a1, qword_253F42990);
}

uint64_t sub_22CD86ED0(uint64_t a1)
{
  return sub_22CD86EF4(a1, qword_255C46650);
}

uint64_t sub_22CD86EF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_22CD935C8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22CD935BC();
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

uint64_t MusicSiriRepresentation.init(for:title:authorName:artwork:contentRating:url:isLibraryAdded:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  id v48;
  int EnumTagSinglePayload;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  _DWORD *v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  BOOL v63;
  _DWORD *v64;
  id v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  void (*v74)(char *, char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(void);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v100;
  void (*v101)(void);
  void (*v102)(char *, char *, uint64_t);
  char *v103;
  void (*v104)(char *, char *, uint64_t);
  void (*v105)(char *, char *, uint64_t);
  int v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
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
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  v129 = a8;
  v130 = a6;
  v119 = a2;
  v120 = a4;
  v131 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C20);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0_4();
  v118 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C28);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0_4();
  v117 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C30);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_0_4();
  v116 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C38);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0_4();
  v115 = v21;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42788);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_0_4();
  v114 = v23;
  OUTLINED_FUNCTION_9_3();
  sub_22CD938D4();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0_4();
  v113 = v25;
  OUTLINED_FUNCTION_9_3();
  sub_22CD93898();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_0_4();
  v112 = v27;
  OUTLINED_FUNCTION_9_3();
  v28 = sub_22CD93838();
  v127 = *(_QWORD *)(v28 - 8);
  v128 = (_QWORD *)v28;
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_29();
  v123 = v29;
  MEMORY[0x24BDAC7A8](v30);
  v126 = (uint64_t)&v100 - v31;
  OUTLINED_FUNCTION_9_3();
  v32 = sub_22CD933D0();
  v125 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_29();
  v121 = v33;
  MEMORY[0x24BDAC7A8](v34);
  v124 = (char *)&v100 - v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C40);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v36);
  v38 = (char *)&v100 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C48);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_29();
  v122 = v41;
  v43 = MEMORY[0x24BDAC7A8](v42);
  v45 = (char *)&v100 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v47 = (char *)&v100 - v46;
  v48 = objc_msgSend(a1, sel_modelKind);
  if (!v48)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_253F428F8 != -1)
      swift_once();
    v59 = sub_22CD935C8();
    __swift_project_value_buffer(v59, (uint64_t)qword_253F42990);
    v60 = a1;
    v61 = sub_22CD935B0();
    v62 = sub_22CD93D30();
    v63 = os_log_type_enabled(v61, v62);
    v50 = v130;
    if (v63)
    {
      v64 = (_DWORD *)OUTLINED_FUNCTION_4_3();
      v128 = (_QWORD *)OUTLINED_FUNCTION_4_3();
      *v64 = 138412290;
      v132 = v60;
      v65 = v60;
      sub_22CD93D6C();
      *v128 = v60;

      OUTLINED_FUNCTION_7_2(&dword_22CD7D000, v61, v62, "Failed to create a Siri representation from legacy identifier set: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C50);
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_4();
    }

    v93 = v129;
    goto LABEL_16;
  }
  v108 = a3;
  v111 = v48;
  sub_22CD8798C(v48, (uint64_t)v38);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v38, 1, v39);
  v110 = a7;
  v109 = a1;
  if (EnumTagSinglePayload == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22CD80930((uint64_t)v38, &qword_255C45C40);
    v50 = v130;
    if (qword_253F428F8 != -1)
      swift_once();
    v51 = sub_22CD935C8();
    __swift_project_value_buffer(v51, (uint64_t)qword_253F42990);
    v52 = v111;
    v53 = v111;
    v54 = sub_22CD935B0();
    v55 = sub_22CD93D30();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (_DWORD *)OUTLINED_FUNCTION_4_3();
      v57 = (_QWORD *)OUTLINED_FUNCTION_4_3();
      *v56 = 138412290;
      v132 = v53;
      v58 = v53;
      sub_22CD93D6C();
      *v57 = v52;

      OUTLINED_FUNCTION_7_2(&dword_22CD7D000, v54, v55, "Failed to derive a Siri representation kind from legacy model kind: %@.");
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C50);
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_4();
    }

    v93 = v129;
    a7 = v110;
LABEL_16:
    sub_22CD80930(v93, &qword_255C45C20);
    sub_22CD80930(a7, &qword_255C45C28);
    sub_22CD80930(v50, &qword_255C45C30);
    v94 = 1;
    goto LABEL_19;
  }
  v107 = a5;
  v106 = a10;
  v66 = *(int *)(v39 + 48);
  v67 = &v47[v66];
  v68 = &v38[v66];
  v69 = v125;
  v105 = *(void (**)(char *, char *, uint64_t))(v125 + 32);
  v105(v47, v38, v32);
  v70 = sub_22CD93A9C();
  v71 = *(_QWORD *)(v70 - 8);
  v104 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
  v103 = v67;
  v104(v67, v68, v70);
  v72 = &v45[*(int *)(v39 + 48)];
  v101 = *(void (**)(void))(v69 + 16);
  ((void (*)(char *, char *, uint64_t))v101)(v45, v47, v32);
  v102 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  v102(v72, v67, v70);
  v73 = v124;
  OUTLINED_FUNCTION_5_3((uint64_t)&v135);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v70);
  v74 = (void (*)(char *, char *, uint64_t))v109;
  v75 = v112;
  v109 = v47;
  v76 = v32;
  v77 = v74;
  sub_22CD933C4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F427E0);
  v78 = sub_22CD938B0();
  v79 = *(_QWORD *)(v78 - 8);
  v80 = (*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
  v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_22CD94350;
  v82 = v81 + v80;
  v83 = v110;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v79 + 104))(v82, *MEMORY[0x24BDDEB10], v78);
  v84 = v113;
  sub_22CD938C8();
  v85 = sub_22CD938A4();
  v86 = v114;
  __swift_storeEnumTagSinglePayload(v114, 1, 1, v85);
  v87 = v126;
  v105 = v77;
  sub_22CD7ECD8(v77, v75, v84, v86, v126);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v127 + 16))(v123, v87, v128);
  v88 = v101;
  ((void (*)(uint64_t, char *, uint64_t))v101)(v121, v73, v76);
  v114 = v76;
  v88();
  v89 = v130;
  OUTLINED_FUNCTION_5_3((uint64_t)&v133);
  v90 = v115;
  OUTLINED_FUNCTION_5_3((uint64_t)&v134);
  __swift_storeEnumTagSinglePayload(v90, 0, 1, v70);
  sub_22CD80968(v89, v116, &qword_255C45C30);
  sub_22CD80968(v83, v117, &qword_255C45C28);
  v91 = v129;
  sub_22CD80968(v129, v118, &qword_255C45C20);
  if (v106 == 2)
  {
    v92 = v105;
    if (objc_msgSend(v105, sel_library))
      swift_unknownObjectRelease();
  }
  else
  {
    v92 = v105;
  }
  v95 = (uint64_t)v109;
  sub_22CD933B8();

  sub_22CD80930(v91, &qword_255C45C20);
  sub_22CD80930(v83, &qword_255C45C28);
  sub_22CD80930(v89, &qword_255C45C30);
  (*(void (**)(uint64_t, _QWORD *))(v127 + 8))(v126, v128);
  v96 = *(void (**)(char *, uint64_t))(v125 + 8);
  v97 = v114;
  v96(v124, v114);
  sub_22CD80930(v95, &qword_255C45C48);
  v96(v122, v97);
  v94 = 0;
LABEL_19:
  v98 = sub_22CD933E8();
  return __swift_storeEnumTagSinglePayload(v131, v94, 1, v98);
}

void sub_22CD8798C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  void *v22;
  id v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int *v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  unsigned int v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, _QWORD, uint64_t);
  id v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C48);
  __swift_storeEnumTagSinglePayload(a2, 1, 1, v7);
  v81 = objc_msgSend(a1, sel_identityKind);
  sub_22CD85864(0, &qword_255C45C58);
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v9 = objc_msgSend(v81, sel_isEqual_, v8);

  if (v9)
  {
    v10 = *MEMORY[0x24BE69868];
    v11 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v6, v10, v11);
    sub_22CD93A18();
LABEL_29:

    sub_22CD80930(a2, &qword_255C45C40);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
    sub_22CD88464((uint64_t)v6, a2);
    return;
  }
  sub_22CD85864(0, &qword_255C45C60);
  v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v13 = objc_msgSend(v81, sel_isEqual_, v12);

  if (v13)
  {
    v14 = *MEMORY[0x24BE69878];
    v15 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v6, v14, v15);
    sub_22CD93A30();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C68);
  v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v17 = objc_msgSend(v81, sel_isEqual_, v16);

  if (v17)
  {
    v18 = *MEMORY[0x24BE69898];
    v19 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v6, v18, v19);
    sub_22CD93A60();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C70);
  v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v21 = objc_msgSend(v81, sel_isEqual_, v20);

  if (v21)
  {
    objc_opt_self();
    v22 = (void *)swift_dynamicCastObjCClass();
    if (!v22)
    {
LABEL_14:
      v25 = *MEMORY[0x24BE69888];
      v26 = sub_22CD933D0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v6, v25, v26);
      sub_22CD93A48();
LABEL_15:

      goto LABEL_29;
    }
    v23 = a1;
    v24 = objc_msgSend(v22, sel_variants);
    if ((v24 & 1) != 0)
    {
      v35 = (unsigned int *)MEMORY[0x24BE69888];
    }
    else if ((v24 & 4) != 0)
    {
      v35 = (unsigned int *)MEMORY[0x24BE698B0];
    }
    else
    {
      if ((v24 & 2) == 0)
      {
        if ((v24 & 8) != 0)
        {
          v50 = *MEMORY[0x24BE69888];
          v51 = sub_22CD933D0();
          (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v6, v50, v51);
          sub_22CD93A48();
        }
        else
        {
          if ((v24 & 0x20) == 0)
            goto LABEL_14;
          v58 = *MEMORY[0x24BE69840];
          v59 = sub_22CD933D0();
          (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 104))(v6, v58, v59);
          sub_22CD939DC();
        }
        goto LABEL_28;
      }
      v35 = (unsigned int *)MEMORY[0x24BE69870];
    }
    v44 = *v35;
    v45 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 104))(v6, v44, v45);
    sub_22CD939D0();
    goto LABEL_28;
  }
  sub_22CD85864(0, &qword_255C45C78);
  v27 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v28 = objc_msgSend(v81, sel_isEqual_, v27);

  if (v28)
  {
    v29 = *MEMORY[0x24BE69870];
    v30 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v6, v29, v30);
    sub_22CD93A24();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C80);
  v31 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v32 = objc_msgSend(v81, sel_isEqual_, v31);

  if (v32)
  {
    v33 = *MEMORY[0x24BE69828];
    v34 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v6, v33, v34);
    sub_22CD939AC();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C88);
  v36 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v37 = objc_msgSend(v81, sel_isEqual_, v36);

  if (v37)
  {
    v38 = *MEMORY[0x24BE698A0];
    v39 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v6, v38, v39);
    sub_22CD93A6C();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C90);
  v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v41 = objc_msgSend(v81, sel_isEqual_, v40);

  if (v41)
  {
    v42 = *MEMORY[0x24BE69848];
    v43 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v6, v42, v43);
    sub_22CD939E8();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45C98);
  v46 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v47 = objc_msgSend(v81, sel_isEqual_, v46);

  if (v47)
  {
    v48 = *MEMORY[0x24BE69838];
    v49 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v6, v48, v49);
    sub_22CD939C4();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45CA0);
  v52 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v53 = objc_msgSend(v81, sel_isEqual_, v52);

  if (v53)
  {
    objc_opt_self();
    v22 = (void *)swift_dynamicCastObjCClass();
    if (!v22)
      goto LABEL_37;
    v23 = a1;
    v54 = objc_msgSend(v22, sel_variants);
    v55 = v54;
    if ((v54 & 4) != 0)
    {
      v68 = sub_22CD933D0();
      v69 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v68 - 8) + 104);
      if ((v55 & 2) != 0)
      {
        v69(v6, *MEMORY[0x24BE69858], v68);
        sub_22CD93A00();
      }
      else
      {
        v69(v6, *MEMORY[0x24BE69850], v68);
        sub_22CD939F4();
      }
      goto LABEL_28;
    }
    if ((v54 & 2) == 0)
    {
LABEL_37:
      v56 = *MEMORY[0x24BE69860];
      v57 = sub_22CD933D0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v6, v56, v57);
      sub_22CD93A0C();
      goto LABEL_15;
    }
    v74 = *MEMORY[0x24BE69830];
    v75 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 104))(v6, v74, v75);
    sub_22CD939B8();
LABEL_28:

    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45CA8);
  v60 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v61 = objc_msgSend(v81, sel_isEqual_, v60);

  if (v61)
  {
    v62 = *MEMORY[0x24BE69890];
    v63 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 104))(v6, v62, v63);
    sub_22CD93A54();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45CB0);
  v64 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v65 = objc_msgSend(v81, sel_isEqual_, v64);

  if (v65)
  {
    v66 = *MEMORY[0x24BE698B8];
    v67 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 104))(v6, v66, v67);
    sub_22CD93A90();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45CB8);
  v70 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v71 = objc_msgSend(v81, sel_isEqual_, v70);

  if (v71)
  {
    v72 = *MEMORY[0x24BE698A8];
    v73 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v6, v72, v73);
    sub_22CD93A84();
    goto LABEL_29;
  }
  sub_22CD85864(0, &qword_255C45CC0);
  v76 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
  v77 = objc_msgSend(v81, sel_isEqual_, v76);

  if (v77)
  {
    v78 = *MEMORY[0x24BE69880];
    v79 = sub_22CD933D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 104))(v6, v78, v79);
    sub_22CD93A3C();
    goto LABEL_29;
  }

}

uint64_t sub_22CD88464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL static EditorialItem.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorKind) == (id)4;
}

id sub_22CD884D4(uint64_t a1, uint64_t a2)
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
  unint64_t v14;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  v9 = sub_22CD93AB4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  v14 = sub_22CD88D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v2, a2);
  return sub_22CD88D4C(v8, v13, v14, a2);
}

uint64_t sub_22CD885BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t result;

  v1 = sub_22CD93AA8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4 - v3, v0, v1);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v5, v1);
  v7 = 0;
  if (v6 == *MEMORY[0x24BDDF2E8])
    return v7;
  if (v6 == *MEMORY[0x24BDDF268])
    return 1;
  if (v6 == *MEMORY[0x24BDDF300])
    return 2;
  if (v6 == *MEMORY[0x24BDDF328])
    return 3;
  if (v6 == *MEMORY[0x24BDDF270])
    return 4;
  if (v6 == *MEMORY[0x24BDDF318])
    return 5;
  if (v6 == *MEMORY[0x24BDDF278])
    return 6;
  if (v6 == *MEMORY[0x24BDDF280])
    return 7;
  if (v6 == *MEMORY[0x24BDDF2F0])
    return 9;
  if (v6 == *MEMORY[0x24BDDF2D8])
    return 11;
  if (v6 == *MEMORY[0x24BDDF308])
    return 12;
  if (v6 == *MEMORY[0x24BDDF250])
    return 13;
  if (v6 == *MEMORY[0x24BDDF258])
    return 14;
  if (v6 == *MEMORY[0x24BDDF330])
    return 15;
  if (v6 == *MEMORY[0x24BDDF2B8])
    return 16;
  if (v6 == *MEMORY[0x24BDDF288])
    return 17;
  if (v6 == *MEMORY[0x24BDDF2D0])
    return 18;
  if (v6 == *MEMORY[0x24BDDF2C0])
    return 19;
  if (v6 == *MEMORY[0x24BDDF2C8])
    return 20;
  if (v6 == *MEMORY[0x24BDDF340])
    return 22;
  if (v6 == *MEMORY[0x24BDDF290])
    return 23;
  if (v6 == *MEMORY[0x24BDDF260])
    return 24;
  if (v6 == *MEMORY[0x24BDDF298])
    return 25;
  if (v6 == *MEMORY[0x24BDDF2E0])
    return 26;
  if (v6 == *MEMORY[0x24BDDF320])
    return 27;
  if (v6 == *MEMORY[0x24BDDF2A0])
    return 29;
  if (v6 == *MEMORY[0x24BDDF2F8])
    return 30;
  if (v6 == *MEMORY[0x24BDDF348])
    return 31;
  if (v6 == *MEMORY[0x24BDDF338])
    return 32;
  if (v6 == *MEMORY[0x24BDDF310])
    return 33;
  if (v6 == *MEMORY[0x24BDDF2A8])
    return 34;
  if (v6 == *MEMORY[0x24BDDF2B0])
    return 35;
  result = OUTLINED_FUNCTION_2_3();
  __break(1u);
  return result;
}

uint64_t sub_22CD889FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[2];

  v0 = sub_22CD93AB4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v10 - v5;
  OUTLINED_FUNCTION_1_3((uint64_t)v10 - v5);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v6, v0);
  v8 = 0;
  if (v7 == *MEMORY[0x24BDDF3D0])
    return v8;
  if (v7 == *MEMORY[0x24BDDF380])
    return 1;
  if (v7 == *MEMORY[0x24BDDF360])
    return 2;
  if (v7 == *MEMORY[0x24BDDF398])
    return 3;
  if (v7 == *MEMORY[0x24BDDF388])
    return 4;
  if (v7 == *MEMORY[0x24BDDF370])
    return 5;
  if (v7 == *MEMORY[0x24BDDF390])
    return 6;
  if (v7 == *MEMORY[0x24BDDF368])
    return 7;
  if (v7 == *MEMORY[0x24BDDF378])
    return 8;
  if (v7 == *MEMORY[0x24BDDF3C0])
    return 9;
  if (v7 == *MEMORY[0x24BDDF3B8])
    return 10;
  if (v7 == *MEMORY[0x24BDDF3B0])
    return 11;
  if (v7 == *MEMORY[0x24BDDF358])
    return 12;
  if (v7 == *MEMORY[0x24BDDF3A0])
    return 13;
  if (v7 == *MEMORY[0x24BDDF3C8])
    return 14;
  if (v7 == *MEMORY[0x24BDDF3A8])
    return 15;
  OUTLINED_FUNCTION_1_3((uint64_t)v4);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_22CD93D9C();
  sub_22CD93C28();
  sub_22CD93DFC();
  sub_22CD93C28();
  result = OUTLINED_FUNCTION_2_3();
  __break(1u);
  return result;
}

unint64_t sub_22CD88D10()
{
  unint64_t result;

  result = qword_255C45D18;
  if (!qword_255C45D18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C45D18);
  }
  return result;
}

id sub_22CD88D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a3;
  v7 = sub_22CD93838();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93AA8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v16, a1, a4);
  v25[1] = sub_22CD93AD8();
  sub_22CD93AC0();
  v18 = (void *)sub_22CD885BC();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_22CD938E0();
  v19 = sub_22CD8A704(v18);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v21 = (void *)sub_22CD93BBC();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v20, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v19, v18, v21);
  swift_unknownObjectRelease();

  v23 = sub_22CD93AB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a2, v23);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v16, a4);
  return v22;
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.mainID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_4();
  v0 = OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_6_4(v0, v1, v2, v3);
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.musicIdentifierSet.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_0_5();
  v0 = OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_6_4(v0, v1, v2, v3);
}

uint64_t type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers()
{
  uint64_t result;

  result = qword_255C45DC0;
  if (!qword_255C45DC0)
    return swift_getSingletonMetadata();
  return result;
}

void static MusicSiriRepresentation.ParsedIdentifiers.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;

  if ((sub_22CD933A0() & 1) != 0
    && (v4 = OUTLINED_FUNCTION_8_2(), (sub_22CD93790() & 1) != 0)
    && ((v5 = *(int *)(v4 + 24),
         v6 = *(_QWORD *)(a1 + v5),
         v7 = *(_QWORD *)(a1 + v5 + 8),
         v8 = (_QWORD *)(a2 + v5),
         v6 == *v8)
      ? (v9 = v7 == v8[1])
      : (v9 = 0),
        !v9))
  {
    sub_22CD93E50();
  }
  else
  {
    OUTLINED_FUNCTION_31();
  }
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.hash(into:)()
{
  OUTLINED_FUNCTION_1_4();
  sub_22CD80E04(&qword_255C45D50, (uint64_t (*)(uint64_t))MEMORY[0x24BE69808], MEMORY[0x24BE69818]);
  sub_22CD93BD4();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_0_5();
  sub_22CD80E04(&qword_255C45D58, (uint64_t (*)(uint64_t))MEMORY[0x24BDDE9C0], MEMORY[0x24BDDE9D0]);
  sub_22CD93BD4();
  swift_bridgeObjectRetain();
  sub_22CD93C1C();
  return swift_bridgeObjectRelease();
}

uint64_t MusicSiriRepresentation.ParsedIdentifiers.hashValue.getter()
{
  sub_22CD93EA4();
  OUTLINED_FUNCTION_1_4();
  sub_22CD80E04(&qword_255C45D50, (uint64_t (*)(uint64_t))MEMORY[0x24BE69808], MEMORY[0x24BE69818]);
  sub_22CD93BD4();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_0_5();
  sub_22CD80E04(&qword_255C45D58, (uint64_t (*)(uint64_t))MEMORY[0x24BDDE9C0], MEMORY[0x24BDDE9D0]);
  sub_22CD93BD4();
  swift_bridgeObjectRetain();
  sub_22CD93C1C();
  OUTLINED_FUNCTION_21_0();
  return sub_22CD93EBC();
}

uint64_t sub_22CD89224()
{
  sub_22CD93EA4();
  sub_22CD933AC();
  sub_22CD80E04(&qword_255C45D50, (uint64_t (*)(uint64_t))MEMORY[0x24BE69808], MEMORY[0x24BE69818]);
  sub_22CD93BD4();
  sub_22CD93838();
  sub_22CD80E04(&qword_255C45D58, (uint64_t (*)(uint64_t))MEMORY[0x24BDDE9C0], MEMORY[0x24BDDE9D0]);
  sub_22CD93BD4();
  swift_bridgeObjectRetain();
  sub_22CD93C1C();
  swift_bridgeObjectRelease();
  return sub_22CD93EBC();
}

uint64_t sub_22CD8930C()
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unsigned int (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, _QWORD);
  char v49;
  char v50;
  void (*v51)(char *, uint64_t);
  unsigned int *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, _QWORD);
  char v61;
  unsigned int *v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t result;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int (*v92)(uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111[3];

  v1 = v0;
  v2 = OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_4();
  v101 = v4;
  v5 = sub_22CD93AB4();
  v98 = *(_QWORD *)(v5 - 8);
  v99 = v5;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_4();
  v97 = v7;
  v91 = sub_22CD93A9C();
  v90 = *(_QWORD *)(v91 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_29();
  v87 = v9;
  MEMORY[0x24BDAC7A8](v10);
  v89 = (char *)&v86 - v11;
  v95 = OUTLINED_FUNCTION_1_4();
  v12 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  OUTLINED_FUNCTION_29();
  v88 = v13;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v86 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45E00);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_0();
  v21 = v20 - v19;
  v109 = v20 - v19;
  v22 = sub_22CD93898();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v86 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v86 - v27;
  v29 = sub_22CD93AA8();
  v106 = *(_QWORD *)(v29 - 8);
  v107 = v29;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_0_4();
  v103 = v31;
  v93 = v2;
  v96 = v1 + *(int *)(v2 + 20);
  sub_22CD9382C();
  v32 = v21 + *(int *)(v17 + 48);
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v23 + 16);
  v102 = v28;
  v33(v21, v28, v22);
  v34 = *(void (**)(uint64_t))(v12 + 16);
  v35 = v1;
  v36 = v22;
  v37 = v26;
  v100 = v35;
  v38 = v95;
  v34(v32);
  v104 = v12;
  v39 = *(unsigned int (**)(uint64_t, uint64_t))(v12 + 88);
  v40 = v38;
  v108 = v32;
  v92 = v39;
  v41 = v39(v32, v38);
  v42 = *MEMORY[0x24BE697F8];
  if (v41 == *MEMORY[0x24BE697F8])
  {
    OUTLINED_FUNCTION_15_0((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v104 + 96))(v16, v38);
    swift_bridgeObjectRelease();
    v43 = *((_QWORD *)v16 + 2);
    v16 = (char *)*((_QWORD *)v16 + 3);
    sub_22CD9388C();
    sub_22CD80E04(&qword_255C45E08, (uint64_t (*)(uint64_t))MEMORY[0x24BDDEA30], MEMORY[0x24BDDEA40]);
    v44 = sub_22CD93BE0();
    v105 = *(void (**)(char *, uint64_t))(v23 + 8);
    v105(v37, v36);
    if ((v44 & 1) != 0)
    {
      v94 = v36;
      v45 = (uint64_t)v89;
      sub_22CD939D0();
      v46 = sub_22CD93A78();
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_14_0(v45, v47);
      if (v46 == v43 && v45 == (_QWORD)v16)
      {
        OUTLINED_FUNCTION_17_0();
        v36 = v94;
LABEL_21:
        v62 = (unsigned int *)MEMORY[0x24BDDF268];
LABEL_29:
        OUTLINED_FUNCTION_3_4(v62);
        OUTLINED_FUNCTION_5_4();
        v64 = v109;
        v65 = v36;
        v51 = v105;
        goto LABEL_30;
      }
      v49 = OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_21_0();
      v36 = v94;
      if ((v49 & 1) != 0)
        goto LABEL_21;
    }
    else
    {
      OUTLINED_FUNCTION_10();
    }
  }
  sub_22CD9388C();
  sub_22CD80E04(&qword_255C45E08, (uint64_t (*)(uint64_t))MEMORY[0x24BDDEA30], MEMORY[0x24BDDEA40]);
  v50 = OUTLINED_FUNCTION_2_4();
  v51 = *(void (**)(char *, uint64_t))(v23 + 8);
  v51(v37, v36);
  if ((v50 & 1) == 0)
  {
    v105 = v51;
    if (v92(v108, v40) == v42)
    {
      v53 = v88;
      OUTLINED_FUNCTION_15_0(v88);
      (*(void (**)(uint64_t, uint64_t))(v104 + 96))(v53, v40);
      swift_bridgeObjectRelease();
      v54 = v36;
      v55 = *(_QWORD *)(v53 + 16);
      v16 = *(char **)(v53 + 24);
      sub_22CD93880();
      LOBYTE(v53) = sub_22CD93BE0();
      v56 = v54;
      v105(v37, v54);
      if ((v53 & 1) != 0)
      {
        v57 = v87;
        sub_22CD939D0();
        v58 = sub_22CD93A78();
        OUTLINED_FUNCTION_18_0();
        OUTLINED_FUNCTION_14_0(v57, v59);
        if (v58 == v55 && v57 == (_QWORD)v16)
        {
          OUTLINED_FUNCTION_17_0();
          v36 = v56;
LABEL_28:
          v62 = (unsigned int *)MEMORY[0x24BDDF278];
          goto LABEL_29;
        }
        v61 = OUTLINED_FUNCTION_13_0();
        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_21_0();
        v36 = v56;
        if ((v61 & 1) != 0)
          goto LABEL_28;
      }
      else
      {
        OUTLINED_FUNCTION_10();
        v36 = v54;
      }
    }
    sub_22CD93880();
    v63 = OUTLINED_FUNCTION_2_4();
    v51 = v105;
    v105(v37, v36);
    if ((v63 & 1) == 0)
    {
      v16 = v103;
      sub_22CD93844();
      sub_22CD8A3CC(v109);
      goto LABEL_31;
    }
    v52 = (unsigned int *)MEMORY[0x24BDDF2F0];
    goto LABEL_25;
  }
  v52 = (unsigned int *)MEMORY[0x24BDDF318];
LABEL_25:
  OUTLINED_FUNCTION_3_4(v52);
  OUTLINED_FUNCTION_5_4();
  v64 = v109;
  v65 = v36;
LABEL_30:
  v51((char *)v64, v65);
LABEL_31:
  v67 = v98;
  v66 = v99;
  v68 = v97;
  v69 = (void *)sub_22CD885BC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v67 + 104))(v68, *MEMORY[0x24BDDF3A0], v66);
  v70 = sub_22CD8A704(v69);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v66);
  objc_opt_self();
  v71 = swift_dynamicCastObjCClass();
  if (v71)
  {
    v72 = v71;
    v73 = qword_255C458A0;
    swift_unknownObjectRetain();
    if (v73 != -1)
      swift_once();
    v74 = sub_22CD935C8();
    __swift_project_value_buffer(v74, (uint64_t)qword_255C46650);
    v75 = v101;
    sub_22CD8A40C(v100, v101);
    swift_unknownObjectRetain_n();
    v76 = sub_22CD935B0();
    v77 = sub_22CD93D48();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = OUTLINED_FUNCTION_4_3();
      v79 = (_QWORD *)OUTLINED_FUNCTION_4_3();
      v109 = OUTLINED_FUNCTION_4_3();
      v111[0] = v109;
      *(_DWORD *)v78 = 136315394;
      v105 = v51;
      v80 = (uint64_t *)(v75 + *(int *)(v93 + 24));
      v94 = v36;
      v81 = v72;
      v82 = v75;
      v84 = *v80;
      v83 = v80[1];
      swift_bridgeObjectRetain();
      v110 = sub_22CD82FBC(v84, v83, v111);
      sub_22CD93D6C();
      swift_bridgeObjectRelease();
      sub_22CD8A450(v82);
      *(_WORD *)(v78 + 12) = 2112;
      v110 = v81;
      swift_unknownObjectRetain();
      sub_22CD93D6C();
      *v79 = v81;
      OUTLINED_FUNCTION_19_0();
      _os_log_impl(&dword_22CD7D000, v76, v77, "Converted Siri representation ID \"%s\" to identifier set %@.", (uint8_t *)v78, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255C45C50);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
    }
    OUTLINED_FUNCTION_19_0();

    sub_22CD8A450(v75);
    swift_unknownObjectRelease();
    v51(v102, v36);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v16, v107);
    return v72;
  }
  else
  {
    v111[0] = 0;
    v111[1] = 0xE000000000000000;
    sub_22CD93D9C();
    sub_22CD93C28();
    v110 = (uint64_t)v70;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42900);
    sub_22CD93DFC();
    sub_22CD93C28();
    result = sub_22CD93E14();
    __break(1u);
  }
  return result;
}

unint64_t MusicSiriRepresentation.ParsedIdentifiers.description.getter()
{
  sub_22CD93C28();
  OUTLINED_FUNCTION_1_4();
  sub_22CD93DFC();
  sub_22CD93C28();
  swift_bridgeObjectRelease();
  sub_22CD93C28();
  return 0xD00000000000002ALL;
}

uint64_t static MusicSiriRepresentation.parse(_:includeExtendedIdentifierSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;

  v20 = sub_22CD93838();
  v8 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0();
  v11 = v10 - v9;
  v12 = sub_22CD933AC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0();
  v16 = v15 - v14;
  if ((a3 & 1) != 0)
  {
    result = sub_22CD933DC();
    if (!v4)
    {
      sub_22CD93394();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(a4, v16, v12);
      v18 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a4 + *(int *)(v18 + 20), v11, v20);
      v19 = (_QWORD *)(a4 + *(int *)(v18 + 24));
      *v19 = a1;
      v19[1] = a2;
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    result = sub_22CD93E14();
    __break(1u);
  }
  return result;
}

uint64_t sub_22CD89E10()
{
  return sub_22CD80E04(&qword_255C45D60, (uint64_t (*)(uint64_t))type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers, (uint64_t)&protocol conformance descriptor for MusicSiriRepresentation.ParsedIdentifiers);
}

uint64_t *_s17ParsedIdentifiersVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22CD933AC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22CD93838();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s17ParsedIdentifiersVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_22CD933AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_22CD93838();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t _s17ParsedIdentifiersVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_22CD933AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22CD93838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = sub_22CD933AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22CD93838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22CD933AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22CD93838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t _s17ParsedIdentifiersVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_22CD933AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22CD93838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ParsedIdentifiersVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22CD8A200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_1_4();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
LABEL_5:
    __swift_getEnumTagSinglePayload(v8, a2, v7);
    return;
  }
  v9 = sub_22CD93838();
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_31();
}

uint64_t _s17ParsedIdentifiersVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22CD8A2A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_1_4();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = sub_22CD93838();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_22CD8A340()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22CD933AC();
  if (v1 <= 0x3F)
  {
    result = sub_22CD93838();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_22CD8A3CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45E00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22CD8A40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22CD8A450(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MusicSiriRepresentation.ParsedIdentifiers();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_unknownObjectRelease_n();
}

uint64_t Genre.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v25 = a2;
  v3 = sub_22CD93898();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93838();
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - v9;
  v11 = sub_22CD93B14();
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(a1, sel_identifiers);
  sub_22CD93880();
  sub_22CD7EB64((uint64_t)v6, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_opt_self();
  v15 = OUTLINED_FUNCTION_2_5();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = a1;
    if (objc_msgSend(v16, sel_curatorSubKind) == (id)2)
    {
      OUTLINED_FUNCTION_0_6();
      v28 = 0;
      v26 = 0u;
      v27 = 0u;
      sub_22CD93AFC();

      goto LABEL_7;
    }

  }
  objc_opt_self();
  if (!OUTLINED_FUNCTION_2_5())
  {

    OUTLINED_FUNCTION_1_5();
    v20 = 1;
    v19 = v24;
    v18 = v25;
    return __swift_storeEnumTagSinglePayload(v18, v20, 1, v19);
  }
  OUTLINED_FUNCTION_0_6();
  sub_22CD93B08();
LABEL_7:
  OUTLINED_FUNCTION_1_5();
  v19 = v24;
  v18 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v25, v13, v24);
  v20 = 0;
  return __swift_storeEnumTagSinglePayload(v18, v20, 1, v19);
}

id sub_22CD8A704(id a1)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42780);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_27_0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v45 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CD937D8();
  v10 = sub_22CD93994();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_22CD80930((uint64_t)v9, &qword_253F427B8);
    v51 = 0;
  }
  else
  {
    v51 = sub_22CD930C8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  sub_22CD93814();
  if (v11)
  {
    v52 = (id)OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v52 = 0;
  }
  sub_22CD93754();
  if (v12)
  {
    v49 = (void *)OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v49 = 0;
  }
  sub_22CD937B4();
  if (v13)
  {
    v48 = (void *)OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v48 = 0;
  }
  sub_22CD93730();
  if (v14)
  {
    v47 = (void *)OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v47 = 0;
  }
  sub_22CD93718();
  if (v15)
  {
    v16 = OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    v16 = 0;
  }
  sub_22CD936B8();
  if (v17)
  {
    v46 = (void *)OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    v46 = 0;
  }
  sub_22CD936F4();
  v18 = sub_22CD93670();
  v19 = OUTLINED_FUNCTION_42((uint64_t)v6);
  v50 = a1;
  if (v19 == 1)
  {
    sub_22CD80930((uint64_t)v6, &qword_253F42780);
    v45 = 0;
  }
  else
  {
    v45 = (void *)sub_22CD858CC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v6, v18);
  }
  sub_22CD936DC();
  if (v20)
  {
    v21 = OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    v21 = 0;
  }
  sub_22CD93778();
  v22 = (void *)v16;
  if (OUTLINED_FUNCTION_42(v1) == 1)
  {
    sub_22CD80930(v1, &qword_253F42780);
    v23 = 0;
  }
  else
  {
    v23 = sub_22CD858CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v1, v18);
  }
  sub_22CD9379C();
  if (v24)
  {
    v25 = OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    v25 = 0;
  }
  sub_22CD936A0();
  if (v26)
  {
    v27 = (void *)OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_21_0();
  }
  else
  {
    v27 = 0;
  }
  v28 = objc_opt_self();
  v29 = sub_22CD937F0();
  v30 = sub_22CD8AAD4(v29);
  OUTLINED_FUNCTION_21_0();
  v31 = sub_22CD889FC();
  v44 = (void *)v28;
  v43 = v30;
  v42 = v25;
  *(_QWORD *)&v41 = v21;
  *((_QWORD *)&v41 + 1) = v23;
  v32 = v49;
  v33 = (void *)v21;
  v34 = v48;
  v35 = (void *)v23;
  v36 = v47;
  v37 = (void *)v25;
  v39 = v45;
  v38 = v46;
  v50 = sub_22CD8C1F0((uint64_t)v51, (uint64_t)v52, (uint64_t)v49, (uint64_t)v48, (uint64_t)v47, (uint64_t)v22, (uint64_t)v46, (uint64_t)v45, v41, v42, (uint64_t)v27, v43, (uint64_t)v50, v31, v44);

  return v50;
}

uint64_t sub_22CD8AAD4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int64_t v5;
  int v6;
  int v7;
  char v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v19 = MEMORY[0x24BEE4AF8];
  sub_22CD8B604(0, v1, 0);
  v2 = v19;
  result = sub_22CD8C3AC(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(a1 + 36) != v7)
      goto LABEL_14;
    v18 = v9;
    v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v5);
    v11 = *v10;
    v12 = v10[1];
    v14 = *(_QWORD *)(v19 + 16);
    v13 = *(_QWORD *)(v19 + 24);
    swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1)
      sub_22CD8B604((_QWORD *)(v13 > 1), v14 + 1, 1);
    *(_QWORD *)(v19 + 16) = v14 + 1;
    v15 = v19 + 16 * v14;
    *(_QWORD *)(v15 + 32) = v11;
    *(_QWORD *)(v15 + 40) = v12;
    result = sub_22CD8C2C8(v5, v7, v18 & 1, a1);
    v5 = result;
    v7 = v16;
    v9 = v17 & 1;
    if (!--v1)
    {
      sub_22CD8C42C(result, v16, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_22CD8AC48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  sub_22CD8C480();
  v2 = sub_22CD93D00();
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
      sub_22CD8B724(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

void sub_22CD8ACFC(uint64_t a1, uint64_t a2)
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
  char *v14;
  char *v15;
  _QWORD v16[5];
  uint64_t v17;

  v17 = a2;
  v3 = sub_22CD93670();
  v16[3] = *(_QWORD *)(v3 - 8);
  v16[4] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v16[0] = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22CD93994();
  v16[1] = *(_QWORD *)(v5 - 8);
  v16[2] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v6 = type metadata accessor for MusicPreferredID();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C45EC0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v16 + *(int *)(v12 + 48) - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CD8C93C(a1, (uint64_t)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22CD8C93C(v17, (uint64_t)v14);
  v15 = (char *)sub_22CD8AEC0 + 4 * byte_22CD94780[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22CD8AEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  sub_22CD8C93C(v0, v1);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 120) + 8))(v1, *(_QWORD *)(v4 - 112));
    sub_22CD80930(v0, &qword_255C45EC0);
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(v4 - 120);
    v7 = *(_QWORD *)(v4 - 112);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v3, v7);
    v5 = sub_22CD93958();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8(v2, v7);
    v8(v1, v7);
    sub_22CD8C728(v0);
  }
  return v5 & 1;
}

void sub_22CD8B110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = sub_22CD93670();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_22CD93994();
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for MusicPreferredID();
  MEMORY[0x24BDAC7A8](v3);
  sub_22CD8C93C(v0, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (char *)sub_22CD8B210 + 4 * byte_22CD94785[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22CD8B210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  sub_22CD93EB0();
  sub_22CD80D00((unint64_t *)&unk_255C45ED0, (uint64_t (*)(uint64_t))MEMORY[0x24BDDEF68], MEMORY[0x24BDDEF78]);
  sub_22CD93BD4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
}

uint64_t sub_22CD8B334()
{
  sub_22CD93EA4();
  sub_22CD8B110();
  return sub_22CD93EBC();
}

uint64_t sub_22CD8B37C()
{
  sub_22CD93EA4();
  sub_22CD8B110();
  return sub_22CD93EBC();
}

char *sub_22CD8B3B4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_22CD93E2C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_22CD8B438(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_22CD93E2C();
  __break(1u);
  return result;
}

uint64_t sub_22CD8B504(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_22CD93E2C();
  __break(1u);
  return result;
}

_QWORD *sub_22CD8B5D0(_QWORD *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  _QWORD *result;

  result = sub_22CD8B638(a1, a2, a3, *v3, &qword_255C45EB0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22CD8B3B4, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22CD8B438);
  *v3 = (uint64_t)result;
  return result;
}

_QWORD *sub_22CD8B604(_QWORD *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  _QWORD *result;

  result = sub_22CD8B638(a1, a2, a3, *v3, &qword_255C45EA0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22CD8B3B4, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22CD8B504);
  *v3 = (uint64_t)result;
  return result;
}

_QWORD *sub_22CD8B638(_QWORD *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  char v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;
  uint64_t v18;

  v10 = (char)result;
  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v15 = (_QWORD *)swift_allocObject();
    v16 = _swift_stdlib_malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v17 = v15 + 4;
  v18 = a4 + 32;
  if ((v10 & 1) != 0)
  {
    a6(v18, v13, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a7(v18, v13, v17);
  }
  swift_release();
  return v15;
}

uint64_t sub_22CD8B724(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_22CD93EA4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22CD93C1C();
  swift_bridgeObjectRelease();
  v8 = sub_22CD93EBC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22CD93E50() & 1) != 0)
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
      if (v19 || (sub_22CD93E50() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22CD8BBC8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_22CD8B8E0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45EA8);
  v3 = sub_22CD93D90();
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
      sub_22CD93EA4();
      swift_bridgeObjectRetain();
      sub_22CD93C1C();
      swift_bridgeObjectRelease();
      result = sub_22CD93EBC();
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
                sub_22CD8BD70(0, (unint64_t)(v29 + 63) >> 6, v30);
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

uint64_t sub_22CD8BBC8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_22CD8B8E0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_22CD8BD8C();
      goto LABEL_22;
    }
    sub_22CD8BF3C();
  }
  v11 = *v4;
  sub_22CD93EA4();
  swift_bridgeObjectRetain();
  sub_22CD93C1C();
  swift_bridgeObjectRelease();
  result = sub_22CD93EBC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_22CD93E50(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_22CD93E68();
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
          result = sub_22CD93E50();
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

uint64_t sub_22CD8BD70(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_22CD8BD8C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45EA8);
  v2 = *v0;
  v3 = sub_22CD93D84();
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

uint64_t sub_22CD8BF3C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C45EA8);
  v3 = sub_22CD93D90();
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
    sub_22CD93EA4();
    swift_bridgeObjectRetain_n();
    sub_22CD93C1C();
    swift_bridgeObjectRelease();
    result = sub_22CD93EBC();
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

id sub_22CD8C1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v18;
  id v19;

  v18 = (void *)sub_22CD93CC4();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(a15, sel_identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source_, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, a13, a14);

  return v19;
}

int64_t sub_22CD8C2C8(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_22CD8C3AC(uint64_t a1)
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

uint64_t sub_22CD8C42C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_22CD8C438(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_253F426F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22CD8C480()
{
  unint64_t result;

  result = qword_253F42690;
  if (!qword_253F42690)
  {
    result = MEMORY[0x22E308C18](MEMORY[0x24BDDEEA0], MEMORY[0x24BDDEE98]);
    atomic_store(result, (unint64_t *)&qword_253F42690);
  }
  return result;
}

uint64_t sub_22CD8C4BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_22CD8C50C + 4 * byte_22CD9478A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_22CD8C5F4(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_22CD8C728(result);
    v2 = (char *)&loc_22CD8C648 + 4 * byte_22CD94799[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_22CD8C728(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MusicPreferredID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_22CD8C764(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v8 = sub_22CD93670();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = sub_22CD93994();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_22CD8C824(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_22CD8C728((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      v8 = sub_22CD93670();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = sub_22CD93994();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22CD8C900()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_22CD8C910()
{
  sub_22CD80D00(&qword_255C45EB8, (uint64_t (*)(uint64_t))type metadata accessor for MusicPreferredID, (uint64_t)&unk_22CD94810);
}

uint64_t sub_22CD8C93C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MusicPreferredID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_19_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 488))();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_22CD93BEC();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_22CD93BF8();
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_44@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, *(_QWORD *)(v3 - 216), v2);
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 256);
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);
  uint64_t v3;

  return v2(a1, a2, *(_QWORD *)(v3 - 248));
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t MusicCollaborativePlaylist.UpdateInvitationModeRequest.init(playlist:updatedInvitationMode:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_22CD93B80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, sel_identifiers);
  v11 = objc_msgSend(v10, sel_library);

  if (v11)
  {
    objc_msgSend(v11, sel_persistentID);
    swift_unknownObjectRelease();
    sub_22CD93910();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    sub_22CD934B4();

    OUTLINED_FUNCTION_0_8();
    v12 = sub_22CD934C0();
    return __swift_storeEnumTagSinglePayload(a3, 0, 1, v12);
  }
  else
  {

    OUTLINED_FUNCTION_0_8();
    v14 = sub_22CD934C0();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v14);
  }
}

uint64_t MusicCollaborativePlaylist.ReactionRequest.init(playlist:entry:reaction:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  void (*v34)(char *, _QWORD, uint64_t);
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a2;
  v41 = a4;
  v38[1] = a3;
  v42 = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C459A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22CD93B98();
  v39 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v38 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22CD93BA4();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v38 - v23;
  v25 = a1;
  sub_22CD81F30((uint64_t)v25);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
  {

    swift_bridgeObjectRelease();
    v26 = &qword_253F428E0;
    v27 = (uint64_t)v17;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
    v28 = v40;
    sub_22CD81FA0((uint64_t)v28);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
    {
      v31 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
      v32 = v14;
      v38[0] = v14;
      v33 = v39;
      v31(v32, v8, v9);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v18);
      v34 = *(void (**)(char *, _QWORD, uint64_t))(v33 + 16);
      v35 = v38[0];
      v34(v12, v38[0], v9);
      v30 = v42;
      sub_22CD93418();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v35, v9);
      OUTLINED_FUNCTION_0_9();
      v29 = 0;
      goto LABEL_7;
    }

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_9();
    v26 = &qword_255C459A0;
    v27 = (uint64_t)v8;
  }
  sub_22CD82324(v27, v26);
  v29 = 1;
  v30 = v42;
LABEL_7:
  v36 = sub_22CD93424();
  return __swift_storeEnumTagSinglePayload(v30, v29, 1, v36);
}

id sub_22CD8CE80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_22CD8CED4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKitInternal_MediaPlayer_FinalClass()
{
  return objc_opt_self();
}

void sub_22CD8CF28()
{
  sub_22CD8CF60();
}

void sub_22CD8CF44()
{
  sub_22CD8CF60();
}

void sub_22CD8CF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t *v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  OUTLINED_FUNCTION_23();
  v32 = v4;
  v33 = v5;
  v31 = v6;
  v8 = v7;
  v10 = v9;
  v35 = v11;
  v29 = sub_22CD93898();
  v12 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_67();
  v13 = sub_22CD93838();
  OUTLINED_FUNCTION_53();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v28 - v16;
  v34 = v1;
  v18 = OUTLINED_FUNCTION_33_1(v1);
  v30 = v10;
  v19 = OUTLINED_FUNCTION_4_1(v18, sel_identifiers);
  sub_22CD938BC();
  sub_22CD7EB64(v0, (uint64_t)v17);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v29);
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 16))(v3, v17, v13);
  OUTLINED_FUNCTION_70();
  if (v8 >> 62)
  {
    OUTLINED_FUNCTION_13_2();
    v20 = v30;
    v27 = v30;
    swift_bridgeObjectRetain();
    v22 = OUTLINED_FUNCTION_14_2();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = v30;
    v21 = v30;
    swift_bridgeObjectRetain();
    sub_22CD93E5C();
    OUTLINED_FUNCTION_13_2();
    v22 = v8;
  }
  swift_bridgeObjectRelease();
  v23 = v32;
  v24 = v32(0);
  v25 = sub_22CD80E04(v31, v23, v33);
  v26 = v35;
  MEMORY[0x22E30851C](v3, v20, &v36, v22, v24, v25);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v17, v13);
  OUTLINED_FUNCTION_61(v26);
  OUTLINED_FUNCTION_1_0();
}

void sub_22CD8D144()
{
  sub_22CD8CF60();
}

uint64_t sub_22CD8D160()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23();
  v2 = v1;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_37_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_40_0();
  if (OUTLINED_FUNCTION_4_1(v6, sel_curatorKind) == (id)4)
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_59();
    v8 = OUTLINED_FUNCTION_4_1(v7, sel_identifiers);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_31_1();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_29_1();
    if (v9)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_42_0();
    }
    else
    {
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_42_0();
    sub_22CD9355C();
    sub_22CD80E04(&qword_255C45FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6A1F8], MEMORY[0x24BE6A1B8]);
    OUTLINED_FUNCTION_7_3();
  }
  OUTLINED_FUNCTION_62();

  sub_22CD9355C();
  v10 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v10, v11, v12, v13);
}

void sub_22CD8D2D8()
{
  sub_22CD8CF60();
}

uint64_t sub_22CD8D2F4()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_23();
  v3 = v2;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_53();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_65();
  v8 = (uint64_t)OUTLINED_FUNCTION_41_0(v7, sel_hasVideo);
  if ((v8 & 1) == 0 && (OUTLINED_FUNCTION_41_0(v8, sel_isArtistUploadedContent) & 1) != 0)
  {
    v9 = OUTLINED_FUNCTION_15_2();
    v10 = OUTLINED_FUNCTION_41_0(v9, sel_identifiers);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_50_0();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_54();
    if (v11)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_34_1();
    }
    else
    {
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_51_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_34_1();
    sub_22CD93574();
    sub_22CD80E04(&qword_255C46000, (uint64_t (*)(uint64_t))MEMORY[0x24BE6A2D0], MEMORY[0x24BE6A290]);
    OUTLINED_FUNCTION_11_1();
  }
  OUTLINED_FUNCTION_34_1();

  sub_22CD93574();
  v12 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v12, v13, v14, v15);
}

uint64_t sub_22CD8D494()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_23();
  v3 = v2;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_53();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_65();
  v8 = OUTLINED_FUNCTION_41_0(v7, sel_hasVideo);
  if ((_DWORD)v8 && (OUTLINED_FUNCTION_41_0((uint64_t)v8, sel_isArtistUploadedContent) & 1) != 0)
  {
    v9 = OUTLINED_FUNCTION_15_2();
    v10 = OUTLINED_FUNCTION_41_0(v9, sel_identifiers);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_50_0();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_54();
    if (v11)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_34_1();
    }
    else
    {
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_51_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_34_1();
    sub_22CD93580();
    sub_22CD80E04(&qword_255C45FC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6A348], MEMORY[0x24BE6A300]);
    OUTLINED_FUNCTION_11_1();
  }
  OUTLINED_FUNCTION_34_1();

  sub_22CD93580();
  v12 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v12, v13, v14, v15);
}

void sub_22CD8D634()
{
  sub_22CD8CF60();
}

void sub_22CD8D650()
{
  sub_22CD8CF60();
}

void sub_22CD8D66C()
{
  sub_22CD8CF60();
}

void sub_22CD8D688()
{
  sub_22CD8CF60();
}

uint64_t sub_22CD8D6A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  id v18;
  uint64_t v19;

  OUTLINED_FUNCTION_23();
  v6 = v5;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_53();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_65();
  v11 = OUTLINED_FUNCTION_41_0(v10, sel_hasVideo);
  if ((_DWORD)v11 && !OUTLINED_FUNCTION_41_0((uint64_t)v11, sel_isArtistUploadedContent))
  {
    v17 = OUTLINED_FUNCTION_33_1(v0);
    v18 = OUTLINED_FUNCTION_41_0(v17, sel_identifiers);
    sub_22CD938BC();
    OUTLINED_FUNCTION_50_0();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    OUTLINED_FUNCTION_80(v4, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
    OUTLINED_FUNCTION_54();
    if (v19)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_34_1();
    }
    else
    {
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_51_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_34_1();
    sub_22CD938EC();
    OUTLINED_FUNCTION_55();
  }
  OUTLINED_FUNCTION_34_1();

  sub_22CD938EC();
  v12 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v12, v13, v14, v15);
}

void sub_22CD8D854()
{
  sub_22CD8DBBC();
}

uint64_t sub_22CD8D868()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23();
  v2 = v1;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_37_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_40_0();
  if (!objc_msgSend(v2, sel_hasVideo))
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_59();
    v12 = OUTLINED_FUNCTION_4_1(v11, sel_identifiers);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_31_1();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_29_1();
    if (v13)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_42_0();
    }
    else
    {
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_42_0();
    sub_22CD93AE4();
    OUTLINED_FUNCTION_7_3();
  }
  OUTLINED_FUNCTION_62();

  sub_22CD93AE4();
  v6 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v6, v7, v8, v9);
}

void sub_22CD8D9C8()
{
  sub_22CD8DBBC();
}

void sub_22CD8D9DC()
{
  sub_22CD8DBBC();
}

void sub_22CD8D9F0()
{
  sub_22CD8DBBC();
}

uint64_t sub_22CD8DA04()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23();
  v2 = v1;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_37_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_40_0();
  if (OUTLINED_FUNCTION_4_1(v6, sel_curatorSubKind) == (id)1)
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_59();
    v8 = OUTLINED_FUNCTION_4_1(v7, sel_identifiers);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_31_1();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_29_1();
    if (v9)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_42_0();
    }
    else
    {
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_42_0();
    sub_22CD93B5C();
    OUTLINED_FUNCTION_7_3();
  }
  OUTLINED_FUNCTION_62();

  sub_22CD93B5C();
  v10 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v10, v11, v12, v13);
}

void sub_22CD8DB64()
{
  sub_22CD8DBBC();
}

void sub_22CD8DB78()
{
  sub_22CD8DBBC();
}

void sub_22CD8DB8C()
{
  sub_22CD8CF60();
}

void sub_22CD8DBA8()
{
  sub_22CD8DBBC();
}

void sub_22CD8DBBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
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
  char *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void (*v25)(_QWORD);
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_23();
  v26 = v2;
  v27 = v3;
  v25 = v4;
  v6 = v5;
  v8 = v7;
  v23 = sub_22CD93898();
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v12 = v11 - v10;
  v13 = sub_22CD93838();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v23 - v18;
  OUTLINED_FUNCTION_33_1(v0);
  OUTLINED_FUNCTION_59();
  v24 = v8;
  v20 = objc_msgSend(v8, sel_identifiers);
  sub_22CD938BC();
  sub_22CD7EB64(v12, (uint64_t)v19);

  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v12, v23);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  OUTLINED_FUNCTION_70();
  if (v6 >> 62)
  {
    OUTLINED_FUNCTION_13_2();
    v22 = v24;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_14_2();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = v24;
    swift_bridgeObjectRetain();
    sub_22CD93E5C();
    OUTLINED_FUNCTION_13_2();
  }
  swift_bridgeObjectRelease();
  v25(0);
  OUTLINED_FUNCTION_55();
}

uint64_t sub_22CD8DDA8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23();
  v2 = v1;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_37_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_40_0();
  if (OUTLINED_FUNCTION_4_1(v6, sel_curatorSubKind) == (id)3)
  {
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_59();
    v8 = OUTLINED_FUNCTION_4_1(v7, sel_identifiers);
    OUTLINED_FUNCTION_26_1();
    OUTLINED_FUNCTION_31_1();

    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    OUTLINED_FUNCTION_25_1();
    OUTLINED_FUNCTION_29_1();
    if (v9)
    {
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_42_0();
    }
    else
    {
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_43_0();
      sub_22CD93E5C();
      OUTLINED_FUNCTION_13_2();
    }
    OUTLINED_FUNCTION_42_0();
    sub_22CD93BB0();
    OUTLINED_FUNCTION_7_3();
  }
  OUTLINED_FUNCTION_62();

  sub_22CD93BB0();
  v10 = OUTLINED_FUNCTION_8_4();
  return OUTLINED_FUNCTION_1_7(v10, v11, v12, v13);
}

uint64_t sub_22CD8DF08@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;

  v6 = sub_22CD93898();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93838();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  if (objc_msgSend(a1, sel_hasVideo)
    && (objc_msgSend(a1, sel_isArtistUploadedContent) & 1) != 0)
  {
    v32 = a3;
    v30 = sub_22CD93580();
    dynamic_cast_existential_1_unconditional(v30);
    v29 = v11;
    v31 = v10;
    v17 = objc_msgSend(a1, sel_identifiers);
    v18 = v31;
    sub_22CD938BC();
    sub_22CD7EB64((uint64_t)v9, (uint64_t)v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v18);
    v34 = 0;
    memset(v33, 0, sizeof(v33));
    if (a2 >> 62)
    {
      sub_22CD935D4();
      v28 = a1;
      swift_bridgeObjectRetain();
      v21 = sub_22CD93E20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = a1;
      swift_bridgeObjectRetain();
      sub_22CD93E5C();
      sub_22CD935D4();
      v21 = a2;
    }
    swift_bridgeObjectRelease();
    v22 = sub_22CD80E04(&qword_255C45FC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE6A348], MEMORY[0x24BE6A300]);
    v23 = v32;
    v24 = v21;
    v25 = v30;
    MEMORY[0x22E30851C](v14, a1, v33, v24, v30, v22);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    return __swift_storeEnumTagSinglePayload(v23, 0, 1, v25);
  }
  else
  {
    swift_bridgeObjectRelease();

    v27 = sub_22CD93580();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v27);
  }
}

uint64_t sub_22CD8E1D4@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;

  v6 = sub_22CD93898();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93838();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  if (objc_msgSend(a1, sel_hasVideo) && !objc_msgSend(a1, sel_isArtistUploadedContent))
  {
    v31 = a3;
    v30 = sub_22CD938EC();
    dynamic_cast_existential_1_unconditional(v30);
    v20 = objc_msgSend(a1, sel_identifiers, v19);
    v32 = v10;
    v21 = v20;
    sub_22CD938BC();
    sub_22CD7EB64((uint64_t)v9, (uint64_t)v16);

    v22 = v32;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v22);
    v34 = 0;
    memset(v33, 0, sizeof(v33));
    if (a2 >> 62)
    {
      sub_22CD935D4();
      v28 = a1;
      swift_bridgeObjectRetain();
      v22 = v32;
      v24 = sub_22CD93E20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v23 = a1;
      swift_bridgeObjectRetain();
      sub_22CD93E5C();
      sub_22CD935D4();
      v24 = a2;
    }
    swift_bridgeObjectRelease();
    v25 = v31;
    v26 = v24;
    v27 = v30;
    MEMORY[0x22E30851C](v14, a1, v33, v26, v30, MEMORY[0x24BDDEE40]);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v22);
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v27);
  }
  else
  {
    swift_bridgeObjectRelease();

    v17 = sub_22CD938EC();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v17);
  }
}

uint64_t sub_22CD8E480@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;

  v6 = sub_22CD93898();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93838();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  if ((objc_msgSend(a1, sel_hasVideo) & 1) != 0
    || (objc_msgSend(a1, sel_isArtistUploadedContent) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    v27 = sub_22CD93574();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v27);
  }
  else
  {
    v32 = a3;
    v30 = sub_22CD93574();
    dynamic_cast_existential_1_unconditional(v30);
    v29 = v11;
    v31 = v10;
    v17 = objc_msgSend(a1, sel_identifiers);
    v18 = v31;
    sub_22CD938BC();
    sub_22CD7EB64((uint64_t)v9, (uint64_t)v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v14, v16, v18);
    v34 = 0;
    memset(v33, 0, sizeof(v33));
    if (a2 >> 62)
    {
      sub_22CD935D4();
      v28 = a1;
      swift_bridgeObjectRetain();
      v21 = sub_22CD93E20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = a1;
      swift_bridgeObjectRetain();
      sub_22CD93E5C();
      sub_22CD935D4();
      v21 = a2;
    }
    swift_bridgeObjectRelease();
    v22 = sub_22CD80E04(&qword_255C46000, (uint64_t (*)(uint64_t))MEMORY[0x24BE6A2D0], MEMORY[0x24BE6A290]);
    v23 = v32;
    v24 = v21;
    v25 = v30;
    MEMORY[0x22E30851C](v14, a1, v33, v24, v30, v22);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    return __swift_storeEnumTagSinglePayload(v23, 0, 1, v25);
  }
}

uint64_t sub_22CD8E74C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _OWORD v36[2];
  uint64_t v37;

  v6 = sub_22CD93898();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22CD93838();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - v15;
  if (objc_msgSend(a1, sel_hasVideo))
  {
    swift_bridgeObjectRelease();

    v17 = sub_22CD93AE4();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v17);
  }
  else
  {
    v35 = a3;
    v33 = sub_22CD93AE4();
    dynamic_cast_existential_1_unconditional(v33);
    v32 = v6;
    v34 = a1;
    v19 = objc_msgSend(a1, sel_identifiers);
    v20 = v11;
    v21 = v10;
    v22 = v19;
    sub_22CD938BC();
    sub_22CD7EB64((uint64_t)v9, (uint64_t)v16);

    v23 = v21;
    v24 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v32);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v14, v16, v23);
    v37 = 0;
    memset(v36, 0, sizeof(v36));
    if (a2 >> 62)
    {
      sub_22CD935D4();
      v25 = v34;
      v31 = v34;
      swift_bridgeObjectRetain();
      v27 = sub_22CD93E20();
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = v34;
      v26 = v34;
      swift_bridgeObjectRetain();
      sub_22CD93E5C();
      sub_22CD935D4();
      v27 = a2;
    }
    swift_bridgeObjectRelease();
    v28 = v35;
    v29 = v27;
    v30 = v33;
    MEMORY[0x22E30851C](v14, v25, v36, v29, v33, MEMORY[0x24BDDF4F8]);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v23);
    return __swift_storeEnumTagSinglePayload(v28, 0, 1, v30);
  }
}

void GenericMusicItem.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
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
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
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
  void *v167;
  void *v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  char v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  void (*v203)(uint64_t, uint64_t, uint64_t);
  uint64_t v204;
  uint64_t v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void (*v216)(id, uint64_t, uint64_t);
  unsigned int *v217;
  uint64_t v218;
  void *v219;
  id v220;
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
  _QWORD *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  unsigned int *v268;
  id v269;
  int v270;
  unsigned int v271;
  uint64_t v272;
  void (*v273)(uint64_t, uint64_t, uint64_t);
  void *v274;
  unint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  unint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void (*v292)(uint64_t, uint64_t, uint64_t);
  void *v293;
  unint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  unint64_t v300;
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
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  _QWORD v323[3];
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  _QWORD v347[5];
  uint64_t v348[2];
  uint64_t v349;
  uint64_t v350;
  uint64_t v351[2];
  _QWORD v352[2];
  uint64_t v353;
  uint64_t v354;
  _QWORD v355[2];
  uint64_t v356[2];
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369[2];
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  _QWORD v374[2];
  void (*v375)(uint64_t, uint64_t, uint64_t);
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  _QWORD *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  _QWORD v386[2];
  void (*v387)(uint64_t, uint64_t, uint64_t);
  id v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;

  OUTLINED_FUNCTION_23();
  a19 = v23;
  a20 = v24;
  v388 = v25;
  v391 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42868);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v28);
  v29 = sub_22CD9358C();
  OUTLINED_FUNCTION_20_1(v29, (uint64_t)&v350);
  v326 = v30;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42870);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v34);
  v35 = sub_22CD93598();
  OUTLINED_FUNCTION_20_1(v35, (uint64_t)&v358);
  v327 = v36;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42878);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v40);
  v41 = sub_22CD935A4();
  OUTLINED_FUNCTION_20_1(v41, (uint64_t)&v364);
  v332 = v42;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v44);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42698);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v46);
  v47 = sub_22CD93AE4();
  OUTLINED_FUNCTION_20_1(v47, (uint64_t)&v366);
  v334 = v48;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v50);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42848);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v52);
  v53 = sub_22CD93574();
  OUTLINED_FUNCTION_20_1(v53, (uint64_t)&v361);
  v331 = v54;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42890);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v58);
  v59 = sub_22CD938EC();
  OUTLINED_FUNCTION_20_1(v59, (uint64_t)&v365);
  v333 = v60;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v62);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42858);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v64);
  v65 = sub_22CD93580();
  OUTLINED_FUNCTION_20_1(v65, (uint64_t)&v360);
  v330 = v66;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v68);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F428D0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v70);
  v71 = sub_22CD93B68();
  OUTLINED_FUNCTION_20_1(v71, (uint64_t)&v373);
  v347[0] = v72;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v74);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42840);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v76);
  v77 = sub_22CD93568();
  OUTLINED_FUNCTION_20_1(v77, (uint64_t)&v376);
  v347[2] = v78;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v79);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428A0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v82);
  v83 = sub_22CD939A0();
  OUTLINED_FUNCTION_20_1(v83, (uint64_t)&v378);
  v348[1] = v84;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v87);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v88);
  v89 = sub_22CD93BA4();
  OUTLINED_FUNCTION_20_1(v89, (uint64_t)v386);
  v352[1] = v90;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v91);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v92);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42810);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v93);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v94);
  v95 = sub_22CD93544();
  OUTLINED_FUNCTION_20_1(v95, (uint64_t)&v394);
  v362 = v96;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v97);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v98);
  v99 = sub_22CD93898();
  OUTLINED_FUNCTION_20_1(v99, (uint64_t)&a16);
  v374[0] = v100;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v101);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v102);
  v103 = sub_22CD93838();
  v378 = *(_QWORD *)(v103 - 8);
  v379 = v103;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v104);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v105);
  OUTLINED_FUNCTION_17_1();
  v383 = v106;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42830);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v107);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v108);
  v109 = sub_22CD9355C();
  OUTLINED_FUNCTION_20_1(v109, (uint64_t)&a10);
  v365 = v110;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v111);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v112);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F428A8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v113);
  OUTLINED_FUNCTION_29();
  v377 = v114;
  MEMORY[0x24BDAC7A8](v115);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v116);
  v117 = sub_22CD93B14();
  v380 = *(_QWORD *)(v117 - 8);
  v381 = v117;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v118);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v119);
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v120);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_22_0(v121);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v122);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_9(v123);
  v124 = sub_22CD93BB0();
  OUTLINED_FUNCTION_20_1(v124, (uint64_t)&v388);
  v355[1] = v125;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v126);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_22_0(v127);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428C8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v128);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v129);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_9(v130);
  v131 = sub_22CD93B5C();
  OUTLINED_FUNCTION_20_1(v131, (uint64_t)&a12);
  v382 = v132;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v133);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_0_7();
  MEMORY[0x24BDAC7A8](v134);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_22_0(v135);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42820);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v136);
  OUTLINED_FUNCTION_0_4();
  v386[0] = v137;
  v138 = sub_22CD93550();
  v139 = *(_QWORD *)(v138 - 8);
  v384 = v138;
  v385 = v139;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v140);
  OUTLINED_FUNCTION_67();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F428B8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v141);
  OUTLINED_FUNCTION_0();
  v144 = v143 - v142;
  v145 = sub_22CD93B2C();
  v146 = *(_QWORD *)(v145 - 8);
  MEMORY[0x24BDAC7A8](v145);
  OUTLINED_FUNCTION_0();
  v149 = v148 - v147;
  __swift_instantiateConcreteTypeFromMangledName(qword_253F426A8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v150);
  OUTLINED_FUNCTION_0();
  v153 = v152 - v151;
  v154 = sub_22CD93AF0();
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v155);
  OUTLINED_FUNCTION_0();
  v158 = v157 - v156;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F42808);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v159);
  OUTLINED_FUNCTION_29();
  v389 = v160;
  v162 = MEMORY[0x24BDAC7A8](v161);
  v386[1] = (char *)v323 - v163;
  MEMORY[0x24BDAC7A8](v162);
  OUTLINED_FUNCTION_40_0();
  v164 = sub_22CD93388();
  v390 = v22;
  v165 = v22;
  v166 = v388;
  v387 = (void (*)(uint64_t, uint64_t, uint64_t))v164;
  __swift_storeEnumTagSinglePayload(v165, 1, 1, v164);
  objc_opt_self();
  v167 = (void *)swift_dynamicCastObjCClass();
  if (v167)
  {
    v168 = v166;
    v169 = v391;
    v170 = objc_msgSend(v167, sel_innerObject);
    if (v170)
    {
      GenericMusicItem.init(_:)(v170);

      v171 = v390;
      OUTLINED_FUNCTION_9_4(v172, &qword_253F42808);
      OUTLINED_FUNCTION_76();
LABEL_4:
      v20 = v387;
LABEL_5:
      v173 = v389;
      goto LABEL_24;
    }

    goto LABEL_23;
  }
  v323[2] = v21;
  v324 = v158;
  v325 = v153;
  v174 = v145;
  v323[0] = v146;
  v323[1] = v149;
  v175 = v385;
  v176 = v386[0];
  objc_opt_self();
  v177 = v166;
  v178 = swift_dynamicCastObjCClass();
  if (v178)
  {
    v179 = (void *)v178;
    v180 = v177;
    v181 = objc_msgSend(v179, sel_flattenedGenericObject);
    v171 = v390;
    if (!v181)
    {

      v169 = v391;
      goto LABEL_4;
    }
    v182 = v181;
    v183 = objc_msgSend(v181, sel_anyObject);

    v169 = v391;
    v173 = v389;
    if (v183)
    {
      GenericMusicItem.init(_:)(v183);

      OUTLINED_FUNCTION_9_4(v184, &qword_253F42808);
      OUTLINED_FUNCTION_76();
    }
    else
    {

    }
    goto LABEL_17;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_21_2())
  {
    OUTLINED_FUNCTION_77();
    sub_22CD8210C(v185);
    v186 = OUTLINED_FUNCTION_47_0();
    v188 = OUTLINED_FUNCTION_12_1(v186, v187, v154);
    v169 = v391;
    if (!v189)
    {
      v171 = v390;
      OUTLINED_FUNCTION_9_4(v188, &qword_253F42808);
      OUTLINED_FUNCTION_23_1();
      v196 = v324;
      v20(v324, v175, v154);
      v20(v171, v196, v154);
      v197 = (unsigned int *)MEMORY[0x24BE69560];
LABEL_32:
      OUTLINED_FUNCTION_27_1(v197);
      OUTLINED_FUNCTION_35_1();
      goto LABEL_5;
    }
    v190 = qword_253F426A8;
    v191 = v175;
LABEL_22:
    sub_22CD82324(v191, v190);
LABEL_23:
    v20 = v387;
    v173 = v389;
    v171 = v390;
    goto LABEL_24;
  }
  objc_opt_self();
  v192 = OUTLINED_FUNCTION_21_2();
  v169 = v391;
  if (v192)
  {
    sub_22CD82128(v192);
    v193 = OUTLINED_FUNCTION_12_1(v144, 1, v174);
    if (!v189)
    {
      v171 = v390;
      OUTLINED_FUNCTION_9_4(v193, &qword_253F42808);
      v203 = *(void (**)(uint64_t, uint64_t, uint64_t))(v323[0] + 32);
      v204 = OUTLINED_FUNCTION_38_0((uint64_t)v347);
      v203(v204, v144, v174);
      v203(v171, v174, v174);
      v197 = (unsigned int *)MEMORY[0x24BE69578];
      goto LABEL_32;
    }
    v190 = (uint64_t *)&unk_253F428B8;
    v191 = v144;
    goto LABEL_22;
  }
  objc_opt_self();
  v198 = OUTLINED_FUNCTION_21_2();
  v173 = v389;
  v171 = v390;
  if (!v198)
  {
    objc_opt_self();
    v205 = OUTLINED_FUNCTION_21_2();
    if (v205)
    {
      v206 = (void *)v205;
      v207 = v177;
      v208 = objc_msgSend(v206, sel_curatorKind);
      if (v208 == (id)4)
      {
        v227 = OUTLINED_FUNCTION_71();
        sub_22CD82198(v227);

        v228 = OUTLINED_FUNCTION_12_1(0x24BDDC000, 1, v369[1]);
        if (!v189)
        {
          OUTLINED_FUNCTION_9_4(v228, &qword_253F42808);
          OUTLINED_FUNCTION_23_1();
          v236 = v366;
          OUTLINED_FUNCTION_10_1(v366, 0x24BDDC000);
          OUTLINED_FUNCTION_10_1(v171, v236);
          v217 = (unsigned int *)MEMORY[0x24BE694F8];
          goto LABEL_42;
        }
        v201 = (uint64_t *)&unk_253F42830;
        goto LABEL_55;
      }
      if (v208 == (id)2)
      {
        OUTLINED_FUNCTION_72();

        v229 = v371;
        v230 = OUTLINED_FUNCTION_12_1(0x24BDDC000, 1, v371);
        v231 = v382;
        if (!v189)
        {
          OUTLINED_FUNCTION_9_4(v230, &qword_253F42808);
          v20 = (void (*)(uint64_t, uint64_t, uint64_t))v231[4];
          OUTLINED_FUNCTION_56((uint64_t)&v393);
          v213 = v171;
          v214 = (uint64_t)v207;
          v215 = v229;
          goto LABEL_60;
        }
        goto LABEL_54;
      }
      v20 = (void (*)(uint64_t, uint64_t, uint64_t))v382;
      if (v208 != (id)1)
        goto LABEL_47;
      v209 = objc_msgSend(v206, sel_curatorSubKind);
      if (v209 == (id)3)
      {
        v246 = OUTLINED_FUNCTION_71();
        sub_22CD8217C(v246);

        v247 = v359;
        v248 = OUTLINED_FUNCTION_12_1(0x24BDDC000, 1, v359);
        if (!v189)
        {
          OUTLINED_FUNCTION_9_4(v248, &qword_253F42808);
          OUTLINED_FUNCTION_23_1();
          OUTLINED_FUNCTION_56((uint64_t)&v383);
          v20(v171, (uint64_t)v207, v247);
          v217 = (unsigned int *)MEMORY[0x24BE695B8];
          goto LABEL_42;
        }
        v201 = &qword_253F428E8;
        goto LABEL_55;
      }
      if (v209 != (id)2)
      {
        if (v209 == (id)1)
        {
          OUTLINED_FUNCTION_72();

          v210 = v371;
          v211 = OUTLINED_FUNCTION_12_1(0x24BDDC000, 1, v371);
          if (!v189)
          {
            OUTLINED_FUNCTION_9_4(v211, &qword_253F42808);
            v20 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v20 + 4);
            v212 = v354;
            OUTLINED_FUNCTION_10_1(v354, 0x24BDDC000);
            v213 = v171;
            v214 = v212;
            v215 = v210;
LABEL_60:
            v20(v213, v214, v215);
            v217 = (unsigned int *)MEMORY[0x24BE69590];
            goto LABEL_42;
          }
LABEL_54:
          v201 = &qword_253F428C8;
LABEL_55:
          v202 = 0x24BDDC000uLL;
          goto LABEL_82;
        }
LABEL_47:

LABEL_48:
        v20 = v387;
        goto LABEL_26;
      }
      v249 = (void *)OUTLINED_FUNCTION_71();
      Genre.init(_:)(v249, v250);

      v251 = OUTLINED_FUNCTION_12_1(0x24BDDC000, 1, v381);
      if (v189)
      {
        v201 = (uint64_t *)&unk_253F428A8;
        goto LABEL_55;
      }
      OUTLINED_FUNCTION_9_4(v251, &qword_253F42808);
      v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v380 + 32);
      v256 = v356[0];
      OUTLINED_FUNCTION_10_1(v356[0], 0x24BDDC000);
      OUTLINED_FUNCTION_10_1(v171, v256);
LABEL_66:
      v217 = (unsigned int *)MEMORY[0x24BE69568];
      goto LABEL_42;
    }
    objc_opt_self();
    v218 = OUTLINED_FUNCTION_21_2();
    if (v218)
    {
      v219 = (void *)v218;
      v388 = v177;
      v220 = objc_msgSend(v219, sel_identifiers);
      v221 = v372;
      sub_22CD93880();
      sub_22CD7EB64(v221, v383);

      (*(void (**)(uint64_t, _QWORD))(v374[0] + 8))(v221, v374[1]);
      objc_opt_self();
      v222 = swift_dynamicCastObjCClass();
      v223 = v379;
      v224 = v378;
      if (v222)
      {
        if (OUTLINED_FUNCTION_4_1((uint64_t)v219, sel_curatorSubKind) == (id)2)
        {
          v225 = v383;
          OUTLINED_FUNCTION_80(v376, v383, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v224 + 16));
          OUTLINED_FUNCTION_70();
          v226 = v373;
          sub_22CD93AFC();

          (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v225, v223);
LABEL_63:
          v238 = v377;
          v239 = v381;
          OUTLINED_FUNCTION_74(v377, v226);
          OUTLINED_FUNCTION_61(v238);
          v240 = v388;

          v241 = OUTLINED_FUNCTION_12_1(v238, 1, v239);
          v20 = v375;
          if (v189)
          {
            v201 = (uint64_t *)&unk_253F428A8;
            v202 = v238;
            goto LABEL_82;
          }
          OUTLINED_FUNCTION_9_4(v241, &qword_253F42808);
          OUTLINED_FUNCTION_74((uint64_t)v20, v238);
          OUTLINED_FUNCTION_74(v171, (uint64_t)v20);
          goto LABEL_66;
        }

      }
      v237 = v383;
      OUTLINED_FUNCTION_80(v376, v383, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v224 + 16));
      v226 = v373;
      sub_22CD93B08();
      (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v237, v223);
      goto LABEL_63;
    }
    objc_opt_self();
    if (OUTLINED_FUNCTION_21_2())
    {
      OUTLINED_FUNCTION_77();
      sub_22CD821B4(v232);
      v233 = OUTLINED_FUNCTION_47_0();
      v235 = OUTLINED_FUNCTION_12_1(v233, v234, v367);
      if (!v189)
      {
        OUTLINED_FUNCTION_9_4(v235, &qword_253F42808);
        OUTLINED_FUNCTION_23_1();
        OUTLINED_FUNCTION_36_1((uint64_t)&v392);
        OUTLINED_FUNCTION_48();
        v217 = (unsigned int *)MEMORY[0x24BE69510];
        goto LABEL_42;
      }
      v201 = (uint64_t *)&unk_253F42810;
      goto LABEL_81;
    }
    objc_opt_self();
    if (OUTLINED_FUNCTION_21_2())
    {
      OUTLINED_FUNCTION_77();
      sub_22CD81F30(v242);
      v243 = OUTLINED_FUNCTION_47_0();
      v245 = OUTLINED_FUNCTION_12_1(v243, v244, v356[1]);
      if (!v189)
      {
        OUTLINED_FUNCTION_9_4(v245, &qword_253F42808);
        OUTLINED_FUNCTION_23_1();
        OUTLINED_FUNCTION_36_1((uint64_t)&v381);
        OUTLINED_FUNCTION_48();
        v217 = (unsigned int *)MEMORY[0x24BE695A8];
        goto LABEL_42;
      }
      v201 = &qword_253F428E0;
      goto LABEL_81;
    }
    objc_opt_self();
    if (OUTLINED_FUNCTION_21_2())
    {
      OUTLINED_FUNCTION_77();
      sub_22CD821D0(v252);
      v253 = OUTLINED_FUNCTION_47_0();
      v255 = OUTLINED_FUNCTION_12_1(v253, v254, v351[1]);
      if (!v189)
      {
        OUTLINED_FUNCTION_9_4(v255, &qword_253F42808);
        OUTLINED_FUNCTION_23_1();
        OUTLINED_FUNCTION_36_1((uint64_t)&v375);
        OUTLINED_FUNCTION_48();
        v217 = (unsigned int *)MEMORY[0x24BE69520];
        goto LABEL_42;
      }
      v201 = &qword_253F428A0;
LABEL_81:
      v202 = v175;
      goto LABEL_82;
    }
    objc_opt_self();
    v20 = (void (*)(uint64_t, uint64_t, uint64_t))v177;
    if (swift_dynamicCastObjCClass())
    {
      OUTLINED_FUNCTION_68();
      sub_22CD81F84(v257);
      v258 = OUTLINED_FUNCTION_73();
      v260 = OUTLINED_FUNCTION_12_1(v258, v259, v350);
      if (!v189)
      {
        v171 = v390;
        OUTLINED_FUNCTION_9_4(v260, &qword_253F42808);
        OUTLINED_FUNCTION_23_1();
        v267 = OUTLINED_FUNCTION_38_0((uint64_t)&v372);
        OUTLINED_FUNCTION_10_1(v267, v351[0]);
        OUTLINED_FUNCTION_6_5();
        v268 = (unsigned int *)MEMORY[0x24BE69530];
LABEL_101:
        OUTLINED_FUNCTION_27_1(v268);
        OUTLINED_FUNCTION_35_1();
        v169 = v391;
        goto LABEL_5;
      }
      v261 = &qword_253F42840;
      v262 = &v377;
    }
    else
    {
      objc_opt_self();
      if (OUTLINED_FUNCTION_49_0())
      {
        OUTLINED_FUNCTION_68();
        sub_22CD821EC(v263);
        v264 = OUTLINED_FUNCTION_73();
        v266 = OUTLINED_FUNCTION_12_1(v264, v265, v347[4]);
        if (!v189)
        {
          v171 = v390;
          OUTLINED_FUNCTION_9_4(v266, &qword_253F42808);
          OUTLINED_FUNCTION_23_1();
          v286 = OUTLINED_FUNCTION_38_0((uint64_t)&v370);
          OUTLINED_FUNCTION_10_1(v286, v348[0]);
          OUTLINED_FUNCTION_6_5();
          v268 = (unsigned int *)MEMORY[0x24BE69598];
          goto LABEL_101;
        }
        v261 = (uint64_t *)&unk_253F428D0;
        v262 = v374;
      }
      else
      {
        objc_opt_self();
        if (OUTLINED_FUNCTION_49_0())
        {
          v20 = v177;
          v269 = OUTLINED_FUNCTION_41_0((uint64_t)v20, sel_hasVideo);
          v270 = (int)v269;
          v271 = OUTLINED_FUNCTION_41_0((uint64_t)v269, sel_isArtistUploadedContent);
          if (v270)
          {
            if (v271)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_253F428F0);
              v272 = OUTLINED_FUNCTION_66();
              *(_OWORD *)(v272 + 16) = xmmword_22CD948A0;
              __swift_instantiateConcreteTypeFromMangledName(&qword_255C45F90);
              v273 = v20;
              *(_QWORD *)(v272 + 32) = sub_22CD935F8();
              v392 = v272;
              OUTLINED_FUNCTION_60();
              v274 = (void *)OUTLINED_FUNCTION_52_0();
              sub_22CD8DF08(v274, v275, v276);
              v277 = OUTLINED_FUNCTION_47_0();
              OUTLINED_FUNCTION_12_1(v277, v278, v337);
              if (!v189)
              {

                v171 = v390;
                OUTLINED_FUNCTION_9_4(v312, &qword_253F42808);
                OUTLINED_FUNCTION_23_1();
                v313 = OUTLINED_FUNCTION_38_0((uint64_t)v352);
                OUTLINED_FUNCTION_10_1(v313, v339);
                OUTLINED_FUNCTION_6_5();
                v268 = (unsigned int *)MEMORY[0x24BE69540];
                goto LABEL_101;
              }
              OUTLINED_FUNCTION_79((uint64_t *)&unk_253F42858, (uint64_t)&v362);
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F428F0);
            v279 = OUTLINED_FUNCTION_66();
            *(_OWORD *)(v279 + 16) = xmmword_22CD948B0;
            __swift_instantiateConcreteTypeFromMangledName(&qword_255C45F88);
            *(_QWORD *)(v279 + 32) = sub_22CD93604();
            *(_QWORD *)(v279 + 40) = sub_22CD93610();
            v392 = v279;
            OUTLINED_FUNCTION_60();
            v280 = (void *)OUTLINED_FUNCTION_52_0();
            sub_22CD8E1D4(v280, v281, v282);

            v283 = OUTLINED_FUNCTION_47_0();
            v285 = OUTLINED_FUNCTION_12_1(v283, v284, v342);
            if (!v189)
            {
              v171 = v390;
              OUTLINED_FUNCTION_9_4(v285, &qword_253F42808);
              OUTLINED_FUNCTION_23_1();
              v309 = OUTLINED_FUNCTION_38_0((uint64_t)v356);
              OUTLINED_FUNCTION_10_1(v309, v345);
              OUTLINED_FUNCTION_6_5();
              v268 = (unsigned int *)MEMORY[0x24BE69518];
              goto LABEL_101;
            }
            v261 = &qword_253F42890;
            v262 = &v368;
          }
          else
          {
            if (v271)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_253F428F0);
              v291 = OUTLINED_FUNCTION_66();
              *(_OWORD *)(v291 + 16) = xmmword_22CD948A0;
              __swift_instantiateConcreteTypeFromMangledName(&qword_255C45F80);
              v292 = v20;
              *(_QWORD *)(v291 + 32) = sub_22CD935EC();
              v392 = v291;
              OUTLINED_FUNCTION_60();
              v293 = (void *)OUTLINED_FUNCTION_52_0();
              sub_22CD8E480(v293, v294, v295);
              v296 = OUTLINED_FUNCTION_47_0();
              OUTLINED_FUNCTION_12_1(v296, v297, v338);
              if (!v189)
              {

                v171 = v390;
                OUTLINED_FUNCTION_9_4(v314, &qword_253F42808);
                OUTLINED_FUNCTION_23_1();
                v315 = OUTLINED_FUNCTION_38_0((uint64_t)&v353);
                OUTLINED_FUNCTION_10_1(v315, v340);
                OUTLINED_FUNCTION_6_5();
                v268 = (unsigned int *)MEMORY[0x24BE69538];
                goto LABEL_101;
              }
              OUTLINED_FUNCTION_79((uint64_t *)&unk_253F42848, (uint64_t)&v363);
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F428F0);
            v298 = OUTLINED_FUNCTION_66();
            *(_OWORD *)(v298 + 16) = xmmword_22CD948B0;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F42880);
            *(_QWORD *)(v298 + 32) = sub_22CD9361C();
            *(_QWORD *)(v298 + 40) = sub_22CD93628();
            v392 = v298;
            OUTLINED_FUNCTION_60();
            v299 = (void *)OUTLINED_FUNCTION_52_0();
            sub_22CD8E74C(v299, v300, v301);

            v302 = OUTLINED_FUNCTION_47_0();
            v304 = OUTLINED_FUNCTION_12_1(v302, v303, v343);
            if (!v189)
            {
              v171 = v390;
              OUTLINED_FUNCTION_9_4(v304, &qword_253F42808);
              OUTLINED_FUNCTION_23_1();
              v311 = OUTLINED_FUNCTION_38_0((uint64_t)&v357);
              OUTLINED_FUNCTION_10_1(v311, v346);
              OUTLINED_FUNCTION_6_5();
              v268 = (unsigned int *)MEMORY[0x24BE69558];
              goto LABEL_101;
            }
            v261 = (uint64_t *)&unk_253F42698;
            v262 = v369;
          }
        }
        else
        {
          objc_opt_self();
          if (OUTLINED_FUNCTION_49_0())
          {
            OUTLINED_FUNCTION_68();
            sub_22CD82208(v287);
            v288 = OUTLINED_FUNCTION_73();
            v290 = OUTLINED_FUNCTION_12_1(v288, v289, v341);
            if (!v189)
            {
              v171 = v390;
              OUTLINED_FUNCTION_9_4(v290, &qword_253F42808);
              OUTLINED_FUNCTION_23_1();
              v310 = OUTLINED_FUNCTION_38_0((uint64_t)v355);
              OUTLINED_FUNCTION_10_1(v310, v344);
              OUTLINED_FUNCTION_6_5();
              v268 = (unsigned int *)MEMORY[0x24BE695C0];
              goto LABEL_101;
            }
            v261 = &qword_253F42878;
            v262 = &v367;
          }
          else
          {
            objc_opt_self();
            if (OUTLINED_FUNCTION_49_0())
            {
              OUTLINED_FUNCTION_68();
              sub_22CD82224(v305);
              v306 = OUTLINED_FUNCTION_73();
              v308 = OUTLINED_FUNCTION_12_1(v306, v307, v335);
              if (!v189)
              {
                v171 = v390;
                OUTLINED_FUNCTION_9_4(v308, &qword_253F42808);
                OUTLINED_FUNCTION_23_1();
                v321 = OUTLINED_FUNCTION_38_0((uint64_t)&v349);
                OUTLINED_FUNCTION_10_1(v321, v336);
                OUTLINED_FUNCTION_6_5();
                v268 = (unsigned int *)MEMORY[0x24BE695B0];
                goto LABEL_101;
              }
              v261 = &qword_253F42870;
              v262 = &v359;
            }
            else
            {
              objc_opt_self();
              v316 = swift_dynamicCastObjCClass();
              v169 = v391;
              if (!v316)
                goto LABEL_48;
              OUTLINED_FUNCTION_68();
              sub_22CD82240(v317);
              v318 = OUTLINED_FUNCTION_73();
              v320 = OUTLINED_FUNCTION_12_1(v318, v319, v328);
              if (!v189)
              {
                v171 = v390;
                OUTLINED_FUNCTION_9_4(v320, &qword_253F42808);
                OUTLINED_FUNCTION_23_1();
                v322 = OUTLINED_FUNCTION_38_0((uint64_t)v348);
                OUTLINED_FUNCTION_10_1(v322, v329);
                OUTLINED_FUNCTION_6_5();
                v268 = (unsigned int *)MEMORY[0x24BE69580];
                goto LABEL_101;
              }
              v261 = &qword_253F42868;
              v262 = v351;
            }
          }
        }
      }
    }
    OUTLINED_FUNCTION_79(v261, (uint64_t)v262);
    v169 = v391;
    goto LABEL_23;
  }
  sub_22CD82144(v198);
  v199 = v384;
  v200 = OUTLINED_FUNCTION_12_1(v176, 1, v384);
  if (v189)
  {
    v201 = (uint64_t *)&unk_253F42820;
    v202 = v176;
LABEL_82:
    sub_22CD82324(v202, v201);
LABEL_17:
    v20 = v387;
    goto LABEL_24;
  }
  OUTLINED_FUNCTION_9_4(v200, &qword_253F42808);
  v216 = *(void (**)(id, uint64_t, uint64_t))(v175 + 32);
  v216(v20, v176, v199);
  v216((id)v171, (uint64_t)v20, v199);
  v217 = (unsigned int *)MEMORY[0x24BE69528];
LABEL_42:
  OUTLINED_FUNCTION_27_1(v217);
  OUTLINED_FUNCTION_35_1();
LABEL_24:
  sub_22CD9020C(v171, v173);
  v194 = OUTLINED_FUNCTION_12_1(v173, 1, (uint64_t)v20);
  if (v189)
  {
LABEL_26:
    OUTLINED_FUNCTION_9_4(v194, &qword_253F42808);
    v195 = 1;
    goto LABEL_27;
  }
  (*(void (**)(uint64_t, uint64_t, id))(*((_QWORD *)v20 - 1) + 32))(v169, v173, v20);
  v195 = 0;
LABEL_27:
  __swift_storeEnumTagSinglePayload(v169, v195, 1, (uint64_t)v20);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CD9020C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F42808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_20_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_41_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_44_0()
{
  uint64_t v0;

  return *(id *)(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return swift_dynamicCastObjCClass();
}

void OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;
  uint64_t v1;

  sub_22CD7EB64(v1, v0);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_54()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 96) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

void OUTLINED_FUNCTION_55()
{
  JUMPOUT(0x22E30851CLL);
}

uint64_t OUTLINED_FUNCTION_56@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(*(_QWORD *)(a1 - 256), v2, v3);
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v2 - 136) + 16))(v1, v0, *(_QWORD *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_22CD938BC();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_22CD93CDC();
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_70()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 96) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_71()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  uint64_t v0;

  return sub_22CD82160(v0);
}

uint64_t OUTLINED_FUNCTION_73()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

id OUTLINED_FUNCTION_75()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_76()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22CD9020C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_79@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  return sub_22CD82324(*(_QWORD *)(a2 - 256), a1);
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

id OUTLINED_FUNCTION_81()
{
  void *v0;

  return v0;
}

uint64_t MusicCollaborativePlaylist.RemoveCollaboratorRequest.init(collaborator:playlist:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v39 = a1;
  v40 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255C45990);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93B74();
  v38 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v37 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22CD93BA4();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v37 - v21;
  v23 = a2;
  sub_22CD81F30((uint64_t)v23);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {

    v24 = &qword_253F428E0;
    v25 = (uint64_t)v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
    v26 = v39;
    sub_22CD8225C((uint64_t)v26);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) != 1)
    {
      v29 = v7;
      v30 = v38;
      v31 = v6;
      v32 = v29;
      (*(void (**)(char *, char *))(v38 + 32))(v12, v31);
      v33 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
      v34 = v32;
      v33(v10, v12, v32);
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
      v28 = v40;
      sub_22CD93454();

      (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v34);
      OUTLINED_FUNCTION_0_10();
      v27 = 0;
      goto LABEL_7;
    }

    OUTLINED_FUNCTION_0_10();
    v24 = (uint64_t *)&unk_255C45990;
    v25 = (uint64_t)v6;
  }
  sub_22CD82324(v25, v24);
  v27 = 1;
  v28 = v40;
LABEL_7:
  v35 = sub_22CD9346C();
  return __swift_storeEnumTagSinglePayload(v28, v27, 1, v35);
}

uint64_t MusicCollaborativePlaylist.RemoveCollaboratorRequest.perform()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_22CD9077C;
  return sub_22CD93460();
}

uint64_t sub_22CD9077C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_22CD907F0()
{
  uint64_t v0;
  uint64_t v2;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 48);
  sub_22CD93D9C();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_22CD93C28();
  *(_QWORD *)(v0 + 32) = v2;
  sub_22CD93DFC();
  sub_22CD93C28();
  return sub_22CD93E14();
}

#error "22CD90940: call analysis failed (funcsize=11)"

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:songs:folder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  uint64_t v51;
  uint64_t v52;
  char *v53;
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
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84[7];
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  OUTLINED_FUNCTION_23();
  LODWORD(v85) = v31;
  v89 = v33;
  v90 = v32;
  v92 = v34;
  v93 = v35;
  v91 = v36;
  v87 = v37;
  v88 = v38;
  v94 = v39;
  v40 = OUTLINED_FUNCTION_10_2(a24);
  v84[4] = *(_QWORD *)(v40 - 8);
  v84[5] = v40;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_7_4(v42, v84[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428C8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_6_6(v44, v84[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v45);
  v47 = OUTLINED_FUNCTION_19_2(v46, v84[0]);
  v84[1] = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_0_11(v49, v84[0]);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (char *)v84 - v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C46028);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_2_6(v56, v84[0]);
  v57 = OUTLINED_FUNCTION_12_1(v27, 1, a25);
  if (v74)
  {
    OUTLINED_FUNCTION_0_3();
    v86 = 0;
  }
  else
  {
    v28 = a26;
    v58 = OUTLINED_FUNCTION_49_1(v57, (unint64_t *)&qword_255C45D18);
    v61 = OUTLINED_FUNCTION_61_0((void (*)(char *, char *))sub_22CD90C50, 0, a25, v58, MEMORY[0x24BEE4078], v59, MEMORY[0x24BEE40A8], v60);
    OUTLINED_FUNCTION_30_2(v61);
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_24_2(v62, v63, &qword_255C46028);
  v64 = OUTLINED_FUNCTION_12_1(v29, 1, v47);
  if (v74)
  {
    OUTLINED_FUNCTION_56_0(v64, &qword_255C46028);
    v85 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_80((uint64_t)v53, *MEMORY[0x24BDDF398], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 104));
    OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_17_3();
    v65 = OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_36_2((uint64_t)v65);
    OUTLINED_FUNCTION_29_2(v29, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  }
  OUTLINED_FUNCTION_28_2();
  if (v74)
    v66 = 0;
  else
    v66 = (void *)OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_66_0();
  if (v74)
  {
    v69 = 0;
  }
  else
  {
    v67 = OUTLINED_FUNCTION_54_0();
    v69 = (void *)v67;
  }
  OUTLINED_FUNCTION_27_2(v67, v68, &qword_253F428C8);
  v70 = OUTLINED_FUNCTION_48_0();
  v71 = OUTLINED_FUNCTION_12_1(v28, 1, v70);
  if (v74)
  {
    v72 = &qword_253F428C8;
LABEL_19:
    OUTLINED_FUNCTION_52_1(v71, v72);
    v75 = 0;
    v77 = 0;
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_29_2(v28, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 8));
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_43_1();
  v73 = OUTLINED_FUNCTION_47_1();
  v71 = OUTLINED_FUNCTION_9_5(v73);
  if (v74)
  {
    v72 = &qword_253F427B8;
    goto LABEL_19;
  }
  v75 = OUTLINED_FUNCTION_50_1();
  v77 = v76;
  OUTLINED_FUNCTION_12_2();
LABEL_20:
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_5_6(v85, v86, v87, a25, v78, v79, v80, v81, v30, v66, v69, v75, v77);
  OUTLINED_FUNCTION_57_0();
  v83 = OUTLINED_FUNCTION_25_2(v82, &qword_255C46030);
  OUTLINED_FUNCTION_8_5(v83);
  OUTLINED_FUNCTION_1_0();
}

id sub_22CD90C50@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22CD9149C(a1, a2);
}

uint64_t sub_22CD90C64(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  char *v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  char *v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  void (*v52)(char *, char *);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v38 = a8;
  v39 = a5;
  v9 = v8;
  v52 = a1;
  v53 = a2;
  v37 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v51 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)v36 - v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v54 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v42 = (char *)v36 - v17;
  v18 = sub_22CD93D54();
  v40 = *(_QWORD *)(v18 - 8);
  v41 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v48 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v36 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v36[1] = (char *)v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v47 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v46 = (char *)v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = a6;
  v55 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v49 = (char *)v36 - v28;
  v29 = sub_22CD93CA0();
  v56 = sub_22CD93DD8();
  sub_22CD93DE4();
  sub_22CD93DC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v44, v15);
  v47 = v15;
  result = sub_22CD93C94();
  if (v29 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v29)
  {
    swift_getAssociatedConformanceWitness();
    v31 = v49;
    while (1)
    {
      sub_22CD93D60();
      result = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v52(v23, v51);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v51, v39);
        return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      sub_22CD93DCC();
      if (!--v29)
      {
        v32 = (uint64_t)v48;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v32 = (uint64_t)v48;
  v31 = v49;
LABEL_9:
  sub_22CD93D60();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v32, 1, AssociatedTypeWitness);
  v34 = v42;
  if (EnumTagSinglePayload == 1)
  {
    v35 = (uint64_t)v48;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v35, v41);
    return v56;
  }
  else
  {
    v51 = *(char **)(v54 + 32);
    v35 = (uint64_t)v48;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v51)(v34, v35, AssociatedTypeWitness);
      v52(v34, v50);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
      sub_22CD93DCC();
      sub_22CD93D60();
      if (__swift_getEnumTagSinglePayload(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v50, v39);
  }
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:songs:parent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  uint64_t v51;
  uint64_t v52;
  char *v53;
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
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83[7];
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  OUTLINED_FUNCTION_23();
  LODWORD(v84) = v31;
  v88 = v33;
  v89 = v32;
  v91 = v34;
  v92 = v35;
  v90 = v36;
  v86 = v37;
  v87 = v38;
  v93 = v39;
  v40 = OUTLINED_FUNCTION_10_2(a24);
  v83[4] = *(_QWORD *)(v40 - 8);
  v83[5] = v40;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_7_4(v42, v83[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428C8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_6_6(v44, v83[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v45);
  v47 = OUTLINED_FUNCTION_20_2(v46, v83[0]);
  v83[1] = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_0_11(v49, v83[0]);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_33_2();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (char *)v83 - v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_2_6(v56, v83[0]);
  v57 = OUTLINED_FUNCTION_12_1(v27, 1, a25);
  if (v73)
  {
    OUTLINED_FUNCTION_0_3();
    v85 = 0;
  }
  else
  {
    v28 = a26;
    v58 = OUTLINED_FUNCTION_49_1(v57, (unint64_t *)&qword_255C45D18);
    v85 = OUTLINED_FUNCTION_61_0((void (*)(char *, char *))sub_22CD90C50, 0, a25, v58, MEMORY[0x24BEE4078], v59, MEMORY[0x24BEE40A8], v60);
    OUTLINED_FUNCTION_29_2(v27, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a25 - 8) + 8));
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_24_2(v61, v62, &qword_253F428E0);
  v63 = OUTLINED_FUNCTION_12_1(v29, 1, v47);
  if (v73)
  {
    OUTLINED_FUNCTION_56_0(v63, &qword_253F428E0);
    v84 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_80((uint64_t)v53, *MEMORY[0x24BDDF398], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 104));
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_16_1();
    v64 = OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_35_2((uint64_t)v64);
    OUTLINED_FUNCTION_31_2(v29, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  }
  OUTLINED_FUNCTION_28_2();
  if (v73)
    v65 = 0;
  else
    v65 = (void *)OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_66_0();
  if (v73)
  {
    v68 = 0;
  }
  else
  {
    v66 = OUTLINED_FUNCTION_54_0();
    v68 = (void *)v66;
  }
  OUTLINED_FUNCTION_27_2(v66, v67, &qword_253F428C8);
  v69 = OUTLINED_FUNCTION_48_0();
  v70 = OUTLINED_FUNCTION_12_1(v28, 1, v69);
  if (v73)
  {
    v71 = &qword_253F428C8;
LABEL_19:
    OUTLINED_FUNCTION_52_1(v70, v71);
    v74 = 0;
    v76 = 0;
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_31_2(v28, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 8));
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_44_1();
  v72 = OUTLINED_FUNCTION_47_1();
  v70 = OUTLINED_FUNCTION_9_5(v72);
  if (v73)
  {
    v71 = &qword_253F427B8;
    goto LABEL_19;
  }
  v74 = OUTLINED_FUNCTION_50_1();
  v76 = v75;
  OUTLINED_FUNCTION_12_2();
LABEL_20:
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_5_6(v84, v85, v86, a25, v77, v78, v79, v80, v30, v65, v68, v74, v76);
  OUTLINED_FUNCTION_57_0();
  v82 = OUTLINED_FUNCTION_25_2(v81, &qword_255C46030);
  OUTLINED_FUNCTION_8_5(v82);
  OUTLINED_FUNCTION_1_0();
}

id sub_22CD9149C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  id v4;
  id v5;
  id result;
  _QWORD v7[4];

  v3 = *a1;
  v7[3] = sub_22CD85864(0, &qword_255C45AF8);
  v7[0] = v3;
  v4 = objc_allocWithZone(MEMORY[0x24BDDFC00]);
  v5 = v3;
  result = sub_22CD91D90(v7);
  *a2 = result;
  return result;
}

#error "22CD91534: call analysis failed (funcsize=11)"

void sub_22CD91544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char, uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  unsigned int v26;
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
  char *v39;
  uint64_t v40;
  void (*v42)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char, uint64_t, uint64_t, char *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;

  OUTLINED_FUNCTION_23();
  v47 = v26;
  v45 = v27;
  v46 = v28;
  v43 = v29;
  v44 = v30;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v42 = a26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C46028);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)&v42 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_22CD93B8C();
  __swift_storeEnumTagSinglePayload((uint64_t)v39, 1, 1, v40);
  v42(v36, v34, v32, v43, v44, v45, v46, v47, a21, a22, a23, v39, a24, a25);
  sub_22CD80930((uint64_t)v39, &qword_255C46028);
  OUTLINED_FUNCTION_1_0();
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:tracks:folder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[7];
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  OUTLINED_FUNCTION_23();
  LODWORD(v82) = v31;
  v86 = v33;
  v87 = v32;
  v89 = v34;
  v90 = v35;
  v88 = v36;
  v84 = v37;
  v85 = v38;
  v91 = v39;
  v40 = OUTLINED_FUNCTION_10_2(a24);
  v81[4] = *(_QWORD *)(v40 - 8);
  v81[5] = v40;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_7_4(v42, v81[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428C8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_6_6(v44, v81[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v45);
  v47 = OUTLINED_FUNCTION_19_2(v46, v81[0]);
  v81[1] = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_0_11(v49, v81[0]);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (char *)v81 - v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C46028);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_2_6(v56, v81[0]);
  v57 = OUTLINED_FUNCTION_12_1(v27, 1, a25);
  if (v71)
  {
    OUTLINED_FUNCTION_0_3();
    v83 = 0;
  }
  else
  {
    v28 = a26;
    OUTLINED_FUNCTION_49_1(v57, (unint64_t *)&qword_255C45D18);
    v58 = OUTLINED_FUNCTION_63_0();
    OUTLINED_FUNCTION_30_2(v58);
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_24_2(v59, v60, &qword_255C46028);
  v61 = OUTLINED_FUNCTION_12_1(v29, 1, v47);
  if (v71)
  {
    OUTLINED_FUNCTION_56_0(v61, &qword_255C46028);
    v82 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_80((uint64_t)v53, *MEMORY[0x24BDDF398], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 104));
    OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_17_3();
    v62 = OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_36_2((uint64_t)v62);
    OUTLINED_FUNCTION_29_2(v29, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  }
  OUTLINED_FUNCTION_28_2();
  if (v71)
    v63 = 0;
  else
    v63 = (void *)OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_66_0();
  if (v71)
  {
    v66 = 0;
  }
  else
  {
    v64 = OUTLINED_FUNCTION_54_0();
    v66 = (void *)v64;
  }
  OUTLINED_FUNCTION_27_2(v64, v65, &qword_253F428C8);
  v67 = OUTLINED_FUNCTION_48_0();
  v68 = OUTLINED_FUNCTION_12_1(v28, 1, v67);
  if (v71)
  {
    v69 = &qword_253F428C8;
LABEL_19:
    OUTLINED_FUNCTION_52_1(v68, v69);
    v72 = 0;
    v74 = 0;
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_29_2(v28, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 8));
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_43_1();
  v70 = OUTLINED_FUNCTION_47_1();
  v68 = OUTLINED_FUNCTION_9_5(v70);
  if (v71)
  {
    v69 = &qword_253F427B8;
    goto LABEL_19;
  }
  v72 = OUTLINED_FUNCTION_50_1();
  v74 = v73;
  OUTLINED_FUNCTION_12_2();
LABEL_20:
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_5_6(v82, v83, v84, a25, v75, v76, v77, v78, v30, v63, v66, v72, v74);
  OUTLINED_FUNCTION_57_0();
  v80 = OUTLINED_FUNCTION_25_2(v79, &qword_255C46030);
  OUTLINED_FUNCTION_8_5(v80);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CD91920@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22CD91C4C(a1, a2);
}

void static MusicLibraryPlaylistRequest.creatingPlaylist<A>(name:description:userImage:coverArtworkRecipe:isPublic:isVisible:curator:tracks:parent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80[7];
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  OUTLINED_FUNCTION_23();
  LODWORD(v81) = v31;
  v85 = v33;
  v86 = v32;
  v88 = v34;
  v89 = v35;
  v87 = v36;
  v83 = v37;
  v84 = v38;
  v90 = v39;
  v40 = OUTLINED_FUNCTION_10_2(a24);
  v80[4] = *(_QWORD *)(v40 - 8);
  v80[5] = v40;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_7_4(v42, v80[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428C8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_6_6(v44, v80[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F427B8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v45);
  v47 = OUTLINED_FUNCTION_20_2(v46, v80[0]);
  v80[1] = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_0_11(v49, v80[0]);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_33_2();
  MEMORY[0x24BDAC7A8](v51);
  v53 = (char *)v80 - v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_13_3();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_2_6(v56, v80[0]);
  v57 = OUTLINED_FUNCTION_12_1(v27, 1, a25);
  if (v70)
  {
    OUTLINED_FUNCTION_0_3();
    v82 = 0;
  }
  else
  {
    v28 = a26;
    OUTLINED_FUNCTION_49_1(v57, (unint64_t *)&qword_255C45D18);
    v82 = OUTLINED_FUNCTION_63_0();
    OUTLINED_FUNCTION_29_2(v27, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a25 - 8) + 8));
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_24_2(v58, v59, &qword_253F428E0);
  v60 = OUTLINED_FUNCTION_12_1(v29, 1, v47);
  if (v70)
  {
    OUTLINED_FUNCTION_56_0(v60, &qword_253F428E0);
    v81 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_80((uint64_t)v53, *MEMORY[0x24BDDF398], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 104));
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_16_1();
    v61 = OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_35_2((uint64_t)v61);
    OUTLINED_FUNCTION_31_2(v29, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  }
  OUTLINED_FUNCTION_28_2();
  if (v70)
    v62 = 0;
  else
    v62 = (void *)OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_66_0();
  if (v70)
  {
    v65 = 0;
  }
  else
  {
    v63 = OUTLINED_FUNCTION_54_0();
    v65 = (void *)v63;
  }
  OUTLINED_FUNCTION_27_2(v63, v64, &qword_253F428C8);
  v66 = OUTLINED_FUNCTION_48_0();
  v67 = OUTLINED_FUNCTION_12_1(v28, 1, v66);
  if (v70)
  {
    v68 = &qword_253F428C8;
LABEL_19:
    OUTLINED_FUNCTION_52_1(v67, v68);
    v71 = 0;
    v73 = 0;
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_31_2(v28, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 8));
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_44_1();
  v69 = OUTLINED_FUNCTION_47_1();
  v67 = OUTLINED_FUNCTION_9_5(v69);
  if (v70)
  {
    v68 = &qword_253F427B8;
    goto LABEL_19;
  }
  v71 = OUTLINED_FUNCTION_50_1();
  v73 = v72;
  OUTLINED_FUNCTION_12_2();
LABEL_20:
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_5_6(v81, v82, v83, a25, v74, v75, v76, v77, v30, v62, v65, v71, v73);
  OUTLINED_FUNCTION_57_0();
  v79 = OUTLINED_FUNCTION_25_2(v78, &qword_255C46030);
  OUTLINED_FUNCTION_8_5(v79);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_22CD91C4C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t result;
  uint64_t v16;

  v5 = sub_22CD93B20();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_32_1();
  v7 = sub_22CD93AB4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))((char *)&v16 - v12, *MEMORY[0x24BDDF398], v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v5);
  v14 = sub_22CD92220();
  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  *a2 = v14;
  return result;
}

id sub_22CD91D90(_QWORD *a1)
{
  void *v1;
  id v3;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v3 = objc_msgSend(v1, sel_initWithUnderlyingModelObject_, sub_22CD93E44());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

id sub_22CD91DF8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v14 = v13;
  if (a2)
  {
    sub_22CD85864(0, (unint64_t *)&qword_255C45D18);
    v18 = (void *)sub_22CD93CC4();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      v19 = (void *)sub_22CD93BEC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v18 = 0;
    if (a4)
      goto LABEL_3;
  }
  v19 = 0;
LABEL_6:
  if (a6)
  {
    v20 = (void *)sub_22CD93BEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = 0;
  }
  if (a9)
  {
    v21 = (void *)sub_22CD93BEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  if (a13)
  {
    v22 = (void *)sub_22CD93BEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = objc_msgSend(v14, sel_initWithParentPlaylist_playlistEntries_playlistName_playlistDescription_playlistUserImage_coverArtworkRecipe_publicPlaylist_visiblePlaylist_authorStoreIdentifier_, a1, v18, v19, v20, a7, v21, a10, a11, v22);

  return v23;
}

id sub_22CD91F94()
{
  return sub_22CD92220();
}

id sub_22CD91FB0()
{
  return sub_22CD92220();
}

id sub_22CD91FCC(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_22CD93838();
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93AA8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22CD93B8C();
  v25 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(v13, a1, v11);
  sub_22CD92438(&qword_255C46038, MEMORY[0x24BE6AF60]);
  sub_22CD93AD8();
  sub_22CD93AC0();
  v15 = (void *)sub_22CD885BC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22CD92438(&qword_255C46040, MEMORY[0x24BE6AF58]);
  sub_22CD938E0();
  v16 = sub_22CD8A704(v15);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
  v17 = objc_allocWithZone(MEMORY[0x24BDDFC00]);
  v18 = (void *)sub_22CD93BBC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v16, v15, v18);
  swift_unknownObjectRelease();

  v20 = sub_22CD93AB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a2, v20);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v11);
  return v19;
}

id sub_22CD92220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t (*v5)(_QWORD);
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
  char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_23();
  v29 = v1;
  v30 = v2;
  v26[1] = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v27 = sub_22CD93838();
  v26[0] = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_32_1();
  v11 = sub_22CD93AA8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5(0);
  v28 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v26 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))((char *)v26 - v16, v9, v15);
  sub_22CD93AD8();
  sub_22CD93AC0();
  v19 = (void *)sub_22CD885BC();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_22CD938E0();
  v20 = sub_22CD8A704(v19);
  (*(void (**)(uint64_t, uint64_t))(v26[0] + 8))(v0, v27);
  v21 = objc_allocWithZone(MEMORY[0x24BDDFC00]);
  v22 = (void *)sub_22CD93BBC();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v21, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v20, v19, v22);
  swift_unknownObjectRelease();

  v24 = sub_22CD93AB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v7, v24);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v15);
  return v23;
}

void sub_22CD92438(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_22CD93B8C();
    atomic_store(MEMORY[0x22E308C18](a2, v4), a1);
  }
  OUTLINED_FUNCTION_34();
}

uint64_t OUTLINED_FUNCTION_19_2@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_22CD93B8C();
}

uint64_t OUTLINED_FUNCTION_20_2@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_22CD93BA4();
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return sub_22CD93D54();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return sub_22CD938E0();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v1, v2, v3);
}

void OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void (*a27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, char, uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  LOBYTE(a10) = v27;
  sub_22CD91544(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9.n128_i64[0], a9.n128_i64[1], v28, v29, v30, a16, a17, a18, a19, a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27);
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return sub_22CD93CF4();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 240) + 8))(v0, *(_QWORD *)(v1 - 232));
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 240) + 8))(v0, *(_QWORD *)(v1 - 232));
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_22CD937D8();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_22CD937D8();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return sub_22CD93994();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_22CD93B5C();
}

uint64_t OUTLINED_FUNCTION_49_1(uint64_t a1, unint64_t *a2)
{
  return sub_22CD85864(0, a2);
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return sub_22CD93988();
}

id OUTLINED_FUNCTION_51_1()
{
  uint64_t v0;

  return *(id *)(v0 - 152);
}

void OUTLINED_FUNCTION_52_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22CD80930(v2, a2);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_22CD93CF4();
}

id OUTLINED_FUNCTION_55_0()
{
  Class *v0;

  return objc_allocWithZone(*v0);
}

void OUTLINED_FUNCTION_56_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22CD80930(v2, a2);
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_61_0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  return sub_22CD90C64(a1, a2, a3, a4, a5, v8, a7, a8);
}

id OUTLINED_FUNCTION_62_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22CD91FCC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return sub_22CD93CB8();
}

id OUTLINED_FUNCTION_64()
{
  return sub_22CD92220();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t static Song.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_hasVideo) ^ 1;
}

BOOL static Curator.canBeConverted(from:)(void *a1)
{
  return objc_msgSend(a1, sel_curatorSubKind) == (id)1;
}

uint64_t MusicCollaborativePlaylist.PendingCollaboratorDecisionRequest.init(collaborator:playlist:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v39 = a1;
  v40 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255C45990);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93B74();
  v38 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v37 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22CD93BA4();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v37 - v21;
  v23 = a2;
  sub_22CD81F30((uint64_t)v23);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16) == 1)
  {

    v24 = &qword_253F428E0;
    v25 = (uint64_t)v15;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
    v26 = v39;
    sub_22CD8225C((uint64_t)v26);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) != 1)
    {
      v29 = v7;
      v30 = v38;
      v31 = v6;
      v32 = v29;
      (*(void (**)(char *, char *))(v38 + 32))(v12, v31);
      v33 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
      v34 = v32;
      v33(v10, v12, v32);
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
      v28 = v40;
      sub_22CD934CC();

      (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v34);
      OUTLINED_FUNCTION_0_10();
      v27 = 0;
      goto LABEL_7;
    }

    OUTLINED_FUNCTION_0_10();
    v24 = (uint64_t *)&unk_255C45990;
    v25 = (uint64_t)v6;
  }
  sub_22CD82324(v25, v24);
  v27 = 1;
  v28 = v40;
LABEL_7:
  v35 = sub_22CD934D8();
  return __swift_storeEnumTagSinglePayload(v28, v27, 1, v35);
}

uint64_t MusicCollaborativePlaylist.ResetInvitationLinkRequest.init(playlist:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22CD93BA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  v14 = a1;
  sub_22CD81F30((uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {

    sub_22CD824CC((uint64_t)v6);
    v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_22CD9349C();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    v15 = 0;
  }
  v16 = sub_22CD934A8();
  return __swift_storeEnumTagSinglePayload(a2, v15, 1, v16);
}

id static UploadedVideo.canBeConverted(from:)(void *a1)
{
  id result;

  result = objc_msgSend(a1, sel_hasVideo);
  if ((_DWORD)result)
    return objc_msgSend(a1, sel_isArtistUploadedContent);
  return result;
}

uint64_t MusicCollaborativePlaylist.JoinRequest.init(playlist:invitationURL:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v25 = a3;
  v5 = sub_22CD93370();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F428E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22CD93BA4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v24 - v17;
  v19 = a1;
  sub_22CD81F30((uint64_t)v19);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {

    OUTLINED_FUNCTION_0_3();
    sub_22CD824CC((uint64_t)v11);
    v20 = 1;
    v21 = v25;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    v21 = v25;
    sub_22CD933F4();

    OUTLINED_FUNCTION_0_3();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    v20 = 0;
  }
  v22 = sub_22CD9340C();
  return __swift_storeEnumTagSinglePayload(v21, v20, 1, v22);
}

uint64_t MusicCollaborativePlaylist.JoinRequest.perform()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_22CD92CD8;
  return sub_22CD93400();
}

uint64_t sub_22CD92CD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_22CD92D4C()
{
  uint64_t v0;
  uint64_t v2;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 48);
  sub_22CD93D9C();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_22CD93C28();
  *(_QWORD *)(v0 + 32) = v2;
  sub_22CD93DFC();
  sub_22CD93C28();
  return sub_22CD93E14();
}

uint64_t sub_22CD92E7C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  unsigned int *v11;
  uint64_t v13;

  v2 = sub_22CD93964();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - v7;
  v9 = objc_msgSend(a1, sel_value);
  sub_22CD93BF8();

  sub_22CD93904();
  v10 = objc_msgSend(a1, sel_kind);
  v11 = (unsigned int *)MEMORY[0x24BDDEF30];
  switch((unint64_t)v10)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF40];
      goto LABEL_9;
    case 2uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF10];
      goto LABEL_9;
    case 3uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF28];
      goto LABEL_9;
    case 4uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF18];
      goto LABEL_9;
    case 5uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF08];
      goto LABEL_9;
    case 6uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF20];
      goto LABEL_9;
    case 7uLL:
      v11 = (unsigned int *)MEMORY[0x24BDDEF00];
LABEL_9:
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *v11, v2);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      sub_22CD9397C();

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    case 8uLL:
      OUTLINED_FUNCTION_1_8();
      v13 = 49;
      OUTLINED_FUNCTION_3_6();
      break;
    default:
      OUTLINED_FUNCTION_1_8();
      v13 = 51;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_2_7();
      break;
  }
  OUTLINED_FUNCTION_0_12();
  __break(1u);
  JUMPOUT(0x22CD930A4);
}

id sub_22CD930C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  v0 = sub_22CD93964();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22CD93970();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  v5 = 0;
  if (v4 == *MEMORY[0x24BDDEF30])
    goto LABEL_16;
  if (v4 == *MEMORY[0x24BDDEF40])
  {
    v5 = 1;
LABEL_16:
    sub_22CD932BC();
    v6 = sub_22CD93988();
    return sub_22CD932F8(v6, v7, v5);
  }
  if (v4 == *MEMORY[0x24BDDEF10])
  {
    v5 = 2;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF28])
  {
    v5 = 3;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF18])
  {
    v5 = 4;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF08])
  {
    v5 = 5;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF20])
  {
    v5 = 6;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF00])
  {
    v5 = 7;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF38])
  {
    OUTLINED_FUNCTION_1_8();
    v9 = 79;
    OUTLINED_FUNCTION_3_6();
  }
  else
  {
    OUTLINED_FUNCTION_1_8();
    v9 = 82;
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_2_7();
  }
  result = (id)OUTLINED_FUNCTION_0_12();
  __break(1u);
  return result;
}

unint64_t sub_22CD932BC()
{
  unint64_t result;

  result = qword_255C46118;
  if (!qword_255C46118)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C46118);
  }
  return result;
}

id sub_22CD932F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_22CD93BEC();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithValue_kind_, v5, a3);

  return v6;
}

uint64_t sub_22CD93370()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22CD9337C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22CD93388()
{
  return MEMORY[0x24BE695D0]();
}

uint64_t sub_22CD93394()
{
  return MEMORY[0x24BE697E8]();
}

uint64_t sub_22CD933A0()
{
  return MEMORY[0x24BE697F0]();
}

uint64_t sub_22CD933AC()
{
  return MEMORY[0x24BE69808]();
}

uint64_t sub_22CD933B8()
{
  return MEMORY[0x24BE69820]();
}

uint64_t sub_22CD933C4()
{
  return MEMORY[0x24BE698C0]();
}

uint64_t sub_22CD933D0()
{
  return MEMORY[0x24BE698C8]();
}

uint64_t sub_22CD933DC()
{
  return MEMORY[0x24BE698D8]();
}

uint64_t sub_22CD933E8()
{
  return MEMORY[0x24BE698E0]();
}

uint64_t sub_22CD933F4()
{
  return MEMORY[0x24BE699B8]();
}

uint64_t sub_22CD93400()
{
  return MEMORY[0x24BE699C0]();
}

uint64_t sub_22CD9340C()
{
  return MEMORY[0x24BE699D0]();
}

uint64_t sub_22CD93418()
{
  return MEMORY[0x24BE699D8]();
}

uint64_t sub_22CD93424()
{
  return MEMORY[0x24BE699E0]();
}

uint64_t sub_22CD93430()
{
  return MEMORY[0x24BE699E8]();
}

uint64_t sub_22CD9343C()
{
  return MEMORY[0x24BE699F0]();
}

uint64_t sub_22CD93448()
{
  return MEMORY[0x24BE69A00]();
}

uint64_t sub_22CD93454()
{
  return MEMORY[0x24BE69A08]();
}

uint64_t sub_22CD93460()
{
  return MEMORY[0x24BE69A10]();
}

uint64_t sub_22CD9346C()
{
  return MEMORY[0x24BE69A20]();
}

uint64_t sub_22CD93478()
{
  return MEMORY[0x24BE69A28]();
}

uint64_t sub_22CD93484()
{
  return MEMORY[0x24BE69A30]();
}

uint64_t sub_22CD93490()
{
  return MEMORY[0x24BE69A40]();
}

uint64_t sub_22CD9349C()
{
  return MEMORY[0x24BE69A48]();
}

uint64_t sub_22CD934A8()
{
  return MEMORY[0x24BE69A50]();
}

uint64_t sub_22CD934B4()
{
  return MEMORY[0x24BE69A58]();
}

uint64_t sub_22CD934C0()
{
  return MEMORY[0x24BE69A60]();
}

uint64_t sub_22CD934CC()
{
  return MEMORY[0x24BE69A68]();
}

uint64_t sub_22CD934D8()
{
  return MEMORY[0x24BE69A70]();
}

uint64_t sub_22CD934E4()
{
  return MEMORY[0x24BE69AB0]();
}

uint64_t sub_22CD934F0()
{
  return MEMORY[0x24BE69CA8]();
}

uint64_t _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvg_0()
{
  return MEMORY[0x24BE69CB0]();
}

uint64_t _s16MusicKitInternal0A28LibraryPlaylistEditViewModelC01_abC12_MediaPlayerE21rawCoverArtworkRecipeSSSgvs_0()
{
  return MEMORY[0x24BE69CB8]();
}

uint64_t sub_22CD93514()
{
  return MEMORY[0x24BE69CC0]();
}

uint64_t sub_22CD93520()
{
  return MEMORY[0x24BE69CD8]();
}

uint64_t sub_22CD9352C()
{
  return MEMORY[0x24BE69CF0]();
}

uint64_t sub_22CD93538()
{
  return MEMORY[0x24BE69D10]();
}

uint64_t sub_22CD93544()
{
  return MEMORY[0x24BE69DF8]();
}

uint64_t sub_22CD93550()
{
  return MEMORY[0x24BE6A170]();
}

uint64_t sub_22CD9355C()
{
  return MEMORY[0x24BE6A1F8]();
}

uint64_t sub_22CD93568()
{
  return MEMORY[0x24BE6A260]();
}

uint64_t sub_22CD93574()
{
  return MEMORY[0x24BE6A2D0]();
}

uint64_t sub_22CD93580()
{
  return MEMORY[0x24BE6A348]();
}

uint64_t sub_22CD9358C()
{
  return MEMORY[0x24BE6A540]();
}

uint64_t sub_22CD93598()
{
  return MEMORY[0x24BE6A5E8]();
}

uint64_t sub_22CD935A4()
{
  return MEMORY[0x24BE6A698]();
}

uint64_t sub_22CD935B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22CD935BC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22CD935C8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22CD935D4()
{
  return MEMORY[0x24BDDE740]();
}

uint64_t sub_22CD935E0()
{
  return MEMORY[0x24BDDE750]();
}

uint64_t sub_22CD935EC()
{
  return MEMORY[0x24BE6A6B8]();
}

uint64_t sub_22CD935F8()
{
  return MEMORY[0x24BE6A6C0]();
}

uint64_t sub_22CD93604()
{
  return MEMORY[0x24BDDE760]();
}

uint64_t sub_22CD93610()
{
  return MEMORY[0x24BDDE768]();
}

uint64_t sub_22CD9361C()
{
  return MEMORY[0x24BDDE770]();
}

uint64_t sub_22CD93628()
{
  return MEMORY[0x24BDDE778]();
}

uint64_t sub_22CD93634()
{
  return MEMORY[0x24BDDE820]();
}

uint64_t sub_22CD93640()
{
  return MEMORY[0x24BDDE858]();
}

uint64_t sub_22CD9364C()
{
  return MEMORY[0x24BDDE860]();
}

uint64_t sub_22CD93658()
{
  return MEMORY[0x24BDDE868]();
}

uint64_t sub_22CD93664()
{
  return MEMORY[0x24BDDE870]();
}

uint64_t sub_22CD93670()
{
  return MEMORY[0x24BDDE878]();
}

uint64_t sub_22CD9367C()
{
  return MEMORY[0x24BDDE890]();
}

uint64_t sub_22CD93688()
{
  return MEMORY[0x24BDDE898]();
}

uint64_t sub_22CD93694()
{
  return MEMORY[0x24BDDE8A8]();
}

uint64_t sub_22CD936A0()
{
  return MEMORY[0x24BDDE8B0]();
}

uint64_t sub_22CD936AC()
{
  return MEMORY[0x24BDDE8B8]();
}

uint64_t sub_22CD936B8()
{
  return MEMORY[0x24BDDE8C0]();
}

uint64_t sub_22CD936C4()
{
  return MEMORY[0x24BDDE8C8]();
}

uint64_t sub_22CD936D0()
{
  return MEMORY[0x24BDDE8D0]();
}

uint64_t sub_22CD936DC()
{
  return MEMORY[0x24BDDE8D8]();
}

uint64_t sub_22CD936E8()
{
  return MEMORY[0x24BDDE8E0]();
}

uint64_t sub_22CD936F4()
{
  return MEMORY[0x24BDDE8E8]();
}

uint64_t sub_22CD93700()
{
  return MEMORY[0x24BDDE8F0]();
}

uint64_t sub_22CD9370C()
{
  return MEMORY[0x24BDDE8F8]();
}

uint64_t sub_22CD93718()
{
  return MEMORY[0x24BDDE900]();
}

uint64_t sub_22CD93724()
{
  return MEMORY[0x24BDDE908]();
}

uint64_t sub_22CD93730()
{
  return MEMORY[0x24BDDE910]();
}

uint64_t sub_22CD9373C()
{
  return MEMORY[0x24BDDE918]();
}

uint64_t sub_22CD93748()
{
  return MEMORY[0x24BDDE920]();
}

uint64_t sub_22CD93754()
{
  return MEMORY[0x24BDDE928]();
}

uint64_t sub_22CD93760()
{
  return MEMORY[0x24BDDE930]();
}

uint64_t sub_22CD9376C()
{
  return MEMORY[0x24BDDE938]();
}

uint64_t sub_22CD93778()
{
  return MEMORY[0x24BDDE940]();
}

uint64_t sub_22CD93784()
{
  return MEMORY[0x24BDDE948]();
}

uint64_t sub_22CD93790()
{
  return MEMORY[0x24BDDE950]();
}

uint64_t sub_22CD9379C()
{
  return MEMORY[0x24BDDE958]();
}

uint64_t sub_22CD937A8()
{
  return MEMORY[0x24BDDE960]();
}

uint64_t sub_22CD937B4()
{
  return MEMORY[0x24BDDE968]();
}

uint64_t sub_22CD937C0()
{
  return MEMORY[0x24BDDE970]();
}

uint64_t sub_22CD937CC()
{
  return MEMORY[0x24BDDE978]();
}

uint64_t sub_22CD937D8()
{
  return MEMORY[0x24BDDE980]();
}

uint64_t sub_22CD937E4()
{
  return MEMORY[0x24BDDE988]();
}

uint64_t sub_22CD937F0()
{
  return MEMORY[0x24BDDE990]();
}

uint64_t sub_22CD937FC()
{
  return MEMORY[0x24BDDE998]();
}

uint64_t sub_22CD93808()
{
  return MEMORY[0x24BDDE9A0]();
}

uint64_t sub_22CD93814()
{
  return MEMORY[0x24BDDE9A8]();
}

uint64_t sub_22CD93820()
{
  return MEMORY[0x24BDDE9B0]();
}

uint64_t sub_22CD9382C()
{
  return MEMORY[0x24BDDE9B8]();
}

uint64_t sub_22CD93838()
{
  return MEMORY[0x24BDDE9C0]();
}

uint64_t sub_22CD93844()
{
  return MEMORY[0x24BDDE9E0]();
}

uint64_t sub_22CD93850()
{
  return MEMORY[0x24BDDE9F0]();
}

uint64_t sub_22CD9385C()
{
  return MEMORY[0x24BDDE9F8]();
}

uint64_t sub_22CD93868()
{
  return MEMORY[0x24BDDEA00]();
}

uint64_t sub_22CD93874()
{
  return MEMORY[0x24BDDEA10]();
}

uint64_t sub_22CD93880()
{
  return MEMORY[0x24BDDEA18]();
}

uint64_t sub_22CD9388C()
{
  return MEMORY[0x24BDDEA28]();
}

uint64_t sub_22CD93898()
{
  return MEMORY[0x24BDDEA30]();
}

uint64_t sub_22CD938A4()
{
  return MEMORY[0x24BDDEA70]();
}

uint64_t sub_22CD938B0()
{
  return MEMORY[0x24BDDEB28]();
}

uint64_t sub_22CD938BC()
{
  return MEMORY[0x24BDDECC8]();
}

uint64_t sub_22CD938C8()
{
  return MEMORY[0x24BDDECF0]();
}

uint64_t sub_22CD938D4()
{
  return MEMORY[0x24BDDECF8]();
}

uint64_t sub_22CD938E0()
{
  return MEMORY[0x24BDDEDC8]();
}

uint64_t sub_22CD938EC()
{
  return MEMORY[0x24BDDEE48]();
}

uint64_t sub_22CD938F8()
{
  return MEMORY[0x24BDDEE78]();
}

uint64_t sub_22CD93904()
{
  return MEMORY[0x24BDDEEA8]();
}

uint64_t sub_22CD93910()
{
  return MEMORY[0x24BDDEEB0]();
}

uint64_t sub_22CD9391C()
{
  return MEMORY[0x24BDDEEB8]();
}

uint64_t sub_22CD93928()
{
  return MEMORY[0x24BDDEEC0]();
}

uint64_t sub_22CD93934()
{
  return MEMORY[0x24BDDEEC8]();
}

uint64_t sub_22CD93940()
{
  return MEMORY[0x24BDDEED8]();
}

uint64_t sub_22CD9394C()
{
  return MEMORY[0x24BDDEEF0]();
}

uint64_t sub_22CD93958()
{
  return MEMORY[0x24BDDEEF8]();
}

uint64_t sub_22CD93964()
{
  return MEMORY[0x24BDDEF48]();
}

uint64_t sub_22CD93970()
{
  return MEMORY[0x24BDDEF50]();
}

uint64_t sub_22CD9397C()
{
  return MEMORY[0x24BDDEF58]();
}

uint64_t sub_22CD93988()
{
  return MEMORY[0x24BDDEF60]();
}

uint64_t sub_22CD93994()
{
  return MEMORY[0x24BDDEF68]();
}

uint64_t sub_22CD939A0()
{
  return MEMORY[0x24BDDEFB0]();
}

uint64_t sub_22CD939AC()
{
  return MEMORY[0x24BDDF010]();
}

uint64_t sub_22CD939B8()
{
  return MEMORY[0x24BDDF018]();
}

uint64_t sub_22CD939C4()
{
  return MEMORY[0x24BDDF020]();
}

uint64_t sub_22CD939D0()
{
  return MEMORY[0x24BDDF028]();
}

uint64_t sub_22CD939DC()
{
  return MEMORY[0x24BDDF030]();
}

uint64_t sub_22CD939E8()
{
  return MEMORY[0x24BDDF038]();
}

uint64_t sub_22CD939F4()
{
  return MEMORY[0x24BDDF040]();
}

uint64_t sub_22CD93A00()
{
  return MEMORY[0x24BDDF048]();
}

uint64_t sub_22CD93A0C()
{
  return MEMORY[0x24BDDF050]();
}

uint64_t sub_22CD93A18()
{
  return MEMORY[0x24BDDF058]();
}

uint64_t sub_22CD93A24()
{
  return MEMORY[0x24BDDF060]();
}

uint64_t sub_22CD93A30()
{
  return MEMORY[0x24BDDF068]();
}

uint64_t sub_22CD93A3C()
{
  return MEMORY[0x24BDDF070]();
}

uint64_t sub_22CD93A48()
{
  return MEMORY[0x24BDDF078]();
}

uint64_t sub_22CD93A54()
{
  return MEMORY[0x24BDDF080]();
}

uint64_t sub_22CD93A60()
{
  return MEMORY[0x24BDDF088]();
}

uint64_t sub_22CD93A6C()
{
  return MEMORY[0x24BDDF090]();
}

uint64_t sub_22CD93A78()
{
  return MEMORY[0x24BDDF098]();
}

uint64_t sub_22CD93A84()
{
  return MEMORY[0x24BDDF0A0]();
}

uint64_t sub_22CD93A90()
{
  return MEMORY[0x24BDDF0A8]();
}

uint64_t sub_22CD93A9C()
{
  return MEMORY[0x24BDDF0B0]();
}

uint64_t sub_22CD93AA8()
{
  return MEMORY[0x24BDDF350]();
}

uint64_t sub_22CD93AB4()
{
  return MEMORY[0x24BDDF3D8]();
}

uint64_t sub_22CD93AC0()
{
  return MEMORY[0x24BDDF3E8]();
}

uint64_t sub_22CD93ACC()
{
  return MEMORY[0x24BDDF3F0]();
}

uint64_t sub_22CD93AD8()
{
  return MEMORY[0x24BDDF3F8]();
}

uint64_t sub_22CD93AE4()
{
  return MEMORY[0x24BDDF500]();
}

uint64_t sub_22CD93AF0()
{
  return MEMORY[0x24BDDF618]();
}

uint64_t sub_22CD93AFC()
{
  return MEMORY[0x24BDDF650]();
}

uint64_t sub_22CD93B08()
{
  return MEMORY[0x24BDDF658]();
}

uint64_t sub_22CD93B14()
{
  return MEMORY[0x24BDDF680]();
}

uint64_t sub_22CD93B20()
{
  return MEMORY[0x24BDDF718]();
}

uint64_t sub_22CD93B2C()
{
  return MEMORY[0x24BDDF7E0]();
}

uint64_t sub_22CD93B38()
{
  return MEMORY[0x24BDDF840]();
}

uint64_t sub_22CD93B44()
{
  return MEMORY[0x24BDDF848]();
}

uint64_t sub_22CD93B50()
{
  return MEMORY[0x24BDDF8C8]();
}

uint64_t sub_22CD93B5C()
{
  return MEMORY[0x24BDDF938]();
}

uint64_t sub_22CD93B68()
{
  return MEMORY[0x24BDDF9A8]();
}

uint64_t sub_22CD93B74()
{
  return MEMORY[0x24BE6AE98]();
}

uint64_t sub_22CD93B80()
{
  return MEMORY[0x24BE6AEB0]();
}

uint64_t sub_22CD93B8C()
{
  return MEMORY[0x24BE6AF70]();
}

uint64_t sub_22CD93B98()
{
  return MEMORY[0x24BDDFAD0]();
}

uint64_t sub_22CD93BA4()
{
  return MEMORY[0x24BDDFB58]();
}

uint64_t sub_22CD93BB0()
{
  return MEMORY[0x24BDDFBC0]();
}

uint64_t sub_22CD93BBC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22CD93BC8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22CD93BD4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22CD93BE0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22CD93BEC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22CD93BF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22CD93C04()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22CD93C10()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_22CD93C1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22CD93C28()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22CD93C34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22CD93C40()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_22CD93C4C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22CD93C58()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_22CD93C64()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_22CD93C70()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22CD93C7C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22CD93C88()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22CD93C94()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_22CD93CA0()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_22CD93CAC()
{
  return MEMORY[0x24BEE0E08]();
}

uint64_t sub_22CD93CB8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_22CD93CC4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22CD93CD0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22CD93CDC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22CD93CE8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_22CD93CF4()
{
  return MEMORY[0x24BE6B058]();
}

uint64_t sub_22CD93D00()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22CD93D0C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_22CD93D18()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_22CD93D24()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_22CD93D30()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22CD93D3C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22CD93D48()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22CD93D54()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22CD93D60()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22CD93D6C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22CD93D78()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22CD93D84()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22CD93D90()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22CD93D9C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22CD93DA8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22CD93DB4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22CD93DC0()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_22CD93DCC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_22CD93DD8()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_22CD93DE4()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_22CD93DF0()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_22CD93DFC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22CD93E08()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22CD93E14()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22CD93E20()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22CD93E2C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22CD93E38()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22CD93E44()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22CD93E50()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22CD93E5C()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_22CD93E68()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22CD93E74()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22CD93E80()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22CD93E8C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22CD93E98()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22CD93EA4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22CD93EB0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22CD93EBC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22CD93EC8()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

