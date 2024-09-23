uint64_t sub_1C145024C()
{
  uint64_t v0;

  MEMORY[0x1C3BADCBC](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF6DEAE0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF6DEAE0);
  }
}

uint64_t dispatch thunk of AlertManagerDelegate.alertManager(_:didDismiss:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of AlertManaging.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertManaging.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertManaging.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertManaging.hasAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AlertManaging.presentAlert(identifier:payload:coordinated:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 40))();
}

uint64_t dispatch thunk of AlertManaging.dismissAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

void sub_1C1450324()
{
  qword_1ED7989F0 = 0x7472656C61;
  *(_QWORD *)algn_1ED7989F8 = 0xE500000000000000;
}

uint64_t static AlertCenter.zone.getter()
{
  uint64_t v0;

  if (qword_1ED798A00 != -1)
    swift_once();
  v0 = qword_1ED7989F0;
  swift_bridgeObjectRetain();
  return v0;
}

void *sub_1C14503A0()
{
  void *result;

  result = (void *)sub_1C145B354((uint64_t)&unk_1E7A9D038);
  off_1ED798AB0 = result;
  return result;
}

double sub_1C14503C4@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAE8);
  sub_1C14657C4();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1C1450428()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAE8);
  sub_1C14657C4();
  return v1;
}

uint64_t sub_1C1450484@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C145BD78(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BADC14]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C14504D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 16);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C1450650;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C1450674;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1450694;
  v11[3] = &block_descriptor;
  v9 = _Block_copy(v11);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  swift_unknownObjectRelease();
  _Block_release(v9);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a1 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C1450624()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C1450650()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 152) = *(_QWORD *)(v0 + 32);
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1C1450664()
{
  return swift_deallocObject();
}

uint64_t sub_1C1450674()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C1450694(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

void (*sub_1C14506CC(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAE8);
  sub_1C14657C4();
  *(_OWORD *)v3 = *((_OWORD *)v3 + 1);
  return sub_1C1450754;
}

void sub_1C1450754(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = **a1;
  v4 = v2[1];
  if ((a2 & 1) != 0)
  {
    v5 = swift_unknownObjectRetain();
    sub_1C14504D8(v5, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C14504D8(v3, v2[1]);
  }
  free(v2);
}

_QWORD *AlertCenter.__allocating_init(store:syncEngine:presenter:watchdogIntervals:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;

  swift_allocObject();
  v10 = sub_1C145B428(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v10;
}

_QWORD *AlertCenter.init(store:syncEngine:presenter:watchdogIntervals:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5 = sub_1C145B428(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t AlertCenter.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  swift_bridgeObjectRelease();
  sub_1C145B808(v0 + 144);
  return v0;
}

uint64_t AlertCenter.__deallocating_deinit()
{
  AlertCenter.deinit();
  return swift_deallocClassInstance();
}

Swift::Bool __swiftcall AlertCenter.hasAlert(identifier:)(Swift::String identifier)
{
  Swift::Bool v2;

  sub_1C14657C4();
  return v2;
}

uint64_t sub_1C1450920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _BYTE v14[24];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78]();
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  sub_1C145C90C(a1 + 96, (uint64_t)v15);
  v10 = v16;
  v11 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, a3, v10, v11);
  v12 = type metadata accessor for Alert(0);
  LOBYTE(a3) = (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v9, 1, v12) != 1;
  sub_1C145BE2C((uint64_t)v9, &qword_1ED798A50);
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  *a4 = a3;
  return result;
}

uint64_t AlertCenter.presentAlert(identifier:payload:coordinated:)(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  int *v42;
  unint64_t v43;
  void (*v44)(char *, char *, unint64_t);
  char *v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD aBlock[5];
  char *v66;

  v6 = v5;
  v63 = a3;
  v64 = a4;
  v59 = a1;
  v9 = sub_1C14655C0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  isEscapingClosureAtFileLocation = (uint64_t)&v50 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v50 - v17;
  v19 = type metadata accessor for Alert(0);
  v20 = *(_QWORD *)(v19 - 8);
  v56 = (int *)v19;
  v57 = v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v60 = (uint64_t)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = v22;
  MEMORY[0x1E0C80A78](v21);
  v61 = (char *)&v50 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAF0);
  result = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a5 & 1) != 0)
  {
    v62 = v13;
    __swift_project_boxed_opaque_existential_1(v6 + 4, v6[7]);
    v13 = v62;
    sub_1C146565C();
    v28 = sub_1C146568C();
    v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v27, 1, v28) == 1;
    result = sub_1C145BE2C((uint64_t)v27, &qword_1EF6DEAF0);
  }
  else
  {
    v29 = 1;
  }
  v30 = *(_QWORD *)(v6[11] + 16);
  LODWORD(v62) = v29;
  if (v30)
  {
    result = sub_1C145AE74(0x80u);
    if ((v31 & 1) != 0)
      goto LABEL_9;
  }
  if (qword_1ED798AC0 != -1)
    goto LABEL_14;
  while (*((_QWORD *)off_1ED798AB0 + 2))
  {
    result = sub_1C145AE74(0x80u);
    if ((v32 & 1) == 0)
      goto LABEL_16;
LABEL_9:
    v33 = v63;
    swift_bridgeObjectRetain();
    sub_1C14655A8();
    sub_1C14655A8();
    sub_1C146556C();
    (*(void (**)(char *, unint64_t))(v10 + 8))(v13, v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAF8);
    v34 = type metadata accessor for Alert.HistoryItem(0);
    v54 = isEscapingClosureAtFileLocation;
    v55 = v9;
    isEscapingClosureAtFileLocation = v34;
    v35 = *(unsigned __int8 *)(*(_QWORD *)(v34 - 8) + 80);
    v53 = v10;
    v36 = (v35 + 32) & ~v35;
    v13 = (char *)swift_allocObject();
    *((_OWORD *)v13 + 1) = xmmword_1C1465E10;
    v9 = (unint64_t)&v13[v36];
    v37 = v6 + 4;
    v52 = v18;
    v51 = a2;
    a2 = v6;
    __swift_project_boxed_opaque_existential_1(v6 + 4, v6[7]);
    sub_1C145B86C(v33, v64);
    v6 = (_QWORD *)sub_1C1465668();
    v18 = v38;
    __swift_project_boxed_opaque_existential_1(v37, a2[7]);
    v39 = sub_1C1465668();
    v10 = v40;
    sub_1C14655A8();
    *(_BYTE *)v9 = (_BYTE)v62;
    *(_QWORD *)(v9 + 8) = v6;
    *(_QWORD *)(v9 + 16) = v18;
    *(_QWORD *)(v9 + 24) = v39;
    *(_QWORD *)(v9 + 32) = v10;
    *(_BYTE *)(v9 + 40) = 0;
    if (*((_QWORD *)v13 + 2))
    {
      v18 = v61;
      v41 = v51;
      *(_QWORD *)v61 = v59;
      *((_QWORD *)v18 + 1) = v41;
      v43 = v55;
      v42 = v56;
      v44 = *(void (**)(char *, char *, unint64_t))(v53 + 32);
      v44(&v18[v56[5]], v52, v55);
      v44(&v18[v42[6]], (char *)v54, v43);
      v45 = &v18[v42[7]];
      v46 = v64;
      *(_QWORD *)v45 = v63;
      *((_QWORD *)v45 + 1) = v46;
      *(_QWORD *)&v18[v42[8]] = v13;
      v47 = a2[2];
      v48 = v60;
      sub_1C145BEBC((uint64_t)v18, v60, type metadata accessor for Alert);
      v9 = (*(unsigned __int8 *)(v57 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = a2;
      sub_1C145BF3C(v48, v10 + v9, type metadata accessor for Alert);
      v6 = (_QWORD *)swift_allocObject();
      v6[2] = sub_1C145B8F8;
      v6[3] = v10;
      aBlock[4] = sub_1C145C990;
      v66 = (char *)v6;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1C1450694;
      aBlock[3] = &block_descriptor_14;
      v49 = _Block_copy(aBlock);
      v13 = v66;
      swift_retain();
      swift_retain();
      swift_release();
      dispatch_sync(v47, v49);
      _Block_release(v49);
      sub_1C145BF00((uint64_t)v18, type metadata accessor for Alert);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        return result;
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_14:
    result = swift_once();
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

void sub_1C1450F84(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
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
  _QWORD *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  _QWORD *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t *v105;
  os_log_type_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unsigned __int8 *v120;
  BOOL v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  uint64_t *v126;
  os_log_type_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  const char *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  NSObject *v140;
  os_log_type_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t *v151;
  NSObject *v152;
  os_log_type_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  _QWORD *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t *v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t *v185;
  char *v186;
  double v187;
  double v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  uint64_t *v199;
  NSObject *v200;
  os_log_type_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t *v213;
  char *v214;
  uint64_t *v215;
  uint64_t *v216;
  uint64_t *v217;
  uint64_t *v218;
  char *v219;
  uint64_t *v220;
  uint64_t *v221;
  uint64_t v222;
  uint64_t v223;
  char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t *v228;
  _QWORD *v229;
  uint64_t *v230;
  uint64_t v231;
  uint64_t v232[2];

  v2 = v1;
  v4 = sub_1C14655C0();
  v225 = *(_QWORD *)(v4 - 8);
  v226 = v4;
  MEMORY[0x1E0C80A78](v4);
  v224 = (char *)&v210 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAF0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v214 = (char *)&v210 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v219 = (char *)&v210 - v9;
  v229 = (_QWORD *)type metadata accessor for Alert(0);
  v222 = *(v229 - 1);
  v10 = *(_QWORD *)(v222 + 64);
  v11 = MEMORY[0x1E0C80A78](v229);
  v228 = (uint64_t *)((char *)&v210 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x1E0C80A78](v11);
  v223 = (uint64_t)&v210 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v218 = (uint64_t *)((char *)&v210 - v15);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (uint64_t *)((char *)&v210 - v17);
  v19 = MEMORY[0x1E0C80A78](v16);
  v212 = (uint64_t *)((char *)&v210 - v20);
  v21 = MEMORY[0x1E0C80A78](v19);
  v217 = (uint64_t *)((char *)&v210 - v22);
  v23 = MEMORY[0x1E0C80A78](v21);
  v25 = (uint64_t *)((char *)&v210 - v24);
  v26 = MEMORY[0x1E0C80A78](v23);
  v220 = (uint64_t *)((char *)&v210 - v27);
  v28 = MEMORY[0x1E0C80A78](v26);
  v221 = (uint64_t *)((char *)&v210 - v29);
  v30 = MEMORY[0x1E0C80A78](v28);
  v215 = (uint64_t *)((char *)&v210 - v31);
  MEMORY[0x1E0C80A78](v30);
  v33 = (char *)&v210 - v32;
  v34 = sub_1C146574C();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v37 = (uint64_t *)((char *)&v210 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  v38 = (void *)v2[2];
  *v37 = v38;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v35 + 104))(v37, *MEMORY[0x1E0DEF740], v34);
  v39 = v38;
  LOBYTE(v38) = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v35 + 8))(v37, v34);
  if ((v38 & 1) != 0)
  {
    v216 = v25;
    v213 = v18;
    sub_1C1458A68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    if (qword_1ED798C20 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v40 = sub_1C1465710();
  v41 = __swift_project_value_buffer(v40, (uint64_t)qword_1ED798C08);
  sub_1C145BEBC(a1, (uint64_t)v33, type metadata accessor for Alert);
  swift_retain_n();
  v42 = sub_1C1465704();
  v43 = sub_1C14657A0();
  v44 = os_log_type_enabled(v42, v43);
  v230 = (uint64_t *)a1;
  if (v44)
  {
    v45 = swift_slowAlloc();
    v211 = swift_slowAlloc();
    v232[0] = v211;
    *(_DWORD *)v45 = 136380931;
    v227 = v41;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v46 = sub_1C1465668();
    v231 = sub_1C145A834(v46, v47, v232);
    v41 = v227;
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2082;
    v48 = Alert.description.getter();
    v231 = sub_1C145A834(v48, v49, v232);
    a1 = (uint64_t)v230;
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v33, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v42, v43, "(%{private}s): Advancing alert to next state: %{public}s", (uint8_t *)v45, 0x16u);
    v50 = v211;
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v50, -1, -1);
    MEMORY[0x1C3BADCBC](v45, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v33, type metadata accessor for Alert);
  }

  if ((sub_1C14586C8(a1) & 1) != 0)
  {
    v51 = a1;
    v52 = v228;
    sub_1C145BEBC(v51, (uint64_t)v228, type metadata accessor for Alert);
    swift_retain_n();
    v53 = sub_1C1465704();
    v54 = sub_1C14657A0();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc();
      v56 = v2;
      v57 = swift_slowAlloc();
      v232[0] = v57;
      *(_DWORD *)v55 = 136380931;
      __swift_project_boxed_opaque_existential_1(v56 + 4, v56[7]);
      v58 = sub_1C1465668();
      v231 = sub_1C145A834(v58, v59, v232);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2082;
      v60 = *v52;
      v61 = v52[1];
      swift_bridgeObjectRetain();
      v231 = sub_1C145A834(v60, v61, v232);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v52, type metadata accessor for Alert);
      v62 = "(%{private}s): Current state is obsolete; abandoning further action: %{public}s";
LABEL_9:
      _os_log_impl(&dword_1C144E000, v53, v54, v62, (uint8_t *)v55, 0x16u);
      swift_arrayDestroy();
      v63 = v57;
LABEL_10:
      MEMORY[0x1C3BADCBC](v63, -1, -1);
      MEMORY[0x1C3BADCBC](v55, -1, -1);
LABEL_19:

      return;
    }
    goto LABEL_17;
  }
  v64 = a1;
  v65 = *((int *)v229 + 8);
  v66 = *(_QWORD *)(v64 + v65);
  v67 = *(_QWORD *)(v66 + 16);
  if (!v67)
  {
    __break(1u);
    goto LABEL_94;
  }
  v68 = v67 - 1;
  v69 = *(_QWORD *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  v70 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  v71 = *(_QWORD *)(v69 + 72);
  v72 = v66 + v70 + v71 * v68;
  v73 = *(unsigned __int8 *)(v72 + 40);
  if (!(v73 >> 6))
  {
    if ((v73 & 1) != 0)
    {
      v52 = v221;
      sub_1C145BEBC((uint64_t)v230, (uint64_t)v221, type metadata accessor for Alert);
      swift_retain_n();
      v53 = sub_1C1465704();
      v105 = v2;
      v106 = sub_1C14657A0();
      if (os_log_type_enabled(v53, v106))
      {
        v55 = swift_slowAlloc();
        v107 = swift_slowAlloc();
        v232[0] = v107;
        *(_DWORD *)v55 = 136380931;
        __swift_project_boxed_opaque_existential_1(v105 + 4, v105[7]);
        v108 = sub_1C1465668();
        v231 = sub_1C145A834(v108, v109, v232);
        sub_1C14657E8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v55 + 12) = 2082;
        v110 = *v52;
        v111 = v52[1];
        swift_bridgeObjectRetain();
        v231 = sub_1C145A834(v110, v111, v232);
        sub_1C14657E8();
        swift_bridgeObjectRelease();
        sub_1C145BF00((uint64_t)v52, type metadata accessor for Alert);
        _os_log_impl(&dword_1C144E000, v53, v106, "(%{private}s): Ignoring alert that is waiting to be presented: %{public}s", (uint8_t *)v55, 0x16u);
        swift_arrayDestroy();
        v63 = v107;
        goto LABEL_10;
      }
LABEL_17:
      swift_release_n();
      v78 = (uint64_t)v52;
      goto LABEL_18;
    }
    v80 = *(_QWORD *)(v72 + 24);
    v79 = *(_QWORD *)(v72 + 32);
    v81 = v2;
    v82 = v2 + 4;
    v83 = v81;
    __swift_project_boxed_opaque_existential_1(v82, v81[7]);
    swift_bridgeObjectRetain();
    if (v80 == sub_1C1465668() && v79 == v84)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v125 = sub_1C1465908();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v125 & 1) == 0)
      {
        v126 = v215;
        sub_1C145BEBC((uint64_t)v230, (uint64_t)v215, type metadata accessor for Alert);
        swift_retain_n();
        v53 = sub_1C1465704();
        v127 = sub_1C14657A0();
        if (os_log_type_enabled(v53, v127))
        {
          v55 = swift_slowAlloc();
          v230 = (uint64_t *)swift_slowAlloc();
          v232[0] = (uint64_t)v230;
          *(_DWORD *)v55 = 136380931;
          __swift_project_boxed_opaque_existential_1(v82, v83[7]);
          v160 = sub_1C1465668();
          v231 = sub_1C145A834(v160, v161, v232);
          sub_1C14657E8();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 12) = 2082;
          v162 = *v126;
          v163 = v126[1];
          swift_bridgeObjectRetain();
          v231 = sub_1C145A834(v162, v163, v232);
          sub_1C14657E8();
          swift_bridgeObjectRelease();
          sub_1C145BF00((uint64_t)v126, type metadata accessor for Alert);
          v132 = "(%{private}s): Ignoring alert request not intended for this device: %{public}s";
          goto LABEL_64;
        }
LABEL_81:
        swift_release_n();
        v78 = (uint64_t)v126;
        goto LABEL_18;
      }
    }
    sub_1C1456E80((uint64_t)v230);
    return;
  }
  if (v73 >> 6 != 1)
  {
    v86 = *(_QWORD *)(v72 + 24);
    v85 = *(_QWORD *)(v72 + 32);
    v87 = v2 + 4;
    v228 = v2;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    swift_bridgeObjectRetain();
    if (v86 == sub_1C1465668() && v85 == v88)
    {
      swift_bridgeObjectRelease_n();
      v89 = (uint64_t)v228;
    }
    else
    {
      v112 = sub_1C1465908();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v89 = (uint64_t)v228;
      if ((v112 & 1) == 0)
      {
        __swift_project_boxed_opaque_existential_1(v87, v228[7]);
        v113 = sub_1C1465668();
        v115 = v114;
        v116 = (uint64_t)v230;
        v117 = *(uint64_t *)((char *)v230 + v65);
        v118 = *(_QWORD *)(v117 + 16);
        if (v118)
        {
          v119 = v113;
          v120 = (unsigned __int8 *)(v70 + v117 + 40);
          while (1)
          {
            v121 = *((_QWORD *)v120 - 2) == v119 && *((_QWORD *)v120 - 1) == v115;
            if ((v121 || (sub_1C1465908() & 1) != 0) && *v120 <= 0x3Fu)
              break;
            v120 += v71;
            if (!--v118)
              goto LABEL_59;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_59:
          swift_bridgeObjectRelease();
          sub_1C1458DEC(v116);
        }
      }
    }
    v185 = v230;
    v186 = v224;
    sub_1C14655A8();
    sub_1C1465560();
    v188 = v187;
    (*(void (**)(char *, uint64_t))(v225 + 8))(v186, v226);
    if (v188 > 0.0)
    {
      v189 = *v185;
      v190 = v185[1];
      v191 = v223;
      sub_1C145BEBC((uint64_t)v185, v223, type metadata accessor for Alert);
      v192 = (*(unsigned __int8 *)(v222 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v222 + 80);
      v193 = swift_allocObject();
      *(_QWORD *)(v193 + 16) = v89;
      sub_1C145BF3C(v191, v193 + v192, type metadata accessor for Alert);
      swift_retain();
      sub_1C14591D0(v189, v190, (uint64_t (*)(uint64_t))sub_1C145BE6C, v193, v188);
      swift_release();
      return;
    }
    v133 = (uint64_t)v185;
    goto LABEL_80;
  }
  v227 = v41;
  v75 = *(_QWORD *)(v72 + 8);
  v74 = *(_QWORD *)(v72 + 16);
  v76 = v2 + 4;
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v75 == sub_1C1465668() && v74 == v77)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_28;
  }
  v90 = sub_1C1465908();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v90 & 1) == 0)
  {
    v126 = v218;
    sub_1C145BEBC((uint64_t)v230, (uint64_t)v218, type metadata accessor for Alert);
    swift_retain_n();
    v53 = sub_1C1465704();
    v127 = sub_1C14657A0();
    if (os_log_type_enabled(v53, v127))
    {
      v55 = swift_slowAlloc();
      v230 = (uint64_t *)swift_slowAlloc();
      v232[0] = (uint64_t)v230;
      *(_DWORD *)v55 = 136380931;
      __swift_project_boxed_opaque_existential_1(v76, v2[7]);
      v128 = sub_1C1465668();
      v231 = sub_1C145A834(v128, v129, v232);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2082;
      v130 = *v126;
      v131 = v126[1];
      swift_bridgeObjectRetain();
      v231 = sub_1C145A834(v130, v131, v232);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v126, type metadata accessor for Alert);
      v132 = "(%{private}s): Ignoring failing alert that originated on another device: %{public}s";
LABEL_64:
      _os_log_impl(&dword_1C144E000, v53, v127, v132, (uint8_t *)v55, 0x16u);
      v164 = (uint64_t)v230;
      swift_arrayDestroy();
      v63 = v164;
      goto LABEL_10;
    }
    goto LABEL_81;
  }
LABEL_28:
  v91 = *(uint64_t *)((char *)v230 + v65);
  v92 = *(_QWORD *)(v91 + 16);
  if (!v92)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v93 = v91 + v70 + (v92 - 1) * v71;
  if (*(_BYTE *)v93 == 1)
  {
    v94 = (uint64_t)v230;
    v95 = v220;
    sub_1C145BEBC((uint64_t)v230, (uint64_t)v220, type metadata accessor for Alert);
    swift_retain_n();
    v96 = sub_1C1465704();
    v97 = sub_1C1465794();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = swift_slowAlloc();
      v99 = v2;
      v100 = swift_slowAlloc();
      v232[0] = v100;
      *(_DWORD *)v98 = 136315394;
      __swift_project_boxed_opaque_existential_1(v76, v99[7]);
      v101 = sub_1C1465668();
      v231 = sub_1C145A834(v101, v102, v232);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v98 + 12) = 2082;
      v103 = *v95;
      v104 = v95[1];
      swift_bridgeObjectRetain();
      v231 = sub_1C145A834(v103, v104, v232);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v95, type metadata accessor for Alert);
      _os_log_impl(&dword_1C144E000, v96, v97, "(%s): Mandatory alert failed to be displayed: %{public}s", (uint8_t *)v98, 0x16u);
      swift_arrayDestroy();
      v94 = (uint64_t)v230;
      MEMORY[0x1C3BADCBC](v100, -1, -1);
      MEMORY[0x1C3BADCBC](v98, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_1C145BF00((uint64_t)v95, type metadata accessor for Alert);
    }

    v133 = v94;
