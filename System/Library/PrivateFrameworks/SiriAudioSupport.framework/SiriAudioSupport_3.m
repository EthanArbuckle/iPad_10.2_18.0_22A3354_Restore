uint64_t sub_2297C0258(char *a1, unint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t inited;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  char v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;

  v64 = a3;
  v65 = a4;
  v66 = a1;
  v67 = a2;
  v4 = sub_2297DCC50();
  v60 = *(_QWORD *)(v4 - 8);
  v61 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v59 = (uint64_t *)((char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = sub_2297DCCEC();
  v58 = *(_QWORD *)(v56 - 8);
  v6 = MEMORY[0x24BDAC7A8](v56);
  v55 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)&v53 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606F0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v53 - v12;
  v14 = sub_2297DCB54();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v53 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v53 - v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A606F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2297DF330;
  v70 = sub_2297DC848();
  v71 = v25;
  swift_bridgeObjectRetain();
  sub_2297DCF08();
  swift_bridgeObjectRelease();
  v26 = v71;
  *(_QWORD *)(inited + 32) = v70;
  *(_QWORD *)(inited + 40) = v26;
  *(_QWORD *)(inited + 48) = 0x6E6970736C696174;
  *(_QWORD *)(inited + 56) = 0xE800000000000000;
  v27 = sub_2296FA6B8(inited);
  v28 = sub_2297BF87C(v27);
  swift_bridgeObjectRelease();
  if (qword_255A58C08 != -1)
    swift_once();
  v29 = __swift_project_value_buffer(v14, (uint64_t)qword_255A67F80);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v62 = v29;
  v63 = v30;
  ((void (*)(char *))v30)(v23);
  swift_bridgeObjectRetain();
  v31 = sub_2297DCB3C();
  v32 = sub_2297DD178();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v33 = 134217984;
    v70 = *(_QWORD *)(v28 + 16);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v31, v32, "MediaPlaybackProvider#fileRadarWithTailSpins count: %ld", v33, 0xCu);
    MEMORY[0x22E2D0294](v33, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v34 = *(void (**)(char *, uint64_t))(v15 + 8);
  v34(v23, v14);
  v35 = sub_2297DC968();
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56);
  v36(v13, 1, 1, v35);
  if (qword_255A58C68 != -1)
    swift_once();
  if (byte_255A5E000 == 1)
  {
    v70 = (uint64_t)v66;
    v71 = v67;
    v68 = 0x293434202C303628;
    v69 = 0xE800000000000000;
    sub_229616D40();
    if ((sub_2297DD394() & 1) != 0)
    {
      v37 = (uint64_t)v54;
      MEMORY[0x22E2CEB78](0xD000000000000012, 0x80000002297F2B10, 7105601, 0xE300000000000000, 893830);
      sub_229653E64((uint64_t)v13, &qword_255A606F0);
      v36((char *)v37, 0, 1, v35);
      sub_229629954(v37, (uint64_t)v13, &qword_255A606F0);
    }
  }
  if (byte_255A60338 == 1)
  {
    v63(v21, v62, v14);
    v38 = sub_2297DCB3C();
    v39 = sub_2297DD178();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v40 = 134217984;
      v70 = 20;
      sub_2297DD340();
      _os_log_impl(&dword_22960C000, v38, v39, "MediaPlaybackProvider#fileRadarWithTailSpins waiting up to %ld seconds for tailspin file creation to complete", v40, 0xCu);
      MEMORY[0x22E2D0294](v40, -1, -1);
    }
    v54 = (char *)v28;

    v34(v21, v14);
    if (qword_255A58D88 != -1)
      swift_once();
    v41 = v55;
    sub_2297DCCD4();
    v43 = v59;
    v42 = v60;
    *v59 = 20;
    v44 = v61;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v42 + 104))(v43, *MEMORY[0x24BEE5420], v61);
    v45 = v57;
    MEMORY[0x22E2CEF38](v41, v43);
    (*(void (**)(_QWORD *, uint64_t))(v42 + 8))(v43, v44);
    v46 = *(void (**)(char *, uint64_t))(v58 + 8);
    v47 = v56;
    v46(v41, v56);
    sub_2297DD28C();
    v46(v45, v47);
    v48 = sub_2297DCC5C();
    v63(v18, v62, v14);
    v49 = sub_2297DCB3C();
    v50 = sub_2297DD178();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v51 = 67109120;
      LODWORD(v70) = v48 & 1;
      sub_2297DD340();
      _os_log_impl(&dword_22960C000, v49, v50, "MediaPlaybackProvider#fileRadarWithTailSpins notification received: %{BOOL}d", v51, 8u);
      MEMORY[0x22E2D0294](v51, -1, -1);
    }

    v34(v18, v14);
    v28 = (uint64_t)v54;
  }
  type metadata accessor for ErrorFilingProvider();
  sub_2297D92BC(v66, v67, 0, 0, v64, v65, 0, v28, (uint64_t)v13, 0, 0, 0, 0);
  swift_bridgeObjectRelease();
  return sub_229653E64((uint64_t)v13, &qword_255A606F0);
}

uint64_t sub_2297C09C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, void *a7, uint64_t a8, char *a9, unsigned __int8 a10)
{
  uint64_t v10;
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
  char *v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  void *v34;
  int IsInformational;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  NSObject *v41;
  uint8_t *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t);
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint8_t *v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  uint64_t v68;
  uint64_t result;
  uint64_t v70;
  unint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  id v86;
  char *v87;
  id v88;
  unint64_t v89;
  char v90;
  void *v91;
  id v92;
  unint64_t v93;
  char v94;
  void *v95;
  id v96;
  unint64_t v97;
  char v98;
  uint64_t v99;
  char v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  os_log_type_t v123;
  uint64_t v124;
  uint8_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t, uint64_t);
  void (*v148)(char *, uint64_t);
  id v149;
  unint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  char *v164;
  char *v165;
  char *v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  char *v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;

  v167 = a8;
  v157 = a6;
  *(_QWORD *)&v163 = a2;
  v152 = a1;
  v15 = sub_2297DCB30();
  v169 = *(_QWORD *)(v15 - 8);
  v170 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v168 = (char *)&v145 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5AAA8);
  MEMORY[0x24BDAC7A8](v17);
  v154 = (char *)&v145 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = sub_2297DBE40();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v164 = (char *)&v145 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = sub_2297DCAB8();
  v161 = *(_QWORD *)(v162 - 8);
  v20 = MEMORY[0x24BDAC7A8](v162);
  v165 = (char *)&v145 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v172 = (char *)&v145 - v22;
  v23 = sub_2297DCB54();
  v160 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v158 = (char *)&v145 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v166 = (char *)&v145 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v145 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v145 - v31;
  if (!a4)
  {
LABEL_8:
    v159 = v23;
    sub_2297DCADC();
    v44 = (void *)sub_2297DCAC4();
    v45 = sub_2297DCAA0();
    v47 = v46;
    swift_bridgeObjectRelease();
    v48 = HIBYTE(v47) & 0xF;
    if ((v47 & 0x2000000000000000) == 0)
      v48 = v45 & 0xFFFFFFFFFFFFLL;
    v171 = a5;
    if (v48)
    {
      v149 = a7;
      v49 = sub_2297DCAD0();
      v177 = v49;
      v178 = v50;
      v51 = HIBYTE(v50) & 0xF;
      if ((v50 & 0x2000000000000000) == 0)
        v51 = v49 & 0xFFFFFFFFFFFFLL;
      if (v51)
      {
        sub_2297DCF08();
        v49 = v177;
        v52 = v178;
      }
      else
      {
        v52 = v50;
      }
      *(_QWORD *)&v173 = v49;
      *((_QWORD *)&v173 + 1) = v52;
      swift_bridgeObjectRetain();
      sub_2297DCF08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2297DCF08();
      swift_bridgeObjectRelease();
      v55 = v173;
      sub_2297DCAA0();
      sub_2297DCAE8();
      swift_bridgeObjectRelease();
      v173 = v55;
      swift_bridgeObjectRetain();
      sub_2297DCF08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v44 = (void *)*((_QWORD *)&v173 + 1);
      v56 = HIBYTE(*((_QWORD *)&v173 + 1)) & 0xFLL;
      v153 = v173;
      if ((*((_QWORD *)&v173 + 1) & 0x2000000000000000) == 0)
        v56 = v173 & 0xFFFFFFFFFFFFLL;
      if (v56)
      {
        v150 = a3;
        if (qword_255A58C08 != -1)
          swift_once();
        v57 = v159;
        v58 = __swift_project_value_buffer(v159, (uint64_t)qword_255A67F80);
        v59 = v160;
        v60 = *(void (**)(char *, uint64_t, uint64_t))(v160 + 16);
        v60(v30, v58, v57);
        swift_bridgeObjectRetain_n();
        v61 = sub_2297DCB3C();
        v62 = sub_2297DD178();
        v63 = os_log_type_enabled(v61, v62);
        v151 = v44;
        v147 = v60;
        v146 = v58;
        if (v63)
        {
          v64 = (uint8_t *)swift_slowAlloc();
          v65 = swift_slowAlloc();
          *(_QWORD *)&v173 = v65;
          *(_DWORD *)v64 = 136315138;
          swift_bridgeObjectRetain();
          v175 = sub_22960FB78(v153, (unint64_t)v151, (uint64_t *)&v173);
          v44 = v151;
          sub_2297DD340();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22960C000, v61, v62, "MediaPlaybackProvider#logSignpost mediaPlaybackProviderErrorStatus: %s", v64, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E2D0294](v65, -1, -1);
          MEMORY[0x22E2D0294](v64, -1, -1);

          v66 = *(void (**)(char *, uint64_t))(v59 + 8);
          v67 = v30;
          v68 = v159;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v66 = *(void (**)(char *, uint64_t))(v59 + 8);
          v67 = v30;
          v68 = v57;
        }
        v148 = v66;
        v66(v67, v68);
        sub_2297DCAA0();
        v70 = v163;
        v71 = v150;
        v72 = sub_2297BF784(v163, v150, a4);
        swift_bridgeObjectRelease();
        v73 = sub_2297DCAA0();
        sub_2297B14E4(a4, v171, v73, v74, (char *)&v173);
        swift_bridgeObjectRelease();
        v75 = v173;
        if (v70 == 0xD000000000000026 && v71 == 0x80000002297F28C0 || (v76 = 0, (sub_2297DD658() & 1) != 0))
        {
          LOBYTE(v173) = v75;
          v76 = _s16SiriAudioSupport17MediaPlaybackLiteC22isPFSQTerminatingError12playbackCodeSbAA0eK0O_tFZ_0();
        }
        if (((_QWORD)v163 != 0xD00000000000001DLL || v71 != 0x80000002297F2940)
          && (sub_2297DD658() & 1) == 0
          && ((_QWORD)v163 != 0xD000000000000018 || v71 != 0x80000002297F2960)
          && ((v76 | v72 | sub_2297DD658()) & 1) == 0)
        {
          goto LABEL_75;
        }
        sub_2297DBCE4();
        __swift_project_boxed_opaque_existential_1(&v173, *((uint64_t *)&v174 + 1));
        sub_2297DBD8C();
        (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v164, *MEMORY[0x24BE97878], v156);
        v77 = *MEMORY[0x24BE97068];
        v78 = sub_2297DBD08();
        v79 = *(_QWORD *)(v78 - 8);
        v80 = v154;
        (*(void (**)(char *, uint64_t, uint64_t))(v79 + 104))(v154, v77, v78);
        v81 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v79 + 56);
        v44 = v151;
        v81(v80, 0, 1, v78);
        v82 = swift_allocObject();
        *(_QWORD *)(v82 + 16) = v153;
        *(_QWORD *)(v82 + 24) = v44;
        swift_bridgeObjectRetain();
        sub_2297DBD50();
        sub_2297DBCF0();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v173);
        if ((v72 & 1) == 0)
          goto LABEL_75;
        if (v149)
        {
          v83 = objc_msgSend(v149, sel_playerPath);
          v84 = v152;
          if (v83)
          {
            v85 = v83;
            v86 = objc_msgSend(v83, sel_description);

            sub_2297DCE60();
          }
        }
        else
        {
          v84 = v152;
        }
        strcpy((char *)&v173, "playerPath = ");
        HIWORD(v173) = -4864;
        sub_2297DCF08();
        result = swift_bridgeObjectRelease();
        if (!*MEMORY[0x24BE658D8])
        {
          __break(1u);
          goto LABEL_115;
        }
        v87 = (char *)v173;
        if (*(_QWORD *)(v84 + 16))
        {
          v88 = (id)*MEMORY[0x24BE658D8];
          v89 = sub_22961AB90((uint64_t)v88);
          if ((v90 & 1) != 0)
          {
            sub_229610400(*(_QWORD *)(v84 + 56) + 32 * v89, (uint64_t)&v173);
          }
          else
          {
            v173 = 0u;
            v174 = 0u;
          }

          if (*((_QWORD *)&v174 + 1))
          {
            swift_dynamicCast();
            goto LABEL_55;
          }
        }
        else
        {
          v173 = 0u;
          v174 = 0u;
        }
        sub_229653E64((uint64_t)&v173, (uint64_t *)&unk_255A60DD0);
LABEL_55:
        strcpy((char *)&v173, "contextID = ");
        BYTE13(v173) = 0;
        HIWORD(v173) = -5120;
        sub_2297DCF08();
        result = swift_bridgeObjectRelease();
        v91 = (void *)*MEMORY[0x24BE659B8];
        if (*MEMORY[0x24BE659B8])
        {
          v156 = v173;
          if (*(_QWORD *)(v84 + 16))
          {
            v92 = v91;
            v93 = sub_22961AB90((uint64_t)v92);
            if ((v94 & 1) != 0)
            {
              sub_229610400(*(_QWORD *)(v84 + 56) + 32 * v93, (uint64_t)&v173);
            }
            else
            {
              v173 = 0u;
              v174 = 0u;
            }

            if (*((_QWORD *)&v174 + 1))
            {
              swift_dynamicCast();
              goto LABEL_64;
            }
          }
          else
          {
            v173 = 0u;
            v174 = 0u;
          }
          sub_229653E64((uint64_t)&v173, (uint64_t *)&unk_255A60DD0);
LABEL_64:
          v164 = v87;
          *(_QWORD *)&v173 = 0xD000000000000016;
          *((_QWORD *)&v173 + 1) = 0x80000002297F2A90;
          sub_2297DCF08();
          result = swift_bridgeObjectRelease();
          v95 = (void *)*MEMORY[0x24BE658C0];
          if (*MEMORY[0x24BE658C0])
          {
            v155 = v173;
            v96 = v95;
            swift_bridgeObjectRelease();
            if (*(_QWORD *)(v84 + 16) && (v97 = sub_22961AB90((uint64_t)v96), (v98 & 1) != 0))
            {
              sub_229610400(*(_QWORD *)(v84 + 56) + 32 * v97, (uint64_t)&v173);
            }
            else
            {
              v173 = 0u;
              v174 = 0u;
            }

            if (*((_QWORD *)&v174 + 1))
              swift_dynamicCast();
            else
              sub_229653E64((uint64_t)&v173, (uint64_t *)&unk_255A60DD0);
            strcpy((char *)&v173, "commandID = ");
            BYTE13(v173) = 0;
            HIWORD(v173) = -5120;
            sub_2297DCF08();
            swift_bridgeObjectRelease();
            strcpy((char *)&v173, "timeOfError: ");
            HIWORD(v173) = -4864;
            sub_2297DCF08();
            *(_QWORD *)&v173 = sub_2297DCAA0();
            *((_QWORD *)&v173 + 1) = v99;
            v175 = 0x293434202C303628;
            v176 = 0xE800000000000000;
            sub_229616D40();
            v100 = sub_2297DD394();
            swift_bridgeObjectRelease();
            if ((v100 & 1) != 0 && qword_255A58C68 != -1)
              goto LABEL_113;
            while (1)
            {
              *(_QWORD *)&v173 = 0;
              *((_QWORD *)&v173 + 1) = 0xE000000000000000;
              sub_2297DD484();
              swift_bridgeObjectRelease();
              *(_QWORD *)&v173 = 10;
              *((_QWORD *)&v173 + 1) = 0xE100000000000000;
              sub_2297DCF08();
              swift_bridgeObjectRelease();
              sub_2297DCF08();
              sub_2297DCF08();
              swift_bridgeObjectRelease();
              sub_2297DCF08();
              sub_2297DCF08();
              swift_bridgeObjectRelease();
              sub_2297DCF08();
              sub_2297DCF08();
              swift_bridgeObjectRelease();
              sub_2297DCF08();
              sub_2297DCF08();
              swift_bridgeObjectRelease();
              sub_2297DCF08();
              v101 = v173;
              *(_QWORD *)&v173 = 0;
              *((_QWORD *)&v173 + 1) = 0xE000000000000000;
              sub_2297DD484();
              swift_bridgeObjectRelease();
              *(_QWORD *)&v173 = 0xD00000000000001CLL;
              *((_QWORD *)&v173 + 1) = 0x80000002297F2AD0;
              v44 = v151;
              sub_2297DCF08();
              sub_2297C0258((char *)v173, *((unint64_t *)&v173 + 1), v101, *((uint64_t *)&v101 + 1));
              swift_bridgeObjectRelease();
LABEL_75:
              swift_bridgeObjectRelease();
              sub_2297DD280();
              v53 = v162;
              v54 = v161;
              v102 = v146;
              if (qword_255A589D8 != -1)
                swift_once();
              __swift_instantiateConcreteTypeFromMangledName(&qword_255A59758);
              v103 = swift_allocObject();
              *(_OWORD *)(v103 + 16) = xmmword_2297DF330;
              *(_QWORD *)(v103 + 56) = MEMORY[0x24BEE0D00];
              *(_QWORD *)(v103 + 64) = sub_229616CB8();
              *(_QWORD *)(v103 + 32) = v153;
              *(_QWORD *)(v103 + 40) = v44;
              swift_bridgeObjectRetain();
              v104 = v168;
              sub_2297DCB24();
              sub_2297DCB00();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v169 + 8))(v104, v170);
              swift_bridgeObjectRelease();
              v105 = v166;
              v106 = v159;
              v147(v166, v102, v159);
              v107 = v165;
              (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v165, v172, v53);
              a3 = v150;
              swift_bridgeObjectRetain_n();
              v108 = sub_2297DCB3C();
              v109 = sub_2297DD16C();
              v10 = v109;
              if (os_log_type_enabled(v108, v109))
              {
                v110 = swift_slowAlloc();
                v111 = swift_slowAlloc();
                *(_QWORD *)&v173 = v111;
                *(_DWORD *)v110 = 136446466;
                swift_bridgeObjectRetain();
                v175 = sub_22960FB78(v163, a3, (uint64_t *)&v173);
                sub_2297DD340();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v110 + 12) = 2082;
                v44 = (void *)v54;
                v112 = sub_2297DCAA0();
                v175 = sub_22960FB78(v112, v113, (uint64_t *)&v173);
                sub_2297DD340();
                swift_bridgeObjectRelease();
                (*(void (**)(char *, uint64_t))(v54 + 8))(v107, v162);
                _os_log_impl(&dword_22960C000, v108, (os_log_type_t)v10, "Logging SiriKitEvent Event: %{public}s with extended error description: %{public}s", (uint8_t *)v110, 0x16u);
                swift_arrayDestroy();
                v114 = v111;
                v53 = v162;
                MEMORY[0x22E2D0294](v114, -1, -1);
                MEMORY[0x22E2D0294](v110, -1, -1);

                v115 = v166;
                v116 = v159;
              }
              else
              {
                swift_bridgeObjectRelease_n();
                (*(void (**)(char *, uint64_t))(v54 + 8))(v107, v53);

                v115 = v105;
                v116 = v106;
              }
              v148(v115, v116);
              a5 = v171;
              if (!v171)
                return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v172, v53);
LABEL_81:
              if (a5 >> 62)
              {
                swift_bridgeObjectRetain();
                v117 = sub_2297DD574();
                if (!v117)
                {
LABEL_104:
                  swift_bridgeObjectRelease();
                  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v172, v53);
                }
              }
              else
              {
                v117 = *(_QWORD *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (!v117)
                  goto LABEL_104;
              }
              v164 = (char *)(a5 & 0xC000000000000001);
              if ((a5 & 0xC000000000000001) != 0)
              {
                v118 = (id)MEMORY[0x22E2CF6B8](0, a5);
              }
              else
              {
                if (!*(_QWORD *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  __break(1u);
                  goto LABEL_107;
                }
                v118 = *(id *)(a5 + 32);
              }
              v44 = v118;
              LODWORD(v166) = a10;
              v165 = a9;
              swift_bridgeObjectRelease();
              v10 = (uint64_t)v158;
              if (!v157)
                goto LABEL_108;
              if (!(v157 >> 62))
              {
                if (!*(_QWORD *)((v157 & 0xFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_108;
                goto LABEL_89;
              }
LABEL_107:
              swift_bridgeObjectRetain();
              v137 = sub_2297DD574();
              swift_bridgeObjectRelease();
              if (!v137)
              {
LABEL_108:
                v138 = v54;
                v139 = objc_msgSend(v44, sel_integerValue);
                v140 = sub_2297DCAAC();
                sub_2297DD280();
                if (qword_255A589D8 != -1)
                  swift_once();
                __swift_instantiateConcreteTypeFromMangledName(&qword_255A59758);
                v141 = swift_allocObject();
                *(_OWORD *)(v141 + 16) = xmmword_2297DF270;
                v142 = MEMORY[0x24BEE1768];
                v143 = MEMORY[0x24BEE17F0];
                *(_QWORD *)(v141 + 56) = MEMORY[0x24BEE1768];
                *(_QWORD *)(v141 + 64) = v143;
                *(_QWORD *)(v141 + 32) = v139;
                *(_QWORD *)(v141 + 96) = v142;
                *(_QWORD *)(v141 + 104) = v143;
                *(_QWORD *)(v141 + 72) = v140;
                v144 = v168;
                sub_2297DCB24();
                sub_2297DCB00();
                swift_bridgeObjectRelease();
                (*(void (**)(char *, uint64_t))(v169 + 8))(v144, v170);

                v54 = v138;
                return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v172, v53);
              }
LABEL_89:
              v157 = (unint64_t)v44;
              if (qword_255A58C08 != -1)
                swift_once();
              v119 = v159;
              v120 = __swift_project_value_buffer(v159, (uint64_t)qword_255A67F80);
              v121 = v160;
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v160 + 16))(v10, v120, v119);
              swift_bridgeObjectRetain_n();
              v122 = sub_2297DCB3C();
              v123 = sub_2297DD178();
              v124 = v117;
              if (os_log_type_enabled(v122, v123))
              {
                v125 = (uint8_t *)swift_slowAlloc();
                v126 = swift_slowAlloc();
                *(_QWORD *)&v173 = v126;
                *(_DWORD *)v125 = 136446210;
                swift_bridgeObjectRetain();
                v177 = sub_22960FB78(v163, a3, (uint64_t *)&v173);
                sub_2297DD340();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_22960C000, v122, v123, "Logging Signpost Event: %{public}s resultStatuses is empty", v125, 0xCu);
                swift_arrayDestroy();
                v127 = v126;
                a5 = v171;
                MEMORY[0x22E2D0294](v127, -1, -1);
                MEMORY[0x22E2D0294](v125, -1, -1);

                (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v10, v119);
              }
              else
              {

                swift_bridgeObjectRelease_n();
                (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v10, v119);
              }
              if (v117 >= 1)
              {
                swift_bridgeObjectRetain();
                v128 = 0;
                v163 = xmmword_2297DF270;
                v129 = MEMORY[0x24BEE1768];
                v130 = MEMORY[0x24BEE17F0];
                do
                {
                  if (v164)
                    v131 = (id)MEMORY[0x22E2CF6B8](v128, a5);
                  else
                    v131 = *(id *)(a5 + 8 * v128 + 32);
                  v132 = v131;
                  v133 = objc_msgSend(v131, sel_integerValue);
                  v134 = sub_2297DCAAC();
                  sub_2297DD280();
                  if (qword_255A589D8 != -1)
                    swift_once();
                  ++v128;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_255A59758);
                  v135 = swift_allocObject();
                  *(_OWORD *)(v135 + 16) = v163;
                  *(_QWORD *)(v135 + 56) = v129;
                  *(_QWORD *)(v135 + 64) = v130;
                  *(_QWORD *)(v135 + 32) = v133;
                  *(_QWORD *)(v135 + 96) = v129;
                  *(_QWORD *)(v135 + 104) = v130;
                  *(_QWORD *)(v135 + 72) = v134;
                  v136 = v168;
                  sub_2297DCB24();
                  sub_2297DCB00();
                  swift_bridgeObjectRelease();
                  (*(void (**)(char *, uint64_t))(v169 + 8))(v136, v170);

                  a5 = v171;
                }
                while (v124 != v128);

                swift_bridgeObjectRelease();
                v53 = v162;
                v54 = v161;
                return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v172, v53);
              }
              __break(1u);
LABEL_113:
              swift_once();
            }
          }
LABEL_116:
          __break(1u);
          return result;
        }
LABEL_115:
        __break(1u);
        goto LABEL_116;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v53 = v162;
      v54 = v161;
      a5 = v171;
      if (v171)
        goto LABEL_81;
    }
    else
    {
      swift_bridgeObjectRelease();
      v53 = v162;
      v54 = v161;
      if (a5)
        goto LABEL_81;
    }
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v172, v53);
  }
  v10 = a4;
  v33 = sub_2297DB858();
  v34 = (void *)sub_2297DB858();
  IsInformational = MPCAssistantErrorIsInformational();

  if (!IsInformational)
  {

    a4 = v10;
    goto LABEL_8;
  }
  v36 = v33;
  if (qword_255A58C08 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v23, (uint64_t)qword_255A67F80);
  v38 = v160;
  (*(void (**)(char *, uint64_t, uint64_t))(v160 + 16))(v32, v37, v23);
  v39 = sub_2297DCB3C();
  v40 = sub_2297DD178();
  v41 = v36;
  if (os_log_type_enabled(v39, v40))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v42 = 0;
    _os_log_impl(&dword_22960C000, v39, v40, "MediaPlaybackProvider#logSignpost ignoring an informational error", v42, 2u);
    MEMORY[0x22E2D0294](v42, -1, -1);
    v43 = v41;
  }
  else
  {
    v43 = v39;
    v39 = v36;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v32, v23);
}

uint64_t sub_2297C2148(char a1, char a2, uint64_t (*a3)(uint64_t), uint64_t a4, unsigned int a5, uint64_t a6, void (*a7)(_QWORD *, uint64_t, void *), uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
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
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint8_t *v43;
  void (*v44)(char *, uint64_t);
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  Swift::String v48;
  uint8_t *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(_QWORD *, uint64_t, void *);
  unsigned int v55;
  _QWORD v56[3];
  char v57;
  uint64_t v58[3];
  SiriAudioSupport::PlaybackCodeAndDescription v59;

  v53 = a8;
  v54 = a7;
  v52 = a6;
  v55 = a5;
  v11 = sub_2297DCB54();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v49 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v49 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v49 - v22;
  if ((a1 & 1) != 0)
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v11, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v23, v24, v11);
    v25 = sub_2297DCB3C();
    v26 = sub_2297DD178();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_22960C000, v25, v26, "MediaPlaybackProvider#addToUpNext Insertion position supported", v27, 2u);
      MEMORY[0x22E2D0294](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v23, v11);
    v28 = v55;
    return a3(v28);
  }
  if ((a2 & 1) != 0)
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(v11, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v21, v29, v11);
    v30 = sub_2297DCB3C();
    v31 = sub_2297DD178();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_22960C000, v30, v31, "MediaPlaybackProvider#addToUpNext Insertion position of 'next' is supported. Default to that.", v32, 2u);
      MEMORY[0x22E2D0294](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v21, v11);
    v28 = 0;
    return a3(v28);
  }
  if (qword_255A58C08 != -1)
    swift_once();
  v34 = __swift_project_value_buffer(v11, (uint64_t)qword_255A67F80);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v35(v18, v34, v11);
  v36 = sub_2297DCB3C();
  v37 = sub_2297DD16C();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = swift_slowAlloc();
    v50 = v35;
    v39 = (uint8_t *)v38;
    v40 = swift_slowAlloc();
    v58[0] = v40;
    v51 = v34;
    *(_DWORD *)v39 = 136315138;
    v49 = v39 + 4;
    LODWORD(v56[0]) = v55;
    sub_2297C2A40();
    v41 = sub_2297DD3AC();
    v56[0] = sub_22960FB78(v41, v42, v58);
    v34 = v51;
    sub_2297DD340();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v36, v37, "MediaPlaybackProvider#addToUpNext Insertion position not supported for %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v40, -1, -1);
    v43 = v39;
    v35 = v50;
    MEMORY[0x22E2D0294](v43, -1, -1);
  }

  v44 = *(void (**)(char *, uint64_t))(v12 + 8);
  v44(v18, v11);
  v35(v15, v34, v11);
  v45 = sub_2297DCB3C();
  v46 = sub_2297DD160();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_22960C000, v45, v46, "MediaPlaybackProvider#destroyMRQueue destroying queue...", v47, 2u);
    MEMORY[0x22E2D0294](v47, -1, -1);
  }

  v44(v15, v11);
  MRSystemAppPlaybackQueueDestroy();
  LOBYTE(v56[0]) = 6;
  v57 = 19;
  v48._object = (void *)0x80000002297F27B0;
  v48._countAndFlagsBits = 0xD000000000000019;
  v59 = PlaybackCodeAndDescription.init(playbackCode:domainCode:errorDescription:)((SiriAudioSupport::PlaybackCode)v56, (SiriAudioSupport::DomainCode)&v57, v48);
  v56[0] = LOWORD(v58[0]);
  v56[1] = v58[1];
  v56[2] = v58[2];
  v54(v56, v59.errorDescription._countAndFlagsBits, v59.errorDescription._object);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2297C2640(int a1, void *a2, uint64_t (*a3)(uint64_t), uint64_t a4, unsigned int a5, uint64_t a6, void (*a7)(_QWORD *, uint64_t, void *), uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _DWORD *v22;
  _DWORD *v23;
  char v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  void (*v35)(_QWORD *, uint64_t, void *);
  _QWORD aBlock[7];

  v30 = a8;
  v31 = a3;
  v34 = a6;
  v35 = a7;
  v33 = a5;
  v32 = a4;
  v10 = sub_2297DCB54();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 0;
  v15 = swift_allocObject();
  *(_BYTE *)(v15 + 16) = 0;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = sub_2297B48C4;
  *(_QWORD *)(v16 + 32) = 0;
  *(_DWORD *)(v16 + 40) = a1;
  *(_QWORD *)(v16 + 48) = v15;
  aBlock[4] = sub_2297C2A2C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2297B4F4C;
  aBlock[3] = &block_descriptor_148;
  v17 = _Block_copy(aBlock);
  v18 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  MRMediaRemoteCommandInfoEnumerateSupportedCommandsWithHandler();
  _Block_release(v17);

  if (qword_255A58C08 != -1)
    swift_once();
  v29 = v15 + 16;
  v19 = __swift_project_value_buffer(v10, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v19, v10);
  swift_retain();
  swift_retain();
  v28 = v13;
  v20 = sub_2297DCB3C();
  v21 = sub_2297DD178();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (_DWORD *)swift_slowAlloc();
    v27 = v10;
    v23 = v22;
    *v22 = 67109376;
    swift_beginAccess();
    LODWORD(aBlock[0]) = *(unsigned __int8 *)(v14 + 16);
    sub_2297DD340();
    swift_release();
    *((_WORD *)v23 + 4) = 1024;
    swift_beginAccess();
    LODWORD(aBlock[0]) = *(unsigned __int8 *)(v15 + 16);
    sub_2297DD340();
    swift_release();
    _os_log_impl(&dword_22960C000, v20, v21, "MRMediaRemoteCommandInsertIntoPlaybackQueue supportedCommand: %{BOOL}d supportsOnlyNext: %{BOOL}d", (uint8_t *)v23, 0xEu);
    v10 = v27;
    MEMORY[0x22E2D0294](v23, -1, -1);

  }
  else
  {

    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v28, v10);
  swift_beginAccess();
  v24 = *(_BYTE *)(v14 + 16);
  swift_beginAccess();
  sub_2297C2148(v24, *(_BYTE *)(v15 + 16), v31, v32, v33, v34, v35, v30);
  swift_release();
  return swift_release();
}

uint64_t sub_2297C29D0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C29E0()
{
  return objectdestroy_116Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_116Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C2A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2297B4E90(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 24), *(_QWORD *)(v2 + 32), *(unsigned int *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_2297C2A40()
{
  unint64_t result;

  result = qword_255A606D8;
  if (!qword_255A606D8)
  {
    result = MEMORY[0x22E2D01BC](MEMORY[0x24BEE3FC8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_255A606D8);
  }
  return result;
}

uint64_t sub_2297C2A84()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C2AB0(int a1)
{
  uint64_t v1;

  return sub_2297B31B8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(char **)(v1 + 32), *(char **)(v1 + 40));
}

uint64_t sub_2297C2ABC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297C2AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2297DBA44();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C2B88()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C2BC4(unsigned __int16 *a1)
{
  uint64_t v1;

  return sub_2297B0D84(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56), *(unsigned __int8 *)(v1 + 64), *(void (**)(uint64_t *))(v1 + 72), *(_QWORD *)(v1 + 80));
}

uint64_t sub_2297C2BF8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297C2C54()
{
  uint64_t v0;

  return sub_2297C09C4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(void **)(v0 + 88), *(_QWORD *)(v0 + 96), *(char **)(v0 + 104), *(_BYTE *)(v0 + 112));
}

uint64_t sub_2297C2CA4()
{
  return sub_2297B1614();
}

uint64_t sub_2297C2CAC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2CBC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2CCC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2CDC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2CEC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297C2D10@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2297C2D1C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D2C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D3C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D4C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D5C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D6C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D7C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D8C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2D9C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DAC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DBC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DCC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DDC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DEC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2DFC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E0C()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

uint64_t sub_2297C2E14()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E24()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E34()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E44()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E54()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E64()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2E74@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_2297C2E9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2296E8E38(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_2297C2EA4()
{
  uint64_t v0;

  return sub_2297B18A0(*(void **)(v0 + 16), (SEL *)&selRef_domain);
}

uint64_t sub_2297C2EC4()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2ED4()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2EE4()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2EF4()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F04()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F14()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2296CB304(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_2297C2F2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2296E8E90(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_2297C2F34@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v1 + 16))
    v2 = *(_QWORD *)(v1 + 16);
  *a1 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2297C2F50()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F60()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F70()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F80()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2F90()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FA0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FB0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FC0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FD0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FE0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C2FF0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3000()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3010()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3020()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3030()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3040()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3050()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3060()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3070()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3080()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3090()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30A0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30B0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30C0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30D0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30E0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C30F0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3100()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3110()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3120()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3130()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3140()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3150()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3160()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3170()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3180()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3190()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31A0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31B0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31C0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31D0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31E0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C31F0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3200()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3210()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3220()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3230()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3240()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3250()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3260()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3270()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3280()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3290()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32A0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32B0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32C0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32D0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32E0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C32F0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3300()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3310()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3320()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3330()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3340()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3350()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3360()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3370()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3380()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3390()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33A0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33B0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33C0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33D0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33E0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C33F0()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3400()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3410()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3420()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3430()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C3454()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3464()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3474()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297C3498()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2297C34BC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C34CC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C34DC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C34EC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C34FC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C350C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C351C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C352C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C353C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C354C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C355C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C356C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C357C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C358C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C359C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35AC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35BC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35CC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35DC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35EC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C35FC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C360C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C361C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C362C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C363C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C364C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C365C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C366C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C367C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C368C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C369C()
{
  return swift_deallocObject();
}

uint64_t sub_2297C36AC()
{
  return swift_deallocObject();
}

uint64_t sub_2297C36BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2297C36E8()
{
  uint64_t v0;

  return sub_2297B18A0(*(void **)(v0 + 16), (SEL *)&selRef_localizedDescription);
}

uint64_t sub_2297C3708()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3718()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3728()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3738()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3748()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3758()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3768()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3778()
{
  return swift_deallocObject();
}

id sub_2297C3788()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_code);
}

uint64_t sub_2297C3798()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37A8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37B8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37C8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37D8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37E8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C37F8()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3808()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3818()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3828()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3838()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3848()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3858()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3868()
{
  return swift_deallocObject();
}

uint64_t sub_2297C3878()
{
  return swift_deallocObject();
}

