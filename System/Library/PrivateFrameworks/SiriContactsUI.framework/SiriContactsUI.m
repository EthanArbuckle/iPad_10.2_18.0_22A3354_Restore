uint64_t GetContactView.body.getter()
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
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575585E8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0();
  v3 = v2 - v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575585F0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575585F8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0();
  v38 = v15 - v14;
  v16 = sub_2461E6160();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0();
  v20 = v19 - v18;
  type metadata accessor for GetContactView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_0();
  v24 = v23 - v22;
  sub_2461BFEA0(v39, v23 - v22, v25);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v20, v24, v16);
    sub_2461E6148();
    v26 = (void *)sub_2461E60DC();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v11, v36);
    *(_QWORD *)v7 = sub_2461E6538();
    *(_QWORD *)(v7 + 8) = 0;
    *(_BYTE *)(v7 + 16) = 1;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558610);
    sub_2461BE200(v26, v20, (char *)(v7 + *(int *)(v27 + 44)));
    v28 = v7;
    if (qword_2575585D8 != -1)
      swift_once();
    v37 = v17;
    v29 = qword_25755AC08;
    v30 = qword_25755AC08;
    if (qword_2575585D0 != -1)
    {
      swift_once();
      v30 = qword_25755AC08;
    }
    v31 = qword_25755AC00;
    v32 = sub_2461E6604();
    sub_2461BFE80(v28, v38, &qword_2575585F0);

    v33 = v38 + *(int *)(v12 + 36);
    *(_BYTE *)v33 = v32;
    *(_QWORD *)(v33 + 8) = v29;
    *(_QWORD *)(v33 + 16) = v31;
    *(_QWORD *)(v33 + 24) = v30;
    *(_QWORD *)(v33 + 32) = v31;
    *(_BYTE *)(v33 + 40) = 0;
    sub_2461BFEF4(v28, &qword_2575585F0);
    sub_2461BFE80(v38, v3, &qword_2575585F8);
    swift_storeEnumTagMultiPayload();
    sub_2461BE138();
    sub_2461E6550();
    sub_2461BFEF4(v38, &qword_2575585F8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v20, v16);
  }
  else
  {
    sub_2461BFECC(v24, (uint64_t (*)(_QWORD))type metadata accessor for GetContactView);
    swift_storeEnumTagMultiPayload();
    sub_2461BE138();
    return sub_2461E6550();
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495541B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for GetContactView()
{
  uint64_t result;

  result = qword_257558688;
  if (!qword_257558688)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2461BE138()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257558600;
  if (!qword_257558600)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575585F8);
    sub_2461BFDA4(&qword_257558608, &qword_2575585F0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257558600);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495541C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2461BE200@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  id v44;
  void (*v45)(char *, char *, uint64_t);
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t KeyPath;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  char v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, char *, uint64_t);
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  int *v125;
  char *v126;
  uint64_t v127;
  void (*v128)(char *, uint64_t);
  void (*v130)(char *, char *, uint64_t);
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t ContactQuickActionButtonsView;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t *v171;
  char *v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unsigned __int8 v180;
  uint64_t v181;
  unsigned __int8 v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  __int128 v189;

  v177 = a2;
  v172 = a3;
  v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v168 = (uint64_t)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v167 = (uint64_t)&v130 - v6;
  v164 = sub_2461E6160();
  v163 = *(_QWORD *)(v164 - 8);
  MEMORY[0x24BDAC7A8](v164);
  v162 = (char *)&v130 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v159 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v158 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v9 = MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v171 = (uint64_t *)((char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v170 = (uint64_t)&v130 - v11;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558710);
  MEMORY[0x24BDAC7A8](v155);
  v136 = (uint64_t)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558718);
  v13 = MEMORY[0x24BDAC7A8](v133);
  v134 = (uint64_t)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v132 = (uint64_t)&v130 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v135 = (char *)&v130 - v17;
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558720);
  MEMORY[0x24BDAC7A8](v153);
  v154 = (void (**)(char *, char *, uint64_t))((char *)&v130 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558728);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v166 = (uint64_t)&v130 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v176 = (uint64_t)&v130 - v22;
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v139 = *(_QWORD *)(v143 - 8);
  MEMORY[0x24BDAC7A8](v143);
  v142 = (char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558738);
  v24 = MEMORY[0x24BDAC7A8](v173);
  v131 = (char *)&v130 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v138 = (char *)&v130 - v26;
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558740);
  v144 = *(_QWORD *)(v145 - 8);
  MEMORY[0x24BDAC7A8](v145);
  v137 = (char *)&v130 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558748);
  v28 = MEMORY[0x24BDAC7A8](v141);
  v161 = (uint64_t)&v130 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v140 = (char *)&v130 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v178 = (uint64_t)&v130 - v32;
  v33 = sub_2461E6004();
  MEMORY[0x24BDAC7A8](v33);
  v34 = sub_2461E68EC();
  v175 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)&v130 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558750);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v130 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v39);
  v43 = (char *)&v130 - v42;
  v146 = a1;
  v44 = objc_msgSend(a1, sel_identifier);
  sub_2461E6A78();

  sub_2461E5FF8();
  swift_bridgeObjectRelease();
  sub_2461E68F8();
  sub_2461BFC14(&qword_257558758, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
  sub_2461E6760();
  (*(void (**)(char *, uint64_t))(v175 + 8))(v36, v34);
  v174 = v43;
  v175 = v38;
  v45 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
  v156 = v41;
  v157 = v37;
  v45(v43, v41, v37);
  if (qword_2575585C8 != -1)
    swift_once();
  sub_2461E68A4();
  sub_2461E63E8();
  v152 = v179;
  v151 = v180;
  v150 = v181;
  v149 = v182;
  v148 = v183;
  v147 = v184;
  v46 = v146;
  v185 = sub_2461E6C70();
  v186 = v47;
  sub_2461BFC74();
  v48 = sub_2461E66AC();
  v50 = v49;
  v185 = v48;
  v186 = v49;
  v52 = v51 & 1;
  LOBYTE(v187) = v51 & 1;
  v188 = v53;
  v54 = v142;
  sub_2461E6760();
  sub_2461BFCB0(v48, v50, v52);
  swift_bridgeObjectRelease();
  v55 = sub_2461E6640();
  KeyPath = swift_getKeyPath();
  v57 = v139;
  v58 = (uint64_t)v138;
  v59 = v143;
  v130 = *(void (**)(char *, char *, uint64_t))(v139 + 16);
  v130(v138, v54, v143);
  v60 = (uint64_t *)(v58 + *(int *)(v173 + 36));
  *v60 = KeyPath;
  v60[1] = v55;
  v61 = *(void (**)(char *, uint64_t))(v57 + 8);
  v61(v54, v59);
  sub_2461E6628();
  sub_2461BFCC8();
  v62 = v137;
  sub_2461E6718();
  sub_2461BFEF4(v58, &qword_257558738);
  v63 = v62;
  if ((sub_2461E6130() & 1) != 0)
    v64 = sub_2461E67C0();
  else
    v64 = sub_2461E67B4();
  v65 = v64;
  v66 = v144;
  v67 = (uint64_t)v140;
  v68 = v145;
  (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v140, v63, v145);
  *(_QWORD *)(v67 + *(int *)(v141 + 36)) = v65;
  (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v68);
  sub_2461BFD70(v67, v178, &qword_257558748);
  v69 = objc_msgSend(v46, sel_organizationName);
  v70 = sub_2461E6A78();
  v72 = v71;

  swift_bridgeObjectRelease();
  v73 = HIBYTE(v72) & 0xF;
  if ((v72 & 0x2000000000000000) == 0)
    v73 = v70 & 0xFFFFFFFFFFFFLL;
  if (v73)
  {
    v74 = objc_msgSend(v46, sel_organizationName);
    v75 = sub_2461E6A78();
    v77 = v76;

    v185 = v75;
    v186 = v77;
    v78 = sub_2461E66AC();
    v80 = v79;
    v185 = v78;
    v186 = v79;
    v82 = v81 & 1;
    LOBYTE(v187) = v81 & 1;
    v188 = v83;
    sub_2461E6760();
    sub_2461BFCB0(v78, v80, v82);
    swift_bridgeObjectRelease();
    v84 = sub_2461E6610();
    v85 = swift_getKeyPath();
    v86 = (uint64_t)v131;
    v130(v131, v54, v59);
    v87 = (uint64_t *)(v86 + *(int *)(v173 + 36));
    *v87 = v85;
    v87[1] = v84;
    v61(v54, v59);
    if ((sub_2461E6130() & 1) != 0)
      v88 = sub_2461E67C0();
    else
      v88 = sub_2461E67B4();
    v94 = v88;
    v95 = (uint64_t)v135;
    v96 = v132;
    sub_2461BFE80(v86, v132, &qword_257558738);
    *(_QWORD *)(v96 + *(int *)(v133 + 36)) = v94;
    sub_2461BFEF4(v86, &qword_257558738);
    sub_2461BFD70(v96, v95, &qword_257558718);
    if (qword_2575585D8 != -1)
      swift_once();
    sub_2461E68A4();
    sub_2461E63E8();
    v97 = v185;
    v98 = v186;
    v99 = v187;
    v100 = v188;
    v101 = v189;
    v102 = v134;
    sub_2461BFE80(v95, v134, &qword_257558718);
    v103 = v136;
    sub_2461BFE80(v102, v136, &qword_257558718);
    v104 = v103 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257558780) + 48);
    *(_QWORD *)v104 = 0;
    *(_BYTE *)(v104 + 8) = 1;
    *(_QWORD *)(v104 + 16) = v97;
    *(_BYTE *)(v104 + 24) = v98;
    *(_QWORD *)(v104 + 32) = v99;
    *(_BYTE *)(v104 + 40) = v100;
    *(_OWORD *)(v104 + 48) = v101;
    sub_2461BFEF4(v102, &qword_257558718);
    sub_2461BFE80(v103, (uint64_t)v154, &qword_257558710);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558788);
    sub_2461BFDA4(&qword_257558790, &qword_257558710);
    sub_2461BFDD8();
    sub_2461E6550();
    sub_2461BFEF4(v103, &qword_257558710);
    sub_2461BFEF4(v95, &qword_257558718);
  }
  else
  {
    if (qword_2575585D0 != -1)
      swift_once();
    sub_2461E68A4();
    sub_2461E63E8();
    v89 = v185;
    v90 = v186;
    v91 = v187;
    v92 = v188;
    v93 = v154;
    *v154 = 0;
    *((_BYTE *)v93 + 8) = 1;
    v93[2] = v89;
    *((_BYTE *)v93 + 24) = v90;
    v93[4] = v91;
    *((_BYTE *)v93 + 40) = v92;
    *((_OWORD *)v93 + 3) = v189;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558788);
    sub_2461BFDA4(&qword_257558790, &qword_257558710);
    sub_2461BFDD8();
    sub_2461E6550();
  }
  v105 = v158;
  v106 = v177;
  sub_2461E6148();
  v107 = v160;
  v108 = sub_2461E60DC();
  (*(void (**)(char *, uint64_t))(v159 + 8))(v105, v107);
  type metadata accessor for GetContactQuickActionButtonsViewModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v162, v106, v164);
  sub_2461DE410();
  sub_2461E6A18();
  sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v109 = sub_2461E6478();
  v110 = (uint64_t)v171;
  *v171 = v109;
  *(_QWORD *)(v110 + 8) = v111;
  v112 = ContactQuickActionButtonsView;
  v113 = sub_2461E60D0();
  v114 = v167;
  __swift_storeEnumTagSinglePayload(v167, 1, 1, v113);
  sub_2461BFE80(v114, v168, &qword_257558708);
  sub_2461E6808();
  sub_2461BFEF4(v114, &qword_257558708);
  *(_QWORD *)(v110 + *(int *)(v112 + 24)) = v108;
  v115 = (uint64_t *)(v110 + *(int *)(v112 + 28));
  sub_2461BFC14(&qword_2575587A8, (void (*)(uint64_t))type metadata accessor for GetContactQuickActionButtonsViewModel);
  *v115 = sub_2461E643C();
  v115[1] = v116;
  v117 = v170;
  sub_2461BFE3C(v110, v170);
  v118 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
  v119 = v156;
  v120 = v157;
  v118(v156, v174, v157);
  v121 = v161;
  sub_2461BFE80(v178, v161, &qword_257558748);
  v122 = v176;
  v123 = v166;
  sub_2461BFE80(v176, v166, &qword_257558728);
  sub_2461BFEA0(v117, v110, type metadata accessor for GetContactQuickActionButtonsView);
  v124 = v172;
  v118(v172, v119, v120);
  v125 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2575587B0);
  v126 = &v124[v125[12]];
  *(_QWORD *)v126 = 0;
  v126[8] = 1;
  *((_QWORD *)v126 + 2) = v152;
  v126[24] = v151;
  *((_QWORD *)v126 + 4) = v150;
  v126[40] = v149;
  v127 = v147;
  *((_QWORD *)v126 + 6) = v148;
  *((_QWORD *)v126 + 7) = v127;
  sub_2461BFE80(v121, (uint64_t)&v124[v125[16]], &qword_257558748);
  sub_2461BFE80(v123, (uint64_t)&v124[v125[20]], &qword_257558728);
  sub_2461BFEA0(v110, (uint64_t)&v124[v125[24]], type metadata accessor for GetContactQuickActionButtonsView);
  sub_2461BFECC(v117, type metadata accessor for GetContactQuickActionButtonsView);
  sub_2461BFEF4(v122, &qword_257558728);
  sub_2461BFEF4(v178, &qword_257558748);
  v128 = *(void (**)(char *, uint64_t))(v175 + 8);
  v128(v174, v120);
  sub_2461BFECC(v110, type metadata accessor for GetContactQuickActionButtonsView);
  sub_2461BFEF4(v123, &qword_257558728);
  sub_2461BFEF4(v121, &qword_257558748);
  return ((uint64_t (*)(char *, uint64_t))v128)(v119, v120);
}

uint64_t sub_2461BF208()
{
  return sub_2461E6754();
}

uint64_t sub_2461BF228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2461E6A78();
  v2 = v1;
  if (v0 == sub_2461E6A78() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  return v5 & 1;
}

uint64_t sub_2461BF298(uint64_t a1, uint64_t a2)
{
  return sub_2461BF2D0(a1, a2, (void (*)(uint64_t))MEMORY[0x24BE91E28], &qword_257558700);
}

uint64_t sub_2461BF2B4(uint64_t a1, uint64_t a2)
{
  return sub_2461BF2D0(a1, a2, (void (*)(uint64_t))MEMORY[0x24BE91D28], &qword_2575586F8);
}

uint64_t sub_2461BF2D0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), _QWORD *a4)
{
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  a3(0);
  sub_2461BFC14(a4, a3);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_12();
  if (v11 == v9 && v12 == v10)
    v7 = 1;
  else
    v7 = OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  return v7 & 1;
}

uint64_t sub_2461BF384()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GetContactView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_2461E6160();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for GetContactView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2461E6160();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for GetContactView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E6160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for GetContactView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461BFECC(a1, (uint64_t (*)(_QWORD))type metadata accessor for GetContactView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E6160();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for GetContactView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E6160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for GetContactView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461BFECC(a1, (uint64_t (*)(_QWORD))type metadata accessor for GetContactView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E6160();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2461BF69C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2461BF6AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461E6160();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2461BF714()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575586C0;
  if (!qword_2575586C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575586C8);
    v2[0] = sub_2461BE138();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575586C0);
  }
  return result;
}

void type metadata accessor for CNActionType(uint64_t a1)
{
  sub_2461C0020(a1, &qword_2575586D0);
}

uint64_t sub_2461BF794(uint64_t a1, id *a2)
{
  return sub_2461BF7A8(a1, a2);
}

uint64_t sub_2461BF7A8(uint64_t a1, id *a2)
{
  _QWORD *v2;
  uint64_t result;

  OUTLINED_FUNCTION_8(a1, a2);
  result = sub_2461E6A60();
  *v2 = 0;
  return result;
}

uint64_t sub_2461BF80C(uint64_t a1, id *a2)
{
  return sub_2461BF824(a1, a2) & 1;
}

uint64_t sub_2461BF824(uint64_t a1, id *a2)
{
  _QWORD *v2;
  char v3;

  OUTLINED_FUNCTION_8(a1, a2);
  v3 = sub_2461E6A6C();
  *v2 = 0;
  return v3 & 1;
}

void sub_2461BF894()
{
  sub_2461E6A78();
  sub_2461E6A54();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void sub_2461BF8C0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_2461E6A78();
  a2(v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461BF8F0()
{
  OUTLINED_FUNCTION_9();
  sub_2461E6AE4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461BF92C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9();
  sub_2461E6DC0();
  sub_2461E6AE4();
  v0 = sub_2461E6DCC();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_2461BF994()
{
  uint64_t *v0;

  sub_2461BF8C0(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2461BF9B4()
{
  return sub_2461BF8F0();
}

uint64_t sub_2461BF9CC()
{
  return sub_2461BF92C();
}

void sub_2461BF9E4()
{
  uint64_t *v0;

  sub_2461BF8C0(*v0, (void (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

void sub_2461BFA04(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_2461BF894();
  *a1 = v2;
}

uint64_t sub_2461BFA28()
{
  return sub_2461BF228() & 1;
}

uint64_t sub_2461BFA4C()
{
  sub_2461BFC14(&qword_2575587D8, type metadata accessor for VNImageOption);
  sub_2461BFC14(&qword_2575587E0, type metadata accessor for VNImageOption);
  return sub_2461E6D78();
}

uint64_t sub_2461BFAD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2461E6A54();
  result = OUTLINED_FUNCTION_4();
  *a1 = v2;
  return result;
}

uint64_t sub_2461BFB10@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2461BF380(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2461BFB38()
{
  sub_2461BFC14(&qword_257559890, type metadata accessor for CNActionType);
  sub_2461BFC14(&qword_2575586F0, type metadata accessor for CNActionType);
  return sub_2461E6D78();
}

void sub_2461BFBBC()
{
  sub_2461BFC14(&qword_2575586D8, type metadata accessor for CNActionType);
}

void sub_2461BFBE8()
{
  sub_2461BFC14(&qword_2575586E0, type metadata accessor for CNActionType);
}

void sub_2461BFC14(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_1();
}

void sub_2461BFC48()
{
  sub_2461BFC14(&qword_2575586E8, type metadata accessor for CNActionType);
}

unint64_t sub_2461BFC74()
{
  unint64_t result;

  result = qword_257558760;
  if (!qword_257558760)
  {
    result = MEMORY[0x2495541D0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257558760);
  }
  return result;
}

uint64_t sub_2461BFCB0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_2461BFCC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_257558768;
  if (!qword_257558768)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558738);
    v4[2] = MEMORY[0x24BDF1FA8];
    v4[3] = MEMORY[0x24BDF1F80];
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_2461BFDA4(&qword_257558770, &qword_257558778);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558768);
  }
  return result;
}

void sub_2461BFD70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_7(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void sub_2461BFDA4(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_1();
}

unint64_t sub_2461BFDD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257558798;
  if (!qword_257558798)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558788);
    v2[0] = MEMORY[0x24BDF4610];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257558798);
  }
  return result;
}

uint64_t sub_2461BFE3C(uint64_t a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactQuickActionButtonsView - 8) + 32))(a2, a1, ContactQuickActionButtonsView);
  return a2;
}

void sub_2461BFE80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_1();
}

void sub_2461BFEA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_1();
}

void sub_2461BFECC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
}

void sub_2461BFEF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
}

void type metadata accessor for VNImageOption(uint64_t a1)
{
  sub_2461C0020(a1, &qword_2575587B8);
}

void sub_2461BFF30()
{
  sub_2461BFC14(&qword_2575587C0, type metadata accessor for VNImageOption);
}

void sub_2461BFF5C()
{
  sub_2461BFC14(&qword_2575587C8, type metadata accessor for VNImageOption);
}

void sub_2461BFF88()
{
  sub_2461BFC14(&qword_2575587D0, type metadata accessor for VNImageOption);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2461BFFC4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2461BFFE4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_2461C0020(a1, &qword_2575587E8);
}

void sub_2461C0020(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_2461E6D9C();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_8(uint64_t a1, id *a2)
{

}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_2461E6A78();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11()
{
  JUMPOUT(0x2495541D0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_2461E6B08();
}

uint64_t sub_2461C0138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_2461C0140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  void (*v37)(char *, unint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = v0;
  v2 = sub_2461E6184();
  v41 = *(_QWORD *)(v2 - 8);
  v42 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_0();
  v40 = v3;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - v5;
  v43 = sub_2461E61C0();
  v7 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_3_0();
  v39 = v8;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v34 - v10;
  v12 = sub_2461E6214();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v34 - v17;
  v19 = sub_2461E61D8();
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v21 = OUTLINED_FUNCTION_2_0((uint64_t)v18);
  if ((v19 & 1) != 0)
  {
    v38 = v1;
    result = MEMORY[0x2495531F8](v21);
    if (!*(_QWORD *)(result + 16))
    {
      __break(1u);
      goto LABEL_12;
    }
    v35 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v23 = v43;
    v37 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v37(v11, result + v35, v43);
    OUTLINED_FUNCTION_4();
    sub_2461E61B4();
    v36 = *(void (**)(char *, uint64_t))(v7 + 8);
    v36(v11, v23);
    v25 = v40;
    v24 = v41;
    v26 = v42;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v41 + 104))(v40, *MEMORY[0x24BE91DF8], v42);
    v27 = sub_2461BF298((uint64_t)v6, v25);
    v28 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v28(v25, v26);
    v28((uint64_t)v6, v26);
    OUTLINED_FUNCTION_0_0((uint64_t)v18);
    v29 = v20(v16, v38, v12);
    if ((v27 & 1) != 0)
    {
      result = MEMORY[0x2495531F8](v29);
      if (*(_QWORD *)(result + 16))
      {
        v30 = v39;
        v31 = v43;
        v37(v39, result + v35, v43);
        OUTLINED_FUNCTION_4();
        sub_2461E619C();
        v33 = v32;
        v36(v30, v31);
        OUTLINED_FUNCTION_0_0((uint64_t)v16);
        if (v33)
        {
          OUTLINED_FUNCTION_4();
          return 1;
        }
        return 0;
      }
LABEL_12:
      __break(1u);
      return result;
    }
  }
  else
  {
    OUTLINED_FUNCTION_0_0((uint64_t)v18);
    OUTLINED_FUNCTION_2_0((uint64_t)v16);
  }
  OUTLINED_FUNCTION_0_0((uint64_t)v16);
  return 0;
}

uint64_t sub_2461C03F4()
{
  uint64_t v0;
  uint64_t v1;

  if ((sub_2461C04A0() & 1) == 0)
    return sub_2461E6ACC();
  sub_2461E619C();
  if (v0)
  {
    sub_2461E6AF0();
    swift_bridgeObjectRelease();
  }
  sub_2461E6190();
  if (v1)
  {
    sub_2461E6AF0();
    swift_bridgeObjectRelease();
    sub_2461E6AF0();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_2461C04A0()
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
  int v9;
  char v12;
  char v13;
  char v14;
  uint64_t v16;

  v1 = sub_2461E61C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2461E6184();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461E61B4();
  v9 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (v9 == *MEMORY[0x24BE91E00] || v9 == *MEMORY[0x24BE91DE0] || v9 == *MEMORY[0x24BE91DF0])
  {
    sub_2461E619C();
    v12 = sub_2461E6CAC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
    if ((v12 & 1) != 0)
    {
      sub_2461E6190();
      v13 = sub_2461E6CAC();
      OUTLINED_FUNCTION_4();
      v14 = v13 ^ 1;
    }
    else
    {
      v14 = 1;
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

char *sub_2461C0638(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = (char **)((char *)a2 + v8);
    v11 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2461E6394();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *(_QWORD *)v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = *(int *)(a3 + 24);
    v14 = &a1[v13];
    v15 = (uint64_t)a2 + v13;
    v16 = sub_2461E62E0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_2461C0748(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2461E6394();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = (char *)a1 + *(int *)(a2 + 24);
  v7 = sub_2461E62E0();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_2461C07E8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)((char *)a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_2461E6394();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2461E62E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

uint64_t sub_2461C08CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 20);
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    sub_2461C09D0(a1 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2461E6394();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2461E62E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_2461C09D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_2461C0A10(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2461E6394();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

void **sub_2461C0AF4(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = *a1;
  *a1 = *a2;

  a1[1] = a2[1];
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_2461C09D0((uint64_t)a1 + v7);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_2461E6394();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_2461C0BF8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461C0C04(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2575587F8);
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v10 = v9;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = OUTLINED_FUNCTION_5_0();
      v11 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_2461C0CA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_2461C0CB4(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2575587F8);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_5_0();
      v10 = *(int *)(a4 + 24);
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ModifyContactAttributeIntentHandledView()
{
  uint64_t result;

  result = qword_257558858;
  if (!qword_257558858)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461C0D80()
{
  unint64_t v0;
  unint64_t v1;

  sub_2461C0E10();
  if (v0 <= 0x3F)
  {
    sub_2461E62E0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2461C0E10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257558868[0])
  {
    sub_2461E6394();
    v0 = sub_2461E63A0();
    if (!v1)
      atomic_store(v0, qword_257558868);
  }
}

uint64_t sub_2461C0E64()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2461C0E78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *oslog;

  if (a2 >> 60 == 15)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v2 = sub_2461E6310();
    __swift_project_value_buffer(v2, (uint64_t)qword_257559B40);
    oslog = sub_2461E62F8();
    v3 = sub_2461E6BF8();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2461B8000, oslog, v3, "#SiriContactsActionableView could not obtain direct invocation for view press", v4, 2u);
      OUTLINED_FUNCTION_7_0();
    }
  }
  else
  {
    sub_2461C1A2C();
    v5 = OUTLINED_FUNCTION_6_0();
    sub_2461C1A68(v5, v6);
    OUTLINED_FUNCTION_6_0();
    v7 = sub_2461E6BE0();
    if (v7)
    {
      v8 = (void *)v7;
      sub_2461E6A0C();

      v9 = OUTLINED_FUNCTION_6_0();
      sub_2461C19BC(v9, v10);
      return;
    }
    if (qword_2575585B8 != -1)
      swift_once();
    v11 = sub_2461E6310();
    __swift_project_value_buffer(v11, (uint64_t)qword_257559B40);
    oslog = sub_2461E62F8();
    v12 = sub_2461E6BF8();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2461B8000, oslog, v12, "#SiriContactsActionableView could not convert direct invocation to actionable command", v13, 2u);
      OUTLINED_FUNCTION_7_0();
    }
    v14 = OUTLINED_FUNCTION_6_0();
    sub_2461C19BC(v14, v15);
  }

}

uint64_t sub_2461C104C@<X0>(uint64_t a1@<X8>)
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
  _QWORD v11[2];

  v2 = v1;
  v11[1] = a1;
  v3 = OUTLINED_FUNCTION_1_0();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x24BDAC7A8](v3);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575588A0);
  v11[0] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461C1B18(v2, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeIntentHandledView);
  v8 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575588A8);
  sub_2461BFDA4(&qword_2575588B0, &qword_2575588A8);
  sub_2461E6910();
  sub_2461C1B18(v2, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeIntentHandledView);
  v9 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(v9);
  sub_2461BFDA4(&qword_2575588B8, &qword_2575588A0);
  sub_2461E6748();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11[0] + 8))(v7, v5);
}

uint64_t sub_2461C120C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
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

  v72 = a2;
  v70 = sub_2461E5FE0();
  v67 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v64 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2461E697C();
  v59 = *(_QWORD *)(v4 - 8);
  v60 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_2461E6994();
  v66 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v55 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575588C8);
  v71 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v58 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575588D0);
  v65 = *(_QWORD *)(v68 - 8);
  v8 = MEMORY[0x24BDAC7A8](v68);
  v61 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v55 - v10;
  v11 = sub_2461E664C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ModifyContactAttributeBodyView();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v56 = (uint64_t)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (uint64_t *)((char *)&v55 - v18);
  v20 = a1 + *(int *)(type metadata accessor for ModifyContactAttributeIntentHandledView() + 24);
  v21 = (char *)v19 + *(int *)(v15 + 28);
  v22 = sub_2461E62E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v21, v20, v22);
  sub_2461E6A18();
  sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v19 = sub_2461E6478();
  v19[1] = v23;
  v73 = 0x402E000000000000;
  v24 = *MEMORY[0x24BDF1878];
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v25(v14, v24, v11);
  sub_2461C1AAC();
  sub_2461E63C4();
  v73 = 0x4031000000000000;
  v25(v14, v24, v11);
  sub_2461E63C4();
  v73 = sub_2461DDB84();
  v74 = v26;
  sub_2461BFC74();
  v27 = sub_2461E66AC();
  v29 = v28;
  LOBYTE(v12) = v30;
  v32 = v31;
  v75 = MEMORY[0x24BDF1FA8];
  v76 = MEMORY[0x24BEAD6B0];
  v33 = swift_allocObject();
  v73 = v33;
  *(_QWORD *)(v33 + 16) = v27;
  *(_QWORD *)(v33 + 24) = v29;
  *(_BYTE *)(v33 + 32) = v12 & 1;
  *(_QWORD *)(v33 + 40) = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v57, *MEMORY[0x24BEADF78], v60);
  v34 = v55;
  sub_2461E6988();
  v35 = v67;
  v36 = v64;
  v37 = v70;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v64, *MEMORY[0x24BEAB508], v70);
  sub_2461BFC14(&qword_2575588E0, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
  v39 = v38;
  v40 = v58;
  v41 = v63;
  sub_2461E66D0();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v34, v41);
  v73 = v41;
  v74 = v39;
  swift_getOpaqueTypeConformance2();
  v42 = v61;
  v43 = v69;
  sub_2461E66DC();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v40, v43);
  v44 = v65;
  v45 = v62;
  v46 = v68;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v62, v42, v68);
  v47 = v56;
  sub_2461C1B18((uint64_t)v19, v56, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeBodyView);
  v48 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  v49 = v44;
  v50 = v46;
  v48(v42, v45, v46);
  v51 = v72;
  sub_2461C1B18(v47, v72, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeBodyView);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575588E8);
  v48((char *)(v51 + *(int *)(v52 + 48)), v42, v50);
  v53 = *(void (**)(char *, uint64_t))(v49 + 8);
  v53(v45, v50);
  sub_2461C1B58((uint64_t)v19);
  v53(v42, v50);
  return sub_2461C1B58(v47);
}

uint64_t sub_2461C1794(id *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t result;

  type metadata accessor for ModifyContactAttributeIntentHandledView();
  v2 = sub_2461E6274();
  if (*a1)
  {
    v4 = v2;
    v5 = v3;
    v6 = *a1;
    sub_2461C0E78(v4, v5);

    return sub_2461C19BC(v4, v5);
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2461E646C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2461C1858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461C189C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_1_0();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  return sub_2461C120C(v3, a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_1_0();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2461E6394();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = (char *)v3 + *(int *)(v1 + 24);
  v7 = OUTLINED_FUNCTION_5_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_2461C19A4()
{
  uint64_t v0;
  id *v1;

  v0 = OUTLINED_FUNCTION_1_0();
  v1 = (id *)OUTLINED_FUNCTION_0_1(v0);
  return sub_2461C1794(v1);
}

uint64_t sub_2461C19BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2461C19D0(a1, a2);
  return a1;
}

uint64_t sub_2461C19D0(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_2461C1A2C()
{
  unint64_t result;

  result = qword_2575588C0;
  if (!qword_2575588C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575588C0);
  }
  return result;
}

uint64_t sub_2461C1A68(uint64_t a1, unint64_t a2)
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

unint64_t sub_2461C1AAC()
{
  unint64_t result;

  result = qword_2575588D8;
  if (!qword_2575588D8)
  {
    result = MEMORY[0x2495541D0](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2575588D8);
  }
  return result;
}

uint64_t sub_2461C1AE8()
{
  uint64_t v0;

  sub_2461BFCB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2461C1B18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461C1B58(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461C1B94()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575588A0);
  sub_2461BFDA4(&qword_2575588B8, &qword_2575588A0);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return type metadata accessor for ModifyContactAttributeIntentHandledView();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2461C1858(v1, a1 + v2);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_2461E62E0();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_7_0()
{
  JUMPOUT(0x249554254);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_slowAlloc();
}

uint64_t sub_2461C1C5C()
{
  return sub_2461E6484();
}

uint64_t sub_2461C1C7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_2461E6394();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v4 - v3, a1);
  return sub_2461E6490();
}

uint64_t ModifyContactAttributeView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t (*v37)();
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v2 = v1;
  v50 = a1;
  v51 = type metadata accessor for ModifyContactAttributeIntentHandledView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_2();
  v6 = (uint64_t *)(v4 - v5);
  MEMORY[0x24BDAC7A8](v7);
  v45 = (uint64_t)&v44 - v8;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575588F0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v49 = v11 - v10;
  v48 = type metadata accessor for ModifyContactAttributeConfirmationView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_2();
  v15 = (uint64_t *)(v13 - v14);
  MEMORY[0x24BDAC7A8](v16);
  v44 = (uint64_t)&v44 - v17;
  v18 = sub_2461E62E0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2_2();
  v22 = v20 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v44 - v24;
  type metadata accessor for ModifyContactAttributeView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_0();
  v29 = v28 - v27;
  sub_2461C2198(v2, v28 - v27, v30);
  LODWORD(v2) = swift_getEnumCaseMultiPayload();
  OUTLINED_FUNCTION_5_1((uint64_t)v25, v29);
  v47 = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v22, v25, v18);
  sub_2461E6A18();
  sub_2461C2130(&qword_2575587A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  v31 = sub_2461E6478();
  v33 = v31;
  v34 = v32;
  if ((_DWORD)v2 == 1)
  {
    *v6 = v31;
    v6[1] = v32;
    v35 = v51;
    v36 = (uint64_t *)((char *)v6 + *(int *)(v51 + 20));
    *v36 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_5_1((uint64_t)v6 + *(int *)(v35 + 24), v22);
    v37 = type metadata accessor for ModifyContactAttributeIntentHandledView;
    v38 = v45;
    sub_2461C216C((uint64_t)v6, v45, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeIntentHandledView);
    sub_2461C2198(v38, v49, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeIntentHandledView);
    swift_storeEnumTagMultiPayload();
    sub_2461C2130(&qword_2575588F8, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView, (uint64_t)&unk_2461E8030);
    sub_2461C2130(&qword_257558900, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView, (uint64_t)&unk_2461E7770);
    sub_2461E6550();
    v39 = v38;
  }
  else
  {
    *v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    OUTLINED_FUNCTION_7_1();
    v40 = v48;
    v41 = (uint64_t *)((char *)v15 + *(int *)(v48 + 20));
    *v41 = v33;
    v41[1] = v34;
    OUTLINED_FUNCTION_5_1((uint64_t)v15 + *(int *)(v40 + 24), v22);
    v37 = type metadata accessor for ModifyContactAttributeConfirmationView;
    v42 = v44;
    sub_2461C216C((uint64_t)v15, v44, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeConfirmationView);
    sub_2461C2198(v42, v49, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeConfirmationView);
    OUTLINED_FUNCTION_7_1();
    sub_2461C2130(&qword_2575588F8, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView, (uint64_t)&unk_2461E8030);
    sub_2461C2130(&qword_257558900, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView, (uint64_t)&unk_2461E7770);
    sub_2461E6550();
    v39 = v42;
  }
  sub_2461C23B8(v39, (uint64_t (*)(_QWORD))v37);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v25, v18);
}

uint64_t type metadata accessor for ModifyContactAttributeView()
{
  uint64_t result;

  result = qword_257558978;
  if (!qword_257558978)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461C210C()
{
  return sub_2461E6484();
}

void sub_2461C2130(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2495541D0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1();
}

void sub_2461C216C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4_0(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1();
}

void sub_2461C2198(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4_0(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461C21C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ModifyContactAttributeView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_2461E62E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ModifyContactAttributeView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2461E62E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E62E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461C23B8(a1, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E62E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_2461C23B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_1();
}

uint64_t initializeWithTake for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E62E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ModifyContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461C23B8(a1, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E62E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2461C24F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461E62E0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2461C2558()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575589B0;
  if (!qword_2575589B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575589B8);
    sub_2461C2130(&qword_2575588F8, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeConfirmationView, (uint64_t)&unk_2461E8030);
    v3 = v2;
    sub_2461C2130(&qword_257558900, (uint64_t (*)(uint64_t))type metadata accessor for ModifyContactAttributeIntentHandledView, (uint64_t)&unk_2461E7770);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575589B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_storeEnumTagMultiPayload();
}

void static ContactsFlowImageColorGenerator.colors(for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v8;

  if (a2 >> 60 == 15)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v2 = sub_2461E6310();
    __swift_project_value_buffer(v2, (uint64_t)qword_257559B40);
    v3 = sub_2461E62F8();
    v4 = sub_2461E6BEC();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v5 = 0;
      OUTLINED_FUNCTION_5_2(&dword_2461B8000, v3, v4, "ContactsFlowImageColorGenerator no imageData, falling back to default color set", v5);
      OUTLINED_FUNCTION_7_0();
    }

    sub_2461C277C();
  }
  sub_2461C4924(0, &qword_2575589D0);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  v8 = sub_2461C28E4(a1, a2);
  sub_2461C2958(v8);
}

void sub_2461C275C()
{
  qword_2575589C0 = 0x4010000000000000;
}

void sub_2461C276C()
{
  qword_2575589C8 = 0x4014000000000000;
}

void sub_2461C277C()
{
  uint64_t v0;

  v0 = sub_2461E6784();
  MEMORY[0x24BDAC7A8](v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558A00);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2461E78A0;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_1();
}

void sub_2461C2828(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_1();
}

void sub_2461C284C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_1();
}

void sub_2461C2870(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  OUTLINED_FUNCTION_0_2();
  v2[7] = MEMORY[0x249553804](v1, 0.584313725, 0.588235294, 0.603921569, 1.0);
  OUTLINED_FUNCTION_0_2();
  v2[8] = MEMORY[0x249553804](v1, 0.603921569, 0.603921569, 0.619607843, 1.0);
  *(_QWORD *)(v3 - 72) = v2;
  sub_2461E6B38();
  OUTLINED_FUNCTION_3_2();
}

id sub_2461C28E4(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_2461E5FB0();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_2461C19D0(a1, a2);

  return v6;
}

void sub_2461C2958(void *a1)
{
  id v1;
  id v2;
  void *v3;
  char **v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  if (a1)
  {
    v1 = objc_retainAutorelease(a1);
    v2 = objc_msgSend(v1, sel_ioSurface);
    if (v2)
    {
      v3 = v2;
      v4 = &selRef_initWithIOSurface_;
    }
    else
    {
      v5 = objc_msgSend(v1, sel_CGImage);
      if (!v5)
        goto LABEL_8;
      v3 = v5;
      v4 = &selRef_initWithCGImage_;
    }
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), *v4, v3);

    if (v6)
      sub_2461C2CC4(v6);
  }
LABEL_8:
  if (qword_2575585B8 != -1)
    swift_once();
  v7 = sub_2461E6310();
  __swift_project_value_buffer(v7, (uint64_t)qword_257559B40);
  v8 = sub_2461E62F8();
  v9 = sub_2461E6BEC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2461B8000, v8, v9, "ContactsFlowImageColorGenerator couldn't get CIImage from UIImage base, falling back to default color set", v10, 2u);
    MEMORY[0x249554254](v10, -1, -1);
  }

  sub_2461C277C();
}

uint64_t static ContactsFlowImageColorGenerator.shouldDisplayLightText(against:)(uint64_t a1)
{
  char v1;

  sub_2461C2B1C(a1);
  sub_2461E67C0();
  v1 = sub_2461E6790();
  swift_release();
  swift_release();
  return v1 & 1;
}

void sub_2461C2B1C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  double v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint8_t *v10;
  uint8_t *v11;

  if (qword_2575585B8 != -1)
    swift_once();
  v2 = sub_2461E6310();
  __swift_project_value_buffer(v2, (uint64_t)qword_257559B40);
  v3 = sub_2461E62F8();
  v4 = sub_2461E6BEC();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_9_0();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_5_2(&dword_2461B8000, v3, v4, "ContactsFlowImageColorGenerator idealTextColor", v5);
    OUTLINED_FUNCTION_7_0();
  }

  sub_2461C4524(a1);
  sub_2461E67C0();
  v6 = sub_2461C429C();
  swift_release();
  v7 = sub_2461E62F8();
  v8 = sub_2461E6BEC();
  v9 = os_log_type_enabled(v7, v8);
  if (v6 <= 0.45)
  {
    if (v9)
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_5_2(&dword_2461B8000, v7, v8, "ContactsFlowImageColorGenerator idealTextColor returning dark text color", v11);
      OUTLINED_FUNCTION_7_0();
    }

    sub_2461E67B4();
  }
  else
  {
    if (v9)
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v10 = 0;
      OUTLINED_FUNCTION_5_2(&dword_2461B8000, v7, v8, "ContactsFlowImageColorGenerator idealTextColor returning light text color", v10);
      OUTLINED_FUNCTION_7_0();
    }

    sub_2461E67C0();
  }
  swift_release();
  OUTLINED_FUNCTION_3_2();
}

void sub_2461C2CC4(void *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t inited;
  uint64_t v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  void *v73;
  void *v74;
  CGAffineTransform v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, sel_extent);
  v3 = v2;
  v5 = v4;
  type metadata accessor for VNImageOption(0);
  sub_2461C4878();
  v6 = a1;
  sub_2461E6A30();
  v7 = objc_allocWithZone(MEMORY[0x24BDF9C28]);
  v8 = sub_2461C47D0(v6);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF9BE8]), sel_init);
  objc_msgSend(v9, sel_setRevision_, 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575589E0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2461E78B0;
  *(_QWORD *)(v10 + 32) = v9;
  sub_2461E6B38();
  sub_2461C4924(0, &qword_2575589E8);
  v11 = v9;
  v12 = (void *)sub_2461E6B20();
  swift_bridgeObjectRelease();
  v75.a = 0.0;
  v13 = objc_msgSend(v8, sel_performRequests_error_, v12, &v75);

  if (!v13)
  {
    v46 = *(id *)&v75.a;
    v47 = (void *)sub_2461E5F74();

    swift_willThrow();
    if (qword_2575585B8 != -1)
      swift_once();
    v48 = sub_2461E6310();
    __swift_project_value_buffer(v48, (uint64_t)qword_257559B40);
    v49 = v47;
    v50 = v47;
    v51 = sub_2461E62F8();
    v52 = sub_2461E6BEC();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      *(_QWORD *)&v75.a = v54;
      *(_DWORD *)v53 = 136315138;
      swift_getErrorValue();
      v55 = sub_2461E6DB4();
      sub_2461D5F20(v55, v56, (uint64_t *)&v75);
      sub_2461E6CB8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2461B8000, v51, v52, "ContactsFlowImageColorGenerator failed to complete image request, falling back to default color set with error: %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249554254](v54, -1, -1);
      MEMORY[0x249554254](v53, -1, -1);
    }
    else
    {

    }
    sub_2461C277C();
  }
  v14 = *(id *)&v75.a;
  v15 = sub_2461C48B8(v11);
  if (v15)
  {
    v16 = v15;
    if (v15 >> 62)
    {
      if (sub_2461E6D60())
      {
LABEL_5:
        sub_2461D6698(0, (v16 & 0xC000000000000001) == 0, v16);
        if ((v16 & 0xC000000000000001) != 0)
          v17 = (id)MEMORY[0x249553D14](0, v16);
        else
          v17 = *(id *)(v16 + 32);
        v18 = v17;
        swift_bridgeObjectRelease();
        v19 = objc_msgSend(v18, sel_pixelBuffer);
        v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), sel_initWithCVPixelBuffer_, v19);

        objc_msgSend(v20, sel_extent);
        CGAffineTransformMakeScale(&v75, v3 / v21, v5 / v22);
        v23 = objc_msgSend(v20, sel_imageByApplyingTransform_, &v75);
        v24 = (void *)objc_opt_self();
        v25 = objc_msgSend(v24, sel_colorThresholdFilter);
        objc_msgSend(v25, sel_setInputImage_, v23);
        LODWORD(v26) = 0.5;
        objc_msgSend(v25, sel_setThreshold_, v26);
        v27 = objc_msgSend(v25, sel_outputImage);
        if (v27)
        {
          v28 = v27;
          v29 = objc_msgSend(v24, sel_maskToAlphaFilter);
          objc_msgSend(v29, sel_setInputImage_, v28);
          v30 = objc_msgSend(v29, sel_outputImage);
          if (v30)
          {
            v31 = v30;
            v32 = objc_msgSend(v24, sel_sourceOutCompositingFilter);
            objc_msgSend(v32, sel_setInputImage_, v6);
            objc_msgSend(v32, sel_setBackgroundImage_, v31);
            v33 = objc_msgSend(v32, sel_outputImage);
            if (v33)
            {
              v74 = v33;
              v73 = (void *)sub_2461E6A54();
              __swift_instantiateConcreteTypeFromMangledName(&qword_2575589F0);
              inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_2461E78C0;
              *(_QWORD *)(inited + 32) = 0x6469577475706E69;
              *(_QWORD *)(inited + 40) = 0xEA00000000006874;
              v35 = MEMORY[0x24BEE50B0];
              *(double *)(inited + 48) = v3;
              *(_QWORD *)(inited + 72) = v35;
              *(_QWORD *)(inited + 80) = 0x6965487475706E69;
              *(_QWORD *)(inited + 88) = 0xEB00000000746867;
              *(_QWORD *)(inited + 120) = v35;
              *(double *)(inited + 96) = v5;
              sub_2461E6A30();
              v36 = (void *)sub_2461E6A24();
              swift_bridgeObjectRelease();
              v37 = objc_msgSend(v74, sel_imageByApplyingFilter_withInputParameters_, v73, v36);

              objc_msgSend(v37, sel_extent);
              v39 = v38;
              v41 = v40;
              v43 = v42;
              v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
              v45 = objc_msgSend(v44, sel_createCGImage_fromRect_, v37, v39, v41, 8.0, v43);

              sub_2461C3790(v45);
            }
            if (qword_2575585B8 != -1)
              swift_once();
            v65 = sub_2461E6310();
            __swift_project_value_buffer(v65, (uint64_t)qword_257559B40);
            v66 = sub_2461E62F8();
            v67 = sub_2461E6BEC();
            if (os_log_type_enabled(v66, v67))
            {
              v68 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v68 = 0;
              _os_log_impl(&dword_2461B8000, v66, v67, "ContactsFlowImageColorGenerator failed to extract subject from image for color sampling, falling back to default color set", v68, 2u);
              MEMORY[0x249554254](v68, -1, -1);
            }

            sub_2461C277C();
          }
          if (qword_2575585B8 != -1)
            swift_once();
          v61 = sub_2461E6310();
          __swift_project_value_buffer(v61, (uint64_t)qword_257559B40);
          v62 = sub_2461E62F8();
          v63 = sub_2461E6BEC();
          if (os_log_type_enabled(v62, v63))
          {
            v64 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v64 = 0;
            _os_log_impl(&dword_2461B8000, v62, v63, "ContactsFlowImageColorGenerator failed to remove background from filtered image mask, falling back to default color set", v64, 2u);
            MEMORY[0x249554254](v64, -1, -1);
          }

          sub_2461C277C();
        }
        if (qword_2575585B8 != -1)
          swift_once();
        v57 = sub_2461E6310();
        __swift_project_value_buffer(v57, (uint64_t)qword_257559B40);
        v58 = sub_2461E62F8();
        v59 = sub_2461E6BEC();
        if (os_log_type_enabled(v58, v59))
        {
          v60 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_2461B8000, v58, v59, "ContactsFlowImageColorGenerator failed to obtain filtered image mask, falling back to default color set", v60, 2u);
          MEMORY[0x249554254](v60, -1, -1);
        }

        sub_2461C277C();
      }
    }
    else if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_2575585B8 != -1)
    swift_once();
  v69 = sub_2461E6310();
  __swift_project_value_buffer(v69, (uint64_t)qword_257559B40);
  v70 = sub_2461E62F8();
  v71 = sub_2461E6BEC();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_2461B8000, v70, v71, "ContactsFlowImageColorGenerator failed to obtain result from completed request, falling back to default color set", v72, 2u);
    MEMORY[0x249554254](v72, -1, -1);
  }

  sub_2461C277C();
}

void sub_2461C3790(void *a1)
{
  CGImage *v1;
  size_t Width;
  int64_t Height;
  double v4;
  CGColorSpaceRef v5;
  CGColorSpace *v6;
  uint64_t v8;
  uint64_t v9;
  CGContext *v10;
  char *Data;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  int v37;
  int v38;
  int v39;
  double v41;
  uint64_t v42;
  _BYTE *v43;
  unint64_t v44;
  double v45;
  unint64_t v46;
  double v47;
  unint64_t v48;
  double v49;
  uint64_t v50;
  unsigned int v51;
  CGImage *v52;
  CGContext *v53;
  CGColorSpace *v54;
  uint64_t v55;

  if (!a1)
  {
    if (qword_2575585B8 == -1)
      goto LABEL_30;
    goto LABEL_75;
  }
  v1 = a1;
  Width = CGImageGetWidth(v1);
  Height = CGImageGetHeight(v1);
  if (Width && Height)
  {
    v4 = (double)Height;
    if (qword_2575585A8 != -1)
      swift_once();
    if (*(double *)&qword_2575589C8 * 32.0 > v4)
      v4 = *(double *)&qword_2575589C8 * 32.0;
    v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
    if (v5)
    {
      v6 = v5;
      if (qword_2575585A0 != -1)
        swift_once();
      if (v4 <= -9.22337204e18)
      {
        __break(1u);
      }
      else if (v4 < 9.22337204e18)
      {
        if ((*(_QWORD *)&v4 & 0x7FF0000000000000) != 0x7FF0000000000000
          && (qword_2575589C0 & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          if (*(double *)&qword_2575589C0 > -9.22337204e18)
          {
            if (*(double *)&qword_2575589C0 < 9.22337204e18)
            {
              v8 = (uint64_t)v4;
              v9 = (uint64_t)*(double *)&qword_2575589C0;
              v10 = CGBitmapContextCreate(0, 1uLL, (uint64_t)v4, 8uLL, (uint64_t)*(double *)&qword_2575589C0, v6, 0x4001u);
              if (v10)
              {
                sub_2461E6BD4();
                Data = (char *)CGBitmapContextGetData(v10);
                if (Data)
                {
                  v12 = (uint64_t)Data;
                  if (v8 < 1)
                  {
                    i = 0;
                  }
                  else
                  {
                    for (i = 0; i != v8; ++i)
                    {
                      v14 = i * v9;
                      if ((unsigned __int128)(i * (__int128)v9) >> 64 != (i * v9) >> 63)
                        goto LABEL_73;
                      v15 = &Data[v14];
                      v16 = Data[v14];
                      v17 = Data[v14 + 1];
                      v18 = Data[v14 + 3];
                      if ((v16 | v17 || v15[2]) && v18)
                        goto LABEL_48;
                    }
                    i = (uint64_t)v4;
                  }
LABEL_48:
                  v33 = v4 + -1.0;
                  if ((~COERCE__INT64(v4 + -1.0) & 0x7FF0000000000000) != 0)
                  {
                    if (v33 > -9.22337204e18)
                    {
                      if (v33 < 9.22337204e18)
                      {
                        v34 = (uint64_t)v33;
                        if ((uint64_t)v33 >= 1)
                        {
                          do
                          {
                            v35 = v34 * v9;
                            if ((unsigned __int128)(v34 * (__int128)v9) >> 64 != (v34 * v9) >> 63)
                              goto LABEL_74;
                            v36 = &Data[v35];
                            v37 = Data[v35];
                            v38 = Data[v35 + 1];
                            v39 = Data[v35 + 3];
                            if ((v37 | v38 || v36[2]) && v39)
                              goto LABEL_59;
                          }
                          while (v34-- > 1);
                          v34 = 0;
                        }
LABEL_59:
                        v55 = MEMORY[0x24BEE4AF8];
                        if (!__OFSUB__(v34, i))
                        {
                          v41 = ceil((double)(v34 - i) / (*(double *)&qword_2575589C8 + -1.0));
                          if ((~*(_QWORD *)&v41 & 0x7FF0000000000000) != 0)
                          {
                            v53 = v10;
                            v54 = v6;
                            if (v41 > -9.22337204e18)
                            {
                              v52 = v1;
                              if (v41 < 9.22337204e18)
                              {
                                if (i >= v34)
                                {
LABEL_70:
                                  v51 = sub_2461C3F24(v34, v12);
                                  sub_2461C3FCC(v51);
                                }
                                v42 = (uint64_t)v41;
                                while ((unsigned __int128)(i * (__int128)v9) >> 64 == (i * v9) >> 63)
                                {
                                  v43 = (_BYTE *)(v12 + i * v9);
                                  LOBYTE(v41) = *v43;
                                  *(double *)&v44 = (double)*(unint64_t *)&v41;
                                  v45 = *(double *)&v44 / 255.0;
                                  LOBYTE(v44) = v43[1];
                                  *(double *)&v46 = (double)v44;
                                  v47 = *(double *)&v46 / 255.0;
                                  LOBYTE(v46) = v43[2];
                                  *(double *)&v48 = (double)v46;
                                  v49 = *(double *)&v48 / 255.0;
                                  LOBYTE(v48) = v43[3];
                                  MEMORY[0x2495537A4](objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v45, v47, v49, (double)v48 / 255.0, v52, v53, v54));
                                  MEMORY[0x249553B40]();
                                  if (*(_QWORD *)(v55 + 16) >= *(_QWORD *)(v55 + 24) >> 1)
                                    sub_2461E6B44();
                                  sub_2461E6B5C();
                                  sub_2461E6B38();
                                  v50 = i + v42;
                                  if (__OFADD__(i, v42))
                                    goto LABEL_72;
                                  i += v42;
                                  if (v50 >= v34)
                                    goto LABEL_70;
                                }
                                __break(1u);
LABEL_72:
                                __break(1u);
LABEL_73:
                                __break(1u);
LABEL_74:
                                __break(1u);
LABEL_75:
                                swift_once();
LABEL_30:
                                v19 = sub_2461E6310();
                                __swift_project_value_buffer(v19, (uint64_t)qword_257559B40);
                                v20 = sub_2461E62F8();
                                v21 = sub_2461E6BEC();
                                if (os_log_type_enabled(v20, v21))
                                {
                                  v22 = (uint8_t *)swift_slowAlloc();
                                  *(_WORD *)v22 = 0;
                                  _os_log_impl(&dword_2461B8000, v20, v21, "ContactsFlowImageColorGenerator no cgImage, falling back to default color set", v22, 2u);
                                  MEMORY[0x249554254](v22, -1, -1);
                                }

                                sub_2461C277C();
                              }
LABEL_88:
                              __break(1u);
                              JUMPOUT(0x2461C3F08);
                            }
LABEL_87:
                            __break(1u);
                            goto LABEL_88;
                          }
LABEL_86:
                          __break(1u);
                          goto LABEL_87;
                        }
LABEL_85:
                        __break(1u);
                        goto LABEL_86;
                      }
LABEL_84:
                      __break(1u);
                      goto LABEL_85;
                    }
                  }
                  else
                  {
                    __break(1u);
                  }
                  __break(1u);
                  goto LABEL_84;
                }
              }
              if (qword_2575585B8 == -1)
              {
LABEL_38:
                v28 = sub_2461E6310();
                __swift_project_value_buffer(v28, (uint64_t)qword_257559B40);
                v29 = sub_2461E62F8();
                v30 = sub_2461E6BEC();
                if (os_log_type_enabled(v29, v30))
                {
                  v31 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v31 = 0;
                  _os_log_impl(&dword_2461B8000, v29, v30, "ContactsFlowImageColorGenerator rawImageData was nil after drawing, falling back to default color set", v31, 2u);
                  MEMORY[0x249554254](v31, -1, -1);
                }

                sub_2461C277C();
              }
LABEL_81:
              swift_once();
              goto LABEL_38;
            }
LABEL_80:
            __break(1u);
            goto LABEL_81;
          }
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      __break(1u);
      goto LABEL_78;
    }
    if (qword_2575585B8 != -1)
      swift_once();
    v32 = sub_2461E6310();
    __swift_project_value_buffer(v32, (uint64_t)qword_257559B40);
    v24 = sub_2461E62F8();
    v25 = sub_2461E6BEC();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      v27 = "ContactsFlowImageColorGenerator failed to create sRGB color space, falling back to default color set";
      goto LABEL_45;
    }
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v23 = sub_2461E6310();
    __swift_project_value_buffer(v23, (uint64_t)qword_257559B40);
    v24 = sub_2461E62F8();
    v25 = sub_2461E6BEC();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      v27 = "ContactsFlowImageColorGenerator cgImage had a side length 0, falling back to default color set";
LABEL_45:
      _os_log_impl(&dword_2461B8000, v24, v25, v27, v26, 2u);
      MEMORY[0x249554254](v26, -1, -1);
    }
  }

  sub_2461C277C();
}

uint64_t sub_2461C3F24(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  if (qword_2575585A0 != -1)
    result = swift_once();
  if ((~qword_2575589C0 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(double *)&qword_2575589C0 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(double *)&qword_2575589C0 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = v3 * (uint64_t)*(double *)&qword_2575589C0;
  if ((unsigned __int128)(v3 * (__int128)(uint64_t)*(double *)&qword_2575589C0) >> 64 == v4 >> 63)
    return *(unsigned int *)(a2 + v4);
LABEL_11:
  __break(1u);
  return result;
}

void sub_2461C3FCC(unsigned int a1)
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, (double)a1 / 255.0, (double)BYTE1(a1) / 255.0, (double)BYTE2(a1) / 255.0, (double)HIBYTE(a1) / 255.0);
  JUMPOUT(0x2495537A4);
}

uint64_t sub_2461C404C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = MEMORY[0x24BEE4AF8];
  v15 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_2461C4924(0, &qword_2575589D8);
    swift_bridgeObjectRetain();
    v4 = 0;
    do
    {
      v13 = 0;
      v14 = 0;
      v11 = 0.0;
      v12 = 0;
      v9 = 0.0;
      v10 = 0.0;
      v8 = 1.0;
      swift_retain_n();
      v5 = (void *)sub_2461E6C34();
      objc_msgSend(v5, sel_getRed_green_blue_alpha_, &v11, &v10, &v9, &v8);
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v11 * 0.33 + 0.0, v10 * 0.33 + 0.0, v9 * 0.33 + 0.0, v8);
      objc_msgSend(v6, sel_getHue_saturation_brightness_alpha_, &v14, &v13, &v12, 0);
      sub_2461E679C();
      sub_2461E67CC();
      v7 = swift_release();
      MEMORY[0x249553B40](v7);
      if (*(_QWORD *)(v15 + 16) >= *(_QWORD *)(v15 + 24) >> 1)
        sub_2461E6B44();
      ++v4;
      sub_2461E6B5C();
      sub_2461E6B38();

      swift_release();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

double sub_2461C429C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18[2];

  v18[1] = *(double *)MEMORY[0x24BDAC8D0];
  if (qword_2575585B8 != -1)
    swift_once();
  v0 = sub_2461E6310();
  __swift_project_value_buffer(v0, (uint64_t)qword_257559B40);
  v1 = sub_2461E62F8();
  v2 = sub_2461E6BEC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2461B8000, v1, v2, "ContactsFlowImageColorGenerator calculating color difference", v3, 2u);
    MEMORY[0x249554254](v3, -1, -1);
  }

  v17 = 0.0;
  v18[0] = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  sub_2461C4924(0, &qword_2575589D8);
  swift_retain();
  v4 = (void *)sub_2461E6C34();
  objc_msgSend(v4, sel_getRed_green_blue_alpha_, v18, &v17, &v16, &v15);
  swift_retain();
  v5 = (void *)sub_2461E6C34();
  objc_msgSend(v5, sel_getRed_green_blue_alpha_, &v14, &v13, &v12, &v11);
  v6 = vabdd_f64(v18[0] * v15, v14 * v11) + vabdd_f64(v15 * v17, v11 * v13) + vabdd_f64(v15 * v16, v11 * v12);
  v7 = sub_2461E62F8();
  v8 = sub_2461E6BEC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 134217984;
    sub_2461E6CB8();
    _os_log_impl(&dword_2461B8000, v7, v8, "ContactsFlowImageColorGenerator color difference was %f", v9, 0xCu);
    MEMORY[0x249554254](v9, -1, -1);
  }

  return v6;
}

uint64_t sub_2461C4524(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22[2];

  v22[1] = *(double *)MEMORY[0x24BDAC8D0];
  v2 = sub_2461E6784();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v21 = 0.0;
    v22[0] = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    sub_2461C4924(0, &qword_2575589D8);
    swift_bridgeObjectRetain();
    v7 = 0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      ++v7;
      swift_retain_n();
      v12 = (void *)sub_2461E6C34();
      objc_msgSend(v12, sel_getRed_green_blue_alpha_, v22, &v21, &v20, &v19);

      swift_release();
      v11 = v11 + v22[0];
      v10 = v10 + v21;
      v9 = v9 + v20;
      v8 = v8 + v19;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3C28], v2);
    return MEMORY[0x249553804](v5, v11 / (double)v6, v10 / (double)v6, v9 / (double)v6, v8 / (double)v6);
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v14 = sub_2461E6310();
    __swift_project_value_buffer(v14, (uint64_t)qword_257559B40);
    v15 = sub_2461E62F8();
    v16 = sub_2461E6BEC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2461B8000, v15, v16, "ContactsFlowImageColorGenerator no colors provided from which to calculate mean, returning default", v17, 2u);
      MEMORY[0x249554254](v17, -1, -1);
    }

    return sub_2461E67A8();
  }
}

id sub_2461C47D0(void *a1)
{
  void *v1;
  void *v3;
  id v4;

  type metadata accessor for VNImageOption(0);
  sub_2461C4878();
  v3 = (void *)sub_2461E6A24();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithCIImage_options_, a1, v3);

  return v4;
}

uint64_t sub_2461C4858(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactsFlowImageColorGenerator()
{
  return &type metadata for ContactsFlowImageColorGenerator;
}

unint64_t sub_2461C4878()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575587D8;
  if (!qword_2575587D8)
  {
    type metadata accessor for VNImageOption(255);
    result = MEMORY[0x2495541D0](&unk_2461E7680, v1);
    atomic_store(result, (unint64_t *)&qword_2575587D8);
  }
  return result;
}

uint64_t sub_2461C48B8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_results);
  if (!v1)
    return 0;
  v2 = v1;
  sub_2461C4924(0, &qword_2575589F8);
  v3 = sub_2461E6B2C();

  return v3;
}

uint64_t sub_2461C4924(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v2, v1);
}

void OUTLINED_FUNCTION_4_1()
{
  JUMPOUT(0x249553804);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2461C1A68(v1, v0);
}

void GetContactAttributeMultiResultView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_1_1();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558A08);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461C5424(v2, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  sub_2461C548C((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558A10);
  sub_2461C6BB0((uint64_t)&unk_257558A18);
  sub_2461E6910();
  v13 = v2 + *(int *)(v4 + 20);
  v14 = *(_QWORD *)(v13 + *(int *)(OUTLINED_FUNCTION_3_3() + 28));
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a1, v10, v7);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257558A20) + 36)) = v14;
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  swift_retain();
  v15(v10, v7);
  OUTLINED_FUNCTION_0_3();
}

uint64_t type metadata accessor for GetContactAttributeMultiResultView()
{
  uint64_t result;

  result = qword_257558A80;
  if (!qword_257558A80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461C4B50@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ContactAttributeMultiResultView;
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
  char *v17;
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
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t OpaqueTypeConformance2;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t);
  void (*v82)(char *, uint64_t);
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117[5];
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;

  v103 = a2;
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558AD8);
  v102 = *(_QWORD *)(v105 - 8);
  v3 = MEMORY[0x24BDAC7A8](v105);
  v104 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v101 = (char *)&v84 - v5;
  ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  v98 = *(_QWORD *)(ContactAttributeMultiResultView - 8);
  MEMORY[0x24BDAC7A8](ContactAttributeMultiResultView);
  v99 = v7;
  v100 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2461E5FE0();
  v96 = *(_QWORD *)(v8 - 8);
  v97 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v95 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2461E6004();
  MEMORY[0x24BDAC7A8](v10);
  v86 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v90 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v17 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2461E694C();
  v87 = *(_QWORD *)(v18 - 8);
  v88 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v84 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558AE0);
  MEMORY[0x24BDAC7A8](v92);
  v89 = (char *)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558AE8);
  v93 = *(_QWORD *)(v21 - 8);
  v94 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v91 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558AF0);
  v110 = *(_QWORD *)(v108 - 8);
  v23 = MEMORY[0x24BDAC7A8](v108);
  v107 = (char *)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v109 = (char *)&v84 - v25;
  v26 = *(int *)(ContactAttributeMultiResultView + 20);
  v106 = a1;
  v27 = a1 + v26 + *(int *)(type metadata accessor for GetContactAttributeViewModel() + 20);
  sub_2461E61FC();
  v28 = (void *)sub_2461E60DC();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v29 = sub_2461E6C70();
  v31 = v30;

  v111 = v29;
  v112 = v31;
  sub_2461BFC74();
  v32 = sub_2461E66AC();
  v34 = v33;
  v111 = v32;
  v112 = v33;
  v36 = v35 & 1;
  LOBYTE(v113) = v35 & 1;
  v114 = v37;
  v38 = MEMORY[0x24BDF1FA8];
  v39 = MEMORY[0x24BDF1F80];
  sub_2461E6760();
  sub_2461BFCB0(v32, v34, v36);
  swift_bridgeObjectRelease();
  v111 = v38;
  v112 = v39;
  v40 = v84;
  swift_getOpaqueTypeConformance2();
  v41 = v85;
  v42 = sub_2461E66B8();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v17, v41);
  v115 = MEMORY[0x24BEAD938];
  v114 = MEMORY[0x24BDF4780];
  v111 = v42;
  v138 = 0;
  v136 = 0u;
  v137 = 0u;
  v135 = 0;
  v133 = 0u;
  v134 = 0u;
  v132 = 0;
  v130 = 0u;
  v131 = 0u;
  v129 = 0;
  v127 = 0u;
  v128 = 0u;
  v126 = 0;
  v124 = 0u;
  v125 = 0u;
  v123 = 0;
  v121 = 0u;
  v122 = 0u;
  v120 = 0;
  v118 = 0u;
  v119 = 0u;
  v90 = v27;
  sub_2461E61E4();
  sub_2461E5FF8();
  swift_bridgeObjectRelease();
  v117[3] = sub_2461E68EC();
  v117[4] = MEMORY[0x24BEADA30];
  __swift_allocate_boxed_opaque_existential_1(v117);
  sub_2461E68F8();
  sub_2461E6940();
  if (qword_2575585C0 != -1)
    swift_once();
  v43 = qword_25755ABF0;
  v44 = sub_2461E6604();
  v46 = v87;
  v45 = v88;
  v47 = (uint64_t)v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v89, v40, v88);
  v48 = v92;
  v49 = v47 + *(int *)(v92 + 36);
  *(_BYTE *)v49 = v44;
  *(_QWORD *)(v49 + 8) = v43;
  *(_QWORD *)(v49 + 16) = 0;
  *(_QWORD *)(v49 + 24) = v43;
  *(_QWORD *)(v49 + 32) = 0;
  *(_BYTE *)(v49 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v40, v45);
  v51 = v95;
  v50 = v96;
  v52 = v97;
  (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v95, *MEMORY[0x24BEAB4E8], v97);
  v53 = sub_2461C694C();
  v54 = v91;
  sub_2461E66D0();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  sub_2461C69D0(v47);
  v55 = v100;
  sub_2461C5424(v106, v100);
  v56 = (*(unsigned __int8 *)(v98 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
  v57 = swift_allocObject();
  sub_2461C548C(v55, v57 + v56);
  v111 = v48;
  v112 = v53;
  swift_getOpaqueTypeConformance2();
  v58 = v107;
  v59 = v94;
  sub_2461E6748();
  swift_release();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v54, v59);
  v60 = (*(uint64_t (**)(char *, char *, uint64_t))(v110 + 32))(v109, v58, v108);
  *(_QWORD *)&v136 = MEMORY[0x2495531F8](v60);
  sub_2461C5424(v106, v55);
  v61 = swift_allocObject();
  sub_2461C548C(v55, v61 + v56);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558B08);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558B10);
  sub_2461C6BB0((uint64_t)&unk_257558B18);
  v62 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B20);
  v63 = sub_2461E69C4();
  v64 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B28);
  v65 = sub_2461C6C1C((uint64_t)&unk_257558B30);
  v66 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B38);
  v67 = sub_2461C6B2C();
  v68 = sub_2461C6BE0();
  v111 = v63;
  v112 = v66;
  v113 = MEMORY[0x24BEE0D00];
  v114 = v65;
  v115 = v67;
  v116 = v68;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v111 = v63;
  v112 = v64;
  v113 = v65;
  v114 = OpaqueTypeConformance2;
  v70 = swift_getOpaqueTypeConformance2();
  v111 = v62;
  v112 = v70;
  swift_getOpaqueTypeConformance2();
  sub_2461C6C1C((uint64_t)&unk_257558B60);
  v71 = v101;
  sub_2461E6880();
  v72 = *(void (**)(char *, char *, uint64_t))(v110 + 16);
  v73 = v107;
  v74 = v108;
  v72(v107, v109, v108);
  v75 = v102;
  v76 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
  v78 = v104;
  v77 = v105;
  v76(v104, v71, v105);
  v79 = v103;
  v72(v103, v73, v74);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558B68);
  v76(&v79[*(int *)(v80 + 48)], v78, v77);
  v81 = *(void (**)(char *, uint64_t))(v75 + 8);
  v81(v71, v77);
  v82 = *(void (**)(char *, uint64_t))(v110 + 8);
  v82(v109, v74);
  v81(v78, v77);
  return ((uint64_t (*)(char *, uint64_t))v82)(v73, v74);
}

uint64_t sub_2461C5424(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeMultiResultView;

  ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactAttributeMultiResultView - 8) + 16))(a2, a1, ContactAttributeMultiResultView);
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

uint64_t sub_2461C548C(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeMultiResultView;

  ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactAttributeMultiResultView - 8) + 32))(a2, a1, ContactAttributeMultiResultView);
  return a2;
}

uint64_t sub_2461C54D0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;

  v0 = OUTLINED_FUNCTION_1_1();
  v1 = OUTLINED_FUNCTION_4_2(v0);
  return sub_2461C4B50(v1, v2);
}

uint64_t sub_2461C54F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461C5504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_2461E6250();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeMultiResultView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_2461E6178();
  v4 = sub_2461E622C();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2461CA7E0(v4, v6);
  return sub_2461C19BC(v4, v6);
}

uint64_t sub_2461C55D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t OpaqueTypeConformance2;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v18[1] = a2;
  v3 = sub_2461E5FE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558B20);
  v18[0] = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461C57A4(a1, (uint64_t)v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEAB4F0], v3);
  v10 = sub_2461E69C4();
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B28);
  v12 = sub_2461C6C1C((uint64_t)&unk_257558B30);
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B38);
  v14 = sub_2461C6B2C();
  v15 = sub_2461C6BE0();
  v19 = v10;
  v20 = v13;
  v21 = MEMORY[0x24BEE0D00];
  v22 = v12;
  v23 = v14;
  v24 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_2461E66D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v18[0] + 8))(v9, v7);
}

void sub_2461C57A4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v43;
  uint64_t v44;

  v37 = sub_2461E69C4();
  v40 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_10_0();
  v35 = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558B20);
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_0();
  v36 = v4;
  sub_2461E619C();
  sub_2461BFC74();
  v5 = sub_2461E66AC();
  v7 = v6;
  v9 = v8 & 1;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_3();
  swift_retain();
  v10 = sub_2461E6694();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  sub_2461BFCB0(v5, v7, v9);
  swift_release();
  swift_bridgeObjectRelease();
  v43 = OUTLINED_FUNCTION_11_0();
  *(_QWORD *)(v43 + 16) = v10;
  *(_QWORD *)(v43 + 24) = v12;
  *(_BYTE *)(v43 + 32) = v14 & 1;
  *(_QWORD *)(v43 + 40) = v16;
  v17 = sub_2461CA9A0();
  v19 = v18;
  v20 = (v18 >> 40) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558B70);
  sub_2461C6C80();
  sub_2461E66B8();
  sub_2461C6EDC(v17, v19, v20);
  v21 = sub_2461CB4C8(a1);
  v23 = v22;
  LODWORD(v20) = BYTE3(v22) & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558BE0);
  sub_2461C6DE8((uint64_t)&unk_257558BE8);
  sub_2461E66B8();
  sub_2461C6FA4(v21, v23, v20);
  sub_2461E6190();
  v24 = sub_2461E66AC();
  v26 = v25;
  LOBYTE(v20) = v27 & 1;
  sub_2461E67CC();
  v28 = sub_2461E6694();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  sub_2461BFCB0(v24, v26, v20);
  swift_release();
  swift_bridgeObjectRelease();
  v44 = OUTLINED_FUNCTION_11_0();
  *(_QWORD *)(v44 + 16) = v28;
  *(_QWORD *)(v44 + 24) = v30;
  *(_BYTE *)(v44 + 32) = v32 & 1;
  *(_QWORD *)(v44 + 40) = v34;
  sub_2461E69B8();
  sub_2461C04A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558B28);
  sub_2461C6C1C((uint64_t)&unk_257558B30);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B38);
  sub_2461C6B2C();
  sub_2461C6BE0();
  swift_getOpaqueTypeConformance2();
  sub_2461E66F4();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v35, v37);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(a2, v36, v39);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_2461C5C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v3 = sub_2461E61C0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v3);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v4 + 32))(v7 + v6, &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v3);
  v10 = a2;
  sub_2461E69C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558B38);
  sub_2461C6C1C((uint64_t)&unk_257558B30);
  sub_2461C6B2C();
  sub_2461C6BE0();
  sub_2461E676C();
  return swift_release();
}

uint64_t sub_2461C5DD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2461C03F4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2461C5DF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v17 = sub_2461E6544();
  if (qword_2575585C0 != -1)
    swift_once();
  v16 = qword_25755ABF0;
  sub_2461C5F34((uint64_t)v18);
  v2 = v18[0];
  v3 = v18[1];
  v4 = v19;
  v5 = v20;
  v6 = v21;
  v7 = v22;
  v8 = v23;
  v9 = v24;
  if (qword_2575585C8 != -1)
    swift_once();
  v10 = sub_2461E6604();
  result = sub_2461E637C();
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v16;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = v7;
  *(_BYTE *)(a1 + 72) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 88) = v10;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  *(_QWORD *)(a1 + 112) = v14;
  *(_QWORD *)(a1 + 120) = v15;
  *(_BYTE *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_2461C5F34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  sub_2461E619C();
  sub_2461BFC74();
  v2 = sub_2461E66AC();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  sub_2461E6190();
  v9 = sub_2461E66AC();
  v11 = v10;
  v13 = v12 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v12 & 1;
  *(_QWORD *)(a1 + 56) = v14;
  sub_2461C7050(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_2461C7050(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_2461BFCB0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_2461BFCB0(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeMultiResultView(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  int *ContactAttributeViewModel;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = &a1[v6];
    v8 = (uint64_t)a2 + v6;
    v9 = *(_OWORD *)((char *)a2 + v6 + 24);
    *(_OWORD *)&a1[v6 + 24] = v9;
    v10 = v9;
    v11 = **(void (***)(char *, uint64_t, uint64_t))(v9 - 8);
    v12 = v5;
    v11(v7, v8, v10);
    ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    v14 = ContactAttributeViewModel[5];
    v15 = &v7[v14];
    v16 = v8 + v14;
    v17 = sub_2461E6214();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = ContactAttributeViewModel[6];
    v19 = &v7[v18];
    v20 = v8 + v18;
    v21 = sub_2461E6394();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    *(_QWORD *)&v7[ContactAttributeViewModel[7]] = *(_QWORD *)(v8 + ContactAttributeViewModel[7]);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for GetContactAttributeMultiResultView(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t ContactAttributeViewModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_1(v4);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v6 = v4 + *(int *)(ContactAttributeViewModel + 20);
  v7 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = v4 + *(int *)(ContactAttributeViewModel + 24);
  v9 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_release();
}

_QWORD *initializeWithCopy for GetContactAttributeMultiResultView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;
  int *ContactAttributeViewModel;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = a2 + v6;
  v9 = *(_OWORD *)(a2 + v6 + 24);
  *(_OWORD *)((char *)a1 + v6 + 24) = v9;
  v10 = v9;
  v11 = **(void (***)(char *, uint64_t, uint64_t))(v9 - 8);
  v12 = v4;
  v11(v7, v8, v10);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v14 = ContactAttributeViewModel[5];
  v15 = &v7[v14];
  v16 = v8 + v14;
  v17 = sub_2461E6214();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = ContactAttributeViewModel[6];
  v19 = &v7[v18];
  v20 = v8 + v18;
  v21 = sub_2461E6394();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  *(_QWORD *)&v7[ContactAttributeViewModel[7]] = *(_QWORD *)(v8 + ContactAttributeViewModel[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeMultiResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  int *ContactAttributeViewModel;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (uint64_t *)(a2 + v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9), v11);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v13 = ContactAttributeViewModel[5];
  v14 = v10 + v13;
  v15 = (char *)v11 + v13;
  v16 = sub_2461E6214();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = ContactAttributeViewModel[6];
  v18 = v10 + v17;
  v19 = (char *)v11 + v17;
  v20 = sub_2461E6394();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  *(_QWORD *)(v10 + ContactAttributeViewModel[7]) = *(uint64_t *)((char *)v11 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
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

_OWORD *initializeWithTake for GetContactAttributeMultiResultView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  __int128 v7;
  int *ContactAttributeViewModel;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *((_QWORD *)v5 + 4) = *(_QWORD *)((char *)a2 + v4 + 32);
  v7 = *(_OWORD *)((char *)a2 + v4 + 16);
  *(_OWORD *)v5 = *(_OWORD *)((char *)a2 + v4);
  *((_OWORD *)v5 + 1) = v7;
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v9 = ContactAttributeViewModel[5];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = sub_2461E6214();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = ContactAttributeViewModel[6];
  v14 = &v5[v13];
  v15 = &v6[v13];
  v16 = sub_2461E6394();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  *(_QWORD *)&v5[ContactAttributeViewModel[7]] = *(_QWORD *)&v6[ContactAttributeViewModel[7]];
  return a1;
}

uint64_t assignWithTake for GetContactAttributeMultiResultView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  int *ContactAttributeViewModel;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v10 = *((_OWORD *)v9 + 1);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v12 = ContactAttributeViewModel[5];
  v13 = v8 + v12;
  v14 = &v9[v12];
  v15 = sub_2461E6214();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = ContactAttributeViewModel[6];
  v17 = v8 + v16;
  v18 = &v9[v16];
  v19 = sub_2461E6394();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(_QWORD *)&v9[ContactAttributeViewModel[7]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeMultiResultView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461C670C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_3();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeMultiResultView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_2461C6794(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_3();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2461C67FC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for GetContactAttributeViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2461C6874()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257558AB8;
  if (!qword_257558AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558A20);
    v2[0] = sub_2461C6BB0((uint64_t)&unk_257558AC0);
    v2[1] = sub_2461C6BB0((uint64_t)&qword_257558AC8);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257558AB8);
  }
  return result;
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

unint64_t sub_2461C694C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257558AF8;
  if (!qword_257558AF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558AE0);
    v2[0] = sub_2461C6C1C((uint64_t)&unk_257558B00);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257558AF8);
  }
  return result;
}

uint64_t sub_2461C69D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558AE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461C6A14()
{
  OUTLINED_FUNCTION_1_1();
  return sub_2461C5504();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_1();
  v3 = v0 + v2;

  __swift_destroy_boxed_opaque_existential_1(v3 + *(int *)(v1 + 20));
  OUTLINED_FUNCTION_3_3();
  v4 = sub_2461E6214();
  OUTLINED_FUNCTION_2_3(v4);
  v5 = sub_2461E6394();
  OUTLINED_FUNCTION_2_3(v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2461C6AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_1_1();
  return sub_2461C55D8(a1, a2);
}

unint64_t sub_2461C6B2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257558B40;
  if (!qword_257558B40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B38);
    v2[0] = sub_2461C6BB0((uint64_t)&unk_257558B48);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257558B40);
  }
  return result;
}

uint64_t sub_2461C6BB0(uint64_t a1)
{
  uint64_t result;
  uint64_t *v2;

  result = OUTLINED_FUNCTION_8_0(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_7_2(0, v2);
    OUTLINED_FUNCTION_11();
  }
  return result;
}

unint64_t sub_2461C6BE0()
{
  unint64_t result;

  result = qword_257558B58;
  if (!qword_257558B58)
  {
    result = MEMORY[0x2495541D0](MEMORY[0x24BDC5108], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257558B58);
  }
  return result;
}

uint64_t sub_2461C6C1C(uint64_t a1)
{
  uint64_t result;
  void (*v2)(uint64_t);

  result = OUTLINED_FUNCTION_8_0(a1);
  if (!result)
  {
    v2(255);
    OUTLINED_FUNCTION_11();
  }
  return result;
}

uint64_t sub_2461C6C50()
{
  uint64_t v0;

  sub_2461BFCB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_2461C6C80()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257558B78;
  if (!qword_257558B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B70);
    sub_2461C6D0C((uint64_t)&unk_257558B80);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257558B78);
  }
  return result;
}

void sub_2461C6D0C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = OUTLINED_FUNCTION_7_2(0, v2);
    v8[0] = v6();
    v8[1] = v5();
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v7, v8), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_2461C6D68()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257558B90;
  if (!qword_257558B90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558B98);
    sub_2461C6DCC();
    v3[0] = v2;
    v3[1] = v2;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257558B90);
  }
  return result;
}

void sub_2461C6DCC()
{
  sub_2461C6DE8((uint64_t)&unk_257558BA0);
}

void sub_2461C6DE8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t v5;
  _QWORD v6[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v4 = v3;
    v5 = OUTLINED_FUNCTION_7_2(0, v2);
    v6[0] = v4();
    v6[1] = MEMORY[0x24BDF5138];
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v5, v6), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_2461C6E40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257558BB0;
  if (!qword_257558BB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558BB8);
    v2[0] = MEMORY[0x24BDF4760];
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257558BB0);
  }
  return result;
}

void sub_2461C6E9C()
{
  sub_2461C6D0C((uint64_t)&unk_257558BC0);
}

void sub_2461C6EC0()
{
  sub_2461C6DE8((uint64_t)&unk_257558BD0);
}

uint64_t sub_2461C6EDC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_2461C6EEC(result, a2, BYTE4(a2) & 1);
  return result;
}

uint64_t sub_2461C6EEC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_2461C6F14(a1, a2, BYTE3(a2) & 1);
  else
    return sub_2461C6F00(a1, a2);
}

uint64_t sub_2461C6F00(uint64_t a1, uint64_t a2)
{
  return sub_2461C6F08(a1, a2, BYTE1(a2) & 1);
}

uint64_t sub_2461C6F08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_2461C6F14(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_2461C6F28(a1, a2, BYTE2(a2) & 1);
  else
    return sub_2461C6F08(a1, a2, BYTE1(a2) & 1);
}

uint64_t sub_2461C6F28(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_2461C6F08(result, a2, BYTE1(a2) & 1);
  return result;
}

unint64_t sub_2461C6F38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257558BF0;
  if (!qword_257558BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558BF8);
    sub_2461C6DCC();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257558BF0);
  }
  return result;
}

uint64_t sub_2461C6FA4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_2461C6FB4(result, a2, BYTE2(a2) & 1);
  return result;
}

uint64_t sub_2461C6FB4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_2461C6F08(result, a2, BYTE1(a2) & 1);
  return result;
}

uint64_t sub_2461C6FC4(uint64_t a1)
{
  uint64_t v1;

  return sub_2461C5C74(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2461C6FCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_2461E61C0();
  OUTLINED_FUNCTION_9_1();
  (*(void (**)(uint64_t))(v2 + 8))(v0 + v1);
  return swift_deallocObject();
}

uint64_t sub_2461C7020()
{
  uint64_t v0;
  uint64_t *v1;

  v0 = sub_2461E61C0();
  OUTLINED_FUNCTION_4_2(v0);
  return sub_2461C5DD0(v1);
}

uint64_t sub_2461C7048@<X0>(uint64_t a1@<X8>)
{
  return sub_2461C5DF8(a1);
}

uint64_t sub_2461C7050(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return type metadata accessor for GetContactAttributeMultiResultView();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return type metadata accessor for GetContactAttributeViewModel();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_allocObject();
}

uint64_t sub_2461C7110()
{
  uint64_t v0;

  v0 = sub_2461E664C();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0();
  if (qword_2575585E0 != -1)
    swift_once();
  OUTLINED_FUNCTION_7_3();
  sub_2461C1AAC();
  OUTLINED_FUNCTION_3_4();
  type metadata accessor for SiriContactsGCAButtonStyle();
  if (qword_2575585D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_7_3();
  return OUTLINED_FUNCTION_3_4();
}

uint64_t sub_2461C722C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;

  v63 = sub_2461E6520();
  v64 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_10_0();
  v62 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  v52 = sub_2461E65B0();
  v6 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CB0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_10_0();
  v53 = v15;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CB8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0();
  v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CC0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0();
  v23 = v22 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CC8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0();
  v27 = v26 - v25;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CD0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_10_0();
  v54 = v29;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CD8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_10_0();
  v55 = v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CE0);
  v60 = *(_QWORD *)(v32 - 8);
  v61 = v32;
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_10_0();
  v59 = v33;
  sub_2461E65BC();
  type metadata accessor for SiriContactsGCAButtonStyle();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  sub_2461E63D0();
  v34 = sub_2461E661C();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v34);
  v35 = sub_2461E6634();
  sub_2461C7F84(v5, &qword_257558CA0);
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v13, v9, v52);
  OUTLINED_FUNCTION_9_2();
  v38 = (uint64_t *)(v13 + v37);
  *v38 = KeyPath;
  v38[1] = v35;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v52);
  sub_2461E63D0();
  sub_2461E63D0();
  sub_2461E68A4();
  sub_2461E63E8();
  OUTLINED_FUNCTION_6_3(v13, v53);
  OUTLINED_FUNCTION_9_2();
  v40 = (_OWORD *)(v53 + v39);
  *v40 = v66;
  v40[1] = v67;
  v40[2] = v68;
  OUTLINED_FUNCTION_4_3(v13);
  LODWORD(v35) = sub_2461E6568();
  LOBYTE(v13) = sub_2461E6604();
  OUTLINED_FUNCTION_6_3(v53, v19);
  v41 = v19 + *(int *)(v56 + 36);
  *(_DWORD *)v41 = v35;
  *(_BYTE *)(v41 + 4) = v13;
  OUTLINED_FUNCTION_4_3(v53);
  OUTLINED_FUNCTION_6_3(v19, v23);
  OUTLINED_FUNCTION_9_2();
  *(_WORD *)(v23 + v42) = 256;
  OUTLINED_FUNCTION_4_3(v19);
  OUTLINED_FUNCTION_6_3(v23, v27);
  OUTLINED_FUNCTION_9_2();
  *(_BYTE *)(v27 + v43) = 0;
  OUTLINED_FUNCTION_4_3(v23);
  if ((sub_2461E65C8() & 1) != 0)
    v44 = 0.5;
  else
    v44 = 0.8;
  sub_2461C7C70(v27, v54, &qword_257558CC8);
  *(double *)(v54 + *(int *)(v57 + 36)) = v44;
  sub_2461C7F84(v27, &qword_257558CC8);
  if ((sub_2461E65C8() & 1) != 0)
    v45 = 0.98;
  else
    v45 = 1.0;
  sub_2461E68B0();
  v47 = v46;
  v49 = v48;
  sub_2461C7C70(v54, v55, &qword_257558CD0);
  v50 = v55 + *(int *)(v58 + 36);
  *(double *)v50 = v45;
  *(double *)(v50 + 8) = v45;
  *(_QWORD *)(v50 + 16) = v47;
  *(_QWORD *)(v50 + 24) = v49;
  sub_2461C7F84(v54, &qword_257558CD0);
  sub_2461E6514();
  sub_2461C7CD4(&qword_257558CE8, &qword_257558CD8, sub_2461C7CB0, MEMORY[0x24BDEBF50]);
  sub_2461BFC14(&qword_257558D58, (void (*)(uint64_t))MEMORY[0x24BDEE988]);
  sub_2461E6724();
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v62, v63);
  sub_2461C7F84(v55, &qword_257558CD8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(a1, v59, v61);
}

uint64_t type metadata accessor for SiriContactsGCAButtonStyle()
{
  uint64_t result;

  result = qword_257558C60;
  if (!qword_257558C60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_2461C7830(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_2461C78D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t sub_2461C793C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_2461C79B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_2461C7A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_2461C7A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_2461C7B0C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461C7B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_2461C7B50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461C7B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_2461C7B98()
{
  unint64_t v0;

  sub_2461C7C00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2461C7C00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257558C70)
  {
    sub_2461C1AAC();
    v0 = sub_2461E63DC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257558C70);
  }
}

uint64_t sub_2461C7C58()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2461C7C70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461C7CB0()
{
  return sub_2461C7CD4(&qword_257558CF0, &qword_257558CD0, (uint64_t (*)(void))sub_2461C7D3C, MEMORY[0x24BDECC38]);
}

uint64_t sub_2461C7CD4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2461C7D3C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_257558CF8;
  if (!qword_257558CF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558CC8);
    v2 = sub_2461C7DC0();
    sub_2461BFDA4(&qword_257558D48, &qword_257558D50);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558CF8);
  }
  return result;
}

unint64_t sub_2461C7DC0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_257558D00;
  if (!qword_257558D00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558CC0);
    v2 = sub_2461C7E44();
    sub_2461BFDA4(&qword_257558D38, &qword_257558D40);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558D00);
  }
  return result;
}

unint64_t sub_2461C7E44()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_257558D08;
  if (!qword_257558D08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558CB8);
    v2 = sub_2461C7CD4(&qword_257558D10, &qword_257558CB0, (uint64_t (*)(void))sub_2461C7EE8, MEMORY[0x24BDEBEE0]);
    sub_2461BFDA4(&qword_257558D28, &qword_257558D30);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558D08);
  }
  return result;
}

unint64_t sub_2461C7EE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_257558D18;
  if (!qword_257558D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558CA8);
    sub_2461BFC14(&qword_257558D20, (void (*)(uint64_t))MEMORY[0x24BDF0440]);
    v3 = v2;
    sub_2461BFDA4(&qword_257558770, &qword_257558778);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_257558D18);
  }
  return result;
}

void sub_2461C7F84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461C7FBC()
{
  void (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558CD8);
  sub_2461E6520();
  v0 = (void (*)(uint64_t))MEMORY[0x24BDEE988];
  sub_2461C7CD4(&qword_257558CE8, &qword_257558CD8, sub_2461C7CB0, MEMORY[0x24BDEBF50]);
  sub_2461BFC14(&qword_257558D58, v0);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_2461E63C4();
}

void OUTLINED_FUNCTION_4_3(uint64_t a1)
{
  uint64_t *v1;

  sub_2461C7F84(a1, v1);
}

void OUTLINED_FUNCTION_6_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2461C7C70(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

ValueMetadata *type metadata accessor for SiriContactsEqualWidthHStack()
{
  return &type metadata for SiriContactsEqualWidthHStack;
}

unint64_t sub_2461C80B8()
{
  unint64_t result;

  result = qword_257558D60;
  if (!qword_257558D60)
  {
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_257558D60);
  }
  return result;
}

BOOL sub_2461C80F4()
{
  uint64_t v1;
  uint64_t v2;

  sub_2461E6424();
  sub_2461C8CB4();
  sub_2461E6B8C();
  sub_2461E6BB0();
  return v2 == v1;
}

uint64_t sub_2461C815C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;

  result = sub_2461C80F4();
  if ((result & 1) == 0)
  {
    sub_2461C827C(a5);
    v10 = v9;
    v11 = sub_2461C874C();
    MEMORY[0x24BDAC7A8](v11);
    OUTLINED_FUNCTION_4_4();
    sub_2461C87B8((void (*)(uint64_t *__return_ptr, uint64_t *))sub_2461C8CF4, v12, v13, v14);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v17 = (double *)(v15 + 32);
      v18 = 0.0;
      do
      {
        v19 = *v17++;
        v18 = v18 + v19;
        --v16;
      }
      while (v16);
    }
    swift_bridgeObjectRelease();
    sub_2461E6424();
    sub_2461C8CB4();
    OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_1_2();
    result = OUTLINED_FUNCTION_0_4();
    if ((a2 & 1) != 0 || v10 >= *(double *)&a1)
    {
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_1_2();
      return OUTLINED_FUNCTION_0_4();
    }
  }
  return result;
}

uint64_t sub_2461C827C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  float64x2_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(char *, _QWORD);
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float64x2_t *v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  char v26;
  char v27[32];
  uint64_t v28;

  v2 = sub_2461E6418();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461E6424();
  sub_2461C8CB4();
  v6 = sub_2461E6B98();
  v8 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v9 = v6;
    v28 = MEMORY[0x24BEE4AF8];
    sub_2461E19E0(0, v6 & ~(v6 >> 63), 0);
    result = sub_2461E6B8C();
    if (v9 < 0)
    {
      __break(1u);
      return result;
    }
    *(_QWORD *)&v25.f64[0] = a1;
    do
    {
      v11 = (void (*)(char *, _QWORD))sub_2461E6BC8();
      (*(void (**)(char *))(v3 + 16))(v5);
      v11(v27, 0);
      sub_2461E6448();
      v27[0] = v12 & 1;
      v26 = v13 & 1;
      sub_2461E63F4();
      v15 = v14;
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v8 = v28;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2461E19E0(0, *(_QWORD *)(v8 + 16) + 1, 1);
        v8 = v28;
      }
      v19 = *(_QWORD *)(v8 + 16);
      v18 = *(_QWORD *)(v8 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2461E19E0(v18 > 1, v19 + 1, 1);
        v8 = v28;
      }
      *(_QWORD *)(v8 + 16) = v19 + 1;
      v20 = v8 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      sub_2461E6BBC();
      --v9;
    }
    while (v9);
  }
  v21 = *(_QWORD *)(v8 + 16);
  if (v21)
  {
    v22 = (float64x2_t *)(v8 + 32);
    v23 = 0uLL;
    do
    {
      v24 = *v22++;
      v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(v24, v23), (int8x16_t)v24, (int8x16_t)v23);
      --v21;
    }
    while (v21);
    v25 = v23;
  }
  else
  {
    v7.f64[0] = 0.0;
    v25 = v7;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461C84B4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double MinX;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  CGRect v37;
  CGRect v38;

  v8 = sub_2461E6418();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_2461C80F4();
  if ((result & 1) == 0)
  {
    sub_2461C827C(a5);
    v14 = v13;
    v15 = sub_2461C874C();
    MEMORY[0x24BDAC7A8](v15);
    OUTLINED_FUNCTION_4_4();
    sub_2461C87B8((void (*)(uint64_t *__return_ptr, uint64_t *))sub_2461C8C98, v16, v17, v18);
    v20 = v19;
    if ((a2 & 1) == 0 && v14 < *(double *)&a1)
    {
      v21 = *(_QWORD *)(v19 + 16);
      if (v21)
      {
        v22 = (double *)(v19 + 32);
        v23 = 0.0;
        do
        {
          v24 = *v22++;
          v23 = v23 + v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        v23 = 0.0;
      }
      v25 = *(double *)&a1 - v23;
      sub_2461E6424();
      sub_2461C8CB4();
      sub_2461E6B8C();
      sub_2461E6BB0();
      v14 = v25 / (double)sub_2461E6BA4();
    }
    v37.origin.x = OUTLINED_FUNCTION_3_5();
    MinX = CGRectGetMinX(v37);
    result = sub_2461C874C();
    if (result == v27)
      return swift_bridgeObjectRelease();
    v28 = result;
    v29 = v27;
    if (v27 < result)
    {
      __break(1u);
    }
    else if (result < v27)
    {
      if ((result & 0x8000000000000000) == 0)
      {
        v30 = *(_QWORD *)(v20 + 16);
        if (result < v30 && v27 - 1 < v30)
        {
          v34 = v8;
          v32 = MinX + v14 * 0.5;
          do
          {
            sub_2461E6430();
            v38.origin.x = OUTLINED_FUNCTION_3_5();
            CGRectGetMidY(v38);
            sub_2461E68B0();
            v36 = 0;
            v35 = 0;
            sub_2461E6400();
            (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v34);
            v32 = v32 + v14 + *(double *)(v20 + 8 * v28++ + 32);
          }
          while (v29 != v28);
          return swift_bridgeObjectRelease();
        }
LABEL_25:
        __break(1u);
        return result;
      }
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    __break(1u);
    goto LABEL_24;
  }
  return result;
}

uint64_t sub_2461C874C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  sub_2461E6424();
  sub_2461C8CB4();
  sub_2461E6B8C();
  sub_2461E6BB0();
  result = v2;
  if (v1 < v2)
    __break(1u);
  return result;
}

void sub_2461C87B8(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
    goto LABEL_18;
  v6 = v4;
  if (v5)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_2461E19FC(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
LABEL_19:
      __break(1u);
      return;
    }
    v10 = v17;
    v11 = a3;
    while (a4 != v11)
    {
      v15 = v11;
      a1(&v16, &v15);
      if (v6)
      {
        swift_release();
        return;
      }
      v6 = 0;
      v12 = v16;
      v17 = v10;
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_2461E19FC(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      *(_QWORD *)(v10 + 8 * v14 + 32) = v12;
      if (a4 < a3)
        goto LABEL_16;
      if (v11 >= a4)
        goto LABEL_17;
      if (a4 == ++v11)
        return;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_2461C8900@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  v27 = a2;
  v3 = sub_2461E63B8();
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v23 = (char *)&v23 - v6;
  v7 = sub_2461E6418();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v23 - v12;
  v14 = *a1;
  sub_2461E6424();
  sub_2461C8CB4();
  sub_2461E6B8C();
  sub_2461E6BB0();
  result = sub_2461E6BA4();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v16 = 0;
    if (v14 < result - 1)
    {
      sub_2461E6430();
      v17 = v23;
      sub_2461E640C();
      v18 = *(void (**)(char *, uint64_t))(v8 + 8);
      v18(v13, v7);
      sub_2461E6430();
      v19 = v24;
      sub_2461E640C();
      v18(v11, v7);
      sub_2461E63AC();
      v16 = v20;
      v21 = v26;
      v22 = *(void (**)(char *, uint64_t))(v25 + 8);
      v22(v19, v26);
      result = ((uint64_t (*)(char *, uint64_t))v22)(v17, v21);
    }
    *v27 = v16;
  }
  return result;
}

uint64_t sub_2461C8B14(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2461C815C(a1, a2 & 1, a3, a4, a5);
}

uint64_t sub_2461C8B24(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2461C84B4(a1, a2 & 1, a3, a4, a5);
}

uint64_t sub_2461C8B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2461C8B8C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_2461C8B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2461C8B8C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_2461C8B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_2461C8BCC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2461E6364();
  return sub_2461C8C28;
}

void sub_2461C8C28(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_2461C8C5C()
{
  unint64_t result;

  result = qword_257558D68;
  if (!qword_257558D68)
  {
    result = MEMORY[0x2495541D0](&unk_2461E7B50, &type metadata for SiriContactsEqualWidthHStack);
    atomic_store(result, (unint64_t *)&qword_257558D68);
  }
  return result;
}

uint64_t sub_2461C8C98@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2461C8900(a1, a2);
}

unint64_t sub_2461C8CB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257558D70;
  if (!qword_257558D70)
  {
    v1 = sub_2461E6424();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEC7A0], v1);
    atomic_store(result, (unint64_t *)&qword_257558D70);
  }
  return result;
}

uint64_t sub_2461C8CF4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2461C8C98(a1, a2);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_2461E6BA4();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2461E6BB0();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_2461E6B8C();
}

double OUTLINED_FUNCTION_3_5()
{
  double v0;

  return v0;
}

uint64_t sub_2461C8D68(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1)
{
  return sub_2461C8D84(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_2461C8D84(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t _s14SiriContactsUI41GetContactQuickActionPrimitiveButtonStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2461C8D68(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  return a1;
}

uint64_t assignWithCopy for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2461C8D68(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2461C8D84(v6, v7);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  return a1;
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2461C8D84(v6, v7);
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactQuickActionPrimitiveButtonStyle(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 11))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
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

uint64_t storeEnumTagSinglePayload for GetContactQuickActionPrimitiveButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 11) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for GetContactQuickActionPrimitiveButtonStyle()
{
  return &type metadata for GetContactQuickActionPrimitiveButtonStyle;
}

uint64_t sub_2461C8F40()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2461C8F50()
{
  double result;

  if (qword_2575585D0 != -1)
    swift_once();
  result = *(double *)&qword_25755AC00;
  qword_257558D78 = qword_25755AC00;
  return result;
}

void sub_2461C8F98(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
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
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  double v77;
  char v78;
  double v79;
  char v80;
  double v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  char v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(uint64_t);
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  double v114;
  char v115;
  double v116;
  char v117;
  double v118;
  char v119;
  uint64_t v120;
  double v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t KeyPath;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(uint64_t);
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t ContactQuickActionButtonLabelStyleIconOnly;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t ContactQuickActionButtonLabelStyle;
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
  int v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  uint64_t v186;

  v185 = a2;
  v177 = a1;
  v184 = a3;
  v176 = a2 & 1;
  ContactQuickActionButtonLabelStyle = type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v4);
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558D80);
  v155 = *(_QWORD *)(v157 - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v6);
  v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558D88);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558D90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v10);
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558D98);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v12);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DA0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v14);
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v16);
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DB0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_3_6((uint64_t)&v140 - v19);
  v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DB8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_10_0();
  v182 = v21;
  OUTLINED_FUNCTION_23();
  v22 = sub_2461E6394();
  v179 = *(_QWORD *)(v22 - 8);
  v180 = v22;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_3_6((uint64_t)&v140 - v25);
  v26 = sub_2461E652C();
  v170 = *(_QWORD *)(v26 - 8);
  v171 = v26;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_10_0();
  v169 = v28;
  OUTLINED_FUNCTION_23();
  v168 = sub_2461E6454();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_10_0();
  v174 = v30;
  OUTLINED_FUNCTION_23();
  v175 = sub_2461E6898();
  v173 = *(_QWORD *)(v175 - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_10_0();
  v172 = v32;
  OUTLINED_FUNCTION_23();
  v141 = sub_2461E664C();
  v33 = *(_QWORD *)(v141 - 8);
  MEMORY[0x24BDAC7A8](v141);
  OUTLINED_FUNCTION_0();
  v36 = v35 - v34;
  ContactQuickActionButtonLabelStyleIconOnly = type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_0();
  v40 = v39 - v38;
  v41 = sub_2461E65D4();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_0();
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DC0);
  v144 = *(_QWORD *)(v145 - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_0();
  v45 = v44 - v43;
  v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DC8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_0();
  v49 = v48 - v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558DD0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_0();
  v53 = v52 - v51;
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DD8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v55);
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DE0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v57);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558DE8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_3_6((uint64_t)&v140 - v60);
  sub_2461E65E0();
  if ((v185 & 0x100) != 0)
  {
    if (qword_2575585D8 != -1)
      swift_once();
    v186 = qword_25755AC08;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v36, *MEMORY[0x24BDF1878], v141);
    sub_2461C1AAC();
    sub_2461E63C4();
    sub_2461CA220((uint64_t)&unk_257558DF0);
    sub_2461CA220((uint64_t)&unk_257558E38);
    sub_2461E6724();
    sub_2461BFECC(v40, type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly);
    OUTLINED_FUNCTION_19();
    if (qword_2575585D0 != -1)
      swift_once();
    v104 = qword_25755AC00;
    v105 = sub_2461E6604();
    v106 = v144;
    v107 = v145;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v144 + 16))(v49, v45, v145);
    OUTLINED_FUNCTION_9_2();
    v109 = v49 + v108;
    *(_BYTE *)v109 = v105;
    *(_QWORD *)(v109 + 8) = v104;
    *(_QWORD *)(v109 + 16) = v104;
    *(_QWORD *)(v109 + 24) = v104;
    *(_QWORD *)(v109 + 32) = v104;
    *(_BYTE *)(v109 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v45, v107);
    v137 = sub_2461E68A4();
    v139 = v110;
    v111 = OUTLINED_FUNCTION_8_1();
    v112 = v49;
    sub_2461C9C74(*(double *)&v111, v113, v114, v115, v116, v117, v118, v119, v120, 0.0, 1, 0.0, 1, v137, v139, &qword_257558DC8, &qword_257558DD0);
    OUTLINED_FUNCTION_6_4(v49);
    OUTLINED_FUNCTION_12_0();
    v121 = OUTLINED_FUNCTION_24();
    if (v89)
      v122 = v121;
    else
      v122 = 1.0;
    v123 = v148;
    sub_2461CA5A0(v53, v148, &qword_257558DD0);
    *(double *)(v123 + *(int *)(v146 + 36)) = v122;
    sub_2461BFEF4(v53, &qword_257558DD0);
    v124 = sub_2461E688C();
    if (qword_2575585B0 != -1)
      v124 = swift_once();
    OUTLINED_FUNCTION_13(v124, *MEMORY[0x24BDEEB68]);
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_5_4(v125);
    v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558E00);
    OUTLINED_FUNCTION_16(v126);
    *(_WORD *)((char *)&qword_257558DC8 + *(int *)(v112 + 56)) = 256;
    OUTLINED_FUNCTION_9_3(v123, v41);
    sub_2461BFECC((uint64_t)&qword_257558DD0, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    OUTLINED_FUNCTION_17(*(uint64_t (**)(uint64_t, uint64_t))(v45 + 8));
    OUTLINED_FUNCTION_6_4(v123);
    KeyPath = swift_getKeyPath();
    v129 = v179;
    v128 = v180;
    OUTLINED_FUNCTION_28();
    v130 = v163;
    v131(v163);
    v132 = v149;
    v133 = (uint64_t *)(v149 + *(int *)(v178 + 36));
    v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558E08);
    (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))((char *)v133 + *(int *)(v134 + 28), v130, v128);
    *v133 = KeyPath;
    OUTLINED_FUNCTION_9_3(v41, v132);
    OUTLINED_FUNCTION_17(*(uint64_t (**)(uint64_t, uint64_t))(v129 + 8));
    OUTLINED_FUNCTION_6_4(v41);
    v135 = v150;
    sub_2461CA574(v132, v150, &qword_257558DE8);
    OUTLINED_FUNCTION_9_3(v135, v182);
    swift_storeEnumTagMultiPayload();
    sub_2461CA250((uint64_t)&unk_257558E10);
    sub_2461CA250((uint64_t)&unk_257558E50);
    sub_2461E6550();
    v103 = v135;
  }
  else
  {
    v61 = v152;
    sub_2461DBD54();
    sub_2461CA220((uint64_t)&unk_257558DF0);
    sub_2461CA220((uint64_t)&unk_257558DF8);
    v62 = v151;
    sub_2461E6724();
    sub_2461BFECC(v61, type metadata accessor for GetContactQuickActionButtonLabelStyle);
    OUTLINED_FUNCTION_19();
    if (qword_2575585D0 != -1)
      swift_once();
    v63 = qword_25755AC00;
    v64 = qword_25755AC00;
    v65 = v165;
    if (qword_2575585C0 != -1)
    {
      swift_once();
      v64 = qword_25755AC00;
    }
    v66 = qword_25755ABF0;
    v67 = sub_2461E6604();
    v68 = v155;
    v69 = v158;
    v70 = v157;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v155 + 16))(v158, v62, v157);
    OUTLINED_FUNCTION_9_2();
    v72 = v69 + v71;
    *(_BYTE *)v72 = v67;
    *(_QWORD *)(v72 + 8) = v63;
    *(_QWORD *)(v72 + 16) = v66;
    *(_QWORD *)(v72 + 24) = v64;
    *(_QWORD *)(v72 + 32) = v66;
    *(_BYTE *)(v72 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v62, v70);
    v136 = sub_2461E68A4();
    v138 = v73;
    v74 = v159;
    v75 = OUTLINED_FUNCTION_8_1();
    sub_2461C9C74(*(double *)&v75, v76, v77, v78, v79, v80, v81, v82, v83, 0.0, 1, 0.0, 1, v136, v138, &qword_257558D88, &qword_257558D90);
    OUTLINED_FUNCTION_6_4(v69);
    v84 = swift_getKeyPath();
    v85 = v161;
    sub_2461CA5A0(v74, v161, &qword_257558D90);
    OUTLINED_FUNCTION_9_2();
    v87 = v85 + v86;
    *(_QWORD *)v87 = v84;
    *(_QWORD *)(v87 + 8) = 1;
    *(_BYTE *)(v87 + 16) = 0;
    sub_2461BFEF4(v74, &qword_257558D90);
    OUTLINED_FUNCTION_12_0();
    v88 = OUTLINED_FUNCTION_24();
    if (v89)
      v90 = v88;
    else
      v90 = 1.0;
    OUTLINED_FUNCTION_9_3(v85, v65);
    *(double *)(v65 + *(int *)(v160 + 36)) = v90;
    OUTLINED_FUNCTION_6_4(v85);
    v91 = sub_2461E688C();
    if (qword_2575585B0 != -1)
      v91 = swift_once();
    OUTLINED_FUNCTION_13(v91, *MEMORY[0x24BDEEB68]);
    OUTLINED_FUNCTION_7_4();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_5_4(v92);
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558E00);
    OUTLINED_FUNCTION_16(v93);
    *(_WORD *)((char *)&qword_257558D98 + *(int *)(v69 + 56)) = 256;
    OUTLINED_FUNCTION_9_3(v65, v74);
    sub_2461BFECC(v85, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    OUTLINED_FUNCTION_17((uint64_t (*)(uint64_t, uint64_t))qword_257558D98);
    OUTLINED_FUNCTION_6_4(v65);
    v94 = swift_getKeyPath();
    v96 = v179;
    v95 = v180;
    OUTLINED_FUNCTION_28();
    v97 = v164;
    v98(v164);
    v99 = v166;
    v100 = (uint64_t *)(v166 + *(int *)(v183 + 36));
    v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558E08);
    (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))((char *)v100 + *(int *)(v101 + 28), v97, v95);
    *v100 = v94;
    OUTLINED_FUNCTION_9_3(v74, v99);
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v97, v95);
    OUTLINED_FUNCTION_6_4(v74);
    v102 = v167;
    sub_2461CA574(v99, v167, &qword_257558DB0);
    OUTLINED_FUNCTION_9_3(v102, v182);
    swift_storeEnumTagMultiPayload();
    sub_2461CA250((uint64_t)&unk_257558E10);
    sub_2461CA250((uint64_t)&unk_257558E50);
    sub_2461E6550();
    v103 = v102;
  }
  OUTLINED_FUNCTION_6_4(v103);
}

void *sub_2461C9C74@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _BYTE __src[112];

  v19 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2461E6C04();
    v28 = (void *)sub_2461E65EC();
    sub_2461E62EC();

    v19 = a17;
  }
  sub_2461E6460();
  sub_2461CA5A0(v17, a9, a16);
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  return memcpy((void *)(a9 + *(int *)(v29 + 36)), __src, 0x70uLL);
}

void sub_2461C9E20(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;

  if (*(_BYTE *)(v1 + 10))
    v2 = 0x10000;
  else
    v2 = 0;
  if (*(_BYTE *)(v1 + 9))
    v3 = 256;
  else
    v3 = 0;
  sub_2461C8F98(*(_QWORD *)v1, v2 | v3 | *(unsigned __int8 *)(v1 + 8), a1);
}

uint64_t sub_2461C9E5C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_2461E6508();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_2461E6C04();
  v9 = sub_2461E65EC();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_2461D5F20(1819242306, 0xE400000000000000, &v15);
    sub_2461E6CB8();
    _os_log_impl(&dword_2461B8000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249554254](v12, -1, -1);
    MEMORY[0x249554254](v11, -1, -1);
  }

  sub_2461E64FC();
  swift_getAtKeyPath();
  sub_2461C8D84(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_2461CA01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2461E6454();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2461CA068()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_257558E18;
  if (!qword_257558E18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558DE0);
    sub_2461CA404((uint64_t)&unk_257558E20);
    v3 = v2;
    sub_2461CA54C((uint64_t)&unk_257558E40);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_257558E18);
  }
  return result;
}

void sub_2461CA10C()
{
  sub_2461CA404((uint64_t)&unk_257558E28);
}

unint64_t sub_2461CA130()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t ContactQuickActionButtonLabelStyleIconOnly;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_257558E30;
  if (!qword_257558E30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558DC8);
    v2 = sub_2461E65D4();
    ContactQuickActionButtonLabelStyleIconOnly = type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(255);
    sub_2461CA220((uint64_t)&unk_257558DF0);
    v5 = v4;
    sub_2461CA220((uint64_t)&unk_257558E38);
    v7[2] = v2;
    v7[3] = ContactQuickActionButtonLabelStyleIconOnly;
    v7[4] = v5;
    v7[5] = v6;
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v7);
    atomic_store(result, (unint64_t *)&qword_257558E30);
  }
  return result;
}

void sub_2461CA220(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_1();
}

void sub_2461CA250(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v4 = OUTLINED_FUNCTION_27(0, v3);
    v5 = v2();
    sub_2461CA54C((uint64_t)&qword_257558E48);
    v7[0] = v5;
    v7[1] = v6;
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDED308], v4, v7), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_2461CA2BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_257558E58;
  if (!qword_257558E58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558DA8);
    sub_2461CA404((uint64_t)&unk_257558E60);
    v3 = v2;
    sub_2461CA54C((uint64_t)&unk_257558E40);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_257558E58);
  }
  return result;
}

unint64_t sub_2461CA360()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_257558E68;
  if (!qword_257558E68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558D98);
    sub_2461CA404((uint64_t)&unk_257558E70);
    v3 = v2;
    sub_2461CA54C((uint64_t)&unk_257558E80);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_257558E68);
  }
  return result;
}

void sub_2461CA404(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    v8[0] = v6();
    v8[1] = v5;
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDED308], v7, v8), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_2461CA45C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t ContactQuickActionButtonLabelStyle;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_257558E78;
  if (!qword_257558E78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558D88);
    v2 = sub_2461E65D4();
    ContactQuickActionButtonLabelStyle = type metadata accessor for GetContactQuickActionButtonLabelStyle(255);
    sub_2461CA220((uint64_t)&unk_257558DF0);
    v5 = v4;
    sub_2461CA220((uint64_t)&unk_257558DF8);
    v7[2] = v2;
    v7[3] = ContactQuickActionButtonLabelStyle;
    v7[4] = v5;
    v7[5] = v6;
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v7);
    atomic_store(result, (unint64_t *)&qword_257558E78);
  }
  return result;
}

void sub_2461CA54C(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    OUTLINED_FUNCTION_27(0, v1);
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_1();
}

void sub_2461CA574(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1();
}

void sub_2461CA5A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

unint64_t sub_2461CA5D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_257558E90;
  if (!qword_257558E90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558E98);
    sub_2461CA250((uint64_t)&unk_257558E10);
    v3 = v2;
    sub_2461CA250((uint64_t)&unk_257558E50);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_257558E90);
  }
  return result;
}

void OUTLINED_FUNCTION_3_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_5_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 216) + 16))(*(_QWORD *)(v1 - 256) + a1, v2, *(_QWORD *)(v3 - 200));
}

void OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  uint64_t *v1;

  sub_2461BFEF4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v1 + 16))(*(_QWORD *)(v3 - 208) + *(int *)(*(_QWORD *)(v3 - 256) + 20), v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return 0;
}

void OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2461CA5A0(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(v0 - 184);
  v2 = *(_DWORD *)(v0 - 188);
  sub_2461C8D68(v1, v2);
  return sub_2461C9E5C(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v2 - 240) + 104))(*(_QWORD *)(v2 - 248), a2, *(_QWORD *)(v2 - 232));
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  *v3 = v4;
  v3[1] = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2461CA01C(v2, v1 + *(int *)(a1 + 52));
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return 0;
}

double OUTLINED_FUNCTION_24()
{
  uint64_t v0;
  char v1;

  sub_2461C8D84(v0, v1);
  return 0.5;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

void sub_2461CA7E4(uint64_t a1, unint64_t a2)
{
  id *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *oslog;

  if (a2 >> 60 == 15)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_74();
    __swift_project_value_buffer(v3, (uint64_t)qword_257559B40);
    OUTLINED_FUNCTION_72();
    v4 = OUTLINED_FUNCTION_69();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2461B8000, oslog, v4, "#GetContactAttributeButtonableView could not obtain direct invocation for button press", v5, 2u);
      OUTLINED_FUNCTION_7_0();
    }
LABEL_14:
    OUTLINED_FUNCTION_7_5(oslog);
    return;
  }
  sub_2461C1A2C();
  OUTLINED_FUNCTION_45();
  v6 = OUTLINED_FUNCTION_63();
  if (!v6)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_74();
    __swift_project_value_buffer(v11, (uint64_t)qword_257559B40);
    OUTLINED_FUNCTION_72();
    v12 = OUTLINED_FUNCTION_69();
    if (OUTLINED_FUNCTION_52(v12, v13, v14, v15, v16, v17, v18, v19, v28, oslog))
    {
      *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
      OUTLINED_FUNCTION_30(&dword_2461B8000, v20, v21, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v22, v23, v24, v25, v29, oslog);
      OUTLINED_FUNCTION_7_0();
    }
    v26 = OUTLINED_FUNCTION_6_0();
    sub_2461C19BC(v26, v27);
    goto LABEL_14;
  }
  if (*v2)
  {
    v7 = (void *)v6;
    v8 = *v2;
    OUTLINED_FUNCTION_71();

    v9 = OUTLINED_FUNCTION_6_0();
    sub_2461C19BC(v9, v10);
  }
  else
  {
    OUTLINED_FUNCTION_75();
    sub_2461CA220((uint64_t)&qword_2575587A0);
    OUTLINED_FUNCTION_34();
    __break(1u);
  }
}

uint64_t sub_2461CA9A0()
{
  return sub_2461CA9B4();
}

uint64_t sub_2461CA9B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint64_t result;
  int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[3];
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t (*v122)(_QWORD);
  uint64_t v123;
  uint64_t *v124;
  unsigned int v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  __int16 v130;
  uint64_t v131;
  uint64_t v132;

  OUTLINED_FUNCTION_42();
  v131 = v1;
  v132 = v2;
  v118 = v3;
  v122 = v4;
  v123 = v0;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_0();
  v119 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v116 = *(_QWORD *)(v9 - 8);
  v117 = v9;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  v14 = sub_2461E6250();
  v120 = *(_QWORD *)(v14 - 8);
  v121 = v14;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3_0();
  v114 = v16;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v17);
  v111[1] = (char *)v111 - v18;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v19);
  v111[2] = (char *)v111 - v20;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v21);
  v112 = (char *)v111 - v22;
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_3_0();
  v113 = v24;
  OUTLINED_FUNCTION_56();
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v111 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)v111 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)v111 - v33;
  v35 = sub_2461E6184();
  v36 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_0();
  v39 = v38 - v37;
  v115 = v6;
  sub_2461E61B4();
  v40 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 88))(v39, v35);
  if (v40 != *MEMORY[0x24BE91E10])
  {
    v49 = v123;
    if (v40 == *MEMORY[0x24BE91E00])
    {
      v50 = OUTLINED_FUNCTION_73();
      sub_2461CFDB0(v49 + *(int *)(v50 + 20), (uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
      v13 = (uint64_t)v112;
      sub_2461E6178();
      sub_2461BFECC((uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
      v51 = (uint64_t *)sub_2461E6220();
      (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v13, v121);
      v52 = OUTLINED_FUNCTION_67();
      LOBYTE(v13) = v53;
      if (v51[2])
      {
        v54 = OUTLINED_FUNCTION_79(v52);
        if ((v55 & 1) != 0)
          OUTLINED_FUNCTION_21(v54);
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_60();
      v61 = OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_29(v61, v62, v63, v61);
      OUTLINED_FUNCTION_49();
      v64 = OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_58(v64, &qword_257558FA8);
      OUTLINED_FUNCTION_76();
    }
    else
    {
      if (v40 != *MEMORY[0x24BE91DE0])
      {
        if (v40 != *MEMORY[0x24BE91DF0])
        {
          v128 = 0;
          v129 = 0;
          v130 = 256;
          v51 = &qword_257558B88;
          __swift_instantiateConcreteTypeFromMangledName(&qword_257558B88);
          sub_2461CD6E8((uint64_t)&unk_257558B80);
          sub_2461E6550();
          OUTLINED_FUNCTION_35();
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v39, v35);
          goto LABEL_28;
        }
        v65 = OUTLINED_FUNCTION_73();
        sub_2461CFDB0(v49 + *(int *)(v65 + 20), (uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
        OUTLINED_FUNCTION_54();
        sub_2461BFECC((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
        v66 = sub_2461E6238();
        OUTLINED_FUNCTION_2_6(v120);
        v67 = OUTLINED_FUNCTION_67();
        if (*(_QWORD *)(v66 + 16) && (v69 = sub_2461DDF6C(v67, v68), (v70 & 1) != 0))
        {
          v71 = (uint64_t *)(*(_QWORD *)(v66 + 56) + 16 * v69);
          v72 = *v71;
          v73 = v71[1];
          sub_2461C1A68(*v71, v73);
        }
        else
        {
          v72 = 0;
          v73 = 0xF000000000000000;
        }
        OUTLINED_FUNCTION_60();
        swift_bridgeObjectRelease();
        v102 = OUTLINED_FUNCTION_14();
        OUTLINED_FUNCTION_29(v102, v103, v104, v102);
        v105 = OUTLINED_FUNCTION_49();
        v13 = v106;
        v107 = (v106 >> 8) & 1;
        v108 = sub_2461C19BC(v72, v73);
        OUTLINED_FUNCTION_58(v108, &qword_257558FA8);
        v128 = v105;
        v129 = v13 & 0x1FF;
        sub_2461CFA3C(v105, v13, v107);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257558BD8);
        sub_2461C6DCC();
        sub_2461C6EC0();
        OUTLINED_FUNCTION_47();
        sub_2461E6550();
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_44(v109);
        LOBYTE(v130) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257558B98);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257558BC8);
        sub_2461C6D68();
        sub_2461C6E9C();
        OUTLINED_FUNCTION_47();
        sub_2461E6550();
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_43(v110);
        v51 = &qword_257558B88;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257558B88);
        OUTLINED_FUNCTION_77((uint64_t)&unk_257558B80);
        OUTLINED_FUNCTION_37();
        v99 = v105;
        v100 = v13;
        v101 = v107;
        goto LABEL_26;
      }
      v56 = OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_59(v49 + *(int *)(v56 + 20));
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_65();
      v51 = (uint64_t *)sub_2461E6244();
      OUTLINED_FUNCTION_2_6(v120);
      v57 = OUTLINED_FUNCTION_67();
      LOBYTE(v13) = v58;
      if (v51[2])
      {
        v59 = OUTLINED_FUNCTION_79(v57);
        if ((v60 & 1) != 0)
          OUTLINED_FUNCTION_21(v59);
      }
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_60();
      v94 = OUTLINED_FUNCTION_14();
      v95 = v119;
      OUTLINED_FUNCTION_12_1(v119, v96, v97, v94);
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_25();
      sub_2461BFEF4(v95, &qword_257558FA8);
      v128 = (uint64_t)v51;
      LOWORD(v129) = v49 & 0x1FF;
      BYTE2(v129) = 1;
    }
    OUTLINED_FUNCTION_40();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
    sub_2461C6DCC();
    sub_2461E6550();
    OUTLINED_FUNCTION_44((uint64_t)v124);
    LOBYTE(v130) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558B98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BC8);
    sub_2461C6D68();
    sub_2461C6E9C();
    sub_2461E6550();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_43(v98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558B88);
    OUTLINED_FUNCTION_77((uint64_t)&unk_257558B80);
    OUTLINED_FUNCTION_37();
    v99 = OUTLINED_FUNCTION_22();
LABEL_26:
    sub_2461C6F08(v99, v100, v101);
    goto LABEL_27;
  }
  v41 = v123 + *(int *)(v122(0) + 20);
  sub_2461CFDB0(v41, (uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
  sub_2461E61FC();
  v42 = v117;
  v43 = (void *)sub_2461E60DC();
  (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v13, v42);
  v44 = sub_2461E6C64();

  sub_2461BFECC((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
  if ((v44 & 1) == 0)
  {
    v128 = 0;
    LOWORD(v129) = 0;
    BYTE2(v129) = 1;
LABEL_23:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
    sub_2461C6DCC();
    sub_2461E6550();
    v51 = v124;
    LOBYTE(v13) = BYTE2(v125);
    v128 = (uint64_t)v124;
    LOWORD(v129) = v125;
    BYTE2(v129) = BYTE2(v125) != 0;
    HIBYTE(v129) = 1;
    v84 = OUTLINED_FUNCTION_22();
    sub_2461CFC3C(v84, v85, v86);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BD8);
    sub_2461C6DCC();
    sub_2461C6EC0();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_44(v87);
    LOBYTE(v130) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558B98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BC8);
    sub_2461C6D68();
    sub_2461C6E9C();
    OUTLINED_FUNCTION_16_0();
    v88 = (uint64_t)v124;
    v89 = v125;
    v90 = v126;
    v128 = (uint64_t)v124;
    LOBYTE(v130) = v126 != 0;
    v129 = v125;
    HIBYTE(v130) = 0;
    sub_2461CFC4C((uint64_t)v124, v125, v126, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461CFC78, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461CFA3C, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461CFC3C);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558B88);
    sub_2461CD6E8((uint64_t)&unk_257558B80);
    sub_2461E6550();
    v91 = OUTLINED_FUNCTION_22();
    sub_2461C6F28(v91, v92, v93);
    sub_2461CFC4C(v88, v89, v90, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461C6F00, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461C6F08, (uint64_t (*)(uint64_t, uint64_t, _QWORD))sub_2461C6F28);
LABEL_27:
    OUTLINED_FUNCTION_35();
LABEL_28:
    LOBYTE(v124) = v13;
    return (uint64_t)v51;
  }
  OUTLINED_FUNCTION_59(v41);
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_65();
  v45 = sub_2461E6244();
  OUTLINED_FUNCTION_2_6(v120);
  result = sub_2461CFC94(v45);
  if ((v48 & 1) == 0)
  {
    if (*(_DWORD *)(v45 + 36) == v47)
    {
      if (result != 1 << *(_BYTE *)(v45 + 32))
      {
        sub_2461CFD14(&v127, result, v47, 0, v45);
        swift_bridgeObjectRetain();
        v74 = OUTLINED_FUNCTION_61();
        sub_2461C1A68(v74, v75);
        OUTLINED_FUNCTION_4();
        v76 = OUTLINED_FUNCTION_61();
        sub_2461C19D0(v76, v77);
        OUTLINED_FUNCTION_4();
      }
      OUTLINED_FUNCTION_10();
      v78 = OUTLINED_FUNCTION_14();
      v79 = v119;
      OUTLINED_FUNCTION_12_1(v119, v80, v81, v78);
      OUTLINED_FUNCTION_49();
      v82 = OUTLINED_FUNCTION_61();
      sub_2461C19BC(v82, v83);
      sub_2461BFEF4(v79, &qword_257558FA8);
      OUTLINED_FUNCTION_76();
      goto LABEL_23;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2461CB4C8(uint64_t a1)
{
  return sub_2461CB4DC(a1, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView, (uint64_t (*)(uint64_t, unint64_t, _QWORD, unint64_t, uint64_t))sub_2461CE6A4);
}

uint64_t sub_2461CB4DC(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, unint64_t, _QWORD, unint64_t, uint64_t))
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
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  v9 = sub_2461E6184();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  sub_2461E61B4();
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 88))(v13, v9);
  if (v14 == *MEMORY[0x24BE91E00])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
    sub_2461C6DCC();
    sub_2461E6550();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_48(v15);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558BF8);
    sub_2461C6F38();
    sub_2461E6550();
  }
  else
  {
    if (v14 != *MEMORY[0x24BE91DE0])
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558BF8);
      sub_2461C6F38();
      sub_2461E6550();
      OUTLINED_FUNCTION_39();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
      return v16;
    }
    a2(0);
    sub_2461E619C();
    sub_2461E58B4(v17, v8);
    swift_bridgeObjectRelease();
    v16 = a3(0x69662E656E6F6870, 0xEA00000000006C6CLL, 0, 0xF000000000000000, v8);
    sub_2461BFEF4(v8, &qword_257558FA8);
    OUTLINED_FUNCTION_40();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BA8);
    sub_2461C6DCC();
    sub_2461E6550();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_48(v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BF8);
    sub_2461C6F38();
    sub_2461E6550();
    v19 = OUTLINED_FUNCTION_22();
    sub_2461C6F08(v19, v20, v21);
  }
  OUTLINED_FUNCTION_39();
  return v16;
}

uint64_t sub_2461CB7C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  void (*v23)(char *, _QWORD, uint64_t);
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t ContactAttributeViewModel;
  uint64_t v83;
  void (*v84)(char *, uint64_t);
  void (*v85)(char *, unint64_t, uint64_t);
  uint64_t v86;
  unint64_t v87;
  char v88;
  uint64_t v89;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v76 = *(_QWORD *)(v3 - 8);
  v77 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v75 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v79 = *(_QWORD *)(v5 - 8);
  v80 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v78 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2461E6184();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v74 - v12;
  v14 = sub_2461E61C0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v74 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v74 - v18;
  v20 = v1 + *(int *)(type metadata accessor for GetContactAttributeSingleResultView() + 20);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v83 = v20;
  result = MEMORY[0x2495531F8]();
  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v81 = a1;
  v22 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v85 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v85(v19, result + v22, v14);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v84 = *(void (**)(char *, uint64_t))(v15 + 8);
  v84(v19, v14);
  v23 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 104);
  v23(v11, *MEMORY[0x24BE91DF8], v7);
  v24 = sub_2461BF298((uint64_t)v13, (uint64_t)v11);
  v25 = *(void (**)(char *, uint64_t))(v8 + 8);
  v25(v11, v7);
  v26 = ((uint64_t (*)(char *, uint64_t))v25)(v13, v7);
  if ((v24 & 1) != 0)
  {
LABEL_3:
    v27 = v75;
    sub_2461E61FC();
    v28 = v77;
    v29 = (void *)sub_2461E60DC();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v27, v28);
    v30 = sub_2461E6C70();
    v32 = v31;

    v86 = v30;
    v87 = v32;
    sub_2461BFC74();
    v33 = sub_2461E66AC();
    v35 = v34;
    v37 = v36 & 1;
    v86 = *(_QWORD *)(v83 + *(int *)(ContactAttributeViewModel + 28));
    swift_retain();
    v38 = sub_2461E6694();
    v40 = v39;
    v42 = v41;
    v44 = v43 & 1;
    sub_2461BFCB0(v33, v35, v37);
    swift_release();
    swift_bridgeObjectRelease();
    v86 = v38;
    v87 = v40;
    v88 = v44;
    v89 = v42;
    v45 = MEMORY[0x24BDF1FA8];
    v46 = MEMORY[0x24BDF1F80];
    v47 = v78;
    sub_2461E6760();
    sub_2461BFCB0(v38, v40, v44);
    swift_bridgeObjectRelease();
    v86 = v45;
    v87 = v46;
    swift_getOpaqueTypeConformance2();
    v48 = v80;
    v49 = sub_2461E66B8();
    result = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v47, v48);
LABEL_15:
    v72 = MEMORY[0x24BEAD938];
    v73 = v81;
    v81[3] = MEMORY[0x24BDF4780];
    v73[4] = v72;
    *v73 = v49;
    return result;
  }
  result = MEMORY[0x2495531F8](v26);
  if (!*(_QWORD *)(result + 16))
    goto LABEL_17;
  v85(v19, result + v22, v14);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v84(v19, v14);
  v23(v11, *MEMORY[0x24BE91E10], v7);
  v50 = sub_2461BF298((uint64_t)v13, (uint64_t)v11);
  v25(v11, v7);
  v51 = ((uint64_t (*)(char *, uint64_t))v25)(v13, v7);
  if ((v50 & 1) == 0)
  {
LABEL_8:
    result = MEMORY[0x2495531F8](v51);
    if (*(_QWORD *)(result + 16))
    {
      v54 = v74;
      v85(v74, result + v22, v14);
      swift_bridgeObjectRelease();
      v55 = sub_2461E619C();
      v57 = v56;
      v84(v54, v14);
      if (v57)
        v58 = v55;
      else
        v58 = 0;
      v59 = 0xE000000000000000;
      if (v57)
        v59 = v57;
      v86 = v58;
      v87 = v59;
      sub_2461BFC74();
      v60 = sub_2461E66AC();
      v62 = v61;
      v64 = v63 & 1;
      v86 = *(_QWORD *)(v83 + *(int *)(ContactAttributeViewModel + 28));
      swift_retain();
      v65 = sub_2461E6694();
      v67 = v66;
      v69 = v68;
      v71 = v70 & 1;
      sub_2461BFCB0(v60, v62, v64);
      swift_release();
      swift_bridgeObjectRelease();
      v86 = v65;
      v87 = v67;
      v88 = v71;
      v89 = v69;
      v49 = sub_2461E66B8();
      sub_2461BFCB0(v65, v67, v71);
      result = swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  result = MEMORY[0x2495531F8](v51);
  if (*(_QWORD *)(result + 16))
  {
    v85(v19, result + v22, v14);
    swift_bridgeObjectRelease();
    sub_2461E619C();
    v84(v19, v14);
    sub_2461E6CA0();
    v53 = v52;
    swift_bridgeObjectRelease();
    v51 = swift_bridgeObjectRelease();
    if (!v53)
      goto LABEL_3;
    goto LABEL_8;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_2461CBDF8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t result;
  void (*v33)(char *, _QWORD, uint64_t);
  char v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  char v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t KeyPath;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t OpaqueTypeConformance2;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t *v124;
  char *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t ContactAttributeViewModel;
  char *v142;
  char *v143;
  uint64_t ContactAttributeSingleResultView;
  uint64_t v145;
  uint64_t *v146;
  char *v147;
  unint64_t v148;
  void (*v149)(char *, unint64_t, uint64_t);
  void (*v150)(char *, uint64_t);
  char *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;

  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v135 = *(_QWORD *)(v136 - 8);
  MEMORY[0x24BDAC7A8](v136);
  v134 = (char *)&v125 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v138 = *(_QWORD *)(v139 - 8);
  MEMORY[0x24BDAC7A8](v139);
  v137 = (char *)&v125 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558738);
  MEMORY[0x24BDAC7A8](v140);
  v143 = (char *)&v125 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558F80);
  v126 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v133 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558F88);
  v129 = *(_QWORD *)(v130 - 8);
  MEMORY[0x24BDAC7A8](v130);
  v127 = (char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  MEMORY[0x24BDAC7A8](v8);
  v145 = (uint64_t)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2461E6184();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v125 - v15;
  v17 = sub_2461E61C0();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v125 = (char *)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v132 = (char *)&v125 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v131 = (char *)&v125 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v125 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v125 - v28;
  ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  v30 = *(int *)(ContactAttributeSingleResultView + 20);
  v147 = v1;
  v31 = &v1[v30];
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v142 = v31;
  v151 = &v31[*(int *)(ContactAttributeViewModel + 20)];
  result = MEMORY[0x2495531F8]();
  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
    goto LABEL_21;
  }
  v146 = a1;
  v148 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v149 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
  v149(v29, result + v148, v17);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v150 = *(void (**)(char *, uint64_t))(v18 + 8);
  v150(v29, v17);
  v33 = *(void (**)(char *, _QWORD, uint64_t))(v11 + 104);
  v33(v14, *MEMORY[0x24BE91DF8], v10);
  v34 = sub_2461BF298((uint64_t)v16, (uint64_t)v14);
  v35 = *(void (**)(char *, uint64_t))(v11 + 8);
  v35(v14, v10);
  v36 = ((uint64_t (*)(char *, uint64_t))v35)(v16, v10);
  if ((v34 & 1) != 0)
  {
    result = MEMORY[0x2495531F8](v36);
    if (!*(_QWORD *)(result + 16))
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v149(v27, result + v148, v17);
    swift_bridgeObjectRelease();
    v37 = sub_2461E6190();
    v39 = v38;
    v36 = ((uint64_t (*)(char *, uint64_t))v150)(v27, v17);
    if (v39)
    {
      v152 = v37;
      v153 = v39;
      sub_2461BFC74();
      v40 = sub_2461E66AC();
      v42 = v41;
      v44 = v43 & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
      sub_2461E63D0();
      v45 = sub_2461E661C();
      v46 = v145;
      __swift_storeEnumTagSinglePayload(v145, 1, 1, v45);
      sub_2461E6634();
      sub_2461BFEF4(v46, &qword_257558CA0);
      v47 = sub_2461E66A0();
      v49 = v48;
      v51 = v50;
      swift_release();
      v52 = v51 & 1;
      sub_2461BFCB0(v40, v42, v44);
      swift_bridgeObjectRelease();
      v152 = *(_QWORD *)&v142[*(int *)(ContactAttributeViewModel + 28)];
      swift_retain();
LABEL_11:
      v69 = sub_2461E6694();
      v71 = v70;
      v73 = v72;
      v75 = v74;
      sub_2461BFCB0(v47, v49, v52);
      swift_release();
      swift_bridgeObjectRelease();
      v76 = MEMORY[0x24BEAD6B0];
      v77 = v146;
      v146[3] = MEMORY[0x24BDF1FA8];
      v77[4] = v76;
      result = swift_allocObject();
      *v77 = result;
      *(_QWORD *)(result + 16) = v69;
      *(_QWORD *)(result + 24) = v71;
      *(_BYTE *)(result + 32) = v73 & 1;
      *(_QWORD *)(result + 40) = v75;
      return result;
    }
  }
  result = MEMORY[0x2495531F8](v36);
  if (!*(_QWORD *)(result + 16))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v149(v29, result + v148, v17);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v150(v29, v17);
  v33(v14, *MEMORY[0x24BE91E10], v10);
  v53 = sub_2461BF298((uint64_t)v16, (uint64_t)v14);
  v35(v14, v10);
  v54 = ((uint64_t (*)(char *, uint64_t))v35)(v16, v10);
  if ((v53 & 1) == 0)
  {
    v78 = v134;
    sub_2461E61FC();
    v79 = v136;
    v80 = (void *)sub_2461E60DC();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v78, v79);
    v81 = sub_2461E6C70();
    v83 = v82;

    v152 = v81;
    v153 = v83;
    sub_2461BFC74();
    v84 = sub_2461E66AC();
    v86 = v85;
    v152 = v84;
    v153 = v85;
    v88 = v87 & 1;
    LOBYTE(v154) = v87 & 1;
    v155 = v89;
    v90 = v137;
    sub_2461E6760();
    sub_2461BFCB0(v84, v86, v88);
    swift_bridgeObjectRelease();
    v91 = v147;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    sub_2461E63D0();
    v92 = sub_2461E661C();
    v93 = v145;
    __swift_storeEnumTagSinglePayload(v145, 1, 1, v92);
    v94 = sub_2461E6634();
    sub_2461BFEF4(v93, &qword_257558CA0);
    KeyPath = swift_getKeyPath();
    v96 = v138;
    v97 = v143;
    v98 = v139;
    (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v143, v90, v139);
    v99 = v140;
    v100 = (uint64_t *)&v97[*(int *)(v140 + 36)];
    *v100 = KeyPath;
    v100[1] = v94;
    v101 = (*(uint64_t (**)(char *, uint64_t))(v96 + 8))(v90, v98);
    result = MEMORY[0x2495531F8](v101);
    if (*(_QWORD *)(result + 16))
    {
      v102 = v132;
      v149(v132, result + v148, v17);
      swift_bridgeObjectRelease();
      sub_2461E6190();
      v104 = v103;
      v105 = ((uint64_t (*)(char *, uint64_t))v150)(v102, v17);
      if (v104)
        v105 = swift_bridgeObjectRelease();
      MEMORY[0x24BDAC7A8](v105);
      *(&v125 - 2) = v91;
      v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558718);
      v107 = sub_2461BFCC8();
      v108 = sub_2461CF8E0();
      v109 = v133;
      v110 = (uint64_t)v143;
      sub_2461E66F4();
      sub_2461BFEF4(v110, &qword_257558738);
      result = MEMORY[0x2495531F8]();
      if (*(_QWORD *)(result + 16))
      {
        v111 = v125;
        v149(v125, result + v148, v17);
        swift_bridgeObjectRelease();
        sub_2461E6190();
        v113 = v112;
        v114 = ((uint64_t (*)(char *, uint64_t))v150)(v111, v17);
        if (v113)
          v114 = swift_bridgeObjectRelease();
        MEMORY[0x24BDAC7A8](v114);
        *(&v125 - 2) = v91;
        v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558F98);
        v152 = v99;
        v153 = v106;
        v154 = v107;
        v155 = v108;
        OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
        v117 = sub_2461CF96C();
        v118 = v127;
        v119 = v128;
        sub_2461E66F4();
        (*(void (**)(char *, uint64_t))(v126 + 8))(v109, v119);
        v152 = v119;
        v153 = v115;
        v154 = OpaqueTypeConformance2;
        v155 = v117;
        swift_getOpaqueTypeConformance2();
        v120 = v130;
        v121 = sub_2461E66B8();
        result = (*(uint64_t (**)(char *, uint64_t))(v129 + 8))(v118, v120);
        v122 = MEMORY[0x24BEAD938];
        v123 = v146;
        v146[3] = MEMORY[0x24BDF4780];
        v123[4] = v122;
        *v123 = v121;
        return result;
      }
LABEL_25:
      __break(1u);
      return result;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  result = MEMORY[0x2495531F8](v54);
  if (!*(_QWORD *)(result + 16))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v55 = v131;
  v149(v131, result + v148, v17);
  swift_bridgeObjectRelease();
  v56 = sub_2461E6190();
  v58 = v57;
  result = ((uint64_t (*)(char *, uint64_t))v150)(v55, v17);
  if (v58)
  {
    v152 = v56;
    v153 = v58;
    sub_2461BFC74();
    v59 = sub_2461E66AC();
    v61 = v60;
    v63 = v62 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    sub_2461E63D0();
    v64 = sub_2461E661C();
    v65 = v145;
    __swift_storeEnumTagSinglePayload(v145, 1, 1, v64);
    sub_2461E6634();
    sub_2461BFEF4(v65, &qword_257558CA0);
    v47 = sub_2461E66A0();
    v49 = v66;
    v68 = v67;
    swift_release();
    v52 = v68 & 1;
    sub_2461BFCB0(v59, v61, v63);
    swift_bridgeObjectRelease();
    v152 = sub_2461E67CC();
    goto LABEL_11;
  }
  v124 = v146;
  v146[4] = 0;
  *(_OWORD *)v124 = 0u;
  *((_OWORD *)v124 + 1) = 0u;
  return result;
}

uint64_t sub_2461CCA38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  v4 = sub_2461E67CC();
  sub_2461CFA48(a1, a2, &qword_257558738);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_257558718);
  *(_QWORD *)(a2 + *(int *)(result + 36)) = v4;
  return result;
}

uint64_t sub_2461CCABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a2 + *(int *)(type metadata accessor for GetContactAttributeSingleResultView() + 20);
  v6 = *(_QWORD *)(v5 + *(int *)(type metadata accessor for GetContactAttributeViewModel() + 28));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558F80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, a1, v7);
  *(_QWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257558F98) + 36)) = v6;
  return swift_retain();
}

void sub_2461CCB44(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ContactAttributeSingleResultView;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, _QWORD, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char *v29;
  void (*v30)(char *, uint64_t);
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _OWORD *v60;
  _QWORD v61[3];
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(char *, unint64_t, uint64_t);
  uint64_t v67;
  uint64_t ContactAttributeViewModel;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v2 = v1;
  v70 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  MEMORY[0x24BDAC7A8](v3);
  v62 = (uint64_t)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  MEMORY[0x24BDAC7A8](ContactAttributeSingleResultView);
  v7 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2461E6184();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v61 - v13;
  v15 = sub_2461E61C0();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v61 - v19;
  v67 = ContactAttributeSingleResultView;
  v21 = v2 + *(int *)(ContactAttributeSingleResultView + 20);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v22 = *(int *)(ContactAttributeViewModel + 20);
  v61[2] = v21;
  v64 = v21 + v22;
  v23 = MEMORY[0x2495531F8]();
  if (!*(_QWORD *)(v23 + 16))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v69 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v66 = *(void (**)(char *, unint64_t, uint64_t))(v16 + 16);
  v66(v20, v23 + v69, v15);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v65 = *(void (**)(char *, uint64_t))(v16 + 8);
  v65(v20, v15);
  v24 = *(void (**)(char *, _QWORD, uint64_t))(v9 + 104);
  v24(v12, *MEMORY[0x24BE91DF8], v8);
  v25 = sub_2461BF298((uint64_t)v14, (uint64_t)v12);
  v26 = *(void (**)(char *, uint64_t))(v9 + 8);
  v26(v12, v8);
  v26(v14, v8);
  v61[1] = v2;
  sub_2461CFDB0(v2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
  if ((v25 & 1) != 0)
  {
    sub_2461BFECC((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
LABEL_9:
    v60 = (_OWORD *)v70;
    *(_QWORD *)(v70 + 32) = 0;
    *v60 = 0u;
    v60[1] = 0u;
    return;
  }
  v27 = MEMORY[0x2495531F8]();
  if (!*(_QWORD *)(v27 + 16))
    goto LABEL_11;
  v28 = v66;
  v66(v20, v27 + v69, v15);
  swift_bridgeObjectRelease();
  sub_2461E61B4();
  v29 = v20;
  v30 = v65;
  v65(v29, v15);
  v24(v12, *MEMORY[0x24BE91E10], v8);
  v31 = sub_2461BF298((uint64_t)v14, (uint64_t)v12);
  v26(v12, v8);
  v26(v14, v8);
  sub_2461BFECC((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
  if ((v31 & 1) != 0)
    goto LABEL_9;
  v32 = MEMORY[0x2495531F8]();
  if (*(_QWORD *)(v32 + 16))
  {
    v33 = v63;
    v28(v63, v32 + v69, v15);
    swift_bridgeObjectRelease();
    v34 = sub_2461E6190();
    v36 = v35;
    v30(v33, v15);
    if (v36)
    {
      v71 = v34;
      v72 = v36;
      sub_2461BFC74();
      v37 = sub_2461E66AC();
      v39 = v38;
      v41 = v40 & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
      sub_2461E63D0();
      v42 = sub_2461E661C();
      v43 = v62;
      __swift_storeEnumTagSinglePayload(v62, 1, 1, v42);
      sub_2461E6634();
      sub_2461BFEF4(v43, &qword_257558CA0);
      v44 = sub_2461E66A0();
      v46 = v45;
      v48 = v47;
      swift_release();
      v49 = v48 & 1;
      sub_2461BFCB0(v37, v39, v41);
      swift_bridgeObjectRelease();
      v71 = sub_2461E67CC();
      v50 = sub_2461E6694();
      v52 = v51;
      v54 = v53;
      v56 = v55;
      sub_2461BFCB0(v44, v46, v49);
      swift_release();
      swift_bridgeObjectRelease();
      v57 = MEMORY[0x24BEAD6B0];
      v58 = (uint64_t *)v70;
      *(_QWORD *)(v70 + 24) = MEMORY[0x24BDF1FA8];
      v58[4] = v57;
      v59 = swift_allocObject();
      *v58 = v59;
      *(_QWORD *)(v59 + 16) = v50;
      *(_QWORD *)(v59 + 24) = v52;
      *(_BYTE *)(v59 + 32) = v54 & 1;
      *(_QWORD *)(v59 + 40) = v56;
      return;
    }
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
}

void GetContactAttributeSingleResultView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6[45];

  OUTLINED_FUNCTION_42();
  v0 = OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v0);
  sub_2461E6004();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_10_0();
  v2 = sub_2461E61C0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  sub_2461E69C4();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558EA0);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558EA8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10_0();
  sub_2461CB7C8(v6);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_68();
}

void sub_2461CD1E8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (*(_QWORD *)(a1 + 16))
  {
    v1[1] = v7;
    v1[2] = v3;
    v1[3] = v2;
    v9 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v1[16] = v9;
    v10 = a1 + v9;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v1[17] = v11;
    v11(v6, v10, v4);
    OUTLINED_FUNCTION_4();
    v12 = sub_2461CA9B4();
    v14 = v13;
    v15 = (v13 >> 40) & 1;
    v16 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v1[15] = v16;
    v16(v6, v4);
    *(_QWORD *)(v8 - 136) = v12;
    *(_BYTE *)(v8 - 124) = BYTE4(v14);
    *(_DWORD *)(v8 - 128) = v14;
    *(_BYTE *)(v8 - 123) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558B70);
    sub_2461C6C80();
    v17 = sub_2461E66B8();
    v18 = OUTLINED_FUNCTION_61();
    sub_2461C6EDC(v18, v19, v15);
    v20 = MEMORY[0x24BEAD938];
    *(_QWORD *)(v8 - 112) = MEMORY[0x24BDF4780];
    *(_QWORD *)(v8 - 104) = v20;
    *(_QWORD *)(v8 - 136) = v17;
    OUTLINED_FUNCTION_68();
  }
  __break(1u);
  JUMPOUT(0x2461CD654);
}

uint64_t type metadata accessor for GetContactAttributeSingleResultView()
{
  uint64_t result;

  result = qword_257558F38;
  if (!qword_257558F38)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461CD694(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t *v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v4 = OUTLINED_FUNCTION_27(0, v3);
    v5[0] = v2();
    v5[1] = MEMORY[0x24BDF5138];
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v4, v5), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

void sub_2461CD6E8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_8_0(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    v8[0] = v6();
    v8[1] = v5();
    atomic_store(MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v7, v8), v1);
  }
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2461CD748(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeSingleResultView;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  v4 = *(_QWORD *)(ContactAttributeSingleResultView - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](ContactAttributeSingleResultView);
  sub_2461CFDB0(a2, (uint64_t)&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  sub_2461CFE70((uint64_t)&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
  v10 = a2;
  sub_2461E69C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558EB8);
  sub_2461CA220((uint64_t)&unk_257558B30);
  sub_2461CD8A8();
  sub_2461C6BE0();
  sub_2461E676C();
  return swift_release();
}

uint64_t sub_2461CD8A0(uint64_t a1)
{
  uint64_t v1;

  return sub_2461CD748(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_2461CD8A8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257558EC0;
  if (!qword_257558EC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558EB8);
    sub_2461CA54C((uint64_t)&unk_257558EC8);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257558EC0);
  }
  return result;
}

uint64_t sub_2461CD92C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_2461E61C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  result = MEMORY[0x2495531F8]();
  if (*(_QWORD *)(result + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, result + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    swift_bridgeObjectRelease();
    v7 = sub_2461C03F4();
    v9 = v8;
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *a1 = v7;
    a1[1] = v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2461CDA18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[2];

  v2 = sub_2461E6544();
  if (qword_2575585C0 != -1)
    swift_once();
  v3 = qword_25755ABF0;
  sub_2461CDAFC(v12);
  v4 = v12[0];
  v5 = v12[1];
  if (qword_2575585C8 != -1)
    swift_once();
  v6 = sub_2461E6604();
  result = sub_2461E637C();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_BYTE *)(a1 + 80) = 0;
  return result;
}

void sub_2461CDAFC(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4[3];
  uint64_t v5;

  sub_2461CB7C8(v4);
  __swift_project_boxed_opaque_existential_1(v4, v5);
  v2 = sub_2461E6934();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  sub_2461CCB44((uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    v3 = sub_2461E6934();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_2461BFEF4((uint64_t)v4, &qword_257558F78);
    v3 = 0;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2461CDBC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v0 = sub_2461E6250();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeSingleResultView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_2461E6178();
  v4 = sub_2461E622C();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2461CA7E4(v4, v6);
  return sub_2461C19BC(v4, v6);
}

uint64_t sub_2461CDCA0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_1(v0);
  return sub_2461CDBC8();
}

unint64_t sub_2461CDCB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t OpaqueTypeConformance2;
  uint64_t v7;
  _QWORD v8[8];

  result = qword_257558ED8;
  if (!qword_257558ED8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558EA8);
    v2 = sub_2461E69C4();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558EB0);
    sub_2461CA220((uint64_t)&unk_257558B30);
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558EB8);
    v8[6] = sub_2461CD8A8();
    v8[7] = sub_2461C6BE0();
    v8[2] = v2;
    v8[3] = v3;
    v8[4] = v5;
    v8[5] = swift_getOpaqueTypeConformance2();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_2461CA54C((uint64_t)&qword_257558AC8);
    v8[0] = OpaqueTypeConformance2;
    v8[1] = v7;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v8);
    atomic_store(result, (unint64_t *)&qword_257558ED8);
  }
  return result;
}

uint64_t sub_2461CDDE8()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeSingleResultView(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  int *ContactAttributeViewModel;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)&a1[v8 + 24] = v11;
    v12 = v11;
    v13 = **(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
    v14 = v5;
    v13(v9, v10, v12);
    ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    v16 = ContactAttributeViewModel[5];
    v17 = &v9[v16];
    v18 = v10 + v16;
    v19 = sub_2461E6214();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    v20 = ContactAttributeViewModel[6];
    v21 = &v9[v20];
    v22 = v10 + v20;
    v23 = sub_2461E6394();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    *(_QWORD *)&v9[ContactAttributeViewModel[7]] = *(_QWORD *)(v10 + ContactAttributeViewModel[7]);
    v24 = *(int *)(a3 + 24);
    v25 = &a1[v24];
    v26 = (uint64_t)a2 + v24;
    swift_retain();
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for GetContactAttributeSingleResultView(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t ContactAttributeViewModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_1(v4);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v6 = v4 + *(int *)(ContactAttributeViewModel + 20);
  v7 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = v4 + *(int *)(ContactAttributeViewModel + 24);
  v9 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  v10 = (char *)a1 + *(int *)(a2 + 24);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

_QWORD *initializeWithCopy for GetContactAttributeSingleResultView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  id v14;
  int *ContactAttributeViewModel;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)((char *)a1 + v8 + 24) = v11;
  v12 = v11;
  v13 = **(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
  v14 = v6;
  v13(v9, v10, v12);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v16 = ContactAttributeViewModel[5];
  v17 = &v9[v16];
  v18 = v10 + v16;
  v19 = sub_2461E6214();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v20 = ContactAttributeViewModel[6];
  v21 = &v9[v20];
  v22 = v10 + v20;
  v23 = sub_2461E6394();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  *(_QWORD *)&v9[ContactAttributeViewModel[7]] = *(_QWORD *)(v10 + ContactAttributeViewModel[7]);
  v24 = *(int *)(a3 + 24);
  v25 = (char *)a1 + v24;
  v26 = a2 + v24;
  swift_retain();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeSingleResultView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *ContactAttributeViewModel;
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

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v9), (uint64_t *)(a2 + v9));
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v13 = ContactAttributeViewModel[5];
  v14 = v10 + v13;
  v15 = v11 + v13;
  v16 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = ContactAttributeViewModel[6];
  v18 = v10 + v17;
  v19 = v11 + v17;
  v20 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  *(_QWORD *)(v10 + ContactAttributeViewModel[7]) = *(_QWORD *)(v11 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
  v21 = *(int *)(a3 + 24);
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

_OWORD *initializeWithTake for GetContactAttributeSingleResultView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  __int128 v9;
  int *ContactAttributeViewModel;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *((_QWORD *)v7 + 4) = *(_QWORD *)((char *)a2 + v6 + 32);
  v9 = *(_OWORD *)((char *)a2 + v6 + 16);
  *(_OWORD *)v7 = *(_OWORD *)((char *)a2 + v6);
  *((_OWORD *)v7 + 1) = v9;
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v11 = ContactAttributeViewModel[5];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = sub_2461E6214();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = ContactAttributeViewModel[6];
  v16 = &v7[v15];
  v17 = &v8[v15];
  v18 = sub_2461E6394();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  *(_QWORD *)&v7[ContactAttributeViewModel[7]] = *(_QWORD *)&v8[ContactAttributeViewModel[7]];
  v19 = *(int *)(a3 + 24);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

uint64_t assignWithTake for GetContactAttributeSingleResultView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  int *ContactAttributeViewModel;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v10 = *((_OWORD *)v9 + 1);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v12 = ContactAttributeViewModel[5];
  v13 = v8 + v12;
  v14 = &v9[v12];
  v15 = sub_2461E6214();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = ContactAttributeViewModel[6];
  v17 = v8 + v16;
  v18 = &v9[v16];
  v19 = sub_2461E6394();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(_QWORD *)&v9[ContactAttributeViewModel[7]];
  swift_release();
  v20 = *(int *)(a3 + 24);
  v21 = a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSingleResultView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461CE48C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_3();
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v10 = v9;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
      v11 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSingleResultView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461CE53C(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 2147483646)
  {
    *a1 = a2;
    OUTLINED_FUNCTION_66();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_3_3();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
      v10 = *(int *)(a4 + 24);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + v10, a2, a2, v9);
  }
}

void sub_2461CE5C8()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for GetContactAttributeViewModel();
  if (v0 <= 0x3F)
  {
    sub_2461C7C00();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2461CE658()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558EA8);
  sub_2461CDCB8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461CE6A4(char *a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t ContactAttributeMultiResultView;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
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
  __int16 v86;

  v68 = a5;
  v69 = a3;
  v71 = a1;
  v72 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_2461E5FA4();
  v70 = *(_QWORD *)(v77 - 8);
  v9 = *(_QWORD *)(v70 + 64);
  v10 = MEMORY[0x24BDAC7A8](v77);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v65 - v11;
  v78 = type metadata accessor for SiriContactsGCAButtonStyle();
  MEMORY[0x24BDAC7A8](v78);
  v73 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  v15 = *(_QWORD *)(ContactAttributeMultiResultView - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](ContactAttributeMultiResultView);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FB0);
  v74 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FB8);
  v79 = MEMORY[0x24BDAC7A8](v21);
  v75 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = v23;
  if (a4 >> 60 == 15)
  {
    v66 = v15;
    v24 = v80;
    v67 = v20;
    v69 = v18;
    v25 = v70;
    sub_2461CFA48(v68, (uint64_t)v8, &qword_257558FA8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v77) != 1)
    {
      v42 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
      v65 = v12;
      v43 = v8;
      v44 = v77;
      v42(v12, v43, v77);
      sub_2461CFDB0(v24, (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
      v45 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v45, v12, v44);
      v46 = (*(unsigned __int8 *)(v66 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
      v47 = (v16 + *(unsigned __int8 *)(v25 + 80) + v46) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
      v48 = swift_allocObject();
      sub_2461CFE70((uint64_t)v17, v48 + v46, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
      v49 = v45;
      v50 = v44;
      v51 = ((uint64_t (*)(unint64_t, char *, uint64_t))v42)(v48 + v47, v49, v44);
      MEMORY[0x24BDAC7A8](v51);
      v52 = v72;
      *(&v65 - 2) = v71;
      *(&v65 - 1) = v52;
      sub_2461E68EC();
      sub_2461CA220((uint64_t)&qword_257558758);
      v53 = v67;
      sub_2461E682C();
      v54 = (uint64_t)v73;
      sub_2461C7110();
      sub_2461CA54C((uint64_t)&unk_257558FC0);
      v56 = v55;
      sub_2461CA220((uint64_t)&unk_257558FC8);
      v58 = v57;
      v59 = v75;
      v60 = v69;
      v61 = v78;
      sub_2461E673C();
      sub_2461BFECC(v54, (uint64_t (*)(_QWORD))type metadata accessor for SiriContactsGCAButtonStyle);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v53, v60);
      v81 = v60;
      v82 = v61;
      v83 = v56;
      v84 = v58;
      swift_getOpaqueTypeConformance2();
      v62 = v79;
      v63 = sub_2461E66B8();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v59, v62);
      v85 = v63;
      LOBYTE(v86) = 1;
      swift_retain();
      sub_2461E6550();
      v85 = v81;
      v86 = v82;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
      sub_2461C6E40();
      sub_2461E6550();
      swift_release();
      v41 = v81;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v50);
      return v41;
    }
    sub_2461BFEF4((uint64_t)v8, &qword_257558FA8);
    v85 = 0;
    v86 = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
    sub_2461C6E40();
    sub_2461E6550();
  }
  else
  {
    sub_2461CFDB0(v80, (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
    v26 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v27 = swift_allocObject();
    sub_2461CFE70((uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
    v28 = (uint64_t *)(v27 + ((v16 + v26 + 7) & 0xFFFFFFFFFFFFFFF8));
    v29 = v69;
    *v28 = v69;
    v28[1] = a4;
    v30 = MEMORY[0x24BDAC7A8](v29);
    v31 = v72;
    *(&v65 - 2) = v71;
    *(&v65 - 1) = v31;
    sub_2461C1A68(v30, a4);
    sub_2461E68EC();
    sub_2461CA220((uint64_t)&qword_257558758);
    sub_2461E682C();
    v32 = (uint64_t)v73;
    sub_2461C7110();
    sub_2461CA54C((uint64_t)&unk_257558FC0);
    v34 = v33;
    sub_2461CA220((uint64_t)&unk_257558FC8);
    v36 = v35;
    v37 = v75;
    v38 = v78;
    sub_2461E673C();
    sub_2461BFECC(v32, (uint64_t (*)(_QWORD))type metadata accessor for SiriContactsGCAButtonStyle);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v20, v18);
    v81 = v18;
    v82 = v38;
    v83 = v34;
    v84 = v36;
    swift_getOpaqueTypeConformance2();
    v39 = v79;
    v40 = sub_2461E66B8();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v37, v39);
    v85 = v40;
    LOBYTE(v86) = 0;
    swift_retain();
    sub_2461E6550();
    v85 = v81;
    v86 = v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
    sub_2461C6E40();
    sub_2461E6550();
    swift_release();
  }
  return v81;
}

uint64_t sub_2461CEE54(char *a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t ContactAttributeSingleResultView;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
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
  __int16 v86;

  v68 = a5;
  v69 = a3;
  v71 = a1;
  v72 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_2461E5FA4();
  v70 = *(_QWORD *)(v77 - 8);
  v9 = *(_QWORD *)(v70 + 64);
  v10 = MEMORY[0x24BDAC7A8](v77);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v65 - v11;
  v78 = type metadata accessor for SiriContactsGCAButtonStyle();
  MEMORY[0x24BDAC7A8](v78);
  v73 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  v15 = *(_QWORD *)(ContactAttributeSingleResultView - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](ContactAttributeSingleResultView);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FB0);
  v74 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FB8);
  v79 = MEMORY[0x24BDAC7A8](v21);
  v75 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = v23;
  if (a4 >> 60 == 15)
  {
    v66 = v15;
    v24 = v80;
    v67 = v20;
    v69 = v18;
    v25 = v70;
    sub_2461CFA48(v68, (uint64_t)v8, &qword_257558FA8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v77) != 1)
    {
      v42 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
      v65 = v12;
      v43 = v8;
      v44 = v77;
      v42(v12, v43, v77);
      sub_2461CFDB0(v24, (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
      v45 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v45, v12, v44);
      v46 = (*(unsigned __int8 *)(v66 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
      v47 = (v16 + *(unsigned __int8 *)(v25 + 80) + v46) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
      v48 = swift_allocObject();
      sub_2461CFE70((uint64_t)v17, v48 + v46, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
      v49 = v45;
      v50 = v44;
      v51 = ((uint64_t (*)(unint64_t, char *, uint64_t))v42)(v48 + v47, v49, v44);
      MEMORY[0x24BDAC7A8](v51);
      v52 = v72;
      *(&v65 - 2) = v71;
      *(&v65 - 1) = v52;
      sub_2461E68EC();
      sub_2461CA220((uint64_t)&qword_257558758);
      v53 = v67;
      sub_2461E682C();
      v54 = (uint64_t)v73;
      sub_2461C7110();
      sub_2461CA54C((uint64_t)&unk_257558FC0);
      v56 = v55;
      sub_2461CA220((uint64_t)&unk_257558FC8);
      v58 = v57;
      v59 = v75;
      v60 = v69;
      v61 = v78;
      sub_2461E673C();
      sub_2461BFECC(v54, (uint64_t (*)(_QWORD))type metadata accessor for SiriContactsGCAButtonStyle);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v53, v60);
      v81 = v60;
      v82 = v61;
      v83 = v56;
      v84 = v58;
      swift_getOpaqueTypeConformance2();
      v62 = v79;
      v63 = sub_2461E66B8();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v59, v62);
      v85 = v63;
      LOBYTE(v86) = 1;
      swift_retain();
      sub_2461E6550();
      v85 = v81;
      v86 = v82;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
      sub_2461C6E40();
      sub_2461E6550();
      swift_release();
      v41 = v81;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v50);
      return v41;
    }
    sub_2461BFEF4((uint64_t)v8, &qword_257558FA8);
    v85 = 0;
    v86 = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
    sub_2461C6E40();
    sub_2461E6550();
  }
  else
  {
    sub_2461CFDB0(v80, (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
    v26 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v27 = swift_allocObject();
    sub_2461CFE70((uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
    v28 = (uint64_t *)(v27 + ((v16 + v26 + 7) & 0xFFFFFFFFFFFFFFF8));
    v29 = v69;
    *v28 = v69;
    v28[1] = a4;
    v30 = MEMORY[0x24BDAC7A8](v29);
    v31 = v72;
    *(&v65 - 2) = v71;
    *(&v65 - 1) = v31;
    sub_2461C1A68(v30, a4);
    sub_2461E68EC();
    sub_2461CA220((uint64_t)&qword_257558758);
    sub_2461E682C();
    v32 = (uint64_t)v73;
    sub_2461C7110();
    sub_2461CA54C((uint64_t)&unk_257558FC0);
    v34 = v33;
    sub_2461CA220((uint64_t)&unk_257558FC8);
    v36 = v35;
    v37 = v75;
    v38 = v78;
    sub_2461E673C();
    sub_2461BFECC(v32, (uint64_t (*)(_QWORD))type metadata accessor for SiriContactsGCAButtonStyle);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v20, v18);
    v81 = v18;
    v82 = v38;
    v83 = v34;
    v84 = v36;
    swift_getOpaqueTypeConformance2();
    v39 = v79;
    v40 = sub_2461E66B8();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v37, v39);
    v85 = v40;
    LOBYTE(v86) = 0;
    swift_retain();
    sub_2461E6550();
    v85 = v81;
    v86 = v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558BB8);
    sub_2461C6E40();
    sub_2461E6550();
    swift_release();
  }
  return v81;
}

void sub_2461CF604(id *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;

  sub_2461C1A2C();
  OUTLINED_FUNCTION_45();
  v3 = OUTLINED_FUNCTION_63();
  if (v3)
  {
    if (*a1)
    {
      v4 = (void *)v3;
      v5 = *a1;
      OUTLINED_FUNCTION_71();

      v6 = OUTLINED_FUNCTION_6_0();
      sub_2461C19D0(v6, v7);
    }
    else
    {
      OUTLINED_FUNCTION_75();
      sub_2461CA220((uint64_t)&qword_2575587A0);
      OUTLINED_FUNCTION_34();
      __break(1u);
    }
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_74();
    __swift_project_value_buffer(v8, (uint64_t)qword_257559B40);
    OUTLINED_FUNCTION_72();
    v9 = OUTLINED_FUNCTION_69();
    if (OUTLINED_FUNCTION_52(v9, v10, v11, v12, v13, v14, v15, v16, v25, v27))
    {
      *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
      OUTLINED_FUNCTION_30(&dword_2461B8000, v17, v18, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v19, v20, v21, v22, v26, v28);
      OUTLINED_FUNCTION_7_0();
    }
    v23 = OUTLINED_FUNCTION_6_0();
    sub_2461C19D0(v23, v24);
    OUTLINED_FUNCTION_7_5(v28);
  }
}

void sub_2461CF724(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  OUTLINED_FUNCTION_4_0(a1, a2, a3);
  sub_2461E5B1C(v3);
  OUTLINED_FUNCTION_1();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_23_0();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3 + *(int *)(v1 + 20));
  OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_5(v4);
  v5 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_5(v5);
  OUTLINED_FUNCTION_33();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  OUTLINED_FUNCTION_2_6(*(_QWORD *)(v6 - 8));
  return OUTLINED_FUNCTION_6_5();
}

uint64_t sub_2461CF7F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_1(v2);
  return sub_2461CD92C(a1);
}

uint64_t sub_2461CF81C@<X0>(uint64_t a1@<X8>)
{
  return sub_2461CDA18(a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2461CF848()
{
  uint64_t v0;

  sub_2461BFCB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2461CF878()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_1();
}

void sub_2461CF894()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_1();
}

void sub_2461CF8B0()
{
  swift_retain();
  sub_2461E64C0();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461CF8D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2461CCA38(a1, a2);
}

unint64_t sub_2461CF8E0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_257558F90;
  if (!qword_257558F90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558718);
    v2 = sub_2461BFCC8();
    sub_2461CA54C((uint64_t)&qword_257558AC8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558F90);
  }
  return result;
}

uint64_t sub_2461CF964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2461CCABC(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_2461CF96C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_257558FA0;
  if (!qword_257558FA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558F98);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558738);
    v4[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558718);
    v4[4] = sub_2461BFCC8();
    v4[5] = sub_2461CF8E0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_2461CA54C((uint64_t)&qword_257558AC8);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257558FA0);
  }
  return result;
}

uint64_t sub_2461CFA3C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_retain();
  return result;
}

void sub_2461CFA48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461CFA74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_23_0();
  v4 = OUTLINED_FUNCTION_8_2();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (v3 + v1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);

  __swift_destroy_boxed_opaque_existential_1(v0 + v3 + *(int *)(v2 + 20));
  OUTLINED_FUNCTION_3_3();
  v7 = sub_2461E6214();
  OUTLINED_FUNCTION_27_0(v7);
  v8 = sub_2461E6394();
  OUTLINED_FUNCTION_27_0(v8);
  swift_release();
  v9 = v0 + v3 + *(int *)(v2 + 24);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v4);
  return swift_deallocObject();
}

void sub_2461CFB84()
{
  sub_2461CFEB0((uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
}

uint64_t sub_2461CFB90()
{
  uint64_t v0;

  return sub_2461E2D7C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2461CFB98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_11_1();
  v3 = v2 & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v4;

  __swift_destroy_boxed_opaque_existential_1(v5 + *(int *)(v1 + 20));
  OUTLINED_FUNCTION_3_3();
  v6 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_5(v6);
  v7 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_5(v7);
  OUTLINED_FUNCTION_33();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  OUTLINED_FUNCTION_2_6(*(_QWORD *)(v8 - 8));
  sub_2461C19D0(*(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8));
  return OUTLINED_FUNCTION_4_5();
}

void sub_2461CFC30()
{
  sub_2461CFFC0((uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
}

uint64_t sub_2461CFC3C(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_2461CFA3C(result, a2, BYTE1(a2) & 1);
  return result;
}

uint64_t sub_2461CFC4C(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD), uint64_t (*a5)(uint64_t, uint64_t, _QWORD), uint64_t (*a6)(uint64_t, uint64_t, _QWORD))
{
  if ((a3 & 1) != 0)
    return sub_2461CFC80(a1, a2, BYTE3(a2) & 1, a5, a6);
  else
    return a4(a1, a2, WORD1(a2) & 1);
}

uint64_t sub_2461CFC78(uint64_t a1, uint64_t a2)
{
  return sub_2461CFA3C(a1, a2, BYTE1(a2) & 1);
}

uint64_t sub_2461CFC80(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD), uint64_t (*a5)(uint64_t, uint64_t, _QWORD))
{
  if ((a3 & 1) != 0)
    return a5(a1, a2, WORD1(a2) & 1);
  else
    return a4(a1, a2, (a2 >> 8) & 1);
}

uint64_t sub_2461CFC94(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 64);
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
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t *sub_2461CFD14(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * a2);
    v7 = *v6;
    v8 = v6[1];
    *result = *v6;
    result[1] = v8;
    swift_bridgeObjectRetain();
    sub_2461C1A68(v7, v8);
    return (uint64_t *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_2461CFDB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4_0(a1, a2, a3);
  OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461CFDD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_42();
  type metadata accessor for GetContactAttributeMultiResultView();
  v4 = OUTLINED_FUNCTION_8_2();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (v3 + v1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (id *)(v0 + v3);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7 + *(int *)(v2 + 20));
  OUTLINED_FUNCTION_3_3();
  v8 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_0_5(v8);
  v9 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_5(v9);
  OUTLINED_FUNCTION_33();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v4);
  return OUTLINED_FUNCTION_4_5();
}

void sub_2461CFE70(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_4_0(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void sub_2461CFEA4()
{
  sub_2461CFEB0((uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
}

void sub_2461CFEB0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_14() - 8) + 80);
  sub_2461CF724(v1 + v4, v1 + ((v4 + v5 + v6) & ~v6), a1);
  OUTLINED_FUNCTION_66();
}

uint64_t sub_2461CFF10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_11_1();
  v3 = v2 & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v4;

  __swift_destroy_boxed_opaque_existential_1(v5 + *(int *)(v1 + 20));
  OUTLINED_FUNCTION_3_3();
  v6 = sub_2461E6214();
  OUTLINED_FUNCTION_2_3(v6);
  v7 = sub_2461E6394();
  OUTLINED_FUNCTION_2_3(v7);
  swift_release();
  sub_2461C19D0(*(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8));
  return OUTLINED_FUNCTION_6_5();
}

void sub_2461CFFB4()
{
  sub_2461CFFC0((uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeMultiResultView);
}

void sub_2461CFFC0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1(0) - 8) + 80);
  sub_2461CF604((id *)(v1 + ((v2 + 16) & ~v2)));
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_2461E6214();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_7_5(id a1)
{

}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_2461E5FA4();
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return 0x2E6567617373656DLL;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2461E5FA4();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_2461E6394();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_2461E6550();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 136))(v3, a1 + *(_QWORD *)(v1 + 128), v2);
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  uint64_t v1;

  return sub_2461C1A68(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 16 * a1), *(_QWORD *)(*(_QWORD *)(v1 + 56) + 16 * a1 + 8));
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return type metadata accessor for GetContactAttributeSingleResultView();
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  unint64_t v1;

  return sub_2461C19BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return __swift_storeEnumTagSinglePayload(*(_QWORD *)(v4 - 176), 1, 1, a4);
}

void OUTLINED_FUNCTION_30(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  os_log_type_t v10;
  uint8_t *v11;

  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_2461E646C();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 120))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_2461E6550();
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_2461CFA3C(v0, v1, v2);
}

void OUTLINED_FUNCTION_43(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 104) = a1;
  *(_BYTE *)(v3 - 92) = BYTE4(v2);
  *(_DWORD *)(v3 - 96) = v1;
  *(_BYTE *)(v3 - 91) = 0;
}

void OUTLINED_FUNCTION_44(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 104) = a1;
  *(_DWORD *)(v3 - 96) = v2 | v1;
}

uint64_t OUTLINED_FUNCTION_45()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2461C1A68(v1, v0);
}

uint64_t OUTLINED_FUNCTION_47()
{
  uint64_t v0;

  return v0 - 104;
}

void OUTLINED_FUNCTION_48(uint64_t a1@<X8>)
{
  __int16 v1;
  int v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 96) = a1;
  *(_BYTE *)(v3 - 86) = BYTE2(v2);
  *(_WORD *)(v3 - 88) = v1;
  *(_BYTE *)(v3 - 85) = 0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 184))();
}

BOOL OUTLINED_FUNCTION_52(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_2461E6178();
}

void OUTLINED_FUNCTION_58(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2461BFEF4(v2, a2);
}

void OUTLINED_FUNCTION_59(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_2461CFDB0(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_61()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_2461E6BE0();
}

void OUTLINED_FUNCTION_65()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_2461BFECC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_2461E61A8();
}

void OUTLINED_FUNCTION_68()
{
  JUMPOUT(0x2495531F8);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_2461E6BF8();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_2461E64B4();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_2461E6A0C();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_2461E62F8();
}

uint64_t OUTLINED_FUNCTION_73()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_2461E6310();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_2461E6A18();
}

void OUTLINED_FUNCTION_76()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = v0;
  *(_WORD *)(v2 - 96) = v1 & 0x1FF;
  *(_BYTE *)(v2 - 94) = 0;
}

void OUTLINED_FUNCTION_77(uint64_t a1)
{
  sub_2461CD6E8(a1);
}

unint64_t OUTLINED_FUNCTION_79(uint64_t a1)
{
  uint64_t v1;

  return sub_2461DDF6C(a1, v1);
}

BOOL sub_2461D0418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_18_1();
  v22 = v1;
  v23 = v2;
  v4 = v3;
  v6 = v5;
  v7 = v0;
  v8 = OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_2();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(id *)(v0 + *(int *)(v10 + 28) + 8);
  v14 = v6();

  if (v14 >> 62)
  {
    OUTLINED_FUNCTION_44_0();
    v15 = sub_2461E6D60();
    OUTLINED_FUNCTION_4();
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  OUTLINED_FUNCTION_4();
  sub_2461D56D8(v7, (uint64_t)v12);
  if (v15)
  {
    v16 = 0;
  }
  else
  {
    v17 = *(id *)&v12[*(int *)(v8 + 28) + 8];
    v18 = v4();

    v19 = *(_QWORD *)(v18 + 16);
    swift_bridgeObjectRelease();
    v16 = v19 == 0;
  }
  sub_2461D6A90((uint64_t)v12);
  return v16;
}

void sub_2461D0534(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *a1 = sub_2461E65F8();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590B0);
  sub_2461D0570(v1, (uint64_t)&a1[*(int *)(v3 + 44)]);
  OUTLINED_FUNCTION_1();
}

void sub_2461D0570(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ContactQuickActionButtonsView;
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
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v25 = a1;
  v29 = a2;
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v4 = *(_QWORD *)(ContactQuickActionButtonsView - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590B8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v28 = (uint64_t)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v27 = (uint64_t)v24 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v26 = (char *)v24 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v24 - v14;
  v30 = sub_2461E60C4();
  sub_2461D56D8(a1, (uint64_t)v6);
  v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v24[1] = v16 + v5;
  v17 = swift_allocObject();
  sub_2461BFE3C((uint64_t)v6, v17 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575590C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575590C8);
  sub_2461BFDA4(&qword_2575590D0, &qword_2575590C0);
  sub_2461D572C();
  sub_2461BFC14(&qword_257559100, (void (*)(uint64_t))MEMORY[0x24BE91D28]);
  sub_2461E6880();
  v30 = sub_2461E60B8();
  sub_2461D56D8(v25, (uint64_t)v6);
  v18 = swift_allocObject();
  sub_2461BFE3C((uint64_t)v6, v18 + v16);
  v19 = (uint64_t)v26;
  sub_2461E6880();
  v20 = v27;
  sub_2461C7C70((uint64_t)v15, v27, &qword_2575590B8);
  v21 = v28;
  sub_2461C7C70(v19, v28, &qword_2575590B8);
  v22 = v29;
  sub_2461C7C70(v20, v29, &qword_2575590B8);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559108);
  sub_2461C7C70(v21, v22 + *(int *)(v23 + 48), &qword_2575590B8);
  sub_2461C7F84(v19, &qword_2575590B8);
  sub_2461C7F84((uint64_t)v15, &qword_2575590B8);
  sub_2461C7F84(v21, &qword_2575590B8);
  sub_2461C7F84(v20, &qword_2575590B8);
}

uint64_t sub_2461D087C@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ContactQuickActionButtonsView;
  char *v13;
  char v14;
  id v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559110);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590C8);
  MEMORY[0x24BDAC7A8](v30);
  v31 = (uint64_t)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  if (*a2)
  {
    v13 = (char *)a2 + *(int *)(ContactQuickActionButtonsView + 28);
    v14 = *(_BYTE *)(*((_QWORD *)v13 + 1)
                   + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground);
    v15 = *a2;
    sub_2461E6A00();

    *v10 = sub_2461E6C40() & 1;
    v10[1] = v14;
    v16 = sub_2461D0B98(a1, (uint64_t)&v10[*(int *)(v8 + 56)]);
    v17 = &v10[*(int *)(v8 + 60)];
    MEMORY[0x24BDAC7A8](v16);
    *(&v27 - 2) = (uint64_t)a2;
    *(&v27 - 1) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559118);
    sub_2461BFDA4(&qword_257559120, &qword_257559118);
    sub_2461E682C();
    v18 = *(_QWORD *)(*((_QWORD *)v13 + 1)
                    + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor);
    v20 = v28;
    v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v17, v7, v29);
    *(_QWORD *)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257559128) + 36)] = v18;
    v21 = *(void (**)(char *, uint64_t))(v20 + 8);
    swift_retain();
    v21(v7, v19);
    LOBYTE(v18) = sub_2461D23DC(a1);
    KeyPath = swift_getKeyPath();
    v23 = swift_allocObject();
    *(_BYTE *)(v23 + 16) = v18 & 1;
    v24 = v31;
    sub_2461C7C70((uint64_t)v10, v31, &qword_2575590E8);
    v25 = (uint64_t *)(v24 + *(int *)(v30 + 36));
    *v25 = KeyPath;
    v25[1] = (uint64_t)sub_2461D846C;
    v25[2] = v23;
    sub_2461C7F84((uint64_t)v10, &qword_2575590E8);
    return sub_2461D6A48(v24, v32);
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2461E646C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2461D0B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t ContactQuickActionButtonsView;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  id v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  char *v66;
  char *v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  void (*v103)(char *, char *, uint64_t);
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(char *, uint64_t);
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t result;
  id v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  void (*v126)(char *, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  char *v136;
  unint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  void (*v147)(char *, char *, uint64_t);
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(char *, uint64_t);
  char *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;

  v3 = v2;
  v186 = a2;
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559130);
  v157 = *(_QWORD *)(v168 - 8);
  MEMORY[0x24BDAC7A8](v168);
  v156 = (char *)&v154 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559138);
  MEMORY[0x24BDAC7A8](v165);
  v166 = (uint64_t)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559140);
  MEMORY[0x24BDAC7A8](v178);
  v167 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559148);
  v155 = *(_QWORD *)(v164 - 8);
  MEMORY[0x24BDAC7A8](v164);
  v154 = (char *)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559150);
  MEMORY[0x24BDAC7A8](v182);
  v184 = (uint64_t)&v154 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559158);
  MEMORY[0x24BDAC7A8](v174);
  v177 = (uint64_t)&v154 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559160);
  MEMORY[0x24BDAC7A8](v161);
  v162 = (uint64_t)&v154 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559168);
  MEMORY[0x24BDAC7A8](v183);
  v173 = (char *)&v154 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559170);
  MEMORY[0x24BDAC7A8](v175);
  v163 = (char *)&v154 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559178);
  MEMORY[0x24BDAC7A8](v181);
  v179 = (char *)&v154 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559180);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v158 = (char *)&v154 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v180 = (uint64_t)&v154 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v172 = (uint64_t)&v154 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v160 = (char *)&v154 - v22;
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v24 = *(_QWORD *)(ContactQuickActionButtonsView - 8);
  v25 = *(_QWORD *)(v24 + 64);
  MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v26 = (char *)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559188);
  v171 = *(_QWORD *)(v176 - 8);
  v27 = MEMORY[0x24BDAC7A8](v176);
  v159 = (char *)&v154 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v154 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v170 = (char *)&v154 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v169 = (uint64_t)&v154 - v34;
  v35 = sub_2461E60D0();
  v36 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v154 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v38, a1, v35);
  v39 = v38;
  v40 = v3;
  v41 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v39, v35);
  v42 = *MEMORY[0x24BE91D08];
  v185 = v3;
  if (v41 == v42)
  {
    v43 = v3 + *(int *)(ContactQuickActionButtonsView + 28);
    v44 = *(id *)(v43 + 8);
    sub_2461DE5A0();
    v46 = v45;

    v187 = v46;
    sub_2461D56D8(v40, (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
    v47 = *(unsigned __int8 *)(v24 + 80);
    v48 = (v47 + 16) & ~v47;
    v164 = v47 | 7;
    v49 = swift_allocObject();
    v169 = (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2461BFE3C(v169, v49 + v48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559190);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559198);
    sub_2461BFDA4(&qword_2575591A0, &qword_257559190);
    sub_2461BFDA4(&qword_2575591A8, &qword_257559198);
    sub_2461BFC14(&qword_2575591B0, (void (*)(uint64_t))MEMORY[0x24BE91CD0]);
    sub_2461E6880();
    v50 = *(id *)(v43 + 8);
    v51 = sub_2461DE6A8();

    v52 = *(_QWORD *)(v51 + 16);
    swift_bridgeObjectRelease();
    v53 = v31;
    if (v52)
    {
      v54 = v50;
      sub_2461DE6A8();

      v55 = swift_bridgeObjectRetain();
      v56 = (char *)sub_2461D6B5C(v55);
      swift_bridgeObjectRelease();
      v187 = v56;
      sub_2461D6AF4(&v187);
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      v57 = v169;
      sub_2461D56D8(v185, v169);
      v58 = swift_allocObject();
      sub_2461BFE3C(v57, v58 + v48);
      v59 = swift_allocObject();
      *(_QWORD *)(v59 + 16) = sub_2461D6F04;
      *(_QWORD *)(v59 + 24) = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575591B8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575591C0);
      sub_2461BFDA4(&qword_2575591C8, &qword_2575591B8);
      sub_2461BFDA4(&qword_2575591D0, &qword_2575591C0);
      v60 = v180;
      sub_2461E6874();
      v61 = 0;
    }
    else
    {
      v61 = 1;
      v60 = v180;
    }
    v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591D8);
    __swift_storeEnumTagSinglePayload(v60, v61, 1, v99);
    v100 = v60;
    v102 = v170;
    v101 = v171;
    v103 = *(void (**)(char *, char *, uint64_t))(v171 + 16);
    v104 = v31;
    v105 = v176;
    v103(v170, v104, v176);
    v106 = v172;
    sub_2461C7C70(v100, v172, &qword_257559180);
    v107 = (uint64_t)v173;
    v103(v173, v102, v105);
    v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591E0);
    sub_2461C7C70(v106, v107 + *(int *)(v108 + 48), &qword_257559180);
    sub_2461C7F84(v106, &qword_257559180);
    v109 = *(void (**)(char *, uint64_t))(v101 + 8);
    v109(v102, v105);
    sub_2461C7C70(v107, v166, &qword_257559168);
    swift_storeEnumTagMultiPayload();
    sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
    sub_2461D6E30(&qword_257559210, &qword_257559130, &qword_257559218, &qword_257559220);
    v110 = v53;
    v111 = (uint64_t)v167;
    sub_2461E6550();
    sub_2461C7F84(v107, &qword_257559168);
    sub_2461C7C70(v111, v177, &qword_257559140);
    swift_storeEnumTagMultiPayload();
    sub_2461D6CE8();
    sub_2461D6D8C();
    v112 = (uint64_t)v179;
    sub_2461E6550();
    sub_2461C7F84(v111, &qword_257559140);
    sub_2461C7C70(v112, v184, &qword_257559178);
    swift_storeEnumTagMultiPayload();
    sub_2461D6C7C();
    sub_2461E6550();
    sub_2461C7F84(v112, &qword_257559178);
    sub_2461C7F84(v180, &qword_257559180);
    return ((uint64_t (*)(char *, uint64_t))v109)(v110, v105);
  }
  else if (v41 == *MEMORY[0x24BE91CF8])
  {
    v62 = *(int *)(ContactQuickActionButtonsView + 28);
    v63 = v185;
    v64 = v185 + v62;
    v65 = *(id *)(v185 + v62 + 8);
    sub_2461DE594();
    v67 = v66;

    v187 = v67;
    v68 = (char *)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2461D56D8(v63, (uint64_t)v68);
    v69 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    v70 = swift_allocObject();
    sub_2461BFE3C((uint64_t)v68, v70 + v69);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559190);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559198);
    sub_2461BFDA4(&qword_2575591A0, &qword_257559190);
    sub_2461BFDA4(&qword_2575591A8, &qword_257559198);
    sub_2461BFC14(&qword_2575591B0, (void (*)(uint64_t))MEMORY[0x24BE91CD0]);
    sub_2461E6880();
    v71 = *(id *)(v64 + 8);
    v72 = sub_2461DE680();

    v73 = *(_QWORD *)(v72 + 16);
    swift_bridgeObjectRelease();
    if (v73)
    {
      v74 = v71;
      sub_2461DE680();

      v75 = swift_bridgeObjectRetain();
      v76 = (char *)sub_2461D6B5C(v75);
      swift_bridgeObjectRelease();
      v187 = v76;
      sub_2461D6AF4(&v187);
      swift_bridgeObjectRelease();
      swift_getKeyPath();
      sub_2461D56D8(v185, (uint64_t)v68);
      v77 = swift_allocObject();
      sub_2461BFE3C((uint64_t)v68, v77 + v69);
      v78 = swift_allocObject();
      *(_QWORD *)(v78 + 16) = sub_2461D6FA8;
      *(_QWORD *)(v78 + 24) = v77;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575591B8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575591C0);
      sub_2461BFDA4(&qword_2575591C8, &qword_2575591B8);
      sub_2461BFDA4(&qword_2575591D0, &qword_2575591C0);
      v79 = (uint64_t)v160;
      sub_2461E6874();
      v80 = 0;
    }
    else
    {
      v80 = 1;
      v79 = (uint64_t)v160;
    }
    v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591D8);
    __swift_storeEnumTagSinglePayload(v79, v80, 1, v123);
    v125 = v170;
    v124 = v171;
    v126 = *(void (**)(char *, uint64_t, uint64_t))(v171 + 16);
    v127 = v176;
    v126(v170, v169, v176);
    v128 = v172;
    sub_2461C7C70(v79, v172, &qword_257559180);
    v129 = (uint64_t)v173;
    v126(v173, (uint64_t)v125, v127);
    v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591E0);
    sub_2461C7C70(v128, v129 + *(int *)(v130 + 48), &qword_257559180);
    sub_2461C7F84(v128, &qword_257559180);
    v131 = *(void (**)(char *, uint64_t))(v124 + 8);
    v131(v125, v127);
    sub_2461C7C70(v129, v162, &qword_257559168);
    swift_storeEnumTagMultiPayload();
    sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
    sub_2461D6E30(&qword_257559200, &qword_257559148, &qword_2575591A8, &qword_257559198);
    v132 = v79;
    v133 = (uint64_t)v163;
    sub_2461E6550();
    sub_2461C7F84(v129, &qword_257559168);
    sub_2461C7C70(v133, v177, &qword_257559170);
    swift_storeEnumTagMultiPayload();
    sub_2461D6CE8();
    sub_2461D6D8C();
    v134 = (uint64_t)v179;
    sub_2461E6550();
    sub_2461C7F84(v133, &qword_257559170);
    sub_2461C7C70(v134, v184, &qword_257559178);
    swift_storeEnumTagMultiPayload();
    sub_2461D6C7C();
    sub_2461E6550();
    sub_2461C7F84(v134, &qword_257559178);
    sub_2461C7F84(v132, &qword_257559180);
    return ((uint64_t (*)(uint64_t, uint64_t))v131)(v169, v127);
  }
  else
  {
    v81 = v185;
    if (v41 == *MEMORY[0x24BE91D20])
    {
      v82 = v185 + *(int *)(ContactQuickActionButtonsView + 28);
      v83 = *(id *)(v82 + 8);
      sub_2461DE64C();
      v85 = v84;

      v187 = v85;
      sub_2461D56D8(v81, (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
      v86 = *(unsigned __int8 *)(v24 + 80);
      v87 = (v86 + 16) & ~v86;
      v180 = v86 | 7;
      v88 = swift_allocObject();
      sub_2461BFE3C((uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v88 + v87);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559190);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559198);
      sub_2461BFDA4(&qword_2575591A0, &qword_257559190);
      sub_2461BFDA4(&qword_2575591A8, &qword_257559198);
      sub_2461BFC14(&qword_2575591B0, (void (*)(uint64_t))MEMORY[0x24BE91CD0]);
      sub_2461E6880();
      v89 = *(id *)(v82 + 8);
      v90 = sub_2461DE6D0();

      v91 = *(_QWORD *)(v90 + 16);
      swift_bridgeObjectRelease();
      if (v91)
      {
        v92 = v89;
        sub_2461DE6D0();

        v93 = swift_bridgeObjectRetain();
        v94 = (char *)sub_2461D6B5C(v93);
        swift_bridgeObjectRelease();
        v187 = v94;
        sub_2461D6AF4(&v187);
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        sub_2461D56D8(v185, (uint64_t)v26);
        v95 = swift_allocObject();
        sub_2461BFE3C((uint64_t)v26, v95 + v87);
        v96 = swift_allocObject();
        *(_QWORD *)(v96 + 16) = sub_2461D6C40;
        *(_QWORD *)(v96 + 24) = v95;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2575591B8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2575591C0);
        sub_2461BFDA4(&qword_2575591C8, &qword_2575591B8);
        sub_2461BFDA4(&qword_2575591D0, &qword_2575591C0);
        v97 = (uint64_t)v158;
        sub_2461E6874();
        v98 = 0;
      }
      else
      {
        v98 = 1;
        v97 = (uint64_t)v158;
      }
      v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591D8);
      __swift_storeEnumTagSinglePayload(v97, v98, 1, v144);
      v146 = v170;
      v145 = v171;
      v147 = *(void (**)(char *, char *, uint64_t))(v171 + 16);
      v148 = v159;
      v149 = v176;
      v147(v170, v159, v176);
      v150 = v172;
      sub_2461C7C70(v97, v172, &qword_257559180);
      v151 = (uint64_t)v173;
      v147(v173, v146, v149);
      v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575591E0);
      sub_2461C7C70(v150, v151 + *(int *)(v152 + 48), &qword_257559180);
      sub_2461C7F84(v150, &qword_257559180);
      v153 = *(void (**)(char *, uint64_t))(v145 + 8);
      v153(v146, v149);
      sub_2461C7C70(v151, v184, &qword_257559168);
      swift_storeEnumTagMultiPayload();
      sub_2461D6C7C();
      sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
      sub_2461E6550();
      sub_2461C7F84(v151, &qword_257559168);
      sub_2461C7F84(v97, &qword_257559180);
      return ((uint64_t (*)(char *, uint64_t))v153)(v148, v149);
    }
    else if (v41 == *MEMORY[0x24BE91D00])
    {
      v114 = objc_msgSend(*(id *)(v185 + *(int *)(ContactQuickActionButtonsView + 24)), sel_emailAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559228);
      v115 = (char *)sub_2461E6B2C();

      v187 = v115;
      swift_getKeyPath();
      sub_2461D56D8(v81, (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
      v116 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v117 = swift_allocObject();
      sub_2461BFE3C((uint64_t)v26, v117 + v116);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559230);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559198);
      sub_2461BFDA4(&qword_257559240, &qword_257559230);
      sub_2461BFDA4(&qword_2575591A8, &qword_257559198);
      v118 = v154;
      sub_2461E6874();
      v119 = v155;
      v120 = v164;
      (*(void (**)(uint64_t, char *, uint64_t))(v155 + 16))(v162, v118, v164);
      swift_storeEnumTagMultiPayload();
      sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
      sub_2461D6E30(&qword_257559200, &qword_257559148, &qword_2575591A8, &qword_257559198);
      v121 = (uint64_t)v163;
      sub_2461E6550();
      sub_2461C7C70(v121, v177, &qword_257559170);
      swift_storeEnumTagMultiPayload();
      sub_2461D6CE8();
      sub_2461D6D8C();
      v122 = (uint64_t)v179;
      sub_2461E6550();
      sub_2461C7F84(v121, &qword_257559170);
      sub_2461C7C70(v122, v184, &qword_257559178);
      swift_storeEnumTagMultiPayload();
      sub_2461D6C7C();
      sub_2461E6550();
      sub_2461C7F84(v122, &qword_257559178);
      return (*(uint64_t (**)(char *, uint64_t))(v119 + 8))(v118, v120);
    }
    else if (v41 == *MEMORY[0x24BE91D18])
    {
      v135 = objc_msgSend(*(id *)(v185 + *(int *)(ContactQuickActionButtonsView + 24)), sel_postalAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559228);
      v136 = (char *)sub_2461E6B2C();

      v187 = v136;
      swift_getKeyPath();
      sub_2461D56D8(v81, (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
      v137 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v138 = swift_allocObject();
      sub_2461BFE3C((uint64_t)v26, v138 + v137);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559230);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257559220);
      sub_2461BFDA4(&qword_257559238, &qword_257559230);
      sub_2461BFDA4(&qword_257559218, &qword_257559220);
      v139 = v156;
      sub_2461E6874();
      v140 = v157;
      v141 = v168;
      (*(void (**)(uint64_t, char *, uint64_t))(v157 + 16))(v166, v139, v168);
      swift_storeEnumTagMultiPayload();
      sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
      sub_2461D6E30(&qword_257559210, &qword_257559130, &qword_257559218, &qword_257559220);
      v142 = (uint64_t)v167;
      sub_2461E6550();
      sub_2461C7C70(v142, v177, &qword_257559140);
      swift_storeEnumTagMultiPayload();
      sub_2461D6CE8();
      sub_2461D6D8C();
      v143 = (uint64_t)v179;
      sub_2461E6550();
      sub_2461C7F84(v142, &qword_257559140);
      sub_2461C7C70(v143, v184, &qword_257559178);
      swift_storeEnumTagMultiPayload();
      sub_2461D6C7C();
      sub_2461E6550();
      sub_2461C7F84(v143, &qword_257559178);
      return (*(uint64_t (**)(char *, uint64_t))(v140 + 8))(v139, v141);
    }
    else
    {
      result = sub_2461E6D90();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2461D23DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = sub_2461E60D0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v7 == *MEMORY[0x24BE91D08])
  {
    v8 = *(id *)(v1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
    sub_2461DE5A0();
    v10 = v9;

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_2461E6D60();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    return v11 == 0;
  }
  if (v7 == *MEMORY[0x24BE91CF8] || v7 == *MEMORY[0x24BE91D20])
    return sub_2461D0418();
  if (v7 == *MEMORY[0x24BE91D00])
  {
    v15 = *(id *)(v1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
    v16 = sub_2461E6220();
LABEL_16:
    v17 = v16;

    v18 = *(_QWORD *)(v17 + 16);
    swift_bridgeObjectRelease();
    return v18 == 0;
  }
  if (v7 == *MEMORY[0x24BE91D18])
  {
    v15 = *(id *)(v1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
    v16 = sub_2461E6238();
    goto LABEL_16;
  }
  result = sub_2461E6D90();
  __break(1u);
  return result;
}

uint64_t sub_2461D25F8@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ContactQuickActionButtonsView;
  char *v13;
  char v14;
  id v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559110);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590C8);
  MEMORY[0x24BDAC7A8](v30);
  v31 = (uint64_t)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  if (*a2)
  {
    v13 = (char *)a2 + *(int *)(ContactQuickActionButtonsView + 28);
    v14 = *(_BYTE *)(*((_QWORD *)v13 + 1)
                   + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground);
    v15 = *a2;
    sub_2461E6A00();

    *v10 = sub_2461E6C40() & 1;
    v10[1] = v14;
    v16 = sub_2461D0B98(a1, (uint64_t)&v10[*(int *)(v8 + 56)]);
    v17 = &v10[*(int *)(v8 + 60)];
    MEMORY[0x24BDAC7A8](v16);
    *(&v27 - 2) = (uint64_t)a2;
    *(&v27 - 1) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559118);
    sub_2461BFDA4(&qword_257559120, &qword_257559118);
    sub_2461E682C();
    v18 = *(_QWORD *)(*((_QWORD *)v13 + 1)
                    + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor);
    v20 = v28;
    v19 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v17, v7, v29);
    *(_QWORD *)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257559128) + 36)] = v18;
    v21 = *(void (**)(char *, uint64_t))(v20 + 8);
    swift_retain();
    v21(v7, v19);
    LOBYTE(v18) = sub_2461D23DC(a1);
    KeyPath = swift_getKeyPath();
    v23 = swift_allocObject();
    *(_BYTE *)(v23 + 16) = v18 & 1;
    v24 = v31;
    sub_2461C7C70((uint64_t)v10, v31, &qword_2575590E8);
    v25 = (uint64_t *)(v24 + *(int *)(v30 + 36));
    *v25 = KeyPath;
    v25[1] = (uint64_t)sub_2461D6A30;
    v25[2] = v23;
    sub_2461C7F84((uint64_t)v10, &qword_2575590E8);
    return sub_2461D6A48(v24, v32);
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2461E646C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2461D2914(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  sub_2461DE8B0(a2);

  sub_2461E2BF8();
  sub_2461BFC74();
  return sub_2461E67FC();
}

uint64_t sub_2461D29B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559278);
  sub_2461BFDA4(&qword_257559280, &qword_257559278);
  return sub_2461E67F0();
}

uint64_t sub_2461D2A4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E67E4();
  *a1 = result;
  return result;
}

uint64_t sub_2461D2A80@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_2461E6D60();
    if (v4)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
    goto LABEL_8;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x249553D14](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      v10 = (id)MEMORY[0x249553D14](0, a1);
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    v5 = *(id *)(a1 + 32);
  }
  v6 = v5;
  swift_bridgeObjectRelease();
  sub_2461E6064();

LABEL_9:
  sub_2461E6AD8();
  v8 = v7;
  result = swift_bridgeObjectRelease();
  if (v8 || !v4)
    goto LABEL_15;
  if ((a1 & 0xC000000000000001) != 0)
    goto LABEL_18;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(id *)(a1 + 32);
LABEL_14:
    sub_2461E6094();

LABEL_15:
    sub_2461BFC74();
    result = sub_2461E66AC();
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v11;
    *(_BYTE *)(a2 + 16) = v12 & 1;
    *(_QWORD *)(a2 + 24) = v13;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2461D2C10(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE v12[16];
  uint64_t v13;
  void *v14;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v5 = *(_QWORD *)(ContactQuickActionButtonsView - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v7 = *a1;
  sub_2461D56D8(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  sub_2461BFE3C((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  *(_QWORD *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  v13 = a2;
  v14 = v7;
  v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575592B0);
  sub_2461BFDA4(&qword_2575592B8, &qword_2575592B0);
  return sub_2461E682C();
}

uint64_t sub_2461D2D34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559278);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)a3 = sub_2461E6544();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v10 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575592D0) + 44);
  v15 = a1;
  v16 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559288);
  sub_2461BFDA4(&qword_257559290, &qword_257559288);
  sub_2461E6388();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(v10, v9, v6);
  v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575592D8) + 36);
  *(_QWORD *)v12 = KeyPath;
  *(_BYTE *)(v12 + 8) = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2461D2E6C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v30;
  unint64_t v31;

  v5 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  v6 = objc_msgSend(a2, sel_identifier);
  v7 = sub_2461E6A78();
  v9 = v8;

  v10 = sub_2461DE9B0(v7, v9);
  v12 = v11;

  swift_bridgeObjectRelease();
  if (v12)
    v13 = v10;
  else
    v13 = 0;
  v14 = 0xE000000000000000;
  if (v12)
    v14 = v12;
  v30 = v13;
  v31 = v14;
  sub_2461BFC74();
  v15 = sub_2461E66AC();
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  v22 = objc_msgSend(a2, sel_value, v30, v31);
  sub_2461E6A78();

  v23 = sub_2461E66AC();
  v25 = v24;
  v27 = v26 & 1;
  *(_QWORD *)a3 = v15;
  *(_QWORD *)(a3 + 8) = v17;
  *(_BYTE *)(a3 + 16) = v21;
  *(_QWORD *)(a3 + 24) = v19;
  *(_QWORD *)(a3 + 32) = v23;
  *(_QWORD *)(a3 + 40) = v24;
  *(_BYTE *)(a3 + 48) = v26 & 1;
  *(_QWORD *)(a3 + 56) = v28;
  sub_2461C7050(v15, v17, v21);
  swift_bridgeObjectRetain();
  sub_2461C7050(v23, v25, v27);
  swift_bridgeObjectRetain();
  sub_2461BFCB0(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_2461BFCB0(v15, v17, v21);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461D3030@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E67E4();
  *a1 = result;
  return result;
}

void sub_2461D3068()
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

  v0 = OUTLINED_FUNCTION_11_2();
  v1 = MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_6_6(v1, v2, v3, v4, v5, v6, v7, v8, v10);
  v9 = OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_36_0(v9);
  OUTLINED_FUNCTION_50_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575592B0);
  sub_2461BFDA4(&qword_2575592B8, &qword_2575592B0);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_0_3();
}

void sub_2461D30E4(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  os_log_t v29;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v28 - v6;
  v8 = objc_retain(*(id *)((char *)a1
                         + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28)
                         + 8));
  v9 = sub_2461E6244();

  v10 = sub_2461E6070();
  if (!*(_QWORD *)(v9 + 16) || (v12 = sub_2461DDF6C(v10, v11), (v13 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2575585B8 != -1)
      swift_once();
    v22 = sub_2461E6310();
    __swift_project_value_buffer(v22, (uint64_t)qword_257559B40);
    v29 = (os_log_t)sub_2461E62F8();
    v23 = sub_2461E6BF8();
    if (os_log_type_enabled(v29, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2461B8000, v29, v23, "#GetContactQuickActionButtonsView could not obtain direct invocation for button press", v24, 2u);
      MEMORY[0x249554254](v24, -1, -1);
    }
    goto LABEL_15;
  }
  v14 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v12);
  v16 = *v14;
  v15 = v14[1];
  sub_2461C1A68(*v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2461C1A2C();
  v17 = sub_2461E6BE0();
  if (!v17)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v25 = sub_2461E6310();
    __swift_project_value_buffer(v25, (uint64_t)qword_257559B40);
    v29 = (os_log_t)sub_2461E62F8();
    v26 = sub_2461E6BF8();
    if (os_log_type_enabled(v29, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2461B8000, v29, v26, "#GetContactQuickActionButtonsView could not convert direct invocation to actionable command", v27, 2u);
      MEMORY[0x249554254](v27, -1, -1);
    }
    sub_2461C19D0(v16, v15);
LABEL_15:

    return;
  }
  v18 = (void *)v17;
  v19 = sub_2461E60D0();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v19);
  sub_2461C7C70((uint64_t)v7, (uint64_t)v5, &qword_257558708);
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  sub_2461E6814();
  sub_2461C7F84((uint64_t)v7, &qword_257558708);
  if (*a1)
  {
    v20 = *a1;
    v21 = v18;
    sub_2461E6A0C();

    sub_2461C19D0(v16, v15);
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2461E646C();
    __break(1u);
  }
}

void sub_2461D3490()
{
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_37_0(&qword_2575592C8);
  sub_2461E67F0();
  OUTLINED_FUNCTION_26();
}

void sub_2461D3514()
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
  uint64_t KeyPath;
  uint64_t v10;
  _QWORD v11[4];

  OUTLINED_FUNCTION_18_1();
  v1 = v0;
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559278);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v3 = sub_2461E6544();
  *(_QWORD *)(v3 + 8) = 0;
  *(_BYTE *)(v3 + 16) = 1;
  v8 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575592D0) + 44);
  v11[2] = v1;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_37_0(&qword_257559290);
  sub_2461E6388();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v8, v7, v4);
  v10 = v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575592D8) + 36);
  *(_QWORD *)v10 = KeyPath;
  *(_BYTE *)(v10 + 8) = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_0_6();
}

void sub_2461D3634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  OUTLINED_FUNCTION_18_1();
  v1 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_25_0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v9[1] = v3;
  sub_2461D56D8(v1, (uint64_t)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  sub_2461BFE3C((uint64_t)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_27_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559260);
  OUTLINED_FUNCTION_37_0(&qword_2575591A0);
  sub_2461BFDA4(&qword_257559258, &qword_257559260);
  sub_2461BFC14(&qword_2575591B0, (void (*)(uint64_t))MEMORY[0x24BE91CD0]);
  sub_2461E6880();
  OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2461D3788(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE v12[16];
  void *v13;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v5 = *(_QWORD *)(ContactQuickActionButtonsView - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v7 = *a1;
  sub_2461D56D8(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  sub_2461BFE3C((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  v13 = v7;
  v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559268);
  sub_2461BFDA4(&qword_257559270, &qword_257559268);
  return sub_2461E682C();
}

void sub_2461D3898(uint64_t a1, void **a2)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[2];
  void **v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = sub_2461E5FD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2461E5FA4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v43 - v15;
  sub_2461E607C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_2461C7F84((uint64_t)v9, &qword_257558FA8);
    if (qword_2575585B8 != -1)
      swift_once();
    v17 = sub_2461E6310();
    __swift_project_value_buffer(v17, (uint64_t)qword_257559B40);
    v18 = sub_2461E62F8();
    v19 = sub_2461E6BEC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2461B8000, v18, v19, "#GetContactQuickActionButtonsView message tapped but no URL available", v20, 2u);
      MEMORY[0x249554254](v20, -1, -1);
    }

  }
  else
  {
    v46 = v6;
    v47 = v4;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    if (qword_2575585B8 != -1)
      swift_once();
    v21 = sub_2461E6310();
    __swift_project_value_buffer(v21, (uint64_t)qword_257559B40);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    v22 = sub_2461E62F8();
    v23 = sub_2461E6BEC();
    v24 = os_log_type_enabled(v22, v23);
    v45 = v3;
    if (v24)
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v49 = v26;
      v44 = a2;
      *(_DWORD *)v25 = 136315138;
      v43[1] = v25 + 4;
      v27 = sub_2461E5F80();
      v48 = sub_2461D5F20(v27, v28, &v49);
      a2 = v44;
      sub_2461E6CB8();
      swift_bridgeObjectRelease();
      v29 = *(void (**)(char *, uint64_t))(v11 + 8);
      v29(v14, v10);
      _os_log_impl(&dword_2461B8000, v22, v23, "#GetContactQuickActionButtonsView opening URL %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249554254](v26, -1, -1);
      MEMORY[0x249554254](v25, -1, -1);
    }
    else
    {
      v29 = *(void (**)(char *, uint64_t))(v11 + 8);
      v29(v14, v10);
    }

    v30 = v46;
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    sub_2461D7AA0(v31);
    v33 = v32;
    swift_bridgeObjectRelease();
    v34 = v47;
    if (!v33)
    {
      v35 = v31;
      sub_2461E5FC8();
      v36 = sub_2461E5FBC();
      v38 = v37;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v45);
      sub_2461D7B0C(v36, v38, v35);

    }
    v39 = (void *)sub_2461E5F8C();
    objc_msgSend(v31, sel_setPunchOutUri_, v39);

    v40 = *a2;
    if (*a2)
    {
      v41 = v31;
      v42 = v40;
      sub_2461E6A0C();

      v29(v16, v10);
    }
    else
    {
      sub_2461E6A18();
      sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
      sub_2461E646C();
      __break(1u);
    }
  }
}

uint64_t sub_2461D3D34()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559278);
  sub_2461BFDA4(&qword_257559280, &qword_257559278);
  return sub_2461E67F0();
}

uint64_t sub_2461D3DC8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559288);
  sub_2461BFDA4(&qword_257559290, &qword_257559288);
  return sub_2461E6388();
}

uint64_t sub_2461D3E40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E67E4();
  *a1 = result;
  return result;
}

void sub_2461D3E78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_identifier);
  v4 = sub_2461E6A78();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
  OUTLINED_FUNCTION_66();
}

uint64_t sub_2461D3EC4(void **a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE v12[16];
  uint64_t v13;
  void *v14;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  v5 = *(_QWORD *)(ContactQuickActionButtonsView - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](ContactQuickActionButtonsView);
  v7 = *a1;
  sub_2461D56D8(a2, (uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  sub_2461BFE3C((uint64_t)&v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8);
  *(_QWORD *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  v13 = a2;
  v14 = v7;
  v10 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575592E8);
  sub_2461BFDA4(&qword_2575592F0, &qword_2575592E8);
  return sub_2461E682C();
}

void sub_2461D3FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t (*v3)(void);
  void *v4;
  void *v5;
  id *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_18_1();
  v37 = v0;
  v38 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
  OUTLINED_FUNCTION_2();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v35 - v12;
  v14 = *(id *)((char *)v7 + *(int *)(OUTLINED_FUNCTION_25_0() + 28) + 8);
  v15 = v3();

  v16 = objc_msgSend(v5, sel_identifier);
  v17 = sub_2461E6A78();
  v19 = v18;

  if (!*(_QWORD *)(v15 + 16) || (v20 = sub_2461DDF6C(v17, v19), (v21 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4();
    if (qword_2575585B8 != -1)
      swift_once();
    v29 = sub_2461E6310();
    __swift_project_value_buffer(v29, (uint64_t)qword_257559B40);
    v36 = (os_log_t)sub_2461E62F8();
    v30 = sub_2461E6BF8();
    if (os_log_type_enabled(v36, v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2461B8000, v36, v30, "#GetContactQuickActionButtonsView could not obtain direct invocation for button press", v31, 2u);
      OUTLINED_FUNCTION_7_0();
    }
    goto LABEL_15;
  }
  sub_2461C1A68(*(_QWORD *)(*(_QWORD *)(v15 + 56) + 16 * v20), *(_QWORD *)(*(_QWORD *)(v15 + 56) + 16 * v20 + 8));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4();
  sub_2461C1A2C();
  v22 = sub_2461E6BE0();
  if (!v22)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v32 = sub_2461E6310();
    __swift_project_value_buffer(v32, (uint64_t)qword_257559B40);
    v36 = (os_log_t)sub_2461E62F8();
    v33 = sub_2461E6BF8();
    if (os_log_type_enabled(v36, v33))
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2461B8000, v36, v33, "#GetContactQuickActionButtonsView could not convert direct invocation to actionable command", v34, 2u);
      OUTLINED_FUNCTION_7_0();
    }
    OUTLINED_FUNCTION_40_0();
LABEL_15:

    return;
  }
  v23 = (void *)v22;
  v24 = sub_2461E60D0();
  OUTLINED_FUNCTION_49_0((uint64_t)v13, v25, v26, v24);
  sub_2461C7C70((uint64_t)v13, (uint64_t)v11, &qword_257558708);
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  sub_2461E6814();
  sub_2461C7F84((uint64_t)v13, &qword_257558708);
  if (*v7)
  {
    v27 = *v7;
    v28 = v23;
    sub_2461E6A0C();

    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2461E646C();
    __break(1u);
  }
}

void sub_2461D434C(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_37_0(a4);
  sub_2461E67F0();
  OUTLINED_FUNCTION_26();
}

uint64_t sub_2461D43D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559308);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)a3 = sub_2461E6544();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v10 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257559310) + 44);
  v15 = a1;
  v16 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559318);
  sub_2461BFDA4(&qword_257559320, &qword_257559318);
  sub_2461E6388();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(v10, v9, v6);
  v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257559328) + 36);
  *(_QWORD *)v12 = KeyPath;
  *(_BYTE *)(v12 + 8) = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2461D4508@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t KeyPath;

  v5 = *(id *)(a1 + *(int *)(type metadata accessor for GetContactQuickActionButtonsView(0) + 28) + 8);
  v6 = objc_msgSend(a2, sel_identifier);
  v7 = sub_2461E6A78();
  v9 = v8;

  sub_2461DE9B0(v7, v9);
  swift_bridgeObjectRelease();
  sub_2461BFC74();
  v10 = sub_2461E66AC();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  sub_2461E6C10();
  v17 = sub_2461E66AC();
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v16;
  *(_QWORD *)(a3 + 24) = v14;
  *(_QWORD *)(a3 + 32) = v17;
  *(_QWORD *)(a3 + 40) = v19;
  *(_BYTE *)(a3 + 48) = v23;
  *(_QWORD *)(a3 + 56) = v21;
  *(_QWORD *)(a3 + 64) = KeyPath;
  *(_QWORD *)(a3 + 72) = 0;
  *(_BYTE *)(a3 + 80) = 1;
  sub_2461C7050(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_2461C7050(v17, v19, v23);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2461BFCB0(v17, v19, v23);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2461BFCB0(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461D46D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E67E4();
  *a1 = result;
  return result;
}

void sub_2461D4710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  OUTLINED_FUNCTION_18_1();
  a17 = v18;
  a18 = v19;
  v21 = v20;
  v23 = v22;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_2();
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&a9 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&a9 - v28;
  v30 = sub_2461E60D0();
  OUTLINED_FUNCTION_49_0((uint64_t)v29, v31, v32, v30);
  v33 = OUTLINED_FUNCTION_25_0();
  sub_2461C7C70((uint64_t)v29, (uint64_t)v27, &qword_257558708);
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  sub_2461E6814();
  sub_2461C7F84((uint64_t)v29, &qword_257558708);
  v34 = OUTLINED_FUNCTION_47_0(*(void **)((char *)v23 + *(int *)(v33 + 28) + 8));
  v23(v21);

  OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2461D480C()
{
  OUTLINED_FUNCTION_27_1();
  sub_2461D6E30(&qword_257559250, &qword_257559248, &qword_257559258, &qword_257559260);
  return sub_2461E6658();
}

void sub_2461D48B0()
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

  v0 = OUTLINED_FUNCTION_11_2();
  v1 = MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_6_6(v1, v2, v3, v4, v5, v6, v7, v8, v10);
  v9 = OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_36_0(v9);
  OUTLINED_FUNCTION_50_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559268);
  sub_2461BFDA4(&qword_257559270, &qword_257559268);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_0_3();
}

void sub_2461D492C(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v5;
  id v6;

  v5 = OUTLINED_FUNCTION_25_0();
  v6 = OUTLINED_FUNCTION_47_0(*(void **)(a1 + *(int *)(v5 + 28) + 8));
  v2(a2);

}

uint64_t sub_2461D4998()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559278);
  sub_2461BFDA4(&qword_257559280, &qword_257559278);
  return sub_2461E67F0();
}

uint64_t sub_2461D4A2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  sub_2461E6094();
  sub_2461E6AB4();
  swift_bridgeObjectRelease();
  sub_2461BFC74();
  v2 = OUTLINED_FUNCTION_38();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  sub_2461E604C();
  v9 = OUTLINED_FUNCTION_38();
  v11 = v10;
  v13 = v12 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v12 & 1;
  *(_QWORD *)(a1 + 56) = v14;
  sub_2461C7050(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_2461C7050(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_2461BFCB0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_2461BFCB0(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461D4B50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E67E4();
  *a1 = result;
  return result;
}

void sub_2461D4B84(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_44_0();
    if (v4)
      goto LABEL_3;
LABEL_8:
    OUTLINED_FUNCTION_4();
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_44_0();
  if (!sub_2461E6D60())
    goto LABEL_8;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x249553D14](0, a1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(a1 + 32);
LABEL_6:
    v6 = v5;
    OUTLINED_FUNCTION_4();
    sub_2461E6094();

LABEL_9:
    sub_2461BFC74();
    *(_QWORD *)a2 = sub_2461E66AC();
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = v8 & 1;
    *(_QWORD *)(a2 + 24) = v9;
    OUTLINED_FUNCTION_5_3();
    return;
  }
  __break(1u);
}

uint64_t sub_2461D4C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v13 = objc_allocWithZone(v6);
  v14 = *(_QWORD *)(a4 + 24);
  v15 = *(_QWORD *)(a4 + 32);
  v16 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v18);
  v20 = sub_2461D821C(a1, a2, a3, (uint64_t)v18, a5, a6, (uint64_t)v13, v14, v15);
  __swift_destroy_boxed_opaque_existential_1(a4);
  return v20;
}

id sub_2461D4D58()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockGetContactQuickActionButtonsViewModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2461D4D8C()
{
  return type metadata accessor for MockGetContactQuickActionButtonsViewModel(0);
}

uint64_t type metadata accessor for MockGetContactQuickActionButtonsViewModel(uint64_t a1)
{
  return sub_2461D55B4(a1, (uint64_t *)&unk_257558FF8);
}

uint64_t sub_2461D4DA8()
{
  return swift_updateClassMetadata2();
}

char *sub_2461D4DDC(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = sub_2461E60D0();
    v12 = v4;
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    v14 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
    *(_QWORD *)&v9[*(int *)(v14 + 28)] = *(_QWORD *)&v10[*(int *)(v14 + 28)];
    v15 = a3[6];
    v16 = a3[7];
    v17 = *(char **)((char *)a2 + v15);
    *(_QWORD *)&v7[v15] = v17;
    v18 = &v7[v16];
    v19 = (char **)((char *)a2 + v16);
    v20 = (void *)v19[1];
    *(_QWORD *)v18 = *v19;
    *((_QWORD *)v18 + 1) = v20;
    swift_retain();
    v21 = v17;
    v22 = v20;
  }
  return v7;
}

void sub_2461D4F14(id *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = (uint64_t)a1 + a2[5];
  v5 = sub_2461E60D0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  swift_release();

}

_QWORD *sub_2461D4FB0(_QWORD *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  id v22;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)(a2 + v8);
  v11 = sub_2461E60D0();
  v12 = v7;
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  *(_QWORD *)&v9[*(int *)(v14 + 28)] = *(_QWORD *)&v10[*(int *)(v14 + 28)];
  v15 = a3[6];
  v16 = a3[7];
  v17 = *(void **)(a2 + v15);
  *(_QWORD *)((char *)a1 + v15) = v17;
  v18 = (_QWORD *)((char *)a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = (void *)v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  v21 = v17;
  v22 = v20;
  return a1;
}

uint64_t sub_2461D50B8(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  id v27;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = a3[5];
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = sub_2461E60D0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    v15 = *(_QWORD *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
LABEL_7:
  v17 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  *(_QWORD *)&v10[*(int *)(v17 + 28)] = *(_QWORD *)&v11[*(int *)(v17 + 28)];
  swift_retain();
  swift_release();
  v18 = a3[6];
  v19 = *(void **)(a2 + v18);
  v20 = *(void **)(a1 + v18);
  *(_QWORD *)(a1 + v18) = v19;
  v21 = v19;

  v22 = a3[7];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v25 = (void *)v24[1];
  v26 = (void *)v23[1];
  v23[1] = v25;
  v27 = v25;

  return a1;
}

_OWORD *sub_2461D5240(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461E60D0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  *(_QWORD *)&v7[*(int *)(v11 + 28)] = *(_QWORD *)&v8[*(int *)(v11 + 28)];
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t sub_2461D5328(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = sub_2461E60D0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558708);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  *(_QWORD *)&v8[*(int *)(v15 + 28)] = *(_QWORD *)&v9[*(int *)(v15 + 28)];
  swift_release();
  v16 = a3[6];
  v17 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)((char *)a2 + v16);

  v18 = a3[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  v23 = (void *)v19[1];
  *v19 = v22;
  v19[1] = v21;

  return a1;
}

uint64_t sub_2461D5494()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461D54A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_2461D5520()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461D552C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 20), a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
    OUTLINED_FUNCTION_66();
  }
}

uint64_t type metadata accessor for GetContactQuickActionButtonsView(uint64_t a1)
{
  return sub_2461D55B4(a1, (uint64_t *)&unk_257559068);
}

uint64_t sub_2461D55B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461D55E4()
{
  unint64_t v0;

  sub_2461D5670();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2461D5670()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257559078[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558708);
    v0 = sub_2461E6820();
    if (!v1)
      atomic_store(v0, qword_257559078);
  }
}

uint64_t sub_2461D56C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461D56D8(uint64_t a1, uint64_t a2)
{
  uint64_t ContactQuickActionButtonsView;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactQuickActionButtonsView - 8) + 16))(a2, a1, ContactQuickActionButtonsView);
  return a2;
}

uint64_t sub_2461D5720(uint64_t a1)
{
  return sub_2461D583C(a1);
}

unint64_t sub_2461D572C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575590D8;
  if (!qword_2575590D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575590C8);
    sub_2461BFDA4(&qword_2575590E0, &qword_2575590E8);
    v3 = v2;
    sub_2461BFDA4(&qword_2575590F0, &qword_2575590F8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575590D8);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t ContactQuickActionButtonsView;
  uint64_t v1;

  OUTLINED_FUNCTION_18_1();
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  OUTLINED_FUNCTION_7_6(ContactQuickActionButtonsView);
  v1 = OUTLINED_FUNCTION_17_0();
  if (!OUTLINED_FUNCTION_10_1(v1))
    OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_16_1();
  return OUTLINED_FUNCTION_6_5();
}

uint64_t sub_2461D5830(uint64_t a1)
{
  return sub_2461D583C(a1);
}

uint64_t sub_2461D583C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = OUTLINED_FUNCTION_4_6(a1);
  return OUTLINED_FUNCTION_13_0(v1, v2, v3);
}

uint64_t sub_2461D585C()
{
  uint64_t v0;

  return sub_2461D2914(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2461D5864(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2461D5898(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_2461E6D54();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575592A0);
    result = sub_2461E6B50();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

char *sub_2461D5938(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2461E6D6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_2461D59BC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2461E6D6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_2461D5A40(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2461E6D6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2461D5AC4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2461E6D6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_2461D5B50(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2461E6D6C();
  __break(1u);
  return result;
}

void *sub_2461D5C20(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[16 * a2] <= __src || &__src[16 * a2] <= __dst))
    return memcpy(__dst, __src, 16 * a2);
  result = (void *)sub_2461E6D6C();
  __break(1u);
  return result;
}

void *sub_2461D5CE8(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)sub_2461E6D6C();
  __break(1u);
  return result;
}

uint64_t sub_2461D5DB0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (v3 = a1 + 24 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_2461E6D6C();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575592A0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2461D5EA0(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2461D5EC0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_2461D5F20(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2461E6CB8();
  OUTLINED_FUNCTION_4();
  *a1 = v8;
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2461D5F20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2461D5FF0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2461D802C((uint64_t)v12, *a3);
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
      sub_2461D802C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2461D5FF0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2461D6144((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2461E6CC4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2461D6208(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2461E6CF4();
    if (!v8)
    {
      result = sub_2461E6D54();
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

void *sub_2461D6144(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2461E6D6C();
  __break(1u);
  return result;
}

uint64_t sub_2461D6208(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2461D629C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2461D6470(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2461D6470((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2461D629C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2461E6AFC();
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
  v3 = sub_2461D640C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2461E6CDC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2461E6D6C();
  __break(1u);
LABEL_14:
  result = sub_2461E6D54();
  __break(1u);
  return result;
}

_QWORD *sub_2461D640C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575592E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2461D6470(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575592E0);
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
    sub_2461D6608(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461D6544(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2461D6544(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2461E6D6C();
  __break(1u);
  return result;
}

char *sub_2461D6608(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2461E6D6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_2461D6688(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_2461D6698(unint64_t result, char a2, uint64_t a3)
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

void sub_2461D66BC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  char v8;
  char v9;
  const void *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_33_0();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_32();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559330);
    v10 = (const void *)OUTLINED_FUNCTION_22_0();
    v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_29_0(v11 - 32);
  }
  v12 = (char *)OUTLINED_FUNCTION_28_0();
  if ((a1 & 1) != 0)
  {
    sub_2461D5938(v12, v13, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461D5B50((unint64_t)v12, v13, (unint64_t)v14);
  }
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_66();
}

void sub_2461D6760(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  char v8;
  char v9;
  const void *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_33_0();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_32();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_257559350);
    v10 = (const void *)OUTLINED_FUNCTION_22_0();
    v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_29_0(v11 - 32);
  }
  v12 = (char *)OUTLINED_FUNCTION_28_0();
  if ((a1 & 1) != 0)
  {
    sub_2461D59BC(v12, v13, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461D5C20(v12, v13, v14);
  }
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_66();
}

void sub_2461D6804(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  char v8;
  char v9;
  const void *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_33_0();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_32();
    }
  }
  OUTLINED_FUNCTION_31();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559348);
    v10 = (const void *)OUTLINED_FUNCTION_22_0();
    v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_29_0(v11 - 32);
  }
  v12 = (char *)OUTLINED_FUNCTION_28_0();
  if ((a1 & 1) != 0)
  {
    sub_2461D5A40(v12, v13, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461D5CE8(v12, v13, v14);
  }
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_66();
}

char *sub_2461D68A8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575592A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2461D5AC4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461D5DB0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_2461D6990(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = sub_2461E64E4();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_1();
}

void sub_2461D69BC()
{
  sub_2461E64F0();
  OUTLINED_FUNCTION_1();
}

void sub_2461D69E4(_BYTE *a1@<X8>)
{
  *a1 = sub_2461E64CC() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_2461D6A0C()
{
  sub_2461E64D8();
  OUTLINED_FUNCTION_1();
}

_BYTE *sub_2461D6A30(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_2461D6A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575590C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461D6A90(uint64_t a1)
{
  uint64_t ContactQuickActionButtonsView;

  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(ContactQuickActionButtonsView - 8) + 8))(a1, ContactQuickActionButtonsView);
  return a1;
}

void sub_2461D6AD0()
{
  sub_2461D817C();
}

uint64_t sub_2461D6AF4(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2461D7D74((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_2461D708C(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_2461D6B5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575592A8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_2461D7B5C((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2461D81C4();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_2461D6C40()
{
  sub_2461D6F18();
}

uint64_t sub_2461D6C54()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_2461D6C7C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575591E8;
  if (!qword_2575591E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559178);
    v2[0] = sub_2461D6CE8();
    v2[1] = sub_2461D6D8C();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575591E8);
  }
  return result;
}

unint64_t sub_2461D6CE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575591F0;
  if (!qword_2575591F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559170);
    sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
    v3[0] = v2;
    v3[1] = sub_2461D6E30(&qword_257559200, &qword_257559148, &qword_2575591A8, &qword_257559198);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575591F0);
  }
  return result;
}

unint64_t sub_2461D6D8C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257559208;
  if (!qword_257559208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559140);
    sub_2461BFDA4(&qword_2575591F8, &qword_257559168);
    v3[0] = v2;
    v3[1] = sub_2461D6E30(&qword_257559210, &qword_257559130, &qword_257559218, &qword_257559220);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257559208);
  }
  return result;
}

uint64_t sub_2461D6E30(unint64_t *a1, uint64_t *a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_2461BFDA4(a3, a4);
    v10 = v9;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDF4A08], v8, &v10);
    atomic_store(result, a1);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_2461D6EB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2461D3E78(a1, a2);
}

uint64_t sub_2461D6ECC(uint64_t a1)
{
  return sub_2461D583C(a1);
}

void sub_2461D6EDC()
{
  sub_2461D817C();
}

void sub_2461D6F04()
{
  sub_2461D6F18();
}

void sub_2461D6F18()
{
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_8_3();
  sub_2461D480C();
  OUTLINED_FUNCTION_0_6();
}

void sub_2461D6F58(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2461D3E78(a1, a2);
}

uint64_t sub_2461D6F70(uint64_t a1)
{
  return sub_2461D583C(a1);
}

void sub_2461D6F80()
{
  sub_2461D817C();
}

void sub_2461D6FA8()
{
  sub_2461D6F18();
}

void sub_2461D6FBC(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*a1, a1[1], a1[2]);
  OUTLINED_FUNCTION_1();
}

void sub_2461D6FE4()
{
  sub_2461D3634();
}

uint64_t sub_2461D700C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2461D2A80(*(_QWORD *)(v1 + 16), a1);
}

void sub_2461D7018()
{
  sub_2461D817C();
}

void sub_2461D7040()
{
  sub_2461D81D0((void (*)(uint64_t))sub_2461D492C);
}

uint64_t sub_2461D704C()
{
  return sub_2461D29B8();
}

uint64_t sub_2461D7054()
{
  return sub_2461D3DC8();
}

uint64_t sub_2461D7074@<X0>(uint64_t a1@<X8>)
{
  return sub_2461D4A2C(a1);
}

uint64_t sub_2461D708C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *v18;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  char v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *__dst;
  uint64_t v124;
  uint64_t v125;

  v3 = a1[1];
  result = sub_2461E6D84();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_2461D770C(0, v3, 1, a1);
      return result;
    }
    goto LABEL_144;
  }
  v5 = result;
  v125 = v1;
  result = sub_2461D5898(v3 / 2);
  v120 = result;
  v121 = v3;
  __dst = v11;
  v118 = a1;
  if (v3 <= 0)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v46 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    result = (uint64_t)v14;
    if (v46 < 2)
    {
LABEL_121:
      result = swift_bridgeObjectRelease();
      if (v121 >= -1)
        return OUTLINED_FUNCTION_51(result, v109, v110, v111, v112, v113, v114, v115, v116, v117, (uint64_t)v118, v119, v120);
      goto LABEL_149;
    }
    v102 = *v118;
    while (1)
    {
      v103 = v46 - 2;
      if (v46 < 2)
        break;
      if (!v102)
        goto LABEL_153;
      v104 = result;
      v105 = *(_QWORD *)(result + 32 + 16 * v103);
      v106 = *(_QWORD *)(result + 32 + 16 * (v46 - 1) + 8);
      result = OUTLINED_FUNCTION_45_0((char *)(v102 + 24 * v105), (char *)(v102 + 24 * *(_QWORD *)(result + 32 + 16 * (v46 - 1))), v102 + 24 * v106, v6, v7, v8, v9, v10, v116, v117, (uint64_t)v118, v119, v120, v121, v122, __dst, v124, v125);
      v125 = v1;
      if (v1)
        goto LABEL_106;
      if (v106 < v105)
        goto LABEL_139;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_2461D7A8C(v104);
        v104 = result;
      }
      if (v103 >= *(_QWORD *)(v104 + 16))
        goto LABEL_140;
      v107 = (_QWORD *)(v104 + 32 + 16 * v103);
      *v107 = v105;
      v107[1] = v106;
      v108 = *(_QWORD *)(v104 + 16);
      if (v46 > v108)
        goto LABEL_141;
      memmove((void *)(v104 + 32 + 16 * (v46 - 1)), (const void *)(v104 + 32 + 16 * v46), 16 * (v108 - v46));
      result = v104;
      *(_QWORD *)(v104 + 16) = v108 - 1;
      v46 = v108 - 1;
      if (v108 <= 2)
        goto LABEL_121;
    }
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
    return result;
  }
  v119 = v5;
  v12 = 0;
  v13 = *a1;
  v116 = *a1 - 24;
  v117 = *a1 + 8;
  v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v122 = v13;
  while (1)
  {
    v15 = v12++;
    if (v12 >= v3)
      goto LABEL_32;
    v16 = (uint64_t *)(v13 + 24 * v12);
    result = *v16;
    v17 = v16[1];
    v18 = (_QWORD *)(v13 + 24 * v15);
    if (result == *v18 && v17 == v18[1])
    {
      v21 = v15 + 2;
      if (v15 + 2 >= v121)
        goto LABEL_31;
      v20 = 0;
    }
    else
    {
      result = OUTLINED_FUNCTION_19_0();
      v20 = result;
      v21 = v15 + 2;
      if (v15 + 2 >= v121)
        goto LABEL_23;
    }
    v22 = (_QWORD *)(v117 + 24 * v21);
    do
    {
      result = *(v22 - 1);
      v23 = (_QWORD *)(v13 + 24 * v12);
      if (result == *v23 && *v22 == v23[1])
      {
        if ((v20 & 1) != 0)
          goto LABEL_24;
      }
      else
      {
        result = OUTLINED_FUNCTION_19_0();
        if (((v20 ^ result) & 1) != 0)
          goto LABEL_23;
      }
      v22 += 3;
      v25 = v21 + 1;
      v12 = v21;
      v21 = v25;
    }
    while (v25 < v121);
    v21 = v25;
LABEL_23:
    v12 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_24:
      if (v21 < v15)
        goto LABEL_148;
      if (v15 < v21)
      {
        v26 = 24 * v21;
        v27 = 24 * v15;
        v28 = v21;
        v29 = v15;
        do
        {
          if (v29 != --v28)
          {
            if (!v13)
              goto LABEL_152;
            v30 = v13 + v27;
            v31 = v13 + v26;
            v32 = *(_QWORD *)(v13 + v27);
            v33 = *(_OWORD *)(v13 + v27 + 8);
            v34 = *(_OWORD *)(v13 + v26 - 24);
            *(_QWORD *)(v30 + 16) = *(_QWORD *)(v13 + v26 - 8);
            *(_OWORD *)v30 = v34;
            *(_QWORD *)(v31 - 24) = v32;
            *(_OWORD *)(v31 - 16) = v33;
          }
          ++v29;
          v26 -= 24;
          v27 += 24;
        }
        while (v29 < v28);
      }
LABEL_31:
      v12 = v21;
    }
LABEL_32:
    if (v12 < v121)
    {
      if (__OFSUB__(v12, v15))
        goto LABEL_143;
      if (v12 - v15 < v119)
      {
        if (__OFADD__(v15, v119))
          goto LABEL_146;
        if (v15 + v119 >= v121)
          v35 = v121;
        else
          v35 = v15 + v119;
        if (v35 < v15)
          goto LABEL_147;
        if (v12 != v35)
        {
          v36 = v116 + 24 * v12;
          do
          {
            v37 = (uint64_t *)(v13 + 24 * v12);
            result = *v37;
            v38 = v37[1];
            v39 = v15;
            v40 = v36;
            do
            {
              if (result == *(_QWORD *)v40 && v38 == *(_QWORD *)(v40 + 8))
                break;
              result = OUTLINED_FUNCTION_19_0();
              if ((result & 1) == 0)
                break;
              if (!v13)
                goto LABEL_150;
              v42 = *(_OWORD *)(v40 + 32);
              v43 = *(_QWORD *)(v40 + 16);
              result = *(_QWORD *)(v40 + 24);
              *(_OWORD *)(v40 + 24) = *(_OWORD *)v40;
              *(_QWORD *)(v40 + 40) = v43;
              *(_QWORD *)v40 = result;
              *(_OWORD *)(v40 + 8) = v42;
              v38 = v42;
              v40 -= 24;
              ++v39;
            }
            while (v12 != v39);
            ++v12;
            v36 += 24;
          }
          while (v12 != v35);
          v12 = v35;
        }
      }
    }
    if (v12 < v15)
      goto LABEL_142;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)OUTLINED_FUNCTION_48_0(0, v14[2] + 1);
      v14 = (_QWORD *)result;
    }
    v45 = v14[2];
    v44 = v14[3];
    v46 = v45 + 1;
    if (v45 >= v44 >> 1)
    {
      result = (uint64_t)OUTLINED_FUNCTION_48_0((char *)(v44 > 1), v45 + 1);
      v14 = (_QWORD *)result;
    }
    v14[2] = v46;
    v47 = v14 + 4;
    v48 = &v14[2 * v45 + 4];
    *v48 = v15;
    v48[1] = v12;
    if (v45)
      break;
    v46 = 1;
    v13 = v122;
LABEL_101:
    v3 = v121;
    if (v12 >= v121)
      goto LABEL_110;
  }
  v13 = v122;
  while (1)
  {
    v49 = v46 - 1;
    if (v46 >= 4)
    {
      v54 = &v47[2 * v46];
      v55 = *(v54 - 8);
      v56 = *(v54 - 7);
      v60 = __OFSUB__(v56, v55);
      v57 = v56 - v55;
      if (v60)
        goto LABEL_127;
      v59 = *(v54 - 6);
      v58 = *(v54 - 5);
      v60 = __OFSUB__(v58, v59);
      v52 = v58 - v59;
      v53 = v60;
      if (v60)
        goto LABEL_128;
      v61 = v46 - 2;
      v62 = &v47[2 * v46 - 4];
      v64 = *v62;
      v63 = v62[1];
      v60 = __OFSUB__(v63, v64);
      v65 = v63 - v64;
      if (v60)
        goto LABEL_129;
      v60 = __OFADD__(v52, v65);
      v66 = v52 + v65;
      if (v60)
        goto LABEL_131;
      if (v66 >= v57)
      {
        v84 = &v47[2 * v49];
        v86 = *v84;
        v85 = v84[1];
        v60 = __OFSUB__(v85, v86);
        v87 = v85 - v86;
        if (v60)
          goto LABEL_137;
        v77 = v52 < v87;
        goto LABEL_90;
      }
    }
    else
    {
      if (v46 != 3)
      {
        v78 = v14[4];
        v79 = v14[5];
        v60 = __OFSUB__(v79, v78);
        v71 = v79 - v78;
        v72 = v60;
        goto LABEL_84;
      }
      v51 = v14[4];
      v50 = v14[5];
      v60 = __OFSUB__(v50, v51);
      v52 = v50 - v51;
      v53 = v60;
    }
    if ((v53 & 1) != 0)
      goto LABEL_130;
    v61 = v46 - 2;
    v67 = &v47[2 * v46 - 4];
    v69 = *v67;
    v68 = v67[1];
    v70 = __OFSUB__(v68, v69);
    v71 = v68 - v69;
    v72 = v70;
    if (v70)
      goto LABEL_132;
    v73 = &v47[2 * v49];
    v75 = *v73;
    v74 = v73[1];
    v60 = __OFSUB__(v74, v75);
    v76 = v74 - v75;
    if (v60)
      goto LABEL_134;
    if (__OFADD__(v71, v76))
      goto LABEL_136;
    if (v71 + v76 >= v52)
    {
      v77 = v52 < v76;
LABEL_90:
      if (v77)
        v49 = v61;
      goto LABEL_92;
    }
LABEL_84:
    if ((v72 & 1) != 0)
      goto LABEL_133;
    v80 = &v47[2 * v49];
    v82 = *v80;
    v81 = v80[1];
    v60 = __OFSUB__(v81, v82);
    v83 = v81 - v82;
    if (v60)
      goto LABEL_135;
    if (v83 < v71)
      goto LABEL_101;
LABEL_92:
    v88 = v49 - 1;
    if (v49 - 1 >= v46)
    {
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
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v13)
      goto LABEL_151;
    v89 = v13;
    v90 = &v47[2 * v88];
    v91 = *v90;
    v92 = &v47[2 * v49];
    v93 = v92[1];
    result = OUTLINED_FUNCTION_45_0((char *)(v89 + 24 * *v90), (char *)(v89 + 24 * *v92), v89 + 24 * v93, v6, v7, v8, v9, v10, v116, v117, (uint64_t)v118, v119, v120, v121, v122, __dst, v124, v125);
    v125 = v1;
    if (v1)
      break;
    if (v93 < v91)
      goto LABEL_124;
    if (v49 > v14[2])
      goto LABEL_125;
    *v90 = v91;
    v47[2 * v88 + 1] = v93;
    v94 = v14[2];
    if (v49 >= v94)
      goto LABEL_126;
    v46 = v94 - 1;
    result = (uint64_t)memmove(&v47[2 * v49], v92 + 2, 16 * (v94 - 1 - v49));
    v14[2] = v94 - 1;
    v77 = v94 > 2;
    v13 = v122;
    if (!v77)
      goto LABEL_101;
  }
LABEL_106:
  result = swift_bridgeObjectRelease();
  if (v121 < -1)
    goto LABEL_145;
  return OUTLINED_FUNCTION_51(result, v95, v96, v97, v98, v99, v100, v101, v116, v117, (uint64_t)v118, v119, v120);
}

uint64_t sub_2461D770C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 24 * a3 - 24;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 24 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = v8;
      do
      {
        if (result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8))
          break;
        result = OUTLINED_FUNCTION_19_0();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        v14 = *(_OWORD *)(v12 + 32);
        v15 = *(_QWORD *)(v12 + 16);
        result = *(_QWORD *)(v12 + 24);
        *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
        *(_QWORD *)(v12 + 40) = v15;
        *(_QWORD *)v12 = result;
        *(_OWORD *)(v12 + 8) = v14;
        v10 = v14;
        v12 -= 24;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 24;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_2461D77E4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v14;
  char *v15;
  __int128 v16;
  unint64_t v19;
  char *v20;
  char *v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  __int128 v25;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  if (v9 >= v11)
  {
    sub_2461D5AC4(a2, (uint64_t)(a3 - (_QWORD)a2) / 24, __dst);
    v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_47;
    v19 = a3 - 24;
    while (1)
    {
      v20 = (char *)(v19 + 24);
      v21 = v12 - 24;
      v22 = *((_QWORD *)v12 - 3) == *((_QWORD *)v6 - 3) && *((_QWORD *)v12 - 2) == *((_QWORD *)v6 - 2);
      if (v22 || (OUTLINED_FUNCTION_19_0() & 1) == 0)
      {
        v24 = v20 != v12 || v19 >= (unint64_t)v12;
        v12 -= 24;
        if (!v24)
          goto LABEL_43;
      }
      else
      {
        v23 = v20 != v6 || v19 >= (unint64_t)v6;
        v21 = v6 - 24;
        v6 -= 24;
        if (!v23)
          goto LABEL_43;
      }
      v25 = *(_OWORD *)v21;
      *(_QWORD *)(v19 + 16) = *((_QWORD *)v21 + 2);
      *(_OWORD *)v19 = v25;
LABEL_43:
      v19 -= 24;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_47;
    }
  }
  sub_2461D5AC4(__src, (a2 - __src) / 24, __dst);
  v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (OUTLINED_FUNCTION_19_0() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 24;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 24;
    if (v14)
      goto LABEL_16;
LABEL_15:
    v16 = *(_OWORD *)v15;
    *((_QWORD *)v7 + 2) = *((_QWORD *)v15 + 2);
    *(_OWORD *)v7 = v16;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_2461D5AC4(v4, (v12 - v4) / 24, v6);
  return 1;
}

char *sub_2461D7998(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257559298);
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

char *sub_2461D7A8C(uint64_t a1)
{
  return sub_2461D7998(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2461D7AA0(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_aceId);

  if (!v2)
    return 0;
  v3 = sub_2461E6A78();

  return v3;
}

void sub_2461D7B0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2461E6A54();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t sub_2461D7B5C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v22;
  uint64_t v23;

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
LABEL_39:
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
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v23 = -1 << *(_BYTE *)(a4 + 32);
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
    v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

char *sub_2461D7D74(uint64_t a1)
{
  return sub_2461D68A8(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t objectdestroy_54Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ContactQuickActionButtonsView;
  uint64_t v4;

  OUTLINED_FUNCTION_18_1();
  ContactQuickActionButtonsView = type metadata accessor for GetContactQuickActionButtonsView(0);
  OUTLINED_FUNCTION_7_6(ContactQuickActionButtonsView);
  v4 = OUTLINED_FUNCTION_17_0();
  if (!OUTLINED_FUNCTION_10_1(v4))
    OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_16_1();

  return OUTLINED_FUNCTION_6_5();
}

void sub_2461D7E08()
{
  sub_2461D81D0((void (*)(uint64_t))sub_2461D4710);
}

void sub_2461D7E14()
{
  sub_2461D3490();
}

void sub_2461D7E3C()
{
  sub_2461D3514();
}

void sub_2461D7E5C(_BYTE *a1@<X8>)
{
  *a1 = sub_2461E649C();
  OUTLINED_FUNCTION_1();
}

void sub_2461D7E80()
{
  sub_2461E64A8();
  OUTLINED_FUNCTION_1();
}

void sub_2461D7EA4()
{
  sub_2461D80B8();
}

void sub_2461D7EB0()
{
  uint64_t v0;

  sub_2461D434C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &qword_2575592C0, &qword_2575592C8);
}

uint64_t sub_2461D7EE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2461D2D34(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2461D7EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2461D2E6C(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), a1);
}

void sub_2461D7EF8()
{
  sub_2461D3634();
}

void sub_2461D7F20(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2461D4B84(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2461D7F3C(uint64_t a1)
{
  return sub_2461D583C(a1);
}

uint64_t sub_2461D7F48()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_18_1();
  v1 = *(_QWORD *)(type metadata accessor for GetContactQuickActionButtonsView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);

  v3 = OUTLINED_FUNCTION_17_0();
  if (!OUTLINED_FUNCTION_10_1(v3))
    OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledName(qword_257559008);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_16_1();
  return OUTLINED_FUNCTION_6_5();
}

void sub_2461D7FD4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GetContactQuickActionButtonsView(0) - 8) + 80);
  sub_2461D3898(*(_QWORD *)(v0 + 16), (void **)(v0 + ((v1 + 24) & ~v1)));
}

uint64_t sub_2461D8004()
{
  return sub_2461D3D34();
}

uint64_t sub_2461D800C()
{
  return sub_2461D3DC8();
}

uint64_t sub_2461D802C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2461D806C()
{
  id *v0;

  v0 = (id *)OUTLINED_FUNCTION_1_3();
  sub_2461D30E4(v0);
}

void sub_2461D8080()
{
  sub_2461D3490();
}

void sub_2461D80AC()
{
  sub_2461D80B8();
}

void sub_2461D80B8()
{
  OUTLINED_FUNCTION_1_3();
  sub_2461D3FE8();
  OUTLINED_FUNCTION_1();
}

void sub_2461D80DC()
{
  uint64_t v0;

  sub_2461D434C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &qword_2575592F8, &qword_257559300);
}

uint64_t sub_2461D8114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2461D43D0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2461D811C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2461D4508(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), a1);
}

void sub_2461D812C()
{
  sub_2461D3634();
}

void sub_2461D8158()
{
  sub_2461D817C();
}

void sub_2461D817C()
{
  void (*v0)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_8_3();
  v0(v5, v1 + v6, v4, v3, v2);
  OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2461D81BC()
{
  return sub_2461D4998();
}

uint64_t sub_2461D81C4()
{
  return swift_release();
}

void sub_2461D81D0(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_1_3();
  a1(v2);
  OUTLINED_FUNCTION_1();
}

void sub_2461D81F0()
{
  sub_2461D3490();
}

uint64_t sub_2461D821C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  v44 = a6;
  v45 = a7;
  v38 = a4;
  v42 = a1;
  v43 = a3;
  v36 = a2;
  v40 = a5;
  v41 = a9;
  v39 = sub_2461E6040();
  v11 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2461E6250();
  v15 = *(_QWORD *)(v14 - 8);
  v35 = v14;
  v16 = v15;
  v37 = v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(a8 - 8);
  v21 = MEMORY[0x24BDAC7A8](v17);
  v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v34 - v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))((char *)&v34 - v24, v38, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, a2, v14);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v27 = v11;
  v29 = v39;
  v28 = v40;
  v26(v13, v40, v39);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v25, a8);
  sub_2461E1FAC(v42, (uint64_t)v19, v43, (uint64_t)v23, (uint64_t)v13, v44, v45, a8, v41, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42,
    v43,
    v44);
  v31 = v30;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v25, a8);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v35);
  return v31;
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

void sub_2461D8424()
{
  sub_2461BFDA4(&qword_257559338, &qword_257559340);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GetContactQuickActionButtonsView(0) - 8) + 80);
  return v0 + ((v1 + 16) & ~v1);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1)
{
  type metadata accessor for GetContactQuickActionButtonsView(0);
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  return sub_2461D56D8(v9, (uint64_t)&a9 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
}

void OUTLINED_FUNCTION_7_6(uint64_t a1)
{
  uint64_t v1;

  objc_release(*(id *)(v1
                     + ((*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80))));
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return sub_2461E682C();
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_2461E60D0();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_2461E6D9C();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return type metadata accessor for GetContactQuickActionButtonsView(0);
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  uint64_t v0;

  return v0 + 32;
}

void OUTLINED_FUNCTION_29_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2461BFE3C(v2, a1 + v1);
}

void OUTLINED_FUNCTION_37_0(_QWORD *a1)
{
  uint64_t *v1;

  sub_2461BFDA4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_2461E66AC();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2461C19D0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_45_0(char *a1, char *a2, unint64_t a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char *__dst, uint64_t a17, uint64_t a18)
{
  return sub_2461D77E4(a1, a2, a3, __dst);
}

id OUTLINED_FUNCTION_47_0@<X0>(void *a1@<X8>)
{
  return a1;
}

char *OUTLINED_FUNCTION_48_0(char *a1, int64_t a2)
{
  char *v2;

  return sub_2461D7998(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

id OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + v2) = v1;
  *(_QWORD *)(v3 - 96) = v1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_QWORD *)(a13 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t *sub_2461D87B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  id v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2461E6394();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = *(int *)(a3 + 24);
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (char *)a2 + v9;
    v14 = *(void **)v12;
    v13 = *((_QWORD *)v12 + 1);
    *v11 = v14;
    v11[1] = v13;
    v15 = (char *)a1 + v10;
    v16 = (char *)a2 + v10;
    v17 = sub_2461E62E0();
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v19 = v14;
    v18(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_2461D88C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_2461E6394();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_2461E62E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *sub_2461D895C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  id v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2461E6394();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (char *)a2 + v7;
  v12 = *(void **)v10;
  v11 = *((_QWORD *)v10 + 1);
  *v9 = v12;
  v9[1] = v11;
  v13 = (char *)a1 + v8;
  v14 = (char *)a2 + v8;
  v15 = sub_2461E62E0();
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  v17 = v12;
  v16(v13, v14, v15);
  return a1;
}

_QWORD *sub_2461D8A48(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_2461C09D0((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2461E6394();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(void **)((char *)a1 + v7);
  v11 = *(void **)((char *)a2 + v7);
  *v8 = v11;
  v12 = v11;

  v8[1] = *((_QWORD *)v9 + 1);
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *sub_2461D8B54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_2461E6394();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_2461D8C24(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_2461C09D0((uint64_t)a1);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2461E6394();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *(void **)&a1[v8];
  *(_QWORD *)v9 = *(_QWORD *)v10;

  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  v12 = *(int *)(a3 + 24);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_2461D8D28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461D8D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2575587F8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_5_0();
    v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_2461D8DDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461D8DE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2575587F8);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
      return result;
    }
    v9 = OUTLINED_FUNCTION_5_0();
    v10 = a1 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for ModifyContactAttributeConfirmationView()
{
  uint64_t result;

  result = qword_2575593B0;
  if (!qword_2575593B0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461D8EB8()
{
  unint64_t v0;
  unint64_t v1;

  sub_2461C0E10();
  if (v0 <= 0x3F)
  {
    sub_2461E62E0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2461D8F44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461D8F54@<X0>(uint64_t a1@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_QWORD, _QWORD, _QWORD);
  void (*v51)(_QWORD, _QWORD);
  unsigned int *v52;
  uint64_t v53;
  void (*v54)(_QWORD, _QWORD, _QWORD);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  char *v75;
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
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(_QWORD, _QWORD, _QWORD);
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[4];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[2];
  __int128 v105;
  __int128 v106;
  _BYTE v107[8];
  _BYTE v108[8];
  uint64_t v109;
  uint64_t v110;

  v95 = a1;
  v2 = sub_2461E6298();
  OUTLINED_FUNCTION_8_4(v2, (uint64_t)v108);
  OUTLINED_FUNCTION_1_4(v3);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v5);
  v74 = (char *)v69 - v6;
  v7 = sub_2461E68E0();
  OUTLINED_FUNCTION_8_4(v7, (uint64_t)&v110);
  OUTLINED_FUNCTION_1_4(v8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v10);
  v87 = (char *)v69 - v11;
  v12 = sub_2461E6904();
  OUTLINED_FUNCTION_1_4(*(_QWORD *)(v12 - 8));
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = OUTLINED_FUNCTION_3_8();
  v16 = *(_QWORD *)(v79 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v79);
  v93 = (uint64_t)v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v69 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559420);
  OUTLINED_FUNCTION_1_4(*(_QWORD *)(v21 - 8));
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v69 - v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559428);
  OUTLINED_FUNCTION_8_4(v26, (uint64_t)&v109);
  OUTLINED_FUNCTION_1_4(v27);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v29);
  v69[0] = (char *)v69 - v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559430);
  OUTLINED_FUNCTION_8_4(v31, (uint64_t)v104);
  OUTLINED_FUNCTION_1_4(v32);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v34);
  v75 = (char *)v69 - v35;
  sub_2461C1B18(v1, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeConfirmationView);
  v36 = *(unsigned __int8 *)(v16 + 80);
  v82 = ((v36 + 16) & ~v36) + v17;
  v37 = (v36 + 16) & ~v36;
  v83 = v37;
  v81 = v36 | 7;
  v38 = swift_allocObject();
  sub_2461DA184((uint64_t)v20, v38 + v37);
  v98 = v1;
  v70 = v1;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v101 = MEMORY[0x24BDF1FA8];
  v102 = MEMORY[0x24BDF1F80];
  v77 = OUTLINED_FUNCTION_4_7();
  sub_2461E682C();
  v107[0] = 0;
  v105 = 0u;
  v106 = 0u;
  v39 = v15;
  v73 = v15;
  sub_2461E655C();
  sub_2461BFDA4(&qword_257559438, &qword_257559420);
  v41 = v40;
  sub_2461BFC14(&qword_257559440, (void (*)(uint64_t))MEMORY[0x24BEADB88]);
  v43 = v42;
  v44 = v21;
  v45 = v12;
  v46 = v41;
  v72 = v41;
  v71 = v42;
  sub_2461E6730();
  v80 = *(_QWORD *)(v80 + 8);
  v69[1] = v12;
  ((void (*)(char *, uint64_t))v80)(v39, v12);
  v76 = *(_QWORD *)(v76 + 8);
  ((void (*)(char *, uint64_t))v76)(v25, v44);
  v47 = v74;
  sub_2461E62A4();
  v48 = v89;
  v49 = v88;
  v50 = v91;
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v89 + 104))(v88, *MEMORY[0x24BE91F40], v91);
  LOBYTE(v41) = sub_2461E628C();
  v51 = *(void (**)(_QWORD, _QWORD))(v48 + 8);
  v51(v49, v50);
  v51(v47, v50);
  v52 = (unsigned int *)MEMORY[0x24BEAD960];
  v53 = v90;
  v54 = *(void (**)(_QWORD, _QWORD, _QWORD))(v90 + 104);
  v91 = v54;
  if ((v41 & 1) == 0)
    v52 = (unsigned int *)MEMORY[0x24BEAD978];
  v55 = v87;
  v56 = v96;
  v54(v87, *v52, v96);
  v101 = v44;
  v102 = v45;
  v103 = v46;
  v104[0] = v43;
  v57 = OUTLINED_FUNCTION_4_7();
  v58 = v75;
  OUTLINED_FUNCTION_10_2();
  v59 = v69[0];
  sub_2461E66C4();
  v90 = *(_QWORD *)(v53 + 8);
  ((void (*)(char *, uint64_t))v90)(v55, v56);
  v89 = *(_QWORD *)(v86 + 8);
  ((void (*)(uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v89)(v59, v50);
  v101 = (uint64_t)v50;
  v102 = v57;
  OUTLINED_FUNCTION_4_7();
  v60 = v84;
  v61 = sub_2461E66B8();
  v62 = *(void (**)(char *, uint64_t))(v85 + 8);
  v62(v58, v60);
  v104[0] = MEMORY[0x24BDF4780];
  v104[1] = MEMORY[0x24BEAD938];
  v101 = v61;
  v63 = v70;
  v64 = v93;
  sub_2461C1B18(v70, v93, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeConfirmationView);
  v65 = swift_allocObject();
  sub_2461DA184(v64, v65 + v83);
  v97 = v63;
  sub_2461E682C();
  sub_2461E655C();
  sub_2461E6730();
  OUTLINED_FUNCTION_5_6((uint64_t)&v100);
  OUTLINED_FUNCTION_5_6((uint64_t)v99);
  v91(v94, *MEMORY[0x24BEAD970], v96);
  v66 = v92;
  OUTLINED_FUNCTION_10_2();
  sub_2461E66C4();
  OUTLINED_FUNCTION_5_6((uint64_t)v107);
  OUTLINED_FUNCTION_5_6((uint64_t)&v106 + 8);
  v67 = sub_2461E66B8();
  v62(v66, v60);
  v100 = MEMORY[0x24BEAD938];
  v99[3] = MEMORY[0x24BDF4780];
  v99[0] = v67;
  return sub_2461E691C();
}

uint64_t sub_2461D96F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_2461E6010();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (uint64_t *)((char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ModifyContactAttributeConfirmationView();
  sub_2461E62C8();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE91BC0])
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t *, uint64_t))(v1 + 96))(v3, v0);
  v4 = *v3;
  v5 = v3[1];
  sub_2461C19BC(v3[2], v3[3]);
  sub_2461D97E8(v4, v5);
  return sub_2461C19BC(v4, v5);
}

void sub_2461D97E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *oslog;

  if (a2 >> 60 == 15)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v3 = sub_2461E6310();
    __swift_project_value_buffer(v3, (uint64_t)qword_257559B40);
    oslog = sub_2461E62F8();
    v4 = sub_2461E6BF8();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2461B8000, oslog, v4, "#GetContactAttributeButtonableView could not obtain direct invocation for button press", v5, 2u);
      MEMORY[0x249554254](v5, -1, -1);
    }
LABEL_14:

    return;
  }
  sub_2461C1A2C();
  sub_2461C1A68(a1, a2);
  v8 = sub_2461E6BE0();
  if (!v8)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v12 = sub_2461E6310();
    __swift_project_value_buffer(v12, (uint64_t)qword_257559B40);
    oslog = sub_2461E62F8();
    v13 = sub_2461E6BF8();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2461B8000, oslog, v13, "#GetContactAttributeButtonableView could not convert direct invocation to actionable command", v14, 2u);
      MEMORY[0x249554254](v14, -1, -1);
    }
    sub_2461C19BC(a1, a2);
    goto LABEL_14;
  }
  v9 = (void *)v8;
  v10 = *(void **)(v2 + *(int *)(type metadata accessor for ModifyContactAttributeConfirmationView() + 20));
  if (v10)
  {
    v11 = v10;
    sub_2461E6A0C();

    sub_2461C19BC(a1, a2);
  }
  else
  {
    sub_2461E6A18();
    sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2461E646C();
    __break(1u);
  }
}

uint64_t sub_2461D9A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  v0 = sub_2461E6010();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ModifyContactAttributeConfirmationView();
  sub_2461E62C8();
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v1 + 88))(v3, v0) != *MEMORY[0x24BE91BC0])
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t *, uint64_t))(v1 + 96))(v3, v0);
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  sub_2461C19BC(v4, v5);
  sub_2461D97E8(v6, v7);
  return sub_2461C19BC(v6, v7);
}

uint64_t sub_2461D9B44(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  OUTLINED_FUNCTION_3_8();
  a2();
  sub_2461BFC74();
  v3 = sub_2461E66AC();
  v5 = v4;
  v7 = v6 & 1;
  sub_2461E6760();
  sub_2461BFCB0(v3, v5, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461D9C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = OUTLINED_FUNCTION_3_8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_2461C1B18(v0, (uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  sub_2461DA184((uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575593F0);
  sub_2461BFDA4(&qword_2575593F8, &qword_2575593F0);
  return sub_2461E6910();
}

uint64_t sub_2461D9CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  _QWORD v48[2];
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
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

  v48[1] = a1;
  v62 = a2;
  v56 = sub_2461E5FE0();
  v53 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v52 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_2461E6928();
  v57 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v49 = (uint64_t)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559400);
  v6 = *(_QWORD *)(v5 - 8);
  v60 = v5;
  v61 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559408);
  v58 = *(_QWORD *)(v8 - 8);
  v59 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)v48 - v12;
  v13 = sub_2461E664C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for ModifyContactAttributeBodyView();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v51 = (uint64_t)v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (_QWORD *)((char *)v48 - v20);
  v22 = a1 + *(int *)(type metadata accessor for ModifyContactAttributeConfirmationView() + 24);
  v23 = (char *)v21 + *(int *)(v17 + 28);
  v24 = sub_2461E62E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, v22, v24);
  sub_2461E6A18();
  sub_2461BFC14(&qword_2575587A0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v21 = sub_2461E6478();
  v21[1] = v25;
  v63 = 0x402E000000000000;
  v26 = *MEMORY[0x24BDF1878];
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 104);
  v27(v16, v26, v13);
  sub_2461C1AAC();
  sub_2461E63C4();
  v63 = 0x4031000000000000;
  v27(v16, v26, v13);
  sub_2461E63C4();
  v28 = v49;
  sub_2461D8F54(v49);
  v30 = v52;
  v29 = v53;
  v31 = v56;
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v52, *MEMORY[0x24BEAB508], v56);
  sub_2461BFC14(&qword_257559410, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
  v33 = v32;
  v34 = v50;
  v35 = v55;
  sub_2461E66D0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v28, v35);
  v63 = v35;
  v64 = v33;
  swift_getOpaqueTypeConformance2();
  v36 = v60;
  sub_2461E66E8();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v34, v36);
  v38 = v58;
  v37 = v59;
  v39 = v54;
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v54, v11, v59);
  v40 = v51;
  sub_2461C1B18((uint64_t)v21, v51, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeBodyView);
  v41 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v42 = v38;
  v43 = v37;
  v41(v11, v39, v37);
  v44 = v62;
  sub_2461C1B18(v40, v62, (uint64_t (*)(_QWORD))type metadata accessor for ModifyContactAttributeBodyView);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559418);
  v41((char *)(v44 + *(int *)(v45 + 48)), v11, v43);
  v46 = *(void (**)(char *, uint64_t))(v42 + 8);
  v46(v39, v43);
  sub_2461C1B58((uint64_t)v21);
  v46(v11, v43);
  return sub_2461C1B58(v40);
}

uint64_t sub_2461DA184(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModifyContactAttributeConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461DA1C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_3_8();
  v3 = OUTLINED_FUNCTION_0_1(v2);
  return sub_2461D9CEC(v3, a1);
}

uint64_t sub_2461DA1F4()
{
  return sub_2461DA300((uint64_t (*)(uint64_t))sub_2461D96F8);
}

uint64_t sub_2461DA200()
{
  uint64_t v0;

  return sub_2461D9B44(*(_QWORD *)(v0 + 16), (void (*)(void))sub_2461DDC94);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_3_8();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575587F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2461E6394();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }

  v6 = v4 + *(int *)(v1 + 24);
  v7 = OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_2461DA2F4()
{
  return sub_2461DA300((uint64_t (*)(uint64_t))sub_2461D9A54);
}

uint64_t sub_2461DA300(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_3_8();
  v2 = OUTLINED_FUNCTION_0_1(v1);
  return a1(v2);
}

uint64_t sub_2461DA328()
{
  uint64_t v0;

  return sub_2461D9B44(*(_QWORD *)(v0 + 16), (void (*)(void))sub_2461DDCA0);
}

void sub_2461DA348()
{
  sub_2461BFDA4(&qword_257559448, qword_257559450);
}

void OUTLINED_FUNCTION_1_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return type metadata accessor for ModifyContactAttributeConfirmationView();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_5_6@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t OUTLINED_FUNCTION_8_4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

char *sub_2461DA3C0(char *a1, char **a2, int *a3)
{
  int v4;
  char *v5;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = v5;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v13(v9, v10, v12);
    v13(&a1[a3[6]], (uint64_t)a2 + a3[6], v12);
    v14 = a3[7];
    v15 = &a1[v14];
    v16 = (uint64_t)a2 + v14;
    v17 = sub_2461E62E0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_2461DA4AC(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  char *v7;
  uint64_t v8;

  v4 = (char *)a1 + a2[5];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)a1 + a2[6], v5);
  v7 = (char *)a1 + a2[7];
  v8 = sub_2461E62E0();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

char *sub_2461DA540(char *a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v7;
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = a2 + v8;
  v11 = v6;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v9, v10, v12);
  v13(&a1[a3[6]], a2 + a3[6], v12);
  v14 = a3[7];
  v15 = &a1[v14];
  v16 = a2 + v14;
  v17 = sub_2461E62E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_2461DA600(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = a3[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(a1 + a3[6], a2 + a3[6], v12);
  v14 = a3[7];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_2461E62E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

char *sub_2461DA6D0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v11 = a3[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_2461E62E0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_2461DA78C(uint64_t a1, char *a2, int *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = &a2[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v11 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], &a2[a3[6]], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = &a2[v12];
  v15 = sub_2461E62E0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_2461DA858()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DA864(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
    {
      v10 = v9;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = OUTLINED_FUNCTION_5_0();
      v11 = *(int *)(a3 + 28);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_2461DA908()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_2461DA914(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_5_0();
      v10 = *(int *)(a4 + 28);
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ModifyContactAttributeBodyView()
{
  uint64_t result;

  result = qword_2575594B0;
  if (!qword_2575594B0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461DA9E0()
{
  unint64_t v0;
  unint64_t v1;

  sub_2461C7C00();
  if (v0 <= 0x3F)
  {
    sub_2461E62E0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2461DAA70()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_2461DAA80()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_4_8();
  v0 = OUTLINED_FUNCTION_18_2();
  v2 = v1;
  swift_bridgeObjectRelease();
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = v0 & 0xFFFFFFFFFFFFLL;
  return v3 == 0;
}

uint64_t sub_2461DAAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_4_8();
  v3 = OUTLINED_FUNCTION_18_2();
  v5 = v4;
  swift_bridgeObjectRelease();
  v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v6 = v3 & 0xFFFFFFFFFFFFLL;
  if (v6)
    return sub_2461E62B0();
  sub_2461E62BC();
  sub_2461E60DC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  sub_2461E6C70();
  OUTLINED_FUNCTION_16_2();
  return v1;
}

uint64_t sub_2461DAB8C()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  _QWORD v91[3];
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;

  v2 = sub_2461E6298();
  v101 = *(_QWORD *)(v2 - 8);
  v102 = v2;
  OUTLINED_FUNCTION_2_5();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v99 = (char *)v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v100 = (char *)v91 - v6;
  v7 = OUTLINED_FUNCTION_4_8();
  v97 = *(_QWORD *)(v7 - 8);
  v8 = *(_QWORD *)(v97 + 64);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v96 = (uint64_t)v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v91 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v103 = (uint64_t)v91 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(qword_257559508);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_7_7();
  v19 = sub_2461DDDC8();
  v20 = sub_2461DAAC8();
  v98 = v7;
  if (v19)
  {
    v91[0] = v8;
    v92 = v12;
    v93 = v1;
    v94 = v18;
    v95 = v17;
    v104 = v20;
    v105 = v21;
    sub_2461BFC74();
    v22 = sub_2461E66AC();
    v24 = v23;
    v26 = v25 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    sub_2461E63D0();
    v27 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_2_7(v27);
    sub_2461DBA3C((uint64_t)v16);
    v28 = sub_2461E66A0();
    v30 = v29;
    v32 = v31;
    v33 = v0;
    swift_release();
    v34 = v32 & 1;
    sub_2461BFCB0(v22, v24, v26);
    OUTLINED_FUNCTION_15_1();
    sub_2461E6628();
    v35 = sub_2461E667C();
    v91[1] = v36;
    v91[2] = v37;
    sub_2461BFCB0(v28, v30, v34);
    swift_bridgeObjectRelease();
    v38 = sub_2461DAA80();
    v96 = v33;
    v39 = v33;
    v40 = v103;
    sub_2461DBA7C(v39, v103);
    if (!v38)
    {
      v41 = v100;
      sub_2461E62A4();
      v42 = v101;
      v43 = v102;
      v44 = v99;
      (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v99, *MEMORY[0x24BE91F40], v102);
      sub_2461E628C();
      v45 = *(void (**)(char *, uint64_t))(v42 + 8);
      v45(v44, v43);
      v46 = v43;
      v40 = v103;
      v45(v41, v46);
    }
    sub_2461C1B58(v40);
    v47 = sub_2461E6670();
    v49 = v48;
    v51 = v50;
    v53 = v52;
    OUTLINED_FUNCTION_5_7(v35);
    OUTLINED_FUNCTION_60();
    v104 = v47;
    v105 = v49;
    v106 = v51 & 1;
    v107 = v53;
    v54 = (uint64_t)v92;
    sub_2461DBA7C(v96, (uint64_t)v92);
    v55 = (*(unsigned __int8 *)(v97 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
    v56 = swift_allocObject();
    sub_2461DBB88(v54, v56 + v55);
    v57 = MEMORY[0x24BDF1FA8];
    v58 = MEMORY[0x24BDF1F80];
    v59 = v93;
    sub_2461E6748();
    swift_release();
    sub_2461BFCB0(v104, v105, v106);
    swift_bridgeObjectRelease();
    v104 = v57;
    v105 = v58;
    OUTLINED_FUNCTION_9_5();
    v60 = v95;
    v61 = sub_2461E66B8();
    OUTLINED_FUNCTION_13_1();
    v62(v59, v60);
  }
  else
  {
    v104 = v20;
    v105 = v21;
    sub_2461BFC74();
    v63 = sub_2461E66AC();
    v65 = v64;
    v67 = v66 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    sub_2461E63D0();
    v68 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_2_7(v68);
    v69 = v0;
    sub_2461DBA3C((uint64_t)v16);
    v70 = sub_2461E66A0();
    v72 = v71;
    v74 = v73;
    swift_release();
    v75 = v74 & 1;
    sub_2461BFCB0(v63, v65, v67);
    OUTLINED_FUNCTION_15_1();
    sub_2461E6628();
    v76 = sub_2461E667C();
    sub_2461BFCB0(v70, v72, v75);
    swift_bridgeObjectRelease();
    LOBYTE(v70) = sub_2461DAA80();
    v77 = v96;
    sub_2461DBA7C(v69, v96);
    if ((v70 & 1) == 0)
    {
      v78 = v100;
      sub_2461E62A4();
      v79 = v101;
      v80 = v102;
      v81 = v99;
      (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v99, *MEMORY[0x24BE91F40], v102);
      sub_2461E628C();
      v82 = *(void (**)(char *, uint64_t))(v79 + 8);
      v82(v81, v80);
      v82(v78, v80);
    }
    sub_2461C1B58(v77);
    v83 = sub_2461E6670();
    v85 = v84;
    v87 = v86;
    v89 = v88 & 1;
    OUTLINED_FUNCTION_5_7(v76);
    OUTLINED_FUNCTION_15_1();
    v104 = v83;
    v105 = v85;
    v106 = v89;
    v107 = v87;
    v61 = sub_2461E66B8();
    sub_2461BFCB0(v83, v85, v89);
    swift_bridgeObjectRelease();
  }
  return v61;
}

uint64_t sub_2461DB240(id *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t result;

  type metadata accessor for ModifyContactAttributeBodyView();
  v2 = sub_2461E6280();
  if (*a1)
  {
    v4 = v2;
    v5 = v3;
    v6 = *a1;
    sub_2461C0E74(v4, v5, v6);

    return sub_2461C19BC(v4, v5);
  }
  else
  {
    sub_2461E6A18();
    sub_2461DBBF4(&qword_2575587A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_2461E646C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2461DB2FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;

  sub_2461E6574();
  v0 = sub_2461E6694();
  v2 = v1;
  v4 = v3 & 1;
  v5 = sub_2461E6688();
  sub_2461BFCB0(v0, v2, v4);
  OUTLINED_FUNCTION_60();
  return v5;
}

uint64_t sub_2461DB3D4@<X0>(uint64_t a1@<X8>)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
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
  uint64_t v84[6];
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  _QWORD v94[5];
  uint64_t v95;

  v80 = a1;
  v4 = sub_2461E5FE0();
  OUTLINED_FUNCTION_1_4(*(_QWORD *)(v4 - 8));
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v6);
  sub_2461E6004();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_7();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  OUTLINED_FUNCTION_8_4(v10, (uint64_t)&v95);
  OUTLINED_FUNCTION_1_4(v11);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_7_7();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  OUTLINED_FUNCTION_8_4(v13, (uint64_t)&v91);
  OUTLINED_FUNCTION_1_4(v14);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575594F0);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_2461E69AC();
  OUTLINED_FUNCTION_8_4(v21, (uint64_t)v94);
  OUTLINED_FUNCTION_1_4(v22);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575594F8);
  OUTLINED_FUNCTION_8_4(v25, (uint64_t)&v92 + 8);
  OUTLINED_FUNCTION_1_4(v26);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v28);
  v29 = sub_2461DAA80();
  v83 = v1;
  v30 = sub_2461DAB8C();
  v31 = v30;
  v32 = MEMORY[0x24BDF4780];
  if (v29)
  {
    v94[0] = v30;
    v33 = MEMORY[0x24BDF4760];
    sub_2461E6760();
    swift_release();
    v94[0] = v32;
    v94[1] = v33;
    OUTLINED_FUNCTION_9_5();
    v31 = sub_2461E66B8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
  v94[3] = v32;
  v94[4] = MEMORY[0x24BEAD938];
  v94[0] = v31;
  v93 = 0;
  v91 = 0u;
  v92 = 0u;
  v90 = 0;
  v88 = 0u;
  v89 = 0u;
  if (sub_2461DAA80())
  {
    v87 = 0;
    v86 = 0u;
    v85 = 0u;
    v34 = v82;
    v35 = v81;
  }
  else
  {
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_10_3();
    v36 = v82;
    v37 = (void *)sub_2461E60DC();
    OUTLINED_FUNCTION_13_1();
    v38(v3, v36);
    v39 = sub_2461E6C70();
    v41 = v40;

    *(_QWORD *)&v85 = v39;
    *((_QWORD *)&v85 + 1) = v41;
    sub_2461BFC74();
    v42 = sub_2461E66AC();
    v44 = v43;
    LOBYTE(v41) = v45 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
    sub_2461E63D0();
    v46 = sub_2461E661C();
    __swift_storeEnumTagSinglePayload(v2, 1, 1, v46);
    sub_2461E6634();
    sub_2461DBA3C(v2);
    v47 = sub_2461E66A0();
    v49 = v48;
    v51 = v50;
    v70 = v4;
    v53 = v52;
    swift_release();
    sub_2461BFCB0(v42, v44, v41);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v85 = v47;
    *((_QWORD *)&v85 + 1) = v49;
    LOBYTE(v86) = v51 & 1;
    *((_QWORD *)&v86 + 1) = v53;
    v54 = MEMORY[0x24BDF1FA8];
    v55 = MEMORY[0x24BDF1F80];
    v56 = v71;
    sub_2461E6760();
    OUTLINED_FUNCTION_5_7(v47);
    v4 = v70;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v85 = v54;
    v35 = v81;
    v34 = v82;
    *((_QWORD *)&v85 + 1) = v55;
    OUTLINED_FUNCTION_9_5();
    v57 = v72;
    v58 = sub_2461E66B8();
    OUTLINED_FUNCTION_13_1();
    v59(v56, v57);
    v87 = MEMORY[0x24BEAD938];
    *((_QWORD *)&v86 + 1) = MEMORY[0x24BDF4780];
    *(_QWORD *)&v85 = v58;
  }
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_10_3();
  v60 = (void *)sub_2461E60DC();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v3, v34);
  v61 = objc_msgSend(v60, sel_identifier);

  sub_2461E6A78();
  OUTLINED_FUNCTION_16_2();
  sub_2461E5FF8();
  OUTLINED_FUNCTION_60();
  v84[3] = sub_2461E68EC();
  v84[4] = MEMORY[0x24BEADA30];
  __swift_allocate_boxed_opaque_existential_1(v84);
  sub_2461E68F8();
  v62 = v76;
  sub_2461E69A0();
  v63 = v79;
  v64 = v78;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v79 + 104))(v78, *MEMORY[0x24BEAB508], v4);
  sub_2461DBBF4(&qword_257559500, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE050], MEMORY[0x24BEAE028]);
  v65 = v73;
  v66 = v77;
  sub_2461E66D0();
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v4);
  OUTLINED_FUNCTION_13_1();
  v67(v62, v66);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v80, v65, v75);
}

uint64_t sub_2461DBA3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461DBA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461DBAC0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  char *v7;
  uint64_t v8;

  v1 = (int *)OUTLINED_FUNCTION_4_8();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + v1[5];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6((char *)v3 + v1[6], v5);
  v7 = (char *)v3 + v1[7];
  v8 = OUTLINED_FUNCTION_5_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return swift_deallocObject();
}

uint64_t sub_2461DBB88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModifyContactAttributeBodyView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461DBBCC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_8() - 8) + 80);
  return sub_2461DB240((id *)(v0 + ((v1 + 16) & ~v1)));
}

uint64_t sub_2461DBBF4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495541D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2461DBC34()
{
  sub_2461E69AC();
  sub_2461DBBF4(&qword_257559500, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE050], MEMORY[0x24BEAE028]);
  return OUTLINED_FUNCTION_9_5();
}

uint64_t OUTLINED_FUNCTION_2_7(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_2461E6634();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return type metadata accessor for ModifyContactAttributeBodyView();
}

uint64_t OUTLINED_FUNCTION_5_7(uint64_t a1)
{
  char v1;
  uint64_t v2;

  return sub_2461BFCB0(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_2461E62BC();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_2461E661C();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_16_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_2461E62B0();
}

uint64_t sub_2461DBD54()
{
  uint64_t v0;

  v0 = sub_2461E664C();
  MEMORY[0x24BDAC7A8](v0);
  if (qword_2575585D0 != -1)
    swift_once();
  OUTLINED_FUNCTION_7_3();
  sub_2461C1AAC();
  OUTLINED_FUNCTION_3_4();
  type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  if (qword_2575585D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_7_3();
  return OUTLINED_FUNCTION_3_4();
}

void sub_2461DBE78(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  if (qword_2575585C0 != -1)
    swift_once();
  v3 = qword_25755ABF0;
  *(_QWORD *)a1 = sub_2461E6538();
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559630);
  sub_2461DBEFC(v1, a1 + *(int *)(v4 + 44));
}

void sub_2461DBEFC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v33[1] = a1;
  v40 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558CA0);
  MEMORY[0x24BDAC7A8](v2);
  v35 = (uint64_t)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2461E6598();
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559638);
  v6 = MEMORY[0x24BDAC7A8](v37);
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v36 = (uint64_t)v33 - v9;
  v10 = sub_2461E6580();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559640);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v33 - v18;
  sub_2461E658C();
  type metadata accessor for GetContactQuickActionButtonLabelStyle(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  sub_2461E63D0();
  sub_2461E68A4();
  sub_2461E63E8();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v13, v10);
  v20 = &v17[*(int *)(v14 + 36)];
  v21 = v42;
  *(_OWORD *)v20 = v41;
  *((_OWORD *)v20 + 1) = v21;
  *((_OWORD *)v20 + 2) = v43;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_2461CA574((uint64_t)v17, (uint64_t)v19, &qword_257559640);
  v22 = v34;
  sub_2461E65A4();
  sub_2461E63D0();
  v23 = sub_2461E661C();
  v24 = v35;
  __swift_storeEnumTagSinglePayload(v35, 1, 1, v23);
  v25 = sub_2461E6634();
  sub_2461C7F84(v24, &qword_257558CA0);
  KeyPath = swift_getKeyPath();
  v28 = v38;
  v27 = v39;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v8, v22, v39);
  v29 = (uint64_t *)&v8[*(int *)(v37 + 36)];
  *v29 = KeyPath;
  v29[1] = v25;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v27);
  v30 = v36;
  sub_2461CA574((uint64_t)v8, v36, &qword_257559638);
  sub_2461CA5A0((uint64_t)v19, (uint64_t)v17, &qword_257559640);
  sub_2461CA5A0(v30, (uint64_t)v8, &qword_257559638);
  v31 = v40;
  sub_2461CA5A0((uint64_t)v17, v40, &qword_257559640);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559648);
  sub_2461CA5A0((uint64_t)v8, v31 + *(int *)(v32 + 48), &qword_257559638);
  sub_2461C7F84(v30, &qword_257559638);
  sub_2461C7F84((uint64_t)v19, &qword_257559640);
  sub_2461C7F84((uint64_t)v8, &qword_257559638);
  sub_2461C7F84((uint64_t)v17, &qword_257559640);
}

uint64_t sub_2461DC2C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _OWORD *v6;
  __int128 v7;
  _OWORD v9[3];

  v2 = sub_2461E6580();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461E658C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  sub_2461E63D0();
  sub_2461E68A4();
  sub_2461E63E8();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  v6 = (_OWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257559640) + 36));
  v7 = v9[1];
  *v6 = v9[0];
  v6[1] = v7;
  v6[2] = v9[2];
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t type metadata accessor for GetContactQuickActionButtonLabelStyle(uint64_t a1)
{
  return sub_2461D55B4(a1, qword_257559568);
}

uint64_t sub_2461DC3E0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DC3EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_5();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return OUTLINED_FUNCTION_1_5(v1, v0, v2);
}

uint64_t sub_2461DC41C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DC428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v0 = OUTLINED_FUNCTION_6_8();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t sub_2461DC450(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2461DC490(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2461DC4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2461DC510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2461DC558(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2461DC5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2461DC5E8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DC5F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_5();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  return OUTLINED_FUNCTION_1_5(v1, v0, v2);
}

uint64_t sub_2461DC624()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DC630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558C00);
  v0 = OUTLINED_FUNCTION_6_8();
  return OUTLINED_FUNCTION_2_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for GetContactQuickActionButtonLabelStyleIconOnly(uint64_t a1)
{
  return sub_2461D55B4(a1, qword_2575595F8);
}

void sub_2461DC66C()
{
  unint64_t v0;

  sub_2461C7C00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_2461DC6D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461DC6E4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2461DC700()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257559650;
  if (!qword_257559650)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559658);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_257559650);
  }
  return result;
}

unint64_t sub_2461DC748()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257559660;
  if (!qword_257559660)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559640);
    v2[0] = sub_2461DC7B4();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257559660);
  }
  return result;
}

unint64_t sub_2461DC7B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257559668;
  if (!qword_257559668)
  {
    v1 = sub_2461E6580();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDF01F8], v1);
    atomic_store(result, (unint64_t *)&qword_257559668);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_2_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2461DC824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_2461E61C0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeAgeView();
  type metadata accessor for GetContactAttributeViewModel();
  result = MEMORY[0x2495531F8]();
  if (*(_QWORD *)(result + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, result + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v0);
    swift_bridgeObjectRelease();
    v5 = sub_2461E619C();
    v7 = v6;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (v7)
      return v5;
    else
      return 48;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t GetContactAttributeAgeView.body.getter@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
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
  void (*v61)(uint64_t, uint64_t);
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
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87[5];
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  v84 = a1;
  v2 = OUTLINED_FUNCTION_5_8();
  v80 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v81 = v3;
  v83 = (uint64_t)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461E6004();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_0();
  v76 = v5;
  v6 = sub_2461E61C0();
  v67 = *(_QWORD *)(v6 - 8);
  v68 = v6;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_0();
  v66 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558730);
  v14 = *(_QWORD *)(v13 - 8);
  v85 = v13;
  v86 = v14;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2461E69DC();
  v72 = *(_QWORD *)(v18 - 8);
  v73 = v18;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_10_0();
  v71 = v20;
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559670);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_10_0();
  v79 = v22;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559678);
  v75 = *(_QWORD *)(v77 - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_10_0();
  v74 = v24;
  v25 = sub_2461DC824();
  v107 = MEMORY[0x24BEE0D00];
  v108 = MEMORY[0x24BEAE5C8];
  v105 = v25;
  v106 = v26;
  v27 = *(int *)(v2 + 20);
  v82 = v1;
  v28 = v1 + v27;
  v69 = OUTLINED_FUNCTION_3_3();
  v70 = v28;
  sub_2461E61FC();
  v29 = (void *)sub_2461E60DC();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v30 = sub_2461E6C70();
  v32 = v31;

  v100 = v30;
  v101 = v32;
  sub_2461BFC74();
  v33 = sub_2461E66AC();
  v35 = v34;
  v100 = v33;
  v101 = v34;
  v37 = v36 & 1;
  v102 = v36 & 1;
  v103 = v38;
  v39 = MEMORY[0x24BDF1FA8];
  v40 = MEMORY[0x24BDF1F80];
  sub_2461E6760();
  sub_2461BFCB0(v33, v35, v37);
  swift_bridgeObjectRelease();
  v100 = v39;
  v101 = v40;
  swift_getOpaqueTypeConformance2();
  v41 = v85;
  v42 = sub_2461E66B8();
  v43 = (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v17, v41);
  v103 = MEMORY[0x24BDF4780];
  v104 = MEMORY[0x24BEAD948];
  v100 = v42;
  result = MEMORY[0x2495531F8](v43);
  if (*(_QWORD *)(result + 16))
  {
    v46 = v66;
    v45 = v67;
    v47 = v68;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v67 + 16))(v66, result + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80)), v68);
    swift_bridgeObjectRelease();
    v48 = sub_2461E6190();
    v50 = v49;
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
    if (v50)
    {
      v51 = MEMORY[0x24BEE0D00];
      *((_QWORD *)&v98 + 1) = MEMORY[0x24BEE0D00];
      v52 = MEMORY[0x24BEAE5C8];
      v99 = MEMORY[0x24BEAE5C8];
      *(_QWORD *)&v97 = v48;
      *((_QWORD *)&v97 + 1) = v50;
    }
    else
    {
      v99 = 0;
      v97 = 0u;
      v98 = 0u;
      v51 = MEMORY[0x24BEE0D00];
      v52 = MEMORY[0x24BEAE5C8];
    }
    v96 = 0;
    v94 = 0u;
    v95 = 0u;
    v93 = 0;
    v91 = 0u;
    v92 = 0u;
    v53 = v70;
    v54 = sub_2461E579C();
    if (v55)
    {
      *((_QWORD *)&v89 + 1) = v51;
      v90 = v52;
      *(_QWORD *)&v88 = v54;
      *((_QWORD *)&v88 + 1) = v55;
    }
    else
    {
      v90 = 0;
      v88 = 0u;
      v89 = 0u;
    }
    sub_2461E61E4();
    sub_2461E5FF8();
    swift_bridgeObjectRelease();
    v87[3] = sub_2461E68EC();
    v87[4] = MEMORY[0x24BEADA30];
    __swift_allocate_boxed_opaque_existential_1(v87);
    sub_2461E68F8();
    v56 = v71;
    sub_2461E69D0();
    v57 = *(_QWORD *)(v53 + *(int *)(v69 + 28));
    v58 = v72;
    v59 = v73;
    v60 = v79;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v79, v56, v73);
    *(_QWORD *)(v60 + *(int *)(v78 + 36)) = v57;
    v61 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    swift_retain();
    v61(v56, v59);
    v62 = v83;
    sub_2461DD184(v82, v83);
    v63 = (*(unsigned __int8 *)(v80 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
    v64 = swift_allocObject();
    sub_2461DD28C(v62, v64 + v63);
    sub_2461DD2F8();
    v65 = v74;
    sub_2461E6748();
    swift_release();
    sub_2461DD3E8(v60);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v75 + 32))(v84, v65, v77);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for GetContactAttributeAgeView()
{
  uint64_t result;

  result = qword_2575596E8;
  if (!qword_2575596E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461DCEB4()
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
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;

  v0 = sub_2461E69F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2461E6250();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeAgeView();
  type metadata accessor for GetContactAttributeViewModel();
  sub_2461E6178();
  v8 = sub_2461E622C();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 >> 60 == 15)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v11 = sub_2461E6310();
    __swift_project_value_buffer(v11, (uint64_t)qword_257559B40);
    v12 = sub_2461E62F8();
    v13 = sub_2461E6BF8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2461B8000, v12, v13, "#GetContactAttributeAgeView could not obtain direct invocation for button press", v14, 2u);
      MEMORY[0x249554254](v14, -1, -1);
    }

  }
  else
  {
    sub_2461C1A2C();
    v15 = sub_2461E6BE0();
    if (v15)
    {
      v16 = (void *)v15;
      sub_2461E6958();
      v17 = v16;
      sub_2461E69E8();

      sub_2461C19BC(v8, v10);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    else
    {
      if (qword_2575585B8 != -1)
        swift_once();
      v18 = sub_2461E6310();
      __swift_project_value_buffer(v18, (uint64_t)qword_257559B40);
      v19 = sub_2461E62F8();
      v20 = sub_2461E6BF8();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2461B8000, v19, v20, "#GetContactAttributeAgeView could not convert direct invocation to actionable command", v21, 2u);
        MEMORY[0x249554254](v21, -1, -1);
      }
      sub_2461C19BC(v8, v10);

    }
  }
}

uint64_t sub_2461DD184(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeAgeView;

  ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactAttributeAgeView - 8) + 16))(a2, a1, ContactAttributeAgeView);
  return a2;
}

uint64_t sub_2461DD1C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_5_8();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v3 + *(int *)(v1 + 20));
  OUTLINED_FUNCTION_3_3();
  v5 = sub_2461E6214();
  OUTLINED_FUNCTION_2_3(v5);
  v6 = sub_2461E6394();
  OUTLINED_FUNCTION_2_3(v6);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2461DD28C(uint64_t a1, uint64_t a2)
{
  uint64_t ContactAttributeAgeView;

  ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ContactAttributeAgeView - 8) + 32))(a2, a1, ContactAttributeAgeView);
  return a2;
}

void sub_2461DD2D0()
{
  OUTLINED_FUNCTION_5_8();
  sub_2461DCEB4();
}

unint64_t sub_2461DD2F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257559680;
  if (!qword_257559680)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559670);
    v2[0] = sub_2461DD364();
    v2[1] = sub_2461DD3A4();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257559680);
  }
  return result;
}

unint64_t sub_2461DD364()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257559688;
  if (!qword_257559688)
  {
    v1 = sub_2461E69DC();
    result = MEMORY[0x2495541D0](MEMORY[0x24BEAE1B8], v1);
    atomic_store(result, (unint64_t *)&qword_257559688);
  }
  return result;
}

unint64_t sub_2461DD3A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257558AC8;
  if (!qword_257558AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558AD0);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDF0710], v1);
    atomic_store(result, (unint64_t *)&qword_257558AC8);
  }
  return result;
}

uint64_t sub_2461DD3E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559670);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461DD428()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for GetContactAttributeAgeView(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  int *ContactAttributeViewModel;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_2461E6970();
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = *(_OWORD *)(v10 + 24);
    *(_OWORD *)&a1[v8 + 24] = v11;
    (**(void (***)(char *, char *))(v11 - 8))(&a1[v8], v10);
    ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
    v13 = ContactAttributeViewModel[5];
    v14 = &v9[v13];
    v15 = &v10[v13];
    v16 = sub_2461E6214();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = ContactAttributeViewModel[6];
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = sub_2461E6394();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    *(_QWORD *)&v9[ContactAttributeViewModel[7]] = *(_QWORD *)&v10[ContactAttributeViewModel[7]];
  }
  swift_retain();
  return a1;
}

uint64_t destroy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ContactAttributeViewModel;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  __swift_destroy_boxed_opaque_existential_1(v5);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  v7 = v5 + *(int *)(ContactAttributeViewModel + 20);
  v8 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v5 + *(int *)(ContactAttributeViewModel + 24);
  v10 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_release();
}

uint64_t initializeWithCopy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int *ContactAttributeViewModel;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + v7, v9);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v12 = ContactAttributeViewModel[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = ContactAttributeViewModel[6];
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(_QWORD *)(v9 + ContactAttributeViewModel[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  int *ContactAttributeViewModel;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  v6 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v7), v9);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v11 = ContactAttributeViewModel[5];
  v12 = v8 + v11;
  v13 = (char *)v9 + v11;
  v14 = sub_2461E6214();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = ContactAttributeViewModel[6];
  v16 = v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_2461E6394();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(uint64_t *)((char *)v9 + ContactAttributeViewModel[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int *ContactAttributeViewModel;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(a2 + v7 + 32);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v12 = ContactAttributeViewModel[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = ContactAttributeViewModel[6];
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(_QWORD *)(v9 + ContactAttributeViewModel[7]);
  return a1;
}

uint64_t assignWithTake for GetContactAttributeAgeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  int *ContactAttributeViewModel;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_2461E6970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  ContactAttributeViewModel = (int *)type metadata accessor for GetContactAttributeViewModel();
  v12 = ContactAttributeViewModel[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = ContactAttributeViewModel[6];
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(v8 + ContactAttributeViewModel[7]) = *(_QWORD *)(v9 + ContactAttributeViewModel[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeAgeView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DD9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_4_9();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_3();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeAgeView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461DDA3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_4_9();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_3();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_2461DDA9C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2461E6970();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for GetContactAttributeViewModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2461DDB20()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559670);
  sub_2461DD2F8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return sub_2461E6970();
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return type metadata accessor for GetContactAttributeAgeView();
}

uint64_t sub_2461DDB84()
{
  return sub_2461DDCAC(MEMORY[0x24BE91BF0]);
}

uint64_t sub_2461DDB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  sub_2461DDF6C(a1, a2);
  if ((v4 & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_1_6();
  return v3;
}

uint64_t sub_2461DDBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_2461DDFD0(a1);
  if ((v3 & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_1_6();
  return v2;
}

void sub_2461DDC18(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;
  id v5;

  if (*(_QWORD *)(a2 + 16))
  {
    v3 = sub_2461DDEEC(a1);
    if ((v4 & 1) != 0)
      v5 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v3);
  }
  OUTLINED_FUNCTION_1();
}

void sub_2461DDC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2461DDF6C(a1, a2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461DDC94()
{
  return sub_2461DDCAC(MEMORY[0x24BE91BE8]);
}

uint64_t sub_2461DDCA0()
{
  return sub_2461DDCAC(MEMORY[0x24BE91C00]);
}

uint64_t sub_2461DDCAC(unsigned int *a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = sub_2461E601C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  v7 = sub_2461E6040();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  v11 = v10 - v9;
  v12 = sub_2461E62D4();
  v13 = MEMORY[0x249553060](v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *a1, v2);
  v14 = sub_2461DDBD4(v6, v13);
  v16 = v15;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  if (!v16)
    return sub_2461E6ACC();
  return v14;
}

BOOL sub_2461DDDC8()
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
  int v10;
  int v11;
  _BOOL8 v12;

  v0 = sub_2461E6268();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0();
  v4 = v3 - v2;
  v5 = sub_2461E6010();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  sub_2461E62C8();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v9, v5);
  v11 = *MEMORY[0x24BE91BB8];
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  if (v10 != v11)
    return 0;
  sub_2461E625C();
  v12 = (*(unsigned int (**)(uint64_t, uint64_t))(v1 + 88))(v4, v0) == *MEMORY[0x24BE91F08];
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return v12;
}

unint64_t sub_2461DDEEC(uint64_t a1)
{
  uint64_t v2;

  sub_2461E6A78();
  sub_2461E6DC0();
  sub_2461E6AE4();
  v2 = sub_2461E6DCC();
  swift_bridgeObjectRelease();
  return sub_2461DE034(a1, v2);
}

unint64_t sub_2461DDF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2461E6DC0();
  sub_2461E6AE4();
  v4 = sub_2461E6DCC();
  return sub_2461DE1A8(a1, a2, v4);
}

unint64_t sub_2461DDFD0(uint64_t a1)
{
  uint64_t v2;

  sub_2461E601C();
  sub_2461DE3C0(&qword_257559720, MEMORY[0x24BE91C28]);
  v2 = sub_2461E6A3C();
  return sub_2461DE288(a1, v2);
}

unint64_t sub_2461DE034(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2461E6A78();
    v8 = v7;
    if (v6 == sub_2461E6A78() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2461E6D9C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2461E6A78();
          v15 = v14;
          if (v13 == sub_2461E6A78() && v15 == v16)
            break;
          v18 = sub_2461E6D9C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_2461DE1A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2461E6D9C() & 1) == 0)
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
      while (!v14 && (sub_2461E6D9C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2461DE288(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_2461E601C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_2461DE3C0(&qword_257559728, MEMORY[0x24BE91C30]);
      v14 = sub_2461E6A48();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void sub_2461DE3C0(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_2461E601C();
    atomic_store(MEMORY[0x2495541D0](a2, v4), a1);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_bridgeObjectRetain();
}

void sub_2461DE410()
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
  id v11;
  uint64_t v12;
  _QWORD v13[5];

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559910);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7_7();
  sub_2461E6148();
  v8 = sub_2461E60DC();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
  sub_2461E6124();
  if ((sub_2461E6130() & 1) != 0)
    v9 = sub_2461E67C0();
  else
    v9 = sub_2461E67B4();
  v10 = v9;
  sub_2461E6154();
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB4938]), sel_initWithQueue_, 0);
  v13[3] = sub_2461C4924(0, (unint64_t *)&qword_257559918);
  v13[4] = &off_2517463B0;
  v13[0] = v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, id))(v0 + 488))(v8, v5, v10, v13, v1, objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19330]), sel_init));
  v12 = sub_2461E6160();
  OUTLINED_FUNCTION_5(v12);
  OUTLINED_FUNCTION_0_3();
}

void sub_2461DE594()
{
  sub_2461DE5AC(MEMORY[0x24BDBA210]);
}

void sub_2461DE5A0()
{
  sub_2461DE5AC(MEMORY[0x24BDBA228]);
}

void sub_2461DE5AC(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v1 = *a1;
  v2 = sub_2461DE658();
  sub_2461DDC18((uint64_t)v1, v2);
  v4 = v3;

  v5 = OUTLINED_FUNCTION_4();
  if (!v4
    || (v6 = OUTLINED_FUNCTION_24_2(v5, sel_array),
        OUTLINED_FUNCTION_51_0(),
        sub_2461E6B2C(),
        OUTLINED_FUNCTION_71_0(),
        v7 = sub_2461E03AC((uint64_t)v1),
        OUTLINED_FUNCTION_60(),
        !v7))
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_66();
}

void sub_2461DE64C()
{
  sub_2461DE5AC(MEMORY[0x24BDBA248]);
}

uint64_t sub_2461DE658()
{
  return sub_2461DE6E4();
}

uint64_t sub_2461DE66C()
{
  return sub_2461DE75C();
}

uint64_t sub_2461DE680()
{
  return sub_2461DE6E4();
}

uint64_t sub_2461DE694()
{
  return sub_2461DE75C();
}

uint64_t sub_2461DE6A8()
{
  return sub_2461DE6E4();
}

uint64_t sub_2461DE6BC()
{
  return sub_2461DE75C();
}

uint64_t sub_2461DE6D0()
{
  return sub_2461DE6E4();
}

uint64_t sub_2461DE6E4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2461E6340();
  OUTLINED_FUNCTION_68_0();
  swift_release();
  return v1;
}

uint64_t sub_2461DE748()
{
  return sub_2461DE75C();
}

uint64_t sub_2461DE75C()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_2461E634C();
}

void sub_2461DE7C0()
{
  sub_2461DE7FC(MEMORY[0x24BE91BD8]);
}

void sub_2461DE7CC()
{
  sub_2461DE7FC(MEMORY[0x24BE91BD0]);
}

void sub_2461DE7D8()
{
  sub_2461DE7FC(MEMORY[0x24BE91BE0]);
}

void sub_2461DE7E4()
{
  sub_2461DE7FC(MEMORY[0x24BE91C08]);
}

void sub_2461DE7F0()
{
  sub_2461DE7FC(MEMORY[0x24BE91BF8]);
}

void sub_2461DE7FC(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_2461E601C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19_1();
  v5 = MEMORY[0x249553060]();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, *a1, v3);
  sub_2461DDBD4(v1, v5);
  v7 = v6;
  OUTLINED_FUNCTION_46_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  if (!v7)
    sub_2461E6ACC();
  OUTLINED_FUNCTION_62();
}

void sub_2461DE8B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v3 = OUTLINED_FUNCTION_33_1();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_102(v1, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v1, v3);
  if (v5 == *MEMORY[0x24BE91D08])
  {
    sub_2461DE7E4();
LABEL_11:
    OUTLINED_FUNCTION_62();
    return;
  }
  if (v5 == *MEMORY[0x24BE91CF8])
  {
    sub_2461DE7C0();
    goto LABEL_11;
  }
  if (v5 == *MEMORY[0x24BE91D20])
  {
    sub_2461DE7F0();
    goto LABEL_11;
  }
  if (v5 == *MEMORY[0x24BE91D00])
  {
    sub_2461DE7D8();
    goto LABEL_11;
  }
  if (v5 == *MEMORY[0x24BE91D18])
  {
    sub_2461DE7CC();
    goto LABEL_11;
  }
  sub_2461E6D90();
  __break(1u);
}

uint64_t sub_2461DE9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs;
  sub_2461E6028();
  OUTLINED_FUNCTION_80();
  swift_bridgeObjectRetain();
  v6 = sub_2461DDB90(a1, a2, v5);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  return v6;
}

uint64_t sub_2461DEA18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  id v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575598C8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_58_0();
  sub_2461DEB24();
  sub_2461DFE38();
  sub_2461DE66C();
  sub_2461E6B80();
  OUTLINED_FUNCTION_15_2();
  v2 = (_QWORD *)OUTLINED_FUNCTION_14_2();
  v3 = OUTLINED_FUNCTION_40_1(v2);
  OUTLINED_FUNCTION_78((uint64_t)v3, (uint64_t)&unk_2575598D8);
  swift_release();
  OUTLINED_FUNCTION_15_2();
  v4 = (_QWORD *)OUTLINED_FUNCTION_14_2();
  v5 = OUTLINED_FUNCTION_40_1(v4);
  OUTLINED_FUNCTION_78((uint64_t)v5, (uint64_t)&unk_2575598E8);
  swift_release();
  OUTLINED_FUNCTION_15_2();
  v6 = (_QWORD *)OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_40_1(v6);
  sub_2461E0C38(v0, (uint64_t)&unk_2575598F8, (uint64_t)v6);
  return swift_release();
}

void sub_2461DEB24()
{
  void **v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  SEL *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  char v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[2];
  char *v50;
  unsigned int v51;
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
  uint64_t v63;
  void *v64;

  OUTLINED_FUNCTION_42();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_33_1();
  v57 = *(_QWORD *)(v4 - 8);
  v58 = v4;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_0();
  v56 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_0();
  v55 = v7;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)v49 - v9;
  v64 = (void *)MEMORY[0x24BEE4AF8];
  v10 = objc_msgSend(*(void **)((char *)v0 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact), sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559228);
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_70_0();
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_37_1();
    v11 = sub_2461E6D60();
    OUTLINED_FUNCTION_60();
  }
  else
  {
    v11 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v12 = (uint64_t)v50;
  if (v11)
  {
    if (v11 < 1)
    {
      __break(1u);
      return;
    }
    v49[1] = v3;
    v13 = 0;
    OUTLINED_FUNCTION_104(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs);
    v51 = *MEMORY[0x24BE91CF8];
    v14 = (SEL *)&unk_251746000;
    v53 = v11;
    v54 = v1;
    do
    {
      if (v52)
        v15 = (id)MEMORY[0x249553D14](v13, v1);
      else
        v15 = OUTLINED_FUNCTION_101(v1 + 8 * v13);
      v16 = v15;
      v17 = sub_2461E1EE0(objc_msgSend(v15, v14[432]));
      v61 = v13;
      if (v18)
      {
        v59 = v18;
        v60 = v17;
      }
      else
      {
        v19 = OUTLINED_FUNCTION_29_1(v17, v14[432]);
        v20 = OUTLINED_FUNCTION_99(v19);
        OUTLINED_FUNCTION_51_0();
        v12 = (uint64_t)v50;
        v21 = sub_2461E6A78();
        v59 = v22;
        v60 = v21;

      }
      v23 = sub_2461E6AA8();
      v25 = v24;
      v26 = OUTLINED_FUNCTION_29_1(v23, v14[432]);
      v27 = OUTLINED_FUNCTION_99(v26);

      sub_2461E6A78();
      sub_2461E6AC0();
      OUTLINED_FUNCTION_46_0();
      v62 = v23;
      v63 = v25;
      swift_bridgeObjectRetain();
      sub_2461E6AF0();
      OUTLINED_FUNCTION_15_1();
      swift_bridgeObjectRelease();
      sub_2461E5F98();
      OUTLINED_FUNCTION_4();
      v28 = sub_2461E6028();
      v29 = OUTLINED_FUNCTION_29_1(v28, sel_identifier);
      v30 = sub_2461E6A78();
      v32 = v31;

      if (*(_QWORD *)(v28 + 16) && (sub_2461DDF6C(v30, v32), (v33 & 1) != 0))
      {
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_52_0();
        OUTLINED_FUNCTION_15_1();
      }
      else
      {
        OUTLINED_FUNCTION_52_0();
        v34 = OUTLINED_FUNCTION_15_1();
        v35 = OUTLINED_FUNCTION_29_1(v34, sel_label);
        if (v35)
        {
          v36 = v35;
          sub_2461E6A78();

        }
      }
      v37 = sub_2461E6A84();
      v38 = OUTLINED_FUNCTION_29_1(v37, v14[432]);
      v39 = OUTLINED_FUNCTION_99(v38);

      sub_2461E6A78();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v57 + 104))(v56, v51, v58);
      v40 = v12;
      sub_2461E2320(v12, v55);
      v41 = objc_allocWithZone((Class)OUTLINED_FUNCTION_94());
      v42 = (id)OUTLINED_FUNCTION_84();
      v0 = &v64;
      MEMORY[0x249553B40]();
      OUTLINED_FUNCTION_82();
      if (v43)
        OUTLINED_FUNCTION_39_1();
      v13 = v61 + 1;
      sub_2461E6B5C();
      sub_2461E6B38();

      sub_2461E25F8(v40, &qword_257558FA8);
      v12 = v40;
      v1 = v54;
      v14 = (SEL *)&unk_251746000;
    }
    while (v53 != v13);
    v44 = OUTLINED_FUNCTION_60();
    v45 = v64;
  }
  else
  {
    v44 = OUTLINED_FUNCTION_60();
    v45 = (void *)MEMORY[0x24BEE4AF8];
  }
  v46 = (void *)*MEMORY[0x24BDBA210];
  OUTLINED_FUNCTION_28_1(v44, &qword_257559880);
  v47 = v46;
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_4();
  v48 = OUTLINED_FUNCTION_91();
  if (v48)
  {
    OUTLINED_FUNCTION_86((uint64_t)v48);
  }
  else
  {
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_51_0();
    v46 = v45;
  }

  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_2461DEFD0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_36_1();
  v0[10] = v1;
  v0[11] = *(_QWORD *)(v1 - 8);
  v2 = OUTLINED_FUNCTION_4_10();
  v3 = OUTLINED_FUNCTION_48_1(v2);
  v0[13] = v3;
  v0[14] = *(_QWORD *)(v3 - 8);
  v0[15] = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

uint64_t sub_2461DF024()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_2461DF07C;
  return sub_2461E6C7C();
}

uint64_t sub_2461DF07C(uint64_t a1)
{
  OUTLINED_FUNCTION_2_9(a1);
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

void sub_2461DF0A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_28_1(v3, &qword_2575598A8);
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_27_2();
  v4 = OUTLINED_FUNCTION_14_2();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = sub_2461E24A8;
  v0[7] = v4;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  OUTLINED_FUNCTION_88(v0 + 2, (uint64_t)sub_2461E15EC);
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_87();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2461DBBF4(&qword_2575598B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575598B8);
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_11_3();
}

#error "2461DF19C: call analysis failed (funcsize=11)"

uint64_t sub_2461DF1C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_36_1();
  v0[10] = v1;
  v0[11] = *(_QWORD *)(v1 - 8);
  v2 = OUTLINED_FUNCTION_4_10();
  v3 = OUTLINED_FUNCTION_48_1(v2);
  v0[13] = v3;
  v0[14] = *(_QWORD *)(v3 - 8);
  v0[15] = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

uint64_t sub_2461DF214()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_2461DF26C;
  return sub_2461E6C88();
}

uint64_t sub_2461DF26C(uint64_t a1)
{
  OUTLINED_FUNCTION_2_9(a1);
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

void sub_2461DF298()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_28_1(v3, &qword_2575598A8);
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_27_2();
  v4 = OUTLINED_FUNCTION_14_2();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = sub_2461E2458;
  v0[7] = v4;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  OUTLINED_FUNCTION_88(v0 + 2, (uint64_t)sub_2461E15EC);
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_87();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2461DBBF4(&qword_2575598B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575598B8);
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_11_3();
}

#error "2461DF38C: call analysis failed (funcsize=11)"

uint64_t sub_2461DF3B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_36_1();
  v0[10] = v1;
  v0[11] = *(_QWORD *)(v1 - 8);
  v2 = OUTLINED_FUNCTION_4_10();
  v3 = OUTLINED_FUNCTION_48_1(v2);
  v0[13] = v3;
  v0[14] = *(_QWORD *)(v3 - 8);
  v0[15] = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

uint64_t sub_2461DF404()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_2461DF45C;
  return sub_2461E6C94();
}

uint64_t sub_2461DF45C(uint64_t a1)
{
  OUTLINED_FUNCTION_2_9(a1);
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_0_7();
}

void sub_2461DF488()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_28_1(v3, &qword_2575598A8);
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_27_2();
  v4 = OUTLINED_FUNCTION_14_2();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = sub_2461E23D8;
  v0[7] = v4;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  OUTLINED_FUNCTION_88(v0 + 2, (uint64_t)sub_2461E15EC);
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_87();
  v0[8] = MEMORY[0x24BEE4AF8];
  sub_2461DBBF4(&qword_2575598B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575598B8);
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_11_3();
}

#error "2461DF57C: call analysis failed (funcsize=11)"

void sub_2461DF5A0()
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
  void (*v22)(char *, _QWORD, uint64_t);
  char v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  id v31;
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
  unint64_t v42;
  char v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t *, _QWORD);
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, _QWORD, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  int v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  OUTLINED_FUNCTION_42();
  v1 = v0;
  v3 = v2;
  v85 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_0();
  v97 = v6;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v7);
  v107 = (uint64_t)&v85 - v8;
  v9 = sub_2461E6118();
  v101 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_0();
  v96 = v10;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v11);
  v86 = (uint64_t)&v85 - v12;
  OUTLINED_FUNCTION_56();
  MEMORY[0x24BDAC7A8](v13);
  v99 = (char *)&v85 - v14;
  v15 = OUTLINED_FUNCTION_33_1();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v85 - v20;
  v22 = *(void (**)(char *, _QWORD, uint64_t))(v16 + 104);
  v22((char *)&v85 - v20, *MEMORY[0x24BE91CF8], v15);
  v23 = OUTLINED_FUNCTION_64(v3);
  OUTLINED_FUNCTION_45_1((uint64_t)v21);
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v100 = v3;
  v95 = v24;
  v24(v19, v3, v15);
  v25 = MEMORY[0x24BE91D20];
  if ((v23 & 1) != 0)
  {
    OUTLINED_FUNCTION_45_1((uint64_t)v19);
LABEL_4:
    OUTLINED_FUNCTION_50_1();
    v98 = OUTLINED_FUNCTION_64(v100);
    v94 = v15;
    OUTLINED_FUNCTION_45_1((uint64_t)v21);
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEE0]), sel_init);
    v27 = v85;
    v28 = *(_QWORD *)(v85 + 16);
    if (v28)
    {
      v91 = v21;
      v90 = OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact;
      v89 = v1 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs;
      v29 = v85 + ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80));
      v88 = *(_QWORD *)(v101 + 72);
      v22 = *(void (**)(char *, _QWORD, uint64_t))(v101 + 16);
      swift_bridgeObjectRetain();
      v92 = v26;
      v93 = v1;
      v30 = v99;
      v87 = v22;
      do
      {
        v105 = v29;
        v106 = v28;
        v22(v30, v29, v9);
        if ((sub_2461E60F4() & 1) != 0)
        {
          sub_2461C4924(0, &qword_257559898);
          OUTLINED_FUNCTION_59_0();
          v31 = sub_2461E16D8();
          v32 = sub_2461E1F4C(v31);
          v34 = v33;
          v35 = v86;
          OUTLINED_FUNCTION_65_0(v86);
          v36 = v96;
          if (v34)
          {
            v104 = v32;
          }
          else
          {
            v104 = sub_2461E610C();
            v34 = v38;
          }
          (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v35, v9);
          OUTLINED_FUNCTION_59_0();
          OUTLINED_FUNCTION_90();
          sub_2461E6C58();
          OUTLINED_FUNCTION_52_0();

        }
        else
        {
          v104 = OUTLINED_FUNCTION_59_0();
          v34 = v37;
          sub_2461E610C();
          OUTLINED_FUNCTION_90();
          sub_2461E6C4C();
          swift_bridgeObjectRelease();
          v36 = v96;
        }
        v39 = sub_2461E6028();
        v40 = sub_2461E60E8();
        if (*(_QWORD *)(v39 + 16) && (v42 = sub_2461DDF6C(v40, v41), (v43 & 1) != 0))
        {
          v44 = (uint64_t *)(*(_QWORD *)(v39 + 56) + 16 * v42);
          v45 = *v44;
          v46 = v44[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          v45 = 0;
          v46 = 0;
        }
        OUTLINED_FUNCTION_52_0();
        OUTLINED_FUNCTION_60();
        OUTLINED_FUNCTION_65_0(v36);
        v103 = v34;
        if (v46)
          v102 = v45;
        else
          v102 = sub_2461E6100();
        v47 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
        v47(v36, v9);
        v25 = sub_2461E6A90();
        OUTLINED_FUNCTION_59_0();
        v95(v91, v100, v94);
        v48 = v9;
        v49 = v107;
        sub_2461E2320(v107, v97);
        v50 = objc_allocWithZone((Class)OUTLINED_FUNCTION_94());
        v30 = v99;
        v51 = (void *)OUTLINED_FUNCTION_84();
        v26 = v92;
        objc_msgSend(v92, sel_addObject_, v51);

        v52 = v49;
        v9 = v48;
        sub_2461E25F8(v52, &qword_257558FA8);
        v47((uint64_t)v30, v48);
        v29 = v105 + v88;
        v28 = v106 - 1;
        v1 = v93;
        v22 = v87;
      }
      while (v106 != 1);
      v27 = swift_bridgeObjectRelease();
    }
    if ((uint64_t)OUTLINED_FUNCTION_29_1(v27, sel_count) < 1)
    {

    }
    else
    {
      if ((v98 & 1) != 0)
      {
        v53 = (id)*MEMORY[0x24BDBA248];
        sub_2461DE658();
        v54 = OUTLINED_FUNCTION_80();
        sub_2461DDC18(v54, v1);
        OUTLINED_FUNCTION_70_0();
        OUTLINED_FUNCTION_4();
        if (v25 && (v55 = objc_msgSend((id)v25, sel_mutableCopy), (id)v25, v55))
        {
          objc_msgSend(v55, sel_unionOrderedSet_, v26);
          swift_getKeyPath();
          swift_getKeyPath();
          v56 = v53;
          v57 = v55;
          OUTLINED_FUNCTION_30_0();
          OUTLINED_FUNCTION_44_1();

          OUTLINED_FUNCTION_42_0();
        }
        else
        {
          swift_getKeyPath();
          swift_getKeyPath();
          v77 = v53;
          v78 = v26;
          OUTLINED_FUNCTION_30_0();
          OUTLINED_FUNCTION_44_1();

          OUTLINED_FUNCTION_42_0();
        }

        OUTLINED_FUNCTION_68_0();
      }
      else
      {
        sub_2461E6A90();
        v63 = v62;
        sub_2461DE680();
        v64 = OUTLINED_FUNCTION_80();
        sub_2461DDC58(v64, v63, v1);
        v66 = v65;
        OUTLINED_FUNCTION_60();
        v67 = OUTLINED_FUNCTION_4();
        if (v66)
        {
          OUTLINED_FUNCTION_28_1(v67, &qword_257559880);
          v68 = OUTLINED_FUNCTION_80();
          sub_2461E0E0C(v68);
          OUTLINED_FUNCTION_10();
          v69 = sub_2461E0F8C();
          objc_msgSend(v69, sel_unionOrderedSet_, v26);
          v70 = sub_2461E6A90();
          v72 = v71;
          v73 = OUTLINED_FUNCTION_24_2(v70, sel_array);
          v74 = sub_2461E6B2C();

          v75 = sub_2461E03AC(v74);
          OUTLINED_FUNCTION_46_0();
          if (!v75)
            v75 = MEMORY[0x24BEE4AF8];
          swift_getKeyPath();
          swift_getKeyPath();
          v76 = (void (*)(uint64_t *, _QWORD))sub_2461E6334();
          sub_2461E1BC0(v75, v70, v72);
          OUTLINED_FUNCTION_60();
          v76(&v108, 0);

          swift_release();
        }
        else
        {
          v79 = sub_2461E6A90();
          v81 = v80;
          v82 = OUTLINED_FUNCTION_29_1(v79, sel_array);
          v83 = sub_2461E6B2C();

          v84 = sub_2461E03AC(v83);
          OUTLINED_FUNCTION_15_1();
          if (!v84)
            v84 = MEMORY[0x24BEE4AF8];
          swift_getKeyPath();
          swift_getKeyPath();
          sub_2461E6334();
          sub_2461E1BC0(v84, v79, v81);
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_42_0();

          swift_release();
        }
      }
      swift_release();
    }
    goto LABEL_42;
  }
  OUTLINED_FUNCTION_50_1();
  v25 = OUTLINED_FUNCTION_64((uint64_t)v19);
  OUTLINED_FUNCTION_45_1((uint64_t)v21);
  OUTLINED_FUNCTION_45_1((uint64_t)v19);
  if ((v25 & 1) != 0)
    goto LABEL_4;
  if (qword_2575585B8 != -1)
    swift_once();
  v58 = OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_41(v58, (uint64_t)qword_257559B40);
  v59 = OUTLINED_FUNCTION_97();
  if (OUTLINED_FUNCTION_21_0(v59))
  {
    *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
    OUTLINED_FUNCTION_43_0(&dword_2461B8000, v60, v61, "#GetContactQuickActionButtonsViewModel didn't get a FaceTimeable action type, returning");
    OUTLINED_FUNCTION_7_0();
  }

LABEL_42:
  OUTLINED_FUNCTION_0_3();
}

void sub_2461DFE38()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  SEL *v11;
  const char **v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;

  OUTLINED_FUNCTION_42();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_0();
  v49 = v5;
  v6 = OUTLINED_FUNCTION_33_1();
  v47 = *(_QWORD *)(v6 - 8);
  v48 = v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_10_0();
  v46 = v7;
  v50 = (void *)MEMORY[0x24BEE4AF8];
  v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact), sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559228);
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_70_0();
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_37_1();
    v9 = sub_2461E6D60();
    OUTLINED_FUNCTION_60();
    if (v9)
      goto LABEL_3;
LABEL_20:
    v36 = OUTLINED_FUNCTION_60();
    v37 = (void *)MEMORY[0x24BEE4AF8];
    goto LABEL_21;
  }
  v9 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    goto LABEL_20;
LABEL_3:
  if (v9 < 1)
  {
    __break(1u);
    return;
  }
  v41 = v3;
  v10 = 0;
  OUTLINED_FUNCTION_104(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs);
  v11 = (SEL *)&unk_251746000;
  v42 = *MEMORY[0x24BE91D08];
  v12 = (const char **)&unk_251746000;
  v44 = v9;
  v45 = v1;
  do
  {
    if (v43)
      v13 = (id)MEMORY[0x249553D14](v10, v1);
    else
      v13 = OUTLINED_FUNCTION_101(v1 + 8 * v10);
    v14 = v13;
    v15 = sub_2461E1EE0(objc_msgSend(v13, v11[432], v41));
    if (!v16)
    {
      v17 = objc_msgSend(OUTLINED_FUNCTION_24_2(v15, v11[432]), sel_stringValue);
      OUTLINED_FUNCTION_71_0();
      sub_2461E6A78();

    }
    v18 = sub_2461E6028();
    v19 = OUTLINED_FUNCTION_24_2(v18, v12[402]);
    v20 = sub_2461E6A78();
    v22 = v21;

    if (*(_QWORD *)(v18 + 16) && (sub_2461DDF6C(v20, v22), (v23 & 1) != 0))
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_46_0();
      OUTLINED_FUNCTION_60();
    }
    else
    {
      OUTLINED_FUNCTION_46_0();
      v24 = OUTLINED_FUNCTION_60();
      v25 = OUTLINED_FUNCTION_24_2(v24, sel_label);
      if (v25)
      {
        v26 = v25;
        sub_2461E6A78();

      }
    }
    v27 = sub_2461E6A9C();
    v28 = OUTLINED_FUNCTION_24_2(v27, v11[432]);
    v29 = objc_msgSend(v28, sel_stringValue);

    sub_2461E6A78();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v47 + 104))(v46, v42, v48);
    v30 = OUTLINED_FUNCTION_14();
    v31 = __swift_storeEnumTagSinglePayload(v49, 1, 1, v30);
    v32 = OUTLINED_FUNCTION_24_2(v31, v12[402]);
    sub_2461E6A78();

    v33 = objc_allocWithZone((Class)OUTLINED_FUNCTION_94());
    v34 = (id)OUTLINED_FUNCTION_84();
    MEMORY[0x249553B40]();
    OUTLINED_FUNCTION_82();
    if (v35)
      OUTLINED_FUNCTION_39_1();
    ++v10;
    sub_2461E6B5C();
    sub_2461E6B38();

    v1 = v45;
    v11 = (SEL *)&unk_251746000;
    v12 = (const char **)&unk_251746000;
  }
  while (v44 != v10);
  v36 = OUTLINED_FUNCTION_60();
  v37 = v50;
LABEL_21:
  v38 = (void *)*MEMORY[0x24BDBA228];
  OUTLINED_FUNCTION_28_1(v36, &qword_257559880);
  v39 = v38;
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_4();
  v40 = OUTLINED_FUNCTION_91();
  if (v40)
  {
    OUTLINED_FUNCTION_86((uint64_t)v40);
  }
  else
  {
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_51_0();
    v38 = v37;
  }

  OUTLINED_FUNCTION_0_3();
}

id sub_2461E0234()
{
  return objc_msgSend((id)objc_opt_self(), sel_supportsTelephonyCalls);
}

unint64_t sub_2461E025C()
{
  return (unint64_t)sub_2461E0234() & 1;
}

void sub_2461E0274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2461E02A4(a1, a2, a3);
}

uint64_t sub_2461E0294(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2461E029C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

void sub_2461E02A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v6[2] = sub_2461E0358;
    v6[3] = &block_descriptor_64;
    v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, sel_launchAppForDialRequest_completion_, a1, v5);
  _Block_release(v5);
}

void sub_2461E0358(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_2461E03AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_2461E6D18();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_2461D802C(i, (uint64_t)v5);
    sub_2461E60A0();
    if (!swift_dynamicCast())
      break;
    sub_2461E6D00();
    sub_2461E6D24();
    sub_2461E6D30();
    sub_2461E6D0C();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_2461E04A4()
{
  swift_bridgeObjectRetain();
  return sub_2461DE66C();
}

uint64_t sub_2461E04CC()
{
  swift_bridgeObjectRetain();
  return sub_2461DE694();
}

uint64_t sub_2461E04F4()
{
  swift_bridgeObjectRetain();
  return sub_2461DE6BC();
}

uint64_t sub_2461E051C()
{
  swift_bridgeObjectRetain();
  return sub_2461DE748();
}

#error "2461E05E0: call analysis failed (funcsize=48)"

id sub_2461E0604()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  id result;
  uint64_t i;
  id v5;
  void *v6;
  objc_super v7;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_cancelableTokens];
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)OUTLINED_FUNCTION_75_0();
    if (v2)
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease_n();
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for GetContactQuickActionButtonsViewModel();
    return objc_msgSendSuper2(&v7, sel_dealloc);
  }
  OUTLINED_FUNCTION_75_0();
  result = (id)sub_2461E6D60();
  v2 = (uint64_t)result;
  if (!result)
    goto LABEL_9;
LABEL_3:
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x249553D14](i, v1);
      else
        v5 = OUTLINED_FUNCTION_101(v1 + 8 * i);
      v6 = v5;
      objc_msgSend(v5, sel_cancel);

    }
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_2461E0838()
{
  return type metadata accessor for GetContactQuickActionButtonsViewModel();
}

uint64_t type metadata accessor for GetContactQuickActionButtonsViewModel()
{
  uint64_t result;

  result = qword_257559810;
  if (!qword_257559810)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2461E0878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void (*v26)(void);
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_42();
  v31 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  v6 = (_QWORD *)OUTLINED_FUNCTION_14();
  v7 = *(v6 - 1);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  v13 = OUTLINED_FUNCTION_33_1();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_56_0();
  sub_2461E6088();
  v15 = sub_2461E60AC();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v13);
  if ((v15 & 1) == 0)
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_41(v21, (uint64_t)qword_257559B40);
    v22 = OUTLINED_FUNCTION_97();
    if (OUTLINED_FUNCTION_21_0(v22))
    {
      *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
      v20 = "#GetContactQuickActionButtonsViewModel performCall provided action type mismatched";
LABEL_11:
      OUTLINED_FUNCTION_43_0(&dword_2461B8000, v18, v19, v20);
      OUTLINED_FUNCTION_7_0();
    }
    goto LABEL_12;
  }
  sub_2461E607C();
  if (__swift_getEnumTagSinglePayload(v5, 1, (uint64_t)v6) == 1)
  {
    sub_2461E25F8(v5, &qword_257558FA8);
    if (qword_2575585B8 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_41(v16, (uint64_t)qword_257559B40);
    v17 = OUTLINED_FUNCTION_97();
    if (OUTLINED_FUNCTION_21_0(v17))
    {
      *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
      v20 = "#GetContactQuickActionButtonsViewModel performCall but no URL available, cannot execute";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_20;
  }
  v23 = OUTLINED_FUNCTION_102((uint64_t)v12, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
  OUTLINED_FUNCTION_28_1(v23, (unint64_t *)&qword_257559860);
  OUTLINED_FUNCTION_102((uint64_t)v10, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  sub_2461E0B94();
  if (v24)
  {
    v25 = v24;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v31 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer), *(_QWORD *)(v31 + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer + 24));
    OUTLINED_FUNCTION_35_0();
    v26();
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v27 = OUTLINED_FUNCTION_74();
    v25 = OUTLINED_FUNCTION_41(v27, (uint64_t)qword_257559B40);
    v28 = sub_2461E6BF8();
    if (os_log_type_enabled(v25, v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2461B8000, v25, v28, "#GetContactQuickActionButtonsViewModel performCall failed to construct dial request", v29, 2u);
      OUTLINED_FUNCTION_7_0();
    }
  }

  OUTLINED_FUNCTION_67_0(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
LABEL_20:
  OUTLINED_FUNCTION_0_3();
}

void sub_2461E0B94()
{
  id v0;
  uint64_t v1;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v0, sel_initWithURL_, sub_2461E5F8C());
  OUTLINED_FUNCTION_71_0();
  v1 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5(v1);
  OUTLINED_FUNCTION_66();
}

uint64_t sub_2461E0BF0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2461E2720;
  return sub_2461DEFD0();
}

uint64_t sub_2461E0C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2461E6B80();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2461E25F8(a1, &qword_2575598C8);
  }
  else
  {
    sub_2461E6B74();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2461E6B68();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2461E0D7C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2461E2720;
  return sub_2461DF1C0();
}

uint64_t sub_2461E0DC4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2461E2720;
  return sub_2461DF3B0();
}

void sub_2461E0E0C(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_2461E6D60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_2461E19C4(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      for (i = 0; i != v2; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
          MEMORY[0x249553D14](i, a1);
        else
          v4 = *(id *)(a1 + 8 * i + 32);
        sub_2461E60A0();
        swift_dynamicCast();
        v5 = v9;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2461E19C4(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v5 = v9;
        }
        v7 = *(_QWORD *)(v5 + 16);
        v6 = *(_QWORD *)(v5 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_2461E19C4(v6 > 1, v7 + 1, 1);
          v5 = v9;
        }
        *(_QWORD *)(v5 + 16) = v7 + 1;
        sub_2461E2310(&v8, (_OWORD *)(v5 + 32 * v7 + 32));
      }
    }
  }
}

id sub_2461E0F8C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2461E6B20();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_2461E1000(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD, _QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void (*v44)(_BYTE *, _QWORD);
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  void (*v50)(_BYTE *, _QWORD);
  uint64_t v51;
  char *v52;
  unsigned int v53;
  void (*v54)(_QWORD, _QWORD, _QWORD);
  uint64_t v55;
  char *v56;
  char *v57;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  _BYTE v71[32];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  MEMORY[0x24BDAC7A8](v4);
  v62 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2461E60D0();
  v60 = *(_QWORD *)(v6 - 8);
  v61 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v59 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2461E6118();
  v63 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v51 - v12;
  swift_beginAccess();
  v14 = MEMORY[0x2495542D8](a1 + 16);
  if (v14)
  {
    v15 = (char *)v14;
    v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEE0]), sel_init);
    v17 = *(_QWORD *)(a2 + 16);
    if (v17)
    {
      v52 = v15;
      v56 = &v15[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs];
      v18 = a2 + ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80));
      v55 = *(_QWORD *)(v63 + 72);
      v19 = *(void (**)(_QWORD, _QWORD, _QWORD))(v63 + 16);
      v53 = *MEMORY[0x24BE91D08];
      v51 = a2;
      swift_bridgeObjectRetain();
      v58 = v16;
      v54 = v19;
      v57 = v11;
      do
      {
        v19(v13, v18, v8);
        v20 = sub_2461E6028();
        v21 = sub_2461E60E8();
        v23 = *(_QWORD *)(v20 + 16);
        v70 = v17;
        if (v23 && (v24 = sub_2461DDF6C(v21, v22), (v25 & 1) != 0))
        {
          v26 = (uint64_t *)(*(_QWORD *)(v20 + 56) + 16 * v24);
          v27 = *v26;
          v28 = v26[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          v27 = 0;
          v28 = 0;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19(v11, v13, v8);
        if (v28)
          v68 = v27;
        else
          v68 = sub_2461E6100();
        v69 = *(void (**)(char *, uint64_t))(v63 + 8);
        v69(v11, v8);
        v29 = sub_2461E6A9C();
        v66 = v30;
        v67 = v29;
        v31 = sub_2461E610C();
        v64 = v32;
        v65 = v31;
        sub_2461E610C();
        (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v59, v53, v61);
        v33 = sub_2461E5FA4();
        __swift_storeEnumTagSinglePayload(v62, 1, 1, v33);
        sub_2461E60E8();
        v34 = objc_allocWithZone((Class)sub_2461E60A0());
        v11 = v57;
        v35 = (void *)sub_2461E6058();
        v16 = v58;
        objc_msgSend(v58, sel_addObject_, v35);

        v69(v13, v8);
        v18 += v55;
        v17 = v70 - 1;
        v19 = v54;
      }
      while (v70 != 1);
      swift_bridgeObjectRelease();
      v15 = v52;
    }
    if ((uint64_t)objc_msgSend(v16, sel_count) <= 0)
    {

    }
    else
    {
      v36 = (id)*MEMORY[0x24BDBA228];
      v37 = v15;
      v38 = sub_2461DE658();
      sub_2461DDC18((uint64_t)v36, v38);
      v40 = v39;

      swift_bridgeObjectRelease();
      if (v40 && (v41 = objc_msgSend(v40, sel_mutableCopy), v40, v41))
      {
        objc_msgSend(v41, sel_unionOrderedSet_, v16);
        swift_getKeyPath();
        swift_getKeyPath();
        v42 = v36;
        v43 = v41;
        v44 = (void (*)(_BYTE *, _QWORD))sub_2461E6334();
        sub_2461E1B54((uint64_t)v43, v42);

        v44(v71, 0);
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        v49 = v36;
        v43 = v16;
        v50 = (void (*)(_BYTE *, _QWORD))sub_2461E6334();
        sub_2461E1B54((uint64_t)v43, v49);

        v50(v71, 0);
      }

      swift_release();
      swift_release();
    }
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v45 = sub_2461E6310();
    __swift_project_value_buffer(v45, (uint64_t)qword_257559B40);
    v46 = sub_2461E62F8();
    v47 = sub_2461E6BF8();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_2461B8000, v46, v47, "#GetContactQuickActionButtonsViewModel tried to process actions but already got dealloc'ed", v48, 2u);
      MEMORY[0x249554254](v48, -1, -1);
    }

  }
}

uint64_t sub_2461E15EC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2461E1618(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void *v11;

  v5 = OUTLINED_FUNCTION_33_1();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  swift_beginAccess();
  result = MEMORY[0x2495542D8](a1 + 16);
  if (result)
  {
    v11 = (void *)result;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v9, *a3, v5);
    sub_2461DF5A0();

    return OUTLINED_FUNCTION_67_0(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }
  return result;
}

id sub_2461E16D8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2461E6A54();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

void sub_2461E1748()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2461E1780()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_2461E6250();
  if (v0 <= 0x3F)
  {
    sub_2461E6040();
    if (v1 <= 0x3F)
    {
      sub_2461E18A4(319, &qword_257559838, &qword_257559840);
      if (v2 <= 0x3F)
      {
        sub_2461E18A4(319, &qword_257559848, (uint64_t *)&unk_257559850);
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2461E18A4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_2461E6358();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2461E18F0()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2461E18FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GetContactQuickActionButtonsViewModel();
  result = sub_2461E631C();
  *a1 = result;
  return result;
}

uint64_t sub_2461E1938(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2461E199C;
  return v6(a1);
}

uint64_t sub_2461E199C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_9();
  return OUTLINED_FUNCTION_34_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_2461E19C4(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_2461D66BC(a1, a2, a3, *v3);
  *v3 = v4;
}

void sub_2461E19E0(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_2461D6760(a1, a2, a3, *v3);
  *v3 = v4;
}

void sub_2461E19FC(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_2461D6804(a1, a2, a3, *v3);
  *v3 = v4;
}

uint64_t sub_2461E1A18(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_2461DDEEC(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v2;
  *v2 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559888);
  sub_2461E6D3C();

  v6 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v4);
  type metadata accessor for CNActionType(0);
  sub_2461C4924(0, &qword_257559880);
  sub_2461DBBF4(&qword_257559890, (uint64_t (*)(uint64_t))type metadata accessor for CNActionType, (uint64_t)&unk_2461E748C);
  sub_2461E6D48();
  *v2 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2461E1B54(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_2461E1C3C(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461E1BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2461E1D40(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_2461E1C3C(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;

  v3 = (_QWORD **)v2;
  v5 = (_QWORD *)*v2;
  v6 = sub_2461DDEEC((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v6;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559888);
  if ((sub_2461E6D3C() & 1) == 0)
    goto LABEL_5;
  v10 = sub_2461DDEEC((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    type metadata accessor for CNActionType(0);
    sub_2461E6DA8();
    __break(1u);
    return;
  }
  v8 = v10;
LABEL_5:
  v12 = *v3;
  if ((v9 & 1) != 0)
  {
    v13 = v12[7];

    *(_QWORD *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_2461E1E54(v8, (uint64_t)a2, a1, v12);
    v14 = a2;
  }
}

uint64_t sub_2461E1D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2461DDF6C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575598A0);
  if ((sub_2461E6D3C() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2461DDF6C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_2461E6DA8();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_2461E1E98(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2461E1E54(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t sub_2461E1E98(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_2461E1EE0(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_formattedStringValue);

  if (!v2)
    return 0;
  v3 = sub_2461E6A78();

  return v3;
}

uint64_t sub_2461E1F4C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_formattedStringValue);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2461E6A78();

  return v3;
}

void sub_2461E1FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  id v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v57;
  uint64_t v58;
  uint64_t v59[5];

  OUTLINED_FUNCTION_42();
  v23 = v22;
  v25 = v24;
  v54 = v27;
  v55 = v26;
  v29 = v28;
  v56 = v30;
  v51 = v31;
  v53 = v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559868);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_7_7();
  v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257559870);
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_58_0();
  v59[3] = v23;
  v59[4] = a21;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v59);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(boxed_opaque_existential_1, v29, v23);
  *(_QWORD *)&v25[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_cancelableTokens] = MEMORY[0x24BEE4AF8];
  v37 = OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_lock;
  v38 = objc_allocWithZone(MEMORY[0x24BDD1648]);
  v39 = v25;
  *(_QWORD *)&v25[v37] = objc_msgSend(v38, sel_init);
  v40 = &v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__actionsByType];
  v41 = MEMORY[0x24BEE4B00];
  v58 = MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257559840);
  sub_2461E6328();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v40, v21, v34);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257559850);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_23_2();
  v58 = v41;
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact] = v51;
  sub_2461E22CC((uint64_t)v59, (uint64_t)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer]);
  v42 = &v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_directInvocationsModel];
  v43 = OUTLINED_FUNCTION_93();
  v50 = *(_QWORD *)(v43 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v42, v53, v43);
  v44 = objc_allocWithZone(MEMORY[0x24BE19338]);
  v52 = v51;
  v45 = objc_msgSend(v44, sel_initWithDiscoveringEnvironment_, v54);
  *(_QWORD *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dataSource] = v45;
  v46 = &v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_labelCATs];
  v47 = OUTLINED_FUNCTION_95();
  v48 = *(_QWORD *)(v47 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v46, v55, v47);
  *(_QWORD *)&v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_textColor] = v56;
  swift_retain();
  sub_2461E67C0();
  LOBYTE(v35) = sub_2461E6790();
  swift_release();
  v39[OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_shouldUseLightBackground] = v35 & 1;

  v57.receiver = v39;
  v57.super_class = (Class)type metadata accessor for GetContactQuickActionButtonsViewModel();
  v49 = objc_msgSendSuper2(&v57, sel_init);
  sub_2461DEA18();

  OUTLINED_FUNCTION_68_0();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v55, v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v43);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_2461E22CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_2461E2310(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2461E2320(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2461E2368()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_72_0();
  *v0 = sub_2461DE680();
  OUTLINED_FUNCTION_1();
}

void sub_2461E238C()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_72_0();
  *v0 = sub_2461DE658();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461E23B0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2461E23D8()
{
  uint64_t v0;

  return sub_2461E1618(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BE91D20]);
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

unint64_t sub_2461E2410()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575598C0;
  if (!qword_2575598C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575598B8);
    result = MEMORY[0x2495541D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2575598C0);
  }
  return result;
}

uint64_t sub_2461E2458()
{
  uint64_t v0;

  return sub_2461E1618(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BE91CF8]);
}

uint64_t objectdestroy_11Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2461E24A8()
{
  uint64_t v0;

  sub_2461E1000(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2461E24B4()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_61_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_85(v0);
  OUTLINED_FUNCTION_12_3(v1);
  return sub_2461E0BF0();
}

uint64_t sub_2461E2504()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_61_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_85(v0);
  OUTLINED_FUNCTION_12_3(v1);
  return sub_2461E0D7C();
}

uint64_t sub_2461E2550()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_9();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t objectdestroy_31Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2461E25AC()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_61_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_85(v0);
  OUTLINED_FUNCTION_12_3(v1);
  return sub_2461E0DC4();
}

uint64_t sub_2461E25F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5(v3);
  return a1;
}

uint64_t sub_2461E2624()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2461E2648(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_85(v5);
  *v6 = v2;
  v6[1] = sub_2461E26B4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257559900 + dword_257559900))(a1, v4);
}

uint64_t sub_2461E26B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_9();
  return OUTLINED_FUNCTION_34_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_2461E26D8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_72_0();
  *v0 = sub_2461DE6D0();
  OUTLINED_FUNCTION_1();
}

void sub_2461E26FC()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_72_0();
  *v0 = sub_2461DE6A8();
  OUTLINED_FUNCTION_1();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_7(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_9(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 136) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_2461E6CD0();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_11_3()
{
  JUMPOUT(0x249553C54);
}

uint64_t OUTLINED_FUNCTION_12_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a9 + 8))(v9, v10);
}

BOOL OUTLINED_FUNCTION_21_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v0, v3, v2);
}

id OUTLINED_FUNCTION_24_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_25_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(v11, a11);
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_2461E6328();
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_28_1(uint64_t a1, unint64_t *a2)
{
  return sub_2461C4924(0, a2);
}

id OUTLINED_FUNCTION_29_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_2461E6334();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_2461E60D0();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  return sub_2461E68BC();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_2461E6B44();
}

id OUTLINED_FUNCTION_40_1(_QWORD *a1)
{
  void *v1;

  a1[2] = 0;
  a1[3] = 0;
  a1[4] = v1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2461E62F8();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

void OUTLINED_FUNCTION_43_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  void *v0;
  uint64_t v1;

  return sub_2461E1B54(v1, v0);
}

uint64_t OUTLINED_FUNCTION_45_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_48_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = a1;
  return sub_2461E68D4();
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v0, v2);
}

void OUTLINED_FUNCTION_51_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return sub_2461E610C();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1)
{
  uint64_t v1;

  return sub_2461BF2B4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_65_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_67_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_70_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_71_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_73_0(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_74_0()
{
  uint64_t v0;

  return sub_2461E1A18(v0);
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_2461E0C38(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return sub_2461E6B2C();
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_81()
{
  return sub_2461E6C1C();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return sub_2461E6058();
}

uint64_t OUTLINED_FUNCTION_85(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_86(uint64_t a1)
{
  void *v1;

  return sub_2461E1B54(a1, v1);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_2461E68C8();
}

void *OUTLINED_FUNCTION_88@<X0>(const void *aBlock@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = v2;
  return _Block_copy(aBlock);
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_release();
}

id OUTLINED_FUNCTION_91()
{
  return sub_2461E0F8C();
}

unint64_t OUTLINED_FUNCTION_92()
{
  return sub_2461E2410();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return sub_2461E6250();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_2461E60A0();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_2461E6040();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_2461E6BF8();
}

void OUTLINED_FUNCTION_98()
{
  unint64_t v0;

  sub_2461E0E0C(v0);
}

id OUTLINED_FUNCTION_99(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 2632));
}

void OUTLINED_FUNCTION_100()
{
  const void *v0;

  _Block_release(v0);
}

id OUTLINED_FUNCTION_101@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_102@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_103(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t))
{
  uint64_t v10;

  return a10(a1, v10);
}

void OUTLINED_FUNCTION_104(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 184) = v1 + a1;
  *(_QWORD *)(v3 - 192) = v2 & 0xC000000000000001;
}

uint64_t sub_2461E2BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_2461E60D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BE91D08])
    return 0x2E6567617373656DLL;
  if (v5 == *MEMORY[0x24BE91CF8])
  {
    v7 = 0x2E656E6F6870;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6966000000000000;
  }
  if (v5 == *MEMORY[0x24BE91D20])
  {
    v7 = 0x2E6F65646976;
    return v7 & 0xFFFFFFFFFFFFLL | 0x6966000000000000;
  }
  if (v5 == *MEMORY[0x24BE91D00])
    return 0x65706F6C65766E65;
  if (v5 == *MEMORY[0x24BE91D18])
    return 0xD000000000000029;
  result = sub_2461E6D90();
  __break(1u);
  return result;
}

uint64_t sub_2461E2D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_2461E2D80()
{
  uint64_t v0;

  v0 = sub_2461E6004();
  MEMORY[0x24BDAC7A8](v0);
  sub_2461E5FEC();
  return sub_2461E68F8();
}

uint64_t GetContactAttributeView.body.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v28;
  char *v29;
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
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t (*v50)(_QWORD);
  char v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t);
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t);
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t);
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t KeyPath;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(char *, uint64_t);
  _QWORD v113[2];
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t ContactAttributeMultiResultView;
  uint64_t *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t ContactAttributeSingleResultView;
  uint64_t v128;
  uint64_t v129;
  uint64_t ContactAttributeViewModel;
  uint64_t v131;
  uint64_t v132;
  uint64_t ContactView;
  uint64_t v134;
  uint64_t v135;
  uint64_t ContactAttributeAgeView;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _QWORD v144[2];
  uint64_t v145;
  unint64_t v146;
  _UNKNOWN **v147;
  char v148[8];

  v144[1] = a1;
  v144[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_257559980);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_10_0();
  v143 = v2;
  ContactAttributeMultiResultView = type metadata accessor for GetContactAttributeMultiResultView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v4);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559988);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_10(v6);
  ContactAttributeViewModel = type metadata accessor for GetContactAttributeViewModel();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v8);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559990);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v10);
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559998);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_10(v12);
  v116 = sub_2461E664C();
  v115 = *(_QWORD *)(v116 - 8);
  MEMORY[0x24BDAC7A8](v116);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_10(v13);
  ContactAttributeSingleResultView = type metadata accessor for GetContactAttributeSingleResultView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_10(v15);
  v129 = sub_2461E6394();
  v131 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_18();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_2_10((uint64_t)v113 - v18);
  ContactAttributeAgeView = type metadata accessor for GetContactAttributeAgeView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_6(v20);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575599A0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_10_0();
  v139 = v22;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575599A8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_10_0();
  v134 = v24;
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575599B0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_10_0();
  v135 = v26;
  ContactView = type metadata accessor for GetContactView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v113 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575599B8);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_10_0();
  v140 = v32;
  v33 = sub_2461E6214();
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_18();
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)v113 - v37;
  v39 = MEMORY[0x24BDAC7A8](v36);
  v41 = (char *)v113 - v40;
  v42 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)v113 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v46 = (char *)v113 - v45;
  type metadata accessor for GetContactAttributeView();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v47);
  v49 = (char *)v113 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461BFEA0(v142, (uint64_t)v49, v50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2461BFECC((uint64_t)v49, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeView);
    OUTLINED_FUNCTION_4_11();
    sub_2461E3B5C();
    return sub_2461E6550();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v46, v49, v33);
    v52 = sub_2461E616C();
    v125 = v34;
    v113[1] = v30;
    if ((v52 & 1) != 0)
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v44, v46, v33);
      sub_2461E613C();
      OUTLINED_FUNCTION_4_11();
      v53 = v46;
      OUTLINED_FUNCTION_6_10((uint64_t)v29);
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_19_2(&qword_2575599D0, v54, (uint64_t)&protocol conformance descriptor for GetContactView);
      sub_2461C2130(&qword_2575599D8, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeAgeView, (uint64_t)&protocol conformance descriptor for GetContactAttributeAgeView);
      v55 = v135;
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_15_3(v55, v139);
      OUTLINED_FUNCTION_7_1();
      sub_2461E3BC8();
      OUTLINED_FUNCTION_20();
      v56 = v140;
      sub_2461E6550();
      OUTLINED_FUNCTION_13_2(v55);
      sub_2461BFECC((uint64_t)v29, (uint64_t (*)(_QWORD))type metadata accessor for GetContactView);
      v57 = v33;
      v58 = v143;
    }
    else
    {
      v59 = sub_2461C0140();
      v113[0] = v46;
      if ((v59 & 1) != 0)
      {
        v60 = v34;
        v61 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
        v61(v41, v46, v33);
        v62 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
        v146 = sub_2461E3DB0();
        v147 = &off_2517463B0;
        v145 = (uint64_t)v62;
        v63 = v128 + *(int *)(ContactAttributeAgeView + 20);
        sub_2461E22CC((uint64_t)&v145, v63);
        v64 = ContactAttributeViewModel;
        v61((char *)(v63 + *(int *)(ContactAttributeViewModel + 20)), v41, v33);
        OUTLINED_FUNCTION_12_4();
        v65 = v131;
        OUTLINED_FUNCTION_11_4();
        v66 = OUTLINED_FUNCTION_10_4((uint64_t)v148);
        v68 = *(_QWORD *)(v67 - 256);
        v69(v66);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v65 + 32))(v63 + *(int *)(v64 + 24), v61, v68);
        if ((OUTLINED_FUNCTION_12_4() & 1) != 0)
          v70 = sub_2461E67C0();
        else
          v70 = sub_2461E67B4();
        v81 = v70;
        v58 = v143;
        v56 = v140;
        OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8));
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v145);
        *(_QWORD *)(v63 + *(int *)(v64 + 28)) = v81;
        v82 = v128;
        sub_2461E6964();
        OUTLINED_FUNCTION_6_10(v82);
        OUTLINED_FUNCTION_4_11();
        sub_2461C2130(&qword_2575599D0, (uint64_t (*)(uint64_t))type metadata accessor for GetContactView, (uint64_t)&protocol conformance descriptor for GetContactView);
        OUTLINED_FUNCTION_19_2(&qword_2575599D8, v83, (uint64_t)&protocol conformance descriptor for GetContactAttributeAgeView);
        v84 = v135;
        OUTLINED_FUNCTION_24_3();
        OUTLINED_FUNCTION_15_3(v84, v139);
        OUTLINED_FUNCTION_7_1();
        sub_2461E3BC8();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_3_9();
        OUTLINED_FUNCTION_13_2(v84);
        sub_2461BFECC(v82, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeAgeView);
        v57 = v33;
      }
      else if ((sub_2461E61D8() & 1) != 0)
      {
        OUTLINED_FUNCTION_16_4((uint64_t)v38, (uint64_t)v46);
        v71 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
        v146 = OUTLINED_FUNCTION_23_3();
        v147 = &off_2517463B0;
        v145 = (uint64_t)v46;
        v72 = (uint64_t)v121 + *(int *)(ContactAttributeSingleResultView + 20);
        sub_2461E22CC((uint64_t)&v145, v72);
        v73 = ContactAttributeViewModel;
        v57 = v33;
        OUTLINED_FUNCTION_16_4(v72 + *(int *)(ContactAttributeViewModel + 20), (uint64_t)v38);
        sub_2461E61F0();
        v74 = v131;
        OUTLINED_FUNCTION_11_4();
        v75 = OUTLINED_FUNCTION_10_4((uint64_t)&v143);
        v77 = *(_QWORD *)(v76 - 256);
        v78(v75);
        (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v72 + *(int *)(v73 + 24), v44, v77);
        v79 = sub_2461E61F0();
        v58 = v143;
        if ((v79 & 1) != 0)
          v80 = sub_2461E67C0();
        else
          v80 = sub_2461E67B4();
        v97 = v80;
        v56 = v140;
        OUTLINED_FUNCTION_14_3();
        v98(v38, v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v145);
        *(_QWORD *)(v72 + *(int *)(v73 + 28)) = v97;
        sub_2461E6A18();
        sub_2461C2130(&qword_2575587A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
        v99 = sub_2461E6478();
        v100 = (uint64_t)v121;
        *v121 = v99;
        *(_QWORD *)(v100 + 8) = v101;
        v145 = 0x402E000000000000;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v115 + 104))(v117, *MEMORY[0x24BDF1878], v116);
        sub_2461C1AAC();
        sub_2461E63C4();
        OUTLINED_FUNCTION_6_10(v100);
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_19_2(&qword_2575599E8, v102, (uint64_t)&protocol conformance descriptor for GetContactAttributeSingleResultView);
        sub_2461E3CE8();
        OUTLINED_FUNCTION_25_2();
        OUTLINED_FUNCTION_24_3();
        OUTLINED_FUNCTION_15_3((uint64_t)type metadata accessor for GetContactAttributeSingleResultView, v139);
        OUTLINED_FUNCTION_4_11();
        sub_2461E3BC8();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_3_9();
        OUTLINED_FUNCTION_13_2((uint64_t)type metadata accessor for GetContactAttributeSingleResultView);
        sub_2461BFECC(v100, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeSingleResultView);
      }
      else
      {
        v85 = v114;
        OUTLINED_FUNCTION_16_4(v114, (uint64_t)v46);
        v86 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
        v146 = OUTLINED_FUNCTION_23_3();
        v147 = &off_2517463B0;
        v145 = (uint64_t)v46;
        v87 = v126;
        sub_2461E22CC((uint64_t)&v145, v126);
        v88 = ContactAttributeViewModel;
        OUTLINED_FUNCTION_16_4(v87 + *(int *)(ContactAttributeViewModel + 20), v85);
        OUTLINED_FUNCTION_12_4();
        v89 = v131;
        OUTLINED_FUNCTION_11_4();
        v90 = OUTLINED_FUNCTION_10_4((uint64_t)v144);
        v92 = *(_QWORD *)(v91 - 256);
        v93(v90);
        v94 = v87 + *(int *)(v88 + 24);
        (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v94, v44, v92);
        v95 = OUTLINED_FUNCTION_12_4();
        v58 = v143;
        if ((v95 & 1) != 0)
          v96 = sub_2461E67C0();
        else
          v96 = sub_2461E67B4();
        v103 = v96;
        OUTLINED_FUNCTION_14_3();
        OUTLINED_FUNCTION_22_1(v104);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v145);
        v105 = v126;
        *(_QWORD *)(v126 + *(int *)(v88 + 28)) = v103;
        v106 = v119;
        sub_2461BFEA0(v105, (uint64_t)v119 + *(int *)(ContactAttributeMultiResultView + 20), (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
        sub_2461E6A18();
        sub_2461C2130(&qword_2575587A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
        *v106 = sub_2461E6478();
        v106[1] = v107;
        KeyPath = swift_getKeyPath();
        v57 = v33;
        v109 = v120;
        v110 = (uint64_t *)(v120 + *(int *)(v124 + 36));
        v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558E08);
        (*(void (**)(char *, uint64_t, uint64_t))(v131 + 16))((char *)v110 + *(int *)(v111 + 28), v94, v92);
        *v110 = KeyPath;
        sub_2461C548C((uint64_t)v106, v109);
        OUTLINED_FUNCTION_15_3(v109, v123);
        OUTLINED_FUNCTION_4_11();
        sub_2461C2130(&qword_2575599E8, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView, (uint64_t)&protocol conformance descriptor for GetContactAttributeSingleResultView);
        sub_2461E3CE8();
        OUTLINED_FUNCTION_25_2();
        sub_2461E6550();
        sub_2461CFA48((uint64_t)v106, v139, &qword_257559998);
        OUTLINED_FUNCTION_4_11();
        sub_2461E3BC8();
        sub_2461E3C64();
        v56 = v140;
        sub_2461E6550();
        sub_2461BFEF4((uint64_t)v106, &qword_257559998);
        OUTLINED_FUNCTION_13_2(v109);
        sub_2461BFECC(v126, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeViewModel);
      }
      v53 = (char *)v113[0];
    }
    sub_2461CFA48(v56, v58, &qword_2575599B8);
    OUTLINED_FUNCTION_7_1();
    sub_2461E3B5C();
    sub_2461E6550();
    sub_2461BFEF4(v56, &qword_2575599B8);
    OUTLINED_FUNCTION_14_3();
    return v112(v53, v57);
  }
}

uint64_t type metadata accessor for GetContactAttributeView()
{
  uint64_t result;

  result = qword_257559A70;
  if (!qword_257559A70)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2461E3B5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575599C0;
  if (!qword_2575599C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575599B8);
    v2[0] = sub_2461E3BC8();
    v2[1] = sub_2461E3C64();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575599C0);
  }
  return result;
}

unint64_t sub_2461E3BC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575599C8;
  if (!qword_2575599C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575599B0);
    sub_2461C2130(&qword_2575599D0, (uint64_t (*)(uint64_t))type metadata accessor for GetContactView, (uint64_t)&protocol conformance descriptor for GetContactView);
    v3 = v2;
    sub_2461C2130(&qword_2575599D8, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeAgeView, (uint64_t)&protocol conformance descriptor for GetContactAttributeAgeView);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575599C8);
  }
  return result;
}

unint64_t sub_2461E3C64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575599E0;
  if (!qword_2575599E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559998);
    sub_2461C2130(&qword_2575599E8, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeSingleResultView, (uint64_t)&protocol conformance descriptor for GetContactAttributeSingleResultView);
    v3[0] = v2;
    v3[1] = sub_2461E3CE8();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575599E0);
  }
  return result;
}

unint64_t sub_2461E3CE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575599F0;
  if (!qword_2575599F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257559988);
    sub_2461C2130(&qword_2575599F8, (uint64_t (*)(uint64_t))type metadata accessor for GetContactAttributeMultiResultView, (uint64_t)&protocol conformance descriptor for GetContactAttributeMultiResultView);
    v3[0] = v2;
    v3[1] = sub_2461E3D6C();
    result = MEMORY[0x2495541D0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575599F0);
  }
  return result;
}

unint64_t sub_2461E3D6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257558E48;
  if (!qword_257558E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257558E08);
    result = MEMORY[0x2495541D0](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_257558E48);
  }
  return result;
}

unint64_t sub_2461E3DB0()
{
  unint64_t result;

  result = qword_257559918;
  if (!qword_257559918)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257559918);
  }
  return result;
}

uint64_t sub_2461E3DF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GetContactAttributeView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_2461E6214();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for GetContactAttributeView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2461E6214();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461BFECC(a1, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E6214();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for GetContactAttributeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2461BFECC(a1, (uint64_t (*)(_QWORD))type metadata accessor for GetContactAttributeView);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2461E6214();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2461E40E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461E6214();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2461E4150()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257559AA8;
  if (!qword_257559AA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257559AB0);
    v2[0] = sub_2461E3B5C();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495541D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257559AA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_2461E6550();
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return swift_storeEnumTagMultiPayload();
}

void OUTLINED_FUNCTION_6_10(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_2461BFEA0(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_4@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_2461E61F0();
}

void OUTLINED_FUNCTION_13_2(uint64_t a1)
{
  uint64_t *v1;

  sub_2461BFEF4(a1, v1);
}

void OUTLINED_FUNCTION_15_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2461CFA48(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_16_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void OUTLINED_FUNCTION_19_2(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_2461C2130(a1, v3, a3);
}

unint64_t OUTLINED_FUNCTION_20()
{
  return sub_2461E3C64();
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

unint64_t OUTLINED_FUNCTION_23_3()
{
  return sub_2461E3DB0();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_2461E6550();
}

uint64_t sub_2461E4290()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2461E4298()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *sub_2461E4330(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(_QWORD *)(v4 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = v9;
  if ((v9 | v6) > 7
    || ((v9 | *(_DWORD *)(v5 + 80)) & 0x100000) != 0
    || ((v7 + v9 + ((v6 + 2) & ~v6)) & ~(unint64_t)v9) + *(_QWORD *)(v8 + 64) > 0x18)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + (((v9 | v6) + 16) & ~(v9 | v6)));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    a1[1] = *((_BYTE *)a2 + 1);
    v14 = (unint64_t)&a1[v6 + 2] & ~v6;
    v15 = ((unint64_t)a2 + v6 + 2) & ~v6;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v14 + v7 + v10) & ~v10, (v15 + v7 + v10) & ~v10, v4);
  }
  return v3;
}

uint64_t sub_2461E4444(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 2) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  (*(void (**)(unint64_t))(v3 + 8))(v4);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

_BYTE *sub_2461E44AC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)&a1[v6 + 2] & ~v6;
  v8 = (unint64_t)&a2[v6 + 2] & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v7, v8);
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 16))((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), (*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

_BYTE *sub_2461E454C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)&a1[v6 + 2] & ~v6;
  v8 = (unint64_t)&a2[v6 + 2] & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v7, v8);
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), (*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

_BYTE *sub_2461E45EC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)&a1[v6 + 2] & ~v6;
  v8 = (unint64_t)&a2[v6 + 2] & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v7, v8);
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 32))((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), (*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

_BYTE *sub_2461E468C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (unint64_t)&a1[v6 + 2] & ~v6;
  v8 = (unint64_t)&a2[v6 + 2] & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v7, v8);
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 40))((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), (*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v9 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_2461E472C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  int v19;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;
  BOOL v25;
  int v26;
  uint64_t v27;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v6 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v8 <= v10)
    v11 = *(_DWORD *)(v9 + 84);
  else
    v11 = *(_DWORD *)(v7 + 84);
  if (v11 <= 0xFE)
    v12 = 254;
  else
    v12 = v11;
  if (!a2)
    return 0;
  v13 = *(unsigned __int8 *)(v7 + 80);
  v14 = *(_QWORD *)(v7 + 64);
  v15 = *(unsigned __int8 *)(v9 + 80);
  v16 = a2 - v12;
  if (a2 <= v12)
    goto LABEL_27;
  v17 = ((v14 + v15 + ((v13 + 2) & ~v13)) & ~v15) + *(_QWORD *)(v9 + 64);
  v18 = 8 * v17;
  if (v17 <= 3)
  {
    v21 = ((v16 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v21))
    {
      v19 = *(_DWORD *)&a1[v17];
      if (!v19)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v21 > 0xFF)
    {
      v19 = *(unsigned __int16 *)&a1[v17];
      if (!*(_WORD *)&a1[v17])
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v21 < 2)
    {
LABEL_27:
      if (v11 > 0xFE)
      {
        v27 = (unint64_t)&a1[v13 + 2] & ~v13;
        if ((_DWORD)v8 == v12)
        {
          v10 = v8;
        }
        else
        {
          v27 = (v27 + v14 + v15) & ~v15;
          v5 = v6;
        }
        return __swift_getEnumTagSinglePayload(v27, v10, v5);
      }
      else
      {
        v24 = *a1;
        v25 = v24 >= 2;
        v26 = (v24 + 2147483646) & 0x7FFFFFFF;
        if (v25)
          return (v26 + 1);
        else
          return 0;
      }
    }
  }
  v19 = a1[v17];
  if (!a1[v17])
    goto LABEL_27;
LABEL_18:
  v22 = (v19 - 1) << v18;
  if (v17 > 3)
    v22 = 0;
  if (!(_DWORD)v17)
    return v12 + v22 + 1;
  if (v17 <= 3)
    v23 = v17;
  else
    v23 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2461E482C + 4 * byte_2461E85E0[v23 - 1]))();
}

void sub_2461E48CC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  char v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= *(_DWORD *)(v6 + 84))
    v7 = *(_DWORD *)(v6 + 84);
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (v7 <= 0xFE)
    v8 = 254;
  else
    v8 = v7;
  v9 = ((*(_QWORD *)(v5 + 64)
       + *(unsigned __int8 *)(v6 + 80)
       + ((*(unsigned __int8 *)(v5 + 80) + 2) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v10 = 8 * v9;
  if (a3 > v8)
  {
    if (v9 <= 3)
    {
      v13 = ((a3 - v8 + ~(-1 << v10)) >> v10) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v8 < a2)
  {
    v12 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v14 = v12 & ~(-1 << v10);
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X4 }
}

void type metadata accessor for GetContactQuickActionButton()
{
  JUMPOUT(0x249554158);
}

uint64_t sub_2461E4B10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461E4B44@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  _BYTE *v2;
  uint64_t v3;
  ValueMetadata *v4;
  uint64_t v5;
  unint64_t v6;
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
  char v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  ValueMetadata *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  ValueMetadata *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t KeyPath;
  ValueMetadata *v39;
  uint64_t v40;
  unint64_t v41;

  v27 = a2;
  v4 = (ValueMetadata *)a1[2];
  v6 = a1[4];
  v5 = a1[5];
  KeyPath = a1[3];
  v3 = KeyPath;
  v39 = v4;
  v40 = v5;
  v41 = v6;
  v7 = sub_2461E6664();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - v8;
  v10 = MEMORY[0x2495541D0](MEMORY[0x24BDF1A70], v7);
  v24 = v10;
  v23 = sub_2461E4EE4();
  KeyPath = v7;
  v39 = &type metadata for GetContactQuickActionPrimitiveButtonStyle;
  v40 = v10;
  v41 = v23;
  v11 = MEMORY[0x2495541A0](0, &KeyPath, MEMORY[0x24BDF22B8], 0);
  v25 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v22 - v15;
  v33 = v4;
  v34 = v3;
  v35 = v6;
  v36 = v5;
  v37 = v2;
  v28 = v4;
  v29 = v3;
  v30 = v6;
  v31 = v5;
  v32 = v2;
  sub_2461E6658();
  LOBYTE(v4) = *v2;
  v17 = v2[1];
  KeyPath = swift_getKeyPath();
  LOBYTE(v39) = 0;
  BYTE1(v39) = (_BYTE)v4;
  BYTE2(v39) = v17;
  sub_2461E6730();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
  v18 = v25;
  v19 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  v19(v16, v14, v11);
  v20 = *(void (**)(char *, uint64_t))(v18 + 8);
  v20(v14, v11);
  v19(v27, v16, v11);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, v11);
}

void sub_2461E4D78(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  type metadata accessor for GetContactQuickActionButton();
}

uint64_t sub_2461E4DDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = v2 + *(int *)(a1 + 56);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v4, v6, v1);
  v7(v3, v4, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v1);
}

void sub_2461E4E2C(uint64_t a1)
{
  MEMORY[0x24BDAC7A8](a1);
  type metadata accessor for GetContactQuickActionButton();
}

uint64_t sub_2461E4E90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = v2 + *(int *)(a1 + 60);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v4, v6, v1);
  v7(v3, v4, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v1);
}

unint64_t sub_2461E4EE4()
{
  unint64_t result;

  result = qword_257559B38;
  if (!qword_257559B38)
  {
    result = MEMORY[0x2495541D0](&unk_2461E7C5C, &type metadata for GetContactQuickActionPrimitiveButtonStyle);
    atomic_store(result, (unint64_t *)&qword_257559B38);
  }
  return result;
}

uint64_t sub_2461E4F20()
{
  return sub_2461E4F38((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2461E4D78);
}

uint64_t sub_2461E4F2C()
{
  return sub_2461E4F38((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2461E4E2C);
}

uint64_t sub_2461E4F38(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_2461E4F4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2461E64CC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2461E4F78()
{
  return sub_2461E64D8();
}

uint64_t sub_2461E4F9C()
{
  uint64_t v1;

  v1 = sub_2461E6664();
  MEMORY[0x2495541D0](MEMORY[0x24BDF1A70], v1);
  sub_2461E4EE4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461E5018()
{
  uint64_t v0;

  v0 = sub_2461E6310();
  __swift_allocate_value_buffer(v0, qword_257559B40);
  __swift_project_value_buffer(v0, (uint64_t)qword_257559B40);
  return sub_2461E6304();
}

uint64_t static Logger.siriContacts.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2575585B8 != -1)
    swift_once();
  v2 = sub_2461E6310();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257559B40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

_QWORD *sub_2461E5154(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = a3[5];
    v9 = (char *)v4 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_2461E6214();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = sub_2461E6394();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    *(_QWORD *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  swift_retain();
  return v4;
}

uint64_t sub_2461E523C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_release();
}

uint64_t sub_2461E52B8(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  return a1;
}

uint64_t *sub_2461E5370(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461E6214();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2461E6394();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2461E5420(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_2461E54CC(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2461E6214();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2461E6394();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_2461E5584()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461E5590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2461E6214();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v9 = sub_2461E6394();
      v10 = *(int *)(a3 + 24);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t sub_2461E5628()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461E5634(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v8 = sub_2461E6214();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = sub_2461E6394();
      v10 = *(int *)(a4 + 24);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for GetContactAttributeViewModel()
{
  uint64_t result;

  result = qword_257559BB0;
  if (!qword_257559BB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461E5700()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2461E6214();
  if (v1 <= 0x3F)
  {
    result = sub_2461E6394();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2461E579C()
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
  uint64_t v11;

  v1 = sub_2461E601C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6_7();
  v3 = sub_2461E6040();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeViewModel();
  v7 = sub_2461E6208();
  v8 = MEMORY[0x249553060](v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x24BE91C10], v1);
  v9 = sub_2461DDBD4(v0, v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return v9;
}

uint64_t sub_2461E58B4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_7();
  v7 = v2[3];
  v8 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v7);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8) & 1) != 0)
  {
    if (a1)
    {
      sub_2461E6AA8();
      sub_2461E6AC0();
      swift_bridgeObjectRetain();
      sub_2461E6AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2461E5F98();
      swift_bridgeObjectRelease();
      v9 = OUTLINED_FUNCTION_14();
      if (__swift_getEnumTagSinglePayload(v3, 1, v9) != 1)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a2, v3, v9);
        v15 = a2;
        v16 = 0;
        v17 = 1;
        v18 = v9;
        return __swift_storeEnumTagSinglePayload(v15, v16, v17, v18);
      }
      sub_2461E5EAC(v3);
    }
    if (qword_2575585B8 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_74();
    v11 = (void *)OUTLINED_FUNCTION_41(v10, (uint64_t)qword_257559B40);
    v12 = sub_2461E6BF8();
    if (OUTLINED_FUNCTION_3_10(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
      OUTLINED_FUNCTION_0_8(&dword_2461B8000, v13, v14, "#GetContactAttributeViewModel callURL could not be built");
      OUTLINED_FUNCTION_7_0();
    }

    OUTLINED_FUNCTION_14();
    v15 = OUTLINED_FUNCTION_8_7();
    return __swift_storeEnumTagSinglePayload(v15, v16, v17, v18);
  }
  if (qword_2575585B8 != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_74();
  v20 = (void *)OUTLINED_FUNCTION_41(v19, (uint64_t)qword_257559B40);
  v21 = sub_2461E6BF8();
  if (OUTLINED_FUNCTION_3_10(v21))
  {
    *(_WORD *)OUTLINED_FUNCTION_9_0() = 0;
    OUTLINED_FUNCTION_0_8(&dword_2461B8000, v22, v23, "#GetContactAttributeViewModel callURL but telephony unavailable");
    OUTLINED_FUNCTION_7_0();
  }

  OUTLINED_FUNCTION_14();
  v24 = OUTLINED_FUNCTION_8_7();
  return __swift_storeEnumTagSinglePayload(v24, v25, v26, v27);
}

void sub_2461E5B1C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2461E5C80();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_2461E0B94();
  if (v8)
  {
    v9 = v8;
    v10 = v2[3];
    v11 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v10);
    (*(void (**)(NSObject *, void (*)(void *), _QWORD, uint64_t, uint64_t))(v11 + 16))(v9, sub_2461E5CBC, 0, v10, v11);
  }
  else
  {
    if (qword_2575585B8 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_74();
    v9 = OUTLINED_FUNCTION_41(v12, (uint64_t)qword_257559B40);
    v13 = sub_2461E6BF8();
    if (os_log_type_enabled(v9, v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2461B8000, v9, v13, "#GetContactAttributeViewModel performCall failed to construct dial request", v14, 2u);
      OUTLINED_FUNCTION_7_0();
    }
  }

}

unint64_t sub_2461E5C80()
{
  unint64_t result;

  result = qword_257559860;
  if (!qword_257559860)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257559860);
  }
  return result;
}

void sub_2461E5CBC(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (a1)
  {
    v2 = a1;
    if (qword_2575585B8 != -1)
      swift_once();
    v3 = sub_2461E6310();
    __swift_project_value_buffer(v3, (uint64_t)qword_257559B40);
    v4 = a1;
    v5 = a1;
    oslog = sub_2461E62F8();
    v6 = sub_2461E6BF8();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v12 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_getErrorValue();
      v9 = sub_2461E6DB4();
      sub_2461D5F20(v9, v10, &v12);
      sub_2461E6CB8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2461B8000, oslog, v6, "#GetContactAttributeViewModel performCall error opening dial request %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249554254](v8, -1, -1);
      MEMORY[0x249554254](v7, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_2461E5EAC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257558FA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_3_10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  uint64_t v0;

  return v0;
}

void sub_2461E5F24()
{
  qword_25755ABF0 = 0x4010000000000000;
}

void sub_2461E5F34()
{
  qword_25755ABF8 = 0x4020000000000000;
}

void sub_2461E5F44()
{
  qword_25755AC00 = 0x4028000000000000;
}

void sub_2461E5F54()
{
  qword_25755AC08 = 0x4030000000000000;
}

void sub_2461E5F64()
{
  qword_25755AC10 = 0x4040000000000000;
}

uint64_t sub_2461E5F74()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2461E5F80()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2461E5F8C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2461E5F98()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2461E5FA4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2461E5FB0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2461E5FBC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2461E5FC8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2461E5FD4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2461E5FE0()
{
  return MEMORY[0x24BEAB538]();
}

uint64_t sub_2461E5FEC()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_2461E5FF8()
{
  return MEMORY[0x24BEAD2D0]();
}

uint64_t sub_2461E6004()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_2461E6010()
{
  return MEMORY[0x24BE91BC8]();
}

uint64_t sub_2461E601C()
{
  return MEMORY[0x24BE91C18]();
}

uint64_t sub_2461E6028()
{
  return MEMORY[0x24BE91C38]();
}

uint64_t sub_2461E6034()
{
  return MEMORY[0x24BE91C50]();
}

uint64_t sub_2461E6040()
{
  return MEMORY[0x24BE91C58]();
}

uint64_t sub_2461E604C()
{
  return MEMORY[0x24BE91C98]();
}

uint64_t sub_2461E6058()
{
  return MEMORY[0x24BE91CA0]();
}

uint64_t sub_2461E6064()
{
  return MEMORY[0x24BE91CA8]();
}

uint64_t sub_2461E6070()
{
  return MEMORY[0x24BE91CB0]();
}

uint64_t sub_2461E607C()
{
  return MEMORY[0x24BE91CB8]();
}

uint64_t sub_2461E6088()
{
  return MEMORY[0x24BE91CC0]();
}

uint64_t sub_2461E6094()
{
  return MEMORY[0x24BE91CC8]();
}

uint64_t sub_2461E60A0()
{
  return MEMORY[0x24BE91CD0]();
}

uint64_t sub_2461E60AC()
{
  return MEMORY[0x24BE91CE8]();
}

uint64_t sub_2461E60B8()
{
  return MEMORY[0x24BE91CF0]();
}

uint64_t sub_2461E60C4()
{
  return MEMORY[0x24BE91D10]();
}

uint64_t sub_2461E60D0()
{
  return MEMORY[0x24BE91D28]();
}

uint64_t sub_2461E60DC()
{
  return MEMORY[0x24BE91D50]();
}

uint64_t sub_2461E60E8()
{
  return MEMORY[0x24BE91D60]();
}

uint64_t sub_2461E60F4()
{
  return MEMORY[0x24BE91D68]();
}

uint64_t sub_2461E6100()
{
  return MEMORY[0x24BE91D70]();
}

uint64_t sub_2461E610C()
{
  return MEMORY[0x24BE91D78]();
}

uint64_t sub_2461E6118()
{
  return MEMORY[0x24BE91D80]();
}

uint64_t sub_2461E6124()
{
  return MEMORY[0x24BE91D90]();
}

uint64_t sub_2461E6130()
{
  return MEMORY[0x24BE91D98]();
}

uint64_t sub_2461E613C()
{
  return MEMORY[0x24BE91DA0]();
}

uint64_t sub_2461E6148()
{
  return MEMORY[0x24BE91DB0]();
}

uint64_t sub_2461E6154()
{
  return MEMORY[0x24BE91DB8]();
}

uint64_t sub_2461E6160()
{
  return MEMORY[0x24BE91DC0]();
}

uint64_t sub_2461E616C()
{
  return MEMORY[0x24BE91DD0]();
}

uint64_t sub_2461E6178()
{
  return MEMORY[0x24BE91DD8]();
}

uint64_t sub_2461E6184()
{
  return MEMORY[0x24BE91E28]();
}

uint64_t sub_2461E6190()
{
  return MEMORY[0x24BE91E38]();
}

uint64_t sub_2461E619C()
{
  return MEMORY[0x24BE91E40]();
}

uint64_t sub_2461E61A8()
{
  return MEMORY[0x24BE91E50]();
}

uint64_t sub_2461E61B4()
{
  return MEMORY[0x24BE91E58]();
}

uint64_t sub_2461E61C0()
{
  return MEMORY[0x24BE91E60]();
}

uint64_t sub_2461E61CC()
{
  return MEMORY[0x24BE91E80]();
}

uint64_t sub_2461E61D8()
{
  return MEMORY[0x24BE91E88]();
}

uint64_t sub_2461E61E4()
{
  return MEMORY[0x24BE91E90]();
}

uint64_t sub_2461E61F0()
{
  return MEMORY[0x24BE91E98]();
}

uint64_t sub_2461E61FC()
{
  return MEMORY[0x24BE91EA0]();
}

uint64_t sub_2461E6208()
{
  return MEMORY[0x24BE91EA8]();
}

uint64_t sub_2461E6214()
{
  return MEMORY[0x24BE91EB0]();
}

uint64_t sub_2461E6220()
{
  return MEMORY[0x24BE91EC0]();
}

uint64_t sub_2461E622C()
{
  return MEMORY[0x24BE91EC8]();
}

uint64_t sub_2461E6238()
{
  return MEMORY[0x24BE91ED8]();
}

uint64_t sub_2461E6244()
{
  return MEMORY[0x24BE91EE0]();
}

uint64_t sub_2461E6250()
{
  return MEMORY[0x24BE91EE8]();
}

uint64_t sub_2461E625C()
{
  return MEMORY[0x24BE91F00]();
}

uint64_t sub_2461E6268()
{
  return MEMORY[0x24BE91F18]();
}

uint64_t sub_2461E6274()
{
  return MEMORY[0x24BE91F20]();
}

uint64_t sub_2461E6280()
{
  return MEMORY[0x24BE91F28]();
}

uint64_t sub_2461E628C()
{
  return MEMORY[0x24BE91F30]();
}

uint64_t sub_2461E6298()
{
  return MEMORY[0x24BE91F58]();
}

uint64_t sub_2461E62A4()
{
  return MEMORY[0x24BE91F60]();
}

uint64_t sub_2461E62B0()
{
  return MEMORY[0x24BE91F68]();
}

uint64_t sub_2461E62BC()
{
  return MEMORY[0x24BE91F70]();
}

uint64_t sub_2461E62C8()
{
  return MEMORY[0x24BE91F78]();
}

uint64_t sub_2461E62D4()
{
  return MEMORY[0x24BE91F80]();
}

uint64_t sub_2461E62E0()
{
  return MEMORY[0x24BE91F88]();
}

uint64_t sub_2461E62EC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2461E62F8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2461E6304()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2461E6310()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2461E631C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2461E6328()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2461E6334()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2461E6340()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2461E634C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2461E6358()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2461E6364()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_2461E6370()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_2461E637C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2461E6388()
{
  return MEMORY[0x24BDEB138]();
}

uint64_t sub_2461E6394()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2461E63A0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2461E63AC()
{
  return MEMORY[0x24BDEB8E8]();
}

uint64_t sub_2461E63B8()
{
  return MEMORY[0x24BDEB900]();
}

uint64_t sub_2461E63C4()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_2461E63D0()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_2461E63DC()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_2461E63E8()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2461E63F4()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_2461E6400()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_2461E640C()
{
  return MEMORY[0x24BDEC270]();
}

uint64_t sub_2461E6418()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_2461E6424()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_2461E6430()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_2461E643C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2461E6448()
{
  return MEMORY[0x24BDED8E0]();
}

uint64_t sub_2461E6454()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2461E6460()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2461E646C()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_2461E6478()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2461E6484()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2461E6490()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2461E649C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_2461E64A8()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_2461E64B4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2461E64C0()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2461E64CC()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2461E64D8()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2461E64E4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2461E64F0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2461E64FC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2461E6508()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2461E6514()
{
  return MEMORY[0x24BDEE980]();
}

uint64_t sub_2461E6520()
{
  return MEMORY[0x24BDEE988]();
}

uint64_t sub_2461E652C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2461E6538()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2461E6544()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2461E6550()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2461E655C()
{
  return MEMORY[0x24BEAD690]();
}

uint64_t sub_2461E6568()
{
  return MEMORY[0x24BDEFC98]();
}

uint64_t sub_2461E6574()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2461E6580()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_2461E658C()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_2461E6598()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_2461E65A4()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_2461E65B0()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_2461E65BC()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_2461E65C8()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_2461E65D4()
{
  return MEMORY[0x24BDF12C8]();
}

uint64_t sub_2461E65E0()
{
  return MEMORY[0x24BDF12D8]();
}

uint64_t sub_2461E65EC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2461E65F8()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_2461E6604()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2461E6610()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2461E661C()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2461E6628()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2461E6634()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_2461E6640()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_2461E664C()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_2461E6658()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_2461E6664()
{
  return MEMORY[0x24BDF1A58]();
}

uint64_t sub_2461E6670()
{
  return MEMORY[0x24BEAD6C8]();
}

uint64_t sub_2461E667C()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_2461E6688()
{
  return MEMORY[0x24BDF1CB8]();
}

uint64_t sub_2461E6694()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_2461E66A0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2461E66AC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2461E66B8()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_2461E66C4()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_2461E66D0()
{
  return MEMORY[0x24BEAD768]();
}

uint64_t sub_2461E66DC()
{
  return MEMORY[0x24BEAD7E0]();
}

uint64_t sub_2461E66E8()
{
  return MEMORY[0x24BEAD818]();
}

uint64_t sub_2461E66F4()
{
  return MEMORY[0x24BEAD8C8]();
}

uint64_t sub_2461E6700()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2461E670C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2461E6718()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_2461E6724()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_2461E6730()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_2461E673C()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_2461E6748()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2461E6754()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2461E6760()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_2461E676C()
{
  return MEMORY[0x24BDF3990]();
}

uint64_t sub_2461E6778()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_2461E6784()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_2461E6790()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_2461E679C()
{
  return MEMORY[0x24BDF3C60]();
}

uint64_t sub_2461E67A8()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_2461E67B4()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2461E67C0()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2461E67CC()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_2461E67D8()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_2461E67E4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2461E67F0()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_2461E67FC()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_2461E6808()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2461E6814()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2461E6820()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_2461E682C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2461E6838()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_2461E6844()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_2461E6850()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_2461E685C()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_2461E6868()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_2461E6874()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2461E6880()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2461E688C()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_2461E6898()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_2461E68A4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2461E68B0()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_2461E68BC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2461E68C8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2461E68D4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2461E68E0()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_2461E68EC()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_2461E68F8()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2461E6904()
{
  return MEMORY[0x24BEADB88]();
}

uint64_t sub_2461E6910()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_2461E691C()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_2461E6928()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_2461E6934()
{
  return MEMORY[0x24BEADE18]();
}

uint64_t sub_2461E6940()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_2461E694C()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_2461E6958()
{
  return MEMORY[0x24BEADF40]();
}

uint64_t sub_2461E6964()
{
  return MEMORY[0x24BEADF48]();
}

uint64_t sub_2461E6970()
{
  return MEMORY[0x24BEADF50]();
}

uint64_t sub_2461E697C()
{
  return MEMORY[0x24BEADF98]();
}

uint64_t sub_2461E6988()
{
  return MEMORY[0x24BEADFB0]();
}

uint64_t sub_2461E6994()
{
  return MEMORY[0x24BEADFC0]();
}

uint64_t sub_2461E69A0()
{
  return MEMORY[0x24BEAE038]();
}

uint64_t sub_2461E69AC()
{
  return MEMORY[0x24BEAE050]();
}

uint64_t sub_2461E69B8()
{
  return MEMORY[0x24BEAE0D0]();
}

uint64_t sub_2461E69C4()
{
  return MEMORY[0x24BEAE0E0]();
}

uint64_t sub_2461E69D0()
{
  return MEMORY[0x24BEAE1C0]();
}

uint64_t sub_2461E69DC()
{
  return MEMORY[0x24BEAE1C8]();
}

uint64_t sub_2461E69E8()
{
  return MEMORY[0x24BEAE338]();
}

uint64_t sub_2461E69F4()
{
  return MEMORY[0x24BEAE350]();
}

uint64_t sub_2461E6A00()
{
  return MEMORY[0x24BEAE468]();
}

uint64_t sub_2461E6A0C()
{
  return MEMORY[0x24BEAE548]();
}

uint64_t sub_2461E6A18()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_2461E6A24()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2461E6A30()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2461E6A3C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2461E6A48()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2461E6A54()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2461E6A60()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2461E6A6C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2461E6A78()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2461E6A84()
{
  return MEMORY[0x24BE91F98]();
}

uint64_t sub_2461E6A90()
{
  return MEMORY[0x24BE91FA0]();
}

uint64_t sub_2461E6A9C()
{
  return MEMORY[0x24BE91FA8]();
}

uint64_t sub_2461E6AA8()
{
  return MEMORY[0x24BE91FB0]();
}

uint64_t sub_2461E6AB4()
{
  return MEMORY[0x24BE91FB8]();
}

uint64_t sub_2461E6AC0()
{
  return MEMORY[0x24BE91FC0]();
}

uint64_t sub_2461E6ACC()
{
  return MEMORY[0x24BE91FC8]();
}

uint64_t sub_2461E6AD8()
{
  return MEMORY[0x24BE91FD0]();
}

uint64_t sub_2461E6AE4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2461E6AF0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2461E6AFC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2461E6B08()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2461E6B14()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2461E6B20()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2461E6B2C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2461E6B38()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2461E6B44()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2461E6B50()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2461E6B5C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2461E6B68()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2461E6B74()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2461E6B80()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2461E6B8C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2461E6B98()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2461E6BA4()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_2461E6BB0()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2461E6BBC()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2461E6BC8()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2461E6BD4()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_2461E6BE0()
{
  return MEMORY[0x24BE91FD8]();
}

uint64_t sub_2461E6BEC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2461E6BF8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2461E6C04()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2461E6C10()
{
  return MEMORY[0x24BE91FE0]();
}

uint64_t sub_2461E6C1C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2461E6C28()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2461E6C34()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_2461E6C40()
{
  return MEMORY[0x24BEAE638]();
}

uint64_t sub_2461E6C4C()
{
  return MEMORY[0x24BE91FF0]();
}

uint64_t sub_2461E6C58()
{
  return MEMORY[0x24BE91FF8]();
}

uint64_t sub_2461E6C64()
{
  return MEMORY[0x24BE92000]();
}

uint64_t sub_2461E6C70()
{
  return MEMORY[0x24BE92008]();
}

uint64_t sub_2461E6C7C()
{
  return MEMORY[0x24BE92010]();
}

uint64_t sub_2461E6C88()
{
  return MEMORY[0x24BE92020]();
}

uint64_t sub_2461E6C94()
{
  return MEMORY[0x24BE92030]();
}

uint64_t sub_2461E6CA0()
{
  return MEMORY[0x24BE92050]();
}

uint64_t sub_2461E6CAC()
{
  return MEMORY[0x24BE92058]();
}

uint64_t sub_2461E6CB8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2461E6CC4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2461E6CD0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2461E6CDC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2461E6CE8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2461E6CF4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2461E6D00()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2461E6D0C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2461E6D18()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2461E6D24()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2461E6D30()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2461E6D3C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2461E6D48()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2461E6D54()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2461E6D60()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2461E6D6C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2461E6D78()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2461E6D84()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2461E6D90()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_2461E6D9C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2461E6DA8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2461E6DB4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2461E6DC0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2461E6DCC()
{
  return MEMORY[0x24BEE4328]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