LABEL_80:
    sub_1C1452EDC(v133);
    return;
  }
  v123 = *(_QWORD *)(v93 + 24);
  v122 = *(_QWORD *)(v93 + 32);
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v123 != sub_1C1465668() || v122 != v124)
  {
    v134 = sub_1C1465908();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v134 & 1) != 0)
      goto LABEL_56;
    v165 = *(uint64_t *)((char *)v230 + v65);
    v166 = (uint64_t)v230;
    v167 = *(_QWORD *)(v165 + 16);
    if (v167)
    {
      v168 = v165 + v70 + (v167 - 1) * v71;
      v170 = *(_QWORD *)(v168 + 24);
      v169 = *(_QWORD *)(v168 + 32);
      v171 = v2 + 4;
      __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
      swift_bridgeObjectRetain();
      v172 = (uint64_t)v214;
      sub_1C146565C();
      v173 = sub_1C146568C();
      v174 = *(_QWORD *)(v173 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v174 + 48))(v172, 1, v173) == 1)
      {
        sub_1C145BE2C(v172, &qword_1EF6DEAF0);
        swift_bridgeObjectRelease();
LABEL_69:
        v175 = v213;
        sub_1C145BEBC(v166, (uint64_t)v213, type metadata accessor for Alert);
        swift_retain_n();
        v53 = sub_1C1465704();
        v54 = sub_1C1465794();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = swift_slowAlloc();
          v176 = v2;
          v57 = swift_slowAlloc();
          v232[0] = v57;
          *(_DWORD *)v55 = 136380931;
          __swift_project_boxed_opaque_existential_1(v171, v176[7]);
          v177 = sub_1C1465668();
          v231 = sub_1C145A834(v177, v178, v232);
          sub_1C14657E8();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 12) = 2082;
          v179 = *v175;
          v180 = v175[1];
          swift_bridgeObjectRetain();
          v231 = sub_1C145A834(v179, v180, v232);
          sub_1C14657E8();
          swift_bridgeObjectRelease();
          sub_1C145BF00((uint64_t)v175, type metadata accessor for Alert);
          v62 = "(%{private}s): Ignoring alert from unexpected device: %{public}s";
          goto LABEL_9;
        }
        swift_release_n();
        v78 = (uint64_t)v175;
LABEL_18:
        sub_1C145BF00(v78, type metadata accessor for Alert);
        goto LABEL_19;
      }
      v194 = v2;
      v195 = sub_1C1465680();
      v197 = v196;
      (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v172, v173);
      if (v170 == v195 && v169 == v197)
      {
        swift_bridgeObjectRelease_n();
        v2 = v194;
      }
      else
      {
        v198 = sub_1C1465908();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v2 = v194;
        if ((v198 & 1) == 0)
          goto LABEL_69;
      }
      v199 = v212;
      sub_1C145BEBC(v166, (uint64_t)v212, type metadata accessor for Alert);
      swift_retain_n();
      v200 = sub_1C1465704();
      v201 = sub_1C14657A0();
      if (os_log_type_enabled(v200, v201))
      {
        v202 = swift_slowAlloc();
        v228 = (uint64_t *)swift_slowAlloc();
        v232[0] = (uint64_t)v228;
        *(_DWORD *)v202 = 136380931;
        v229 = v171;
        __swift_project_boxed_opaque_existential_1(v171, v194[7]);
        v203 = sub_1C1465668();
        v231 = sub_1C145A834(v203, v204, v232);
        sub_1C14657E8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v202 + 12) = 2082;
        v205 = *v199;
        v206 = v199[1];
        swift_bridgeObjectRetain();
        v231 = sub_1C145A834(v205, v206, v232);
        v207 = (uint64_t)v229;
        sub_1C14657E8();
        v171 = (_QWORD *)v207;
        swift_bridgeObjectRelease();
        sub_1C145BF00((uint64_t)v199, type metadata accessor for Alert);
        _os_log_impl(&dword_1C144E000, v200, v201, "(%{private}s): Remote device failed to show optional alert; retrying as mandatory alert: %{public}s",
          (uint8_t *)v202,
          0x16u);
        v208 = (uint64_t)v228;
        swift_arrayDestroy();
        v2 = v194;
        MEMORY[0x1C3BADCBC](v208, -1, -1);
        MEMORY[0x1C3BADCBC](v202, -1, -1);
      }
      else
      {
        swift_release_n();
        sub_1C145BF00((uint64_t)v199, type metadata accessor for Alert);
      }

      __swift_project_boxed_opaque_existential_1(v171, v2[7]);
      v181 = sub_1C1465668();
      v183 = v209;
      LOBYTE(v232[0]) = 1;
      v184 = (char *)v166;
      goto LABEL_73;
    }
LABEL_95:
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease_n();
LABEL_56:
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  v135 = (uint64_t)v219;
  sub_1C146565C();
  v136 = sub_1C146568C();
  v137 = *(_QWORD *)(v136 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v137 + 48))(v135, 1, v136) == 1)
  {
    sub_1C145BE2C(v135, &qword_1EF6DEAF0);
    v138 = (uint64_t)v230;
    v139 = v217;
    sub_1C145BEBC((uint64_t)v230, (uint64_t)v217, type metadata accessor for Alert);
    swift_retain_n();
    v140 = sub_1C1465704();
    v141 = sub_1C14657A0();
    if (os_log_type_enabled(v140, v141))
    {
      v142 = swift_slowAlloc();
      v229 = (_QWORD *)swift_slowAlloc();
      v232[0] = (uint64_t)v229;
      *(_DWORD *)v142 = 136380931;
      __swift_project_boxed_opaque_existential_1(v76, v2[7]);
      v143 = sub_1C1465668();
      v231 = sub_1C145A834(v143, v144, v232);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v142 + 12) = 2082;
      v145 = *v139;
      v146 = v139[1];
      swift_bridgeObjectRetain();
      v231 = sub_1C145A834(v145, v146, v232);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v139, type metadata accessor for Alert);
      _os_log_impl(&dword_1C144E000, v140, v141, "(%{private}s): Optional alert failed; retrying as mandatory alert: %{public}s",
        (uint8_t *)v142,
        0x16u);
      v147 = (uint64_t)v229;
      swift_arrayDestroy();
      v138 = (uint64_t)v230;
      MEMORY[0x1C3BADCBC](v147, -1, -1);
      MEMORY[0x1C3BADCBC](v142, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_1C145BF00((uint64_t)v139, type metadata accessor for Alert);
    }

    __swift_project_boxed_opaque_existential_1(v76, v2[7]);
    v181 = sub_1C1465668();
    v183 = v182;
    LOBYTE(v232[0]) = 1;
    v184 = (char *)v138;
LABEL_73:
    sub_1C14567AC(v184, v181, v183, (unsigned __int8 *)v232);
    swift_bridgeObjectRelease();
    return;
  }
  v229 = (_QWORD *)sub_1C1465680();
  v149 = v148;
  (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v135, v136);
  v150 = (char *)v230;
  v151 = v216;
  sub_1C145BEBC((uint64_t)v230, (uint64_t)v216, type metadata accessor for Alert);
  swift_retain_n();
  v152 = sub_1C1465704();
  v153 = sub_1C14657A0();
  if (os_log_type_enabled(v152, v153))
  {
    v154 = swift_slowAlloc();
    v227 = swift_slowAlloc();
    v232[0] = v227;
    *(_DWORD *)v154 = 136380931;
    v228 = (uint64_t *)v149;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v150 = (char *)v230;
    v155 = sub_1C1465668();
    v231 = sub_1C145A834(v155, v156, v232);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v154 + 12) = 2082;
    v157 = *v151;
    v158 = v151[1];
    swift_bridgeObjectRetain();
    v231 = sub_1C145A834(v157, v158, v232);
    v149 = (uint64_t)v228;
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v151, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v152, v153, "(%{private}s): Sending failed optional alert to remote device: %{public}s", (uint8_t *)v154, 0x16u);
    v159 = v227;
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v159, -1, -1);
    MEMORY[0x1C3BADCBC](v154, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v151, type metadata accessor for Alert);
  }

  LOBYTE(v232[0]) = 0;
  sub_1C14567AC(v150, (uint64_t)v229, v149, (unsigned __int8 *)v232);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall AlertCenter.dismissAlert(identifier:)(Swift::String identifier)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v2 = v1;
  object = identifier._object;
  countAndFlagsBits = identifier._countAndFlagsBits;
  v5 = *(NSObject **)(v2 + 16);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = countAndFlagsBits;
  v6[4] = object;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1C145B940;
  *(_QWORD *)(v7 + 24) = v6;
  v9[4] = sub_1C145C990;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1C1450694;
  v9[3] = &block_descriptor_24;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v5 & 1) != 0)
    __break(1u);
}

uint64_t sub_1C1452B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[3];
  uint64_t v31;
  uint64_t v32;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Alert(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v28 - v14;
  swift_beginAccess();
  sub_1C145C90C(a1 + 96, (uint64_t)v30);
  v16 = v31;
  v17 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(a2, a3, v16, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1C145BE2C((uint64_t)v8, &qword_1ED798A50);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  }
  else
  {
    sub_1C145BF3C((uint64_t)v8, (uint64_t)v15, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
    if (qword_1ED798C20 != -1)
      swift_once();
    v19 = sub_1C1465710();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED798C08);
    sub_1C145BEBC((uint64_t)v15, (uint64_t)v13, type metadata accessor for Alert);
    swift_retain_n();
    v20 = sub_1C1465704();
    v21 = sub_1C14657A0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v30[0] = v28;
      *(_DWORD *)v22 = 136380931;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
      v23 = sub_1C1465668();
      v29 = sub_1C145A834(v23, v24, v30);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2082;
      v25 = Alert.description.getter();
      v29 = sub_1C145A834(v25, v26, v30);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v13, type metadata accessor for Alert);
      _os_log_impl(&dword_1C144E000, v20, v21, "(%{private}s): Dismissing alert: %{public}s", (uint8_t *)v22, 0x16u);
      v27 = v28;
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v27, -1, -1);
      MEMORY[0x1C3BADCBC](v22, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_1C145BF00((uint64_t)v13, type metadata accessor for Alert);
    }

    sub_1C1452EDC((uint64_t)v15);
    return sub_1C145BF00((uint64_t)v15, type metadata accessor for Alert);
  }
}

uint64_t sub_1C1452EDC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46[3];

  v2 = v1;
  v42 = *(_QWORD *)(type metadata accessor for Alert(0) - 8);
  v4 = *(_QWORD *)(v42 + 64);
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v40 - v6;
  v8 = sub_1C146574C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (_QWORD *)((char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (void *)v2[2];
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v13 = v12;
  v14 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v14 & 1) != 0)
  {
    v41 = (uint64_t)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (qword_1ED798C20 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v15 = sub_1C1465710();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED798C08);
  v44 = (uint64_t *)a1;
  sub_1C145BEBC(a1, (uint64_t)v7, type metadata accessor for Alert);
  swift_retain_n();
  v16 = sub_1C1465704();
  v17 = sub_1C14657A0();
  v18 = os_log_type_enabled(v16, v17);
  v40[0] = v13;
  v40[1] = v4;
  if (v18)
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v46[0] = v20;
    *(_DWORD *)v19 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v21 = sub_1C1465668();
    v45 = sub_1C145A834(v21, v22, v46);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    v23 = Alert.description.getter();
    v45 = sub_1C145A834(v23, v24, v46);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v7, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v16, v17, "(%{private}s): Deleting alert: %{public}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v20, -1, -1);
    MEMORY[0x1C3BADCBC](v19, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v7, type metadata accessor for Alert);
  }

  v25 = (uint64_t)v44;
  v26 = *v44;
  v27 = v44[1];
  swift_beginAccess();
  v28 = v2[15];
  v29 = v2[16];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v28);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v29 + 32))(v26, v27, v28, v29);
  swift_endAccess();
  v30 = v2[7];
  v43 = v2[8];
  __swift_project_boxed_opaque_existential_1(v2 + 4, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB30);
  sub_1C14656EC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C1465E10;
  v31 = qword_1ED798A00;
  swift_bridgeObjectRetain();
  if (v31 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C14656D4();
  sub_1C1465650();
  swift_bridgeObjectRelease();
  v32 = v2[10];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 40))(v25, ObjectType, v32);
  sub_1C1458A68(v26, v27);
  result = MEMORY[0x1C3BADD10](v2 + 18);
  if (result)
  {
    v35 = result;
    v36 = v2[19];
    sub_1C1465644();
    v37 = v41;
    sub_1C145BEBC(v25, v41, type metadata accessor for Alert);
    v38 = (*(unsigned __int8 *)(v42 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    v39 = (_QWORD *)swift_allocObject();
    v39[2] = v35;
    v39[3] = v36;
    v39[4] = v2;
    sub_1C145BF3C(v37, (uint64_t)v39 + v38, type metadata accessor for Alert);
    swift_retain();
    swift_unknownObjectRetain();
    sub_1C1465638();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*sub_1C1453434(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1C14506CC(v2);
  return sub_1C1453478;
}

void sub_1C1453478(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1C14534A4()
{
  unsigned __int8 v1;

  sub_1C14657C4();
  return v1;
}

uint64_t AlertCenter.syncEngine(_:dataFor:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB00);
  sub_1C14657C4();
  return v1;
}

void sub_1C1453568(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[5];
  uint64_t v58;

  v54 = a3;
  v53 = sub_1C14656EC();
  v56 = *(_QWORD *)(v53 - 8);
  v5 = MEMORY[0x1E0C80A78](v53);
  v50 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v51 = (char *)&v49 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Alert(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C145C90C(a1 + 96, (uint64_t)v57);
  v15 = v57[4];
  __swift_project_boxed_opaque_existential_1(v57, v57[3]);
  v52 = a2;
  v16 = sub_1C14656E0();
  (*(void (**)(uint64_t))(v15 + 16))(v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1C145BE2C((uint64_t)v10, &qword_1ED798A50);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
    if (qword_1ED798C20 != -1)
      swift_once();
    v17 = sub_1C1465710();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED798C08);
    v18 = v56;
    v19 = v51;
    v20 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v51, v52, v53);
    v21 = sub_1C1465704();
    v22 = sub_1C14657A0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v57[0] = v24;
      *(_DWORD *)v23 = 136446210;
      sub_1C145C950(&qword_1EF6DEB10, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D8D5E8], MEMORY[0x1E0D8D608]);
      v25 = sub_1C14658FC();
      v58 = sub_1C145A834(v25, v26, v57);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v19, v20);
      _os_log_impl(&dword_1C144E000, v21, v22, "Could not find an alert for recordID %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v24, -1, -1);
      MEMORY[0x1C3BADCBC](v23, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v20);
    }

    v46 = 0;
    v47 = 0xF000000000000000;
    v48 = v54;
  }
  else
  {
    sub_1C145BF3C((uint64_t)v10, (uint64_t)v14, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
    sub_1C1465530();
    swift_allocObject();
    v27 = sub_1C1465524();
    sub_1C145C950(&qword_1EF6DEB60, 255, type metadata accessor for Alert, (uint64_t)&protocol conformance descriptor for Alert);
    v28 = v55;
    v29 = sub_1C1465518();
    v31 = v14;
    if (v28)
    {
      if (qword_1ED798C20 != -1)
        swift_once();
      v32 = sub_1C1465710();
      __swift_project_value_buffer(v32, (uint64_t)qword_1ED798C08);
      v33 = v56;
      v34 = v50;
      v35 = v53;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v50, v52, v53);
      MEMORY[0x1C3BADBCC](v28);
      MEMORY[0x1C3BADBCC](v28);
      v36 = sub_1C1465704();
      v37 = sub_1C14657A0();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc();
        v55 = v27;
        v39 = v38;
        v51 = (char *)swift_slowAlloc();
        v57[0] = (uint64_t)v51;
        *(_DWORD *)v39 = 136446466;
        v52 = (uint64_t)v31;
        sub_1C145C950(&qword_1EF6DEB10, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D8D5E8], MEMORY[0x1E0D8D608]);
        v40 = sub_1C14658FC();
        v58 = sub_1C145A834(v40, v41, v57);
        sub_1C14657E8();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
        *(_WORD *)(v39 + 12) = 2082;
        v58 = v28;
        MEMORY[0x1C3BADBCC](v28);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB68);
        v42 = sub_1C1465764();
        v58 = sub_1C145A834(v42, v43, v57);
        sub_1C14657E8();
        swift_bridgeObjectRelease();
        MEMORY[0x1C3BADBC0](v28);
        MEMORY[0x1C3BADBC0](v28);
        _os_log_impl(&dword_1C144E000, v36, v37, "Could not encode alert for recordID %{public}s: %{public}s", (uint8_t *)v39, 0x16u);
        v44 = v51;
        swift_arrayDestroy();
        MEMORY[0x1C3BADCBC](v44, -1, -1);
        MEMORY[0x1C3BADCBC](v39, -1, -1);

        swift_release();
        MEMORY[0x1C3BADBC0](v28);
        v45 = v52;
      }
      else
      {

        swift_release();
        MEMORY[0x1C3BADBC0](v28);
        MEMORY[0x1C3BADBC0](v28);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
        MEMORY[0x1C3BADBC0](v28);
        v45 = (uint64_t)v31;
      }
      sub_1C145BF00(v45, type metadata accessor for Alert);
      v46 = 0;
      v47 = 0xF000000000000000;
    }
    else
    {
      v46 = v29;
      v47 = v30;
      sub_1C145BF00((uint64_t)v14, type metadata accessor for Alert);
      swift_release();
    }
    v48 = v54;
  }
  *v48 = v46;
  v48[1] = v47;
}

uint64_t AlertCenter.syncEngine(_:resolveConflictBetween:and:)()
{
  uint64_t v1;

  sub_1C14657C4();
  return v1;
}

uint64_t sub_1C1453C54@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
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
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  void (*v34)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, unint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v100 = a1;
  v97 = a2;
  v2 = sub_1C14656C8();
  v88 = *(_QWORD *)(v2 - 8);
  v89 = v2;
  MEMORY[0x1E0C80A78](v2);
  v87 = (char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C14656A4();
  v82 = *(_QWORD *)(v4 - 8);
  v83 = v4;
  MEMORY[0x1E0C80A78](v4);
  v81 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C14656EC();
  v85 = *(_QWORD *)(v6 - 8);
  v86 = v6;
  MEMORY[0x1E0C80A78](v6);
  v84 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C14655C0();
  v93 = *(_QWORD *)(v8 - 8);
  v94 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v90 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v92 = (char *)&v80 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  v13 = MEMORY[0x1E0C80A78](v12);
  v95 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v80 - v15;
  v17 = type metadata accessor for Alert(0);
  v98 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x1E0C80A78](v17);
  v91 = (uint64_t)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v80 - v21;
  MEMORY[0x1E0C80A78](v20);
  v96 = (uint64_t)&v80 - v23;
  sub_1C146550C();
  swift_allocObject();
  v24 = sub_1C1465500();
  v25 = sub_1C14656B0();
  v27 = v26;
  sub_1C145C950(&qword_1EF6DEB08, 255, type metadata accessor for Alert, (uint64_t)&protocol conformance descriptor for Alert);
  v28 = v17;
  v101 = v24;
  v29 = (uint64_t)v99;
  sub_1C14654F4();
  if (v29)
  {
    MEMORY[0x1C3BADBC0](v29);
    sub_1C145B8B4(v25, v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v16, 1, 1, v17);
    sub_1C145BE2C((uint64_t)v16, &qword_1ED798A50);
    v30 = sub_1C14656B0();
    v32 = v31;
    result = swift_release();
LABEL_10:
    v64 = v97;
    *v97 = v30;
    v64[1] = v32;
    return result;
  }
  v99 = v22;
  sub_1C145B8B4(v25, v27);
  v34 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v98 + 56);
  v34(v16, 0, 1, v17);
  sub_1C145BF3C((uint64_t)v16, v96, type metadata accessor for Alert);
  v35 = sub_1C14656B0();
  v37 = v36;
  v38 = (uint64_t)v95;
  sub_1C14654F4();
  v98 = 0;
  sub_1C145B8B4(v35, v37);
  v34((char *)v38, 0, 1, v17);
  v39 = (uint64_t)v99;
  sub_1C145BF3C(v38, (uint64_t)v99, type metadata accessor for Alert);
  v40 = *(_QWORD *)(v96 + *(int *)(v17 + 32));
  v41 = *(_QWORD *)(v40 + 16);
  if (!v41)
  {
    __break(1u);
    goto LABEL_12;
  }
  v42 = v41 - 1;
  v43 = type metadata accessor for Alert.HistoryItem(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  v46 = *(_QWORD *)(v44 + 72);
  v47 = v40 + v45 + v46 * v42 + *(int *)(v43 + 32);
  v48 = v92;
  v49 = v93;
  v50 = *(void (**)(char *, unint64_t, uint64_t))(v93 + 16);
  v51 = v94;
  v50(v92, v47, v94);
  v52 = *(_QWORD *)(v39 + *(int *)(v28 + 32));
  v53 = *(_QWORD *)(v52 + 16);
  if (!v53)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v54 = v52 + v45 + (v53 - 1) * v46 + *(int *)(v43 + 32);
  v55 = v90;
  v50(v90, v54, v51);
  v56 = sub_1C1465578();
  v57 = *(void (**)(char *, uint64_t))(v49 + 8);
  v57(v55, v51);
  v57(v48, v51);
  v58 = v96;
  if ((v56 & 1) != 0)
    v59 = v96;
  else
    v59 = v39;
  v60 = v91;
  sub_1C145BEBC(v59, v91, type metadata accessor for Alert);
  sub_1C1465530();
  swift_allocObject();
  sub_1C1465524();
  sub_1C145C950(&qword_1EF6DEB60, 255, type metadata accessor for Alert, (uint64_t)&protocol conformance descriptor for Alert);
  v61 = v98;
  v62 = sub_1C1465518();
  v28 = v61;
  if (!v61)
  {
    v30 = v62;
    v32 = v63;
    swift_release();
    swift_release();
    sub_1C145BF00(v60, type metadata accessor for Alert);
    sub_1C145BF00(v39, type metadata accessor for Alert);
    result = sub_1C145BF00(v58, type metadata accessor for Alert);
    goto LABEL_10;
  }
LABEL_13:
  v65 = v100;
  if (qword_1ED798C20 != -1)
    swift_once();
  v66 = sub_1C1465710();
  __swift_project_value_buffer(v66, (uint64_t)qword_1ED798C08);
  (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v87, v65, v89);
  MEMORY[0x1C3BADBCC](v28);
  v67 = sub_1C1465704();
  v68 = sub_1C14657A0();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = swift_slowAlloc();
    v101 = swift_slowAlloc();
    v103 = v101;
    *(_DWORD *)v69 = 136446466;
    v100 = v69 + 4;
    v70 = v81;
    v71 = v87;
    sub_1C14656BC();
    v72 = v84;
    sub_1C1465698();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v70, v83);
    sub_1C145C950(&qword_1EF6DEB10, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D8D5E8], MEMORY[0x1E0D8D608]);
    v73 = v86;
    v74 = sub_1C14658FC();
    v76 = v75;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v72, v73);
    v102 = sub_1C145A834(v74, v76, &v103);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v71, v89);
    *(_WORD *)(v69 + 12) = 2082;
    v102 = v28;
    MEMORY[0x1C3BADBCC](v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB68);
    v77 = sub_1C1465764();
    v102 = sub_1C145A834(v77, v78, &v103);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    MEMORY[0x1C3BADBC0](v28);
    MEMORY[0x1C3BADBC0](v28);
    _os_log_impl(&dword_1C144E000, v67, v68, "Could not encode alert for recordID %{public}s: %{public}s", (uint8_t *)v69, 0x16u);
    v79 = v101;
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v79, -1, -1);
    MEMORY[0x1C3BADCBC](v69, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v89);
    MEMORY[0x1C3BADBC0](v28);
    MEMORY[0x1C3BADBC0](v28);
  }

  result = sub_1C1465860();
  __break(1u);
  return result;
}