uint64_t sub_2297C388C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2297DBA44();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2297C3944(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_2297DBA44() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  sub_2297AF59C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v4, *(_BYTE *)(v1 + v5), *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 16), *(_QWORD *)(v1 + (((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + (((((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1+ (((((((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2297C39D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2297DBA44();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

void sub_2297C3A78(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_QWORD *)(sub_2297DBA44() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (uint64_t *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_2297AE86C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v4, *v5, v5[1]);
}

uint64_t sub_2297C3AE0(uint64_t a1)
{
  return sub_2296E5574(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2297AD800);
}

uint64_t objectdestroy_1505Tm()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C3B38()
{
  uint64_t v0;

  return sub_2297ADB90(*(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_2297C3B64(uint64_t a1)
{
  uint64_t v1;

  return sub_2297AD350(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2297C3B6C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C3BB8(int a1)
{
  uint64_t v1;

  return sub_229682AE4(a1, *(_QWORD *)(v1 + 16), (uint64_t *)(v1 + 24), *(uint64_t (**)(_QWORD *))(v1 + 80), *(_QWORD *)(v1 + 88), *(uint64_t (**)(uint64_t))(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_2297C3BD4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C3C20(char a1)
{
  uint64_t v1;

  return sub_2296700A4(a1, v1 + 16, *(void **)(v1 + 72), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_2297C3C40(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_2297C3C74()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2297C3C98(void *a1)
{
  uint64_t v1;

  sub_2297B0994(a1, *(void (**)(Swift::String *))(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_2297C3CA4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A60720;
  if (!qword_255A60720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255A5ECB0);
    v2 = sub_229611304((unint64_t *)&qword_255A59078, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_2297DEE10);
    result = MEMORY[0x22E2D01BC](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A60720);
  }
  return result;
}

_QWORD *sub_2297C3D20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_2297B8574((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2297C3D7C, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2297C3D7C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2297B9F08(a1, a2);
}

uint64_t sub_2297C3D98()
{
  return objectdestroy_47Tm();
}

uint64_t sub_2297C3DA0()
{
  return objectdestroy_47Tm();
}

uint64_t sub_2297C3DA8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297C3DD4(__int128 *a1)
{
  uint64_t v1;

  return sub_2297B64D8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2297C3DE0()
{
  return objectdestroy_47Tm();
}

uint64_t sub_2297C3DE8()
{
  return objectdestroy_47Tm();
}

uint64_t objectdestroy_47Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t dispatch thunk of NotificationProviding.post(result:songId:playlistId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

BOOL static AcceptedSpeakerIdConfidence.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AcceptedSpeakerIdConfidence.hash(into:)()
{
  return sub_2297DD70C();
}

uint64_t AcceptedSpeakerIdConfidence.hashValue.getter()
{
  sub_2297DD700();
  sub_2297DD70C();
  return sub_2297DD73C();
}

unint64_t sub_2297C42C4()
{
  unint64_t result;

  result = qword_255A60740;
  if (!qword_255A60740)
  {
    result = MEMORY[0x22E2D01BC](&protocol conformance descriptor for AcceptedSpeakerIdConfidence, &type metadata for AcceptedSpeakerIdConfidence);
    atomic_store(result, (unint64_t *)&qword_255A60740);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AcceptedSpeakerIdConfidence(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2297C4354 + 4 * byte_2297E81C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2297C4388 + 4 * byte_2297E81C0[v4]))();
}

uint64_t sub_2297C4388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297C4390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2297C4398);
  return result;
}

uint64_t sub_2297C43A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2297C43ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2297C43B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297C43B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AcceptedSpeakerIdConfidence()
{
  return &type metadata for AcceptedSpeakerIdConfidence;
}

Swift::UInt64_optional __swiftcall MPMediaLibrary.persistentID(fromSiriSyncID:)(Swift::String fromSiriSyncID)
{
  void *v1;
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  Swift::Bool v17;
  Swift::UInt64 v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::UInt64_optional result;

  v2 = v1;
  object = fromSiriSyncID._object;
  countAndFlagsBits = fromSiriSyncID._countAndFlagsBits;
  v5 = sub_2297DCB54();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)sub_2297DCE48();
  v10 = objc_msgSend(v2, sel_entityWithSiriSyncIdentifier_, v9);

  if (v10)
  {
    v11 = objc_msgSend(v10, sel_persistentID);

  }
  else
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v5, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    swift_bridgeObjectRetain_n();
    v13 = sub_2297DCB3C();
    v14 = sub_2297DD16C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v22 = v20;
      *(_DWORD *)v15 = 136315138;
      v19 = v15 + 4;
      swift_bridgeObjectRetain();
      v21 = sub_22960FB78(countAndFlagsBits, (unint64_t)object, &v22);
      sub_2297DD340();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22960C000, v13, v14, "MPMediaLibrary#persistantID Failed to get mediaEntity by querying with siriSyncID: %s", v15, 0xCu);
      v16 = v20;
      swift_arrayDestroy();
      MEMORY[0x22E2D0294](v16, -1, -1);
      MEMORY[0x22E2D0294](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = 0;
  }
  v17 = v10 == 0;
  v18 = (Swift::UInt64)v11;
  result.value = v18;
  result.is_nil = v17;
  return result;
}

uint64_t sub_2297C463C(uint64_t a1, _QWORD *a2)
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
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  _QWORD *v47;
  unsigned int v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  char *v56;
  _QWORD *v57;

  v4 = sub_2297DC638();
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2297DC62C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v44 - v10;
  v11 = *(_QWORD *)(a1 + 56);
  v45 = a1 + 56;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v46 = (unint64_t)(v12 + 63) >> 6;
  v48 = *MEMORY[0x24BE93230];
  v53 = a1;
  swift_bridgeObjectRetain();
  v15 = 0;
  v47 = a2;
  while (1)
  {
    if (v14)
    {
      v54 = (v14 - 1) & v14;
      v55 = v15;
      v16 = __clz(__rbit64(v14)) | (v15 << 6);
    }
    else
    {
      v17 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_36;
      if (v17 >= v46)
        return swift_release();
      v18 = *(_QWORD *)(v45 + 8 * v17);
      v19 = v15 + 1;
      if (!v18)
      {
        v19 = v15 + 2;
        if (v15 + 2 >= v46)
          return swift_release();
        v18 = *(_QWORD *)(v45 + 8 * v19);
        if (!v18)
        {
          v19 = v15 + 3;
          if (v15 + 3 >= v46)
            return swift_release();
          v18 = *(_QWORD *)(v45 + 8 * v19);
          if (!v18)
          {
            v19 = v15 + 4;
            if (v15 + 4 >= v46)
              return swift_release();
            v18 = *(_QWORD *)(v45 + 8 * v19);
            if (!v18)
            {
              v20 = v15 + 5;
              if (v15 + 5 >= v46)
                return swift_release();
              v18 = *(_QWORD *)(v45 + 8 * v20);
              if (!v18)
              {
                while (1)
                {
                  v19 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_37;
                  if (v19 >= v46)
                    return swift_release();
                  v18 = *(_QWORD *)(v45 + 8 * v19);
                  ++v20;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v19 = v15 + 5;
            }
          }
        }
      }
LABEL_23:
      v54 = (v18 - 1) & v18;
      v55 = v19;
      v16 = __clz(__rbit64(v18)) + (v19 << 6);
    }
    v21 = (uint64_t *)(*(_QWORD *)(v53 + 48) + 16 * v16);
    v22 = *v21;
    v23 = v21[1];
    (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v50, v48, v52);
    swift_bridgeObjectRetain_n();
    v24 = v49;
    sub_2297DC614();
    v25 = v7;
    v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v27 = v6;
    v26(v56, v24, v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v57 = (_QWORD *)*a2;
    v29 = v57;
    *a2 = 0x8000000000000000;
    v31 = sub_22961AA90(v22, v23);
    v32 = v29[2];
    v33 = (v30 & 1) == 0;
    v34 = v32 + v33;
    if (__OFADD__(v32, v33))
      break;
    v35 = v30;
    if (v29[3] >= v34)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_229783310();
    }
    else
    {
      sub_229781F04(v34, isUniquelyReferenced_nonNull_native);
      v36 = sub_22961AA90(v22, v23);
      if ((v35 & 1) != (v37 & 1))
        goto LABEL_38;
      v31 = v36;
    }
    v6 = v27;
    v38 = v57;
    v7 = v25;
    if ((v35 & 1) != 0)
    {
      (*(void (**)(unint64_t, char *, uint64_t))(v25 + 40))(v57[7] + *(_QWORD *)(v25 + 72) * v31, v56, v6);
    }
    else
    {
      v57[(v31 >> 6) + 8] |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v22;
      v39[1] = v23;
      v26((char *)(v38[7] + *(_QWORD *)(v25 + 72) * v31), v56, v6);
      v40 = v38[2];
      v41 = __OFADD__(v40, 1);
      v42 = v40 + 1;
      if (v41)
        goto LABEL_35;
      v38[2] = v42;
      swift_bridgeObjectRetain();
    }
    a2 = v47;
    *v47 = v57;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v14 = v54;
    v15 = v55;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  result = sub_2297DD694();
  __break(1u);
  return result;
}

uint64_t sub_2297C4A4C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, double a6, double a7, double a8)
{
  uint64_t v8;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t i;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32[2];

  v30 = a1 + 56;
  v17 = 1 << *(_BYTE *)(a1 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(a1 + 56);
  v31 = (unint64_t)(v17 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v21 = 0;
  if (!v19)
    goto LABEL_5;
LABEL_4:
  v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (i = v22 | (v21 << 6); ; i = __clz(__rbit64(v25)) + (v21 << 6))
  {
    v27 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v28 = v27[1];
    v32[0] = *v27;
    v32[1] = v28;
    swift_bridgeObjectRetain();
    sub_2297C5570(v32, a2, a3, a4, a5, a6, a7, a8);
    if (v8)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v21++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v31)
      return swift_release();
    v25 = *(_QWORD *)(v30 + 8 * v21);
    if (!v25)
    {
      v26 = v21 + 1;
      if (v21 + 1 >= v31)
        return swift_release();
      v25 = *(_QWORD *)(v30 + 8 * v26);
      if (v25)
        goto LABEL_14;
      v26 = v21 + 2;
      if (v21 + 2 >= v31)
        return swift_release();
      v25 = *(_QWORD *)(v30 + 8 * v26);
      if (v25)
        goto LABEL_14;
      v26 = v21 + 3;
      if (v21 + 3 >= v31)
        return swift_release();
      v25 = *(_QWORD *)(v30 + 8 * v26);
      if (v25)
      {
LABEL_14:
        v21 = v26;
        goto LABEL_15;
      }
      v29 = v21 + 4;
      if (v21 + 4 >= v31)
        return swift_release();
      v25 = *(_QWORD *)(v30 + 8 * v29);
      v21 += 4;
      if (!v25)
        break;
    }
LABEL_15:
    v19 = (v25 - 1) & v25;
  }
  while (1)
  {
    v21 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v21 >= v31)
      return swift_release();
    v25 = *(_QWORD *)(v30 + 8 * v21);
    ++v29;
    if (v25)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2297C4C70()
{
  uint64_t result;

  result = sub_22967F4D4((uint64_t)&unk_24F2617F8);
  qword_255A60748 = result;
  return result;
}

uint64_t sub_2297C4C94()
{
  void *v0;
  uint64_t result;

  v0 = (void *)sub_22967ED40((uint64_t)&unk_24F25DC08);
  result = swift_arrayDestroy();
  off_255A60750 = v0;
  return result;
}

uint64_t sub_2297C4CDC(uint64_t a1)
{
  return sub_2297C4D48(a1, &qword_255A58AD0, (uint64_t)&qword_255A5BE68, &qword_255A60758);
}

uint64_t sub_2297C4D00(uint64_t a1)
{
  return sub_2297C4D48(a1, &qword_255A58AD8, (uint64_t)&qword_255A5BE70, &qword_255A60760);
}

uint64_t sub_2297C4D24(uint64_t a1)
{
  return sub_2297C4D48(a1, &qword_255A58AE0, (uint64_t)&qword_255A5BE78, &qword_255A60768);
}

uint64_t sub_2297C4D48(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (*a2 != -1)
    swift_once();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_229710604(v5);
  result = swift_bridgeObjectRelease();
  *a4 = v6;
  return result;
}

uint64_t sub_2297C4DAC()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_229710324((uint64_t)&unk_24F25DC48);
  result = swift_arrayDestroy();
  qword_255A680C0 = v0;
  return result;
}

unint64_t sub_2297C4DF4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  char v22;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5D7F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2297E4B20;
  *(_QWORD *)(inited + 32) = 0xD000000000000019;
  *(_QWORD *)(inited + 40) = 0x80000002297E8A20;
  v7 = *v2;
  v8 = 0;
  v9 = 0;
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    v10 = sub_22961AA90(a1, a2);
    if ((v11 & 1) != 0)
      v9 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v10);
    swift_bridgeObjectRelease();
  }
  v12 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 72) = v12;
  *(_QWORD *)(inited + 80) = 0xD00000000000001CLL;
  *(_QWORD *)(inited + 88) = 0x80000002297E8A40;
  v13 = v3[1];
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_22961AA90(a1, a2);
    if ((v15 & 1) != 0)
      v8 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(inited + 96) = v8;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 128) = 0x4674726F70707573;
  *(_QWORD *)(inited + 136) = 0xEB0000000067616CLL;
  v16 = 0;
  if ((sub_229634298(a1, a2, v3[2]) & 1) != 0)
    v17 = 1.0;
  else
    v17 = 0.0;
  *(double *)(inited + 144) = v17;
  *(_QWORD *)(inited + 168) = v12;
  *(_QWORD *)(inited + 176) = 0x466E726F63696E75;
  *(_QWORD *)(inited + 184) = 0xEB0000000067616CLL;
  if ((sub_229634298(a1, a2, v3[3]) & 1) != 0)
    v18 = 1.0;
  else
    v18 = 0.0;
  *(double *)(inited + 192) = v18;
  *(_QWORD *)(inited + 216) = v12;
  *(_QWORD *)(inited + 224) = 0xD000000000000013;
  *(_QWORD *)(inited + 232) = 0x80000002297E8A60;
  if ((sub_229634298(a1, a2, v3[4]) & 1) != 0)
    v19 = 1.0;
  else
    v19 = 0.0;
  *(double *)(inited + 240) = v19;
  *(_QWORD *)(inited + 264) = v12;
  *(_QWORD *)(inited + 272) = 825389430;
  *(_QWORD *)(inited + 280) = 0xE400000000000000;
  v20 = v3[5];
  if (*(_QWORD *)(v20 + 16))
  {
    swift_bridgeObjectRetain();
    v21 = sub_22961AA90(a1, a2);
    if ((v22 & 1) != 0)
      v16 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(inited + 312) = v12;
  *(_QWORD *)(inited + 288) = v16;
  return sub_2296F956C(inited);
}

uint64_t sub_2297C5028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t result;
  double v20;
  uint64_t v21;
  unint64_t v22;
  char v23;

  v4 = v3;
  v8 = v3[1];
  v9 = 0;
  v10 = 0;
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    v11 = sub_22961AA90(a1, a2);
    if ((v12 & 1) != 0)
      v10 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v11);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(a3 + 96) = v10;
  v13 = *v4;
  if (*(_QWORD *)(*v4 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_22961AA90(a1, a2);
    if ((v15 & 1) != 0)
      v9 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(a3 + 120) = v9;
  v16 = 0;
  if ((sub_229634298(a1, a2, v4[2]) & 1) != 0)
    v17 = 1.0;
  else
    v17 = 0.0;
  *(double *)(a3 + 104) = v17;
  if ((sub_229634298(a1, a2, v4[3]) & 1) != 0)
    v18 = 1.0;
  else
    v18 = 0.0;
  *(double *)(a3 + 176) = v18;
  result = sub_229634298(a1, a2, v4[4]);
  if ((result & 1) != 0)
    v20 = 1.0;
  else
    v20 = 0.0;
  *(double *)(a3 + 16) = v20;
  v21 = v4[5];
  if (*(_QWORD *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    v22 = sub_22961AA90(a1, a2);
    if ((v23 & 1) != 0)
      v16 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
    result = swift_bridgeObjectRelease();
  }
  *(_QWORD *)(a3 + 32) = v16;
  return result;
}

uint64_t sub_2297C5174(uint64_t *a1, uint64_t a2, uint64_t *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  double v13;
  double *v14;
  double v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD *v28;
  BOOL v29;
  char v30;
  double v31;
  double v32;
  char v33;
  double v34;
  char isUniquelyReferenced_nonNull_native;
  char v36;
  char v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v8 = *a1;
  v7 = a1[1];
  if (a2 && *(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    v10 = sub_22961AA90(v8, v7);
    if ((v11 & 1) != 0)
    {
      v12 = *(_QWORD **)(*(_QWORD *)(a2 + 56) + 8 * v10);
      swift_bridgeObjectRetain();
    }
    else
    {
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = 0.05;
  v14 = (double *)&unk_2297E8000;
  v15 = 0.05;
  v44 = v12[2];
  if (v44)
  {
    v42 = a4;
    v39 = v8;
    v40 = v7;
    v41 = a5;
    swift_bridgeObjectRetain();
    v16 = 0;
    v15 = 0.05;
    do
    {
      v17 = &v12[2 * v16 + 4];
      v18 = *v17;
      v19 = v17[1];
      v20 = qword_255A58DC8;
      swift_bridgeObjectRetain();
      if (v20 != -1)
        swift_once();
      v21 = off_255A60750;
      if (*((_QWORD *)off_255A60750 + 2))
      {
        sub_2297DD700();
        sub_2297DCEE4();
        v22 = sub_2297DD73C();
        v23 = -1 << v21[32];
        v24 = v22 & ~v23;
        if (((*(_QWORD *)&v21[((v24 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v24) & 1) != 0)
        {
          v25 = *((_QWORD *)v21 + 6);
          v26 = (_QWORD *)(v25 + 16 * v24);
          v27 = *v26 == v18 && v26[1] == v19;
          if (v27 || (sub_2297DD658() & 1) != 0)
          {
LABEL_26:
            swift_bridgeObjectRelease();
            v14 = (double *)&unk_2297E8000;
            v15 = 1.05;
            a5 = v41;
            v8 = v39;
            v7 = v40;
            goto LABEL_27;
          }
          while (1)
          {
            v24 = (v24 + 1) & ~v23;
            if (((*(_QWORD *)&v21[((v24 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v24) & 1) == 0)
              break;
            v28 = (_QWORD *)(v25 + 16 * v24);
            v29 = *v28 == v18 && v28[1] == v19;
            if (v29 || (sub_2297DD658() & 1) != 0)
              goto LABEL_26;
          }
        }
      }
      ++v16;
      swift_bridgeObjectRelease();
    }
    while (v16 != v44);
    a5 = v41;
    v8 = v39;
    v7 = v40;
    v14 = (double *)&unk_2297E8000;
LABEL_27:
    swift_bridgeObjectRelease();
    a4 = v42;
  }
  v30 = sub_2296343D0(0xD000000000000017, 0x80000002297E89A0, v12);
  v31 = v14[82];
  if ((v30 & 1) != 0)
    v32 = v14[82];
  else
    v32 = 0.05;
  if ((sub_2296343D0(0xD000000000000019, 0x80000002297E89C0, v12) & 1) != 0)
    v13 = v31;
  v33 = sub_2296343D0(0xD000000000000014, 0x80000002297E8A00, v12);
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
  {
    v13 = v13 * 0.5;
    v34 = v32 * 0.5;
  }
  else
  {
    v34 = v32;
  }
  if ((v33 & 1) != 0)
    v15 = v15 * 0.5;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v45 = *a3;
  *a3 = 0x8000000000000000;
  sub_2296D192C(v8, v7, isUniquelyReferenced_nonNull_native, v15);
  *a3 = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v36 = swift_isUniquelyReferenced_nonNull_native();
  v46 = *a4;
  *a4 = 0x8000000000000000;
  sub_2296D192C(v8, v7, v36, v34);
  *a4 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v37 = swift_isUniquelyReferenced_nonNull_native();
  v47 = *a5;
  *a5 = 0x8000000000000000;
  sub_2296D192C(v8, v7, v37, v13);
  *a5 = v47;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2297C5570(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, double a6, double a7, double a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  double v29;
  double v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v33;

  v16 = *a1;
  v15 = a1[1];
  swift_beginAccess();
  v17 = *a3;
  v18 = *(_QWORD *)(v17 + 16);
  swift_bridgeObjectRetain();
  if (!v18 || (v19 = sub_22961AA90(v16, v15), (v20 & 1) == 0))
  {
    swift_endAccess();
    __break(1u);
    goto LABEL_9;
  }
  v21 = *(double *)(*(_QWORD *)(v17 + 56) + 8 * v19);
  swift_endAccess();
  swift_beginAccess();
  v22 = *a4;
  if (!*(_QWORD *)(*a4 + 16))
  {
LABEL_10:
    swift_endAccess();
    __break(1u);
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v23 = sub_22961AA90(v16, v15);
  if ((v24 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v25 = *(double *)(*(_QWORD *)(v22 + 56) + 8 * v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v26 = *a5;
  if (*(_QWORD *)(*a5 + 16))
  {
    swift_bridgeObjectRetain();
    v27 = sub_22961AA90(v16, v15);
    if ((v28 & 1) != 0)
    {
      v29 = v21 * a6 + v25 * a7;
      v30 = *(double *)(*(_QWORD *)(v26 + 56) + 8 * v27);
      swift_endAccess();
      swift_bridgeObjectRelease();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v33 = *a2;
      *a2 = 0x8000000000000000;
      sub_2296D192C(v16, v15, isUniquelyReferenced_nonNull_native, v29 + v30 * a8);
      *a2 = v33;
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_11;
  }
LABEL_12:
  result = swift_endAccess();
  __break(1u);
  return result;
}

double sub_2297C5764()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

uint64_t sub_2297C576C()
{
  if (qword_255A58DE8 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t *sub_2297C57B4(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  unint64_t *v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_2297C5904((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_2297C5904((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x22E2D0294](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_2297C5904(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = 0;
  v5 = 0;
  v6 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10)
      return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v12) == 2)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
      }
    }
  }
  v15 = v13 + 3;
  if (v15 >= v10)
    return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      return (unint64_t *)sub_2297D3218(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2297C5A50(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25[2];
  int64_t v26;

  v24 = a1 + 56;
  v11 = 1 << *(_BYTE *)(a1 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(a1 + 56);
  v26 = (unint64_t)(v11 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v15 = 0;
  if (!v13)
    goto LABEL_5;
LABEL_4:
  v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v22 = v21[1];
    v25[0] = *v21;
    v25[1] = v22;
    swift_bridgeObjectRetain();
    sub_2297C5174(v25, a2, a3, a4, a5);
    if (v5)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v15++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v15 >= v26)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v15);
    if (!v19)
    {
      v20 = v15 + 1;
      if (v15 + 1 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
        goto LABEL_14;
      v20 = v15 + 2;
      if (v15 + 2 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
        goto LABEL_14;
      v20 = v15 + 3;
      if (v15 + 3 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v20);
      if (v19)
      {
LABEL_14:
        v15 = v20;
        goto LABEL_15;
      }
      v23 = v15 + 4;
      if (v15 + 4 >= v26)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v23);
      v15 += 4;
      if (!v19)
        break;
    }
LABEL_15:
    v13 = (v19 - 1) & v19;
  }
  while (1)
  {
    v15 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v15 >= v26)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v15);
    ++v23;
    if (v19)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2297C5C4C(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  _BYTE *v24;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606C8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v23 - v12;
  v14 = sub_2297DC62C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a4;
  if (!*(_QWORD *)(*a4 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return sub_229653E64((uint64_t)v13, &qword_255A606C8);
  }
  v24 = a3;
  swift_bridgeObjectRetain();
  v19 = sub_22961AA90(a1, a2);
  if ((v20 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v15 + 72) * v19, v14);
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v21(v13, 0, 1, v14);
  }
  else
  {
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v21(v13, 1, 1, v14);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return sub_229653E64((uint64_t)v13, &qword_255A606C8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  SiriRemembersV1API.Aggregation.addInstance(date:)(v24);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v17, v14);
  v21(v11, 0, 1, v14);
  swift_bridgeObjectRetain();
  sub_2297AC414((uint64_t)v11, a1, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_2297C5E5C(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  BOOL v37;
  uint64_t v38;
  unint64_t i;
  uint64_t v40;
  _QWORD *v41;
  BOOL v42;
  BOOL v43;
  uint64_t v44[2];
  unint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  int64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  int64_t v56;
  char *v57;

  v44[0] = a2;
  v45 = a1;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60770);
  MEMORY[0x24BDAC7A8](v53);
  v7 = (uint64_t *)((char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_2297DC62C();
  v9 = *(_QWORD *)(v8 - 8);
  result = MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v54 = a3;
  v55 = a4;
  v15 = a3[8];
  v14 = a3 + 8;
  v13 = v15;
  v16 = 1 << *((_BYTE *)v14 - 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & v13;
  v48 = v14;
  v49 = (unint64_t)(v16 + 63) >> 6;
  v46 = 0;
  v47 = a4 + 56;
  v51 = v9;
  v52 = result;
  v50 = v7;
  while (v18)
  {
    v19 = __clz(__rbit64(v18));
    v18 &= v18 - 1;
    v56 = v12;
    v20 = v19 | (v12 << 6);
LABEL_23:
    v25 = (uint64_t *)(v54[6] + 16 * v20);
    v27 = *v25;
    v26 = v25[1];
    v28 = v54[7] + *(_QWORD *)(v9 + 72) * v20;
    v29 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    v30 = v57;
    v29(v57, v28, v8);
    *v7 = v27;
    v7[1] = v26;
    v29((char *)v7 + *(int *)(v53 + 48), (unint64_t)v30, v8);
    if (!*(_QWORD *)(a4 + 16))
    {
      swift_bridgeObjectRetain_n();
      goto LABEL_6;
    }
    sub_2297DD700();
    swift_bridgeObjectRetain_n();
    sub_2297DCEE4();
    v31 = sub_2297DD73C();
    v32 = -1 << *(_BYTE *)(a4 + 32);
    v33 = v31 & ~v32;
    v34 = v47;
    if (((*(_QWORD *)(v47 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) != 0)
    {
      v35 = *(_QWORD *)(v55 + 48);
      v36 = (_QWORD *)(v35 + 16 * v33);
      v37 = *v36 == v27 && v36[1] == v26;
      if (!v37 && (sub_2297DD658() & 1) == 0)
      {
        v38 = ~v32;
        for (i = v33 + 1; ; i = v40 + 1)
        {
          v40 = i & v38;
          if (((*(_QWORD *)(v34 + (((i & v38) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v38)) & 1) == 0)
            break;
          v41 = (_QWORD *)(v35 + 16 * v40);
          v42 = *v41 == v27 && v41[1] == v26;
          if (v42 || (sub_2297DD658() & 1) != 0)
            goto LABEL_38;
        }
        goto LABEL_6;
      }
LABEL_38:
      v7 = v50;
      sub_229653E64((uint64_t)v50, &qword_255A60770);
      v9 = v51;
      v8 = v52;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v57, v52);
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v45 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v43 = __OFADD__(v46++, 1);
      a4 = v55;
      v12 = v56;
      if (v43)
      {
        __break(1u);
        return sub_2297D2ED0(v45, v44[0], v46, v54);
      }
    }
    else
    {
LABEL_6:
      v7 = v50;
      sub_229653E64((uint64_t)v50, &qword_255A60770);
      v9 = v51;
      v8 = v52;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v57, v52);
      result = swift_bridgeObjectRelease();
      a4 = v55;
      v12 = v56;
    }
  }
  v21 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_43;
  }
  if (v21 >= v49)
    return sub_2297D2ED0(v45, v44[0], v46, v54);
  v22 = v48[v21];
  v23 = v12 + 1;
  if (v22)
    goto LABEL_22;
  v23 = v12 + 2;
  if (v12 + 2 >= v49)
    return sub_2297D2ED0(v45, v44[0], v46, v54);
  v22 = v48[v23];
  if (v22)
    goto LABEL_22;
  v23 = v12 + 3;
  if (v12 + 3 >= v49)
    return sub_2297D2ED0(v45, v44[0], v46, v54);
  v22 = v48[v23];
  if (v22)
  {
LABEL_22:
    v18 = (v22 - 1) & v22;
    v56 = v23;
    v20 = __clz(__rbit64(v22)) + (v23 << 6);
    goto LABEL_23;
  }
  v24 = v12 + 4;
  if (v12 + 4 >= v49)
    return sub_2297D2ED0(v45, v44[0], v46, v54);
  v22 = v48[v24];
  if (v22)
  {
    v23 = v12 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    v23 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v23 >= v49)
      return sub_2297D2ED0(v45, v44[0], v46, v54);
    v22 = v48[v23];
    ++v24;
    if (v22)
      goto LABEL_22;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2297C624C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v10 = sub_2297C5E5C((_QWORD *)((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, (_QWORD *)a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    v10 = sub_2297C5E5C((unint64_t *)v11, v7, (_QWORD *)a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x22E2D0294](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_2297C6400(uint64_t a1, uint64_t a2)
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  uint8_t *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint8_t *v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t (*v84)(uint64_t *, uint64_t);
  int v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t *v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  NSObject *v99;
  os_log_type_t v100;
  _BOOL4 v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint8_t *v110;
  _BYTE *v111;
  uint8_t *v112;
  void (*v113)(_BYTE *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint8_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint8_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  NSObject *v124;
  uint64_t *v125;
  int v126;
  char v127;
  int v128;
  void (*v129)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  uint64_t (*v134)(uint64_t *, uint64_t);
  int v135;
  void (*v136)(uint64_t *, uint64_t);
  uint64_t v137;
  char *v138;
  uint64_t v139;
  NSObject *v140;
  os_log_type_t v141;
  _BOOL4 v142;
  uint8_t *v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  BOOL v158;
  char *v159;
  NSObject *v160;
  os_log_type_t v161;
  uint8_t *v162;
  uint64_t v163;
  uint8_t *v164;
  uint8_t *v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  uint64_t *v169;
  char *v170;
  char v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  char v182;
  char *v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  _BYTE *v188;
  uint64_t v189;
  NSObject *v190;
  os_log_type_t v191;
  uint8_t *v192;
  uint64_t v193;
  unint64_t v194;
  uint8_t *v195;
  char *v196;
  char *v197;
  uint64_t *v198;
  uint64_t v199;
  int v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  char v204;
  os_log_type_t v205;
  uint64_t *v206;
  uint8_t *v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint8_t *v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  char *v215;
  os_log_type_t v216;
  uint8_t *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint8_t *v221;
  char *v222;
  uint8_t *v223;
  char *v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  unint64_t v230;
  char v231;
  uint64_t v232;
  NSObject *v233;
  os_log_type_t v234;
  uint8_t *v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  uint64_t v240;
  size_t v241;
  uint64_t v242;
  uint64_t result;
  char *v244;
  char *v245;
  void (*v246)(char *, uint64_t);
  uint64_t v247;
  char *v248;
  char *v249;
  void (*v250)(char *, uint64_t);
  char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void (*v256)(uint64_t, uint64_t);
  int v257;
  uint64_t (*v258)(uint64_t, uint64_t);
  uint8_t *v259;
  uint8_t *v260;
  char *v261;
  uint64_t v262;
  char *v263;
  uint64_t *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t *v267;
  char *v268;
  char *v269;
  char *v270;
  char *v271;
  char *v272;
  uint64_t *v273;
  uint64_t v274;
  char *v275;
  uint64_t v276;
  char *v277;
  char *v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  uint8_t *v282;
  uint64_t v283;
  void (*v284)(char *, uint64_t, uint64_t);
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  int v288;
  char *v289;
  uint64_t v290;
  char *v291;
  uint64_t *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint8_t *v297;
  char v298[8];
  __int128 v299;
  uint64_t v300;
  char *v301;
  uint64_t v302;
  uint64_t v303;

  v276 = sub_2297DBA44();
  v274 = *(_QWORD *)(v276 - 8);
  v4 = MEMORY[0x24BDAC7A8](v276);
  v263 = (char *)&v253 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v275 = (char *)&v253 - v6;
  v7 = sub_2297DCB54();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v268 = (char *)&v253 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v272 = (char *)&v253 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v278 = (char *)&v253 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v269 = (char *)&v253 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v267 = (uint64_t *)((char *)&v253 - v18);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v270 = (char *)&v253 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v279 = (char *)&v253 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v291 = (char *)&v253 - v23;
  v281 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5A610);
  v24 = MEMORY[0x24BDAC7A8](v281);
  v264 = (uint64_t *)((char *)&v253 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = MEMORY[0x24BDAC7A8](v24);
  v277 = (char *)&v253 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v271 = (char *)&v253 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v292 = (uint64_t *)((char *)&v253 - v31);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v289 = (char *)&v253 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v266 = (uint64_t)&v253 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v265 = (uint64_t)&v253 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v273 = (uint64_t *)((char *)&v253 - v39);
  v40 = MEMORY[0x24BDAC7A8](v38);
  v42 = (uint64_t *)((char *)&v253 - v41);
  v43 = MEMORY[0x24BDAC7A8](v40);
  v280 = (uint64_t)&v253 - v44;
  v45 = MEMORY[0x24BDAC7A8](v43);
  v47 = (char *)&v253 - v46;
  MEMORY[0x24BDAC7A8](v45);
  v49 = (char *)&v253 - v48;
  v303 = MEMORY[0x24BEE4B00];
  v50 = a1;
  sub_2297C463C(a1, &v303);
  v295 = 0;
  v51 = *(uint8_t **)(a2 + 16);
  v296 = a2;
  v297 = v51;
  v293 = a1;
  v294 = v7;
  if (!v51)
  {
LABEL_12:
    v285 = 0;
    v287 = 0;
LABEL_13:
    v64 = sub_2297DBFD8();
    v65 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56);
    v288 = 1;
    v65(v49, 1, 1, v64);
    v55 = 0;
    goto LABEL_14;
  }
  v52 = v8;
  v53 = a2 + 32;
  swift_bridgeObjectRetain();
  v54 = v297;
  while (1)
  {
    sub_22961F9E4(v53, (uint64_t)&v299);
    sub_22961F9E4((uint64_t)&v299, (uint64_t)v298);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v299);
    v53 += 40;
    if (!--v54)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      v7 = v294;
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_229616D84(&v299, (uint64_t)&v301);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_11;
  v287 = *((_QWORD *)&v299 + 1);
  v55 = v299;
  v285 = v300;
  if (!(_QWORD)v299)
  {
    v7 = v294;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v56 = sub_2297DC284();
  if (*(_QWORD *)(v55 + 16) && (v58 = sub_22961AA90(v56, v57), (v59 & 1) != 0))
  {
    v290 = *(_QWORD *)(v55 + 56);
    v60 = v58;
    v61 = sub_2297DBFD8();
    v62 = *(_QWORD *)(v61 - 8);
    v63 = v290 + *(_QWORD *)(v62 + 72) * v60;
    v8 = v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v49, v63, v61);
    v50 = v293;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v49, 0, 1, v61);
  }
  else
  {
    v167 = sub_2297DBFD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v167 - 8) + 56))(v49, 1, 1, v167);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v288 = 0;
  v7 = v294;
LABEL_14:
  v66 = v291;
  if (qword_255A58C08 != -1)
    swift_once();
  v67 = __swift_project_value_buffer(v7, (uint64_t)qword_255A67F80);
  v68 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v283 = v67;
  v284 = v68;
  ((void (*)(char *))v68)(v66);
  sub_2297CAFD8((uint64_t)v49, (uint64_t)v47);
  v69 = sub_2297DCB3C();
  v70 = sub_2297DD160();
  v71 = os_log_type_enabled(v69, v70);
  v290 = v55;
  if (v71)
  {
    v72 = (uint8_t *)swift_slowAlloc();
    v73 = swift_slowAlloc();
    v286 = v8;
    v74 = v49;
    v75 = v73;
    v301 = (char *)v73;
    *(_DWORD *)v72 = 136315138;
    sub_2297CAFD8((uint64_t)v47, v280);
    v76 = sub_2297DCE9C();
    *(_QWORD *)&v299 = sub_22960FB78(v76, v77, (uint64_t *)&v301);
    sub_2297DD340();
    v7 = v294;
    swift_bridgeObjectRelease();
    sub_229653E64((uint64_t)v47, &qword_255A5A610);
    _os_log_impl(&dword_22960C000, v69, v70, "CompoundSignal#activeScores current foregroundBundleMap is %s", v72, 0xCu);
    swift_arrayDestroy();
    v78 = v75;
    v49 = v74;
    MEMORY[0x22E2D0294](v78, -1, -1);
    v79 = v72;
    v50 = v293;
    MEMORY[0x22E2D0294](v79, -1, -1);

    v80 = *(uint8_t **)(v286 + 8);
    ((void (*)(char *, uint64_t))v80)(v291, v7);
  }
  else
  {
    sub_229653E64((uint64_t)v47, &qword_255A5A610);

    v80 = *(uint8_t **)(v8 + 8);
    ((void (*)(char *, uint64_t))v80)(v66, v7);
  }
  sub_2297CAFD8((uint64_t)v49, (uint64_t)v42);
  v81 = sub_2297DBFD8();
  v82 = *(_QWORD *)(v81 - 8);
  v291 = *(char **)(v82 + 48);
  v83 = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))v291)(v42, 1, v81);
  v282 = v80;
  v286 = v82;
  if (v83 == 1)
  {
    sub_229653E64((uint64_t)v42, &qword_255A5A610);
LABEL_33:
    v116 = v297;
    goto LABEL_34;
  }
  v84 = *(uint64_t (**)(uint64_t *, uint64_t))(v82 + 88);
  v85 = v84(v42, v81);
  if (v85 != *MEMORY[0x24BEA6318])
  {
    (*(void (**)(uint64_t *, uint64_t))(v82 + 8))(v42, v81);
    goto LABEL_33;
  }
  v261 = v49;
  v257 = v85;
  v258 = (uint64_t (*)(uint64_t, uint64_t))v84;
  v86 = *(void (**)(uint64_t, uint64_t))(v82 + 96);
  v262 = v81;
  v256 = v86;
  v86((uint64_t)v42, v81);
  v87 = *v42;
  v88 = swift_bridgeObjectRetain();
  v89 = v295;
  v90 = sub_2297A9374(v88);
  swift_bridgeObjectRelease();
  v91 = (uint8_t *)sub_2297AC2EC((uint64_t)v90);
  v93 = v92;
  swift_release();
  v94 = sub_2297C57B4(v87);
  v295 = v89;
  swift_bridgeObjectRelease();
  v95 = sub_2297AC2EC((uint64_t)v94);
  v97 = v96;
  swift_release();
  v98 = v279;
  v284(v279, v283, v7);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v99 = sub_2297DCB3C();
  v100 = sub_2297DD160();
  v101 = os_log_type_enabled(v99, v100);
  v259 = (uint8_t *)v95;
  v260 = v91;
  if (v101)
  {
    v102 = swift_slowAlloc();
    v255 = swift_slowAlloc();
    *(_QWORD *)&v299 = v255;
    *(_DWORD *)v102 = 136315394;
    v301 = (char *)v91;
    v302 = v93;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A5D7A0);
    v103 = sub_2297DCE9C();
    v301 = (char *)sub_22960FB78(v103, v104, (uint64_t *)&v299);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    v7 = v294;
    swift_bridgeObjectRelease();
    *(_WORD *)(v102 + 12) = 2080;
    v301 = (char *)v95;
    v302 = v97;
    swift_bridgeObjectRetain();
    v105 = sub_2297DCE9C();
    v301 = (char *)sub_22960FB78(v105, v106, (uint64_t *)&v299);
    sub_2297DD340();
    v107 = v97;
    swift_bridgeObjectRelease_n();
    v50 = v293;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v99, v100, "CompoundSignal#activeScores current foregroundBundleId is %s and last foregroundBundleId is %s", (uint8_t *)v102, 0x16u);
    v108 = v255;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v108, -1, -1);
    MEMORY[0x22E2D0294](v102, -1, -1);

    v109 = v279;
  }
  else
  {

    v107 = v97;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v109 = v98;
  }
  v110 = v282;
  ((void (*)(char *, uint64_t))v282)(v109, v7);
  v82 = v286;
  if (v93)
  {
    swift_bridgeObjectRetain();
    v111 = v275;
    sub_2297DBA38();
    v112 = v260;
    sub_2297C5C4C((uint64_t)v260, v93, v111, &v303);
    v113 = *(void (**)(_BYTE *, uint64_t))(v274 + 8);
    v114 = v276;
    v113(v111, v276);
    sub_2297DBA38();
    sub_2297C5C4C((uint64_t)v112, v93, v111, &v303);
    swift_bridgeObjectRelease();
    v113(v111, v114);
    v115 = v107;
    v49 = v261;
    if (!v115)
    {
LABEL_32:
      swift_bridgeObjectRelease();
      v81 = v262;
      goto LABEL_33;
    }
    if (v112 == v259 && v93 == v115)
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    v168 = sub_2297DD658();
    swift_bridgeObjectRelease();
    if ((v168 & 1) != 0)
      goto LABEL_32;
  }
  else
  {
    v115 = v107;
    v49 = v261;
    if (!v115)
      goto LABEL_32;
  }
  v254 = v115;
  if ((v288 & 1) != 0)
  {
    v169 = v273;
    v81 = v262;
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v82 + 56))(v273, 1, 1, v262);
    v170 = v270;
  }
  else
  {
    v173 = v290;
    swift_bridgeObjectRetain();
    v174 = sub_2297DC29C();
    v81 = v262;
    v169 = v273;
    v170 = v270;
    if (*(_QWORD *)(v173 + 16) && (v176 = sub_22961AA90(v174, v175), (v177 & 1) != 0))
    {
      (*(void (**)(uint64_t *, unint64_t, uint64_t))(v82 + 16))(v169, *(_QWORD *)(v173 + 56) + *(_QWORD *)(v82 + 72) * v176, v81);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v169, 0, 1, v81);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v82 + 56))(v169, 1, 1, v81);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v284(v170, v283, v7);
  v189 = v265;
  sub_2297CAFD8((uint64_t)v169, v265);
  v190 = sub_2297DCB3C();
  v191 = sub_2297DD160();
  if (os_log_type_enabled(v190, v191))
  {
    v192 = (uint8_t *)swift_slowAlloc();
    v279 = (char *)swift_slowAlloc();
    v301 = v279;
    v260 = v192;
    *(_DWORD *)v192 = 136315138;
    sub_2297CAFD8(v189, v280);
    v193 = sub_2297DCE9C();
    *(_QWORD *)&v299 = sub_22960FB78(v193, v194, (uint64_t *)&v301);
    v82 = v286;
    v110 = v282;
    v81 = v262;
    sub_2297DD340();
    swift_bridgeObjectRelease();
    sub_229653E64(v189, &qword_255A5A610);
    v195 = v260;
    _os_log_impl(&dword_22960C000, v190, v191, "CompoundSignal#activeScores foreground recency map is %s", v260, 0xCu);
    v196 = v279;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v196, -1, -1);
    MEMORY[0x22E2D0294](v195, -1, -1);

    v197 = v270;
  }
  else
  {
    sub_229653E64(v189, &qword_255A5A610);

    v197 = v170;
  }
  ((void (*)(char *, uint64_t))v110)(v197, v7);
  v116 = v297;
  v125 = v267;
  v198 = v273;
  v199 = v266;
  sub_2297CAFD8((uint64_t)v273, v266);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v291)(v199, 1, v81) == 1)
  {
    sub_229653E64((uint64_t)v198, &qword_255A5A610);
    swift_bridgeObjectRelease();
    sub_229653E64(v199, &qword_255A5A610);
  }
  else
  {
    v200 = v258(v199, v81);
    if (v200 == v257)
    {
      v256(v199, v81);
      v201 = *(_QWORD *)v199;
      if (*(_QWORD *)(*(_QWORD *)v199 + 16))
      {
        v202 = v254;
        swift_bridgeObjectRetain();
        v203 = sub_22961AA90((uint64_t)v259, v202);
        if ((v204 & 1) != 0)
        {
          v279 = *(char **)(*(_QWORD *)(v201 + 56) + 8 * v203);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v284((char *)v125, v283, v7);
          v124 = sub_2297DCB3C();
          v205 = sub_2297DD160();
          if (os_log_type_enabled(v124, v205))
          {
            v206 = v125;
            v207 = (uint8_t *)swift_slowAlloc();
            v208 = swift_slowAlloc();
            v301 = (char *)v208;
            *(_DWORD *)v207 = 136315138;
            *(_QWORD *)&v299 = v279;
            v209 = sub_2297DD61C();
            *(_QWORD *)&v299 = sub_22960FB78(v209, v210, (uint64_t *)&v301);
            v7 = v294;
            v82 = v286;
            v211 = v282;
            sub_2297DD340();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22960C000, v124, v205, "CompoundSignal#activeScores last foreground elaspsed time is for common.foregroundAppRecency  %s", v207, 0xCu);
            swift_arrayDestroy();
            v212 = v208;
            v81 = v262;
            MEMORY[0x22E2D0294](v212, -1, -1);
            MEMORY[0x22E2D0294](v207, -1, -1);

            ((void (*)(uint64_t *, uint64_t))v211)(v206, v7);
            goto LABEL_140;
          }
          goto LABEL_139;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_229653E64((uint64_t)v273, &qword_255A5A610);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_229653E64((uint64_t)v273, &qword_255A5A610);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v199, v81);
    }
  }
LABEL_34:
  while (v116)
  {
    v82 = v81;
    v117 = v296 + 32;
    swift_bridgeObjectRetain();
    v118 = v117;
    v119 = v116;
    while (1)
    {
      sub_22961F9E4(v118, (uint64_t)&v299);
      sub_22961F9E4((uint64_t)&v299, (uint64_t)v298);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
      v81 = type metadata accessor for NowPlayingAppSignal();
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v299);
      v118 += 40;
      if (!--v119)
      {
        swift_bridgeObjectRelease();
        v50 = 0;
        goto LABEL_43;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_229616D84(&v299, (uint64_t)&v301);
    if (swift_dynamicCast())
      v50 = v299;
    else
      v50 = 0;
LABEL_43:
    swift_bridgeObjectRetain();
    v124 = 0;
    v125 = &qword_255A59B10;
    while (1)
    {
      v110 = (uint8_t *)&v124->isa + 1;
      if (__OFADD__(v124, 1))
        break;
      sub_22961F9E4(v117, (uint64_t)&v299);
      sub_22961F9E4((uint64_t)&v299, (uint64_t)&v301);
      v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        sub_229616D84(&v299, (uint64_t)&v301);
        v128 = swift_dynamicCast();
        if (v128)
          v126 = v299;
        else
          v126 = 0;
        v127 = v128 ^ 1;
LABEL_52:
        v121 = (uint64_t)v289;
        v122 = v290;
        v123 = v292;
        v81 = v82;
        v120 = (uint8_t *)v50;
        if (v50)
        {
          v116 = *(uint8_t **)(v50 + 24);
          if (v116)
          {
            if ((v127 & 1) != 0)
              goto LABEL_55;
            v296 = *(_QWORD *)(v50 + 16);
            v157 = qword_255A58DC0;
            swift_bridgeObjectRetain();
            if (v157 != -1)
              swift_once();
            v158 = sub_2296341AC(v126, qword_255A60748);
            v122 = v290;
            if (v158)
            {
              v159 = v269;
              v284(v269, v283, v7);
              swift_bridgeObjectRetain_n();
              v160 = sub_2297DCB3C();
              v161 = sub_2297DD160();
              if (os_log_type_enabled(v160, v161))
              {
                v162 = (uint8_t *)swift_slowAlloc();
                v163 = swift_slowAlloc();
                v301 = (char *)v163;
                v297 = v162;
                *(_DWORD *)v162 = 136315138;
                swift_bridgeObjectRetain();
                *(_QWORD *)&v299 = sub_22960FB78(v296, (unint64_t)v116, (uint64_t *)&v301);
                v121 = (uint64_t)v289;
                sub_2297DD340();
                swift_bridgeObjectRelease_n();
                v164 = v297;
                _os_log_impl(&dword_22960C000, v160, v161, "CompoundSignal#activeScores currently playing: %s", v297, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x22E2D0294](v163, -1, -1);
                v165 = v164;
                v123 = v292;
                MEMORY[0x22E2D0294](v165, -1, -1);

                v166 = v296;
                ((void (*)(char *, uint64_t))v282)(v269, v7);
                v81 = v82;
              }
              else
              {

                swift_bridgeObjectRelease_n();
                ((void (*)(char *, uint64_t))v282)(v159, v7);
                v81 = v82;
                v166 = v296;
              }
              swift_bridgeObjectRetain();
              v188 = v275;
              sub_2297DBA38();
              sub_2297C5C4C(v166, (uint64_t)v116, v188, &v303);
              swift_bridgeObjectRelease();
              (*(void (**)(_BYTE *, uint64_t))(v274 + 8))(v188, v276);
              v122 = v290;
            }
            else
            {
              swift_bridgeObjectRelease();
              v296 = 0;
              v116 = 0;
            }
            v82 = v286;
            v120 = (uint8_t *)v50;
LABEL_58:
            v50 = v293;
            goto LABEL_59;
          }
          v296 = 0;
        }
        else
        {
LABEL_55:
          v296 = 0;
          v116 = 0;
        }
        v82 = v286;
        goto LABEL_58;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v299);
      v124 = ((char *)v124 + 1);
      v117 += 40;
      if (v110 == v297)
      {
        swift_bridgeObjectRelease();
        v126 = 0;
        v127 = 1;
        goto LABEL_52;
      }
    }
    __break(1u);
LABEL_139:

    ((void (*)(uint64_t *, uint64_t))v110)(v125, v7);
LABEL_140:
    v244 = v263;
    v116 = v297;
    sub_2297DBA38();
    v245 = v275;
    sub_2297DB9CC();
    v246 = *(void (**)(char *, uint64_t))(v274 + 8);
    v247 = v276;
    v246(v244, v276);
    sub_2297C5C4C((uint64_t)v259, v254, v245, &v303);
    swift_bridgeObjectRelease();
    v246(v245, v247);
    sub_229653E64((uint64_t)v273, &qword_255A5A610);
    v49 = v261;
  }
  v120 = 0;
  v296 = 0;
  v121 = (uint64_t)v289;
  v122 = v290;
  v123 = v292;
LABEL_59:
  v297 = v120;
  if ((v288 & 1) != 0)
  {
    v129 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
    v129(v121, 1, 1, v81);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2297DC1D0();
    v130 = sub_2297DC1C4();
    if (*(_QWORD *)(v122 + 16) && (v132 = sub_22961AA90(v130, v131), (v133 & 1) != 0))
    {
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v82 + 16))(v121, *(_QWORD *)(v122 + 56) + *(_QWORD *)(v82 + 72) * v132, v81);
      v129 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
      v129(v121, 0, 1, v81);
    }
    else
    {
      v129 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
      v129(v121, 1, 1, v81);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v123 = v292;
  }
  sub_2297CAFD8(v121, (uint64_t)v123);
  if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v291)(v123, 1, v81) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2297CB020(v122);
    sub_229653E64((uint64_t)v123, &qword_255A5A610);
LABEL_133:
    swift_bridgeObjectRetain();
    v239 = swift_bridgeObjectRetain();
    v240 = sub_2297C624C(v239, v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v241 = sub_2297B7614(v240);
    swift_release();
    v242 = sub_229737364(v241, 1, 604800.0);
    swift_release();
    swift_release();
    sub_229653E64(v121, &qword_255A5A610);
    sub_229653E64((uint64_t)v49, &qword_255A5A610);
    swift_bridgeObjectRelease();
    return v242;
  }
  v134 = *(uint64_t (**)(uint64_t *, uint64_t))(v82 + 88);
  v135 = v134(v123, v81);
  if (v135 != *MEMORY[0x24BEA6318])
  {
    swift_bridgeObjectRelease();
    sub_2297CB020(v122);
    (*(void (**)(uint64_t *, uint64_t))(v82 + 8))(v123, v81);
    goto LABEL_133;
  }
  LODWORD(v279) = v135;
  v292 = (uint64_t *)v134;
  v136 = *(void (**)(uint64_t *, uint64_t))(v82 + 96);
  v262 = v81;
  v136(v123, v81);
  v137 = *v123;
  v138 = v278;
  v139 = v294;
  v284(v278, v283, v294);
  swift_bridgeObjectRetain_n();
  v140 = sub_2297DCB3C();
  v141 = sub_2297DD160();
  v142 = os_log_type_enabled(v140, v141);
  v273 = (uint64_t *)v136;
  if (v142)
  {
    v143 = (uint8_t *)swift_slowAlloc();
    v144 = swift_slowAlloc();
    v301 = (char *)v144;
    v261 = v49;
    *(_DWORD *)v143 = 136315138;
    v270 = (char *)(v143 + 4);
    swift_bridgeObjectRetain();
    v145 = sub_2297DCD94();
    v147 = v146;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v299 = sub_22960FB78(v145, v147, (uint64_t *)&v301);
    v49 = v261;
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    v121 = (uint64_t)v289;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v140, v141, "CompoundSignal#activeScores last now playing map is %s", v143, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v144, -1, -1);
    MEMORY[0x22E2D0294](v143, -1, -1);

    v148 = v278;
    v149 = v294;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v148 = v138;
    v149 = v139;
  }
  ((void (*)(char *, uint64_t))v282)(v148, v149);
  v150 = v295;
  v151 = (uint64_t)v277;
  v152 = sub_2297A9374(v137);
  v295 = v150;
  swift_bridgeObjectRelease();
  v153 = sub_2297AC2EC((uint64_t)v152);
  v155 = v154;
  swift_release();
  if (!v155)
  {
    swift_bridgeObjectRelease();
    sub_2297CB020(v290);
LABEL_132:
    v50 = v293;
    goto LABEL_133;
  }
  v156 = v272;
  if (v116)
  {
    if (v153 == v296 && (uint8_t *)v155 == v116)
    {
      swift_bridgeObjectRelease();
LABEL_92:
      sub_2297CB020(v290);
LABEL_93:
      swift_bridgeObjectRelease();
      goto LABEL_132;
    }
    v171 = sub_2297DD658();
    swift_bridgeObjectRelease();
    if ((v171 & 1) != 0)
      goto LABEL_92;
  }
  v296 = v153;
  if ((v288 & 1) != 0)
  {
    v172 = (uint64_t)v271;
    v129((uint64_t)v271, 1, 1, v262);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2297DC2E4();
    v178 = sub_2297DC2D8();
    v180 = v290;
    if (*(_QWORD *)(v290 + 16) && (v181 = sub_22961AA90(v178, v179), (v182 & 1) != 0))
    {
      v183 = v271;
      v184 = v262;
      (*(void (**)(char *, unint64_t, uint64_t))(v286 + 16))(v271, *(_QWORD *)(v180 + 56) + *(_QWORD *)(v286 + 72) * v181, v262);
      v185 = v183;
      v186 = 0;
      v187 = v184;
    }
    else
    {
      v183 = v271;
      v185 = v271;
      v186 = 1;
      v187 = v262;
    }
    v129((uint64_t)v185, v186, 1, v187);
    v172 = (uint64_t)v183;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v213 = v294;
  v284(v156, v283, v294);
  sub_2297CAFD8(v172, v151);
  v214 = sub_2297DCB3C();
  v215 = v156;
  v216 = sub_2297DD160();
  if (os_log_type_enabled(v214, v216))
  {
    v217 = (uint8_t *)swift_slowAlloc();
    v218 = swift_slowAlloc();
    v301 = (char *)v218;
    *(_DWORD *)v217 = 136315138;
    sub_2297CAFD8(v151, v280);
    v219 = sub_2297DCE9C();
    *(_QWORD *)&v299 = sub_22960FB78(v219, v220, (uint64_t *)&v301);
    v121 = (uint64_t)v289;
    sub_2297DD340();
    v213 = v294;
    swift_bridgeObjectRelease();
    sub_229653E64(v151, &qword_255A5A610);
    _os_log_impl(&dword_22960C000, v214, v216, "CompoundSignal#activeScores last playing recency map is %s", v217, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v218, -1, -1);
    v221 = v217;
    v172 = (uint64_t)v271;
    MEMORY[0x22E2D0294](v221, -1, -1);

    v222 = v272;
  }
  else
  {
    sub_229653E64(v151, &qword_255A5A610);

    v222 = v215;
  }
  v223 = v282;
  ((void (*)(char *, uint64_t))v282)(v222, v213);
  v224 = v268;
  v225 = v264;
  sub_2297CAFD8(v172, (uint64_t)v264);
  v226 = v262;
  if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v291)(v225, 1, v262) == 1)
  {
    sub_229653E64(v172, &qword_255A5A610);
    swift_bridgeObjectRelease();
    v227 = (uint64_t)v225;
LABEL_124:
    sub_229653E64(v227, &qword_255A5A610);
    goto LABEL_132;
  }
  v228 = ((uint64_t (*)(uint64_t *, uint64_t))v292)(v225, v226);
  if (v228 != (_DWORD)v279)
  {
    sub_229653E64(v172, &qword_255A5A610);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *, uint64_t))(v286 + 8))(v225, v226);
    goto LABEL_132;
  }
  ((void (*)(uint64_t *, uint64_t))v273)(v225, v226);
  v229 = *v225;
  if (!*(_QWORD *)(v229 + 16))
  {
LABEL_137:
    swift_bridgeObjectRelease();
    sub_229653E64(v172, &qword_255A5A610);
    goto LABEL_93;
  }
  swift_bridgeObjectRetain();
  v230 = sub_22961AA90(v296, v155);
  if ((v231 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_137;
  }
  v232 = *(_QWORD *)(*(_QWORD *)(v229 + 56) + 8 * v230);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v284(v224, v283, v213);
  v233 = sub_2297DCB3C();
  v234 = sub_2297DD160();
  if (os_log_type_enabled(v233, v234))
  {
    v235 = (uint8_t *)swift_slowAlloc();
    v236 = swift_slowAlloc();
    v301 = (char *)v236;
    *(_DWORD *)v235 = 136315138;
    *(_QWORD *)&v299 = v232;
    v237 = sub_2297DD61C();
    *(_QWORD *)&v299 = sub_22960FB78(v237, v238, (uint64_t *)&v301);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v233, v234, "CompoundSignal#activeScores last playing elaspsed time is for raw.LastNowPlayingRecency  %s", v235, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v236, -1, -1);
    MEMORY[0x22E2D0294](v235, -1, -1);

    ((void (*)(char *, uint64_t))v282)(v268, v294);
  }
  else
  {

    ((void (*)(char *, uint64_t))v223)(v224, v213);
  }
  v121 = (uint64_t)v289;
  v248 = v263;
  result = sub_2297DBA38();
  if (!__OFSUB__(0, v232))
  {
    v249 = v275;
    sub_2297DB9CC();
    v250 = *(void (**)(char *, uint64_t))(v274 + 8);
    v251 = v248;
    v252 = v276;
    v250(v251, v276);
    sub_2297C5C4C(v296, v155, v249, &v303);
    swift_bridgeObjectRelease();
    v250(v249, v252);
    v227 = (uint64_t)v271;
    goto LABEL_124;
  }
  __break(1u);
  return result;
}

uint64_t sub_2297C867C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  id v56;
  id v57;
  void *v58;
  _QWORD *v59;
  double v60;
  double v61;
  double v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t inited;
  unint64_t v90;
  unint64_t v91;
  char v92;
  double v93;
  unint64_t v94;
  char v95;
  double v96;
  unint64_t v97;
  char v98;
  double v99;
  char *v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(char *, uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  char *v120;
  void (*v121)(char *, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124[14];
  uint64_t v125;
  uint64_t v126[6];
  __int128 v127;
  uint64_t v128[5];
  uint64_t v129;
  uint64_t v130;
  uint64_t v131[2];

  v118 = a1;
  v5 = sub_2297DCB54();
  v121 = *(void (**)(char *, uint64_t))(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v120 = (char *)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v111 - v9;
  v130 = MEMORY[0x24BEE4B00];
  v131[0] = MEMORY[0x24BEE4B00];
  v129 = MEMORY[0x24BEE4B00];
  v11 = *(_QWORD *)(a3 + 16);
  v119 = v8;
  if (v11)
  {
    v12 = a2;
    v13 = (char *)&v111 - v9;
    v14 = a3 + 32;
    swift_bridgeObjectRetain();
    v15 = v11;
    while (1)
    {
      sub_22961F9E4(v14, (uint64_t)&v127);
      sub_22961F9E4((uint64_t)&v127, (uint64_t)v128);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
      v14 += 40;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_229616D84(&v127, (uint64_t)v128);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = v127;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
LABEL_9:
    v16 = 0;
LABEL_10:
    v10 = v13;
    a2 = v12;
    v5 = v119;
  }
  else
  {
    v16 = 0;
  }
  swift_bridgeObjectRetain();
  sub_2297C5A50(a2, v16, v131, &v130, &v129);
  swift_bridgeObjectRelease_n();
  v17 = swift_bridgeObjectRetain();
  v18 = sub_22963AE40(v17, 0, 0);
  swift_bridgeObjectRelease();
  v131[0] = v18;
  swift_bridgeObjectRelease();
  v19 = swift_bridgeObjectRetain();
  v20 = sub_22963AE40(v19, 0, 0);
  swift_bridgeObjectRelease();
  v130 = v20;
  swift_bridgeObjectRelease();
  v21 = swift_bridgeObjectRetain();
  v22 = sub_22963AE40(v21, 0, 0);
  swift_bridgeObjectRelease();
  v129 = v22;
  swift_bridgeObjectRelease();
  v117 = a2;
  if (v11)
  {
    v23 = a3 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_22961F9E4(v23, (uint64_t)&v127);
      sub_22961F9E4((uint64_t)&v127, (uint64_t)v126);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
      type metadata accessor for NowPlayingUsageSignal();
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v127);
      v23 += 40;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_229616D84(&v127, (uint64_t)v128);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v25 = v127;
      v26 = *(_QWORD *)(v127 + 16);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v128[0] = v131[0];
      v131[0] = 0x8000000000000000;
      sub_2296300F0(v26, (uint64_t)sub_229630A08, 0, isUniquelyReferenced_nonNull_native, v128);
      v131[0] = v128[0];
      swift_bridgeObjectRelease();
      v28 = *(_QWORD *)(v25 + 24);
      swift_bridgeObjectRetain();
      v29 = swift_isUniquelyReferenced_nonNull_native();
      v128[0] = v130;
      v130 = 0x8000000000000000;
      sub_2296300F0(v28, (uint64_t)sub_229630A08, 0, v29, v128);
      v130 = v128[0];
      swift_bridgeObjectRelease();
      v30 = *(_QWORD *)(v25 + 32);
      swift_bridgeObjectRetain();
      v31 = swift_isUniquelyReferenced_nonNull_native();
      v128[0] = v129;
      v129 = 0x8000000000000000;
      sub_2296300F0(v30, (uint64_t)sub_229630A08, 0, v31, v128);
      v129 = v128[0];
      v24 = v121;
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = v121;
    }
  }
  else
  {
LABEL_16:
    v24 = v121;
  }
  v32 = swift_bridgeObjectRetain();
  v33 = sub_22963AE40(v32, 0, 0);
  swift_bridgeObjectRelease();
  v131[0] = v33;
  swift_bridgeObjectRelease();
  v34 = swift_bridgeObjectRetain();
  v35 = sub_22963AE40(v34, 0, 0);
  swift_bridgeObjectRelease();
  v130 = v35;
  swift_bridgeObjectRelease();
  v36 = swift_bridgeObjectRetain();
  v37 = sub_22963AE40(v36, 0, 0);
  swift_bridgeObjectRelease();
  v129 = v37;
  swift_bridgeObjectRelease();
  if (qword_255A58C08 != -1)
    swift_once();
  v38 = __swift_project_value_buffer(v5, (uint64_t)qword_255A67F80);
  v39 = (void (*)(char *))*((_QWORD *)v24 + 2);
  v114 = v38;
  v39(v10);
  v40 = v5;
  v41 = sub_2297DCB3C();
  v42 = sub_2297DD160();
  v43 = os_log_type_enabled(v41, v42);
  v115 = (void (*)(char *, uint64_t, uint64_t))v39;
  v116 = 0;
  if (v43)
  {
    v44 = swift_slowAlloc();
    v113 = swift_slowAlloc();
    v128[0] = v113;
    *(_DWORD *)v44 = 136315650;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v45 = sub_2297DCD94();
    v112 = v10;
    v47 = v46;
    swift_bridgeObjectRelease();
    v126[0] = sub_22960FB78(v45, v47, v128);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v48 = sub_2297DCD94();
    v50 = v49;
    swift_bridgeObjectRelease();
    v122 = sub_22960FB78(v48, v50, v128);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 22) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v51 = sub_2297DCD94();
    v53 = v52;
    swift_bridgeObjectRelease();
    v125 = sub_22960FB78(v51, v53, v128);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v41, v42, "CompoundSignal#mediaTypeAffinityScores app-affinity for music:%s podcasts:%s books:%s", (uint8_t *)v44, 0x20u);
    v54 = v113;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v54, -1, -1);
    MEMORY[0x22E2D0294](v44, -1, -1);

    v55 = (void (*)(char *, uint64_t))*((_QWORD *)v121 + 1);
    v55(v112, v40);
  }
  else
  {

    v55 = (void (*)(char *, uint64_t))*((_QWORD *)v24 + 1);
    v55(v10, v40);
  }
  v56 = v118;
  v57 = objc_msgSend(v118, sel_mediaSearch);
  if (!v57)
  {
    v60 = 0.7;
    v61 = 0.2;
    v62 = 0.1;
    goto LABEL_41;
  }
  v58 = v57;
  v59 = objc_msgSend(v57, sel_mediaType);

  if (qword_255A58DD0 != -1)
    goto LABEL_79;
  while (1)
  {
    if (sub_229633FF8((uint64_t)v59, qword_255A60758))
      v60 = 2.7;
    else
      v60 = 0.7;
    if (qword_255A58DD8 != -1)
      swift_once();
    if (sub_229633FF8((uint64_t)v59, qword_255A60760))
      v61 = 2.2;
    else
      v61 = 0.2;
    if (qword_255A58DE0 != -1)
      swift_once();
    if (sub_229633FF8((uint64_t)v59, qword_255A60768))
      v62 = 2.1;
    else
      v62 = 0.1;
LABEL_41:
    v63 = objc_msgSend(v56, sel_mediaSearch);
    if (v63)
    {
      v64 = v63;
      v65 = objc_msgSend(v63, sel_albumName);

      if (v65)
      {
        v66 = sub_2297DCE60();
        v68 = v67;

        swift_bridgeObjectRelease();
        v69 = HIBYTE(v68) & 0xF;
        if ((v68 & 0x2000000000000000) == 0)
          v69 = v66 & 0xFFFFFFFFFFFFLL;
        if (v69)
          v60 = v60 + 1.0;
      }
    }
    v70 = objc_msgSend(v56, sel_mediaSearch);
    if (v70)
    {
      v71 = v70;
      v72 = objc_msgSend(v70, sel_genreNames);

      if (v72)
      {
        v73 = sub_2297DCFD4();

        v74 = *(_QWORD *)(v73 + 16);
        swift_bridgeObjectRelease();
        if (v74)
          v60 = v60 + 1.0;
      }
    }
    v75 = objc_msgSend(v56, sel_mediaSearch);
    if (v75)
    {
      v76 = v75;
      v77 = objc_msgSend(v75, sel_moodNames);

      if (v77)
      {
        v78 = sub_2297DCFD4();

        v79 = *(_QWORD *)(v78 + 16);
        swift_bridgeObjectRelease();
        if (v79)
          v60 = v60 + 1.0;
      }
    }
    v80 = objc_msgSend(v56, sel_mediaSearch);
    v81 = objc_msgSend(v80, sel_releaseDate);

    if (v81)
      v60 = v60 + 1.0;
    v82 = objc_msgSend(v56, sel_mediaSearch);
    if (v82)
    {
      v83 = v82;
      v84 = objc_msgSend(v82, sel_artistName);

      if (v84)
      {
        v85 = sub_2297DCE60();
        v87 = v86;

        swift_bridgeObjectRelease();
        v88 = HIBYTE(v87) & 0xF;
        if ((v87 & 0x2000000000000000) == 0)
          v88 = v85 & 0xFFFFFFFFFFFFLL;
        if (v88)
        {
          v60 = v60 + 0.4;
          v61 = v61 + 0.2;
          v62 = v62 + 0.1;
        }
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A5A478);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2297DF340;
    *(_QWORD *)(inited + 32) = 0x636973756DLL;
    *(_QWORD *)(inited + 40) = 0xE500000000000000;
    *(double *)(inited + 48) = v60;
    *(_QWORD *)(inited + 56) = 0x74736163646F70;
    *(_QWORD *)(inited + 64) = 0xE700000000000000;
    *(double *)(inited + 72) = v61;
    *(_QWORD *)(inited + 80) = 1802465122;
    *(_QWORD *)(inited + 88) = 0xE400000000000000;
    *(double *)(inited + 96) = v62;
    v90 = sub_2296F9ED8(inited);
    v59 = (_QWORD *)sub_22963AE40(v90, 0, 0);
    swift_bridgeObjectRelease();
    v125 = (uint64_t)v59;
    if (!v59[2])
    {
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
    v91 = sub_22961AA90(0x636973756DLL, 0xE500000000000000);
    if ((v92 & 1) == 0)
      goto LABEL_74;
    if (!v59[2])
      goto LABEL_75;
    v93 = *(double *)(v59[7] + 8 * v91);
    v94 = sub_22961AA90(0x74736163646F70, 0xE700000000000000);
    if ((v95 & 1) == 0)
      goto LABEL_76;
    if (!v59[2])
      goto LABEL_77;
    v96 = *(double *)(v59[7] + 8 * v94);
    v97 = sub_22961AA90(1802465122, 0xE400000000000000);
    if ((v98 & 1) != 0)
      break;
LABEL_78:
    __break(1u);
LABEL_79:
    swift_once();
  }
  v99 = *(double *)(v59[7] + 8 * v97);
  v100 = v120;
  v115(v120, v114, v40);
  v101 = sub_2297DCB3C();
  v102 = sub_2297DD160();
  if (os_log_type_enabled(v101, v102))
  {
    v103 = (uint8_t *)swift_slowAlloc();
    v104 = swift_slowAlloc();
    v124[0] = v104;
    *(_DWORD *)v103 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v105 = sub_2297DCD94();
    v121 = v55;
    v107 = v106;
    swift_bridgeObjectRelease();
    v123 = sub_22960FB78(v105, v107, v124);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v101, v102, "CompoundSignal#mediaTypeAffinityScores input-affinity: %s", v103, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v104, -1, -1);
    MEMORY[0x22E2D0294](v103, -1, -1);

    v121(v120, v119);
  }
  else
  {

    v55(v100, v40);
  }
  v124[0] = MEMORY[0x24BEE4B00];
  sub_2297C4A4C(v117, v124, v131, &v130, &v129, v93, v96, v99);
  v108 = swift_bridgeObjectRetain();
  v109 = sub_22963AE40(v108, 0, 0);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v109;
}

uint64_t sub_2297C94F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;

  v29 = (unint64_t *)result;
  v30 = 0;
  v8 = 0;
  v11 = *(_QWORD *)(a3 + 56);
  v9 = a3 + 56;
  v10 = v11;
  v12 = 1 << *(_BYTE *)(v9 - 24);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = a5 & 1;
  v15 = v13 & v10;
  v31 = v9;
  v32 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v19 = v18 | (v8 << 6);
      goto LABEL_20;
    }
    v20 = __OFADD__(v8++, 1);
    if (v20)
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v8 >= v32)
      goto LABEL_31;
    v21 = *(_QWORD *)(v31 + 8 * v8);
    if (!v21)
      break;
LABEL_19:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_20:
    v23 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v19);
    v24 = v23[1];
    if (!*(_QWORD *)(a6 + 16))
    {
      swift_bridgeObjectRetain();
LABEL_5:
      v16 = MEMORY[0x24BEE4AF8];
      goto LABEL_6;
    }
    v25 = *v23;
    swift_bridgeObjectRetain_n();
    v26 = sub_22961AA90(v25, v24);
    if ((v27 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a6 + 56) + 8 * v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_6:
    v17 = sub_2297AAA30(a4, v14, v16);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v29 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = __OFADD__(v30++, 1);
      if (v20)
      {
        __break(1u);
LABEL_31:
        swift_retain();
        return sub_22961C1FC(v29, a2, v30, a3);
      }
    }
  }
  v22 = v8 + 1;
  if (v8 + 1 >= v32)
    goto LABEL_31;
  v21 = *(_QWORD *)(v31 + 8 * v22);
  if (v21)
    goto LABEL_18;
  v22 = v8 + 2;
  if (v8 + 2 >= v32)
    goto LABEL_31;
  v21 = *(_QWORD *)(v31 + 8 * v22);
  if (v21)
    goto LABEL_18;
  v22 = v8 + 3;
  if (v8 + 3 >= v32)
    goto LABEL_31;
  v21 = *(_QWORD *)(v31 + 8 * v22);
  if (v21)
  {
LABEL_18:
    v8 = v22;
    goto LABEL_19;
  }
  while (1)
  {
    v8 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v8 >= v32)
      goto LABEL_31;
    v21 = *(_QWORD *)(v31 + 8 * v8);
    ++v22;
    if (v21)
      goto LABEL_19;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2297C974C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  char v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  size_t v12;
  uint64_t isStackAllocationSafe;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3 & 1;
  v9 = *(_BYTE *)(a1 + 32);
  v10 = v9 & 0x3F;
  v11 = (unint64_t)((1 << v9) + 63) >> 6;
  v12 = 8 * v11;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v10 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    swift_bridgeObjectRetain();
    v14 = sub_2297C94F0((uint64_t)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v11, a1, a2, v8, a4);
    swift_release();
    swift_bridgeObjectRelease();
    if (v4)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = (void *)swift_slowAlloc();
    bzero(v15, v12);
    swift_bridgeObjectRetain();
    v14 = sub_2297C94F0((uint64_t)v15, v11, a1, a2, v8, a4);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x22E2D0294](v15, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v14;
}

uint64_t sub_2297C9930(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char *v36;
  char v37[40];
  __int128 v38;
  uint64_t v39;
  BOOL v40;

  v6 = sub_2297DCB54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v36 = v9;
  if (v10)
  {
    v11 = a3 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_22961F9E4(v11, (uint64_t)&v38);
      sub_22961F9E4((uint64_t)&v38, (uint64_t)v37);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
      v11 += 40;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_229616D84(&v38, (uint64_t)&v39);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = v38;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = v36;
      goto LABEL_10;
    }
LABEL_8:
    v9 = v36;
  }
  v12 = sub_2296F9B08(MEMORY[0x24BEE4AF8]);
LABEL_10:
  v13 = objc_msgSend(a1, sel_mediaSearch);
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, sel_mediaType);

  }
  else
  {
    v15 = 0;
  }
  if (qword_255A58C08 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v6, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_bridgeObjectRetain_n();
  v17 = sub_2297DCB3C();
  v18 = sub_2297DD160();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v35 = v15;
    v20 = v19;
    v21 = swift_slowAlloc();
    v33 = v6;
    v22 = v21;
    *(_QWORD *)&v38 = v21;
    *(_DWORD *)v20 = 136315394;
    v32 = v7;
    v39 = (uint64_t)v35;
    v40 = v14 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A5D330);
    v23 = sub_2297DCE9C();
    v39 = sub_22960FB78(v23, v24, (uint64_t *)&v38);
    v34 = a2;
    sub_2297DD340();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59550);
    v25 = sub_2297DCD94();
    v27 = v26;
    swift_bridgeObjectRelease();
    v39 = sub_22960FB78(v25, v27, (uint64_t *)&v38);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v17, v18, "CompoundSignal#supportFlag computing for mediaType:%s and categories:%s...", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v22, -1, -1);
    v28 = v20;
    v15 = v35;
    MEMORY[0x22E2D0294](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v36, v33);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v29 = swift_bridgeObjectRetain();
  v30 = sub_2297C974C(v29, (uint64_t)v15, v14 == 0, v12);
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_2297C9DA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _BYTE v6[40];
  __int128 v7;
  _BYTE v8[40];

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    goto LABEL_8;
  v2 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_22961F9E4(v2, (uint64_t)&v7);
    sub_22961F9E4((uint64_t)&v7, (uint64_t)v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
    v2 += 40;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_229616D84(&v7, (uint64_t)v8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    v3 = sub_2296F9B08(MEMORY[0x24BEE4AF8]);
  }
  v4 = sub_2297AAE74(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2297C9EE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  _BYTE v33[40];
  __int128 v34;
  unint64_t v35;
  _BYTE v36[48];

  v9 = *(_QWORD *)(a2 + 16);
  if (!v9)
    goto LABEL_8;
  v10 = a2 + 32;
  swift_bridgeObjectRetain();
  v11 = v9;
  while (1)
  {
    sub_22961F9E4(v10, (uint64_t)&v34);
    sub_22961F9E4((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v10 += 40;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_229616D84(&v34, (uint64_t)v36);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v12 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_8:
    v12 = sub_2296F9B08(MEMORY[0x24BEE4AF8]);
  }
  v13 = sub_22970CF14(v12);
  if (!v9)
    goto LABEL_16;
  v14 = a2 + 32;
  swift_bridgeObjectRetain();
  v15 = v9;
  while (1)
  {
    sub_22961F9E4(v14, (uint64_t)&v34);
    sub_22961F9E4((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    type metadata accessor for EntitySearchSignalLocal();
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v14 += 40;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_229616D84(&v34, (uint64_t)v36);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v16 = *(_QWORD *)(v34 + 16);
    swift_bridgeObjectRetain();
    swift_release();
  }
  else
  {
LABEL_16:
    v16 = sub_2296F9ED8(MEMORY[0x24BEE4AF8]);
    if (!v9)
      goto LABEL_23;
  }
  v17 = a2 + 32;
  swift_bridgeObjectRetain();
  v18 = v9;
  while (1)
  {
    sub_22961F9E4(v17, (uint64_t)&v34);
    sub_22961F9E4((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    type metadata accessor for LastNowPlayingSignal();
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v17 += 40;
    if (!--v18)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_229616D84(&v34, (uint64_t)v36);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    v19 = sub_2296F9ED8(MEMORY[0x24BEE4AF8]);
    if (!v9)
      goto LABEL_30;
    goto LABEL_24;
  }
  v19 = *(_QWORD *)(v34 + 48);
  swift_bridgeObjectRetain();
  swift_release();
LABEL_24:
  v20 = a2 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_22961F9E4(v20, (uint64_t)&v34);
    sub_22961F9E4((uint64_t)&v34, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A59B10);
    type metadata accessor for ForegroundAppSignal();
    if (swift_dynamicCast())
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    v20 += 40;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_229616D84(&v34, (uint64_t)v36);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v21 = *(_QWORD *)(v34 + 24);
    v22 = *(_QWORD *)(v34 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_31;
  }
LABEL_30:
  v21 = 0;
  v22 = 0;
LABEL_31:
  v23 = objc_msgSend(a1, sel_mediaSearch);
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, sel_mediaType);

  }
  else
  {
    v25 = 0;
  }
  v26 = sub_2297AB5D4(v13, a3, a4, a5, (uint64_t)v25, a6, v16, a7, v19, v21, v22, (uint64_t)&unk_24F261908);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_2297CA3A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  void (*v7)(char *, uint64_t);
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint8_t *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(char *, uint64_t);
  char *v112;
  uint64_t v113;
  uint64_t result;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void (*v135)(char *);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138[3];

  v134 = a1;
  v122 = a4;
  v6 = sub_2297DCB54();
  v7 = *(void (**)(char *, uint64_t))(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v129 = (char *)&v117 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v126 = (char *)&v117 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v124 = (char *)&v117 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v132 = (uint64_t)&v117 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v123 = (char *)&v117 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v117 - v18;
  v121 = sub_2297DBA44();
  v120 = *(_QWORD *)(v121 - 8);
  v20 = MEMORY[0x24BDAC7A8](v121);
  v119 = (char *)&v117 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v118 = (char *)&v117 - v22;
  sub_2297DBA38();
  v133 = a2;
  v23 = sub_2297C6400(a2, a3);
  sub_2296CF520(v23);
  v25 = v24;
  swift_bridgeObjectRelease();
  if (qword_255A58C08 != -1)
    swift_once();
  v26 = __swift_project_value_buffer(v6, (uint64_t)qword_255A67F80);
  v135 = (void (*)(char *))*((_QWORD *)v7 + 2);
  v136 = v26;
  v135(v19);
  swift_retain_n();
  v27 = sub_2297DCB3C();
  v28 = sub_2297DD160();
  v29 = os_log_type_enabled(v27, v28);
  v130 = v6;
  v131 = v7;
  v127 = a3;
  v128 = v25;
  if (v29)
  {
    v125 = 0;
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v138[0] = v31;
    *(_DWORD *)v30 = 136315138;
    swift_retain();
    v32 = sub_2297DCD94();
    v34 = v33;
    swift_release();
    v137 = sub_22960FB78(v32, v34, v138);
    v35 = v130;
    sub_2297DD340();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v27, v28, "CompoundSignal#signal compoundActiveScores: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v31, -1, -1);
    v36 = v30;
    a3 = v127;
    MEMORY[0x22E2D0294](v36, -1, -1);

    v37 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
    v6 = v35;
    v37(v19, v35);
  }
  else
  {

    swift_release_n();
    v37 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
    v37(v19, v6);
  }
  v38 = sub_2297C867C(v134, v133, a3);
  sub_2296CF520(v38);
  v40 = v39;
  swift_bridgeObjectRelease();
  v41 = v123;
  ((void (*)(char *, uint64_t, uint64_t))v135)(v123, v136, v6);
  swift_retain_n();
  v42 = sub_2297DCB3C();
  v43 = sub_2297DD160();
  v44 = os_log_type_enabled(v42, v43);
  v131 = v37;
  v125 = v40;
  if (v44)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    v138[0] = v46;
    *(_DWORD *)v45 = 136315138;
    swift_retain();
    v47 = sub_2297DCD94();
    v49 = v48;
    swift_release();
    v50 = v47;
    a3 = v127;
    v137 = sub_22960FB78(v50, v49, v138);
    v51 = v130;
    sub_2297DD340();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v42, v43, "CompoundSignal#signal compoundAffinityScores: %s", v45, 0xCu);
    swift_arrayDestroy();
    v52 = v46;
    v37 = v131;
    MEMORY[0x22E2D0294](v52, -1, -1);
    MEMORY[0x22E2D0294](v45, -1, -1);

    v53 = v123;
    v6 = v51;
    v54 = v51;
  }
  else
  {

    swift_release_n();
    v53 = v41;
    v54 = v6;
  }
  v37(v53, v54);
  v55 = v132;
  v56 = sub_2297C9930(v134, v133, a3);
  ((void (*)(uint64_t, uint64_t, uint64_t))v135)(v55, v136, v6);
  swift_bridgeObjectRetain_n();
  v57 = sub_2297DCB3C();
  v58 = sub_2297DD160();
  v59 = os_log_type_enabled(v57, v58);
  v133 = v56;
  if (v59)
  {
    v60 = (uint8_t *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    v138[0] = v61;
    *(_DWORD *)v60 = 136315138;
    swift_bridgeObjectRetain();
    v62 = sub_2297DD0DC();
    v64 = v63;
    swift_bridgeObjectRelease();
    v65 = v62;
    v56 = v133;
    v137 = sub_22960FB78(v65, v64, v138);
    v66 = v130;
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v57, v58, "CompoundSignal#signal supportFlag: %s", v60, 0xCu);
    swift_arrayDestroy();
    v67 = v61;
    v37 = v131;
    MEMORY[0x22E2D0294](v67, -1, -1);
    MEMORY[0x22E2D0294](v60, -1, -1);

    v68 = v132;
    v6 = v66;
    v69 = v66;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v68 = v55;
    v69 = v6;
  }
  v37((char *)v68, v69);
  v70 = v124;
  v71 = sub_2297C9DA0(a3);
  ((void (*)(char *, uint64_t, uint64_t))v135)(v70, v136, v6);
  swift_bridgeObjectRetain_n();
  v72 = sub_2297DCB3C();
  v73 = sub_2297DD160();
  v74 = os_log_type_enabled(v72, v73);
  v132 = v71;
  if (v74)
  {
    v75 = (uint8_t *)swift_slowAlloc();
    v76 = swift_slowAlloc();
    v138[0] = v76;
    *(_DWORD *)v75 = 136315138;
    swift_bridgeObjectRetain();
    v77 = sub_2297DD0DC();
    v79 = v78;
    swift_bridgeObjectRelease();
    v80 = v77;
    v71 = v132;
    v137 = sub_22960FB78(v80, v79, v138);
    v56 = v133;
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v72, v73, "CompoundSignal#signal unicornFlag: %s", v75, 0xCu);
    swift_arrayDestroy();
    v81 = v76;
    v37 = v131;
    MEMORY[0x22E2D0294](v81, -1, -1);
    MEMORY[0x22E2D0294](v75, -1, -1);

    v82 = v124;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v82 = v70;
  }
  v37(v82, v6);
  v83 = v126;
  swift_bridgeObjectRetain();
  v84 = sub_229629250(v71, v56);
  ((void (*)(char *, uint64_t, uint64_t))v135)(v83, v136, v6);
  swift_retain_n();
  v85 = sub_2297DCB3C();
  v86 = sub_2297DD160();
  if (os_log_type_enabled(v85, v86))
  {
    v87 = (uint8_t *)swift_slowAlloc();
    v88 = swift_slowAlloc();
    v138[0] = v88;
    *(_DWORD *)v87 = 136315138;
    swift_retain();
    v89 = sub_2297DD0DC();
    v91 = v90;
    swift_release();
    v137 = sub_22960FB78(v89, v91, v138);
    sub_2297DD340();
    swift_release_n();
    a3 = v127;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v85, v86, "CompoundSignal#signal supportUnicornMatch: %s", v87, 0xCu);
    swift_arrayDestroy();
    v92 = v88;
    v37 = v131;
    MEMORY[0x22E2D0294](v92, -1, -1);
    v93 = v87;
    v56 = v133;
    MEMORY[0x22E2D0294](v93, -1, -1);

    v94 = v126;
  }
  else
  {

    swift_release_n();
    v94 = v83;
  }
  v37(v94, v6);
  v96 = v128;
  v95 = v129;
  v97 = v125;
  v98 = sub_2297C9EE8(v134, a3, v56, v132, v84, v125, v128);
  ((void (*)(char *, uint64_t, uint64_t))v135)(v95, v136, v6);
  swift_bridgeObjectRetain_n();
  v99 = sub_2297DCB3C();
  v100 = sub_2297DD160();
  if (os_log_type_enabled(v99, v100))
  {
    v101 = (uint8_t *)swift_slowAlloc();
    v102 = swift_slowAlloc();
    v138[0] = v102;
    *(_DWORD *)v101 = 136315138;
    swift_bridgeObjectRetain();
    v103 = sub_2297DCD94();
    v105 = v104;
    swift_bridgeObjectRelease();
    v137 = sub_22960FB78(v103, v105, v138);
    v96 = v128;
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v99, v100, "CompoundSignal#signal vq21: %s", v101, 0xCu);
    swift_arrayDestroy();
    v106 = v102;
    v97 = v125;
    MEMORY[0x22E2D0294](v106, -1, -1);
    MEMORY[0x22E2D0294](v101, -1, -1);

    v131(v129, v130);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v37(v95, v6);
  }
  v107 = v119;
  sub_2297DBA38();
  v108 = v118;
  sub_2297DB9C0();
  v110 = v109;
  v111 = *(void (**)(char *, uint64_t))(v120 + 8);
  v112 = v107;
  v113 = v121;
  v111(v112, v121);
  result = ((uint64_t (*)(char *, uint64_t))v111)(v108, v113);
  v115 = v122;
  *v122 = v96;
  v115[1] = v97;
  v116 = v132;
  v115[2] = v133;
  v115[3] = v116;
  v115[4] = v84;
  v115[5] = v98;
  v115[6] = v110;
  return result;
}

uint64_t sub_2297CAFD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5A610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2297CB020(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for CompoundSignal()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CompoundSignal(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CompoundSignal(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for CompoundSignal(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for CompoundSignal()
{
  return &type metadata for CompoundSignal;
}

id privateMediaItemDataFromBacking(recommendationId:assetInfo:subItemIdentifiers:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, NSObject *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint8_t *a7)
{
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  id v20;
  unint64_t v26;

  v7 = a7;
  v8 = a6;
  v9 = a4;
  v10 = a3;
  if (a5)
  {
    v26 = MEMORY[0x24BEE4AF8];
    v14 = *(_QWORD *)(a5 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain_n();
      v15 = a5 + 40;
      do
      {
        v16 = objc_allocWithZone(MEMORY[0x24BDD9E70]);
        swift_bridgeObjectRetain();
        v17 = (void *)sub_2297DCE48();
        swift_bridgeObjectRelease();
        v18 = objc_msgSend(v16, sel_initWithIdentifier_assetInfo_, v17, 0);

        if (v18)
        {
          MEMORY[0x22E2CF1CC]();
          if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_2297DCFF8();
          sub_2297DD028();
          sub_2297DCFEC();
        }
        v15 += 16;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      v7 = a7;
      v19 = v26;
      v9 = a4;
      v8 = a6;
      v10 = a3;
    }
    else
    {
      swift_bridgeObjectRetain();
      v19 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
  }
  v20 = privateMediaItemDataFromBacking(recommendationId:assetInfo:mediaSubItems:sharedUserIdFromPlayableMusicAccount:)(a1, a2, v10, v9, v19, v8, v7);
  swift_bridgeObjectRelease();
  return v20;
}

id privateMediaItemDataFromBacking(recommendationId:assetInfo:mediaSubItems:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, NSObject *a2, uint64_t a3, _QWORD *a4, unint64_t a5, uint64_t a6, uint8_t *a7)
{
  uint64_t v8;
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
  char **v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  id v27;
  char **v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  void *v38;
  void *v39;
  uint8_t *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  NSObject *v61;
  NSObject *v62;
  _QWORD *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  NSObject *v69;
  uint8_t *v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  NSObject *v82;
  uint8_t *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  uint8_t *v98;
  NSObject *v99;
  uint64_t v100;

  v97 = a4;
  v98 = a7;
  v94 = a1;
  v95 = a6;
  v93 = a3;
  v99 = a2;
  v8 = sub_2297DCB54();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v96 = (char *)&v87 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v91 = (char *)&v87 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v92 = (char *)&v87 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v87 - v19;
  v21 = &selRef_isInterruptingPlayback;
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA328]), sel_init);
  if (!v22)
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v33 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
    v34 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v33, v8);
    v35 = sub_2297DCB3C();
    v36 = sub_2297DD16C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_22960C000, v35, v36, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBPrivateMediaItemValueData", v37, 2u);
      MEMORY[0x22E2D0294](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v8);
    return 0;
  }
  v23 = (uint64_t)v22;
  v90 = v20;
  if (!a5)
  {
    v38 = 0;
    goto LABEL_30;
  }
  v89 = (uint64_t)v22;
  v100 = MEMORY[0x24BEE4AF8];
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v23 = sub_2297DD574();
    if (v23)
      goto LABEL_5;
  }
  else
  {
    v23 = *(_QWORD *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v23)
    {
LABEL_5:
      v87 = v9;
      v88 = v8;
      if (v23 < 1)
      {
        __break(1u);
        goto LABEL_63;
      }
      for (i = 0; i != v23; ++i)
      {
        if ((a5 & 0xC000000000000001) != 0)
          v25 = (id)MEMORY[0x22E2CF6B8](i, a5);
        else
          v25 = *(id *)(a5 + 8 * i + 32);
        v26 = v25;
        v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA308]), v21[61]);
        if (v27)
        {
          v28 = v21;
          v29 = v27;
          v30 = objc_msgSend(v26, sel_identifier);
          if (v30)
          {
            sub_2297DCE60();

            v30 = (id)sub_2297DCE48();
            swift_bridgeObjectRelease();
          }
          objc_msgSend(v29, sel_setIdentifier_, v30, v87);

          v31 = v29;
          v32 = objc_msgSend(v26, sel_assetInfo);
          if (v32)
          {
            sub_2297DCE60();

            v32 = (id)sub_2297DCE48();
            swift_bridgeObjectRelease();
          }
          objc_msgSend(v31, sel_setAssetInfo_, v32);

          MEMORY[0x22E2CF1CC]();
          if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_2297DCFF8();
          sub_2297DD028();
          sub_2297DCFEC();
          v21 = v28;
        }
        else
        {

        }
      }
      swift_bridgeObjectRelease();
      v9 = v87;
      v8 = v88;
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  sub_229619C70(0, &qword_255A60778);
  v38 = (void *)sub_2297DCFBC();
  swift_bridgeObjectRelease();
  v23 = v89;
LABEL_30:
  v39 = v97;
  objc_msgSend((id)v23, sel_setMediaSubItems_, v38, v87);

  if (v39)
    v39 = (void *)sub_2297DCE48();
  v40 = v98;
  objc_msgSend((id)v23, sel_setAssetInfo_, v39);

  if (v99)
    v41 = (void *)sub_2297DCE48();
  else
    v41 = 0;
  objc_msgSend((id)v23, sel_setRecommendationId_, v41);

  if (v40)
    v42 = (void *)sub_2297DCE48();
  else
    v42 = 0;
  objc_msgSend((id)v23, sel_setSharedUserIdFromPlayableMusicAccount_, v42);

  v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA300]), v21[61]);
  if (!v43)
  {
    if (qword_255A58C08 == -1)
    {
LABEL_50:
      v66 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v96, v66, v8);
      v67 = sub_2297DCB3C();
      v68 = sub_2297DD16C();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = v23;
        v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v70 = 0;
        _os_log_impl(&dword_22960C000, v67, v68, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBMediaItemValue", v70, 2u);
        MEMORY[0x22E2D0294](v70, -1, -1);
        v71 = v69;
      }
      else
      {
        v71 = v67;
        v67 = v23;
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v96, v8);
      return 0;
    }
LABEL_63:
    swift_once();
    goto LABEL_50;
  }
  v44 = v43;
  objc_msgSend(v43, sel_setPrivateMediaItemValueData_, v23);
  v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA310]), v21[61]);
  if (!v45)
  {
    v72 = v23;
    if (qword_255A58C08 != -1)
      swift_once();
    v73 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v91, v73, v8);
    v74 = sub_2297DCB3C();
    v75 = sub_2297DD16C();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_22960C000, v74, v75, "Workarounds#privateMediaItemDataFromBacking Unexpected nil initializer result for _INPBPlayMediaIntent", v76, 2u);
      MEMORY[0x22E2D0294](v76, -1, -1);
      v77 = v72;
    }
    else
    {
      v77 = v74;
      v74 = v72;
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v91, v8);
    return 0;
  }
  v46 = v45;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5D790);
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_2297DF280;
  *(_QWORD *)(v47 + 32) = v44;
  v100 = v47;
  sub_2297DCFEC();
  sub_229619C70(0, &qword_255A597B0);
  v48 = v44;
  v49 = (void *)sub_2297DCFBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v46, sel_setMediaItems_, v49);

  v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F60]), sel_initWithIdentifier_backingStore_, 0, v46);
  v51 = -[NSObject mediaItems](v50, sel_mediaItems);
  if (!v51)
    goto LABEL_66;
  v52 = v51;
  sub_229619C70(0, (unint64_t *)&qword_255A59BD0);
  v53 = sub_2297DCFD4();

  if (!(v53 >> 62))
  {
    v54 = *(void **)((v53 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v54)
      goto LABEL_43;
    goto LABEL_65;
  }
  swift_bridgeObjectRetain();
  v54 = (void *)sub_2297DD574();
  swift_bridgeObjectRelease();
  if (!v54)
  {
LABEL_65:
    swift_bridgeObjectRelease();
LABEL_66:
    if (qword_255A58C08 != -1)
      swift_once();
    v79 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v92, v79, v8);
    v80 = sub_2297DCB3C();
    v81 = sub_2297DD16C();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = v23;
      v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_22960C000, v80, v81, "Workarounds#privateMediaItemDataFromBacking Unexpected nil media item after building INPlayMediaIntent from backing store", v83, 2u);
      MEMORY[0x22E2D0294](v83, -1, -1);
      v84 = v82;
      v85 = v48;
    }
    else
    {
      v84 = v80;
      v85 = v50;
      v80 = v48;
      v50 = v23;
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v92, v8);
    return 0;
  }
LABEL_43:
  if ((v53 & 0xC000000000000001) != 0)
  {
    v55 = (id)MEMORY[0x22E2CF6B8](0, v53);
  }
  else
  {
    if (!*(_QWORD *)((v53 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_76;
    }
    v55 = *(id *)(v53 + 32);
  }
  v54 = v55;
  swift_bridgeObjectRelease();
  if (qword_255A58C08 != -1)
LABEL_76:
    swift_once();
  v56 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v90, v56, v8);
  v57 = v54;
  v58 = sub_2297DCB3C();
  v59 = sub_2297DD154();
  if (os_log_type_enabled(v58, v59))
  {
    v87 = v9;
    v60 = (uint8_t *)swift_slowAlloc();
    v97 = (_QWORD *)swift_slowAlloc();
    v98 = v60;
    v99 = v50;
    *(_DWORD *)v60 = 138412290;
    v100 = (uint64_t)v57;
    v61 = v57;
    v88 = v8;
    v62 = v61;
    v50 = v99;
    sub_2297DD340();
    v63 = v97;
    *v97 = v57;

    v9 = v87;
    v8 = v88;
    v64 = v59;
    v65 = v98;
    _os_log_impl(&dword_22960C000, v58, v64, "Workarounds#privateMediaItemDataFromBacking Resolved hydrated media item from backing store: %@", v98, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A5D7B0);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v63, -1, -1);
    MEMORY[0x22E2D0294](v65, -1, -1);
  }
  else
  {

    v58 = v57;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v90, v8);
  v78 = -[NSObject privateMediaItemValueData](v57, sel_privateMediaItemValueData);

  return v78;
}

uint64_t sub_2297CBF64(_QWORD *a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  char isUniquelyReferenced_nonNull_native;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  int64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  void (*v69)(char *, char *, char *);
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  char *v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  Swift::Double v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t NowPlayingSignal;
  uint64_t v100;
  Swift::Double *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t result;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(_QWORD *);
  uint64_t v113;
  int64_t v114;
  _QWORD *v115;
  char *v116;
  unsigned int v117;
  void (*v118)(char *, uint64_t);
  unint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  void (*v128)(char *, uint64_t, char *);
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
  _QWORD aBlock[3];
  void *v140;
  uint64_t (*v141)();
  uint64_t v142;

  v111 = a4;
  v112 = a3;
  v127 = a2;
  v124 = sub_2297DC638();
  v123 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v122 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_2297DCB54();
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = sub_2297DC62C();
  v131 = *(_QWORD *)(v129 - 8);
  v7 = MEMORY[0x24BDAC7A8](v129);
  v121 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v120 = (char *)&v105 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v116 = (char *)&v105 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v105 - v13;
  v132 = sub_2297DBA44();
  v113 = *(_QWORD *)(v132 - 8);
  v15 = MEMORY[0x24BDAC7A8](v132);
  v125 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v126 = (char *)&v105 - v17;
  v18 = sub_2297DCC68();
  v19 = *(char **)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v105 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_2297DCCC8();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (uint64_t)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58D30 != -1)
LABEL_50:
    swift_once();
  v133 = qword_255A5FDD0;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = a1;
  v141 = sub_2297CE670;
  v142 = v26;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2296120FC;
  v140 = &block_descriptor_46;
  v27 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  sub_2297DCC8C();
  v137 = MEMORY[0x24BEE4AF8];
  sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  v115 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
  sub_229611384();
  v28 = (uint64_t)v115;
  sub_2297DD3D0();
  MEMORY[0x22E2CF454](0, v25, v21, v27);
  _Block_release(v27);
  (*((void (**)(char *, uint64_t))v19 + 1))(v21, v18);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v22);
  swift_release();
  v29 = sub_229737364(v28, 0, 604800.0);
  v30 = *(_QWORD *)(v28 + 16);
  v31 = MEMORY[0x24BEE4B00];
  v107 = v29;
  v114 = v30;
  if (v30)
  {
    v119 = (*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80);
    v32 = v28 + v119;
    v133 = *(_QWORD *)(v131 + 72);
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x24BEE4B00];
    v130 = v32;
    v34 = v126;
    v35 = v113;
    do
    {
      sub_2297DC5FC();
      sub_2297DB9C0();
      v36 = *(void (**)(char *, uint64_t))(v35 + 8);
      v36(v34, v132);
      v37 = sub_2297DC53C();
      v39 = v38;
      v40 = Double.rounded(to:)(5);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      aBlock[0] = v33;
      sub_2296D192C(v37, v39, isUniquelyReferenced_nonNull_native, v40);
      v33 = aBlock[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v32 += v133;
      --v30;
    }
    while (v30);
    v118 = v36;
    v106 = v33;
    swift_bridgeObjectRelease();
    v128 = *(void (**)(char *, uint64_t, char *))(v131 + 16);
    swift_bridgeObjectRetain();
    v25 = MEMORY[0x24BEE4B00];
    v19 = (char *)v129;
    v18 = v130;
    v22 = v114;
    while (1)
    {
      v128(v14, v18, v19);
      a1 = v14;
      v23 = sub_2297DC53C();
      v45 = v44;
      v46 = sub_2297DC5A8();
      v47 = sub_2297DC5D8();
      v48 = __OFADD__(v46, v47);
      v21 = (char *)(v46 + v47);
      if (v48)
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
      a1 = v14;
      v49 = sub_2297DC554();
      v48 = __OFADD__(v21, v49);
      v21 += v49;
      if (v48)
        goto LABEL_43;
      a1 = v14;
      v50 = sub_2297DC56C();
      v48 = __OFADD__(v21, v50);
      v21 += v50;
      if (v48)
        goto LABEL_44;
      a1 = v14;
      v51 = sub_2297DC590();
      v48 = __OFADD__(v21, v51);
      v21 += v51;
      if (v48)
        goto LABEL_45;
      a1 = v14;
      v52 = sub_2297DC5C0();
      v48 = __OFADD__(v21, v52);
      v21 += v52;
      if (v48)
        goto LABEL_46;
      a1 = v14;
      v53 = sub_2297DC5F0();
      v19 = &v21[v53];
      if (__OFADD__(v21, v53))
        goto LABEL_47;
      a1 = (_QWORD *)v25;
      v25 = swift_isUniquelyReferenced_nonNull_native();
      aBlock[0] = a1;
      v55 = sub_22961AA90(v23, v45);
      v56 = a1[2];
      v57 = (v54 & 1) == 0;
      v58 = v56 + v57;
      if (__OFADD__(v56, v57))
        goto LABEL_48;
      v21 = v54;
      if (a1[3] >= v58)
      {
        if ((v25 & 1) != 0)
        {
          v25 = aBlock[0];
          if ((v54 & 1) == 0)
            goto LABEL_21;
        }
        else
        {
          a1 = aBlock;
          sub_2297828A4();
          v25 = aBlock[0];
          if ((v21 & 1) == 0)
            goto LABEL_21;
        }
      }
      else
      {
        sub_22962BDA4(v58, v25);
        a1 = (_QWORD *)aBlock[0];
        v59 = sub_22961AA90(v23, v45);
        if ((v21 & 1) != (v60 & 1))
        {
          result = sub_2297DD694();
          __break(1u);
          return result;
        }
        v55 = v59;
        v25 = aBlock[0];
        if ((v21 & 1) == 0)
        {
LABEL_21:
          *(_QWORD *)(v25 + 8 * (v55 >> 6) + 64) |= 1 << v55;
          v61 = (uint64_t *)(*(_QWORD *)(v25 + 48) + 16 * v55);
          *v61 = v23;
          v61[1] = v45;
          *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v55) = v19;
          v62 = *(_QWORD *)(v25 + 16);
          v48 = __OFADD__(v62, 1);
          v63 = v62 + 1;
          if (v48)
            goto LABEL_49;
          *(_QWORD *)(v25 + 16) = v63;
          swift_bridgeObjectRetain();
          goto LABEL_7;
        }
      }
      *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v55) = v19;
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v42 = *(void (**)(char *, uint64_t))(v131 + 8);
      v19 = (char *)v129;
      v42(v14, v129);
      v18 += v133;
      --v22;
      v43 = v126;
      if (!v22)
      {
        v105 = v25;
        swift_bridgeObjectRelease();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        v64 = v114;
        sub_2296A68E8(0, v114, 0);
        v117 = *MEMORY[0x24BE93230];
        v65 = v116;
        v66 = v130;
        do
        {
          v67 = v120;
          v130 = v66;
          ((void (*)(char *))v128)(v120);
          (*(void (**)(char *, _QWORD, uint64_t))(v123 + 104))(v122, v117, v124);
          sub_2297DC53C();
          v68 = v121;
          sub_2297DC614();
          sub_2297DC5FC();
          SiriRemembersV1API.Aggregation.addInstance(date:)(v43);
          v118(v43, v132);
          v69 = *(void (**)(char *, char *, char *))(v131 + 32);
          v69(v65, v68, v19);
          v42(v67, (uint64_t)v19);
          v70 = aBlock[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2296A68E8(0, *(_QWORD *)(v70 + 16) + 1, 1);
            v65 = v116;
            v70 = aBlock[0];
          }
          v72 = *(_QWORD *)(v70 + 16);
          v71 = *(_QWORD *)(v70 + 24);
          v73 = v133;
          v74 = (uint64_t)v125;
          if (v72 >= v71 >> 1)
          {
            sub_2296A68E8(v71 > 1, v72 + 1, 1);
            v65 = v116;
            v70 = aBlock[0];
          }
          *(_QWORD *)(v70 + 16) = v72 + 1;
          v75 = v70 + v119 + v72 * v73;
          v19 = (char *)v129;
          v69((char *)v75, v65, (char *)v129);
          aBlock[0] = v70;
          v66 = v130 + v73;
          --v64;
        }
        while (v64);
        v76 = v110;
        v77 = v109;
        v78 = v113;
        v31 = MEMORY[0x24BEE4B00];
        v79 = v132;
        goto LABEL_33;
      }
    }
  }
  v106 = MEMORY[0x24BEE4B00];
  v105 = MEMORY[0x24BEE4B00];
  v79 = v132;
  v74 = (uint64_t)v125;
  v76 = v110;
  v77 = v109;
  v43 = v126;
  v78 = v113;
  v70 = MEMORY[0x24BEE4AF8];
LABEL_33:
  v133 = sub_229737364(v70, 0, 14400.0);
  swift_bridgeObjectRelease();
  v137 = 0;
  v138 = 0;
  sub_2297DBA38();
  sub_2297DB9CC();
  v80 = v43;
  v81 = *(void (**)(char *, uint64_t))(v78 + 8);
  v81(v80, v79);
  v135 = v31;
  v136 = v31;
  v134 = v31;
  v82 = v108;
  v83 = v114;
  if (v114)
  {
    v84 = (uint64_t)v115
        + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    v85 = *(_QWORD *)(v131 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_2297CD308(v84, v74, &v137, &v136, &v135, &v134);
      v84 += v85;
      --v83;
    }
    while (v83);
    swift_bridgeObjectRelease();
  }
  if (qword_255A58C08 != -1)
    swift_once();
  v86 = __swift_project_value_buffer(v76, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v82, v86, v76);
  v87 = sub_2297DCB3C();
  v88 = sub_2297DD178();
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v89 = 0;
    _os_log_impl(&dword_22960C000, v87, v88, "LastNowPlayingSignal#signal returning LastNowPlayingSignal", v89, 2u);
    MEMORY[0x22E2D0294](v89, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v77 + 8))(v82, v76);
  v90 = v126;
  sub_2297DBA38();
  sub_2297DB9C0();
  v92 = v91;
  v81(v90, v79);
  v93 = v137;
  v94 = v138;
  swift_bridgeObjectRetain();
  sub_2297DB9C0();
  v95 = Double.rounded(to:)(5);
  v97 = v135;
  v96 = v136;
  v98 = v134;
  NowPlayingSignal = type metadata accessor for LastNowPlayingSignal();
  v100 = v79;
  v101 = (Swift::Double *)swift_allocObject();
  *((_QWORD *)v101 + 2) = v93;
  *((_QWORD *)v101 + 3) = v94;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v101[4] = v95;
  v102 = v107;
  *((_QWORD *)v101 + 5) = v106;
  *((_QWORD *)v101 + 6) = v102;
  v103 = v105;
  *((_QWORD *)v101 + 7) = v133;
  *((_QWORD *)v101 + 8) = v103;
  *((_QWORD *)v101 + 9) = v92;
  *((_QWORD *)v101 + 10) = v96;
  *((_QWORD *)v101 + 11) = v97;
  *((_QWORD *)v101 + 12) = v98;
  v140 = (void *)NowPlayingSignal;
  v141 = (uint64_t (*)())&off_24F273FE8;
  aBlock[0] = v101;
  v112(aBlock);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v81((char *)v74, v100);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2297CCB88(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(_QWORD *)(sub_2297DC62C() - 8);
    v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_2297CCC20(v4);
      v4 += v5;
      --v1;
    }
    while (v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2297CCC20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  os_log_t v58;
  uint64_t v59;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  os_log_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;

  v2 = sub_2297DBA44();
  v3 = *(_QWORD *)(v2 - 8);
  v67 = v2;
  v68 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2297DC62C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v75 = (char *)&v62 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v74 = (char *)&v62 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v73 = (char *)&v62 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v72 = (char *)&v62 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v71 = (char *)&v62 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v70 = (char *)&v62 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v62 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v62 - v25;
  v27 = sub_2297DCB54();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v77 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v27, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v77, v30, v27);
  v69 = v28;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v31(v26, a1, v6);
  v31(v24, a1, v6);
  v31(v70, a1, v6);
  v31(v71, a1, v6);
  v31(v72, a1, v6);
  v31(v73, a1, v6);
  v31(v74, a1, v6);
  v31(v75, a1, v6);
  v31(v76, a1, v6);
  v32 = sub_2297DCB3C();
  v33 = sub_2297DD160();
  v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    v35 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v79 = v65;
    *(_DWORD *)v35 = 136317186;
    v64 = v34;
    v63 = v32;
    v36 = sub_2297DC53C();
    v78 = sub_22960FB78(v36, v37, &v79);
    v66 = v27;
    sub_2297DD340();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v7 + 8);
    v38(v26, v6);
    *(_WORD *)(v35 + 12) = 2080;
    v62 = v35 + 14;
    v39 = v24;
    sub_2297DC5FC();
    sub_229611304(&qword_255A60968, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v40 = v67;
    v41 = sub_2297DD61C();
    v43 = v42;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v5, v40);
    v78 = sub_22960FB78(v41, v43, &v79);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    v38(v39, v6);
    *(_WORD *)(v35 + 22) = 2048;
    v44 = v70;
    v45 = sub_2297DC5A8();
    v38(v44, v6);
    v78 = v45;
    sub_2297DD340();
    *(_WORD *)(v35 + 32) = 2048;
    v46 = v71;
    v47 = sub_2297DC5D8();
    v38(v46, v6);
    v78 = v47;
    sub_2297DD340();
    *(_WORD *)(v35 + 42) = 2048;
    v48 = v72;
    v49 = sub_2297DC554();
    v38(v48, v6);
    v78 = v49;
    sub_2297DD340();
    *(_WORD *)(v35 + 52) = 2048;
    v50 = v73;
    v51 = sub_2297DC56C();
    v38(v50, v6);
    v78 = v51;
    sub_2297DD340();
    *(_WORD *)(v35 + 62) = 2048;
    v52 = v74;
    v53 = sub_2297DC590();
    v38(v52, v6);
    v78 = v53;
    sub_2297DD340();
    *(_WORD *)(v35 + 72) = 2048;
    v54 = v75;
    v55 = sub_2297DC5C0();
    v38(v54, v6);
    v78 = v55;
    sub_2297DD340();
    *(_WORD *)(v35 + 82) = 2048;
    v56 = v76;
    v57 = sub_2297DC5F0();
    v38(v56, v6);
    v78 = v57;
    sub_2297DD340();
    v58 = v63;
    _os_log_impl(&dword_22960C000, v63, (os_log_type_t)v64, "LastNowPlayingSignal#signal For bundle %s - recency: %s frequencies: f2min:%ld f10min:%ld f1hr:%ld f6hr:%ld f1day:%ld f7day:%ld f28day:%ld", (uint8_t *)v35, 0x5Cu);
    v59 = v65;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v59, -1, -1);
    MEMORY[0x22E2D0294](v35, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v77, v66);
  }
  else
  {
    v61 = *(void (**)(char *, uint64_t))(v7 + 8);
    v61(v76, v6);
    v61(v75, v6);
    v61(v74, v6);
    v61(v73, v6);
    v61(v72, v6);
    v61(v71, v6);
    v61(v70, v6);
    v61(v26, v6);
    v61(v24, v6);

    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v77, v27);
  }
}