BOOL AlertCenter.syncEngine(_:didFetch:)(uint64_t a1, uint64_t a2)
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v3 = sub_1C14656A4();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x1E0C80A78](v3);
  v51 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C14656EC();
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  MEMORY[0x1E0C80A78](v5);
  v54 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C14656C8();
  v62 = *(_QWORD *)(v7 - 8);
  v63 = v7;
  MEMORY[0x1E0C80A78](v7);
  v61 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Alert(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x1E0C80A78](v9);
  v57 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v58 = (uint8_t *)&v50 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v50 - v18;
  sub_1C146550C();
  swift_allocObject();
  v20 = sub_1C1465500();
  v59 = a2;
  v21 = sub_1C14656B0();
  v23 = v22;
  sub_1C145C950(&qword_1EF6DEB08, 255, type metadata accessor for Alert, (uint64_t)&protocol conformance descriptor for Alert);
  v24 = v19;
  v64 = v20;
  sub_1C14654F4();
  sub_1C145B8B4(v21, v23);
  v25 = v19;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  sub_1C145B98C((uint64_t)v19, (uint64_t)v17);
  v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v17, 1, v9);
  if (v26 == 1)
  {
    sub_1C145BE2C((uint64_t)v17, &qword_1ED798A50);
    if (qword_1ED798C20 != -1)
      swift_once();
    v34 = sub_1C1465710();
    __swift_project_value_buffer(v34, (uint64_t)qword_1ED798C08);
    v36 = v61;
    v35 = v62;
    v37 = v63;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v59, v63);
    v38 = sub_1C1465704();
    v39 = sub_1C14657A0();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v59 = swift_slowAlloc();
      v66 = v59;
      *(_DWORD *)v40 = 136446210;
      v60 = (uint64_t)v25;
      v58 = v40 + 4;
      v41 = v51;
      sub_1C14656BC();
      v42 = v54;
      sub_1C1465698();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v41, v53);
      sub_1C145C950(&qword_1EF6DEB10, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D8D5E8], MEMORY[0x1E0D8D608]);
      v43 = v56;
      v44 = sub_1C14658FC();
      v45 = v36;
      v47 = v46;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v43);
      v65 = sub_1C145A834(v44, v47, &v66);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v63);
      _os_log_impl(&dword_1C144E000, v38, v39, "Could not create an alert for recordID %{public}s", v40, 0xCu);
      v48 = v59;
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v48, -1, -1);
      MEMORY[0x1C3BADCBC](v40, -1, -1);

      swift_release();
      v33 = v60;
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
      v33 = (uint64_t)v25;
    }
  }
  else
  {
    v27 = (uint64_t)v24;
    v28 = (uint64_t)v58;
    sub_1C145BF3C((uint64_t)v17, (uint64_t)v58, type metadata accessor for Alert);
    sub_1C1465644();
    v29 = v60;
    v30 = v57;
    sub_1C145BEBC(v28, v57, type metadata accessor for Alert);
    v31 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v29;
    sub_1C145BF3C(v30, v32 + v31, type metadata accessor for Alert);
    swift_retain();
    sub_1C1465638();
    swift_release();
    swift_release();
    sub_1C145BF00(v28, type metadata accessor for Alert);
    v33 = v27;
  }
  sub_1C145BE2C(v33, &qword_1ED798A50);
  return v26 != 1;
}

uint64_t sub_1C1454ABC(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  _QWORD *v52;
  char v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  _QWORD *v61;
  char *v62;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[3];
  uint64_t v73;
  uint64_t v74;

  v2 = v1;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB38);
  MEMORY[0x1E0C80A78](v68);
  v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  v7 = MEMORY[0x1E0C80A78](v6);
  v64 = (uint64_t *)((char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v60 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v60 - v12;
  v69 = type metadata accessor for Alert(0);
  v67 = *(_QWORD *)(v69 - 8);
  v14 = MEMORY[0x1E0C80A78](v69);
  v61 = (uint64_t *)((char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v60 - v16;
  v18 = sub_1C146574C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (uint64_t *)((char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (void *)v2[2];
  *v21 = v22;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0DEF740], v18);
  v23 = v22;
  LOBYTE(v22) = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v19 + 8))(v21, v18);
  if ((v22 & 1) != 0)
  {
    v65 = v11;
    v66 = v5;
    if (qword_1ED798C20 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v24 = sub_1C1465710();
  v25 = __swift_project_value_buffer(v24, (uint64_t)qword_1ED798C08);
  sub_1C145BEBC((uint64_t)a1, (uint64_t)v17, type metadata accessor for Alert);
  swift_retain_n();
  v63 = v25;
  v26 = sub_1C1465704();
  v27 = sub_1C14657A0();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v72[0] = v60;
    *(_DWORD *)v28 = 136380931;
    v62 = v13;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v29 = sub_1C1465668();
    v71 = sub_1C145A834(v29, v30, v72);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    v31 = Alert.description.getter();
    v71 = sub_1C145A834(v31, v32, v72);
    v13 = v62;
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v17, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v26, v27, "(%{private}s): Received alert update from sync engine: %{public}s", (uint8_t *)v28, 0x16u);
    v33 = v60;
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v33, -1, -1);
    MEMORY[0x1C3BADCBC](v28, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v17, type metadata accessor for Alert);
  }

  swift_beginAccess();
  sub_1C145C90C((uint64_t)(v2 + 12), (uint64_t)v72);
  v34 = v73;
  v35 = v74;
  __swift_project_boxed_opaque_existential_1(v72, v73);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v35 + 16))(*a1, a1[1], v34, v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v72);
  v36 = (uint64_t)v65;
  sub_1C145BEBC((uint64_t)a1, (uint64_t)v65, type metadata accessor for Alert);
  v37 = v67;
  v38 = v69;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v67 + 56))(v36, 0, 1, v69);
  v39 = (uint64_t)v66;
  v40 = (uint64_t)&v66[*(int *)(v68 + 48)];
  sub_1C145B98C((uint64_t)v13, (uint64_t)v66);
  sub_1C145B98C(v36, v40);
  v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  if (v41(v39, 1, v38) == 1)
  {
    sub_1C145BE2C(v36, &qword_1ED798A50);
    if (v41(v40, 1, v38) == 1)
    {
      sub_1C145BE2C(v39, &qword_1ED798A50);
      goto LABEL_9;
    }
    v50 = &qword_1EF6DEB38;
    goto LABEL_24;
  }
  v49 = v64;
  sub_1C145B98C(v39, (uint64_t)v64);
  if (v41(v40, 1, v38) == 1)
  {
    v50 = &qword_1EF6DEB38;
LABEL_23:
    sub_1C145BE2C(v36, &qword_1ED798A50);
    sub_1C145BF00((uint64_t)v49, type metadata accessor for Alert);
LABEL_24:
    sub_1C145BE2C(v39, v50);
LABEL_25:
    swift_beginAccess();
    v57 = v2[15];
    v58 = v2[16];
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v57);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v58 + 24))(a1, v57, v58);
    swift_endAccess();
    sub_1C1450F84((uint64_t)a1);
LABEL_26:
    v48 = (uint64_t)v13;
    return sub_1C145BE2C(v48, &qword_1ED798A50);
  }
  v51 = v40;
  v52 = v61;
  sub_1C145BF3C(v51, (uint64_t)v61, type metadata accessor for Alert);
  if ((*v49 != *v52 || v49[1] != v52[1]) && (sub_1C1465908() & 1) == 0
    || (sub_1C146559C() & 1) == 0
    || (sub_1C146559C() & 1) == 0
    || (sub_1C1460B88(*(_QWORD *)((char *)v49 + *(int *)(v38 + 28)), *(_QWORD *)((char *)v49 + *(int *)(v38 + 28) + 8)),
        (v53 & 1) == 0))
  {
    sub_1C145BF00((uint64_t)v52, type metadata accessor for Alert);
    v50 = &qword_1ED798A50;
    goto LABEL_23;
  }
  v54 = sub_1C145FCC4(*(_QWORD *)((char *)v49 + *(int *)(v38 + 32)), *(_QWORD *)((char *)v52 + *(int *)(v38 + 32)));
  v55 = (uint64_t)v52;
  v56 = v54;
  sub_1C145BF00(v55, type metadata accessor for Alert);
  sub_1C145BE2C(v36, &qword_1ED798A50);
  sub_1C145BF00((uint64_t)v49, type metadata accessor for Alert);
  sub_1C145BE2C(v39, &qword_1ED798A50);
  if ((v56 & 1) == 0)
    goto LABEL_25;
LABEL_9:
  swift_retain_n();
  v42 = sub_1C1465704();
  v43 = sub_1C14657A0();
  if (!os_log_type_enabled(v42, v43))
  {
    swift_release_n();

    goto LABEL_26;
  }
  v44 = (uint8_t *)swift_slowAlloc();
  v45 = swift_slowAlloc();
  v62 = v13;
  *(_DWORD *)v44 = 136380675;
  v72[0] = v45;
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  v46 = sub_1C1465668();
  v70 = sub_1C145A834(v46, v47, v72);
  sub_1C14657E8();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C144E000, v42, v43, "(%{private}s): Ignoring unchanged alert", v44, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BADCBC](v45, -1, -1);
  MEMORY[0x1C3BADCBC](v44, -1, -1);

  v48 = (uint64_t)v62;
  return sub_1C145BE2C(v48, &qword_1ED798A50);
}

uint64_t AlertCenter.syncEngine(_:didDelete:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_1C14656EC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  sub_1C1465644();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_1C1465638();
  return swift_release();
}

uint64_t sub_1C14553DC(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[5];

  v34 = a1;
  v35 = a2;
  v6 = sub_1C14656EC();
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x1E0C80A78](v6);
  v31 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Alert(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C145C90C(a3 + 96, (uint64_t)v37);
  v15 = v37[4];
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  v30 = a4;
  v16 = sub_1C14656E0();
  (*(void (**)(uint64_t))(v15 + 16))(v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1C145BE2C((uint64_t)v10, &qword_1ED798A50);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    if (qword_1ED798C20 != -1)
      swift_once();
    v17 = sub_1C1465710();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED798C08);
    v18 = v31;
    v19 = v32;
    v20 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v31, v30, v33);
    v21 = sub_1C1465704();
    v22 = sub_1C14657A0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v37[0] = v24;
      *(_DWORD *)v23 = 136446210;
      sub_1C145C950(&qword_1EF6DEB10, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D8D5E8], MEMORY[0x1E0D8D608]);
      v25 = sub_1C14658FC();
      v36 = sub_1C145A834(v25, v26, v37);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v20);
      _os_log_impl(&dword_1C144E000, v21, v22, "Could not find an existing alert for deleted recordID %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v24, -1, -1);
      MEMORY[0x1C3BADCBC](v23, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v20);
    }

    return v34();
  }
  else
  {
    sub_1C145BF3C((uint64_t)v10, (uint64_t)v14, type metadata accessor for Alert);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
    v27 = sub_1C1455758((uint64_t)v14);
    ((void (*)(uint64_t))v34)(v27);
    return sub_1C145BF00((uint64_t)v14, type metadata accessor for Alert);
  }
}

uint64_t sub_1C1455758(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48[3];

  v2 = v1;
  v4 = type metadata accessor for Alert(0);
  v45 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v45 + 64);
  v6 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v41 - v8;
  v10 = sub_1C146574C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (void *)v2[2];
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0DEF740], v10);
  v15 = v14;
  v16 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 & 1) != 0)
  {
    if (qword_1ED798C20 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v17 = sub_1C1465710();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ED798C08);
  v46 = (uint64_t *)a1;
  sub_1C145BEBC(a1, (uint64_t)v9, type metadata accessor for Alert);
  swift_retain_n();
  v18 = sub_1C1465704();
  v19 = sub_1C14657A0();
  v20 = os_log_type_enabled(v18, v19);
  v43 = v15;
  v44 = v5;
  if (v20)
  {
    v21 = swift_slowAlloc();
    v42 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = v21;
    v23 = swift_slowAlloc();
    v48[0] = v23;
    *(_DWORD *)v22 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v24 = sub_1C1465668();
    v47 = sub_1C145A834(v24, v25, v48);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2082;
    v26 = Alert.description.getter();
    v47 = sub_1C145A834(v26, v27, v48);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v9, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v18, v19, "(%{private}s): Dismissing alert: %{public}s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v23, -1, -1);
    v28 = v22;
    v7 = v42;
    MEMORY[0x1C3BADCBC](v28, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v9, type metadata accessor for Alert);
  }

  v29 = (uint64_t)v46;
  v30 = *v46;
  v31 = v46[1];
  swift_beginAccess();
  v32 = v2[15];
  v33 = v2[16];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v2 + 12), v32);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v33 + 32))(v30, v31, v32, v33);
  swift_endAccess();
  v34 = v2[10];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 40))(v29, ObjectType, v34);
  sub_1C1458A68(v30, v31);
  result = MEMORY[0x1C3BADD10](v2 + 18);
  if (result)
  {
    v37 = result;
    v38 = v2[19];
    sub_1C1465644();
    sub_1C145BEBC(v29, (uint64_t)v7, type metadata accessor for Alert);
    v39 = (*(unsigned __int8 *)(v45 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    v40 = (_QWORD *)swift_allocObject();
    v40[2] = v37;
    v40[3] = v38;
    v40[4] = v2;
    sub_1C145BF3C((uint64_t)v7, (uint64_t)v40 + v39, type metadata accessor for Alert);
    swift_retain();
    swift_unknownObjectRetain();
    sub_1C1465638();
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t AlertCenter.recordIDs(for:)()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB18);
  sub_1C14657C4();
  return v1;
}

unint64_t sub_1C1455C24@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t (*v24)(uint64_t);
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t (*v32)(uint64_t);
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  _QWORD v78[3];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB28);
  v5 = MEMORY[0x1E0C80A78](v77);
  v72 = (uint64_t *)((char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x1E0C80A78](v5);
  v76 = (uint64_t *)((char *)&v59 - v8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v71 = (uint64_t *)((char *)&v59 - v10);
  MEMORY[0x1E0C80A78](v9);
  v70 = (char *)&v59 - v11;
  v12 = sub_1C14656EC();
  v68 = *(_QWORD *)(v12 - 8);
  v69 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1C145C90C(a1 + 96, (uint64_t)v78);
  v15 = v79;
  v16 = v80;
  __swift_project_boxed_opaque_existential_1(v78, v79);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v60 = a2;
    v61 = v2;
    v81 = MEMORY[0x1E0DEE9D8];
    sub_1C145B0D0(0, v18, 0);
    result = sub_1C145B2CC(v17);
    v21 = 0;
    v22 = v17 + 64;
    v23 = *(_BYTE *)(v17 + 32);
    v62 = v17 + 80;
    v24 = type metadata accessor for Alert;
    v25 = &qword_1EF6DEB28;
    v66 = v17;
    v67 = v14;
    v63 = v18;
    v64 = v20;
    v65 = v17 + 64;
    while ((result & 0x8000000000000000) == 0 && (uint64_t)result < 1 << v23)
    {
      v27 = result >> 6;
      if ((*(_QWORD *)(v22 + 8 * (result >> 6)) & (1 << result)) == 0)
        goto LABEL_29;
      if (*(_DWORD *)(v17 + 36) != (_DWORD)v20)
        goto LABEL_30;
      v73 = v21;
      v74 = 1 << result;
      v28 = v70;
      v29 = (uint64_t)&v70[*(int *)(v77 + 48)];
      v30 = *(_QWORD *)(v17 + 56);
      v31 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * result);
      v32 = v24;
      v33 = v25;
      v35 = *v31;
      v34 = v31[1];
      v36 = result;
      v37 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 72);
      v75 = v36;
      v38 = v30 + v37 * v36;
      v24 = v32;
      sub_1C145BEBC(v38, v29, v32);
      *v28 = v35;
      v28[1] = v34;
      v39 = (uint64_t)v71;
      *v71 = v35;
      *(_QWORD *)(v39 + 8) = v34;
      v40 = v77;
      sub_1C145BEBC(v29, v39 + *(int *)(v77 + 48), v24);
      sub_1C145BDE4(v39, (uint64_t)v76, v33);
      swift_bridgeObjectRetain_n();
      v41 = (uint64_t)v28;
      v42 = v33;
      sub_1C145BE2C(v41, v33);
      v43 = *(int *)(v40 + 48);
      v44 = v76;
      v45 = v72;
      v46 = (uint64_t)v72 + v43;
      v47 = (uint64_t)v76 + v43;
      v48 = v76[1];
      *v72 = *v76;
      v45[1] = v48;
      sub_1C145BEBC(v47, (uint64_t)v45 + v43, v24);
      v49 = qword_1ED798A00;
      swift_bridgeObjectRetain();
      if (v49 != -1)
        swift_once();
      swift_bridgeObjectRetain();
      v50 = v67;
      sub_1C14656D4();
      sub_1C145BF00(v46, v24);
      sub_1C145BE2C((uint64_t)v44, v42);
      v51 = v81;
      v25 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C145B0D0(0, *(_QWORD *)(v51 + 16) + 1, 1);
        v51 = v81;
      }
      v53 = *(_QWORD *)(v51 + 16);
      v52 = *(_QWORD *)(v51 + 24);
      if (v53 >= v52 >> 1)
      {
        sub_1C145B0D0(v52 > 1, v53 + 1, 1);
        v51 = v81;
      }
      *(_QWORD *)(v51 + 16) = v53 + 1;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v68 + 32))(v51+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(_QWORD *)(v68 + 72) * v53, v50, v69);
      v81 = v51;
      v17 = v66;
      v23 = *(_BYTE *)(v66 + 32);
      v26 = 1 << v23;
      if (v75 >= 1 << v23)
        goto LABEL_31;
      v22 = v65;
      v54 = *(_QWORD *)(v65 + 8 * v27);
      if ((v54 & v74) == 0)
        goto LABEL_32;
      LODWORD(v20) = v64;
      if (*(_DWORD *)(v66 + 36) != (_DWORD)v64)
        goto LABEL_33;
      v55 = v54 & (-2 << (v75 & 0x3F));
      if (v55)
      {
        v26 = __clz(__rbit64(v55)) | v75 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v56 = v27 + 1;
        v57 = (v26 + 63) >> 6;
        if (v27 + 1 < v57)
        {
          v58 = *(_QWORD *)(v65 + 8 * v56);
          if (v58)
          {
LABEL_24:
            v26 = __clz(__rbit64(v58)) + (v56 << 6);
          }
          else
          {
            while (v57 - 2 != v27)
            {
              v58 = *(_QWORD *)(v62 + 8 * v27++);
              if (v58)
              {
                v56 = v27 + 1;
                goto LABEL_24;
              }
            }
          }
        }
      }
      v21 = v73 + 1;
      result = v26;
      if (v73 + 1 == v63)
      {
        swift_bridgeObjectRelease();
        a2 = v60;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v51 = MEMORY[0x1E0DEE9D8];
LABEL_27:
    result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v78);
    *a2 = v51;
  }
  return result;
}

uint64_t sub_1C145614C(uint64_t (*a1)(uint64_t a1), uint64_t a2, int64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  uint8_t *v50;
  int64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55[3];
  uint64_t v56;
  uint64_t v57;

  v6 = type metadata accessor for Alert(0);
  v52 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB20);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v46 - v13;
  if (qword_1ED798C20 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v15 = sub_1C1465710();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED798C08);
    swift_retain_n();
    v16 = sub_1C1465704();
    v17 = sub_1C14657A0();
    v18 = os_log_type_enabled(v16, v17);
    v48 = a2;
    v49 = a1;
    if (v18)
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v51 = v20;
      v50 = v19;
      *(_DWORD *)v19 = 136380675;
      v55[0] = v20;
      v47 = v19 + 4;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 56));
      v21 = sub_1C1465668();
      v54 = sub_1C145A834(v21, v22, v55);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      v23 = v50;
      _os_log_impl(&dword_1C144E000, v16, v17, "(%{private}s): Purging records", v50, 0xCu);
      v24 = v51;
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v24, -1, -1);
      MEMORY[0x1C3BADCBC](v23, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v53 = a3;
    swift_beginAccess();
    sub_1C145C90C(a3 + 96, (uint64_t)v55);
    v25 = v56;
    v26 = v57;
    __swift_project_boxed_opaque_existential_1(v55, v56);
    a2 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v25, v26);
    result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
    a3 = 0;
    v28 = *(_QWORD *)(a2 + 64);
    v50 = (uint8_t *)(a2 + 64);
    v29 = 1 << *(_BYTE *)(a2 + 32);
    v30 = -1;
    if (v29 < 64)
      v30 = ~(-1 << v29);
    v31 = v30 & v28;
    v51 = (unint64_t)(v29 + 63) >> 6;
    v47 = (uint8_t *)(v51 - 1);
    a1 = type metadata accessor for Alert;
    if ((v30 & v28) != 0)
    {
      while (1)
      {
        v32 = __clz(__rbit64(v31));
        v31 &= v31 - 1;
        v33 = v32 | (a3 << 6);
LABEL_11:
        v34 = *(_QWORD *)(a2 + 56);
        v35 = (_QWORD *)(*(_QWORD *)(a2 + 48) + 16 * v33);
        v36 = v35[1];
        *v12 = *v35;
        v12[1] = v36;
        v37 = v34 + *(_QWORD *)(v52 + 72) * v33;
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB28);
        v39 = v37;
        a1 = type metadata accessor for Alert;
        sub_1C145BEBC(v39, (uint64_t)v12 + *(int *)(v38 + 48), type metadata accessor for Alert);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v12, 0, 1, v38);
        swift_bridgeObjectRetain();
LABEL_30:
        sub_1C145BDE4((uint64_t)v12, (uint64_t)v14, &qword_1EF6DEB20);
        v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB28);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 48))(v14, 1, v44) == 1)
          break;
        swift_bridgeObjectRelease();
        sub_1C145BF3C((uint64_t)&v14[*(int *)(v44 + 48)], (uint64_t)v8, type metadata accessor for Alert);
        sub_1C1455758((uint64_t)v8);
        result = sub_1C145BF00((uint64_t)v8, type metadata accessor for Alert);
        if (!v31)
          goto LABEL_12;
      }
      v45 = swift_release();
      return v49(v45);
    }