uint64_t sub_2297CD308(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t *v20;
  uint64_t v21;
  uint64_t result;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t *v28;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t *v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;

  v50 = a6;
  v51 = a5;
  v52 = a4;
  v48 = a3;
  v7 = sub_2297DBA44();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v47 - v12;
  v14 = sub_2297DC53C();
  v16 = v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v49 = a2;
  v17(v13, a2, v7);
  sub_2297DC5FC();
  v18 = sub_2297DB9E4();
  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v13, v7);
  if ((v18 & 1) != 0)
  {
    v20 = v48;
    *v48 = v14;
    v20[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2297DC5FC();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v49, v13, v7);
  }
  swift_bridgeObjectRetain();
  v21 = sub_2297DC5A8();
  result = sub_2297DC5D8();
  v23 = __OFADD__(v21, result);
  v24 = v21 + result;
  if (v23)
  {
    __break(1u);
    goto LABEL_20;
  }
  result = sub_2297DC554();
  v23 = __OFADD__(v24, result);
  v25 = v24 + result;
  if (v23)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  result = sub_2297DC56C();
  v23 = __OFADD__(v25, result);
  v26 = v25 + result;
  if (v23)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  result = sub_2297DC590();
  if (__OFADD__(v26, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v27 = (double)(v26 + result);
  v28 = v52;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v53 = *v28;
  *v28 = 0x8000000000000000;
  sub_2296D192C(v14, v16, isUniquelyReferenced_nonNull_native, v27);
  *v28 = v53;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v30 = sub_2297DC5A8();
  result = sub_2297DC5D8();
  v23 = __OFADD__(v30, result);
  v31 = v30 + result;
  if (v23)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  result = sub_2297DC554();
  v23 = __OFADD__(v31, result);
  v32 = v31 + result;
  if (v23)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  result = sub_2297DC56C();
  v23 = __OFADD__(v32, result);
  v33 = v32 + result;
  if (v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  result = sub_2297DC590();
  v23 = __OFADD__(v33, result);
  v34 = v33 + result;
  if (v23)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  result = sub_2297DC5C0();
  if (__OFADD__(v34, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v35 = (double)(v34 + result);
  v36 = v51;
  v37 = swift_isUniquelyReferenced_nonNull_native();
  v53 = *v36;
  *v36 = 0x8000000000000000;
  sub_2296D192C(v14, v16, v37, v35);
  *v36 = v53;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v38 = sub_2297DC5A8();
  result = sub_2297DC5D8();
  v23 = __OFADD__(v38, result);
  v39 = v38 + result;
  if (v23)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = sub_2297DC554();
  v23 = __OFADD__(v39, result);
  v40 = v39 + result;
  if (v23)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  result = sub_2297DC56C();
  v23 = __OFADD__(v40, result);
  v41 = v40 + result;
  if (v23)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  result = sub_2297DC590();
  v23 = __OFADD__(v41, result);
  v42 = v41 + result;
  if (v23)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  result = sub_2297DC5C0();
  v23 = __OFADD__(v42, result);
  v43 = v42 + result;
  if (v23)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  result = sub_2297DC5F0();
  if (!__OFADD__(v43, result))
  {
    v44 = (double)(v43 + result);
    v45 = v50;
    v46 = swift_isUniquelyReferenced_nonNull_native();
    v53 = *v45;
    *v45 = 0x8000000000000000;
    sub_2296D192C(v14, v16, v46, v44);
    *v45 = v53;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2297CD6A8()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_22967ED40((uint64_t)&unk_24F25DF78);
  result = swift_arrayDestroy();
  qword_255A680C8 = v0;
  return result;
}

unint64_t sub_2297CD6F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t result;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  BOOL v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5D7F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2297E3100;
  *(_QWORD *)(inited + 32) = 0xD000000000000013;
  *(_QWORD *)(inited + 40) = 0x80000002297E8D20;
  v7 = v2[10];
  v8 = 0;
  v9 = 0;
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_22961AA90(a1, a2);
    if ((v11 & 1) != 0)
      v9 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v12 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 72) = v12;
  *(_QWORD *)(inited + 80) = 0xD000000000000014;
  *(_QWORD *)(inited + 88) = 0x80000002297E8D40;
  v13 = v3[11];
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_22961AA90(a1, a2);
    if ((v15 & 1) != 0)
      v8 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(inited + 96) = v8;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 128) = 0xD000000000000015;
  *(_QWORD *)(inited + 136) = 0x80000002297E8D60;
  v16 = v3[12];
  if (*(_QWORD *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = sub_22961AA90(a1, a2);
    v18 = 0;
    if ((v19 & 1) != 0)
      v18 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)(inited + 144) = v18;
  *(_QWORD *)(inited + 168) = v12;
  *(_QWORD *)(inited + 176) = 0xD000000000000014;
  *(_QWORD *)(inited + 184) = 0x80000002297E8CE0;
  v20 = v3[3];
  if (v20)
  {
    if (v3[2] == a1 && v20 == a2)
      result = 1;
    else
      result = sub_2297DD658();
  }
  else
  {
    result = 0;
  }
  v22 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = result & 1;
  *(_QWORD *)(inited + 216) = v22;
  *(_QWORD *)(inited + 224) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 232) = 0x80000002297E8D00;
  *(_QWORD *)(inited + 240) = v3[4];
  *(_QWORD *)(inited + 264) = v12;
  *(_QWORD *)(inited + 272) = 0xD000000000000017;
  *(_QWORD *)(inited + 280) = 0x80000002297E8DA0;
  v23 = v3[5];
  if (*(_QWORD *)(v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = sub_22961AA90(a1, a2);
    if ((v25 & 1) != 0)
      v26 = *(_QWORD *)(*(_QWORD *)(v23 + 56) + 8 * v24);
    else
      v26 = 0x4142750000000000;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v26 = 0x4142750000000000;
  }
  *(_QWORD *)(inited + 288) = v26;
  *(_QWORD *)(inited + 312) = v12;
  *(_QWORD *)(inited + 320) = 0xD000000000000015;
  *(_QWORD *)(inited + 328) = 0x80000002297E8D80;
  v27 = v3[6];
  v28 = 0;
  v29 = 0;
  if (*(_QWORD *)(v27 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = sub_22961AA90(a1, a2);
    if ((v31 & 1) != 0)
      v29 = *(_QWORD *)(*(_QWORD *)(v27 + 56) + 8 * v30);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  *(_QWORD *)(inited + 336) = v29;
  *(_QWORD *)(inited + 360) = v12;
  *(_QWORD *)(inited + 368) = 0xD00000000000001CLL;
  *(_QWORD *)(inited + 376) = 0x80000002297E8E00;
  v32 = v3[7];
  if (*(_QWORD *)(v32 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = sub_22961AA90(a1, a2);
    if ((v34 & 1) != 0)
      v28 = *(_QWORD *)(*(_QWORD *)(v32 + 56) + 8 * v33);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  *(_QWORD *)(inited + 384) = v28;
  *(_QWORD *)(inited + 408) = v12;
  *(_QWORD *)(inited + 416) = 0xD000000000000015;
  *(_QWORD *)(inited + 424) = 0x80000002297E8DC0;
  v35 = v3[8];
  if (*(_QWORD *)(v35 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v36 = sub_22961AA90(a1, a2);
    if ((v37 & 1) != 0)
      v38 = *(_QWORD *)(*(_QWORD *)(v35 + 56) + 8 * v36);
    else
      v38 = 0;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v38 = 0;
  }
  v39 = 0;
  v40 = 0;
  v41 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 432) = v38;
  *(_QWORD *)(inited + 456) = v41;
  *(_QWORD *)(inited + 464) = 0xD000000000000014;
  *(_QWORD *)(inited + 472) = 0x80000002297E8DE0;
  v42 = v3[8];
  *(_QWORD *)(inited + 504) = v41;
  v43 = 1 << *(_BYTE *)(v42 + 32);
  v44 = -1;
  if (v43 < 64)
    v44 = ~(-1 << v43);
  v45 = v42 + 64;
  v46 = v44 & *(_QWORD *)(v42 + 64);
  v47 = (unint64_t)(v43 + 63) >> 6;
  do
  {
    if (v46)
    {
      v48 = __clz(__rbit64(v46));
      v46 &= v46 - 1;
      v49 = v48 | (v39 << 6);
    }
    else
    {
      v52 = v39 + 1;
      if (__OFADD__(v39, 1))
        goto LABEL_66;
      if (v52 >= v47)
      {
LABEL_64:
        *(_QWORD *)(inited + 480) = v40;
        return sub_2296F956C(inited);
      }
      v53 = *(_QWORD *)(v45 + 8 * v52);
      ++v39;
      if (!v53)
      {
        v39 = v52 + 1;
        if (v52 + 1 >= v47)
          goto LABEL_64;
        v53 = *(_QWORD *)(v45 + 8 * v39);
        if (!v53)
        {
          v39 = v52 + 2;
          if (v52 + 2 >= v47)
            goto LABEL_64;
          v53 = *(_QWORD *)(v45 + 8 * v39);
          if (!v53)
          {
            v39 = v52 + 3;
            if (v52 + 3 >= v47)
              goto LABEL_64;
            v53 = *(_QWORD *)(v45 + 8 * v39);
            if (!v53)
            {
              v39 = v52 + 4;
              if (v52 + 4 >= v47)
                goto LABEL_64;
              v53 = *(_QWORD *)(v45 + 8 * v39);
              if (!v53)
              {
                v54 = v52 + 5;
                if (v54 >= v47)
                  goto LABEL_64;
                v53 = *(_QWORD *)(v45 + 8 * v54);
                if (!v53)
                {
                  while (1)
                  {
                    v39 = v54 + 1;
                    if (__OFADD__(v54, 1))
                      goto LABEL_67;
                    if (v39 >= v47)
                      goto LABEL_64;
                    v53 = *(_QWORD *)(v45 + 8 * v39);
                    ++v54;
                    if (v53)
                      goto LABEL_63;
                  }
                }
                v39 = v54;
              }
            }
          }
        }
      }
LABEL_63:
      v46 = (v53 - 1) & v53;
      v49 = __clz(__rbit64(v53)) + (v39 << 6);
    }
    v50 = *(_QWORD *)(*(_QWORD *)(v42 + 56) + 8 * v49);
    v51 = __OFADD__(v40, v50);
    v40 += v50;
  }
  while (!v51);
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
  return result;
}

void sub_2297CDC58(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];

  v4 = sub_2297CD6F0(a1, a2);
  if (!*(_QWORD *)(v4 + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  v5 = v4;
  v6 = sub_22961AA90(0xD00000000000001BLL, 0x80000002297E8D00);
  if ((v7 & 1) == 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_229610400(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v19);
  sub_22961BF30(&v19, v21);
  sub_2296B2528();
  swift_dynamicCast();
  objc_msgSend(v18, sel_doubleValue);
  v9 = v8;

  a3[6] = v9;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v10 = sub_22961AA90(0xD000000000000013, 0x80000002297E8D20);
  if ((v11 & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_229610400(*(_QWORD *)(v5 + 56) + 32 * v10, (uint64_t)&v19);
  sub_22961BF30(&v19, v21);
  swift_dynamicCast();
  objc_msgSend(v18, sel_doubleValue);
  v13 = v12;

  a3[33] = v13;
  if (*(_QWORD *)(v5 + 16) && (v14 = sub_22961AA90(0xD000000000000015, 0x80000002297E8D80), (v15 & 1) != 0))
  {
    sub_229610400(*(_QWORD *)(v5 + 56) + 32 * v14, (uint64_t)&v19);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v20 + 1))
  {
    sub_22961BF30(&v19, v21);
    swift_dynamicCast();
    objc_msgSend(v18, sel_doubleValue);
    v17 = v16;

    a3[34] = v17;
    return;
  }
LABEL_15:
  __break(1u);
}

double sub_2297CDE54()
{
  uint64_t v0;

  return *(double *)(*(_QWORD *)v0 + 72);
}

uint64_t sub_2297CDE60()
{
  if (qword_255A58DF0 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t sub_2297CDEA0(uint64_t a1, uint64_t a2)
{
  return sub_2297CD6F0(a1, a2);
}

void sub_2297CDEC0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  sub_2297CDC58(a1, a2, a3);
}

uint64_t sub_2297CDEE0(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int64_t v6;
  int v7;
  int v8;
  char v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v4 = a1;
  v28 = MEMORY[0x24BEE4AF8];
  sub_22961FFD0(0, v2, 0);
  v3 = v28;
  result = sub_2296398F0(v4);
  v6 = result;
  v8 = v7;
  v10 = v9 & 1;
  v24 = v4;
  v25 = v4 + 56;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v4 + 32))
  {
    if (((*(_QWORD *)(v25 + (((unint64_t)v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
      goto LABEL_19;
    if (*(_DWORD *)(v4 + 36) != v8)
      goto LABEL_20;
    v11 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v6);
    v13 = *v11;
    v12 = v11[1];
    v14 = *(_QWORD *)(a2 + 64);
    v15 = *(_QWORD *)(v14 + 16);
    swift_bridgeObjectRetain();
    v27 = v10;
    if (v15)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = sub_22961AA90(v13, v12);
      if ((v17 & 1) != 0)
        v18 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v16);
      else
        v18 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = 0;
    }
    v20 = *(_QWORD *)(v28 + 16);
    v19 = *(_QWORD *)(v28 + 24);
    if (v20 >= v19 >> 1)
      sub_22961FFD0(v19 > 1, v20 + 1, 1);
    *(_QWORD *)(v28 + 16) = v20 + 1;
    v21 = (_QWORD *)(v28 + 24 * v20);
    v21[4] = v13;
    v21[5] = v12;
    v21[6] = v18;
    v4 = v24;
    result = sub_229639990(v6, v8, v27 & 1, v24);
    v6 = result;
    v8 = v22;
    v10 = v23 & 1;
    if (!--v2)
    {
      sub_2297376E0(result, v22, v23 & 1);
      return v3;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_2297CE0C8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  uint64_t (*v28)(uint64_t);
  char *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t (**v35)(uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  void (**v39)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;

  v48 = sub_2297DBA44();
  v4 = *(_QWORD *)(v48 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)&v41 - v7;
  v8 = sub_2297DCB54();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v41 - v13;
  if (qword_255A589F0 != -1)
    swift_once();
  v46 = sub_2296B8D88(1014);
  if (qword_255A58C08 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v8, (uint64_t)qword_255A67F80);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v43 = v15;
  v44 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = sub_2297DCB3C();
  v18 = sub_2297DD178();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v42 = v8;
    v20 = v5;
    v21 = v12;
    v22 = v4;
    v23 = a1;
    v24 = a2;
    v25 = v19;
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_22960C000, v17, v18, "LastNowPlayingSignal#signal", v19, 2u);
    v26 = v25;
    a2 = v24;
    a1 = v23;
    v4 = v22;
    v12 = v21;
    v5 = v20;
    v8 = v42;
    MEMORY[0x22E2D0294](v26, -1, -1);
  }

  v27 = *(void (**)(char *, uint64_t))(v9 + 8);
  v27(v14, v8);
  if (qword_255A589A0 != -1)
    swift_once();
  v42 = qword_255A67E98;
  v28 = (uint64_t (*)(uint64_t))swift_allocObject();
  *((_QWORD *)v28 + 2) = v46;
  *((_QWORD *)v28 + 3) = a1;
  *((_QWORD *)v28 + 4) = a2;
  swift_retain();
  swift_retain();
  v29 = v47;
  sub_2297DBA38();
  v30 = v45;
  v31 = v48;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v45, v29, v48);
  v32 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v33 = (v5 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v34 + v32, v30, v31);
  v35 = (uint64_t (**)(uint64_t))(v34 + v33);
  *v35 = sub_2296D51DC;
  v35[1] = v28;
  v44(v12, v43, v8);
  swift_retain();
  v36 = sub_2297DCB3C();
  v37 = sub_2297DD160();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_22960C000, v36, v37, "NowPlayingUsageCache: retrieving bundle affinity", v38, 2u);
    MEMORY[0x22E2D0294](v38, -1, -1);
  }

  v27(v12, v8);
  v39 = *(void (***)(char *, uint64_t, uint64_t))(v42 + 16);
  swift_retain();
  sub_2296AAF78(0x4014000000000000, 0, v39, (uint64_t (*)(uint64_t))sub_2297CE5F8, v34);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v47, v48);
  swift_release();
  return swift_release();
}

uint64_t sub_2297CE4B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2297DCB30();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297CE530()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297CE554()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297CE580()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2297DBA44();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297CE5F8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(sub_2297DBA44() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_2297CBF64(a1, v1 + v4, *(void (**)(_QWORD *))v5, *(_QWORD *)(v5 + 8));
}

uint64_t sub_2297CE64C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297CE670()
{
  uint64_t v0;

  return sub_2297CCB88(*(_QWORD *)(v0 + 16));
}

uint64_t PlaybackItemContainer.__allocating_init(_:assetInfo:subItems:recommendationID:sharedUserIdFromPlayableMusicAccount:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v17;

  v17 = (_QWORD *)swift_allocObject();
  v17[9] = a5;
  v17[10] = a6;
  v17[11] = a7;
  v17[12] = a8;
  v17[13] = a9;
  return PlaybackItem.init(_:assetInfo:)(a1, a2, a3, a4);
}

uint64_t PlaybackItemContainer.subItems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PlaybackItemContainer.recommendationID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PlaybackItemContainer.sharedUserIdFromPlayableMusicAccount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

void PlaybackItemContainer.__allocating_init(_:assetInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void PlaybackItemContainer.init(_:assetInfo:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2297CE7C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t PlaybackItemContainer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for PlaybackItemContainer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PlaybackItemContainer.__allocating_init(_:assetInfo:subItems:recommendationID:sharedUserIdFromPlayableMusicAccount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_2297CE844(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;

  v2 = a1 + 56;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v6)
      return swift_release();
    v16 = *(_QWORD *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v6)
        return swift_release();
      v16 = *(_QWORD *)(v2 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v6)
          return swift_release();
        v16 = *(_QWORD *)(v2 + 8 * v8);
        if (!v16)
        {
          v8 = v15 + 3;
          if (v15 + 3 >= v6)
            return swift_release();
          v16 = *(_QWORD *)(v2 + 8 * v8);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 24 * v10);
    v12 = *v11;
    v13 = v11[1];
    v14 = *((double *)v11 + 2);
    swift_bridgeObjectRetain_n();
    sub_229625C5C(&v18, v12, v13, v14);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v17 = v15 + 4;
  if (v17 >= v6)
    return swift_release();
  v16 = *(_QWORD *)(v2 + 8 * v17);
  if (v16)
  {
    v8 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v6)
      return swift_release();
    v16 = *(_QWORD *)(v2 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_2297CE9F0()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void *v3;

  type metadata accessor for NowPlayingUsageProvider();
  v0 = (_QWORD *)swift_allocObject();
  v1 = MEMORY[0x24BEE4B08];
  v0[2] = 0;
  v0[3] = v1;
  v0[4] = MEMORY[0x24BEE4B00];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  v3 = (void *)sub_2297DCE48();
  objc_msgSend(v2, sel_setName_, v3);

  v0[5] = v2;
  qword_255A680D0 = (uint64_t)v0;
}

uint64_t sub_2297CEA9C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
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
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint8_t *v34;
  void (*v35)(char *, uint64_t);
  void *v36;
  char *v37;
  char *v38;
  char *v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  void *v44;
  char *v45;
  char *v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD v57[2];
  void (*v58)(char *, uint64_t);
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t aBlock;
  uint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  uint64_t (*v83)();
  uint64_t v84;

  v70 = a2;
  v76 = a1;
  v68 = *v2;
  v69 = sub_2297DBA44();
  v66 = *(_QWORD *)(v69 - 8);
  v3 = MEMORY[0x24BDAC7A8](v69);
  v65 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v67 = (char *)v57 - v5;
  v6 = sub_2297DCC50();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (_QWORD *)((char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v63 = sub_2297DCCEC();
  v10 = *(_QWORD *)(v63 - 8);
  v11 = MEMORY[0x24BDAC7A8](v63);
  v59 = (char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v62 = (char *)v57 - v13;
  v14 = sub_2297DCC68();
  v74 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v73 = (char *)v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_2297DCCC8();
  v72 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v71 = (char *)v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2297DCB54();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v64 = (char *)v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v57 - v21;
  if (qword_255A58C08 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v17, (uint64_t)qword_255A67F80);
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v60 = v23;
  v61 = v24;
  ((void (*)(char *))v24)(v22);
  v25 = sub_2297DCB3C();
  v26 = sub_2297DD160();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v58 = (void (*)(char *, uint64_t))v17;
    v28 = v10;
    v29 = v9;
    v30 = v7;
    v31 = v6;
    v32 = v14;
    v33 = v27;
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_22960C000, v25, v26, "NowPlayingUsageProvider#affinity...", v27, 2u);
    v34 = v33;
    v14 = v32;
    v6 = v31;
    v7 = v30;
    v9 = v29;
    v10 = v28;
    v17 = (uint64_t)v58;
    MEMORY[0x22E2D0294](v34, -1, -1);
  }

  v35 = *(void (**)(char *, uint64_t))(v18 + 8);
  v35(v22, v17);
  if (*(double *)(v77 + 16) <= 0.0)
  {
    v58 = v35;
    if (qword_255A58D30 != -1)
      swift_once();
    v57[1] = qword_255A5FDD0;
    v40 = v59;
    sub_2297DCCD4();
    *v9 = 5;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5420], v6);
    v41 = v62;
    MEMORY[0x22E2CEF38](v40, v9);
    (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
    v42 = *(void (**)(char *, uint64_t))(v10 + 8);
    v43 = v63;
    v42(v40, v63);
    v83 = sub_2297D5330;
    v84 = v77;
    aBlock = MEMORY[0x24BDAC760];
    v80 = 1107296256;
    v81 = sub_2296120FC;
    v82 = &block_descriptor_47;
    v44 = _Block_copy(&aBlock);
    swift_retain();
    v45 = v71;
    sub_2297DCC8C();
    v78 = MEMORY[0x24BEE4AF8];
    sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
    sub_229611384();
    v46 = v73;
    sub_2297DD3D0();
    MEMORY[0x22E2CF418](v41, v45, v46, v44);
    _Block_release(v44);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v46, v14);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v45, v75);
    v42(v41, v43);
    swift_release();
    v47 = v64;
    v61(v64, v60, v17);
    v48 = sub_2297DCB3C();
    v49 = sub_2297DD160();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_22960C000, v48, v49, "NowPlayingUsageProvider#affinity no data, loading last 150...", v50, 2u);
      MEMORY[0x22E2D0294](v50, -1, -1);
    }

    v58(v47, v17);
    v51 = v65;
    sub_2297DBA38();
    v52 = (uint64_t)v67;
    sub_2297DB9CC();
    v53 = *(void (**)(char *, uint64_t))(v66 + 8);
    v54 = v69;
    v53(v51, v69);
    v55 = (_QWORD *)swift_allocObject();
    v55[2] = v76;
    v56 = v68;
    v55[3] = v70;
    v55[4] = v56;
    swift_retain();
    sub_22961F6B0(v52, 150, (uint64_t)sub_2297D535C, (uint64_t)v55);
    swift_release();
    return ((uint64_t (*)(uint64_t, uint64_t))v53)(v52, v54);
  }
  else
  {
    if (qword_255A58D30 != -1)
      swift_once();
    v83 = sub_2297D0548;
    v84 = 0;
    aBlock = MEMORY[0x24BDAC760];
    v80 = 1107296256;
    v81 = sub_2296120FC;
    v82 = &block_descriptor_15_4;
    v36 = _Block_copy(&aBlock);
    v37 = v71;
    sub_2297DCC8C();
    v78 = MEMORY[0x24BEE4AF8];
    sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
    sub_229611384();
    v38 = v73;
    sub_2297DD3D0();
    MEMORY[0x22E2CF454](0, v37, v38, v36);
    _Block_release(v36);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v38, v14);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v37, v75);
    return sub_2297D0694(v76, v70);
  }
}

uint64_t sub_2297CF228()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v0 = sub_2297DCB30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2297DCB54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_2297DCB3C();
  v10 = sub_2297DD178();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22960C000, v9, v10, "NowPlayingUsageProvider#affinity (lazy load) no data, loading async...", v11, 2u);
    MEMORY[0x22E2D0294](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2297DD280();
  if (qword_255A589D8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A59758);
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v12 + 16) = xmmword_2297DF330;
  v14 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = v14;
  *(_QWORD *)(v12 + 32) = 0;
  sub_2297DCB24();
  sub_2297DCB00();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_2297D0694((uint64_t)sub_2297CF498, 0);
}

uint64_t sub_2297CF498(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = sub_2297DCB54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2297DCB3C();
  v8 = sub_2297DD178();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22960C000, v7, v8, "NowPlayingUsageProvider#affinity load complete.", v9, 2u);
    MEMORY[0x22E2D0294](v9, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = *(_QWORD *)(sub_2297DC62C() - 8);
    v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v14 = *(_QWORD *)(v12 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_2297CF624(v13);
      v13 += v14;
      --v11;
    }
    while (v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2297CF624(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  os_log_t v58;
  uint64_t v59;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  os_log_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;

  v2 = sub_2297DBA44();
  v3 = *(_QWORD *)(v2 - 8);
  v67 = v2;
  v68 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2297DC62C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v75 = (char *)&v62 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v74 = (char *)&v62 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v73 = (char *)&v62 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v72 = (char *)&v62 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v71 = (char *)&v62 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v70 = (char *)&v62 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v62 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v62 - v25;
  v27 = sub_2297DCB54();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v77 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v27, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v77, v30, v27);
  v69 = v28;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v31(v26, a1, v6);
  v31(v24, a1, v6);
  v31(v70, a1, v6);
  v31(v71, a1, v6);
  v31(v72, a1, v6);
  v31(v73, a1, v6);
  v31(v74, a1, v6);
  v31(v75, a1, v6);
  v31(v76, a1, v6);
  v32 = sub_2297DCB3C();
  v33 = sub_2297DD160();
  v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    v35 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v79 = v65;
    *(_DWORD *)v35 = 136317186;
    v64 = v34;
    v63 = v32;
    v36 = sub_2297DC53C();
    v78 = sub_22960FB78(v36, v37, &v79);
    v66 = v27;
    sub_2297DD340();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v7 + 8);
    v38(v26, v6);
    *(_WORD *)(v35 + 12) = 2080;
    v62 = v35 + 14;
    v39 = v24;
    sub_2297DC5FC();
    sub_229611304(&qword_255A60968, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v40 = v67;
    v41 = sub_2297DD61C();
    v43 = v42;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v5, v40);
    v78 = sub_22960FB78(v41, v43, &v79);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    v38(v39, v6);
    *(_WORD *)(v35 + 22) = 2048;
    v44 = v70;
    v45 = sub_2297DC5A8();
    v38(v44, v6);
    v78 = v45;
    sub_2297DD340();
    *(_WORD *)(v35 + 32) = 2048;
    v46 = v71;
    v47 = sub_2297DC5D8();
    v38(v46, v6);
    v78 = v47;
    sub_2297DD340();
    *(_WORD *)(v35 + 42) = 2048;
    v48 = v72;
    v49 = sub_2297DC554();
    v38(v48, v6);
    v78 = v49;
    sub_2297DD340();
    *(_WORD *)(v35 + 52) = 2048;
    v50 = v73;
    v51 = sub_2297DC56C();
    v38(v50, v6);
    v78 = v51;
    sub_2297DD340();
    *(_WORD *)(v35 + 62) = 2048;
    v52 = v74;
    v53 = sub_2297DC590();
    v38(v52, v6);
    v78 = v53;
    sub_2297DD340();
    *(_WORD *)(v35 + 72) = 2048;
    v54 = v75;
    v55 = sub_2297DC5C0();
    v38(v54, v6);
    v78 = v55;
    sub_2297DD340();
    *(_WORD *)(v35 + 82) = 2048;
    v56 = v76;
    v57 = sub_2297DC5F0();
    v38(v56, v6);
    v78 = v57;
    sub_2297DD340();
    v58 = v63;
    _os_log_impl(&dword_22960C000, v63, (os_log_type_t)v64, "NowPlayingUsageProvider#affinity (lazy load) For bundle %s - recency: %s frequencies: f2min:%ld f10min:%ld f1hr:%ld f6hr:%ld f1day:%ld f7day:%ld f28day:%ld", (uint8_t *)v35, 0x5Cu);
    v59 = v65;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v59, -1, -1);
    MEMORY[0x22E2D0294](v35, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v77, v66);
  }
  else
  {
    v61 = *(void (**)(char *, uint64_t))(v7 + 8);
    v61(v76, v6);
    v61(v75, v6);
    v61(v74, v6);
    v61(v73, v6);
    v61(v72, v6);
    v61(v71, v6);
    v61(v70, v6);
    v61(v26, v6);
    v61(v24, v6);

    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v77, v27);
  }
}

uint64_t sub_2297CFD0C(uint64_t a1, void (*a2)(_QWORD), uint64_t a3)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double v22;
  double v23;
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
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  char *v38;
  _BYTE *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  char v62;
  _QWORD *v63;
  uint64_t *v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  size_t v72;
  uint64_t result;
  _QWORD v74[2];
  uint64_t v75;
  unint64_t *v76;
  void (*v77)(size_t);
  uint64_t v78;
  unsigned int v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int64_t v84;
  void (*v85)(char *, uint64_t);
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  int64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94[3];

  v6 = sub_2297DC638();
  v81 = *(_QWORD *)(v6 - 8);
  v82 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606C8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2297DC62C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v92 = (char *)v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v74 - v15;
  v90 = sub_2297DBA44();
  v17 = *(_QWORD *)(v90 - 8);
  v18 = MEMORY[0x24BDAC7A8](v90);
  v89 = (char *)v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v74 - v20;
  if (!a1)
    return ((uint64_t (*)(_QWORD))a2)(MEMORY[0x24BEE4AF8]);
  sub_2297DBA38();
  sub_2297DBA08();
  v23 = floor(v22 / 86400.0);
  if ((~*(_QWORD *)&v23 & 0x7FF0000000000000) == 0)
    goto LABEL_55;
  if (v23 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
  }
  else if (v23 < 9.22337204e18)
  {
    v87 = v16;
    v88 = v10;
    v78 = a3;
    v24 = (uint64_t)v23;
    v93 = a1;
    swift_bridgeObjectRetain();
    sub_2297CE844(MEMORY[0x24BEE4B08]);
    v25 = MEMORY[0x24BEE4B00];
    v94[0] = MEMORY[0x24BEE4B00];
    v26 = sub_2297D491C(v93, v24, v94);
    if (!__OFSUB__(v24, 28))
    {
      v27 = v26;
      v77 = a2;
      v28 = swift_bridgeObjectRetain();
      v76 = sub_2297D2978(v28, (unint64_t *)(v24 - 28));
      v74[1] = 0;
      swift_bridgeObjectRelease_n();
      v85 = *(void (**)(char *, uint64_t))(v17 + 8);
      v85(v21, v90);
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = v25;
      v30 = v29 + 16;
      v31 = *(_QWORD *)(v27 + 56);
      v83 = v27 + 56;
      v32 = 1 << *(_BYTE *)(v27 + 32);
      v33 = -1;
      if (v32 < 64)
        v33 = ~(-1 << v32);
      v34 = v27;
      v35 = v33 & v31;
      v84 = (unint64_t)(v32 + 63) >> 6;
      v79 = *MEMORY[0x24BE93230];
      swift_retain_n();
      v75 = v29;
      swift_retain();
      v36 = 0;
      v38 = v87;
      v37 = (uint64_t)v88;
      v39 = v89;
      v40 = v34;
      v86 = v34;
      while (1)
      {
        if (v35)
        {
          v41 = __clz(__rbit64(v35));
          v35 &= v35 - 1;
          v91 = v36;
          v42 = v41 | (v36 << 6);
        }
        else
        {
          v43 = v36 + 1;
          if (__OFADD__(v36, 1))
            goto LABEL_53;
          if (v43 >= v84)
          {
LABEL_49:
            v68 = v75;
            swift_retain();
            v69 = swift_release_n();
            MEMORY[0x24BDAC7A8](v69);
            v74[-2] = sub_2297D52B4;
            v74[-1] = v68;
            v70 = swift_retain();
            sub_2297D43F8(v70, (void (*)(uint64_t, uint64_t))sub_2297D5AA0);
            swift_release();
            swift_beginAccess();
            v71 = swift_bridgeObjectRetain();
            v72 = sub_2297B7614(v71);
            swift_release();
            swift_release();
            swift_release_n();
            swift_bridgeObjectRelease();
            v77(v72);
            return swift_release();
          }
          v44 = *(_QWORD *)(v83 + 8 * v43);
          v45 = v36 + 1;
          if (!v44)
          {
            v45 = v36 + 2;
            if (v36 + 2 >= v84)
              goto LABEL_49;
            v44 = *(_QWORD *)(v83 + 8 * v45);
            if (!v44)
            {
              v45 = v36 + 3;
              if (v36 + 3 >= v84)
                goto LABEL_49;
              v44 = *(_QWORD *)(v83 + 8 * v45);
              if (!v44)
              {
                v45 = v36 + 4;
                if (v36 + 4 >= v84)
                  goto LABEL_49;
                v44 = *(_QWORD *)(v83 + 8 * v45);
                if (!v44)
                {
                  v46 = v36 + 5;
                  if (v36 + 5 >= v84)
                    goto LABEL_49;
                  v44 = *(_QWORD *)(v83 + 8 * v46);
                  if (!v44)
                  {
                    while (1)
                    {
                      v45 = v46 + 1;
                      if (__OFADD__(v46, 1))
                        goto LABEL_54;
                      if (v45 >= v84)
                        goto LABEL_49;
                      v44 = *(_QWORD *)(v83 + 8 * v45);
                      ++v46;
                      if (v44)
                        goto LABEL_28;
                    }
                  }
                  v45 = v36 + 5;
                }
              }
            }
          }
LABEL_28:
          v35 = (v44 - 1) & v44;
          v91 = v45;
          v42 = __clz(__rbit64(v44)) + (v45 << 6);
        }
        v47 = (uint64_t *)(*(_QWORD *)(v40 + 48) + 24 * v42);
        v48 = *v47;
        v49 = v47[1];
        swift_bridgeObjectRetain();
        sub_2297DB9FC();
        swift_beginAccess();
        v50 = *(_QWORD *)v30;
        if (*(_QWORD *)(*(_QWORD *)v30 + 16))
        {
          swift_bridgeObjectRetain();
          v51 = sub_22961AA90(v48, v49);
          if ((v52 & 1) != 0)
          {
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16))(v37, *(_QWORD *)(v50 + 56) + *(_QWORD *)(v12 + 72) * v51, v11);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v37, 0, 1, v11);
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v37, 1, 1, v11);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v37, 1, 1, v11);
        }
        swift_endAccess();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v37, 1, v11) == 1)
        {
          (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v80, v79, v82);
          swift_bridgeObjectRetain();
          sub_2297DC614();
          sub_2297D52BC(v37);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v38, v37, v11);
        }
        SiriRemembersV1API.Aggregation.addInstance(date:)(v39);
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v92, v38, v11);
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v94[0] = *(_QWORD *)v30;
        v54 = v94[0];
        *(_QWORD *)v30 = 0x8000000000000000;
        v56 = sub_22961AA90(v48, v49);
        v57 = *(_QWORD *)(v54 + 16);
        v58 = (v55 & 1) == 0;
        v59 = v57 + v58;
        if (__OFADD__(v57, v58))
        {
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        v60 = v55;
        if (*(_QWORD *)(v54 + 24) >= v59)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v63 = (_QWORD *)v94[0];
            if ((v55 & 1) != 0)
              goto LABEL_9;
          }
          else
          {
            sub_229783310();
            v63 = (_QWORD *)v94[0];
            if ((v60 & 1) != 0)
              goto LABEL_9;
          }
        }
        else
        {
          sub_229781F04(v59, isUniquelyReferenced_nonNull_native);
          v61 = sub_22961AA90(v48, v49);
          if ((v60 & 1) != (v62 & 1))
            goto LABEL_59;
          v56 = v61;
          v63 = (_QWORD *)v94[0];
          if ((v60 & 1) != 0)
          {
LABEL_9:
            (*(void (**)(unint64_t, char *, uint64_t))(v12 + 40))(v63[7] + *(_QWORD *)(v12 + 72) * v56, v92, v11);
            goto LABEL_10;
          }
        }
        v63[(v56 >> 6) + 8] |= 1 << v56;
        v64 = (uint64_t *)(v63[6] + 16 * v56);
        *v64 = v48;
        v64[1] = v49;
        (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v63[7] + *(_QWORD *)(v12 + 72) * v56, v92, v11);
        v65 = v63[2];
        v66 = __OFADD__(v65, 1);
        v67 = v65 + 1;
        if (v66)
          goto LABEL_52;
        v63[2] = v67;
        swift_bridgeObjectRetain();