LABEL_12:
    v40 = a3 + 1;
    if (!__OFADD__(a3, 1))
      break;
    __break(1u);
  }
  if (v40 >= v51)
    goto LABEL_29;
  v41 = *(_QWORD *)&v50[8 * v40];
  if (v41)
  {
LABEL_15:
    v31 = (v41 - 1) & v41;
    v33 = __clz(__rbit64(v41)) + (v40 << 6);
    a3 = v40;
    goto LABEL_11;
  }
  v42 = a3 + 2;
  ++a3;
  if (v40 + 1 >= v51)
    goto LABEL_29;
  v41 = *(_QWORD *)&v50[8 * v42];
  if (v41)
  {
LABEL_18:
    v40 = v42;
    goto LABEL_15;
  }
  a3 = v40 + 1;
  if (v40 + 2 >= v51)
    goto LABEL_29;
  v41 = *(_QWORD *)&v50[8 * v40 + 16];
  if (v41)
  {
    v40 += 2;
    goto LABEL_15;
  }
  v42 = v40 + 3;
  a3 = v40 + 2;
  if (v40 + 3 >= v51)
  {
LABEL_29:
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB28);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v12, 1, 1, v43);
    v31 = 0;
    goto LABEL_30;
  }
  v41 = *(_QWORD *)&v50[8 * v42];
  if (v41)
    goto LABEL_18;
  while (1)
  {
    v40 = v42 + 1;
    if (__OFADD__(v42, 1))
      break;
    if (v40 >= v51)
    {
      a3 = (int64_t)v47;
      goto LABEL_29;
    }
    v41 = *(_QWORD *)&v50[8 * v40];
    ++v42;
    if (v41)
      goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1456688()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB00);
  sub_1C14657C4();
  return v1;
}

uint64_t sub_1C14566F0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB18);
  sub_1C14657C4();
  return v1;
}

uint64_t sub_1C1456754()
{
  uint64_t v1;

  sub_1C14657C4();
  return v1;
}

uint64_t sub_1C14567AC(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  _QWORD *v4;
  _QWORD *v5;
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
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  int *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  _BYTE *v50;
  _QWORD *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _BYTE v77[12];
  int v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  _QWORD *v83;
  _BYTE *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;

  v5 = v4;
  v87 = a3;
  v88 = a2;
  v8 = type metadata accessor for Alert(0);
  v79 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v82 = &v77[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = MEMORY[0x1E0C80A78](v9);
  v80 = &v77[-v12];
  v13 = MEMORY[0x1E0C80A78](v11);
  v84 = &v77[-v14];
  v81 = v15;
  MEMORY[0x1E0C80A78](v13);
  v89 = &v77[-v16];
  v17 = type metadata accessor for Alert.HistoryItem(0);
  v85 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v19 = &v77[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = sub_1C146574C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = &v77[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = *a4;
  v25 = (void *)v5[2];
  *v23 = v25;
  (*(void (**)(_QWORD *, _QWORD, unint64_t))(v21 + 104))(v23, *MEMORY[0x1E0DEF740], v20);
  v26 = v25;
  LOBYTE(v25) = sub_1C1465758();
  (*(void (**)(_QWORD *, unint64_t))(v21 + 8))(v23, v20);
  if ((v25 & 1) != 0)
  {
    v27 = *(int *)(v8 + 32);
    v86 = a1;
    v20 = *(_QWORD *)&a1[v27];
    v28 = v5[7];
    v90 = v5;
    v83 = v5 + 4;
    __swift_project_boxed_opaque_existential_1(v5 + 4, v28);
    swift_bridgeObjectRetain();
    v29 = sub_1C1465668();
    v31 = v30;
    v32 = v87;
    swift_bridgeObjectRetain();
    sub_1C14655A8();
    *v19 = v24;
    *((_QWORD *)v19 + 1) = v29;
    *((_QWORD *)v19 + 2) = v31;
    *((_QWORD *)v19 + 3) = v88;
    *((_QWORD *)v19 + 4) = v32;
    v19[40] = 0;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  v20 = sub_1C145A62C(0, *(_QWORD *)(v20 + 16) + 1, 1, v20);
LABEL_3:
  v33 = v89;
  v35 = *(_QWORD *)(v20 + 16);
  v34 = *(_QWORD *)(v20 + 24);
  v78 = v24;
  if (v35 >= v34 >> 1)
    v20 = sub_1C145A62C(v34 > 1, v35 + 1, 1, v20);
  *(_QWORD *)(v20 + 16) = v35 + 1;
  sub_1C145BF3C((uint64_t)v19, v20+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(_QWORD *)(v85 + 72) * v35, type metadata accessor for Alert.HistoryItem);
  v36 = v86;
  v38 = *(_QWORD *)v86;
  v37 = *((_QWORD *)v86 + 1);
  v39 = *(int *)(v8 + 20);
  v40 = &v86[v39];
  v41 = &v33[v39];
  v42 = sub_1C14655C0();
  v43 = (int *)v8;
  v44 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 16);
  v44(v41, v40, v42);
  v44(&v33[v43[6]], &v36[v43[6]], v42);
  if (*(_QWORD *)(v20 + 16))
  {
    v45 = v43[7];
    v47 = *(_QWORD *)&v36[v45];
    v46 = *(_QWORD *)&v36[v45 + 8];
    *(_QWORD *)v33 = v38;
    *((_QWORD *)v33 + 1) = v37;
    v48 = (uint64_t *)&v33[v45];
    *v48 = v47;
    v48[1] = v46;
    *(_QWORD *)&v33[v43[8]] = v20;
    swift_bridgeObjectRetain();
    sub_1C145B86C(v47, v46);
    if (qword_1ED798C20 == -1)
      goto LABEL_7;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_7:
  v49 = sub_1C1465710();
  __swift_project_value_buffer(v49, (uint64_t)qword_1ED798C08);
  v50 = v84;
  sub_1C145BEBC((uint64_t)v33, (uint64_t)v84, type metadata accessor for Alert);
  v51 = v90;
  swift_retain_n();
  v52 = sub_1C1465704();
  v53 = sub_1C14657A0();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = swift_slowAlloc();
    v55 = swift_slowAlloc();
    v92 = v55;
    *(_DWORD *)v54 = 136380931;
    v56 = v83;
    __swift_project_boxed_opaque_existential_1(v83, v51[7]);
    v57 = sub_1C1465668();
    v91 = sub_1C145A834(v57, v58, &v92);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v54 + 12) = 2082;
    v59 = Alert.description.getter();
    v91 = sub_1C145A834(v59, v60, &v92);
    v51 = v90;
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v50, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v52, v53, "(%{private}s): Attempting to present alert on a specific device: %{public}s ", (uint8_t *)v54, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v55, -1, -1);
    MEMORY[0x1C3BADCBC](v54, -1, -1);

    v61 = v87;
    v62 = v88;
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v50, type metadata accessor for Alert);

    v61 = v87;
    v62 = v88;
    v56 = v83;
  }
  __swift_project_boxed_opaque_existential_1(v56, v51[7]);
  if (sub_1C1465668() == v62 && v63 == v61)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v64 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v64 & 1) == 0)
    {
      v66 = v80;
      sub_1C145BEBC((uint64_t)v89, (uint64_t)v80, type metadata accessor for Alert);
      sub_1C145BEBC((uint64_t)v86, (uint64_t)v82, type metadata accessor for Alert);
      v67 = *(unsigned __int8 *)(v79 + 80);
      v68 = (v67 + 16) & ~v67;
      v69 = v68 + v81;
      v70 = (v68 + v81) & 0xFFFFFFFFFFFFFFF8;
      v71 = (v70 + 23) & 0xFFFFFFFFFFFFFFF8;
      v72 = v51;
      v73 = (v67 + 16 + v71) & ~v67;
      v74 = swift_allocObject();
      sub_1C145BF3C((uint64_t)v66, v74 + v68, type metadata accessor for Alert);
      *(_BYTE *)(v74 + v69) = v78;
      *(_QWORD *)(v70 + v74 + 8) = v72;
      v75 = (_QWORD *)(v74 + v71);
      *v75 = v62;
      v75[1] = v61;
      v65 = (uint64_t *)v89;
      sub_1C145BF3C((uint64_t)v82, v74 + v73, type metadata accessor for Alert);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1C14578D4(v65, (uint64_t (*)(uint64_t))sub_1C145C514, v74);
      swift_release();
      sub_1C1457D0C(v65);
      return sub_1C145BF00((uint64_t)v65, type metadata accessor for Alert);
    }
  }
  v65 = (uint64_t *)v89;
  sub_1C1456E80((uint64_t)v89);
  return sub_1C145BF00((uint64_t)v65, type metadata accessor for Alert);
}

void sub_1C1456E80(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  char v46;
  char v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;

  v66 = type metadata accessor for Alert.HistoryItem(0);
  v3 = *(_QWORD *)(v66 - 8);
  v4 = MEMORY[0x1E0C80A78](v66);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v57 - v8;
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v57 - v10;
  v68 = (uint64_t *)type metadata accessor for Alert(0);
  v62 = *(v68 - 1);
  v12 = MEMORY[0x1E0C80A78](v68);
  v64 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v65 = (char *)&v57 - v15;
  v63 = v16;
  MEMORY[0x1E0C80A78](v14);
  v67 = (uint64_t *)((char *)&v57 - v17);
  v18 = sub_1C146574C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (uint64_t *)((char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (void *)v1[2];
  *v21 = v22;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0DEF740], v18);
  v61 = v22;
  v23 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v19 + 8))(v21, v18);
  if ((v23 & 1) != 0)
  {
    v24 = *(_QWORD *)(a1 + *((int *)v68 + 8));
    v25 = *(_QWORD *)(v24 + 16);
    if (v25)
    {
      v59 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v60 = v1;
      v58 = *(_QWORD *)(v3 + 72);
      sub_1C145BEBC(v24 + v59 + v58 * (v25 - 1), (uint64_t)v9, type metadata accessor for Alert.HistoryItem);
      v26 = *v9;
      v27 = *((_QWORD *)v9 + 1);
      v28 = *((_QWORD *)v9 + 2);
      v29 = *((_QWORD *)v9 + 3);
      v30 = *((_QWORD *)v9 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C14655A8();
      *v11 = v26;
      *((_QWORD *)v11 + 1) = v27;
      *((_QWORD *)v11 + 2) = v28;
      *((_QWORD *)v11 + 3) = v29;
      *((_QWORD *)v11 + 4) = v30;
      v23 = a1;
      v11[40] = 1;
      sub_1C145BF00((uint64_t)v9, type metadata accessor for Alert.HistoryItem);
      v1 = v67;
      sub_1C145BEBC(a1, (uint64_t)v67, type metadata accessor for Alert);
      sub_1C145BEBC((uint64_t)v11, (uint64_t)v6, type metadata accessor for Alert.HistoryItem);
      v21 = (_QWORD *)*((int *)v68 + 8);
      a1 = *(_QWORD *)((char *)v21 + (_QWORD)v1);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_20:
  a1 = sub_1C145A62C(0, *(_QWORD *)(a1 + 16) + 1, 1, a1);
LABEL_4:
  v31 = (uint64_t)v65;
  v33 = *(_QWORD *)(a1 + 16);
  v32 = *(_QWORD *)(a1 + 24);
  v34 = v60;
  if (v33 >= v32 >> 1)
    a1 = sub_1C145A62C(v32 > 1, v33 + 1, 1, a1);
  *(_QWORD *)(a1 + 16) = v33 + 1;
  sub_1C145BF3C((uint64_t)v6, a1 + v59 + v33 * v58, type metadata accessor for Alert.HistoryItem);
  *(_QWORD *)((char *)v21 + (_QWORD)v1) = a1;
  sub_1C145BF00((uint64_t)v11, type metadata accessor for Alert.HistoryItem);
  sub_1C1457D0C(v1);
  if (qword_1ED798C20 != -1)
    swift_once();
  v35 = sub_1C1465710();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED798C08);
  sub_1C145BEBC(v23, v31, type metadata accessor for Alert);
  swift_retain_n();
  v36 = sub_1C1465704();
  v37 = sub_1C14657A0();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v70 = v39;
    *(_DWORD *)v38 = 136380931;
    __swift_project_boxed_opaque_existential_1(v34 + 4, v34[7]);
    v40 = sub_1C1465668();
    v69 = sub_1C145A834(v40, v41, &v70);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    v42 = Alert.description.getter();
    v69 = sub_1C145A834(v42, v43, &v70);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00(v31, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v36, v37, "(%{private}s): Attempting to present alert on local device: %{public}s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v39, -1, -1);
    MEMORY[0x1C3BADCBC](v38, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00(v31, type metadata accessor for Alert);
  }

  v44 = (_QWORD *)v34[11];
  if (v44[2])
  {
    v45 = sub_1C145AE74(1u);
    if ((v46 & 1) != 0)
      goto LABEL_17;
  }
  if (qword_1ED798AC0 != -1)
    swift_once();
  v44 = off_1ED798AB0;
  if (*((_QWORD *)off_1ED798AB0 + 2))
  {
    v45 = sub_1C145AE74(1u);
    if ((v47 & 1) != 0)
    {
LABEL_17:
      v48 = *(double *)(v44[7] + 8 * v45);
      sub_1C1465644();
      swift_allocObject();
      v49 = sub_1C146562C();
      v50 = sub_1C1465614();
      v68 = &v57;
      MEMORY[0x1E0C80A78](v50);
      v51 = (uint64_t)v67;
      *(&v57 - 4) = (uint64_t)v34;
      *(&v57 - 3) = v51;
      *(&v57 - 2) = v49;
      v52 = v64;
      sub_1C145BEBC(v51, v64, type metadata accessor for Alert);
      v53 = v34;
      v54 = (*(unsigned __int8 *)(v62 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
      v55 = (v63 + v54 + 7) & 0xFFFFFFFFFFFFFFF8;
      v56 = swift_allocObject();
      *(_QWORD *)(v56 + 16) = v53;
      sub_1C145BF3C(v52, v56 + v54, type metadata accessor for Alert);
      *(_QWORD *)(v56 + v55) = v49;
      swift_retain();
      swift_retain();
      MEMORY[0x1C3BAD62C](v61, sub_1C145BF80, &v57 - 6, sub_1C145C074, v56, v48);
      swift_release();
      swift_release();
      sub_1C145BF00(v51, type metadata accessor for Alert);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C1457560(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;

  v56 = a6;
  v51 = a4;
  v50 = a2 & 1;
  v9 = type metadata accessor for Alert(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for Alert.HistoryItem(0);
  v52 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v49 - v16;
  v55 = v9;
  v18 = *(_QWORD *)(a1 + *(int *)(v9 + 32));
  v19 = *(_QWORD *)(a3 + 56);
  v53 = (_QWORD *)(a3 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a3 + 32), v19);
  swift_bridgeObjectRetain();
  v20 = sub_1C1465668();
  v22 = v21;
  v54 = v12;
  swift_bridgeObjectRetain();
  sub_1C14655A8();
  *v17 = v50;
  *((_QWORD *)v17 + 1) = v20;
  *((_QWORD *)v17 + 2) = v22;
  *((_QWORD *)v17 + 3) = v51;
  *((_QWORD *)v17 + 4) = a5;
  v17[40] = 64;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v18 = sub_1C145A62C(0, *(_QWORD *)(v18 + 16) + 1, 1, v18);
  v24 = *(_QWORD *)(v18 + 16);
  v23 = *(_QWORD *)(v18 + 24);
  if (v24 >= v23 >> 1)
    v18 = sub_1C145A62C(v23 > 1, v24 + 1, 1, v18);
  *(_QWORD *)(v18 + 16) = v24 + 1;
  v51 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  v52 = *(_QWORD *)(v52 + 72);
  sub_1C145BF3C((uint64_t)v17, v18 + v51 + v52 * v24, type metadata accessor for Alert.HistoryItem);
  v25 = v53;
  __swift_project_boxed_opaque_existential_1(v53, *(_QWORD *)(a3 + 56));
  v26 = sub_1C1465668();
  v28 = v27;
  __swift_project_boxed_opaque_existential_1(v25, *(_QWORD *)(a3 + 56));
  v29 = sub_1C1465668();
  v31 = v30;
  sub_1C14655A8();
  *v15 = 1;
  *((_QWORD *)v15 + 1) = v26;
  *((_QWORD *)v15 + 2) = v28;
  *((_QWORD *)v15 + 3) = v29;
  *((_QWORD *)v15 + 4) = v31;
  v15[40] = 0;
  v33 = *(_QWORD *)(v18 + 16);
  v32 = *(_QWORD *)(v18 + 24);
  v49 = a3;
  if (v33 >= v32 >> 1)
    v18 = sub_1C145A62C(v32 > 1, v33 + 1, 1, v18);
  v34 = v56;
  *(_QWORD *)(v18 + 16) = v33 + 1;
  sub_1C145BF3C((uint64_t)v15, v18 + v51 + v33 * v52, type metadata accessor for Alert.HistoryItem);
  v36 = *v34;
  v35 = v34[1];
  v37 = v55;
  v38 = *(int *)(v55 + 20);
  v39 = (char *)v34 + v38;
  v40 = (char *)v11 + v38;
  v41 = sub_1C14655C0();
  v42 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
  v42(v40, v39, v41);
  result = ((uint64_t (*)(char *, char *, uint64_t))v42)((char *)v11 + *(int *)(v37 + 24), (char *)v34 + *(int *)(v37 + 24), v41);
  if (*(_QWORD *)(v18 + 16))
  {
    v44 = *(int *)(v37 + 28);
    v45 = v37;
    v47 = *(uint64_t *)((char *)v34 + v44);
    v46 = *(uint64_t *)((char *)v34 + v44 + 8);
    *v11 = v36;
    v11[1] = v35;
    v48 = (_QWORD *)((char *)v11 + v44);
    *v48 = v47;
    v48[1] = v46;
    *(_QWORD *)((char *)v11 + *(int *)(v45 + 32)) = v18;
    swift_bridgeObjectRetain();
    sub_1C145B86C(v47, v46);
    sub_1C1450F84(v11);
    return sub_1C145BF00((uint64_t)v11, type metadata accessor for Alert);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C14578D4(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v4 = v3;
  v47 = a2;
  v48 = a3;
  v6 = type metadata accessor for Alert(0);
  MEMORY[0x1E0C80A78](v6);
  v49 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C14655C0();
  v46 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v45 - v12;
  v14 = sub_1C146574C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (uint64_t *)((char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (void *)v4[2];
  *v17 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E0DEF740], v14);
  v19 = v18;
  LOBYTE(v18) = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v20 = *(uint64_t *)((char *)a1 + *(int *)(v6 + 32));
  v21 = *(_QWORD *)(v20 + 16);
  if (!v21)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
    goto LABEL_8;
  }
  v50 = a1;
  v22 = v4[11];
  v23 = type metadata accessor for Alert.HistoryItem(0);
  if (*(_QWORD *)(v22 + 16))
  {
    v24 = v23;
    v25 = *(_QWORD *)(v23 - 8);
    v26 = *(_QWORD *)(v25 + 72);
    v27 = v21 - 1;
    v28 = v20 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
    sub_1C145AE74(*(_BYTE *)(v28 + v26 * v27 + 40));
    if ((v29 & 1) != 0)
    {
      v30 = *(_QWORD *)(v20 + 16);
      if (v30)
      {
        v31 = v46;
        (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v11, v28 + (v30 - 1) * v26 + *(int *)(v24 + 32), v8);
        sub_1C1465584();
        v32 = *(void (**)(char *, uint64_t))(v31 + 8);
        v32(v11, v8);
        sub_1C1465590();
        v34 = v33;
        v32(v13, v8);
        sub_1C14591D0(*v50, v50[1], v47, v48, v34);
      }
      else
      {
        __break(1u);
      }
      return;
    }
  }
  if (qword_1ED798C20 != -1)
    goto LABEL_14;
LABEL_8:
  v35 = sub_1C1465710();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED798C08);
  v36 = v49;
  sub_1C145BEBC((uint64_t)v50, v49, type metadata accessor for Alert);
  swift_retain_n();
  v37 = sub_1C1465704();
  v38 = sub_1C14657A0();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v52 = v40;
    *(_DWORD *)v39 = 136380931;
    __swift_project_boxed_opaque_existential_1(v4 + 4, v4[7]);
    v41 = sub_1C1465668();
    v51 = sub_1C145A834(v41, v42, &v52);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2082;
    v43 = Alert.description.getter();
    v51 = sub_1C145A834(v43, v44, &v52);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00(v36, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v37, v38, "(%{private}s): Alert does not require a watchdog: %{public}s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v40, -1, -1);
    MEMORY[0x1C3BADCBC](v39, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00(v36, type metadata accessor for Alert);
  }

}

uint64_t sub_1C1457D0C(_QWORD *a1)
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *, uint64_t, uint64_t);
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD *v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[3];
  uint64_t v79;
  uint64_t v80;

  v2 = v1;
  v4 = type metadata accessor for Alert(0);
  v75 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v70 = (uint64_t)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v76 = (uint64_t)&v68 - v8;
  MEMORY[0x1E0C80A78](v7);
  v69 = (uint64_t *)((char *)&v68 - v9);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB38);
  MEMORY[0x1E0C80A78](v74);
  v11 = (uint64_t *)((char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  v13 = MEMORY[0x1E0C80A78](v12);
  v71 = (uint64_t *)((char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v68 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v68 - v18;
  v20 = sub_1C146574C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (uint64_t *)((char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = *(void **)(v2 + 16);
  *v23 = v24;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v21 + 104))(v23, *MEMORY[0x1E0DEF740], v20);
  v25 = v24;
  LOBYTE(v24) = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v21 + 8))(v23, v20);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  v26 = (_QWORD *)v2;
  swift_beginAccess();
  v72 = v2 + 96;
  sub_1C145C90C(v2 + 96, (uint64_t)v78);
  v27 = v79;
  v28 = v80;
  __swift_project_boxed_opaque_existential_1(v78, v79);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v28 + 16))(*a1, a1[1], v27, v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v78);
  sub_1C145BEBC((uint64_t)a1, (uint64_t)v17, type metadata accessor for Alert);
  v29 = v75;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v17, 0, 1, v4);
  v30 = (uint64_t)v11 + *(int *)(v74 + 48);
  sub_1C145B98C((uint64_t)v19, (uint64_t)v11);
  sub_1C145B98C((uint64_t)v17, v30);
  v31 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v29 + 48);
  v32 = v31(v11, 1, v4);
  v2 = (uint64_t)a1;
  v33 = (uint64_t)v11;
  v73 = v19;
  if (v32 == 1)
  {
    sub_1C145BE2C((uint64_t)v17, &qword_1ED798A50);
    if (v31((_QWORD *)v30, 1, v4) == 1)
    {
      sub_1C145BE2C((uint64_t)v11, &qword_1ED798A50);
      v11 = v26;
LABEL_5:
      if (qword_1ED798C20 != -1)
        swift_once();
      v34 = sub_1C1465710();
      __swift_project_value_buffer(v34, (uint64_t)qword_1ED798C08);
      v35 = v70;
      sub_1C145BEBC(v2, v70, type metadata accessor for Alert);
      swift_retain_n();
      v36 = sub_1C1465704();
      v37 = sub_1C14657A0();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        v78[0] = v39;
        *(_DWORD *)v38 = 136380931;
        __swift_project_boxed_opaque_existential_1(v11 + 4, v11[7]);
        v40 = sub_1C1465668();
        v77 = sub_1C145A834(v40, v41, v78);
        sub_1C14657E8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2082;
        v42 = v70;
        v43 = Alert.description.getter();
        v77 = sub_1C145A834(v43, v44, v78);
        sub_1C14657E8();
        swift_bridgeObjectRelease();
        sub_1C145BF00(v42, type metadata accessor for Alert);
        _os_log_impl(&dword_1C144E000, v36, v37, "(%{private}s): Not syncing unchanged alert: %{public}s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C3BADCBC](v39, -1, -1);
        MEMORY[0x1C3BADCBC](v38, -1, -1);

      }
      else
      {

        sub_1C145BF00(v35, type metadata accessor for Alert);
        swift_release_n();
      }
      v66 = (uint64_t)v19;
      return sub_1C145BE2C(v66, &qword_1ED798A50);
    }
    v46 = &qword_1EF6DEB38;
    v11 = v26;
    goto LABEL_22;
  }
  v45 = v71;
  sub_1C145B98C((uint64_t)v11, (uint64_t)v71);
  if (v31((_QWORD *)v30, 1, v4) == 1)
  {
    v46 = &qword_1EF6DEB38;
    v11 = v26;
    v47 = (uint64_t)v45;
LABEL_21:
    sub_1C145BE2C((uint64_t)v17, &qword_1ED798A50);
    sub_1C145BF00(v47, type metadata accessor for Alert);
LABEL_22:
    sub_1C145BE2C(v33, v46);
    goto LABEL_23;
  }
  v48 = v69;
  sub_1C145BF3C(v30, (uint64_t)v69, type metadata accessor for Alert);
  v11 = v26;
  v47 = (uint64_t)v45;
  if ((*v45 != *v48 || v45[1] != v48[1]) && (sub_1C1465908() & 1) == 0
    || (sub_1C146559C() & 1) == 0
    || (sub_1C146559C() & 1) == 0
    || (sub_1C1460B88(*(_QWORD *)((char *)v45 + *(int *)(v4 + 28)), *(_QWORD *)((char *)v45 + *(int *)(v4 + 28) + 8)),
        (v49 & 1) == 0))
  {
    sub_1C145BF00((uint64_t)v48, type metadata accessor for Alert);
    v46 = &qword_1ED798A50;
    goto LABEL_21;
  }
  v50 = sub_1C145FCC4(*(_QWORD *)((char *)v45 + *(int *)(v4 + 32)), *(_QWORD *)((char *)v48 + *(int *)(v4 + 32)));
  sub_1C145BF00((uint64_t)v48, type metadata accessor for Alert);
  sub_1C145BE2C((uint64_t)v17, &qword_1ED798A50);
  sub_1C145BF00((uint64_t)v45, type metadata accessor for Alert);
  sub_1C145BE2C(v33, &qword_1ED798A50);
  v19 = v73;
  if ((v50 & 1) != 0)
    goto LABEL_5;
LABEL_23:
  if (qword_1ED798C20 != -1)
LABEL_34:
    swift_once();
  v51 = sub_1C1465710();
  __swift_project_value_buffer(v51, (uint64_t)qword_1ED798C08);
  v52 = v76;
  sub_1C145BEBC(v2, v76, type metadata accessor for Alert);
  swift_retain_n();
  v53 = sub_1C1465704();
  v54 = sub_1C14657A0();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = swift_slowAlloc();
    v56 = swift_slowAlloc();
    v78[0] = v56;
    *(_DWORD *)v55 = 136380931;
    __swift_project_boxed_opaque_existential_1(v11 + 4, v11[7]);
    v57 = sub_1C1465668();
    v77 = sub_1C145A834(v57, v58, v78);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v55 + 12) = 2082;
    v59 = v76;
    v60 = Alert.description.getter();
    v77 = sub_1C145A834(v60, v61, v78);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00(v59, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v53, v54, "(%{private}s): Syncing alert: %{public}s", (uint8_t *)v55, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v56, -1, -1);
    MEMORY[0x1C3BADCBC](v55, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00(v52, type metadata accessor for Alert);
  }

  v62 = v72;
  swift_beginAccess();
  v63 = v11[15];
  v64 = v11[16];
  __swift_mutable_project_boxed_opaque_existential_1(v62, v63);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 24))(v2, v63, v64);
  swift_endAccess();
  __swift_project_boxed_opaque_existential_1(v11 + 4, v11[7]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB30);
  sub_1C14656EC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C1465E10;
  v65 = qword_1ED798A00;
  swift_bridgeObjectRetain();
  if (v65 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C14656D4();
  sub_1C1465650();
  swift_bridgeObjectRelease();
  v66 = (uint64_t)v73;
  return sub_1C145BE2C(v66, &qword_1ED798A50);
}

uint64_t sub_1C14586C8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
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
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v2 = v1;
  v4 = sub_1C14655C0();
  v50 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v51 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v47 - v7;
  v9 = type metadata accessor for Alert(0);
  result = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(int *)(result + 32);
  v54 = a1;
  v14 = *(_QWORD *)(a1 + v13);
  v15 = *(_QWORD *)(v14 + 16);
  if (!v15)
  {
    __break(1u);
    goto LABEL_26;
  }
  v52 = v13;
  v48 = v8;
  v49 = v4;
  v16 = v15 - 1;
  v47 = type metadata accessor for Alert.HistoryItem(0);
  v17 = *(_QWORD *)(v47 - 8);
  v53 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v18 = *(_QWORD *)(v17 + 72);
  v19 = v14 + v53 + v18 * v16;
  v21 = *(_QWORD *)(v19 + 8);
  v20 = *(_QWORD *)(v19 + 16);
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v21 == sub_1C1465668() && v20 == v22)
  {
    swift_bridgeObjectRelease_n();
    sub_1C145BEBC(v54, (uint64_t)v12, type metadata accessor for Alert);
    goto LABEL_15;
  }
  v24 = sub_1C1465908();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = sub_1C145BEBC(v54, (uint64_t)v12, type metadata accessor for Alert);
  if ((v24 & 1) != 0)
  {
LABEL_15:
    sub_1C145BF00((uint64_t)v12, type metadata accessor for Alert);
LABEL_16:
    v34 = 0;
    return v34 & 1;
  }
  v25 = *(_QWORD *)&v12[*(int *)(v9 + 32)];
  v26 = *(_QWORD *)(v25 + 16);
  if (!v26)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v27 = v53;
  v28 = v25 + v53 + (v26 - 1) * v18;
  v30 = *(_QWORD *)(v28 + 24);
  v29 = *(_QWORD *)(v28 + 32);
  __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
  swift_bridgeObjectRetain();
  if (v30 == sub_1C1465668() && v29 == v31)
  {
    swift_bridgeObjectRelease_n();
    result = sub_1C145BF00((uint64_t)v12, type metadata accessor for Alert);
  }
  else
  {
    v33 = sub_1C1465908();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = sub_1C145BF00((uint64_t)v12, type metadata accessor for Alert);
    v34 = 0;
    if ((v33 & 1) == 0)
      return v34 & 1;
  }
  v35 = v52;
  v36 = *(_QWORD *)(v54 + v52);
  v37 = *(_QWORD *)(v36 + 16);
  if (!v37)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v38 = *(unsigned __int8 *)(v36 + v27 + (v37 - 1) * v18 + 40);
  if (v38 > 0x3F)
    goto LABEL_16;
  if (!*(_QWORD *)(v2[11] + 16))
    goto LABEL_16;
  result = sub_1C145AE74(v38);
  if ((v39 & 1) == 0)
    goto LABEL_16;
  v40 = *(_QWORD *)(v54 + v35);
  v41 = *(_QWORD *)(v40 + 16);
  if (v41)
  {
    v42 = v50;
    v43 = v51;
    v44 = v49;
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v51, v40 + v27 + (v41 - 1) * v18 + *(int *)(v47 + 32), v49);
    v45 = v48;
    sub_1C146556C();
    v46 = *(void (**)(char *, uint64_t))(v42 + 8);
    v46(v43, v44);
    sub_1C14655A8();
    v34 = sub_1C1465578();
    v46(v43, v44);
    v46(v45, v44);
    return v34 & 1;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1C1458A68(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[3];

  v3 = v2;
  v6 = sub_1C146574C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (void *)v3[2];
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
  v11 = v10;
  v12 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v12 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once();
    goto LABEL_5;
  }
  result = swift_beginAccess();
  v14 = v3[17];
  if (!*(_QWORD *)(v14 + 16))
    return result;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = sub_1C145AEE8(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1ED798C20 != -1)
    goto LABEL_12;
LABEL_5:
  v17 = sub_1C1465710();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ED798C08);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v18 = sub_1C1465704();
  v19 = sub_1C14657A0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v28[0] = v25;
    *(_DWORD *)v20 = 136380931;
    v24 = v20 + 4;
    v26 = v12;
    __swift_project_boxed_opaque_existential_1(v3 + 4, v3[7]);
    v21 = sub_1C1465668();
    v27 = sub_1C145A834(v21, v22, v28);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    swift_bridgeObjectRetain();
    v27 = sub_1C145A834(a1, a2, v28);
    sub_1C14657E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C144E000, v18, v19, "(%{private}s): Watchdog cancelled for: %{public}s", (uint8_t *)v20, 0x16u);
    v23 = v25;
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v23, -1, -1);
    MEMORY[0x1C3BADCBC](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  sub_1C14655D8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C1464114(a1, a2);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1C1458DEC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t ObjectType;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, _QWORD, void (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for Alert(0);
  v38 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v38 + 64);
  v6 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v35 - v8;
  v10 = sub_1C146574C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (uint64_t *)((char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (void *)v2[2];
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0DEF740], v10);
  v15 = v14;
  v16 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 & 1) != 0)
  {
    v37 = v5;
    if (qword_1ED798C20 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v17 = sub_1C1465710();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ED798C08);
  sub_1C145BEBC(a1, (uint64_t)v9, type metadata accessor for Alert);
  swift_retain_n();
  v18 = sub_1C1465704();
  v19 = sub_1C14657A0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v36 = a1;
    v40 = v35;
    *(_DWORD *)v20 = 136380931;
    __swift_project_boxed_opaque_existential_1(v2 + 4, v2[7]);
    v21 = sub_1C1465668();
    v39 = sub_1C145A834(v21, v22, &v40);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    v23 = Alert.description.getter();
    v39 = sub_1C145A834(v23, v24, &v40);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00((uint64_t)v9, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v18, v19, "(%{private}s): Attempting to present non-interrupting alert on local device: %{public}s", (uint8_t *)v20, 0x16u);
    v25 = v35;
    swift_arrayDestroy();
    a1 = v36;
    MEMORY[0x1C3BADCBC](v25, -1, -1);
    MEMORY[0x1C3BADCBC](v20, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00((uint64_t)v9, type metadata accessor for Alert);
  }

  v26 = v2[10];
  ObjectType = swift_getObjectType();
  v28 = swift_allocObject();
  swift_weakInit();
  sub_1C145BEBC(a1, (uint64_t)v7, type metadata accessor for Alert);
  v29 = (*(unsigned __int8 *)(v38 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v30 = swift_allocObject();
  v31 = (uint64_t)v7;
  v32 = v30;
  *(_QWORD *)(v30 + 16) = v28;
  sub_1C145BF3C(v31, v30 + v29, type metadata accessor for Alert);
  v33 = *(void (**)(uint64_t, _QWORD, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v26 + 32);
  swift_retain();
  v33(a1, 0, sub_1C145C7F4, v32, ObjectType, v26);
  swift_release();
  return swift_release();
}

uint64_t sub_1C14591D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;

  v6 = v5;
  v12 = sub_1C146574C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (uint64_t *)((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(void **)(v6 + 16);
  *v15 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E0DEF740], v12);
  v17 = v16;
  v18 = sub_1C1465758();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v13 + 8))(v15, v12);
  if ((v18 & 1) != 0)
  {
    v20 = swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)(v6 + 136) + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C145AEE8(a1, a2);
      if ((v21 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v20 = swift_bridgeObjectRelease();
        if (a5 > 0.0)
          goto LABEL_6;
        return a3(v20);
      }
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C14655D8();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_1C1464114(a1, a2);
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRelease();
      v20 = swift_release();
    }
    if (a5 > 0.0)
    {
LABEL_6:
      sub_1C1465614();
      swift_allocObject();
      v22 = sub_1C1465608();
      v25 = (uint64_t)&v25;
      MEMORY[0x1E0C80A78](v22);
      *(&v25 - 4) = v6;
      *(&v25 - 3) = a1;
      *(&v25 - 2) = a2;
      v23 = (_QWORD *)swift_allocObject();
      v23[2] = v6;
      v23[3] = a1;
      v23[4] = a2;
      v23[5] = a3;
      v23[6] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1C14655E4();
      swift_release();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v26 = *(_QWORD *)(v6 + 136);
      *(_QWORD *)(v6 + 136) = 0x8000000000000000;
      sub_1C1464D98(v22, a1, a2, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v6 + 136) = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      return swift_release();
    }
    return a3(v20);
  }
  __break(1u);
  return result;
}

void sub_1C14594E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = type metadata accessor for Alert(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    if (qword_1ED798C20 != -1)
      swift_once();
    v9 = sub_1C1465710();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED798C08);
    sub_1C145BEBC(a3, (uint64_t)v6, type metadata accessor for Alert);
    swift_retain_n();
    v10 = sub_1C1465704();
    v11 = sub_1C14657A0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v20 = v13;
      *(_DWORD *)v12 = 136380931;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + 32), *(_QWORD *)(v8 + 56));
      v14 = sub_1C1465668();
      v19 = sub_1C145A834(v14, v15, &v20);
      sub_1C14657E8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      v16 = Alert.description.getter();
      v19 = sub_1C145A834(v16, v17, &v20);
      sub_1C14657E8();
      swift_bridgeObjectRelease();
      sub_1C145BF00((uint64_t)v6, type metadata accessor for Alert);
      _os_log_impl(&dword_1C144E000, v10, v11, "(%{private}s): Presented non-interrupting alert on local device: %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C3BADCBC](v13, -1, -1);
      MEMORY[0x1C3BADCBC](v12, -1, -1);
      swift_release();
    }
    else
    {
      swift_release_n();
      sub_1C145BF00((uint64_t)v6, type metadata accessor for Alert);
    }

  }
}

uint64_t sub_1C1459774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t (*)(char *), uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t ObjectType;

  v8 = type metadata accessor for Alert(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = *(_QWORD *)(a2 + 80);
  ObjectType = swift_getObjectType();
  v12 = swift_allocObject();
  swift_weakInit();
  sub_1C145BEBC(a3, (uint64_t)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Alert);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  *(_QWORD *)(v14 + 24) = a1;
  sub_1C145BF3C((uint64_t)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for Alert);
  *(_QWORD *)(v14 + ((v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = a4;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(char *), uint64_t, uint64_t, uint64_t))(v11 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  v15(a3, 1, sub_1C145C1F4, v14, ObjectType, v11);
  swift_release();
  return swift_release();
}

uint64_t sub_1C14598DC(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v29 = a3;
  v30 = a5;
  v7 = sub_1C146571C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v33 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C1465740();
  v31 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Alert(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v19 = result;
    v28 = *(_QWORD *)(result + 16);
    sub_1C145BEBC(a4, (uint64_t)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Alert);
    v20 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v21 = v20 + v15;
    v27 = v8;
    v22 = (v20 + v15) & 0xFFFFFFFFFFFFFFF8;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v29;
    *(_QWORD *)(v23 + 24) = v19;
    sub_1C145BF3C((uint64_t)v16, v23 + v20, type metadata accessor for Alert);
    *(_BYTE *)(v23 + v21) = v17;
    *(_QWORD *)(v22 + v23 + 8) = v30;
    aBlock[4] = sub_1C145C338;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C145A144;
    aBlock[3] = &block_descriptor_57;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1C1465728();
    v34 = MEMORY[0x1E0DEE9D8];
    sub_1C145C950(&qword_1EF6DEB40, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB48);
    sub_1C145C8CC(&qword_1EF6DEB50, &qword_1EF6DEB48);
    v25 = v33;
    sub_1C1465800();
    MEMORY[0x1C3BAD80C](0, v12, v25, v24);
    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v25, v7);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v32);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C1459BA8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  unsigned __int8 v7;

  if ((sub_1C14655FC() & 1) == 0)
  {
    sub_1C14655D8();
    v7 = a4;
    sub_1C1459C14(a3, &v7);
  }
  return sub_1C1465620();
}

uint64_t sub_1C1459C14(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v54 = a1;
  v4 = type metadata accessor for Alert.HistoryItem(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v49 = (uint64_t)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v47 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v47 - v11;
  v53 = type metadata accessor for Alert(0);
  v13 = MEMORY[0x1E0C80A78](v53);
  v52 = (uint64_t)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v50 = (uint64_t)&v47 - v15;
  v16 = sub_1C146574C();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (uint64_t *)((char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = *a2;
  v51 = v2;
  v21 = *(void **)(v2 + 16);
  *v19 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E0DEF740], v16);
  v22 = v21;
  v23 = sub_1C1465758();
  (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v19, v16);
  if ((v23 & 1) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  v24 = *(_QWORD *)(v54 + *(int *)(v53 + 32));
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    v5 = sub_1C145A62C(0, *(_QWORD *)(v5 + 16) + 1, 1, v5);
    goto LABEL_7;
  }
  if (v20 == 2)
    v26 = 0x80;
  else
    v26 = v20 & 1 | 0x40;
  v48 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v47 = *(_QWORD *)(v5 + 72);
  sub_1C145BEBC(v24 + v48 + v47 * (v25 - 1), (uint64_t)v10, type metadata accessor for Alert.HistoryItem);
  v27 = *v10;
  v28 = *((_QWORD *)v10 + 1);
  v29 = *((_QWORD *)v10 + 2);
  v30 = *((_QWORD *)v10 + 3);
  v31 = *((_QWORD *)v10 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C14655A8();
  *v12 = v27;
  *((_QWORD *)v12 + 1) = v28;
  *((_QWORD *)v12 + 2) = v29;
  *((_QWORD *)v12 + 3) = v30;
  *((_QWORD *)v12 + 4) = v31;
  v12[40] = v26;
  sub_1C145BF00((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
  v23 = v50;
  sub_1C145BEBC(v54, v50, type metadata accessor for Alert);
  v2 = v49;
  sub_1C145BEBC((uint64_t)v12, v49, type metadata accessor for Alert.HistoryItem);
  v16 = *(int *)(v53 + 32);
  v5 = *(_QWORD *)(v23 + v16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_17;
LABEL_7:
  v32 = v51;
  v34 = *(_QWORD *)(v5 + 16);
  v33 = *(_QWORD *)(v5 + 24);
  if (v34 >= v33 >> 1)
    v5 = sub_1C145A62C(v33 > 1, v34 + 1, 1, v5);
  *(_QWORD *)(v5 + 16) = v34 + 1;
  sub_1C145BF3C(v2, v5 + v48 + v34 * v47, type metadata accessor for Alert.HistoryItem);
  *(_QWORD *)(v23 + v16) = v5;
  sub_1C145BF00((uint64_t)v12, type metadata accessor for Alert.HistoryItem);
  sub_1C1457D0C((_QWORD *)v23);
  if (qword_1ED798C20 != -1)
    swift_once();
  v35 = sub_1C1465710();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED798C08);
  v36 = v52;
  sub_1C145BEBC(v23, v52, type metadata accessor for Alert);
  swift_retain_n();
  v37 = sub_1C1465704();
  v38 = sub_1C14657A0();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v56 = v40;
    *(_DWORD *)v39 = 136380931;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v32 + 32), *(_QWORD *)(v32 + 56));
    v41 = sub_1C1465668();
    v55 = sub_1C145A834(v41, v42, &v56);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2082;
    v43 = v52;
    v44 = Alert.description.getter();
    v55 = sub_1C145A834(v44, v45, &v56);
    sub_1C14657E8();
    swift_bridgeObjectRelease();
    sub_1C145BF00(v43, type metadata accessor for Alert);
    _os_log_impl(&dword_1C144E000, v37, v38, "(%{private}s): Received presentation response for alert: %{public}s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v40, -1, -1);
    MEMORY[0x1C3BADCBC](v39, -1, -1);
  }
  else
  {
    swift_release_n();
    sub_1C145BF00(v36, type metadata accessor for Alert);
  }

  sub_1C1450F84(v23);
  return sub_1C145BF00(v23, type metadata accessor for Alert);
}

uint64_t sub_1C145A144(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C145A170(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  if (qword_1ED798C20 != -1)
    swift_once();
  v7 = sub_1C1465710();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED798C08);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v8 = sub_1C1465704();
  v9 = sub_1C14657A0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = v11;
    *(_DWORD *)v10 = 136380931;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 32), *(_QWORD *)(a2 + 56));
    v12 = sub_1C1465668();
    sub_1C145A834(v12, v13, &v14);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1C145A834(a3, a4, &v14);
    sub_1C14657E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C144E000, v8, v9, "(%{private}s): Configured watchdog for: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v11, -1, -1);
    MEMORY[0x1C3BADCBC](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
}

uint64_t sub_1C145A394(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18[3];

  if (qword_1ED798C20 != -1)
    swift_once();
  v9 = sub_1C1465710();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED798C08);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v10 = sub_1C1465704();
  v11 = sub_1C14657A0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18[0] = v17;
    *(_DWORD *)v12 = 136380931;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 32), *(_QWORD *)(a2 + 56));
    v13 = sub_1C1465668();
    sub_1C145A834(v13, v14, v18);
    sub_1C14657E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1C145A834(a3, a4, v18);
    sub_1C14657E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C144E000, v10, v11, "(%{private}s): Watchdog fired for: %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BADCBC](v17, -1, -1);
    MEMORY[0x1C3BADCBC](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C1464114(a3, a4);
  swift_endAccess();
  swift_bridgeObjectRelease();
  v15 = swift_release();
  return a5(v15);
}