LABEL_10:
        *(_QWORD *)v30 = v94[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        v38 = v87;
        (*(void (**)(char *, uint64_t))(v12 + 8))(v87, v11);
        v39 = v89;
        v85(v89, v90);
        swift_bridgeObjectRelease();
        v37 = (uint64_t)v88;
        v40 = v86;
        v36 = v91;
      }
    }
    goto LABEL_58;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  result = sub_2297DD694();
  __break(1u);
  return result;
}

uint64_t sub_2297D0548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_2297DCB30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DD280();
  if (qword_255A589D8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A59758);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2297DF330;
  v5 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v4 + 64) = v5;
  *(_QWORD *)(v4 + 32) = 1;
  sub_2297DCB24();
  sub_2297DCB00();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2297D0694(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v42 = a1;
  v3 = *v2;
  v44 = a2;
  v45 = v3;
  v4 = sub_2297DBA44();
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  v5 = *(_QWORD *)(v39 + 64);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v36 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)&v36 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - v12;
  v14 = sub_2297DCB54();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v2;
  objc_msgSend((id)v2[5], sel_lock);
  if (qword_255A58C08 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v14, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  v19 = sub_2297DCB3C();
  v20 = sub_2297DD160();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22960C000, v19, v20, "NowPlayingUsageProvider#update [lock aquired]", v21, 2u);
    MEMORY[0x22E2D0294](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_2297DBA38();
  v22 = v43;
  sub_2297DB9CC();
  sub_2297DBA08();
  v23 = v39;
  v37 = *(void (**)(char *, uint64_t))(v39 + 8);
  v24 = v9;
  v25 = v40;
  v37(v24, v40);
  v26 = (uint64_t)v41;
  sub_2297DB9FC();
  v27 = v38;
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v38, v13, v25);
  v28 = (*(unsigned __int8 *)(v23 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v29 = (v5 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v22;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v30 + v28, v27, v25);
  v31 = (_QWORD *)(v30 + v29);
  v33 = v44;
  v32 = v45;
  *v31 = v42;
  v31[1] = v33;
  *(_QWORD *)(v30 + ((v29 + 23) & 0xFFFFFFFFFFFFFFF8)) = v32;
  swift_retain();
  swift_retain();
  sub_22961F6B0(v26, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)sub_2297D517C, v30);
  swift_release();
  v34 = (uint64_t (*)(char *, uint64_t))v37;
  v37((char *)v26, v25);
  return v34(v13, v25);
}