uint64_t sub_1C145A62C(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v17;
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
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEAF8);
  v10 = *(_QWORD *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1C1465854();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C145BB24(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1C145A834(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1C145A904(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C145C854((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C145C854((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1C145A904(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C14657F4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1C145AABC(a5, a6);
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
  v8 = sub_1C1465848();
  if (!v8)
  {
    sub_1C1465854();
    __break(1u);
LABEL_17:
    result = sub_1C1465890();
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

uint64_t sub_1C145AABC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C145AB50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1C145AD28(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1C145AD28(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C145AB50(uint64_t a1, unint64_t a2)
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
      v3 = sub_1C145ACC4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1C1465824();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1C1465854();
      __break(1u);
LABEL_10:
      v2 = sub_1C1465788();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1C1465890();
    __break(1u);
LABEL_14:
    result = sub_1C1465854();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1C145ACC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB58);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C145AD28(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB58);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1C1465890();
  __break(1u);
  return result;
}

unint64_t sub_1C145AE74(unsigned __int8 a1)
{
  uint64_t v2;

  sub_1C1465920();
  if (!(a1 >> 6) || a1 >> 6 == 1)
    sub_1C146592C();
  sub_1C146592C();
  v2 = sub_1C1465938();
  return sub_1C145AF4C(a1, v2);
}

unint64_t sub_1C145AEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C1465920();
  sub_1C1465770();
  v4 = sub_1C1465938();
  return sub_1C145AFF0(a1, a2, v4);
}

unint64_t sub_1C145AF4C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unsigned int v7;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    while (1)
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + result);
      if (!(v7 >> 6))
        break;
      if (v7 >> 6 != 1)
      {
        if (a1 == 128)
          return result;
        goto LABEL_4;
      }
      if ((a1 & 0xC0) == 0x40)
        goto LABEL_10;
LABEL_4:
      result = (result + 1) & v6;
      if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) == 0)
        return result;
    }
    if (a1 > 0x3Fu)
      goto LABEL_4;
LABEL_10:
    if (((v7 ^ a1) & 1) == 0)
      return result;
    goto LABEL_4;
  }
  return result;
}

unint64_t sub_1C145AFF0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C1465908() & 1) == 0)
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
      while (!v14 && (sub_1C1465908() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1C145B0D0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1C145B0EC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1C145B0EC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB30);
  v10 = *(_QWORD *)(sub_1C14656EC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1C14656EC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1C1465890();
  __break(1u);
  return result;
}

uint64_t sub_1C145B2CC(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
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

unint64_t sub_1C145B354(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  unsigned __int8 v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798C48);
    v3 = (_QWORD *)sub_1C1465884();
    for (i = (_QWORD *)(a1 + 40); ; i += 2)
    {
      v5 = *((_BYTE *)i - 8);
      v6 = *i;
      result = sub_1C145AE74(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_QWORD *)(v3[7] + 8 * result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

_QWORD *sub_1C145B428(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ObjectType;
  void (*v23)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v24;
  _QWORD v26[4];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = v5;
  v32 = a4;
  v33 = a5;
  v29 = a3;
  v30 = a2;
  v31 = a1;
  v7 = sub_1C14657B8();
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C14657AC();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1C1465740();
  MEMORY[0x1E0C80A78]();
  v6[17] = MEMORY[0x1E0DEE9E0];
  v6[19] = 0;
  swift_unknownObjectWeakInit();
  v26[0] = sub_1C145C890();
  sub_1C1465734();
  v34 = MEMORY[0x1E0DEE9D8];
  v26[2] = sub_1C145C950(&qword_1ED798C38, 255, v10, MEMORY[0x1E0DEF828]);
  v26[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798C28);
  v26[3] = sub_1C145C8CC(&qword_1ED798C30, &qword_1ED798C28);
  sub_1C1465800();
  v11 = *MEMORY[0x1E0DEF8D8];
  v12 = v28;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 104);
  v13(v9, v11, v28);
  v6[2] = sub_1C14657DC();
  sub_1C1465734();
  v34 = MEMORY[0x1E0DEE9D8];
  v14 = v29;
  sub_1C1465800();
  v13(v9, v11, v12);
  v15 = v30;
  v16 = v31;
  v6[3] = sub_1C14657DC();
  sub_1C145C90C((uint64_t)v15, (uint64_t)(v6 + 4));
  v17 = v32;
  v6[9] = v14;
  v6[10] = v17;
  sub_1C145C90C(v16, (uint64_t)(v6 + 12));
  if (v33)
  {
    v6[11] = v33;
    swift_unknownObjectRetain();
  }
  else
  {
    v18 = qword_1ED798AC0;
    swift_unknownObjectRetain();
    if (v18 != -1)
      swift_once();
    v6[11] = off_1ED798AB0;
    swift_bridgeObjectRetain();
  }
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_1C145C950(&qword_1ED798AC8, v19, (uint64_t (*)(uint64_t))type metadata accessor for AlertCenter, (uint64_t)&protocol conformance descriptor for AlertCenter);
  v20 = qword_1ED798A00;
  swift_retain();
  if (v20 != -1)
    swift_once();
  sub_1C1465674();
  swift_release();
  v21 = v6[10];
  ObjectType = swift_getObjectType();
  v23 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v21 + 16);
  v24 = swift_retain();
  v23(v24, &protocol witness table for AlertCenter, ObjectType, v21);
  __swift_destroy_boxed_opaque_existential_1Tm(v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  return v6;
}

uint64_t sub_1C145B808(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1C145B82C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;

  return sub_1C1450920(v1[2], v1[3], v1[4], a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1C145B86C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C145B8B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C145B8F8()
{
  return sub_1C145BE78((uint64_t (*)(uint64_t))sub_1C1450F84);
}

uint64_t sub_1C145B904()
{
  return swift_deallocObject();
}

uint64_t sub_1C145B914()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C145B940()
{
  uint64_t *v0;

  return sub_1C1452B54(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C145B94C()
{
  return swift_deallocObject();
}

void sub_1C145B95C(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_1C1453568(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1C145B974@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1C1453C54(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1C145B98C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1C145B9F0(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 80);
  v4 = sub_1C1454ABC((_QWORD *)(v1 + ((v3 + 24) & ~v3)));
  return a1(v4);
}

uint64_t sub_1C145BA48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1C14656EC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1C145BABC(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1C14656EC() - 8) + 80);
  return sub_1C14553DC(a1, a2, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

unint64_t sub_1C145BB0C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1C1455C24(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1C145BB24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for Alert.HistoryItem(0) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1C1465890();
  __break(1u);
  return result;
}

uint64_t _s12SessionAlert0B6CenterC12purgeRecords3for22pairedDeviceIdentifiery0A10SyncEngine0jK13Synchronizing_p_SStF_0()
{
  sub_1C1465644();
  swift_retain();
  sub_1C1465638();
  return swift_release();
}

uint64_t sub_1C145BCB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = swift_unknownObjectRetain();
  return sub_1C14504D8(v2, v1);
}

uint64_t dispatch thunk of AlertPresenterDelegate.dismissAlert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertPresenting.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertPresenting.present(alert:interrupting:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of AlertPresenting.dismiss(alert:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t type metadata accessor for AlertCenter()
{
  return objc_opt_self();
}

uint64_t method lookup function for AlertCenter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AlertCenter.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AlertCenter.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AlertCenter.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AlertCenter.__allocating_init(store:syncEngine:presenter:watchdogIntervals:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1C145BD78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = MEMORY[0x1C3BADD10](v1 + 144);
  v4 = *(_QWORD *)(v1 + 152);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C145BDAC(uint64_t (*a1)(uint64_t a1), uint64_t a2)
{
  int64_t v2;

  return sub_1C145614C(a1, a2, v2);
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

uint64_t sub_1C145BDE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C145BE2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C145BE6C()
{
  return sub_1C145BE78(sub_1C1452EDC);
}

uint64_t sub_1C145BE78(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 80);
  return a1(v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_1C145BEBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C145BF00(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C145BF3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C145BF80(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C1459774(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C145BF8C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + v1[5];
  v6 = sub_1C14655C0();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[6], v6);
  sub_1C145B8B4(*(_QWORD *)(v4 + v1[7]), *(_QWORD *)(v4 + v1[7] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C145C074()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v4;

  v1 = *(_QWORD *)(type metadata accessor for Alert(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = 0;
  sub_1C1459C14(v0 + v2, &v4);
  return sub_1C1465620();
}

uint64_t sub_1C145C0E0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1C145C104()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + v1[5];
  v6 = sub_1C14655C0();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[6], v6);
  sub_1C145B8B4(*(_QWORD *)(v4 + v1[7]), *(_QWORD *)(v4 + v1[7] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C145C1F4(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for Alert(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1C14598DC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1C145C248()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + v1[5];
  v6 = sub_1C14655C0();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[6], v6);
  sub_1C145B8B4(*(_QWORD *)(v4 + v1[7]), *(_QWORD *)(v4 + v1[7] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C145C338()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for Alert(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_1C1459BA8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + v2, *(_BYTE *)(v0 + v2 + *(_QWORD *)(v1 + 64)));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BADC20](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C145C3C4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(unint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = (v3 + 16 + ((((v4 + *(_QWORD *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v3;
  v6 = v0 + v4;
  swift_bridgeObjectRelease();
  v7 = v6 + v1[5];
  v8 = sub_1C14655C0();
  v9 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v6 + v1[6], v8);
  sub_1C145B8B4(*(_QWORD *)(v6 + v1[7]), *(_QWORD *)(v6 + v1[7] + 8));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9(v0 + v5 + v1[5], v8);
  v9(v0 + v5 + v1[6], v8);
  sub_1C145B8B4(*(_QWORD *)(v0 + v5 + v1[7]), *(_QWORD *)(v0 + v5 + v1[7] + 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C145C514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for Alert(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v3 + *(_QWORD *)(v1 + 64);
  return sub_1C1457560(v0 + v3, *(_BYTE *)(v0 + v4), *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFFF8) + v0 + 8), *(_QWORD *)(v0 + (((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + (((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8), (uint64_t *)(v0 + ((v2 + 16 + (((v4 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v2)));
}

void sub_1C145C574(uint64_t a1)
{
  uint64_t v1;

  sub_1C145A170(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1C145C580()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C145C5B4(uint64_t a1)
{
  uint64_t v1;

  return sub_1C145A394(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(uint64_t (**)(uint64_t))(v1 + 40));
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 40) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + v1[5];
  v6 = sub_1C14655C0();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[6], v6);
  sub_1C145B8B4(*(_QWORD *)(v4 + v1[7]), *(_QWORD *)(v4 + v1[7] + 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C145C69C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t ObjectType;
  uint64_t v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 80);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = (_QWORD *)(v1 + ((v3 + 40) & ~v3));
  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **, _QWORD, _QWORD, uint64_t, uint64_t))(v4 + 8))(v5, &protocol witness table for AlertCenter, *v6, v6[1], ObjectType, v4);
  return a1(v8);
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for Alert(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  v4 = v0 + v3;
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + v1[5];
  v6 = sub_1C14655C0();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v4 + v1[6], v6);
  sub_1C145B8B4(*(_QWORD *)(v4 + v1[7]), *(_QWORD *)(v4 + v1[7] + 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C145C7F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 80);
  sub_1C14594E0(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1C145C854(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1C145C890()
{
  unint64_t result;

  result = qword_1ED798C40;
  if (!qword_1ED798C40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED798C40);
  }
  return result;
}

uint64_t sub_1C145C8CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BADC2C](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C145C90C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C145C950(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1C3BADC2C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C145C9AC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C145B974(a1);
}

unint64_t sub_1C145C9C0@<X0>(_QWORD *a1@<X8>)
{
  return sub_1C145BB0C(a1);
}

void sub_1C145C9D4(uint64_t *a1@<X8>)
{
  sub_1C145B95C(a1);
}

uint64_t sub_1C145C9E8@<X0>(_BYTE *a1@<X8>)
{
  return sub_1C145B82C(a1);
}

uint64_t sub_1C145C9FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1C14655CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C1465710();
  __swift_allocate_value_buffer(v4, qword_1ED798C08);
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED798C08);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0C8FF00], v0);
  return sub_1C14656F8();
}

uint64_t static Logger.alert.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED798C20 != -1)
    swift_once();
  v2 = sub_1C1465710();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED798C08);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t Alert.init(identifier:creationDate:dismissDate:payload:history:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  int *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  _QWORD *v18;

  if (*(_QWORD *)(a7 + 16))
  {
    *a8 = result;
    a8[1] = a2;
    v14 = (int *)type metadata accessor for Alert(0);
    v15 = (char *)a8 + v14[5];
    v16 = sub_1C14655C0();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
    v17(v15, a3, v16);
    result = ((uint64_t (*)(char *, uint64_t, uint64_t))v17)((char *)a8 + v14[6], a4, v16);
    v18 = (uint64_t *)((char *)a8 + v14[7]);
    *v18 = a5;
    v18[1] = a6;
    *(uint64_t *)((char *)a8 + v14[8]) = a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for Alert(uint64_t a1)
{
  return sub_1C145CCC4(a1, qword_1ED798A08);
}

uint64_t Alert.currentState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = type metadata accessor for Alert(0);
  v4 = *(_QWORD *)(v1 + *(int *)(result + 32));
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = v5 - 1;
    v7 = type metadata accessor for Alert.HistoryItem(0);
    return sub_1C145BEBC(v4+ ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72) * v6, a1, type metadata accessor for Alert.HistoryItem);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for Alert.HistoryItem(uint64_t a1)
{
  return sub_1C145CCC4(a1, qword_1EF6DEDE0);
}

uint64_t sub_1C145CCC4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C145CCF8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726F7461646E616DLL;
  else
    return 0x6C616E6F6974706FLL;
}

uint64_t sub_1C145CD3C()
{
  char *v0;

  return sub_1C145CCF8(*v0);
}

uint64_t sub_1C145CD44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1463294(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C145CD68()
{
  return 0;
}

void sub_1C145CD74(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C145CD80()
{
  sub_1C145D05C();
  return sub_1C146595C();
}

uint64_t sub_1C145CDA8()
{
  sub_1C145D05C();
  return sub_1C1465968();
}

uint64_t sub_1C145CDD0()
{
  return 0;
}

void sub_1C145CDDC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C145CDE8()
{
  sub_1C145D0A0();
  return sub_1C146595C();
}

uint64_t sub_1C145CE10()
{
  sub_1C145D0A0();
  return sub_1C1465968();
}

uint64_t sub_1C145CE38()
{
  sub_1C145D0E4();
  return sub_1C146595C();
}

uint64_t sub_1C145CE60()
{
  sub_1C145D0E4();
  return sub_1C1465968();
}

uint64_t Alert.Necessity.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB70);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB78);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEB80);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145D05C();
  sub_1C1465950();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_1C145D0A0();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_1C145D0E4();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1C145D05C()
{
  unint64_t result;

  result = qword_1EF6DEB88;
  if (!qword_1EF6DEB88)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1467204, &type metadata for Alert.Necessity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEB88);
  }
  return result;
}

unint64_t sub_1C145D0A0()
{
  unint64_t result;

  result = qword_1EF6DEB90;
  if (!qword_1EF6DEB90)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14671B4, &type metadata for Alert.Necessity.MandatoryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEB90);
  }
  return result;
}

unint64_t sub_1C145D0E4()
{
  unint64_t result;

  result = qword_1EF6DEB98;
  if (!qword_1EF6DEB98)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1467164, &type metadata for Alert.Necessity.OptionalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEB98);
  }
  return result;
}

uint64_t Alert.Necessity.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBA0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBA8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBB0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145D05C();
  v11 = v33;
  sub_1C1465944();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_1C14658CC();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_1C146583C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBB8);
    *v21 = &type metadata for Alert.Necessity;
    sub_1C14658A8();
    sub_1C1465830();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_1C145D0A0();
    sub_1C146589C();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_1C145D0E4();
    v22 = v6;
    sub_1C146589C();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1Tm(v24);
}

uint64_t sub_1C145D484@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return Alert.Necessity.init(from:)(a1, a2);
}

uint64_t sub_1C145D498(_QWORD *a1)
{
  return Alert.Necessity.encode(to:)(a1);
}

uint64_t sub_1C145D4AC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x676E696B6E696874;
  else
    return 0x6974736575716572;
}

uint64_t sub_1C145D4E8()
{
  char *v0;

  return sub_1C145D4AC(*v0);
}

uint64_t sub_1C145D4F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1463384(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C145D514()
{
  sub_1C145D7D8();
  return sub_1C146595C();
}

uint64_t sub_1C145D53C()
{
  sub_1C145D7D8();
  return sub_1C1465968();
}

uint64_t sub_1C145D564()
{
  sub_1C145D860();
  return sub_1C146595C();
}

uint64_t sub_1C145D58C()
{
  sub_1C145D860();
  return sub_1C1465968();
}

uint64_t sub_1C145D5B4()
{
  sub_1C145D81C();
  return sub_1C146595C();
}

uint64_t sub_1C145D5DC()
{
  sub_1C145D81C();
  return sub_1C1465968();
}

uint64_t Alert.CoordinationState.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBC0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBC8);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBD0);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145D7D8();
  sub_1C1465950();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_1C145D81C();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_1C145D860();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1C145D7D8()
{
  unint64_t result;

  result = qword_1EF6DEBD8;
  if (!qword_1EF6DEBD8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1467114, &type metadata for Alert.CoordinationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEBD8);
  }
  return result;
}

unint64_t sub_1C145D81C()
{
  unint64_t result;

  result = qword_1EF6DEBE0;
  if (!qword_1EF6DEBE0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14670C4, &type metadata for Alert.CoordinationState.ThinkingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEBE0);
  }
  return result;
}

unint64_t sub_1C145D860()
{
  unint64_t result;

  result = qword_1EF6DEBE8;
  if (!qword_1EF6DEBE8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1467074, &type metadata for Alert.CoordinationState.RequestingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEBE8);
  }
  return result;
}

uint64_t Alert.CoordinationState.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBF0);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBF8);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC00);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145D7D8();
  v11 = v33;
  sub_1C1465944();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_1C14658CC();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_1C146583C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBB8);
    *v21 = &type metadata for Alert.CoordinationState;
    sub_1C14658A8();
    sub_1C1465830();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_1C145D81C();
    sub_1C146589C();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_1C145D860();
    v22 = v6;
    sub_1C146589C();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1Tm(v24);
}

uint64_t sub_1C145DC00@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return Alert.CoordinationState.init(from:)(a1, a2);
}

uint64_t sub_1C145DC14(_QWORD *a1)
{
  return Alert.CoordinationState.encode(to:)(a1);
}

uint64_t Alert.FailureReason.hash(into:)()
{
  return sub_1C146592C();
}

BOOL static Alert.FailureReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C145DC68(char a1)
{
  if ((a1 & 1) != 0)
    return 0x64656E696C636564;
  else
    return 0x74754F64656D6974;
}

BOOL sub_1C145DC98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C145DCB0()
{
  return sub_1C146592C();
}

uint64_t sub_1C145DCD8()
{
  char *v0;

  return sub_1C145DC68(*v0);
}

uint64_t sub_1C145DCE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1463474(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C145DD04()
{
  sub_1C145DFC8();
  return sub_1C146595C();
}

uint64_t sub_1C145DD2C()
{
  sub_1C145DFC8();
  return sub_1C1465968();
}

uint64_t sub_1C145DD54()
{
  sub_1C145E00C();
  return sub_1C146595C();
}

uint64_t sub_1C145DD7C()
{
  sub_1C145E00C();
  return sub_1C1465968();
}

uint64_t sub_1C145DDA4()
{
  sub_1C145E050();
  return sub_1C146595C();
}

uint64_t sub_1C145DDCC()
{
  sub_1C145E050();
  return sub_1C1465968();
}

uint64_t Alert.FailureReason.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC08);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC10);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC18);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145DFC8();
  sub_1C1465950();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_1C145E00C();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_1C145E050();
    sub_1C14658D8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1C145DFC8()
{
  unint64_t result;

  result = qword_1EF6DEC20;
  if (!qword_1EF6DEC20)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1467024, &type metadata for Alert.FailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC20);
  }
  return result;
}

unint64_t sub_1C145E00C()
{
  unint64_t result;

  result = qword_1EF6DEC28;
  if (!qword_1EF6DEC28)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466FD4, &type metadata for Alert.FailureReason.DeclinedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC28);
  }
  return result;
}

unint64_t sub_1C145E050()
{
  unint64_t result;

  result = qword_1EF6DEC30;
  if (!qword_1EF6DEC30)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466F84, &type metadata for Alert.FailureReason.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC30);
  }
  return result;
}

uint64_t _s12SessionAlert0B0V9NecessityO9hashValueSivg_0()
{
  sub_1C1465920();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t Alert.FailureReason.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC38);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC40);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C145DFC8();
  v11 = v33;
  sub_1C1465944();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_1C14658CC();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_1C146583C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBB8);
    *v21 = &type metadata for Alert.FailureReason;
    sub_1C14658A8();
    sub_1C1465830();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_1C145E00C();
    sub_1C146589C();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_1C145E050();
    v22 = v6;
    sub_1C146589C();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1Tm(v24);
}

uint64_t sub_1C145E434@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return Alert.FailureReason.init(from:)(a1, a2);
}

uint64_t sub_1C145E448(_QWORD *a1)
{
  return Alert.FailureReason.encode(to:)(a1);
}

uint64_t sub_1C145E45C()
{
  sub_1C1465920();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t Alert.AlertState.hash(into:)()
{
  unsigned __int8 *v0;

  if (((unint64_t)*v0 >> 6) <= 1)
    sub_1C146592C();
  return sub_1C146592C();
}

uint64_t sub_1C145E4F0(char a1)
{
  return *(_QWORD *)&aCoordinafailed[8 * a1];
}

BOOL sub_1C145E510(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C145E524()
{
  char *v0;

  return sub_1C145E4F0(*v0);
}

uint64_t sub_1C145E52C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C146355C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C145E550(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C145E55C()
{
  sub_1C1460D28();
  return sub_1C146595C();
}

uint64_t sub_1C145E584()
{
  sub_1C1460D28();
  return sub_1C1465968();
}

uint64_t sub_1C145E5AC()
{
  return 1;
}

uint64_t sub_1C145E5C0()
{
  sub_1C1460E38();
  return sub_1C146595C();
}

uint64_t sub_1C145E5E8()
{
  sub_1C1460E38();
  return sub_1C1465968();
}

uint64_t sub_1C145E610@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C145E63C()
{
  sub_1C1460D6C();
  return sub_1C146595C();
}

uint64_t sub_1C145E664()
{
  sub_1C1460D6C();
  return sub_1C1465968();
}

uint64_t sub_1C145E68C()
{
  sub_1C1465920();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t sub_1C145E6CC()
{
  return sub_1C146592C();
}

uint64_t sub_1C145E6F0()
{
  sub_1C1465920();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t sub_1C145E72C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C14636B0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1C145E754()
{
  sub_1C1460DB0();
  return sub_1C146595C();
}

uint64_t sub_1C145E77C()
{
  sub_1C1460DB0();
  return sub_1C1465968();
}

uint64_t Alert.AlertState.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v2 = v1;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC50);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC58);
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC60);
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEC68);
  v26 = *(_QWORD *)(v11 - 8);
  v27 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1460D28();
  sub_1C1465950();
  if (v14 >> 6)
  {
    if (v14 >> 6 == 1)
    {
      v15 = v14 & 1;
      v31 = 1;
      sub_1C1460DB0();
      v16 = v27;
      sub_1C14658D8();
      v30 = v15;
      sub_1C1460DF4();
      v17 = v25;
      sub_1C14658F0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v16);
    }
    else
    {
      v32 = 2;
      sub_1C1460D6C();
      v20 = v27;
      sub_1C14658D8();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v20);
    }
  }
  else
  {
    v29 = 0;
    sub_1C1460E38();
    v19 = v27;
    sub_1C14658D8();
    v28 = v14 & 1;
    sub_1C1460E7C();
    sub_1C14658F0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v19);
  }
}

uint64_t Alert.AlertState.hashValue.getter()
{
  unsigned __int8 *v0;
  unint64_t v1;

  v1 = *v0;
  sub_1C1465920();
  if ((v1 >> 6) <= 1)
    sub_1C146592C();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t Alert.AlertState.init(from:)@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;

  v36 = a2;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECA0);
  v34 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v38 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECA8);
  v35 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECB8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1C1460D28();
  v14 = v41;
  sub_1C1465944();
  if (v14)
    goto LABEL_7;
  v31 = v5;
  v32 = v6;
  v16 = v37;
  v15 = v38;
  v17 = v39;
  v41 = v10;
  v18 = sub_1C14658CC();
  v19 = v9;
  if (*(_QWORD *)(v18 + 16) != 1)
  {
    v22 = sub_1C146583C();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEBB8);
    *v24 = &type metadata for Alert.AlertState;
    sub_1C14658A8();
    sub_1C1465830();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC450], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