uint64_t sub_2297D09C4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(size_t), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t isUniquelyReferenced_nonNull_native;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t *v41;
  uint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  char v69;
  unint64_t v70;
  char v71;
  _QWORD *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  _BOOL8 v108;
  uint64_t v109;
  char v110;
  unint64_t v111;
  char v112;
  _QWORD *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  size_t v121;
  uint64_t result;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  unint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(size_t);
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE *v144;
  char *v145;
  _BYTE *i;
  uint64_t v147;
  uint64_t v148[3];

  v129 = a5;
  v130 = a4;
  v124 = sub_2297DCB54();
  v123 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v125 = (char *)&v123 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2297DC638();
  v134 = *(_QWORD *)(v9 - 8);
  v135 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v133 = (char *)&v123 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606C8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (unint64_t)&v123 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v123 - v15;
  isUniquelyReferenced_nonNull_native = sub_2297DC62C();
  v18 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v19 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v139 = (char *)&v123 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v123 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v145 = (char *)&v123 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v137 = (char *)&v123 - v26;
  v27 = sub_2297DBA44();
  v140 = *(_QWORD *)(v27 - 8);
  v141 = v27;
  v28 = MEMORY[0x24BDAC7A8](v27);
  v144 = (char *)&v123 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  i = (char *)&v123 - v30;
  v132 = a2;
  v32 = *(_QWORD *)(a2 + 24);
  v31 = *(_QWORD *)(a2 + 32);
  if (a1)
    v33 = a1;
  else
    v33 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2297DBA08();
  v35 = v34;
  v36 = floor(v34 / 86400.0);
  if ((~*(_QWORD *)&v36 & 0x7FF0000000000000) == 0)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  if (v36 <= -9.22337204e18)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  if (v36 >= 9.22337204e18)
  {
LABEL_106:
    __break(1u);
LABEL_107:
    __break(1u);
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v131 = a1;
  v136 = v16;
  v138 = v23;
  v128 = a3;
  v37 = (uint64_t)v36;
  v147 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2297CE844(v32);
  swift_bridgeObjectRelease();
  v148[0] = v31;
  v38 = v147;
  swift_bridgeObjectRetain();
  v39 = sub_2297D491C(v38, v37, v148);
  v40 = __OFSUB__(v37, 28);
  v41 = (unint64_t *)(v37 - 28);
  if (v40)
    goto LABEL_107;
  a1 = v39;
  v42 = swift_bridgeObjectRetain();
  v43 = sub_2297D2978(v42, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v142 = a1;
  v143 = isUniquelyReferenced_nonNull_native;
  v127 = v43;
  v126 = 0;
  if (v131)
  {
    v44 = v132;
    *(double *)(v132 + 16) = v35;
    *(_QWORD *)(v44 + 24) = a1;
    *(_QWORD *)(v44 + 32) = v43;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = swift_allocObject();
    *(_QWORD *)(v45 + 16) = MEMORY[0x24BEE4B00];
    v46 = v45 + 16;
    v47 = *(_QWORD *)(a1 + 56);
    v139 = (char *)(a1 + 56);
    v48 = 1 << *(_BYTE *)(a1 + 32);
    v49 = -1;
    if (v48 < 64)
      v49 = ~(-1 << v48);
    v14 = v49 & v47;
    v144 = (_BYTE *)((unint64_t)(v48 + 63) >> 6);
    LODWORD(v138) = *MEMORY[0x24BE93230];
    swift_retain_n();
    v131 = v45;
    swift_retain();
    v50 = 0;
    v51 = (uint64_t)v136;
    v52 = v137;
    while (1)
    {
      if (v14)
      {
        v53 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        v54 = v53 | (v50 << 6);
      }
      else
      {
        v55 = v50 + 1;
        if (__OFADD__(v50, 1))
          goto LABEL_100;
        if (v55 >= (uint64_t)v144)
        {
LABEL_50:
          v76 = v131;
          swift_retain();
          v77 = swift_release_n();
          MEMORY[0x24BDAC7A8](v77);
          *(&v123 - 2) = (uint64_t)sub_2297D52B4;
          *(&v123 - 1) = v76;
          v78 = swift_retain();
          sub_2297D43F8(v78, (void (*)(uint64_t, uint64_t))sub_2297D5AA0);
          swift_release();
          goto LABEL_96;
        }
        v56 = *(_QWORD *)&v139[8 * v55];
        ++v50;
        if (!v56)
        {
          v50 = v55 + 1;
          if (v55 + 1 >= (uint64_t)v144)
            goto LABEL_50;
          v56 = *(_QWORD *)&v139[8 * v50];
          if (!v56)
          {
            v50 = v55 + 2;
            if (v55 + 2 >= (uint64_t)v144)
              goto LABEL_50;
            v56 = *(_QWORD *)&v139[8 * v50];
            if (!v56)
            {
              v50 = v55 + 3;
              if (v55 + 3 >= (uint64_t)v144)
                goto LABEL_50;
              v56 = *(_QWORD *)&v139[8 * v50];
              if (!v56)
              {
                v57 = v55 + 4;
                if (v57 >= (uint64_t)v144)
                  goto LABEL_50;
                v56 = *(_QWORD *)&v139[8 * v57];
                if (!v56)
                {
                  while (1)
                  {
                    v50 = v57 + 1;
                    if (__OFADD__(v57, 1))
                      goto LABEL_103;
                    if (v50 >= (uint64_t)v144)
                      goto LABEL_50;
                    v56 = *(_QWORD *)&v139[8 * v50];
                    ++v57;
                    if (v56)
                      goto LABEL_31;
                  }
                }
                v50 = v57;
              }
            }
          }
        }
LABEL_31:
        v14 = (v56 - 1) & v56;
        v54 = __clz(__rbit64(v56)) + (v50 << 6);
      }
      v58 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 24 * v54);
      v59 = *v58;
      a1 = v58[1];
      swift_bridgeObjectRetain();
      sub_2297DB9FC();
      swift_beginAccess();
      v60 = *(_QWORD *)v46;
      if (*(_QWORD *)(*(_QWORD *)v46 + 16))
      {
        swift_bridgeObjectRetain();
        v61 = sub_22961AA90(v59, a1);
        if ((v62 & 1) != 0)
        {
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 16))(v51, *(_QWORD *)(v60 + 56) + *(_QWORD *)(v18 + 72) * v61, isUniquelyReferenced_nonNull_native);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v51, 0, 1, isUniquelyReferenced_nonNull_native);
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v51, 1, 1, isUniquelyReferenced_nonNull_native);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v51, 1, 1, isUniquelyReferenced_nonNull_native);
      }
      swift_endAccess();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v51, 1, isUniquelyReferenced_nonNull_native) == 1)
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v134 + 104))(v133, v138, v135);
        swift_bridgeObjectRetain();
        sub_2297DC614();
        sub_2297D52BC(v51);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v52, v51, isUniquelyReferenced_nonNull_native);
      }
      SiriRemembersV1API.Aggregation.addInstance(date:)(i);
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v145, v52, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v148[0] = *(_QWORD *)v46;
      v63 = v148[0];
      *(_QWORD *)v46 = 0x8000000000000000;
      v65 = sub_22961AA90(v59, a1);
      v66 = *(_QWORD *)(v63 + 16);
      v67 = (v64 & 1) == 0;
      v68 = v66 + v67;
      if (__OFADD__(v66, v67))
        break;
      v69 = v64;
      if (*(_QWORD *)(v63 + 24) >= v68)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_229783310();
      }
      else
      {
        sub_229781F04(v68, isUniquelyReferenced_nonNull_native);
        v70 = sub_22961AA90(v59, a1);
        if ((v69 & 1) != (v71 & 1))
        {
LABEL_110:
          result = sub_2297DD694();
          __break(1u);
          return result;
        }
        v65 = v70;
      }
      isUniquelyReferenced_nonNull_native = v143;
      v72 = (_QWORD *)v148[0];
      if ((v69 & 1) != 0)
      {
        (*(void (**)(unint64_t, char *, uint64_t))(v18 + 40))(*(_QWORD *)(v148[0] + 56) + *(_QWORD *)(v18 + 72) * v65, v145, v143);
      }
      else
      {
        *(_QWORD *)(v148[0] + 8 * (v65 >> 6) + 64) |= 1 << v65;
        v73 = (uint64_t *)(v72[6] + 16 * v65);
        *v73 = v59;
        v73[1] = a1;
        (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v72[7] + *(_QWORD *)(v18 + 72) * v65, v145, isUniquelyReferenced_nonNull_native);
        v74 = v72[2];
        v40 = __OFADD__(v74, 1);
        v75 = v74 + 1;
        if (v40)
          goto LABEL_99;
        v72[2] = v75;
        swift_bridgeObjectRetain();
      }
      *(_QWORD *)v46 = v148[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v52 = v137;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v137, isUniquelyReferenced_nonNull_native);
      (*(void (**)(_BYTE *, uint64_t))(v140 + 8))(i, v141);
      swift_bridgeObjectRelease();
      a1 = v142;
      v51 = (uint64_t)v136;
    }
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  if (qword_255A58C08 != -1)
LABEL_109:
    swift_once();
  v79 = v124;
  v80 = __swift_project_value_buffer(v124, (uint64_t)qword_255A67F80);
  v81 = v123;
  v82 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v125, v80, v79);
  v83 = sub_2297DCB3C();
  v84 = sub_2297DD16C();
  if (os_log_type_enabled(v83, v84))
  {
    v85 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v85 = 0;
    _os_log_impl(&dword_22960C000, v83, v84, "NowPlayingUsageProvider#update skipping persistence as events invalid", v85, 2u);
    MEMORY[0x22E2D0294](v85, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v79);
  v86 = swift_allocObject();
  *(_QWORD *)(v86 + 16) = MEMORY[0x24BEE4B00];
  v87 = v86 + 16;
  v88 = *(_QWORD *)(a1 + 56);
  v137 = (char *)(a1 + 56);
  v89 = 1 << *(_BYTE *)(a1 + 32);
  v90 = -1;
  if (v89 < 64)
    v90 = ~(-1 << v89);
  v91 = v90 & v88;
  v145 = (char *)((unint64_t)(v89 + 63) >> 6);
  LODWORD(v136) = *MEMORY[0x24BE93230];
  swift_retain_n();
  v131 = v86;
  swift_retain();
  v92 = 0;
  for (i = (_BYTE *)v14; ; v14 = (unint64_t)i)
  {
    if (v91)
    {
      v93 = __clz(__rbit64(v91));
      v91 &= v91 - 1;
      v94 = v93 | (v92 << 6);
      goto LABEL_77;
    }
    v95 = v92 + 1;
    if (__OFADD__(v92, 1))
      goto LABEL_102;
    if (v95 >= (uint64_t)v145)
      break;
    v96 = *(_QWORD *)&v137[8 * v95];
    ++v92;
    if (!v96)
    {
      v92 = v95 + 1;
      if (v95 + 1 >= (uint64_t)v145)
        break;
      v96 = *(_QWORD *)&v137[8 * v92];
      if (!v96)
      {
        v92 = v95 + 2;
        if (v95 + 2 >= (uint64_t)v145)
          break;
        v96 = *(_QWORD *)&v137[8 * v92];
        if (!v96)
        {
          v92 = v95 + 3;
          if (v95 + 3 >= (uint64_t)v145)
            break;
          v96 = *(_QWORD *)&v137[8 * v92];
          if (!v96)
          {
            v97 = v95 + 4;
            if (v97 >= (uint64_t)v145)
              break;
            v96 = *(_QWORD *)&v137[8 * v97];
            if (!v96)
            {
              while (1)
              {
                v92 = v97 + 1;
                if (__OFADD__(v97, 1))
                  goto LABEL_108;
                if (v92 >= (uint64_t)v145)
                  goto LABEL_95;
                v96 = *(_QWORD *)&v137[8 * v92];
                ++v97;
                if (v96)
                  goto LABEL_76;
              }
            }
            v92 = v97;
          }
        }
      }
    }
LABEL_76:
    v91 = (v96 - 1) & v96;
    v94 = __clz(__rbit64(v96)) + (v92 << 6);
LABEL_77:
    v98 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 24 * v94);
    v99 = *v98;
    v100 = v98[1];
    swift_bridgeObjectRetain();
    sub_2297DB9FC();
    swift_beginAccess();
    v101 = *(_QWORD *)v87;
    if (*(_QWORD *)(*(_QWORD *)v87 + 16))
    {
      swift_bridgeObjectRetain();
      v102 = sub_22961AA90(v99, v100);
      v103 = v138;
      if ((v104 & 1) != 0)
      {
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v18 + 16))(v14, *(_QWORD *)(v101 + 56) + *(_QWORD *)(v18 + 72) * v102, isUniquelyReferenced_nonNull_native);
        (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, isUniquelyReferenced_nonNull_native);
      }
      else
      {
        (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v14, 1, 1, isUniquelyReferenced_nonNull_native);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v14, 1, 1, isUniquelyReferenced_nonNull_native);
      v103 = v138;
    }
    swift_endAccess();
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v18 + 48))(v14, 1, isUniquelyReferenced_nonNull_native) == 1)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v134 + 104))(v133, v136, v135);
      swift_bridgeObjectRetain();
      sub_2297DC614();
      sub_2297D52BC(v14);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v18 + 32))(v103, v14, isUniquelyReferenced_nonNull_native);
    }
    SiriRemembersV1API.Aggregation.addInstance(date:)(v144);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v139, v103, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRetain();
    a1 = swift_isUniquelyReferenced_nonNull_native();
    v148[0] = *(_QWORD *)v87;
    v105 = v148[0];
    *(_QWORD *)v87 = 0x8000000000000000;
    v14 = sub_22961AA90(v99, v100);
    v107 = *(_QWORD *)(v105 + 16);
    v108 = (v106 & 1) == 0;
    v109 = v107 + v108;
    if (__OFADD__(v107, v108))
      goto LABEL_98;
    v110 = v106;
    if (*(_QWORD *)(v105 + 24) >= v109)
    {
      if ((a1 & 1) == 0)
        sub_229783310();
    }
    else
    {
      sub_229781F04(v109, a1);
      v111 = sub_22961AA90(v99, v100);
      if ((v110 & 1) != (v112 & 1))
        goto LABEL_110;
      v14 = v111;
    }
    a1 = v142;
    v113 = (_QWORD *)v148[0];
    if ((v110 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = v143;
      (*(void (**)(unint64_t, char *, uint64_t))(v18 + 40))(*(_QWORD *)(v148[0] + 56) + *(_QWORD *)(v18 + 72) * v14, v139, v143);
    }
    else
    {
      *(_QWORD *)(v148[0] + 8 * (v14 >> 6) + 64) |= 1 << v14;
      v114 = (uint64_t *)(v113[6] + 16 * v14);
      *v114 = v99;
      v114[1] = v100;
      isUniquelyReferenced_nonNull_native = v143;
      (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v113[7] + *(_QWORD *)(v18 + 72) * v14, v139, v143);
      v115 = v113[2];
      v40 = __OFADD__(v115, 1);
      v116 = v115 + 1;
      if (v40)
        goto LABEL_101;
      v113[2] = v116;
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)v87 = v148[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v138, isUniquelyReferenced_nonNull_native);
    (*(void (**)(_BYTE *, uint64_t))(v140 + 8))(v144, v141);
    swift_bridgeObjectRelease();
  }
LABEL_95:
  v117 = v131;
  swift_retain();
  v118 = swift_release_n();
  MEMORY[0x24BDAC7A8](v118);
  *(&v123 - 2) = (uint64_t)sub_2297D52B4;
  *(&v123 - 1) = v117;
  v119 = swift_retain();
  sub_2297D43F8(v119, (void (*)(uint64_t, uint64_t))sub_2297D52FC);
  swift_release();
LABEL_96:
  swift_beginAccess();
  v120 = swift_bridgeObjectRetain();
  v121 = sub_2297B7614(v120);
  swift_release();
  swift_release();
  swift_release_n();
  swift_bridgeObjectRelease();
  v130(v121);
  swift_release();
  return sub_2297D1928(v132, v128);
}

uint64_t sub_2297D1928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint8_t *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v4 = sub_2297DBA44();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v25 - v9;
  v11 = sub_2297DCB54();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(a1 + 40), sel_unlock);
  if (qword_255A58C08 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a2, v4);
  v16 = sub_2297DCB3C();
  v17 = sub_2297DD160();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v26 = v12;
    v19 = v18;
    *(_DWORD *)v18 = 134217984;
    v25[1] = v18 + 4;
    sub_2297DBA38();
    sub_2297DB9C0();
    v21 = v20;
    v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v22(v8, v4);
    v27 = v21;
    sub_2297DD340();
    v22(v10, v4);
    _os_log_impl(&dword_22960C000, v16, v17, "NowPlayingUsageProvider#update complete in %fs", v19, 0xCu);
    v23 = v19;
    v12 = v26;
    MEMORY[0x22E2D0294](v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2297D1B78(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a4;
  v29 = sub_2297DC638();
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606C8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v16 = sub_2297DC62C();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v20 = *(_QWORD *)(a5 + 16);
  v21 = *(_QWORD *)(v20 + 16);
  v31 = a1;
  if (v21)
  {
    swift_bridgeObjectRetain();
    v22 = sub_22961AA90(a1, a2);
    if ((v23 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v15, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v17 + 72) * v22, v16);
      v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      v24(v15, 0, 1, v16);
    }
    else
    {
      v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      v24(v15, 1, 1, v16);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v24(v15, 1, 1, v16);
  }
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v28, *MEMORY[0x24BE93230], v29);
    swift_bridgeObjectRetain();
    sub_2297DC614();
    result = sub_2297D52BC((uint64_t)v15);
  }
  else
  {
    result = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  }
  v26 = v30;
  if (v30 < 1)
  {
    __break(1u);
  }
  else
  {
    do
    {
      SiriRemembersV1API.Aggregation.addInstance(date:)(a3);
      --v26;
    }
    while (v26);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v19, v16);
    v24(v13, 0, 1, v16);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2297AC414((uint64_t)v13, v31, a2);
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  return result;
}

uint64_t sub_2297D1E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;

  v7 = sub_2297DBA44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2297DB9FC();
  v13 = a3;
  v14 = a4;
  v15 = v10;
  sub_2297D457C(a2, (void (*)(uint64_t, uint64_t, uint64_t))sub_2297D5304);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2297D1F20()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746E65636572;
  if (*v0 != 1)
    v1 = 0x794273746E657665;
  if (*v0)
    return v1;
  else
    return 0x6D617473656D6974;
}

uint64_t sub_2297D1F84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2297D4A98(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2297D1FA8()
{
  return 0;
}

uint64_t sub_2297D1FB4()
{
  sub_2297D4E28();
  return sub_2297DD790();
}

uint64_t sub_2297D1FDC()
{
  sub_2297D4E28();
  return sub_2297DD79C();
}

uint64_t sub_2297D2004(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B70);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2297D4E28();
  sub_2297DD778();
  LOBYTE(v13) = 0;
  sub_2297DD5EC();
  if (!v3)
  {
    v13 = a2;
    HIBYTE(v12) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B40);
    sub_2297D4F40(&qword_255A60B78, (uint64_t (*)(void))sub_2297D4FA8, MEMORY[0x24BEE1700]);
    sub_2297DD5F8();
    v13 = a3;
    HIBYTE(v12) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B58);
    sub_2297D4FEC();
    sub_2297DD5F8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2297D21B0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BF0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2297D58B8();
  sub_2297DD778();
  v8[15] = 0;
  sub_2297DD5E0();
  if (!v1)
  {
    v8[14] = 1;
    sub_2297DD5EC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_2297D22E0()
{
  sub_2297DD700();
  swift_bridgeObjectRetain();
  sub_2297DCEE4();
  swift_bridgeObjectRelease();
  sub_2297DD730();
  return sub_2297DD73C();
}

uint64_t sub_2297D235C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_2297D4C08(a1);
  if (!v2)
  {
    *a2 = v6;
    a2[1] = result;
    a2[2] = v5;
  }
  return result;
}

uint64_t sub_2297D2388(_QWORD *a1)
{
  uint64_t v1;

  return sub_2297D2004(a1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

uint64_t sub_2297D23A4()
{
  _BYTE *v0;

  if (*v0)
    return 0x6D617473656D6974;
  else
    return 0xD000000000000010;
}

uint64_t sub_2297D23E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2297D562C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2297D240C()
{
  sub_2297D58B8();
  return sub_2297DD790();
}

uint64_t sub_2297D2434()
{
  sub_2297D58B8();
  return sub_2297DD79C();
}

uint64_t sub_2297D245C()
{
  return sub_2297D22E0();
}

uint64_t sub_2297D2468()
{
  swift_bridgeObjectRetain();
  sub_2297DCEE4();
  swift_bridgeObjectRelease();
  return sub_2297DD730();
}

uint64_t sub_2297D24C4()
{
  sub_2297DD700();
  swift_bridgeObjectRetain();
  sub_2297DCEE4();
  swift_bridgeObjectRelease();
  sub_2297DD730();
  return sub_2297DD73C();
}

void sub_2297D2534(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  double v6;

  v6 = sub_2297D5724(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(double *)(a2 + 16) = v6;
  }
}

uint64_t sub_2297D2560(_QWORD *a1)
{
  return sub_2297D21B0(a1);
}

BOOL sub_2297D257C(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  char v5;
  _BOOL8 result;

  v2 = *(double *)(a1 + 16);
  v3 = *(double *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 == v3;
  v5 = sub_2297DD658();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_2297D25D8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NowPlayingUsageProvider()
{
  return objc_opt_self();
}

_QWORD *assignWithCopy for NowPlayingUsageProvider.Store(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for NowPlayingUsageProvider.Store(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Store()
{
  return &type metadata for NowPlayingUsageProvider.Store;
}

uint64_t sub_2297D26F4(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_2297DD460();
    v19 = v6;
    sub_2297DD3F4();
    if (sub_2297DD418())
    {
      sub_229619C70(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_2296360A0(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_2297DD304();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_2297DD418());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

unint64_t sub_2297D28F8(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2297DD304();
  result = sub_2297DD3E8();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

unint64_t *sub_2297D2978(uint64_t isStackAllocationSafe, unint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  unint64_t v6;
  size_t v7;
  unint64_t *v8;
  void *v9;
  _QWORD v11[2];

  v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(isStackAllocationSafe + 32);
  v6 = (unint64_t)((1 << v5) + 63) >> 6;
  v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    v8 = sub_2297D2ADC((_QWORD *)((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, v4, (uint64_t)a2);
    if (v2)
      swift_willThrow();
    else
      return v8;
  }
  else
  {
    v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    a2 = sub_2297D2ADC((unint64_t *)v9, v6, v4, (uint64_t)a2);
    MEMORY[0x22E2D0294](v9, -1, -1);
  }
  return a2;
}

unint64_t *sub_2297D2ADC(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v5 = 0;
  v6 = 0;
  v7 = a3 + 64;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11)
      return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
    v15 = *(_QWORD *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v11)
        return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
      v15 = *(_QWORD *)(v7 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v11)
          return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
        v15 = *(_QWORD *)(v7 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    if (*(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v13) > a4)
    {
      *(unint64_t *)((char *)result + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
      }
    }
  }
  v16 = v14 + 3;
  if (v16 >= v11)
    return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      return (unint64_t *)sub_2297D34BC(result, a2, v5, a3);
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2297D2C2C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BA8);
  result = sub_2297DD598();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_BYTE *)(*(_QWORD *)(v4 + 56) + v13);
    sub_2297DD700();
    swift_bridgeObjectRetain();
    sub_2297DCEE4();
    result = sub_2297DD73C();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2297D2ED0(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v8 = sub_2297DC62C();
  v49 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v47 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5F0F0);
  result = sub_2297DD598();
  v14 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 64;
  v18 = v47;
  v19 = v48;
  v46 = a4;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v50 = v16;
      v21 = v20 | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v14;
      v23 = v44[v22];
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v45)
          return v14;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v45)
            return v14;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v16 + 4;
            if (v16 + 4 >= v45)
              return v14;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v14;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v16 + 4;
          }
        }
      }
LABEL_24:
      v15 = (v23 - 1) & v23;
      v50 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = a4[7];
    v27 = (uint64_t *)(a4[6] + 16 * v21);
    v28 = *v27;
    v29 = v27[1];
    v30 = v49;
    v31 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    sub_2297DD700();
    swift_bridgeObjectRetain();
    sub_2297DCEE4();
    result = sub_2297DD73C();
    v33 = -1 << *(_BYTE *)(v14 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      v18 = v47;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v33) >> 6;
      v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v39 = v35 == v38;
        if (v35 == v38)
          v35 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    v41 = (_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v36);
    *v41 = v28;
    v41[1] = v29;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(_QWORD *)(v14 + 56) + v36 * v31, v51, v18);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v46;
    v16 = v50;
    if (!a3)
      return v14;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2297D3218(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5C158);
  result = sub_2297DD598();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v13);
    sub_2297DD700();
    swift_bridgeObjectRetain();
    sub_2297DCEE4();
    result = sub_2297DD73C();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2297D34BC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t *v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5F0F8);
  result = sub_2297DD598();
  v9 = result;
  v31 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
        return v9;
      v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          return v9;
        v16 = v31[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            return v9;
          v16 = v31[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              return v9;
            v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  return v9;
                v16 = v31[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = 8 * v14;
    v19 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + v18);
    v20 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    result = sub_2297DD6F4();
    v21 = -1 << *(_BYTE *)(v9 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = 8 * v24;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + v29) = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v29) = v20;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    result = swift_bridgeObjectRetain();
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2297D3730(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_2297DD40C();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_229619C70(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_2297DD400();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_2297D26F4(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_2296360A0(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_2297D28F8((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_2297DD304();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_229619C70(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_2297DD310();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_2297DD310();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_229626664((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

void *sub_2297D39F8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A59760);
  v2 = *v0;
  v3 = sub_2297DD448();
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

void *sub_2297D3BA8()
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
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5F570);
  v2 = *v0;
  v3 = sub_2297DD448();
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
    v16 = 40 * v15;
    result = (void *)sub_2296D2F60(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

id sub_2297D3D74(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2297DD448();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2297D3F14()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BB8);
  v2 = *v0;
  v3 = sub_2297DD448();
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

void *sub_2297D40A8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BB0);
  v2 = *v0;
  v3 = sub_2297DD448();
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

void *sub_2297D423C()
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
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BA0);
  v2 = *v0;
  v3 = sub_2297DD448();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_28;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
      {
        v9 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_28;
        v22 = *(_QWORD *)(v6 + 8 * v9);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = v17[2];
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = *v17;
    v20[1] = v18;
    v20[2] = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 3;
  if (v23 >= v13)
    goto LABEL_28;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2297D43F8(uint64_t a1, void (*a2)(uint64_t, uint64_t))
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

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
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v8)
      return swift_release();
    v17 = *(_QWORD *)(v4 + 8 * v16);
    ++v10;
    if (!v17)
    {
      v10 = v16 + 1;
      if (v16 + 1 >= v8)
        return swift_release();
      v17 = *(_QWORD *)(v4 + 8 * v10);
      if (!v17)
      {
        v10 = v16 + 2;
        if (v16 + 2 >= v8)
          return swift_release();
        v17 = *(_QWORD *)(v4 + 8 * v10);
        if (!v17)
        {
          v10 = v16 + 3;
          if (v16 + 3 >= v8)
            return swift_release();
          v17 = *(_QWORD *)(v4 + 8 * v10);
          if (!v17)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v17 - 1) & v17;
    v12 = __clz(__rbit64(v17)) + (v10 << 6);
LABEL_5:
    v13 = 8 * v12;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v13);
    swift_bridgeObjectRetain();
    a2(v14, v15);
    result = swift_bridgeObjectRelease();
  }
  v18 = v16 + 4;
  if (v18 >= v8)
    return swift_release();
  v17 = *(_QWORD *)(v4 + 8 * v18);
  if (v17)
  {
    v10 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v17 = *(_QWORD *)(v4 + 8 * v10);
    ++v18;
    if (v17)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2297D457C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
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
    a2(v14, v15, v16);
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

uint64_t sub_2297D4704(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];
  int64_t v27;

  v23 = (unint64_t *)result;
  v9 = 0;
  v24 = 0;
  v25 = a3 + 56;
  v10 = 1 << *(_BYTE *)(a3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a3 + 56);
  v27 = (unint64_t)(v10 + 63) >> 6;
  while (v12)
  {
    v13 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    v14 = v13 | (v9 << 6);
LABEL_17:
    v18 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 24 * v14);
    v19 = v18[1];
    v20 = v18[2];
    v26[0] = *v18;
    v26[1] = v19;
    v26[2] = v20;
    swift_bridgeObjectRetain();
    v21 = sub_2296372B4((_BOOL8)v26, a4, a5);
    result = swift_bridgeObjectRelease();
    if (v5)
      return result;
    if (v21)
    {
      *(unint64_t *)((char *)v23 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = __OFADD__(v24++, 1);
      if (v15)
        goto LABEL_30;
    }
  }
  v15 = __OFADD__(v9++, 1);
  if (v15)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v9 >= v27)
    goto LABEL_26;
  v16 = *(_QWORD *)(v25 + 8 * v9);
  if (v16)
  {
LABEL_16:
    v12 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v9 << 6);
    goto LABEL_17;
  }
  v17 = v9 + 1;
  if (v9 + 1 >= v27)
    goto LABEL_26;
  v16 = *(_QWORD *)(v25 + 8 * v17);
  if (v16)
    goto LABEL_15;
  v17 = v9 + 2;
  if (v9 + 2 >= v27)
    goto LABEL_26;
  v16 = *(_QWORD *)(v25 + 8 * v17);
  if (v16)
    goto LABEL_15;
  v17 = v9 + 3;
  if (v9 + 3 >= v27)
  {
LABEL_26:
    swift_retain();
    return sub_22961BF40(v23, a2, v24, a3);
  }
  v16 = *(_QWORD *)(v25 + 8 * v17);
  if (v16)
  {
LABEL_15:
    v9 = v17;
    goto LABEL_16;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v27)
      goto LABEL_26;
    v16 = *(_QWORD *)(v25 + 8 * v9);
    ++v17;
    if (v16)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2297D491C(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_2297D4704((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2, a3);
    swift_release();
    if (v3)
      swift_willThrow();
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    v10 = sub_2297D4704((uint64_t)v11, v8, v6, a2, a3);
    swift_release();
    MEMORY[0x22E2D0294](v11, -1, -1);
  }
  return v10;
}

uint64_t sub_2297D4A98(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
  if (v2 || (sub_2297DD658() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65636572 && a2 == 0xE600000000000000 || (sub_2297DD658() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x794273746E657665 && a2 == 0xEB00000000796144)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2297DD658();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2297D4C08(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B30);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2297D4E28();
  sub_2297DD76C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v11) = 0;
    sub_2297DD5C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B40);
    v10 = 1;
    sub_2297D4F40(&qword_255A60B48, (uint64_t (*)(void))sub_2297D4E6C, MEMORY[0x24BEE1720]);
    sub_2297DD5D4();
    v7 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A60B58);
    v10 = 2;
    sub_2297D4EB0();
    swift_bridgeObjectRetain();
    sub_2297DD5D4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_2297D4E28()
{
  unint64_t result;

  result = qword_255A60B38;
  if (!qword_255A60B38)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E8674, &type metadata for NowPlayingUsageProvider.Store.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60B38);
  }
  return result;
}

unint64_t sub_2297D4E6C()
{
  unint64_t result;

  result = qword_255A60B50;
  if (!qword_255A60B50)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E864C, &type metadata for NowPlayingUsageProvider.Event);
    atomic_store(result, (unint64_t *)&qword_255A60B50);
  }
  return result;
}

unint64_t sub_2297D4EB0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255A60B60;
  if (!qword_255A60B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A60B58);
    v2 = MEMORY[0x24BEE04E0];
    v3[0] = MEMORY[0x24BEE1798];
    v3[1] = sub_2297D507C(&qword_255A60B68, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1798], MEMORY[0x24BEE04E0]);
    result = MEMORY[0x22E2D01BC](v2, v1, v3);
    atomic_store(result, (unint64_t *)&qword_255A60B60);
  }
  return result;
}

uint64_t sub_2297D4F40(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A60B40);
    v8 = a2();
    result = MEMORY[0x22E2D01BC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2297D4FA8()
{
  unint64_t result;

  result = qword_255A60B80;
  if (!qword_255A60B80)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E8624, &type metadata for NowPlayingUsageProvider.Event);
    atomic_store(result, (unint64_t *)&qword_255A60B80);
  }
  return result;
}

unint64_t sub_2297D4FEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255A60B88;
  if (!qword_255A60B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A60B58);
    v2 = MEMORY[0x24BEE04C0];
    v3[0] = MEMORY[0x24BEE1770];
    v3[1] = sub_2297D507C(&qword_255A60B90, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1770], MEMORY[0x24BEE04C0]);
    result = MEMORY[0x22E2D01BC](v2, v1, v3);
    atomic_store(result, (unint64_t *)&qword_255A60B88);
  }
  return result;
}

uint64_t sub_2297D507C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A5C850);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x22E2D01BC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2297D50E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2297DBA44();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297D517C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(sub_2297DBA44() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_2297D09C4(a1, *(_QWORD *)(v1 + 16), v1 + v4, *(void (**)(size_t))v5, *(_QWORD *)(v5 + 8));
}

uint64_t sub_2297D51E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = sub_2297DBA44();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = (v3 + 16 + ((((*(_QWORD *)(v2 + 64) + 7 + v4) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v3;
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v6(v0 + v4, v1);
  swift_release();
  v6(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_2297D5290()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297D52B4(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v4;

  return sub_2297D1B78(a1, a2, a3, a4, v4);
}

uint64_t sub_2297D52BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2297D52FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2297D1E54(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_2297D5304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v3 + 16))(a1, a2, *(_QWORD *)(v3 + 32), a3);
}

uint64_t sub_2297D5330()
{
  return sub_2297CF228();
}

uint64_t sub_2297D5338()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2297D535C(uint64_t a1)
{
  uint64_t v1;

  return sub_2297CFD0C(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t storeEnumTagSinglePayload for NowPlayingUsageProvider.Store.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2297D53B4 + 4 * byte_2297E8425[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2297D53E8 + 4 * byte_2297E8420[v4]))();
}

uint64_t sub_2297D53E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297D53F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2297D53F8);
  return result;
}

uint64_t sub_2297D5404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2297D540CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2297D5410(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297D5418(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Store.CodingKeys()
{
  return &type metadata for NowPlayingUsageProvider.Store.CodingKeys;
}

_QWORD *sub_2297D5438(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NowPlayingUsageProvider.Event(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for NowPlayingUsageProvider.Event(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Event()
{
  return &type metadata for NowPlayingUsageProvider.Event;
}

unint64_t sub_2297D5510()
{
  unint64_t result;

  result = qword_255A60BC0;
  if (!qword_255A60BC0)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E8504, &type metadata for NowPlayingUsageProvider.Event);
    atomic_store(result, (unint64_t *)&qword_255A60BC0);
  }
  return result;
}

unint64_t sub_2297D5558()
{
  unint64_t result;

  result = qword_255A60BC8;
  if (!qword_255A60BC8)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E85FC, &type metadata for NowPlayingUsageProvider.Store.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60BC8);
  }
  return result;
}

unint64_t sub_2297D55A0()
{
  unint64_t result;

  result = qword_255A60BD0;
  if (!qword_255A60BD0)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E856C, &type metadata for NowPlayingUsageProvider.Store.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60BD0);
  }
  return result;
}

unint64_t sub_2297D55E8()
{
  unint64_t result;

  result = qword_255A60BD8;
  if (!qword_255A60BD8)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E8594, &type metadata for NowPlayingUsageProvider.Store.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60BD8);
  }
  return result;
}

uint64_t sub_2297D562C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x80000002297ED680 || (sub_2297DD658() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2297DD658();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

double sub_2297D5724(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v9;
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60BE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2297D58B8();
  sub_2297DD76C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v12 = 0;
    sub_2297DD5BC();
    v11 = 1;
    swift_bridgeObjectRetain();
    sub_2297DD5C8();
    v2 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_2297D58B8()
{
  unint64_t result;

  result = qword_255A60BE8;
  if (!qword_255A60BE8)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E877C, &type metadata for NowPlayingUsageProvider.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60BE8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for NowPlayingUsageProvider.Event.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2297D5948 + 4 * byte_2297E842F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2297D597C + 4 * byte_2297E842A[v4]))();
}

uint64_t sub_2297D597C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297D5984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2297D598CLL);
  return result;
}

uint64_t sub_2297D5998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2297D59A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2297D59A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2297D59AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingUsageProvider.Event.CodingKeys()
{
  return &type metadata for NowPlayingUsageProvider.Event.CodingKeys;
}

unint64_t sub_2297D59CC()
{
  unint64_t result;

  result = qword_255A60BF8;
  if (!qword_255A60BF8)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E8754, &type metadata for NowPlayingUsageProvider.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60BF8);
  }
  return result;
}

unint64_t sub_2297D5A14()
{
  unint64_t result;

  result = qword_255A60C00;
  if (!qword_255A60C00)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E86C4, &type metadata for NowPlayingUsageProvider.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60C00);
  }
  return result;
}

unint64_t sub_2297D5A5C()
{
  unint64_t result;

  result = qword_255A60C08;
  if (!qword_255A60C08)
  {
    result = MEMORY[0x22E2D01BC](&unk_2297E86EC, &type metadata for NowPlayingUsageProvider.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255A60C08);
  }
  return result;
}

uint64_t sub_2297D5AA4@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t result;
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
  void *v41;
  void *v42;
  char *v43;
  uint64_t v44;
  void *v45;
  Swift::String v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(char *, uint64_t);
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  NSObject *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  void (*v80)(char *, char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;

  v78 = a1;
  v1 = sub_2297DCB54();
  v83 = *(_QWORD *)(v1 - 8);
  v84 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v85 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2297DCA28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60C10);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5EF00);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A60C18);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_2297DC9E0();
  v88 = *(_QWORD *)(v86 - 8);
  v16 = MEMORY[0x24BDAC7A8](v86);
  v79 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v71 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v89 = (char *)&v71 - v21;
  v82 = sub_2297DC488();
  v87 = v22;
  v23 = sub_2297DC464();
  v24 = v23;
  v77 = v20;
  if (!v23)
    goto LABEL_12;
  if (!(v23 >> 62))
  {
    result = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_4;
LABEL_10:
    swift_bridgeObjectRelease();
LABEL_11:
    v24 = 0;
LABEL_12:
    v27 = 0;
    goto LABEL_13;
  }
  result = sub_2297DD574();
  if (!result)
    goto LABEL_10;
LABEL_4:
  if ((v24 & 0xC000000000000001) != 0)
  {
    MEMORY[0x22E2CF6B8](0, v24);
  }
  else
  {
    if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_2297DC3EC();
  swift_release();
  if (!v91)
    goto LABEL_11;
  v24 = sub_2297DC488();
  v27 = v26;
  swift_release();
LABEL_13:
  if (sub_2297DC470())
  {
    sub_2297DC4AC();
    swift_release();
  }
  else
  {
    v28 = sub_2297DC4B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v12, 1, 1, v28);
  }
  sub_2297DC9D4();
  sub_229653E64((uint64_t)v12, &qword_255A5EF00);
  v29 = v88;
  v30 = v86;
  v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 48))(v15, 1, v86);
  v81 = v24;
  if (v31 == 1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v89, *MEMORY[0x24BE90E38], v30);
    sub_229653E64((uint64_t)v15, &qword_255A60C18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v89, v15, v30);
  }
  v32 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE90E90], v3);
  v33 = sub_2297DC47C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v34 = *(_QWORD *)(v33 + 16);
  v35 = sub_2297DC3C8();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = v82;
  if (v34)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v36 + 16))(v9, v33 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80)), v35);
    v38 = 0;
  }
  else
  {
    v38 = 1;
  }
  v39 = v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v9, v38, 1, v35);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v9, 1, v35) == 1)
  {
    sub_229653E64((uint64_t)v9, &qword_255A60C10);
    v40 = 0;
    v41 = 0;
  }
  else
  {
    v40 = sub_2297DC3BC();
    v41 = v42;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v35);
  }
  v43 = v85;
  v74 = v40;
  if (v41)
    v44 = v40;
  else
    v44 = 0;
  if (v41)
    v45 = v41;
  else
    v45 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v46._countAndFlagsBits = v44;
  v46._object = v45;
  PlaybackItem.Identifier.init(from:)(v46);
  v47 = v93;
  v48 = v83;
  if (v93)
  {
    v49 = v92;
  }
  else
  {
    v47 = 0xE500000000000000;
    v49 = 0x3E6C696E3CLL;
  }
  v50 = v84;
  v51 = v86;
  v76 = v49;
  if (qword_255A58C08 != -1)
    swift_once();
  v52 = __swift_project_value_buffer(v50, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v43, v52, v50);
  v53 = v77;
  v80 = *(void (**)(char *, char *, uint64_t))(v88 + 16);
  v80(v77, v89, v51);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  v86 = v47;
  v54 = sub_2297DCB3C();
  v55 = sub_2297DD160();
  v75 = v54;
  v73 = v55;
  if (os_log_type_enabled(v54, v55))
  {
    v56 = swift_slowAlloc();
    v72 = swift_slowAlloc();
    v90 = v72;
    v91 = v37;
    *(_DWORD *)v56 = 136316162;
    v92 = v39;
    swift_bridgeObjectRetain();
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5D7A0);
    v57 = sub_2297DCE9C();
    v91 = sub_22960FB78(v57, v58, &v90);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v56 + 12) = 2080;
    v91 = v81;
    v92 = v32;
    swift_bridgeObjectRetain();
    v59 = sub_2297DCE9C();
    v91 = sub_22960FB78(v59, v60, &v90);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v56 + 22) = 2080;
    v61 = v79;
    v80(v79, v53, v51);
    v62 = sub_2297DCE9C();
    v91 = sub_22960FB78(v62, v63, &v90);
    sub_2297DD340();
    swift_bridgeObjectRelease();
    v64 = *(void (**)(char *, uint64_t))(v88 + 8);
    v64(v53, v51);
    *(_WORD *)(v56 + 32) = 2080;
    v65 = v86;
    swift_bridgeObjectRetain();
    v91 = sub_22960FB78(v76, v65, &v90);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v56 + 42) = 2080;
    v91 = v74;
    v92 = (uint64_t)v41;
    swift_bridgeObjectRetain();
    v66 = sub_2297DCE9C();
    v91 = sub_22960FB78(v66, v67, &v90);
    sub_2297DD340();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v68 = v75;
    _os_log_impl(&dword_22960C000, v75, (os_log_type_t)v73, "UsoEntity_common_MediaItem#toINMediaItem creating AudioMediaItem with title: %s, artist: %s, mediaItemType: %s, and identifier: %s from songEntityId: %s", (uint8_t *)v56, 0x34u);
    v69 = v72;
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v69, -1, -1);
    MEMORY[0x22E2D0294](v56, -1, -1);

    (*(void (**)(char *, uint64_t))(v83 + 8))(v85, v84);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v64 = *(void (**)(char *, uint64_t))(v88 + 8);
    v64(v53, v51);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v43, v50);
    v61 = v79;
  }
  v70 = v89;
  v80(v61, v89, v51);
  sub_2297DC9EC();
  return ((uint64_t (*)(char *, uint64_t))v64)(v70, v51);
}

uint64_t static SiriAudioState.isWarmup.getter()
{
  return sub_2297D678C((unsigned __int8 *)&byte_255A60C30, "SiriAudio#isWarmup#get %{BOOL}d") & 1;
}

uint64_t static SiriAudioState.isMakeFlowFromParse.getter()
{
  return sub_2297D678C((unsigned __int8 *)&byte_255A60C31, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d") & 1;
}

uint64_t sub_2297D63FC()
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
  uint64_t result;
  uint64_t v10;

  v0 = sub_2297DD1F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2297DCCC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DCC98();
  sub_2297DD1D8();
  v8 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0xD000000000000014, 0x80000002297F3670, (uint64_t)v7, (uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_255A60C20 = v8;
  return result;
}

uint64_t (*static SiriAudioState.isWarmup.modify(_BYTE *a1))(char *a1)
{
  *a1 = sub_2297D678C((unsigned __int8 *)&byte_255A60C30, "SiriAudio#isWarmup#get %{BOOL}d") & 1;
  return sub_2297D6548;
}

uint64_t sub_2297D6548(char *a1)
{
  return _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(*a1);
}

uint64_t (*static SiriAudioState.isMakeFlowFromParse.modify(_BYTE *a1))(char *a1)
{
  *a1 = sub_2297D678C((unsigned __int8 *)&byte_255A60C31, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d") & 1;
  return sub_2297D6598;
}

uint64_t sub_2297D6598(char *a1)
{
  return _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(*a1);
}

uint64_t static SiriAudioState.warmupWithRequestId(requestID:)(uint64_t a1, uint64_t a2)
{
  _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(1);
  qword_255A60C38 = a1;
  qword_255A60C40 = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2297D65E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD v9[2];

  v0 = sub_2297DCB54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_2297D678C((unsigned __int8 *)&byte_255A60C31, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d");
  if ((result & 1) != 0)
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v5 = __swift_project_value_buffer(v0, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
    v6 = sub_2297DCB3C();
    v7 = sub_2297DD16C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 134217984;
      v9[1] = 1000;
      sub_2297DD340();
      _os_log_impl(&dword_22960C000, v6, v7, "SiriAudio#isMakeFlowFromParse#reset makeFlow(from:) did not finish within %ldms.", v8, 0xCu);
      MEMORY[0x22E2D0294](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(0);
  }
  return result;
}

uint64_t sub_2297D6764()
{
  return sub_2297D678C((unsigned __int8 *)&byte_255A60C30, "SiriAudio#isWarmup#get %{BOOL}d");
}

uint64_t sub_2297D6778()
{
  return sub_2297D678C((unsigned __int8 *)&byte_255A60C31, "SiriAudio#isMakeFlowFromParse#get %{BOOL}d");
}

uint64_t sub_2297D678C(unsigned __int8 *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _DWORD v13[4];

  v4 = sub_2297DCB54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_2297DCB3C();
  v10 = sub_2297DD178();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    v13[3] = *a1;
    sub_2297DD340();
    _os_log_impl(&dword_22960C000, v9, v10, a2, v11, 8u);
    MEMORY[0x22E2D0294](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *a1;
}

uint64_t _s16SiriAudioSupport0aB5StateV16currentRequestIdSSSgyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[3];

  v0 = sub_2297DCB54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2297D678C((unsigned __int8 *)&byte_255A60C30, "SiriAudio#isWarmup#get %{BOOL}d") & 1) != 0)
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v4 = __swift_project_value_buffer(v0, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    v5 = sub_2297DCB3C();
    v6 = sub_2297DD16C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v22[0] = v20;
      *(_DWORD *)v7 = 136315138;
      if (qword_255A60C40)
        v8 = qword_255A60C38;
      else
        v8 = 0x3E6C696E3CLL;
      if (qword_255A60C40)
        v9 = qword_255A60C40;
      else
        v9 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      v21 = sub_22960FB78(v8, v9, v22);
      sub_2297DD340();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22960C000, v5, v6, "SiriAudioState#currentRequestId warmup, returning warmup requestID: %s", v7, 0xCu);
      v10 = v20;
      swift_arrayDestroy();
      MEMORY[0x22E2D0294](v10, -1, -1);
      MEMORY[0x22E2D0294](v7, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v11 = qword_255A60C38;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_255A58A60 != -1)
      swift_once();
    swift_beginAccess();
    v12 = qword_255A5BB48;
    v13 = unk_255A5BB50;
    v14 = __swift_project_boxed_opaque_existential_1(qword_255A5BB30, qword_255A5BB48);
    v15 = *(_QWORD *)(v12 - 8);
    MEMORY[0x24BDAC7A8](v14);
    v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v12);
  }
  return v11;
}

uint64_t _s16SiriAudioSupport0aB5StateV8isWarmupSbvsZ_0(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  _DWORD v11[4];

  v2 = sub_2297DCB54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2297DCB3C();
  v8 = sub_2297DD178();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v11[3] = a1 & 1;
    sub_2297DD340();
    _os_log_impl(&dword_22960C000, v7, v8, "SiriAudio#isWarmup#set %{BOOL}d", v9, 8u);
    MEMORY[0x22E2D0294](v9, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  byte_255A60C30 = a1 & 1;
  return result;
}

uint64_t sub_2297D6D68()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v15 = sub_2297DCC50();
  v0 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v2 = (uint64_t *)((char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = sub_2297DCCEC();
  v14 = *(_QWORD *)(v16 - 8);
  v3 = MEMORY[0x24BDAC7A8](v16);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v8 = sub_2297DCC68();
  MEMORY[0x24BDAC7A8](v8);
  if (qword_255A60C28)
  {
    swift_retain();
    sub_2297DCD04();
    swift_release();
  }
  aBlock[4] = sub_2297D65E0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2296120FC;
  aBlock[3] = &block_descriptor_48;
  _Block_copy(aBlock);
  v17 = MEMORY[0x24BEE4AF8];
  sub_2296112BC();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
  sub_229611384();
  sub_2297DD3D0();
  sub_2297DCD10();
  swift_allocObject();
  qword_255A60C28 = sub_2297DCCF8();
  result = swift_release();
  if (qword_255A60C28)
  {
    v10 = qword_255A58E00;
    swift_retain();
    if (v10 != -1)
      swift_once();
    sub_2297DCCD4();
    *v2 = 1000;
    v11 = v15;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v0 + 104))(v2, *MEMORY[0x24BEE5410], v15);
    MEMORY[0x22E2CEF38](v5, v2);
    (*(void (**)(_QWORD *, uint64_t))(v0 + 8))(v2, v11);
    v12 = *(void (**)(char *, uint64_t))(v14 + 8);
    v13 = v16;
    v12(v5, v16);
    sub_2297DD208();
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v12)(v7, v13);
  }
  return result;
}

uint64_t _s16SiriAudioSupport0aB5StateV19isMakeFlowFromParseSbvsZ_0(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t result;
  _DWORD v11[4];

  v2 = sub_2297DCB54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2297DCB3C();
  v8 = sub_2297DD178();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v11[3] = a1 & 1;
    sub_2297DD340();
    _os_log_impl(&dword_22960C000, v7, v8, "SiriAudio#isMakeFlowFromParse#set %{BOOL}d", v9, 8u);
    MEMORY[0x22E2D0294](v9, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  byte_255A60C31 = a1 & 1;
  if ((a1 & 1) != 0)
    return sub_2297D6D68();
  return result;
}

ValueMetadata *type metadata accessor for SiriAudioState()
{
  return &type metadata for SiriAudioState;
}

uint64_t sub_2297D71A4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t static ErrorFilingProvider.getTrialPolicy()()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD v7[6];
  __int128 v8;

  v8 = xmmword_2297E87F0;
  if (qword_255A58E08 != -1)
    swift_once();
  v1 = qword_255A60C50;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_2297D85A0;
  *(_QWORD *)(v3 + 24) = v2;
  v7[4] = sub_2296679E4;
  v7[5] = v3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2297160B8;
  v7[3] = &block_descriptor_49;
  v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

void static ErrorFilingProvider.createHomePodNewBugsAllTTRComponent()()
{
  JUMPOUT(0x22E2CEB78);
}

uint64_t static ErrorFilingProvider.fileTTR(errorToReport:errorDomain:extraInfo:extraDescInfo:deviceIDs:attachmentURLs:ttrComponentInfo:title:duc:)(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, char *a14, unint64_t a15)
{
  return sub_2297D92BC(a1, a2, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

unint64_t static ErrorFilingProvider.errorInfoForParamsKey.getter()
{
  return 0xD000000000000010;
}

unint64_t static ErrorFilingProvider.errorInfoForTitleKey.getter()
{
  return 0xD000000000000011;
}

unint64_t static ErrorFilingProvider.airplayNotRespondingParamsKey.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_2297D740C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v0 = sub_2297DD1F0();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2297DCCC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DCCA4();
  v11[1] = 0;
  sub_229611304((unint64_t *)&qword_255A60DF0, v1, MEMORY[0x24BEE56A0]);
  sub_2297DD7A8();
  v9 = _s16SiriAudioSupport14DispatchQueuesV5queue_3qos10attributesSo012OS_dispatch_F0CSS_0D00D3QoSVAhIE10AttributesVtFZ_0(0xD00000000000001ELL, 0x80000002297F3840, (uint64_t)v8, (uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  qword_255A60C50 = v9;
  return result;
}

unint64_t sub_2297D7544()
{
  unint64_t result;

  result = sub_2296F956C(MEMORY[0x24BEE4AF8]);
  qword_255A60C68 = result;
  return result;
}

_QWORD *sub_2297D7568()
{
  _QWORD *result;

  type metadata accessor for ErrorFilingProvider.TrialClientManager();
  swift_allocObject();
  result = sub_2297D75E0();
  qword_255A60C70 = (uint64_t)result;
  return result;
}

id sub_2297D75A4()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 116);
  qword_255A60C78 = (uint64_t)result;
  return result;
}

_QWORD *sub_2297D75E0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t aBlock;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  v3 = sub_2297DCB54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_2297DCB3C();
  v9 = sub_2297DD160();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22960C000, v8, v9, "ErrorFilingProvider#TrialClientManager#init", v10, 2u);
    MEMORY[0x22E2D0294](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (qword_255A58E20 != -1)
    swift_once();
  v11 = (void *)qword_255A60C78;
  v12 = (void *)sub_2297DCE48();
  if (qword_255A58E08 != -1)
    swift_once();
  v13 = qword_255A60C50;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v1;
  *(_QWORD *)(v14 + 24) = v2;
  v28 = sub_2297D9B68;
  v29 = v14;
  v15 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_2297D71A4;
  v27 = &block_descriptor_34;
  v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v17 = objc_msgSend(v11, sel_addUpdateHandlerForNamespaceName_queue_usingBlock_, v12, v13, v16);
  _Block_release(v16);
  swift_unknownObjectRelease();

  v18 = (void *)qword_255A60C78;
  v19 = (void *)sub_2297DCFBC();
  v20 = (void *)sub_2297DCE48();
  v21 = qword_255A60C50;
  v28 = sub_2297D7B5C;
  v29 = 0;
  aBlock = v15;
  v25 = 1107296256;
  v26 = sub_22961CCE0;
  v27 = &block_descriptor_37_1;
  v22 = _Block_copy(&aBlock);
  objc_msgSend(v18, sel_downloadLevelsForFactors_withNamespace_queue_options_progress_completion_, v19, v20, v21, 0, 0, v22);
  _Block_release(v22);

  sub_2297D9B70();
  return v1;
}

void sub_2297D7908(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  v2 = sub_2297DCB54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  swift_unknownObjectRetain_n();
  v7 = sub_2297DCB3C();
  v8 = sub_2297DD160();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = a1;
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    v13[1] = v9 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5D120);
    v11 = sub_2297DCE9C();
    v14 = sub_22960FB78(v11, v12, &v15);
    sub_2297DD340();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22960C000, v7, v8, "ErrorFilingProvider#TrialClientManager update handler called with %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2D0294](v10, -1, -1);
    MEMORY[0x22E2D0294](v9, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_255A58E20 != -1)
    swift_once();
  objc_msgSend((id)qword_255A60C78, sel_refresh);
  sub_2297D9B70();
}

uint64_t sub_2297D7B5C(uint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  char *v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = sub_2297DCB54();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v39 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v39 - v11;
  if (qword_255A58C08 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_255A67F80);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14(v12, v13, v3);
  v15 = sub_2297DCB3C();
  v16 = sub_2297DD160();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v40 = a2;
    v18 = v3;
    v19 = v10;
    v20 = v7;
    v21 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22960C000, v15, v16, "ErrorFilingProvider#TrialClientManager downloadLevels", v17, 2u);
    v22 = v21;
    v7 = v20;
    v10 = v19;
    v3 = v18;
    a2 = v40;
    MEMORY[0x22E2D0294](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  v23(v12, v3);
  if (a2)
  {
    v14(v7, v13, v3);
    v24 = a2;
    v25 = a2;
    v26 = a2;
    v27 = sub_2297DCB3C();
    v28 = sub_2297DD16C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v42 = v30;
      *(_DWORD *)v29 = 136315650;
      v41 = sub_22960FB78(0xD000000000000019, 0x80000002297EAAB0, &v42);
      v40 = v7;
      sub_2297DD340();
      v39 = (uint64_t (*)(char *, uint64_t))v23;
      *(_WORD *)(v29 + 12) = 2080;
      v41 = sub_22960FB78(0xD000000000000023, 0x80000002297F37A0, &v42);
      sub_2297DD340();
      *(_WORD *)(v29 + 22) = 2080;
      swift_getErrorValue();
      v31 = sub_2297DD6A0();
      v41 = sub_22960FB78(v31, v32, &v42);
      sub_2297DD340();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22960C000, v27, v28, "Error downloading levels for factor: %s in namespace: %s. Error: %s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22E2D0294](v30, -1, -1);
      MEMORY[0x22E2D0294](v29, -1, -1);

      return v39(v40, v3);
    }

    v38 = v7;
  }
  else
  {
    v14(v10, v13, v3);
    v34 = sub_2297DCB3C();
    v35 = sub_2297DD154();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      v42 = v37;
      *(_DWORD *)v36 = 136315394;
      v41 = sub_22960FB78(0xD000000000000019, 0x80000002297EAAB0, &v42);
      sub_2297DD340();
      *(_WORD *)(v36 + 12) = 2080;
      v41 = sub_22960FB78(0xD000000000000023, 0x80000002297F37A0, &v42);
      sub_2297DD340();
      _os_log_impl(&dword_22960C000, v34, v35, "Successfully downloaded levels for factor: %s in namespace: %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E2D0294](v37, -1, -1);
      MEMORY[0x22E2D0294](v36, -1, -1);
    }

    v38 = v10;
  }
  return ((uint64_t (*)(char *, uint64_t))v23)(v38, v3);
}

uint64_t static ErrorFilingProvider.setTrialPolicy(dataPolicy:)(uint64_t a1, unint64_t a2)
{
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v4 = sub_2297DCC68();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2297DCCC8();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2297DCB54();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  sub_2297D9A14(a1, a2);
  v15 = sub_2297DCB3C();
  v16 = sub_2297DD160();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    if (a2 >> 60 != 15)
      __asm { BR              X11 }
    aBlock[0] = 0;
    sub_2297DD340();
    sub_2296CB2F0(a1, a2);
    _os_log_impl(&dword_22960C000, v15, v16, "ErrorFilingProvider#setTrialPolicy... policy is %ld bytes", v17, 0xCu);
    MEMORY[0x22E2D0294](v17, -1, -1);
  }
  else
  {
    sub_2296CB2F0(a1, a2);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (qword_255A58E08 != -1)
    swift_once();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a1;
  v18[3] = a2;
  v18[4] = v22;
  aBlock[4] = sub_2297D9A5C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2296120FC;
  aBlock[3] = &block_descriptor_9_6;
  v19 = _Block_copy(aBlock);
  sub_2297D9A14(a1, a2);
  sub_2297DCC8C();
  v27 = MEMORY[0x24BEE4AF8];
  sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
  sub_229611384();
  v20 = v26;
  sub_2297DD3D0();
  MEMORY[0x22E2CF454](0, v9, v6, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v20);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  return swift_release();
}

uint64_t static ErrorFilingProvider.setupTrialClient()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t result;
  uint64_t v9;

  v0 = sub_2297DCB54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_2297DCB3C();
  v6 = sub_2297DD160();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22960C000, v5, v6, "ErrorFilingProvider#setupTrialClient...", v7, 2u);
    MEMORY[0x22E2D0294](v7, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_255A58E18 != -1)
    return swift_once();
  return result;
}

uint64_t sub_2297D8590()
{
  return swift_deallocObject();
}

uint64_t sub_2297D85A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = qword_255A60C58;
  v3 = unk_255A60C60;
  v4 = *v1;
  v5 = v1[1];
  *v1 = qword_255A60C58;
  v1[1] = v3;
  sub_2297D9A14(v2, v3);
  return sub_2296CB2F0(v4, v5);
}

uint64_t sub_2297D85DC()
{
  return swift_deallocObject();
}

uint64_t static ErrorFilingProvider.setErrorFilingInfo(errorCode:errorTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v9 = sub_2297DCC68();
  v20 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2297DCCC8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58E08 != -1)
    swift_once();
  v19[1] = qword_255A60C50;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v4;
  aBlock[4] = sub_2297D9AC0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2296120FC;
  aBlock[3] = &block_descriptor_15_5;
  v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2297DCC8C();
  v21 = MEMORY[0x24BEE4AF8];
  sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
  sub_229611384();
  sub_2297DD3D0();
  MEMORY[0x22E2CF454](0, v15, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

uint64_t sub_2297D880C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v16[2];

  if (qword_255A58E10 != -1)
    swift_once();
  v8 = MEMORY[0x24BEE0D00];
  v15 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v14 = a1;
  *((_QWORD *)&v14 + 1) = a2;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = qword_255A60C68;
  qword_255A60C68 = 0x8000000000000000;
  sub_2297B8684(&v14, 0xD000000000000010, 0x80000002297F3690, isUniquelyReferenced_nonNull_native, v16);
  qword_255A60C68 = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  result = sub_229653E64((uint64_t)v16, (uint64_t *)&unk_255A60DD0);
  if (a4)
  {
    v15 = v8;
    *(_QWORD *)&v14 = a3;
    *((_QWORD *)&v14 + 1) = a4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v11 = swift_isUniquelyReferenced_nonNull_native();
    v13 = qword_255A60C68;
    qword_255A60C68 = 0x8000000000000000;
    sub_2297B8684(&v14, 0xD000000000000011, 0x80000002297F36B0, v11, v16);
    qword_255A60C68 = v13;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return sub_229653E64((uint64_t)v16, (uint64_t *)&unk_255A60DD0);
  }
  return result;
}

uint64_t static ErrorFilingProvider.getErrorFilingInfo()()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  unint64_t v6;
  _QWORD aBlock[6];
  unint64_t v8;

  v8 = sub_2296F956C(MEMORY[0x24BEE4AF8]);
  if (qword_255A58E08 != -1)
    swift_once();
  v1 = qword_255A60C50;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_2297D9AE0;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_2297C3E28;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2297160B8;
  aBlock[3] = &block_descriptor_25;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  return result;
}

uint64_t sub_2297D8B14(_QWORD *a1)
{
  if (qword_255A58E10 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = qword_255A60C68;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t static ErrorFilingProvider.clearErrorFilingInfo()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD aBlock[6];

  v0 = sub_2297DCC68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2297DCCC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58E08 != -1)
    swift_once();
  aBlock[4] = sub_2297D9244;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2296120FC;
  aBlock[3] = &block_descriptor_28;
  v8 = _Block_copy(aBlock);
  sub_2297DCC8C();
  v10[1] = MEMORY[0x24BEE4AF8];
  sub_229611304((unint64_t *)&qword_255A60C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A5F120);
  sub_229611384();
  sub_2297DD3D0();
  MEMORY[0x22E2CF454](0, v7, v3, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return swift_release();
}

uint64_t sub_2297D8D68(char a1)
{
  return sub_2297D90BC(a1, "ErrorFilingProvider#fileTTR TTR result: %{BOOL}d");
}

uint64_t static ErrorFilingProvider.generateABCSnapshot(errorToReport:errorDomain:errorType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD v27[4];

  v27[1] = a6;
  v27[2] = a4;
  v27[3] = a2;
  v6 = sub_2297DCB54();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v27 - v11;
  v13 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v14 = (void *)sub_2297DCE48();
  v15 = objc_msgSend(v13, sel_initWithSuiteName_, v14);

  if (v15
    && (v16 = (void *)sub_2297DCE48(),
        v17 = objc_msgSend(v15, sel_BOOLForKey_, v16),
        v15,
        v16,
        (v17 & 1) != 0))
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v6, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v6);
    v19 = sub_2297DCB3C();
    v20 = sub_2297DD16C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_22960C000, v19, v20, "ErrorFilingProvider#generateABCSnapshot no-op because disabled!", v21, 2u);
      MEMORY[0x22E2D0294](v21, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v6, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v23, v6);
    v24 = sub_2297DCB3C();
    v25 = sub_2297DD178();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_22960C000, v24, v25, "ErrorFilingProvider#generateABCSnapshot called to capture some error condition", v26, 2u);
      MEMORY[0x22E2D0294](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_2297DC884();
    swift_allocObject();
    sub_2297DC878();
    sub_2297DC86C();
    return swift_release();
  }
}

uint64_t sub_2297D90B0(char a1)
{
  return sub_2297D90BC(a1, "ErrorFilingProvider#generateABCSnapshot ABC result: %{BOOL}d");
}

uint64_t sub_2297D90BC(char a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _DWORD v13[4];

  v4 = sub_2297DCB54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A58C08 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_2297DCB3C();
  v10 = sub_2297DD178();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    v13[3] = a1 & 1;
    sub_2297DD340();
    _os_log_impl(&dword_22960C000, v9, v10, a2, v11, 8u);
    MEMORY[0x22E2D0294](v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ErrorFilingProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ErrorFilingProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2297D9244()
{
  if (qword_255A58E10 != -1)
    swift_once();
  swift_beginAccess();
  qword_255A60C68 = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2297D92BC(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10, uint64_t a11, char *a12, unint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;

  v71 = a5;
  v74 = a8;
  v75 = a7;
  v73 = a6;
  v69 = a2;
  v67 = a1;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A60DE0);
  MEMORY[0x24BDAC7A8](v13);
  v78 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_2297DC980();
  v79 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v77 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606F0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_2297DC968();
  v76 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v68 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2297DCB54();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v27 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v72 = "leUniversalStoreIdentifiers>\"8";
  v28 = (void *)sub_2297DCE48();
  v29 = objc_msgSend(v27, sel_initWithSuiteName_, v28);

  if (v29
    && (v30 = (void *)sub_2297DCE48(),
        v31 = objc_msgSend(v29, sel_BOOLForKey_, v30),
        v29,
        v30,
        (v31 & 1) != 0))
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v20, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v24, v32, v20);
    v33 = sub_2297DCB3C();
    v34 = sub_2297DD16C();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_22960C000, v33, v34, "ErrorFilingProvider#fileTTR no-op because disabled!", v35, 2u);
      MEMORY[0x22E2D0294](v35, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  else
  {
    v62 = v18;
    v80 = a13;
    if (qword_255A58C08 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v20, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v26, v37, v20);
    v38 = sub_2297DCB3C();
    v39 = sub_2297DD178();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_22960C000, v38, v39, "ErrorFilingProvider#fileTTR called to capture some error condition", v40, 2u);
      MEMORY[0x22E2D0294](v40, -1, -1);
    }
    v61 = a9;

    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
    v41 = static ErrorFilingProvider.getTrialPolicy()();
    if (v42 >> 60 == 15)
      v43 = 0;
    else
      v43 = v41;
    if (v42 >> 60 == 15)
      v44 = 0xC000000000000000;
    else
      v44 = v42;
    sub_2297DC9C8();
    swift_allocObject();
    sub_22972C6B8(v43, v44);
    swift_bridgeObjectRetain();
    v70 = v43;
    v65 = v44;
    v63 = sub_2297DC9BC();
    v64 = a12;
    v45 = v80;
    if (v80)
    {
      v82 = a12;
      v83 = v80;
      swift_bridgeObjectRetain();
      sub_2297DCF08();
    }
    v46 = v67;
    v47 = (uint64_t)v62;
    if (a11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v49 = v68;
      v50 = v69;
    }
    else
    {
      v82 = 0;
      v83 = 0xE000000000000000;
      sub_2297DD484();
      sub_2297DCF08();
      sub_2297DCF08();
      swift_bridgeObjectRelease();
      sub_2297DCF08();
      swift_bridgeObjectRelease();
      v50 = v69;
      sub_2297DCF08();
      a10 = v82;
      v49 = v68;
    }
    if (v45)
      v51 = v46;
    else
      v51 = a10;
    v68 = v51;
    v69 = (unint64_t)a10;
    swift_bridgeObjectRetain();
    v82 = v46;
    v83 = v50;
    swift_bridgeObjectRetain();
    sub_2297DCF08();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2297DA0E8(v61, v47);
    v52 = v76;
    v53 = v81;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v47, 1, v81) == 1)
    {
      MEMORY[0x22E2CEB78](0xD000000000000011, 0x80000002297F3820, 0x6F69647541, 0xE500000000000000, 1050192);
      sub_229653E64(v47, &qword_255A606F0);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v49, v47, v53);
    }
    v54 = v52;
    v55 = v66;
    v56 = v75;
    swift_bridgeObjectRetain();
    v57 = swift_bridgeObjectRetain();
    v58 = v77;
    MEMORY[0x22E2CEB90](v57, &unk_24F261980, v56, 0, 0xE000000000000000);
    v59 = (uint64_t)v78;
    v60 = v79;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v78, v58, v55);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v60 + 56))(v59, 0, 1, v55);
    sub_2297DC9B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_229649200(v70, v65);
    sub_229653E64(v59, (uint64_t *)&unk_255A60DE0);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v58, v55);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v49, v81);
  }
}

uint64_t sub_2297D9A14(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_22972C6B8(a1, a2);
  return a1;
}

uint64_t sub_2297D9A28()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_229649200(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject();
}

uint64_t sub_2297D9A5C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = qword_255A60C58;
  v4 = unk_255A60C60;
  qword_255A60C58 = v1;
  unk_255A60C60 = v2;
  sub_2297D9A14(v1, v2);
  return sub_2296CB2F0(v3, v4);
}

uint64_t sub_2297D9A94()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2297D9AC0()
{
  uint64_t *v0;

  return sub_2297D880C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2297D9AD0()
{
  return swift_deallocObject();
}

uint64_t sub_2297D9AE0()
{
  uint64_t v0;

  return sub_2297D8B14(*(_QWORD **)(v0 + 16));
}

uint64_t sub_2297D9AE8()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for ErrorFilingProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for ErrorFilingProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for ErrorFilingProvider.TrialClientManager()
{
  return objc_opt_self();
}

uint64_t sub_2297D9B44()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2297D9B68(uint64_t a1)
{
  sub_2297D7908(a1);
}

void sub_2297D9B70()
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
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  BOOL v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;

  v0 = sub_2297DB8F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v46 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2297DCB54();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v40 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v40 - v11;
  if (qword_255A58C08 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_255A67F80);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v47 = v13;
  v48 = v14;
  ((void (*)(char *))v14)(v12);
  v15 = sub_2297DCB3C();
  v16 = sub_2297DD160();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22960C000, v15, v16, "ErrorFilingProvider#TrialClientManager#loadLatest...", v17, 2u);
    MEMORY[0x22E2D0294](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v12, v3);
  if (qword_255A58E20 != -1)
    swift_once();
  v19 = (void *)qword_255A60C78;
  v20 = (void *)sub_2297DCE48();
  v21 = (void *)sub_2297DCE48();
  v22 = objc_msgSend(v19, sel_levelForFactor_withNamespaceName_, v20, v21);

  if (v22)
  {
    v23 = objc_msgSend(v22, sel_fileValue);
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v23, sel_path);

      if (v25)
      {
        v44 = v1;
        v26 = sub_2297DCE60();
        v28 = v27;

        v48(v10, v47, v3);
        swift_bridgeObjectRetain_n();
        v29 = sub_2297DCB3C();
        v30 = sub_2297DD160();
        v31 = os_log_type_enabled(v29, v30);
        v45 = v18;
        if (v31)
        {
          v43 = v7;
          v32 = (uint8_t *)swift_slowAlloc();
          v33 = swift_slowAlloc();
          v42 = v0;
          v34 = v33;
          v50 = v33;
          v41 = v10;
          *(_DWORD *)v32 = 136315138;
          swift_bridgeObjectRetain();
          v49 = sub_22960FB78(v26, v28, &v50);
          sub_2297DD340();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22960C000, v29, v30, "ErrorFilingProvider#TrialClientManager#loadLatest level path: %s", v32, 0xCu);
          swift_arrayDestroy();
          v35 = v34;
          v0 = v42;
          MEMORY[0x22E2D0294](v35, -1, -1);
          MEMORY[0x22E2D0294](v32, -1, -1);

          v45(v41, v3);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v18(v10, v3);
        }
        v36 = v46;
        sub_2297DB8A0();
        swift_bridgeObjectRelease();
        v37 = sub_2297DB90C();
        v39 = v38;
        type metadata accessor for ErrorFilingProvider();
        sub_22972C6B8(v37, v39);
        static ErrorFilingProvider.setTrialPolicy(dataPolicy:)(v37, v39);
        sub_229649200(v37, v39);
        sub_229649200(v37, v39);

        (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v0);
      }
      else
      {

      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_2297DA0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A606F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_2297DA158()
{
  return &unk_24F25E3B8;
}

uint64_t sub_2297DA164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;

  v20 = a7;
  v21 = a3;
  v18 = a6;
  v19 = a2;
  v22 = a4;
  v23 = a5;
  v17 = a1;
  v11 = sub_2297DCB30();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A589D8 != -1)
    swift_once();
  v15 = (id)qword_255A67EB0;
  sub_2297DCB18();
  sub_2297DD274();
  sub_2297DCB00();
  sub_22966EF98(a9, a10, v17, v19, v21, v22, v23, &v24, v18, v20, a8);
  sub_2297DD268();
  sub_2297DCB0C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v24;
}

uint64_t type metadata accessor for PodcastStationPlaybackHandler()
{
  return objc_opt_self();
}

uint64_t sub_2297DA328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD v18[5];

  v6 = sub_2297DCB54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[3] = type metadata accessor for MediaPlaybackProvider();
  v18[4] = &off_24F26F8E0;
  v18[0] = a2;
  *(_QWORD *)(a3 + 16) = a1;
  sub_22961F9E4((uint64_t)v18, a3 + 32);
  v10 = qword_255A58C08;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_255A67F80);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  v12 = sub_2297DCB3C();
  v13 = sub_2297DD178();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_22960C000, v12, v13, "PodcastPlaybackHandler#ControllerReferece Retrieving controller reference...", v14, 2u);
    MEMORY[0x22E2D0294](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A60F20);
  swift_allocObject();
  v15 = sub_22969BCC8(0xD00000000000001CLL, 0x80000002297F38A0, sub_2297DA4FC, a1);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  *(_QWORD *)(a3 + 24) = v15;
  return a3;
}

uint64_t sub_2297DA4FC(uint64_t a1, uint64_t a2)
{
  return sub_229681674(a1, a2);
}

void sub_2297DA504(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;

  v4 = sub_2297DCB54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_companionDeviceInfo);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_assistantID);
    if (v10)
    {
      v11 = v10;
      v12 = sub_2297DCE60();
      v14 = v13;

    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
    v19 = objc_msgSend(v9, sel_productPrefix);
    if (v19)
    {
      v20 = v19;
      v21 = sub_2297DCE60();
      v23 = v22;

    }
    else
    {
      v21 = 0;
      v23 = 0;
    }
    v24 = objc_msgSend(v9, sel_peerToPeerHandoffCapability);

    *(_QWORD *)a2 = v12;
    *(_QWORD *)(a2 + 8) = v14;
    *(_QWORD *)(a2 + 16) = v21;
    *(_QWORD *)(a2 + 24) = v23;
    *(_BYTE *)(a2 + 32) = v24;
  }
  else
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v4, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    v16 = sub_2297DCB3C();
    v17 = sub_2297DD16C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22960C000, v16, v17, "CompanionDeviceInfo#from AFSharedUserInfo.companionDeviceInfo is nil. Bailing", v18, 2u);
      MEMORY[0x22E2D0294](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_OWORD *)a2 = xmmword_2297E88B0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_BYTE *)(a2 + 32) = 0;
  }
}

uint64_t CompanionDeviceInfo.assistantID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDeviceInfo.assistantID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CompanionDeviceInfo.assistantID.modify())()
{
  return nullsub_1;
}

uint64_t CompanionDeviceInfo.productPrefix.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDeviceInfo.productPrefix.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*CompanionDeviceInfo.productPrefix.modify())()
{
  return nullsub_1;
}

uint64_t CompanionDeviceInfo.peerToPeerHandoffCapability.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t CompanionDeviceInfo.peerToPeerHandoffCapability.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*CompanionDeviceInfo.peerToPeerHandoffCapability.modify())()
{
  return nullsub_1;
}

void __swiftcall CompanionDeviceInfo.init(assistantID:productPrefix:peerToPeerHandoffCapability:)(SiriAudioSupport::CompanionDeviceInfo *__return_ptr retstr, Swift::String_optional assistantID, Swift::String_optional productPrefix, Swift::Bool_optional peerToPeerHandoffCapability)
{
  retstr->assistantID = assistantID;
  retstr->productPrefix = productPrefix;
  retstr->peerToPeerHandoffCapability = peerToPeerHandoffCapability;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supports(version:)(SiriAudioSupport::BuildVersion version)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = (unsigned __int8 *)version;
  v3 = sub_2297DCB54();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - v8;
  v10 = *(_QWORD *)(v1 + 24);
  if (v10)
  {
    v11 = *v2;
    v12 = *(_QWORD *)(v1 + 16);
    type metadata accessor for CompanionProductPrefixParser();
    swift_initStackObject();
    swift_bridgeObjectRetain_n();
    CompanionProductPrefixParser.init(for:)();
    LOBYTE(v28) = v11;
    v13 = sub_2296A0EC4(&v28);
    swift_release();
    if ((v13 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (qword_255A58C08 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v3, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v19, v3);
    swift_bridgeObjectRetain();
    v20 = sub_2297DCB3C();
    v21 = sub_2297DD16C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v26 = swift_slowAlloc();
      v28 = v26;
      *(_DWORD *)v22 = 136315394;
      swift_bridgeObjectRetain();
      v27 = sub_22960FB78(v12, v10, &v28);
      sub_2297DD340();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v22 + 12) = 2080;
      if (v11)
        v23 = 4534578;
      else
        v23 = 4272434;
      v27 = sub_22960FB78(v23, 0xE300000000000000, &v28);
      sub_2297DD340();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22960C000, v20, v21, "CompanionDeviceInfo#supports companion version: %s older than required version: %s", (uint8_t *)v22, 0x16u);
      v24 = v26;
      swift_arrayDestroy();
      MEMORY[0x22E2D0294](v24, -1, -1);
      MEMORY[0x22E2D0294](v22, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  else
  {
    if (qword_255A58C08 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v3, (uint64_t)qword_255A67F80);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v15, v3);
    v16 = sub_2297DCB3C();
    v17 = sub_2297DD16C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22960C000, v16, v17, "CompanionDeviceInfo#supports nil prefix returned. Returning false", v18, 2u);
      MEMORY[0x22E2D0294](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return 0;
}

uint64_t CompanionDeviceInfo.description.getter()
{
  sub_2297DD484();
  sub_2297DCF08();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5D7A0);
  sub_2297DD538();
  sub_2297DCF08();
  sub_2297DD538();
  sub_2297DCF08();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A5B110);
  sub_2297DD538();
  sub_2297DCF08();
  return 0;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supportsSiriForAirPlay()()
{
  __int128 *v0;
  int v1;
  __int128 v2;
  Swift::Bool v3;
  Swift::Bool v4;
  char v6;
  __int128 v7;
  __int128 v8;
  char v9;

  v1 = *((unsigned __int8 *)v0 + 32);
  v2 = v0[1];
  v7 = *v0;
  v8 = v2;
  v9 = v1;
  v6 = 0;
  v3 = CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v6);
  v4 = v1 & 1;
  if (v1 == 2)
    v4 = 0;
  return v3 && v4;
}

Swift::Bool __swiftcall CompanionDeviceInfo.supportsHomePodAppSelection()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  Swift::Bool v6;
  Swift::Bool v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = *((unsigned __int8 *)v0 + 32);
  v10 = *v0;
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v9 = 1;
  if (!CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v9))
    return 0;
  v10 = v1;
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v9 = 0;
  v6 = CompanionDeviceInfo.supports(version:)((SiriAudioSupport::BuildVersion)&v9);
  v7 = v5 & 1;
  if (v5 == 2)
    v7 = 0;
  return v6 && v7;
}

uint64_t destroy for CompanionDeviceInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
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

uint64_t assignWithTake for CompanionDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDeviceInfo(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompanionDeviceInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CompanionDeviceInfo()
{
  return &type metadata for CompanionDeviceInfo;
}

uint64_t INMediaItem.isInternalSignalPresent(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  char **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = a1 + 32;
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = &selRef_isInterruptingPlayback;
    v6 = &selRef_isInterruptingPlayback;
    v24 = v2;
    while (1)
    {
      v7 = (uint64_t *)(v3 + 16 * v4);
      v9 = *v7;
      v8 = v7[1];
      swift_bridgeObjectRetain();
      v10 = objc_msgSend(v1, v5[300]);
      if (!v10)
        goto LABEL_21;
      v11 = v10;
      v12 = objc_msgSend(v10, v6[49]);

      if (!v12)
        goto LABEL_21;
      v13 = (_QWORD *)sub_2297DCFD4();

      v14 = v13[2];
      if (!v14)
        break;
      v15 = v13[4] == v9 && v13[5] == v8;
      if (v15 || (v16 = v1, v17 = v3, result = sub_2297DD658(), (result & 1) != 0))
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v23 = 1;
        goto LABEL_27;
      }
      if (v14 != 1)
      {
        v19 = v13 + 7;
        v20 = 1;
        while (1)
        {
          v21 = v20 + 1;
          if (__OFADD__(v20, 1))
            break;
          if (*(v19 - 1) == v9 && *v19 == v8)
            goto LABEL_25;
          result = sub_2297DD658();
          if ((result & 1) != 0)
            goto LABEL_25;
          v19 += 2;
          ++v20;
          if (v21 == v14)
            goto LABEL_20;
        }
        __break(1u);
        return result;
      }
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = v17;
      v1 = v16;
      v2 = v24;
      v5 = &selRef_isInterruptingPlayback;
      v6 = &selRef_isInterruptingPlayback;
LABEL_22:
      if (++v4 == v2)
      {
        v23 = 0;
LABEL_27:
        swift_bridgeObjectRelease();
        return v23;
      }
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  return 0;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_255A67E50 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_255A67E50, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_255A67E44 > a2)
    return 1;
  return dword_255A67E44 >= a2 && dword_255A67E48 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_255A67E58 == -1)
  {
    if (qword_255A67E60)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_255A67E58, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_255A67E60)
      return _availability_version_check();
  }
  if (qword_255A67E50 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_255A67E50, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_255A67E44 > a3)
    return 1;
  return dword_255A67E44 >= a3 && dword_255A67E48 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t (*)(void))qword_255A67E60;
  if (qword_255A67E60)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_255A67E60 = (uint64_t)MEMORY[0x24BDAC970];
      v1 = MEMORY[0x24BDAC970];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x22E2CFD30](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_255A67E44, &dword_255A67E48);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2297DB774()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_2297DB780()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2297DB78C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_2297DB798()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2297DB7A4()
{
  return MEMORY[0x24BDCBA68]();
}