LABEL_7:
    v25 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_1Tm(v25);
  }
  v20 = v41;
  if (*(_BYTE *)(v18 + 32))
  {
    if (*(_BYTE *)(v18 + 32) == 1)
    {
      v45 = 1;
      sub_1C1460DB0();
      v21 = v12;
      sub_1C146589C();
      sub_1C1460EC0();
      v27 = v33;
      sub_1C14658C0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
      v28 = v44 | 0x40;
    }
    else
    {
      v46 = 2;
      sub_1C1460D6C();
      sub_1C146589C();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v17);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v12, v19);
      v28 = 0x80;
    }
  }
  else
  {
    v43 = 0;
    sub_1C1460E38();
    sub_1C146589C();
    sub_1C1460F04();
    v29 = v31;
    sub_1C14658C0();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v19);
    v28 = v42;
  }
  v25 = (uint64_t)v40;
  *v36 = v28;
  return __swift_destroy_boxed_opaque_existential_1Tm(v25);
}

uint64_t sub_1C145EFEC@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return Alert.AlertState.init(from:)(a1, a2);
}

uint64_t sub_1C145F000(_QWORD *a1)
{
  return Alert.AlertState.encode(to:)(a1);
}

uint64_t sub_1C145F014()
{
  unsigned __int8 *v0;
  unint64_t v1;

  v1 = *v0;
  sub_1C1465920();
  if ((v1 >> 6) <= 1)
    sub_1C146592C();
  sub_1C146592C();
  return sub_1C1465938();
}

uint64_t sub_1C145F080()
{
  unsigned __int8 *v0;

  if (((unint64_t)*v0 >> 6) <= 1)
    sub_1C146592C();
  return sub_1C146592C();
}

uint64_t sub_1C145F0D0()
{
  unsigned __int8 *v0;
  unint64_t v1;

  v1 = *v0;
  sub_1C1465920();
  if ((v1 >> 6) <= 1)
    sub_1C146592C();
  sub_1C146592C();
  return sub_1C1465938();
}

void Alert.HistoryItem.necessity.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t Alert.HistoryItem.requestingDeviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alert.HistoryItem.requestedDeviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void Alert.HistoryItem.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 40);
}

uint64_t Alert.HistoryItem.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Alert.HistoryItem(0) + 32);
  v4 = sub_1C14655C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1C145F1F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C145F234 + 4 * byte_1C1465F30[a1]))(0xD000000000000012, 0x80000001C1467840);
}

uint64_t sub_1C145F234()
{
  return 0x746973736563656ELL;
}

unint64_t sub_1C145F250()
{
  return 0xD000000000000011;
}

uint64_t sub_1C145F26C()
{
  return 0x6574617473;
}

uint64_t sub_1C145F280()
{
  return 1702125924;
}

uint64_t sub_1C145F290()
{
  unsigned __int8 *v0;

  return sub_1C145F1F8(*v0);
}

uint64_t sub_1C145F298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1463728(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C145F2BC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1C145F2C8()
{
  sub_1C1461024();
  return sub_1C146595C();
}

uint64_t sub_1C145F2F0()
{
  sub_1C1461024();
  return sub_1C1465968();
}

uint64_t Alert.HistoryItem.encode(to:)(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1461024();
  sub_1C1465950();
  v10[15] = *v3;
  v10[14] = 0;
  sub_1C1461068();
  sub_1C14658F0();
  if (!v2)
  {
    v10[13] = 1;
    sub_1C14658E4();
    v10[12] = 2;
    sub_1C14658E4();
    v10[11] = v3[40];
    v10[10] = 3;
    sub_1C14610AC();
    sub_1C14658F0();
    type metadata accessor for Alert.HistoryItem(0);
    v10[9] = 4;
    sub_1C14655C0();
    sub_1C1461178(&qword_1EF6DECF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    sub_1C14658F0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Alert.HistoryItem.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;

  v22 = a2;
  v23 = sub_1C14655C0();
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DECF8);
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Alert.HistoryItem(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1C1461024();
  v25 = v8;
  v13 = v27;
  sub_1C1465944();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  v27 = v9;
  v14 = v5;
  v15 = v23;
  v33 = 0;
  sub_1C14610F0();
  v16 = v24;
  sub_1C14658C0();
  *v11 = v34;
  v32 = 1;
  *((_QWORD *)v11 + 1) = sub_1C14658B4();
  *((_QWORD *)v11 + 2) = v17;
  v31 = 2;
  *((_QWORD *)v11 + 3) = sub_1C14658B4();
  *((_QWORD *)v11 + 4) = v18;
  v29 = 3;
  sub_1C1461134();
  v21[1] = 0;
  sub_1C14658C0();
  v11[40] = v30;
  v28 = 4;
  sub_1C1461178(&qword_1EF6DED10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  v19 = v25;
  sub_1C14658C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v16);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v11[*(int *)(v27 + 32)], v14, v15);
  sub_1C145BEBC((uint64_t)v11, v22, type metadata accessor for Alert.HistoryItem);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  return sub_1C145BF00((uint64_t)v11, type metadata accessor for Alert.HistoryItem);
}

uint64_t sub_1C145F888@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Alert.HistoryItem.init(from:)(a1, a2);
}

uint64_t sub_1C145F89C(_QWORD *a1)
{
  return Alert.HistoryItem.encode(to:)(a1);
}

uint64_t Alert.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Alert.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Alert(0) + 20);
  v4 = sub_1C14655C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Alert.dismissDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Alert(0) + 24);
  v4 = sub_1C14655C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Alert.payload.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for Alert(0) + 28);
  v2 = *(_QWORD *)v1;
  sub_1C145B86C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t Alert.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for Alert(0) + 28);
  result = sub_1C145B8B4(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

uint64_t (*Alert.payload.modify())()
{
  type metadata accessor for Alert(0);
  return nullsub_1;
}

uint64_t Alert.history.getter()
{
  type metadata accessor for Alert(0);
  return swift_bridgeObjectRetain();
}

uint64_t Alert.history.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Alert(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Alert.history.modify())()
{
  type metadata accessor for Alert(0);
  return nullsub_1;
}

uint64_t Alert.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v1 = *(_QWORD *)(type metadata accessor for Alert.HistoryItem(0) - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_1C1465818();
  sub_1C146577C();
  swift_bridgeObjectRetain();
  sub_1C146577C();
  swift_bridgeObjectRelease();
  sub_1C146577C();
  v4 = type metadata accessor for Alert(0);
  sub_1C14655C0();
  sub_1C1461178(&qword_1EF6DED18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
  sub_1C14658FC();
  sub_1C146577C();
  swift_bridgeObjectRelease();
  sub_1C146577C();
  sub_1C14658FC();
  sub_1C146577C();
  swift_bridgeObjectRelease();
  result = sub_1C146577C();
  v6 = *(_QWORD *)(v0 + *(int *)(v4 + 32));
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    sub_1C145BEBC(v6+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72) * (v7 - 1), (uint64_t)v3, type metadata accessor for Alert.HistoryItem);
    sub_1C1465764();
    sub_1C146577C();
    swift_bridgeObjectRelease();
    return v8[0];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C145FCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  BOOL v21;
  uint64_t v23;

  v4 = type metadata accessor for Alert.HistoryItem(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (unsigned __int8 *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v10 = (unsigned __int8 *)&v23 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      while (1)
      {
        sub_1C145BEBC(a1 + v12, (uint64_t)v10, type metadata accessor for Alert.HistoryItem);
        sub_1C145BEBC(a2 + v12, (uint64_t)v7, type metadata accessor for Alert.HistoryItem);
        if (*v10 != *v7
          || (*((_QWORD *)v10 + 1) == *((_QWORD *)v7 + 1)
            ? (v15 = *((_QWORD *)v10 + 2) == *((_QWORD *)v7 + 2))
            : (v15 = 0),
              !v15 && (sub_1C1465908() & 1) == 0
           || (*((_QWORD *)v10 + 3) == *((_QWORD *)v7 + 3)
             ? (v16 = *((_QWORD *)v10 + 4) == *((_QWORD *)v7 + 4))
             : (v16 = 0),
               !v16 && (sub_1C1465908() & 1) == 0)))
        {
LABEL_31:
          sub_1C145BF00((uint64_t)v7, type metadata accessor for Alert.HistoryItem);
          sub_1C145BF00((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
          goto LABEL_32;
        }
        v17 = v10[40];
        v18 = v7[40];
        if (!(v17 >> 6))
          break;
        if (v17 >> 6 == 1)
        {
          if ((v18 & 0xC0) != 0x40)
            goto LABEL_31;
          goto LABEL_21;
        }
        if (v18 != 128)
          goto LABEL_31;
LABEL_24:
        v19 = sub_1C146559C();
        sub_1C145BF00((uint64_t)v7, type metadata accessor for Alert.HistoryItem);
        sub_1C145BF00((uint64_t)v10, type metadata accessor for Alert.HistoryItem);
        v21 = v14-- != 0;
        if ((v19 & 1) != 0)
        {
          v12 += v13;
          if (v21)
            continue;
        }
        return v19 & 1;
      }
      if (v18 > 0x3F)
        goto LABEL_31;
LABEL_21:
      if (((v18 ^ v17) & 1) != 0)
        goto LABEL_31;
      goto LABEL_24;
    }
    v19 = 1;
  }
  else
  {
LABEL_32:
    v19 = 0;
  }
  return v19 & 1;
}

uint64_t sub_1C145FEBC(char a1)
{
  return *(_QWORD *)&aIdentificreati[8 * a1];
}

uint64_t sub_1C145FEDC()
{
  char *v0;

  return sub_1C145FEBC(*v0);
}

uint64_t sub_1C145FEE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1463918(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C145FF08()
{
  sub_1C1461274();
  return sub_1C146595C();
}

uint64_t sub_1C145FF30()
{
  sub_1C1461274();
  return sub_1C1465968();
}

uint64_t Alert.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DED20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1461274();
  sub_1C1465950();
  LOBYTE(v11) = 0;
  sub_1C14658E4();
  if (!v2)
  {
    v9 = type metadata accessor for Alert(0);
    LOBYTE(v11) = 1;
    sub_1C14655C0();
    sub_1C1461178(&qword_1EF6DECF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    sub_1C14658F0();
    LOBYTE(v11) = 2;
    sub_1C14658F0();
    v11 = *(_OWORD *)(v3 + *(int *)(v9 + 28));
    v12 = 3;
    sub_1C14612B8();
    sub_1C14658F0();
    *(_QWORD *)&v11 = *(_QWORD *)(v3 + *(int *)(v9 + 32));
    v12 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DED38);
    sub_1C1461340(&qword_1EF6DED40, &qword_1EF6DED48, (uint64_t)&protocol conformance descriptor for Alert.HistoryItem, MEMORY[0x1E0DEAF10]);
    sub_1C14658F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Alert.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  __int128 v35;
  char v36;

  v28 = a2;
  v3 = sub_1C14655C0();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v29 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - v6;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DED50);
  v8 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Alert(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (uint64_t *)((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C1461274();
  v33 = v10;
  v14 = (uint64_t)v34;
  sub_1C1465944();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v27 = v8;
  v34 = a1;
  v15 = v30;
  v16 = v31;
  LOBYTE(v35) = 0;
  v17 = (uint64_t)v13;
  *v13 = sub_1C14658B4();
  v13[1] = v18;
  LOBYTE(v35) = 1;
  sub_1C1461178(&qword_1EF6DED10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  sub_1C14658C0();
  v26 = v11;
  v19 = (char *)v13 + *(int *)(v11 + 20);
  v20 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v20(v19, v7, v16);
  LOBYTE(v35) = 2;
  v21 = v29;
  v25 = 0;
  sub_1C14658C0();
  v20((char *)(v17 + *(int *)(v26 + 24)), v21, v16);
  v36 = 3;
  sub_1C14612FC();
  v22 = v33;
  sub_1C14658C0();
  v23 = v26;
  *(_OWORD *)(v17 + *(int *)(v26 + 28)) = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DED38);
  v36 = 4;
  sub_1C1461340(&qword_1EF6DED60, &qword_1EF6DED68, (uint64_t)&protocol conformance descriptor for Alert.HistoryItem, MEMORY[0x1E0DEAF40]);
  sub_1C14658C0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v32);
  *(_QWORD *)(v17 + *(int *)(v23 + 32)) = v35;
  sub_1C145BEBC(v17, v28, type metadata accessor for Alert);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  return sub_1C145BF00(v17, type metadata accessor for Alert);
}

uint64_t sub_1C1460618@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Alert.init(from:)(a1, a2);
}

uint64_t sub_1C146062C(_QWORD *a1)
{
  return Alert.encode(to:)(a1);
}

void sub_1C1460648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1C14606A8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1C146088CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_1C14608B0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C146090C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_1C1460648((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_1C145B8B4(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1C1460AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1C146553C();
  v11 = result;
  if (result)
  {
    result = sub_1C1465554();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1C1465548();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1C1460648(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1C1460B88(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1C1460BCC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1C1460C00 + *((int *)qword_1C1460CC0 + (v0 >> 62))))();
}

uint64_t sub_1C1460C10@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_1C145B86C(v2, v1);
      sub_1C14608B0(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t _s12SessionAlert0B0V0B5StateO2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 >> 6)
  {
    if (v2 >> 6 == 1)
    {
      if ((v3 & 0xC0) != 0x40)
        return 0;
      return ((v3 ^ v2) & 1) == 0;
    }
    if (v3 == 128)
      return 1;
  }
  else if (v3 < 0x40)
  {
    return ((v3 ^ v2) & 1) == 0;
  }
  return 0;
}

unint64_t sub_1C1460D28()
{
  unint64_t result;

  result = qword_1EF6DEC70;
  if (!qword_1EF6DEC70)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466F34, &type metadata for Alert.AlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC70);
  }
  return result;
}

unint64_t sub_1C1460D6C()
{
  unint64_t result;

  result = qword_1EF6DEC78;
  if (!qword_1EF6DEC78)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466EE4, &type metadata for Alert.AlertState.DisplayedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC78);
  }
  return result;
}

unint64_t sub_1C1460DB0()
{
  unint64_t result;

  result = qword_1EF6DEC80;
  if (!qword_1EF6DEC80)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466E94, &type metadata for Alert.AlertState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC80);
  }
  return result;
}

unint64_t sub_1C1460DF4()
{
  unint64_t result;

  result = qword_1EF6DEC88;
  if (!qword_1EF6DEC88)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.FailureReason, &type metadata for Alert.FailureReason);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC88);
  }
  return result;
}

unint64_t sub_1C1460E38()
{
  unint64_t result;

  result = qword_1EF6DEC90;
  if (!qword_1EF6DEC90)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466E44, &type metadata for Alert.AlertState.CoordinatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC90);
  }
  return result;
}

unint64_t sub_1C1460E7C()
{
  unint64_t result;

  result = qword_1EF6DEC98;
  if (!qword_1EF6DEC98)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.CoordinationState, &type metadata for Alert.CoordinationState);
    atomic_store(result, (unint64_t *)&qword_1EF6DEC98);
  }
  return result;
}

unint64_t sub_1C1460EC0()
{
  unint64_t result;

  result = qword_1EF6DECC0;
  if (!qword_1EF6DECC0)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.FailureReason, &type metadata for Alert.FailureReason);
    atomic_store(result, (unint64_t *)&qword_1EF6DECC0);
  }
  return result;
}

unint64_t sub_1C1460F04()
{
  unint64_t result;

  result = qword_1EF6DECC8;
  if (!qword_1EF6DECC8)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.CoordinationState, &type metadata for Alert.CoordinationState);
    atomic_store(result, (unint64_t *)&qword_1EF6DECC8);
  }
  return result;
}

uint64_t _s12SessionAlert0B0V11HistoryItemV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;

  if (*a1 != *a2)
    return 0;
  v5 = *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2);
  if (!v5 && (sub_1C1465908() & 1) == 0)
    return 0;
  v6 = *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3) && *((_QWORD *)a1 + 4) == *((_QWORD *)a2 + 4);
  if (!v6 && (sub_1C1465908() & 1) == 0)
    return 0;
  v7 = a1[40];
  v8 = a2[40];
  if (v7 >> 6)
  {
    if (v7 >> 6 == 1)
    {
      if ((v8 & 0xC0) != 0x40)
        return 0;
      goto LABEL_18;
    }
    if (v8 == 128)
      goto LABEL_21;
    return 0;
  }
  if (v8 > 0x3F)
    return 0;
LABEL_18:
  if (((v8 ^ v7) & 1) != 0)
    return 0;
LABEL_21:
  type metadata accessor for Alert.HistoryItem(0);
  return sub_1C146559C();
}

unint64_t sub_1C1461024()
{
  unint64_t result;

  result = qword_1EF6DECD8;
  if (!qword_1EF6DECD8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466DF4, &type metadata for Alert.HistoryItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DECD8);
  }
  return result;
}

unint64_t sub_1C1461068()
{
  unint64_t result;

  result = qword_1EF6DECE0;
  if (!qword_1EF6DECE0)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.Necessity, &type metadata for Alert.Necessity);
    atomic_store(result, (unint64_t *)&qword_1EF6DECE0);
  }
  return result;
}

unint64_t sub_1C14610AC()
{
  unint64_t result;

  result = qword_1EF6DECE8;
  if (!qword_1EF6DECE8)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.AlertState, &type metadata for Alert.AlertState);
    atomic_store(result, (unint64_t *)&qword_1EF6DECE8);
  }
  return result;
}

unint64_t sub_1C14610F0()
{
  unint64_t result;

  result = qword_1EF6DED00;
  if (!qword_1EF6DED00)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.Necessity, &type metadata for Alert.Necessity);
    atomic_store(result, (unint64_t *)&qword_1EF6DED00);
  }
  return result;
}

unint64_t sub_1C1461134()
{
  unint64_t result;

  result = qword_1EF6DED08;
  if (!qword_1EF6DED08)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.AlertState, &type metadata for Alert.AlertState);
    atomic_store(result, (unint64_t *)&qword_1EF6DED08);
  }
  return result;
}

uint64_t sub_1C1461178(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3BADC2C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s12SessionAlert0B0V2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  uint64_t v5;
  char v6;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if ((v4 || (sub_1C1465908() & 1) != 0)
    && (v5 = type metadata accessor for Alert(0), (sub_1C146559C() & 1) != 0)
    && (sub_1C146559C() & 1) != 0
    && (sub_1C1460B88(*(_QWORD *)((char *)a1 + *(int *)(v5 + 28)), *(_QWORD *)((char *)a1 + *(int *)(v5 + 28) + 8)),
        (v6 & 1) != 0))
  {
    return sub_1C145FCC4(*(_QWORD *)((char *)a1 + *(int *)(v5 + 32)), *(_QWORD *)((char *)a2 + *(int *)(v5 + 32)));
  }
  else
  {
    return 0;
  }
}

unint64_t sub_1C1461274()
{
  unint64_t result;

  result = qword_1EF6DED28;
  if (!qword_1EF6DED28)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466DA4, &type metadata for Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DED28);
  }
  return result;
}

unint64_t sub_1C14612B8()
{
  unint64_t result;

  result = qword_1EF6DED30;
  if (!qword_1EF6DED30)
  {
    result = MEMORY[0x1C3BADC2C](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF6DED30);
  }
  return result;
}

unint64_t sub_1C14612FC()
{
  unint64_t result;

  result = qword_1EF6DED58;
  if (!qword_1EF6DED58)
  {
    result = MEMORY[0x1C3BADC2C](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF6DED58);
  }
  return result;
}

uint64_t sub_1C1461340(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF6DED38);
    v10 = sub_1C1461178(a2, type metadata accessor for Alert.HistoryItem, a3);
    result = MEMORY[0x1C3BADC2C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C14613C8()
{
  unint64_t result;

  result = qword_1EF6DED70;
  if (!qword_1EF6DED70)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.Necessity, &type metadata for Alert.Necessity);
    atomic_store(result, (unint64_t *)&qword_1EF6DED70);
  }
  return result;
}

unint64_t sub_1C1461410()
{
  unint64_t result;

  result = qword_1EF6DED78;
  if (!qword_1EF6DED78)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.CoordinationState, &type metadata for Alert.CoordinationState);
    atomic_store(result, (unint64_t *)&qword_1EF6DED78);
  }
  return result;
}

unint64_t sub_1C1461458()
{
  unint64_t result;

  result = qword_1EF6DED80;
  if (!qword_1EF6DED80)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.FailureReason, &type metadata for Alert.FailureReason);
    atomic_store(result, (unint64_t *)&qword_1EF6DED80);
  }
  return result;
}

unint64_t sub_1C14614A0()
{
  unint64_t result;

  result = qword_1ED798AB8;
  if (!qword_1ED798AB8)
  {
    result = MEMORY[0x1C3BADC2C](&protocol conformance descriptor for Alert.AlertState, &type metadata for Alert.AlertState);
    atomic_store(result, (unint64_t *)&qword_1ED798AB8);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for Alert(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_1C14655C0();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    v13 = a3[7];
    v14 = (uint64_t *)&v4[v13];
    v15 = (uint64_t *)&a2[v13];
    v16 = *v15;
    v17 = v15[1];
    sub_1C145B86C(*v15, v17);
    *v14 = v16;
    v14[1] = v17;
    *(_QWORD *)&v4[a3[8]] = *(_QWORD *)&a2[a3[8]];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Alert(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_1C14655C0();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  sub_1C145B8B4(*(_QWORD *)(a1 + a2[7]), *(_QWORD *)(a1 + a2[7] + 8));
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_1C14655C0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[7];
  v13 = (uint64_t *)&a1[v12];
  v14 = (uint64_t *)&a2[v12];
  v15 = *v14;
  v16 = v14[1];
  sub_1C145B86C(*v14, v16);
  *v13 = v15;
  v13[1] = v16;
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1C14655C0();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v11 = a3[7];
  v12 = (uint64_t *)&a1[v11];
  v13 = (uint64_t *)&a2[v11];
  v14 = *v13;
  v15 = v13[1];
  sub_1C145B86C(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_1C145B8B4(v16, v17);
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1C14655C0();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v11 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  return a1;
}

char *assignWithTake for Alert(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_1C14655C0();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v12 = a3[7];
  v13 = *(_QWORD *)&a1[v12];
  v14 = *(_QWORD *)&a1[v12 + 8];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  sub_1C145B8B4(v13, v14);
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Alert()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C1461974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1C14655C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Alert()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C14619FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1C14655C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1C1461A70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C14655C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for Alert.Necessity()
{
  return &type metadata for Alert.Necessity;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState()
{
  return &type metadata for Alert.CoordinationState;
}

ValueMetadata *type metadata accessor for Alert.FailureReason()
{
  return &type metadata for Alert.FailureReason;
}

uint64_t getEnumTagSinglePayload for Alert.AlertState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7E)
    goto LABEL_17;
  if (a2 + 130 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 130) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 130;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 130;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 130;
  }
LABEL_17:
  v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for Alert.AlertState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 130 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 130) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7E)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7D)
    return ((uint64_t (*)(void))((char *)&loc_1C1461C30 + 4 * byte_1C1465F3A[v4]))();
  *a1 = a2 - 126;
  return ((uint64_t (*)(void))((char *)sub_1C1461C64 + 4 * byte_1C1465F35[v4]))();
}