uint64_t sub_2297DB7B0()
{
  return MEMORY[0x24BDCBA70]();
}

uint64_t sub_2297DB7BC()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_2297DB7C8()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2297DB7D4()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2297DB7E0()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2297DB7EC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2297DB7F8()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2297DB804()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2297DB810()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2297DB81C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2297DB828()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_2297DB834()
{
  return MEMORY[0x24BDCBD90]();
}

uint64_t sub_2297DB840()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2297DB84C()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_2297DB858()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2297DB864()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2297DB870()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_2297DB87C()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_2297DB888()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_2297DB894()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2297DB8A0()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2297DB8AC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2297DB8B8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2297DB8C4()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_2297DB8D0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2297DB8DC()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_2297DB8E8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2297DB8F4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2297DB900()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2297DB90C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_2297DB918()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2297DB924()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2297DB930()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2297DB93C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2297DB948()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2297DB954()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2297DB960()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_2297DB96C()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_2297DB978()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_2297DB984()
{
  return MEMORY[0x24BDCE038]();
}

uint64_t sub_2297DB990()
{
  return MEMORY[0x24BDCE110]();
}

uint64_t sub_2297DB99C()
{
  return MEMORY[0x24BDCE130]();
}

uint64_t sub_2297DB9A8()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_2297DB9B4()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_2297DB9C0()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2297DB9CC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2297DB9D8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2297DB9E4()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_2297DB9F0()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_2297DB9FC()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_2297DBA08()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2297DBA14()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2297DBA20()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2297DBA2C()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_2297DBA38()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2297DBA44()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2297DBA50()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2297DBA5C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2297DBA68()
{
  return MEMORY[0x24BDCE9C0]();
}

uint64_t sub_2297DBA74()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2297DBA80()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2297DBA8C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2297DBA98()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2297DBAA4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2297DBAB0()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2297DBABC()
{
  return MEMORY[0x24BDCEBA0]();
}

uint64_t sub_2297DBAC8()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2297DBAD4()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_2297DBAE0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2297DBAEC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2297DBAF8()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_2297DBB04()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_2297DBB10()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_2297DBB1C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2297DBB28()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2297DBB34()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2297DBB40()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_2297DBB4C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2297DBB58()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_2297DBB64()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2297DBB70()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_2297DBB7C()
{
  return MEMORY[0x24BE70A40]();
}

uint64_t sub_2297DBB88()
{
  return MEMORY[0x24BDB4798]();
}

uint64_t sub_2297DBB94()
{
  return MEMORY[0x24BDB47A8]();
}

uint64_t sub_2297DBBA0()
{
  return MEMORY[0x24BDB47D8]();
}

uint64_t sub_2297DBBAC()
{
  return MEMORY[0x24BDB47E8]();
}

uint64_t sub_2297DBBB8()
{
  return MEMORY[0x24BDB47F0]();
}

uint64_t sub_2297DBBC4()
{
  return MEMORY[0x24BDB47F8]();
}

uint64_t sub_2297DBBD0()
{
  return MEMORY[0x24BDB4878]();
}

uint64_t sub_2297DBBDC()
{
  return MEMORY[0x24BDB48A0]();
}

uint64_t sub_2297DBBE8()
{
  return MEMORY[0x24BDB48C8]();
}

uint64_t sub_2297DBBF4()
{
  return MEMORY[0x24BDB48D8]();
}

uint64_t sub_2297DBC00()
{
  return MEMORY[0x24BDB48E0]();
}

uint64_t sub_2297DBC0C()
{
  return MEMORY[0x24BDB48E8]();
}

uint64_t sub_2297DBC18()
{
  return MEMORY[0x24BDB4928]();
}

uint64_t sub_2297DBC24()
{
  return MEMORY[0x24BDB4930]();
}

uint64_t sub_2297DBC30()
{
  return MEMORY[0x24BDB49A8]();
}

uint64_t sub_2297DBC3C()
{
  return MEMORY[0x24BDB49C0]();
}

uint64_t sub_2297DBC48()
{
  return MEMORY[0x24BE73B98]();
}

uint64_t sub_2297DBC54()
{
  return MEMORY[0x24BE73BA0]();
}

uint64_t sub_2297DBC60()
{
  return MEMORY[0x24BE73BB0]();
}

uint64_t sub_2297DBC6C()
{
  return MEMORY[0x24BE73BB8]();
}

uint64_t sub_2297DBC78()
{
  return MEMORY[0x24BE73BC8]();
}

uint64_t sub_2297DBC84()
{
  return MEMORY[0x24BE73BD8]();
}

uint64_t sub_2297DBC90()
{
  return MEMORY[0x24BE73BF0]();
}

uint64_t sub_2297DBC9C()
{
  return MEMORY[0x24BE73C00]();
}

uint64_t sub_2297DBCA8()
{
  return MEMORY[0x24BE73C08]();
}

uint64_t sub_2297DBCB4()
{
  return MEMORY[0x24BE73C10]();
}

uint64_t sub_2297DBCC0()
{
  return MEMORY[0x24BE73C38]();
}

uint64_t sub_2297DBCCC()
{
  return MEMORY[0x24BE73C50]();
}

uint64_t sub_2297DBCD8()
{
  return MEMORY[0x24BE73C58]();
}

uint64_t sub_2297DBCE4()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2297DBCF0()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_2297DBCFC()
{
  return MEMORY[0x24BE96FF0]();
}

uint64_t sub_2297DBD08()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_2297DBD14()
{
  return MEMORY[0x24BE97320]();
}

uint64_t sub_2297DBD20()
{
  return MEMORY[0x24BE97330]();
}

uint64_t sub_2297DBD2C()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_2297DBD38()
{
  return MEMORY[0x24BE97348]();
}

uint64_t sub_2297DBD44()
{
  return MEMORY[0x24BE97358]();
}

uint64_t sub_2297DBD50()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_2297DBD5C()
{
  return MEMORY[0x24BE97368]();
}

uint64_t sub_2297DBD68()
{
  return MEMORY[0x24BE97378]();
}

uint64_t sub_2297DBD74()
{
  return MEMORY[0x24BE97380]();
}

uint64_t sub_2297DBD80()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_2297DBD8C()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2297DBD98()
{
  return MEMORY[0x24BE973E8]();
}

uint64_t sub_2297DBDA4()
{
  return MEMORY[0x24BE97520]();
}

uint64_t sub_2297DBDB0()
{
  return MEMORY[0x24BE97538]();
}

uint64_t sub_2297DBDBC()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2297DBDC8()
{
  return MEMORY[0x24BE97560]();
}

uint64_t sub_2297DBDD4()
{
  return MEMORY[0x24BE97578]();
}

uint64_t sub_2297DBDE0()
{
  return MEMORY[0x24BE97580]();
}

uint64_t sub_2297DBDEC()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_2297DBDF8()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_2297DBE04()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_2297DBE10()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_2297DBE1C()
{
  return MEMORY[0x24BE97610]();
}

uint64_t sub_2297DBE28()
{
  return MEMORY[0x24BE97670]();
}

uint64_t sub_2297DBE34()
{
  return MEMORY[0x24BE97688]();
}

uint64_t sub_2297DBE40()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_2297DBE4C()
{
  return MEMORY[0x24BE97B38]();
}

uint64_t sub_2297DBE58()
{
  return MEMORY[0x24BE97B50]();
}

uint64_t sub_2297DBE64()
{
  return MEMORY[0x24BE97B58]();
}

uint64_t sub_2297DBE70()
{
  return MEMORY[0x24BE97B60]();
}

uint64_t sub_2297DBE7C()
{
  return MEMORY[0x24BE97B68]();
}

uint64_t sub_2297DBE88()
{
  return MEMORY[0x24BE97B70]();
}

uint64_t sub_2297DBE94()
{
  return MEMORY[0x24BE97B78]();
}

uint64_t sub_2297DBEA0()
{
  return MEMORY[0x24BE97B98]();
}

uint64_t sub_2297DBEAC()
{
  return MEMORY[0x24BE97BA8]();
}

uint64_t sub_2297DBEB8()
{
  return MEMORY[0x24BE97FB0]();
}

uint64_t sub_2297DBEC4()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2297DBED0()
{
  return MEMORY[0x24BE97FF8]();
}

uint64_t sub_2297DBEDC()
{
  return MEMORY[0x24BE980B8]();
}

uint64_t sub_2297DBEE8()
{
  return MEMORY[0x24BE980C8]();
}

uint64_t sub_2297DBEF4()
{
  return MEMORY[0x24BE98200]();
}

uint64_t sub_2297DBF00()
{
  return MEMORY[0x24BE98220]();
}

uint64_t sub_2297DBF0C()
{
  return MEMORY[0x24BE98228]();
}

uint64_t sub_2297DBF18()
{
  return MEMORY[0x24BE98508]();
}

uint64_t sub_2297DBF24()
{
  return MEMORY[0x24BE98590]();
}

uint64_t sub_2297DBF30()
{
  return MEMORY[0x24BE98748]();
}

uint64_t sub_2297DBF3C()
{
  return MEMORY[0x24BE98750]();
}

uint64_t sub_2297DBF48()
{
  return MEMORY[0x24BE98760]();
}

uint64_t sub_2297DBF54()
{
  return MEMORY[0x24BE98768]();
}

uint64_t sub_2297DBF60()
{
  return MEMORY[0x24BE98798]();
}

uint64_t sub_2297DBF6C()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2297DBF78()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_2297DBF84()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2297DBF90()
{
  return MEMORY[0x24BE98E58]();
}

uint64_t sub_2297DBF9C()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2297DBFA8()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2297DBFB4()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2297DBFC0()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2297DBFCC()
{
  return MEMORY[0x24BEA6310]();
}

uint64_t sub_2297DBFD8()
{
  return MEMORY[0x24BEA6320]();
}

uint64_t sub_2297DBFE4()
{
  return MEMORY[0x24BEA6408]();
}

uint64_t sub_2297DBFF0()
{
  return MEMORY[0x24BEA6410]();
}

uint64_t sub_2297DBFFC()
{
  return MEMORY[0x24BEA6420]();
}

uint64_t sub_2297DC008()
{
  return MEMORY[0x24BEA6428]();
}

uint64_t sub_2297DC014()
{
  return MEMORY[0x24BEA6430]();
}

uint64_t sub_2297DC020()
{
  return MEMORY[0x24BEA6450]();
}

uint64_t sub_2297DC02C()
{
  return MEMORY[0x24BEA6480]();
}

uint64_t sub_2297DC038()
{
  return MEMORY[0x24BEA6498]();
}

uint64_t sub_2297DC044()
{
  return MEMORY[0x24BEA64A0]();
}

uint64_t sub_2297DC050()
{
  return MEMORY[0x24BEA64A8]();
}

uint64_t sub_2297DC05C()
{
  return MEMORY[0x24BEA64B0]();
}

uint64_t sub_2297DC068()
{
  return MEMORY[0x24BEA64B8]();
}

uint64_t sub_2297DC074()
{
  return MEMORY[0x24BEA64C0]();
}

uint64_t sub_2297DC080()
{
  return MEMORY[0x24BEA64C8]();
}

uint64_t sub_2297DC08C()
{
  return MEMORY[0x24BEA64D0]();
}

uint64_t sub_2297DC098()
{
  return MEMORY[0x24BEA64D8]();
}

uint64_t sub_2297DC0A4()
{
  return MEMORY[0x24BEA64E0]();
}

uint64_t sub_2297DC0B0()
{
  return MEMORY[0x24BEA64E8]();
}

uint64_t sub_2297DC0BC()
{
  return MEMORY[0x24BEA64F0]();
}

uint64_t sub_2297DC0C8()
{
  return MEMORY[0x24BEA64F8]();
}

uint64_t sub_2297DC0D4()
{
  return MEMORY[0x24BEA6500]();
}

uint64_t sub_2297DC0E0()
{
  return MEMORY[0x24BEA6508]();
}

uint64_t sub_2297DC0EC()
{
  return MEMORY[0x24BEA6510]();
}

uint64_t sub_2297DC0F8()
{
  return MEMORY[0x24BEA6518]();
}

uint64_t sub_2297DC104()
{
  return MEMORY[0x24BEA6520]();
}

uint64_t sub_2297DC110()
{
  return MEMORY[0x24BEA6530]();
}

uint64_t sub_2297DC11C()
{
  return MEMORY[0x24BEA6550]();
}

uint64_t sub_2297DC128()
{
  return MEMORY[0x24BEA6558]();
}

uint64_t sub_2297DC134()
{
  return MEMORY[0x24BEA6560]();
}

uint64_t sub_2297DC140()
{
  return MEMORY[0x24BEA6568]();
}

uint64_t sub_2297DC14C()
{
  return MEMORY[0x24BEA6578]();
}

uint64_t sub_2297DC158()
{
  return MEMORY[0x24BEA6588]();
}

uint64_t sub_2297DC164()
{
  return MEMORY[0x24BEA65A8]();
}

uint64_t sub_2297DC170()
{
  return MEMORY[0x24BEA65C8]();
}

uint64_t sub_2297DC17C()
{
  return MEMORY[0x24BEA65E0]();
}

uint64_t sub_2297DC188()
{
  return MEMORY[0x24BEA65E8]();
}

uint64_t sub_2297DC194()
{
  return MEMORY[0x24BEA65F0]();
}

uint64_t sub_2297DC1A0()
{
  return MEMORY[0x24BEA6640]();
}

uint64_t sub_2297DC1AC()
{
  return MEMORY[0x24BEA6698]();
}

uint64_t sub_2297DC1B8()
{
  return MEMORY[0x24BEA66B0]();
}

uint64_t sub_2297DC1C4()
{
  return MEMORY[0x24BEA66B8]();
}

uint64_t sub_2297DC1D0()
{
  return MEMORY[0x24BEA66C8]();
}

uint64_t sub_2297DC1DC()
{
  return MEMORY[0x24BEA6708]();
}

uint64_t sub_2297DC1E8()
{
  return MEMORY[0x24BEA6720]();
}

uint64_t sub_2297DC1F4()
{
  return MEMORY[0x24BEA6728]();
}

uint64_t sub_2297DC200()
{
  return MEMORY[0x24BEA6738]();
}

uint64_t sub_2297DC20C()
{
  return MEMORY[0x24BEA6760]();
}

uint64_t sub_2297DC218()
{
  return MEMORY[0x24BEA6768]();
}

uint64_t sub_2297DC224()
{
  return MEMORY[0x24BEA6770]();
}

uint64_t sub_2297DC230()
{
  return MEMORY[0x24BEA6778]();
}

uint64_t sub_2297DC23C()
{
  return MEMORY[0x24BEA67C8]();
}

uint64_t sub_2297DC248()
{
  return MEMORY[0x24BEA67F8]();
}

uint64_t sub_2297DC254()
{
  return MEMORY[0x24BEA6808]();
}

uint64_t sub_2297DC260()
{
  return MEMORY[0x24BEA6810]();
}

uint64_t sub_2297DC26C()
{
  return MEMORY[0x24BEA6818]();
}

uint64_t sub_2297DC278()
{
  return MEMORY[0x24BEA6828]();
}

uint64_t sub_2297DC284()
{
  return MEMORY[0x24BEA6898]();
}

uint64_t sub_2297DC290()
{
  return MEMORY[0x24BEA68A8]();
}

uint64_t sub_2297DC29C()
{
  return MEMORY[0x24BEA68B0]();
}

uint64_t sub_2297DC2A8()
{
  return MEMORY[0x24BEA68B8]();
}

uint64_t sub_2297DC2B4()
{
  return MEMORY[0x24BEA68C8]();
}

uint64_t sub_2297DC2C0()
{
  return MEMORY[0x24BEA68E8]();
}

uint64_t sub_2297DC2CC()
{
  return MEMORY[0x24BEA68F8]();
}

uint64_t sub_2297DC2D8()
{
  return MEMORY[0x24BEA6908]();
}

uint64_t sub_2297DC2E4()
{
  return MEMORY[0x24BEA6918]();
}

uint64_t sub_2297DC2F0()
{
  return MEMORY[0x24BEA6988]();
}

uint64_t sub_2297DC2FC()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2297DC308()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_2297DC314()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_2297DC320()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2297DC32C()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_2297DC338()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2297DC344()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_2297DC350()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2297DC35C()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_2297DC368()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_2297DC374()
{
  return MEMORY[0x24BE9E020]();
}

uint64_t sub_2297DC380()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2297DC38C()
{
  return MEMORY[0x24BE9ED58]();
}

uint64_t sub_2297DC398()
{
  return MEMORY[0x24BE9ED60]();
}

uint64_t sub_2297DC3A4()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_2297DC3B0()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_2297DC3BC()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2297DC3C8()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2297DC3D4()
{
  return MEMORY[0x24BE9F9B8]();
}

uint64_t sub_2297DC3E0()
{
  return MEMORY[0x24BE9FE50]();
}

uint64_t sub_2297DC3EC()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_2297DC3F8()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_2297DC404()
{
  return MEMORY[0x24BE9FF88]();
}

uint64_t sub_2297DC410()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_2297DC41C()
{
  return MEMORY[0x24BEA0110]();
}

uint64_t sub_2297DC428()
{
  return MEMORY[0x24BEA0118]();
}

uint64_t sub_2297DC434()
{
  return MEMORY[0x24BEA0368]();
}

uint64_t sub_2297DC440()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2297DC44C()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_2297DC458()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_2297DC464()
{
  return MEMORY[0x24BEA0A10]();
}

uint64_t sub_2297DC470()
{
  return MEMORY[0x24BEA0A18]();
}

uint64_t sub_2297DC47C()
{
  return MEMORY[0x24BE90DB8]();
}

uint64_t sub_2297DC488()
{
  return MEMORY[0x24BEA0A38]();
}

uint64_t sub_2297DC494()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_2297DC4A0()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_2297DC4AC()
{
  return MEMORY[0x24BEA1610]();
}

uint64_t sub_2297DC4B8()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_2297DC4C4()
{
  return MEMORY[0x24BEA1C48]();
}

uint64_t sub_2297DC4D0()
{
  return MEMORY[0x24BEA20D8]();
}

uint64_t sub_2297DC4DC()
{
  return MEMORY[0x24BEA20F0]();
}

uint64_t sub_2297DC4E8()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_2297DC4F4()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_2297DC500()
{
  return MEMORY[0x24BEA2B38]();
}

uint64_t sub_2297DC50C()
{
  return MEMORY[0x24BEA2B48]();
}

uint64_t sub_2297DC518()
{
  return MEMORY[0x24BEA2B50]();
}

uint64_t sub_2297DC524()
{
  return MEMORY[0x24BEA3538]();
}

uint64_t sub_2297DC530()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_2297DC53C()
{
  return MEMORY[0x24BE93180]();
}

uint64_t sub_2297DC548()
{
  return MEMORY[0x24BE93188]();
}

uint64_t sub_2297DC554()
{
  return MEMORY[0x24BE93190]();
}

uint64_t sub_2297DC560()
{
  return MEMORY[0x24BE93198]();
}

uint64_t sub_2297DC56C()
{
  return MEMORY[0x24BE931A0]();
}

uint64_t sub_2297DC578()
{
  return MEMORY[0x24BE931A8]();
}

uint64_t sub_2297DC584()
{
  return MEMORY[0x24BE931B0]();
}

uint64_t sub_2297DC590()
{
  return MEMORY[0x24BE931B8]();
}

uint64_t sub_2297DC59C()
{
  return MEMORY[0x24BE931C0]();
}

uint64_t sub_2297DC5A8()
{
  return MEMORY[0x24BE931C8]();
}

uint64_t sub_2297DC5B4()
{
  return MEMORY[0x24BE931D0]();
}

uint64_t sub_2297DC5C0()
{
  return MEMORY[0x24BE931D8]();
}

uint64_t sub_2297DC5CC()
{
  return MEMORY[0x24BE931E0]();
}

uint64_t sub_2297DC5D8()
{
  return MEMORY[0x24BE931E8]();
}

uint64_t sub_2297DC5E4()
{
  return MEMORY[0x24BE931F0]();
}

uint64_t sub_2297DC5F0()
{
  return MEMORY[0x24BE931F8]();
}

uint64_t sub_2297DC5FC()
{
  return MEMORY[0x24BE93200]();
}

uint64_t sub_2297DC608()
{
  return MEMORY[0x24BE93208]();
}

uint64_t sub_2297DC614()
{
  return MEMORY[0x24BE93210]();
}

uint64_t sub_2297DC620()
{
  return MEMORY[0x24BE93218]();
}

uint64_t sub_2297DC62C()
{
  return MEMORY[0x24BE93220]();
}

uint64_t sub_2297DC638()
{
  return MEMORY[0x24BE93238]();
}

uint64_t sub_2297DC644()
{
  return MEMORY[0x24BEA5B38]();
}

uint64_t sub_2297DC650()
{
  return MEMORY[0x24BEA5B50]();
}

uint64_t sub_2297DC65C()
{
  return MEMORY[0x24BEA5B68]();
}

uint64_t sub_2297DC668()
{
  return MEMORY[0x24BEA5B70]();
}

uint64_t sub_2297DC674()
{
  return MEMORY[0x24BEA5C48]();
}

uint64_t sub_2297DC680()
{
  return MEMORY[0x24BEA5C50]();
}

uint64_t sub_2297DC68C()
{
  return MEMORY[0x24BEA5C60]();
}

uint64_t sub_2297DC698()
{
  return MEMORY[0x24BEA5C68]();
}

uint64_t sub_2297DC6A4()
{
  return MEMORY[0x24BEA5C78]();
}

uint64_t sub_2297DC6B0()
{
  return MEMORY[0x24BEA5CC8]();
}

uint64_t sub_2297DC6BC()
{
  return MEMORY[0x24BEA5CD0]();
}

uint64_t sub_2297DC6C8()
{
  return MEMORY[0x24BEA5CF8]();
}

uint64_t sub_2297DC6D4()
{
  return MEMORY[0x24BEA5D10]();
}

uint64_t sub_2297DC6E0()
{
  return MEMORY[0x24BEA5D18]();
}

uint64_t sub_2297DC6EC()
{
  return MEMORY[0x24BEA5D40]();
}

uint64_t sub_2297DC6F8()
{
  return MEMORY[0x24BEA5D50]();
}

uint64_t sub_2297DC704()
{
  return MEMORY[0x24BEA5D58]();
}

uint64_t sub_2297DC710()
{
  return MEMORY[0x24BEA5D80]();
}

uint64_t sub_2297DC71C()
{
  return MEMORY[0x24BEA5DB0]();
}

uint64_t sub_2297DC728()
{
  return MEMORY[0x24BEA5DB8]();
}

uint64_t sub_2297DC734()
{
  return MEMORY[0x24BEA5DC0]();
}

uint64_t sub_2297DC740()
{
  return MEMORY[0x24BEA5DD8]();
}

uint64_t sub_2297DC74C()
{
  return MEMORY[0x24BEA5F08]();
}

uint64_t sub_2297DC758()
{
  return MEMORY[0x24BEA87E0]();
}

uint64_t sub_2297DC764()
{
  return MEMORY[0x24BE990C0]();
}

uint64_t sub_2297DC770()
{
  return MEMORY[0x24BE990D8]();
}

uint64_t sub_2297DC77C()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_2297DC788()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_2297DC794()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_2297DC7A0()
{
  return MEMORY[0x24BEA8800]();
}

uint64_t sub_2297DC7AC()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_2297DC7B8()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_2297DC7C4()
{
  return MEMORY[0x24BEA8AB8]();
}

uint64_t sub_2297DC7D0()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_2297DC7DC()
{
  return MEMORY[0x24BEA8AD0]();
}

uint64_t sub_2297DC7E8()
{
  return MEMORY[0x24BEA8AE0]();
}

uint64_t sub_2297DC7F4()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_2297DC800()
{
  return MEMORY[0x24BEA8B20]();
}

uint64_t sub_2297DC80C()
{
  return MEMORY[0x24BEA8B30]();
}

uint64_t sub_2297DC818()
{
  return MEMORY[0x24BEA8BA0]();
}

uint64_t sub_2297DC824()
{
  return MEMORY[0x24BEA8BB8]();
}

uint64_t sub_2297DC830()
{
  return MEMORY[0x24BEA8C48]();
}

uint64_t sub_2297DC83C()
{
  return MEMORY[0x24BEA8C60]();
}

uint64_t sub_2297DC848()
{
  return MEMORY[0x24BEA8C68]();
}

uint64_t sub_2297DC854()
{
  return MEMORY[0x24BEA8D30]();
}

uint64_t sub_2297DC860()
{
  return MEMORY[0x24BEA8D40]();
}

uint64_t sub_2297DC86C()
{
  return MEMORY[0x24BEA8DD8]();
}

uint64_t sub_2297DC878()
{
  return MEMORY[0x24BEA8DE0]();
}

uint64_t sub_2297DC884()
{
  return MEMORY[0x24BEA8DE8]();
}

uint64_t sub_2297DC890()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_2297DC89C()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_2297DC8A8()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_2297DC8B4()
{
  return MEMORY[0x24BE69808]();
}

uint64_t sub_2297DC8C0()
{
  return MEMORY[0x24BE698C8]();
}

uint64_t sub_2297DC8CC()
{
  return MEMORY[0x24BE698D8]();
}

uint64_t sub_2297DC8D8()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_2297DC8E4()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_2297DC8F0()
{
  return MEMORY[0x24BEE73C8]();
}

uint64_t sub_2297DC8FC()
{
  return MEMORY[0x24BEE7408]();
}

uint64_t sub_2297DC908()
{
  return MEMORY[0x24BE92EC8]();
}

uint64_t sub_2297DC914()
{
  return MEMORY[0x24BE92F08]();
}

uint64_t sub_2297DC920()
{
  return MEMORY[0x24BE92F28]();
}

uint64_t sub_2297DC92C()
{
  return MEMORY[0x24BE92F68]();
}

uint64_t sub_2297DC938()
{
  return MEMORY[0x24BE92FB0]();
}

uint64_t sub_2297DC944()
{
  return MEMORY[0x24BE92FB8]();
}

uint64_t sub_2297DC950()
{
  return MEMORY[0x24BE92FC0]();
}

uint64_t sub_2297DC95C()
{
  return MEMORY[0x24BE92FC8]();
}

uint64_t sub_2297DC968()
{
  return MEMORY[0x24BE92FD0]();
}

uint64_t sub_2297DC974()
{
  return MEMORY[0x24BE92FE0]();
}

uint64_t sub_2297DC980()
{
  return MEMORY[0x24BE92FE8]();
}

uint64_t sub_2297DC98C()
{
  return MEMORY[0x24BE93020]();
}

uint64_t sub_2297DC998()
{
  return MEMORY[0x24BE93060]();
}

uint64_t sub_2297DC9A4()
{
  return MEMORY[0x24BE93068]();
}

uint64_t sub_2297DC9B0()
{
  return MEMORY[0x24BE93070]();
}

uint64_t sub_2297DC9BC()
{
  return MEMORY[0x24BE93078]();
}

uint64_t sub_2297DC9C8()
{
  return MEMORY[0x24BE93080]();
}

uint64_t sub_2297DC9D4()
{
  return MEMORY[0x24BE90DD8]();
}

uint64_t sub_2297DC9E0()
{
  return MEMORY[0x24BE90E50]();
}

uint64_t sub_2297DC9EC()
{
  return MEMORY[0x24BE90E60]();
}

uint64_t sub_2297DC9F8()
{
  return MEMORY[0x24BE90E68]();
}

uint64_t sub_2297DCA04()
{
  return MEMORY[0x24BE90E70]();
}

uint64_t sub_2297DCA10()
{
  return MEMORY[0x24BE90E78]();
}

uint64_t sub_2297DCA1C()
{
  return MEMORY[0x24BE90E80]();
}

uint64_t sub_2297DCA28()
{
  return MEMORY[0x24BE90E98]();
}

uint64_t sub_2297DCA34()
{
  return MEMORY[0x24BE94668]();
}

uint64_t sub_2297DCA40()
{
  return MEMORY[0x24BE94680]();
}

uint64_t sub_2297DCA4C()
{
  return MEMORY[0x24BE946F0]();
}

uint64_t sub_2297DCA58()
{
  return MEMORY[0x24BE94728]();
}

uint64_t sub_2297DCA64()
{
  return MEMORY[0x24BEA54F0]();
}

uint64_t sub_2297DCA70()
{
  return MEMORY[0x24BEA40E0]();
}

uint64_t sub_2297DCA7C()
{
  return MEMORY[0x24BEA4100]();
}

uint64_t sub_2297DCA88()
{
  return MEMORY[0x24BEA4578]();
}

uint64_t sub_2297DCA94()
{
  return MEMORY[0x24BEA4580]();
}

uint64_t sub_2297DCAA0()
{
  return MEMORY[0x24BEA4588]();
}

uint64_t sub_2297DCAAC()
{
  return MEMORY[0x24BEA4590]();
}

uint64_t sub_2297DCAB8()
{
  return MEMORY[0x24BEA4598]();
}

uint64_t sub_2297DCAC4()
{
  return MEMORY[0x24BEA45A0]();
}

uint64_t sub_2297DCAD0()
{
  return MEMORY[0x24BEA45A8]();
}

uint64_t sub_2297DCADC()
{
  return MEMORY[0x24BEA45B0]();
}

uint64_t sub_2297DCAE8()
{
  return MEMORY[0x24BEA45B8]();
}

uint64_t sub_2297DCAF4()
{
  return MEMORY[0x24BDFCA98]();
}

uint64_t sub_2297DCB00()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_2297DCB0C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2297DCB18()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_2297DCB24()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_2297DCB30()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2297DCB3C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2297DCB48()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2297DCB54()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2297DCB60()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2297DCB6C()
{
  return MEMORY[0x24BEA5538]();
}

uint64_t sub_2297DCB78()
{
  return MEMORY[0x24BEA5540]();
}

uint64_t sub_2297DCB84()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_2297DCB90()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_2297DCB9C()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_2297DCBA8()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_2297DCBB4()
{
  return MEMORY[0x24BEA5930]();
}

uint64_t sub_2297DCBC0()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_2297DCBCC()
{
  return MEMORY[0x24BEA5A18]();
}

uint64_t sub_2297DCBD8()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_2297DCBE4()
{
  return MEMORY[0x24BEA5A60]();
}

uint64_t sub_2297DCBF0()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_2297DCBFC()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_2297DCC08()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2297DCC14()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_2297DCC20()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_2297DCC2C()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_2297DCC38()
{
  return MEMORY[0x24BDB9FB8]();
}

uint64_t sub_2297DCC44()
{
  return MEMORY[0x24BEE5A78]();
}

uint64_t sub_2297DCC50()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2297DCC5C()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_2297DCC68()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2297DCC74()
{
  return MEMORY[0x24BEE54A8]();
}

uint64_t sub_2297DCC80()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2297DCC8C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2297DCC98()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_2297DCCA4()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_2297DCCB0()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_2297DCCBC()
{
  return MEMORY[0x24BEE54F8]();
}

uint64_t sub_2297DCCC8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2297DCCD4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2297DCCE0()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_2297DCCEC()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2297DCCF8()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_2297DCD04()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_2297DCD10()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_2297DCD1C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_2297DCD28()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2297DCD34()
{
  return MEMORY[0x24BDDEE70]();
}

uint64_t sub_2297DCD40()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_2297DCD4C()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_2297DCD58()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_2297DCD64()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_2297DCD70()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_2297DCD7C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2297DCD88()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2297DCD94()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2297DCDA0()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_2297DCDAC()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_2297DCDB8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2297DCDC4()
{
  return MEMORY[0x24BEE0388]();
}

uint64_t sub_2297DCDD0()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2297DCDDC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2297DCDE8()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2297DCDF4()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2297DCE00()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2297DCE0C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2297DCE18()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_2297DCE24()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2297DCE30()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_2297DCE3C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2297DCE48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2297DCE54()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2297DCE60()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2297DCE6C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2297DCE78()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2297DCE84()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2297DCE90()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2297DCE9C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2297DCEA8()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2297DCEB4()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_2297DCEC0()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2297DCECC()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2297DCED8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2297DCEE4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2297DCEF0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2297DCEFC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2297DCF08()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2297DCF14()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2297DCF20()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2297DCF2C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2297DCF38()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2297DCF44()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2297DCF50()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2297DCF5C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2297DCF68()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2297DCF74()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2297DCF80()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2297DCF8C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2297DCF98()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_2297DCFA4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2297DCFB0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2297DCFBC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2297DCFC8()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2297DCFD4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2297DCFE0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2297DCFEC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2297DCFF8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2297DD004()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_2297DD010()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2297DD01C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2297DD028()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2297DD034()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_2297DD040()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2297DD04C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2297DD058()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_2297DD064()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2297DD070()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2297DD07C()
{
  return MEMORY[0x24BEE6868]();
}

uint64_t sub_2297DD088()
{
  return MEMORY[0x24BEE6978]();
}

uint64_t sub_2297DD094()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2297DD0A0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2297DD0AC()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2297DD0B8()
{
  return MEMORY[0x24BDCFC60]();
}

uint64_t sub_2297DD0C4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2297DD0D0()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2297DD0DC()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2297DD0E8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2297DD0F4()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2297DD100()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2297DD10C()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_2297DD118()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2297DD124()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2297DD130()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2297DD13C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2297DD148()
{
  return MEMORY[0x24BEE5AB0]();
}

uint64_t sub_2297DD154()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2297DD160()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2297DD16C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2297DD178()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2297DD184()
{
  return MEMORY[0x24BEE5AB8]();
}

uint64_t sub_2297DD190()
{
  return MEMORY[0x24BEE5AC0]();
}

uint64_t sub_2297DD19C()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_2297DD1A8()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_2297DD1B4()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_2297DD1C0()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_2297DD1CC()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_2297DD1D8()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_2297DD1E4()
{
  return MEMORY[0x24BEE5680]();
}

uint64_t sub_2297DD1F0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2297DD1FC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2297DD208()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_2297DD214()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2297DD220()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2297DD22C()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_2297DD238()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2297DD244()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2297DD250()
{
  return MEMORY[0x24BEE5AC8]();
}

uint64_t sub_2297DD25C()
{
  return MEMORY[0x24BEE5AD0]();
}

uint64_t sub_2297DD268()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2297DD274()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2297DD280()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_2297DD28C()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_2297DD298()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2297DD2A4()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2297DD2B0()
{
  return MEMORY[0x24BE94938]();
}

uint64_t sub_2297DD2BC()
{
  return MEMORY[0x24BE94940]();
}

uint64_t sub_2297DD2C8()
{
  return MEMORY[0x24BE94970]();
}

uint64_t sub_2297DD2D4()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2297DD2E0()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_2297DD2EC()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2297DD2F8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2297DD304()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2297DD310()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2297DD31C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2297DD328()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_2297DD334()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2297DD340()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2297DD34C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2297DD358()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2297DD364()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_2297DD370()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2297DD37C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2297DD388()
{
  return MEMORY[0x24BDD05D8]();
}

uint64_t sub_2297DD394()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2297DD3A0()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_2297DD3AC()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_2297DD3B8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2297DD3C4()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_2297DD3D0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2297DD3DC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2297DD3E8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2297DD3F4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2297DD400()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2297DD40C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2297DD418()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2297DD424()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2297DD430()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2297DD43C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2297DD448()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2297DD454()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2297DD460()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2297DD46C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2297DD478()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2297DD484()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2297DD490()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2297DD49C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2297DD4A8()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2297DD4B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2297DD4C0()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_2297DD4CC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2297DD4D8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2297DD4E4()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2297DD4F0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2297DD4FC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2297DD508()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2297DD514()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2297DD520()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2297DD52C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2297DD538()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2297DD544()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_2297DD550()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2297DD55C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2297DD568()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_2297DD574()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2297DD580()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2297DD58C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2297DD598()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2297DD5A4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2297DD5B0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2297DD5BC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2297DD5C8()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2297DD5D4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2297DD5E0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2297DD5EC()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2297DD5F8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2297DD604()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2297DD610()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_2297DD61C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2297DD628()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2297DD634()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2297DD640()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_2297DD64C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2297DD658()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2297DD664()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_2297DD670()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2297DD67C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2297DD688()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2297DD694()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2297DD6A0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2297DD6AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2297DD6B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2297DD6C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2297DD6D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2297DD6DC()
{
  return MEMORY[0x24BDD0730]();
}

uint64_t sub_2297DD6E8()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_2297DD6F4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2297DD700()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2297DD70C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2297DD718()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2297DD724()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2297DD730()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2297DD73C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2297DD748()
{
  return MEMORY[0x24BE99140]();
}

uint64_t sub_2297DD754()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2297DD760()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t sub_2297DD76C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2297DD778()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2297DD784()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t sub_2297DD790()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2297DD79C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2297DD7A8()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_2297DD7B4()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AMSError()
{
  return MEMORY[0x24BE07D18]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x24BDD98D8]();
}

uint64_t INMediaItemTypeGetName()
{
  return MEMORY[0x24BDD9998]();
}

uint64_t INSupportedMediaCategories()
{
  return MEMORY[0x24BDD9A48]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x24BED84E0]();
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x24BE64CB0]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x24BE64DA0]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x24BE64DC0]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x24BE64DC8]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x24BE64E40]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x24BE64EB8]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x24BE64EC8]();
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults()
{
  return MEMORY[0x24BE64EE8]();
}

uint64_t MRAVReconnaissanceSessionSetTargetAudioSessionID()
{
  return MEMORY[0x24BE64EF0]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints()
{
  return MEMORY[0x24BE64F00]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x24BE65080]();
}

uint64_t MRMediaRemoteCommandInfoEnumerateSupportedCommandsWithHandler()
{
  return MEMORY[0x24BE65090]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x24BE650A0]();
}

uint64_t MRMediaRemoteGetLocalReceiverPairingIdentity()
{
  return MEMORY[0x24BE65150]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x24BE65168]();
}

uint64_t MRMediaRemoteGetNowPlayingClient()
{
  return MEMORY[0x24BE65180]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForOrigin()
{
  return MEMORY[0x24BE651C0]();
}

uint64_t MRMediaRemoteInsertSystemAppPlaybackQueueWithOptions()
{
  return MEMORY[0x24BE651D0]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return MEMORY[0x24BE65210]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x24BE65248]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x24BE652A0]();
}

uint64_t MROriginCopy()
{
  return MEMORY[0x24BE65320]();
}

uint64_t MROriginGetUniqueIdentifier()
{
  return MEMORY[0x24BE65338]();
}

uint64_t MRPlaybackQueueGetQueueID()
{
  return MEMORY[0x24BE65370]();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return MEMORY[0x24BE65390]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x24BE65410]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x24BE65440]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x24BEB3780]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x24BEB37F0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x24BDAE820](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x24BDAE828](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info64_out, host_info64_outCnt);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log1p(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAC0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_taskGroup_wait_next_throwing()
{
  return MEMORY[0x24BEE7218]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