uint64_t sub_1C1461C64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1461C6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1461C74);
  return result;
}

uint64_t sub_1C1461C8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1461C94);
  *(_BYTE *)result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_1C1461C98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1461CA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1461CAC(_BYTE *a1)
{
  int v1;

  v1 = (char)*a1;
  if (v1 >= 0)
    return *a1 >> 6;
  else
    return v1 & 1 | 2u;
}

_BYTE *sub_1C1461CC8(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_1C1461CD8(_BYTE *result, unsigned int a2)
{
  if (a2 < 2)
    *result = *result & 1 | ((_BYTE)a2 << 6);
  else
    *result = a2 & 1 | 0x80;
  return result;
}

ValueMetadata *type metadata accessor for Alert.AlertState()
{
  return &type metadata for Alert.AlertState;
}

_QWORD *initializeBufferWithCopyOfBuffer for Alert.HistoryItem(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v5;
    v6 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v6;
    v7 = *(int *)(a3 + 32);
    v8 = (uint64_t)a2 + v7;
    v9 = a1 + v7;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v10 = sub_1C14655C0();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t destroy for Alert.HistoryItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_1C14655C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(int *)(a3 + 32);
  v7 = a2 + v6;
  v8 = a1 + v6;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v9 = sub_1C14655C0();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

uint64_t assignWithCopy for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = *(int *)(a3 + 32);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1C14655C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(int *)(a3 + 32);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_1C14655C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Alert.HistoryItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(int *)(a3 + 32);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1C14655C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Alert.HistoryItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C1462078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1C14655C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Alert.HistoryItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C1462100(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_1C14655C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1C1462174()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C14655C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Alert.CodingKeys()
{
  return &type metadata for Alert.CodingKeys;
}

uint64_t _s12SessionAlert5AlertV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12SessionAlert5AlertV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C14622F0 + 4 * byte_1C1465F44[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1C1462324 + 4 * byte_1C1465F3F[v4]))();
}

uint64_t sub_1C1462324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C146232C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1462334);
  return result;
}

uint64_t sub_1C1462340(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1462348);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1C146234C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1462354(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Alert.HistoryItem.CodingKeys()
{
  return &type metadata for Alert.HistoryItem.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Alert.AlertState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Alert.AlertState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C146244C + 4 * byte_1C1465F4E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C1462480 + 4 * byte_1C1465F49[v4]))();
}

uint64_t sub_1C1462480(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1462488(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1462490);
  return result;
}

uint64_t sub_1C146249C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C14624A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C14624A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C14624B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C14624BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C14624C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Alert.AlertState.CodingKeys()
{
  return &type metadata for Alert.AlertState.CodingKeys;
}

uint64_t sub_1C14624E8()
{
  return 0;
}

ValueMetadata *type metadata accessor for Alert.AlertState.CoordinatingCodingKeys()
{
  return &type metadata for Alert.AlertState.CoordinatingCodingKeys;
}

uint64_t _s12SessionAlert5AlertV10AlertStateO22CoordinatingCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s12SessionAlert5AlertV10AlertStateO22CoordinatingCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C1462590 + 4 * byte_1C1465F53[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C14625B0 + 4 * byte_1C1465F58[v4]))();
}

_BYTE *sub_1C1462590(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C14625B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C14625B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C14625C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C14625C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C14625D0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Alert.AlertState.FailedCodingKeys()
{
  return &type metadata for Alert.AlertState.FailedCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.AlertState.DisplayedCodingKeys()
{
  return &type metadata for Alert.AlertState.DisplayedCodingKeys;
}

_BYTE *sub_1C14625FC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.CodingKeys()
{
  return &type metadata for Alert.FailureReason.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.TimedOutCodingKeys()
{
  return &type metadata for Alert.FailureReason.TimedOutCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.FailureReason.DeclinedCodingKeys()
{
  return &type metadata for Alert.FailureReason.DeclinedCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.CodingKeys()
{
  return &type metadata for Alert.CoordinationState.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.RequestingCodingKeys()
{
  return &type metadata for Alert.CoordinationState.RequestingCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.CoordinationState.ThinkingCodingKeys()
{
  return &type metadata for Alert.CoordinationState.ThinkingCodingKeys;
}

uint64_t _s12SessionAlert5AlertV9NecessityOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12SessionAlert5AlertV9NecessityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C1462744 + 4 * byte_1C1465F62[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C1462778 + 4 * byte_1C1465F5D[v4]))();
}

uint64_t sub_1C1462778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1462780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1462788);
  return result;
}

uint64_t sub_1C1462794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C146279CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C14627A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C14627A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Alert.Necessity.CodingKeys()
{
  return &type metadata for Alert.Necessity.CodingKeys;
}

ValueMetadata *type metadata accessor for Alert.Necessity.OptionalCodingKeys()
{
  return &type metadata for Alert.Necessity.OptionalCodingKeys;
}

ValueMetadata *type metadata accessor for Alert.Necessity.MandatoryCodingKeys()
{
  return &type metadata for Alert.Necessity.MandatoryCodingKeys;
}

unint64_t sub_1C14627E8()
{
  unint64_t result;

  result = qword_1EF6DEE28;
  if (!qword_1EF6DEE28)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14666E4, &type metadata for Alert.Necessity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE28);
  }
  return result;
}

unint64_t sub_1C1462830()
{
  unint64_t result;

  result = qword_1EF6DEE30;
  if (!qword_1EF6DEE30)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146683C, &type metadata for Alert.CoordinationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE30);
  }
  return result;
}

unint64_t sub_1C1462878()
{
  unint64_t result;

  result = qword_1EF6DEE38;
  if (!qword_1EF6DEE38)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466994, &type metadata for Alert.FailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE38);
  }
  return result;
}

unint64_t sub_1C14628C0()
{
  unint64_t result;

  result = qword_1EF6DEE40;
  if (!qword_1EF6DEE40)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466A9C, &type metadata for Alert.AlertState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE40);
  }
  return result;
}

unint64_t sub_1C1462908()
{
  unint64_t result;

  result = qword_1EF6DEE48;
  if (!qword_1EF6DEE48)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466B54, &type metadata for Alert.AlertState.CoordinatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE48);
  }
  return result;
}

unint64_t sub_1C1462950()
{
  unint64_t result;

  result = qword_1EF6DEE50;
  if (!qword_1EF6DEE50)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466C0C, &type metadata for Alert.AlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE50);
  }
  return result;
}

unint64_t sub_1C1462998()
{
  unint64_t result;

  result = qword_1EF6DEE58;
  if (!qword_1EF6DEE58)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466CC4, &type metadata for Alert.HistoryItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE58);
  }
  return result;
}

unint64_t sub_1C14629E0()
{
  unint64_t result;

  result = qword_1EF6DEE60;
  if (!qword_1EF6DEE60)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466D7C, &type metadata for Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE60);
  }
  return result;
}

unint64_t sub_1C1462A28()
{
  unint64_t result;

  result = qword_1EF6DEE68;
  if (!qword_1EF6DEE68)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466CEC, &type metadata for Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE68);
  }
  return result;
}

unint64_t sub_1C1462A70()
{
  unint64_t result;

  result = qword_1EF6DEE70;
  if (!qword_1EF6DEE70)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466D14, &type metadata for Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE70);
  }
  return result;
}

unint64_t sub_1C1462AB8()
{
  unint64_t result;

  result = qword_1EF6DEE78;
  if (!qword_1EF6DEE78)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466C34, &type metadata for Alert.HistoryItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE78);
  }
  return result;
}

unint64_t sub_1C1462B00()
{
  unint64_t result;

  result = qword_1EF6DEE80;
  if (!qword_1EF6DEE80)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466C5C, &type metadata for Alert.HistoryItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE80);
  }
  return result;
}

unint64_t sub_1C1462B48()
{
  unint64_t result;

  result = qword_1EF6DEE88;
  if (!qword_1EF6DEE88)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466AC4, &type metadata for Alert.AlertState.CoordinatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE88);
  }
  return result;
}

unint64_t sub_1C1462B90()
{
  unint64_t result;

  result = qword_1EF6DEE90;
  if (!qword_1EF6DEE90)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466AEC, &type metadata for Alert.AlertState.CoordinatingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE90);
  }
  return result;
}

unint64_t sub_1C1462BD8()
{
  unint64_t result;

  result = qword_1EF6DEE98;
  if (!qword_1EF6DEE98)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466A0C, &type metadata for Alert.AlertState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEE98);
  }
  return result;
}

unint64_t sub_1C1462C20()
{
  unint64_t result;

  result = qword_1EF6DEEA0;
  if (!qword_1EF6DEEA0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466A34, &type metadata for Alert.AlertState.FailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEA0);
  }
  return result;
}

unint64_t sub_1C1462C68()
{
  unint64_t result;

  result = qword_1EF6DEEA8;
  if (!qword_1EF6DEEA8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14669BC, &type metadata for Alert.AlertState.DisplayedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEA8);
  }
  return result;
}

unint64_t sub_1C1462CB0()
{
  unint64_t result;

  result = qword_1EF6DEEB0;
  if (!qword_1EF6DEEB0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14669E4, &type metadata for Alert.AlertState.DisplayedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEB0);
  }
  return result;
}

unint64_t sub_1C1462CF8()
{
  unint64_t result;

  result = qword_1EF6DEEB8;
  if (!qword_1EF6DEEB8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466B7C, &type metadata for Alert.AlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEB8);
  }
  return result;
}

unint64_t sub_1C1462D40()
{
  unint64_t result;

  result = qword_1EF6DEEC0;
  if (!qword_1EF6DEEC0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466BA4, &type metadata for Alert.AlertState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEC0);
  }
  return result;
}

unint64_t sub_1C1462D88()
{
  unint64_t result;

  result = qword_1EF6DEEC8;
  if (!qword_1EF6DEEC8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14668B4, &type metadata for Alert.FailureReason.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEC8);
  }
  return result;
}

unint64_t sub_1C1462DD0()
{
  unint64_t result;

  result = qword_1EF6DEED0;
  if (!qword_1EF6DEED0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14668DC, &type metadata for Alert.FailureReason.TimedOutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEED0);
  }
  return result;
}

unint64_t sub_1C1462E18()
{
  unint64_t result;

  result = qword_1EF6DEED8;
  if (!qword_1EF6DEED8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466864, &type metadata for Alert.FailureReason.DeclinedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEED8);
  }
  return result;
}

unint64_t sub_1C1462E60()
{
  unint64_t result;

  result = qword_1EF6DEEE0;
  if (!qword_1EF6DEEE0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146688C, &type metadata for Alert.FailureReason.DeclinedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEE0);
  }
  return result;
}

unint64_t sub_1C1462EA8()
{
  unint64_t result;

  result = qword_1EF6DEEE8;
  if (!qword_1EF6DEEE8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466904, &type metadata for Alert.FailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEE8);
  }
  return result;
}

unint64_t sub_1C1462EF0()
{
  unint64_t result;

  result = qword_1EF6DEEF0;
  if (!qword_1EF6DEEF0)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146692C, &type metadata for Alert.FailureReason.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEF0);
  }
  return result;
}

unint64_t sub_1C1462F38()
{
  unint64_t result;

  result = qword_1EF6DEEF8;
  if (!qword_1EF6DEEF8)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146675C, &type metadata for Alert.CoordinationState.RequestingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEEF8);
  }
  return result;
}

unint64_t sub_1C1462F80()
{
  unint64_t result;

  result = qword_1EF6DEF00;
  if (!qword_1EF6DEF00)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466784, &type metadata for Alert.CoordinationState.RequestingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF00);
  }
  return result;
}

unint64_t sub_1C1462FC8()
{
  unint64_t result;

  result = qword_1EF6DEF08;
  if (!qword_1EF6DEF08)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146670C, &type metadata for Alert.CoordinationState.ThinkingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF08);
  }
  return result;
}

unint64_t sub_1C1463010()
{
  unint64_t result;

  result = qword_1EF6DEF10;
  if (!qword_1EF6DEF10)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466734, &type metadata for Alert.CoordinationState.ThinkingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF10);
  }
  return result;
}

unint64_t sub_1C1463058()
{
  unint64_t result;

  result = qword_1EF6DEF18;
  if (!qword_1EF6DEF18)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14667AC, &type metadata for Alert.CoordinationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF18);
  }
  return result;
}

unint64_t sub_1C14630A0()
{
  unint64_t result;

  result = qword_1EF6DEF20;
  if (!qword_1EF6DEF20)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14667D4, &type metadata for Alert.CoordinationState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF20);
  }
  return result;
}

unint64_t sub_1C14630E8()
{
  unint64_t result;

  result = qword_1EF6DEF28;
  if (!qword_1EF6DEF28)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466604, &type metadata for Alert.Necessity.OptionalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF28);
  }
  return result;
}

unint64_t sub_1C1463130()
{
  unint64_t result;

  result = qword_1EF6DEF30;
  if (!qword_1EF6DEF30)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146662C, &type metadata for Alert.Necessity.OptionalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF30);
  }
  return result;
}

unint64_t sub_1C1463178()
{
  unint64_t result;

  result = qword_1EF6DEF38;
  if (!qword_1EF6DEF38)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14665B4, &type metadata for Alert.Necessity.MandatoryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF38);
  }
  return result;
}

unint64_t sub_1C14631C0()
{
  unint64_t result;

  result = qword_1EF6DEF40;
  if (!qword_1EF6DEF40)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C14665DC, &type metadata for Alert.Necessity.MandatoryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF40);
  }
  return result;
}

unint64_t sub_1C1463208()
{
  unint64_t result;

  result = qword_1EF6DEF48;
  if (!qword_1EF6DEF48)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C1466654, &type metadata for Alert.Necessity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF48);
  }
  return result;
}

unint64_t sub_1C1463250()
{
  unint64_t result;

  result = qword_1EF6DEF50;
  if (!qword_1EF6DEF50)
  {
    result = MEMORY[0x1C3BADC2C](&unk_1C146667C, &type metadata for Alert.Necessity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6DEF50);
  }
  return result;
}

uint64_t sub_1C1463294(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C616E6F6974706FLL && a2 == 0xE800000000000000;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7461646E616DLL && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C1463384(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6974736575716572 && a2 == 0xEA0000000000676ELL;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696B6E696874 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C1463474(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x74754F64656D6974 && a2 == 0xE800000000000000;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656E696C636564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C146355C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x616E6964726F6F63 && a2 == 0xEC000000676E6974;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6579616C70736964 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1C14636B0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1C1465908();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1C146371C()
{
  return 12383;
}

uint64_t sub_1C1463728(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746973736563656ELL && a2 == 0xE900000000000079;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001C1467840 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001C1467860 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1C1463918(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x447373696D736964 && a2 == 0xEB00000000657461 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000 || (sub_1C1465908() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x79726F74736968 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1C1465908();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1C1463B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Alert(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_1C14640D4(a1);
    sub_1C14641E0(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1C14640D4((uint64_t)v10);
  }
  else
  {
    sub_1C1464308(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_1C1464EF4((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t InMemoryAlertStore.alerts.getter()
{
  return swift_bridgeObjectRetain();
}

SessionAlert::InMemoryAlertStore __swiftcall InMemoryAlertStore.init()()
{
  _QWORD *v0;
  SessionAlert::InMemoryAlertStore result;

  *v0 = MEMORY[0x1E0DEE9E0];
  return result;
}

uint64_t InMemoryAlertStore.alert(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = *v3;
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_1C145AEE8(a1, a2);
    if ((v9 & 1) != 0)
    {
      v10 = v8;
      v11 = *(_QWORD *)(v5 + 56);
      v12 = type metadata accessor for Alert(0);
      v13 = *(_QWORD *)(v12 - 8);
      sub_1C1464080(v11 + *(_QWORD *)(v13 + 72) * v10, a3);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a3, 0, 1, v12);
    }
    else
    {
      v16 = type metadata accessor for Alert(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    v14 = type metadata accessor for Alert(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a3, 1, 1, v14);
  }
}

uint64_t InMemoryAlertStore.update(alert:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *a1;
  v6 = a1[1];
  sub_1C1464080((uint64_t)a1, (uint64_t)v4);
  v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C1463B70((uint64_t)v4, v5, v6);
}

Swift::Void __swiftcall InMemoryAlertStore.remove(identifier:)(Swift::String identifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  object = identifier._object;
  countAndFlagsBits = identifier._countAndFlagsBits;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Alert(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_bridgeObjectRetain();
  sub_1C1463B70((uint64_t)v5, countAndFlagsBits, (uint64_t)object);
}

uint64_t sub_1C1463F20()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C1463F2C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *a1;
  v6 = a1[1];
  sub_1C1464080((uint64_t)a1, (uint64_t)v4);
  v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C1463B70((uint64_t)v4, v5, v6);
}

uint64_t sub_1C1463FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Alert(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_bridgeObjectRetain();
  return sub_1C1463B70((uint64_t)v6, a1, a2);
}

uint64_t sub_1C1464080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for InMemoryAlertStore()
{
  return &type metadata for InMemoryAlertStore;
}

uint64_t sub_1C14640D4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798A50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C1464114(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C145AEE8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C14650B0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1C14649C8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C14641E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1C145AEE8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C1465264();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for Alert(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_1C1464308(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_1C1464B9C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for Alert(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_1C1464308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C146434C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6DEF60);
  v36 = a2;
  v6 = sub_1C1465878();
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
      swift_retain();
    }
    sub_1C1465920();
    sub_1C1465770();
    result = sub_1C1465938();
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

uint64_t sub_1C1464660(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for Alert(0);
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEF58);
  v43 = a2;
  v9 = sub_1C1465878();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_1C1464308(v30, (uint64_t)v7);
    }
    else
    {
      sub_1C1464080(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_1C1465920();
    sub_1C1465770();
    result = sub_1C1465938();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_1C1464308((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_1C14649C8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C146580C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C1465920();
        swift_bridgeObjectRetain();
        sub_1C1465770();
        v9 = sub_1C1465938();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C1464B9C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C146580C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_1C1465920();
        swift_bridgeObjectRetain();
        sub_1C1465770();
        v9 = sub_1C1465938();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1C1464D98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1C145AEE8(a2, a3);
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
    sub_1C14650B0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
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
  sub_1C146434C(v15, a4 & 1);
  v21 = sub_1C145AEE8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C1465914();
  __break(1u);
  return result;
}

uint64_t sub_1C1464EF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1C145AEE8(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for Alert(0) - 8) + 72) * v12;
        return sub_1C1465490(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1C1465264();
      goto LABEL_7;
    }
    sub_1C1464660(v15, a4 & 1);
    v22 = sub_1C145AEE8(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C1465028(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C1465914();
  __break(1u);
  return result;
}

uint64_t sub_1C1465028(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for Alert(0);
  result = sub_1C1464308(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_1C14650B0()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6DEF60);
  v2 = *v0;
  v3 = sub_1C146586C();
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
    result = (void *)swift_retain();
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

void *sub_1C1465264()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for Alert(0);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6DEF58);
  v5 = *v0;
  v6 = sub_1C146586C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_1C1464080(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_1C1464308((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C1465490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Alert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of AlertStoring.alerts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AlertStoring.alert(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AlertStoring.update(alert:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AlertStoring.remove(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_1C14654F4()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1C1465500()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1C146550C()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1C1465518()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1C1465524()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1C1465530()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1C146553C()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1C1465548()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1C1465554()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1C1465560()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1C146556C()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1C1465578()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1C1465584()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_1C1465590()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1C146559C()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1C14655A8()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1C14655B4()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1C14655C0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C14655CC()
{
  return MEMORY[0x1E0C8FF30]();
}

uint64_t sub_1C14655D8()
{
  return MEMORY[0x1E0C901E0]();
}

uint64_t sub_1C14655E4()
{
  return MEMORY[0x1E0C901E8]();
}

uint64_t sub_1C14655F0()
{
  return MEMORY[0x1E0C901F0]();
}

uint64_t sub_1C14655FC()
{
  return MEMORY[0x1E0C901F8]();
}

uint64_t sub_1C1465608()
{
  return MEMORY[0x1E0C90200]();
}

uint64_t sub_1C1465614()
{
  return MEMORY[0x1E0C90208]();
}

uint64_t sub_1C1465620()
{
  return MEMORY[0x1E0D8CDA8]();
}

uint64_t sub_1C146562C()
{
  return MEMORY[0x1E0D8CDB0]();
}

uint64_t sub_1C1465638()
{
  return MEMORY[0x1E0D8CDB8]();
}

uint64_t sub_1C1465644()
{
  return MEMORY[0x1E0D8CDC0]();
}

uint64_t sub_1C1465650()
{
  return MEMORY[0x1E0D8D500]();
}

uint64_t sub_1C146565C()
{
  return MEMORY[0x1E0D8D508]();
}

uint64_t sub_1C1465668()
{
  return MEMORY[0x1E0D8D510]();
}

uint64_t sub_1C1465674()
{
  return MEMORY[0x1E0D8D518]();
}

uint64_t sub_1C1465680()
{
  return MEMORY[0x1E0D8D520]();
}

uint64_t sub_1C146568C()
{
  return MEMORY[0x1E0D8D528]();
}

uint64_t sub_1C1465698()
{
  return MEMORY[0x1E0D8D578]();
}

uint64_t sub_1C14656A4()
{
  return MEMORY[0x1E0D8D588]();
}

uint64_t sub_1C14656B0()
{
  return MEMORY[0x1E0D8D5B8]();
}

uint64_t sub_1C14656BC()
{
  return MEMORY[0x1E0D8D5C0]();
}

uint64_t sub_1C14656C8()
{
  return MEMORY[0x1E0D8D5C8]();
}

uint64_t sub_1C14656D4()
{
  return MEMORY[0x1E0D8D5D0]();
}

uint64_t sub_1C14656E0()
{
  return MEMORY[0x1E0D8D5D8]();
}

uint64_t sub_1C14656EC()
{
  return MEMORY[0x1E0D8D5E8]();
}

uint64_t sub_1C14656F8()
{
  return MEMORY[0x1E0C90220]();
}

uint64_t sub_1C1465704()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C1465710()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C146571C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C1465728()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C1465734()
{
  return MEMORY[0x1E0DEF590]();
}

uint64_t sub_1C1465740()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C146574C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1C1465758()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1C1465764()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C1465770()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C146577C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C1465788()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C1465794()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C14657A0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C14657AC()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C14657B8()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C14657C4()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1C14657D0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C14657DC()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C14657E8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C14657F4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C1465800()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C146580C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1C1465818()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C1465824()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C1465830()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1C146583C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1C1465848()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C1465854()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C1465860()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C146586C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C1465878()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C1465884()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C1465890()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C146589C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1C14658A8()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1C14658B4()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C14658C0()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C14658CC()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1C14658D8()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1C14658E4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C14658F0()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C14658FC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C1465908()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C1465914()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C1465920()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C146592C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C1465938()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C1465944()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C1465950()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C146595C()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C1465968()
{
  return MEMORY[0x1E0DEE8E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

