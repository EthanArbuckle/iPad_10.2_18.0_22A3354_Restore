uint64_t *sub_2460A3DC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(sub_2460ACDE8() + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 20);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_2460AD040();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954EF80]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2460A3EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(sub_2460ACDE8() + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 20);
  v8 = sub_2460AD040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_2460A3F84(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDE8() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A4044(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDE8() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A4104(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDE8() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A41C4(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDE8() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A4284()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A4290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_5();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2460A42F4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A4300(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_3();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_5();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for AppSearchResultsView()
{
  uint64_t result;

  result = qword_25753FB18;
  if (!qword_25753FB18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460A43A4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460ACDE8();
  if (v1 <= 0x3F)
  {
    result = sub_2460AD040();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460A4428()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2460A4438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB50);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v3 = sub_2460ACEB4();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB60);
  sub_2460A4568(v0, (uint64_t)&v3[*(int *)(v7 + 44)]);
  sub_2460A5154((uint64_t)v3, (uint64_t)v6, &qword_25753FB50);
  *(_WORD *)&v6[*(int *)(v4 + 36)] = 256;
  sub_2460A5520((uint64_t)v3, &qword_25753FB50);
  sub_2460A4FE0();
  sub_2460ACFBC();
  sub_2460A5520((uint64_t)v6, &qword_25753FB58);
}

uint64_t sub_2460A4568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  uint64_t *boxed_opaque_existential_1;
  objc_class *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(void);
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
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
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
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
  _QWORD v99[5];
  objc_super v100;
  uint64_t v101[6];

  v94 = a2;
  v89 = *(_QWORD *)(type metadata accessor for AppSearchResultsView() - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v90 = v3;
  v91 = (uint64_t)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_2460ACD1C();
  v71 = *(_QWORD *)(v79 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460ACD4C();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v70 = sub_2460AD010();
  v72 = *(_QWORD *)(v70 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB78);
  v73 = *(_QWORD *)(v74 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_2460AD094();
  v82 = *(_QWORD *)(v83 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB80);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v78 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB88);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v87 = (uint64_t)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB90);
  v85 = *(_QWORD *)(v93 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v84 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB98);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2460ACDD0();
  v75 = *(_QWORD *)(v15 - 8);
  v16 = *(_QWORD *)(v75 + 64);
  v17 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v80 = (uint64_t)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v69 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBA0);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v92 = (uint64_t)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v69 - v23;
  v25 = sub_2460ACDE8();
  v26 = MEMORY[0x24BE90A68];
  v101[3] = v25;
  v101[4] = MEMORY[0x24BE90A60];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v101);
  sub_2460A5180(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))v26);
  v28 = (objc_class *)type metadata accessor for AppResultsViewFeedbackDelegate();
  v29 = (char *)objc_allocWithZone(v28);
  v30 = &v29[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler];
  *(_QWORD *)v30 = 0;
  *((_QWORD *)v30 + 1) = 0;
  v100.receiver = v29;
  v100.super_class = v28;
  v101[5] = (uint64_t)objc_msgSendSuper2(&v100, sel_init);
  v88 = (char *)a1;
  sub_2460ACDDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_2460A5520((uint64_t)v14, &qword_25753FB98);
    v31 = 1;
    v32 = v93;
  }
  else
  {
    sub_2460A52E0((uint64_t)v14, (uint64_t)v19, (uint64_t (*)(_QWORD))MEMORY[0x24BE90A48]);
    sub_2460ACDAC();
    sub_2460ACD40();
    swift_bridgeObjectRelease();
    v33 = v6;
    sub_2460AD01C();
    v34 = v71;
    v35 = v77;
    v36 = v79;
    (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v77, *MEMORY[0x24BEAAC18], v79);
    sub_2460A547C(&qword_25753FBB0, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v38 = v37;
    v39 = v70;
    sub_2460ACF74();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v33, v39);
    v99[0] = v39;
    v99[1] = v38;
    swift_getOpaqueTypeConformance2();
    v40 = v74;
    v41 = sub_2460ACF5C();
    v42 = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v8, v40);
    v99[3] = MEMORY[0x24BDF4780];
    v99[4] = MEMORY[0x24BEAD938];
    v99[0] = v41;
    v43 = MEMORY[0x24954E9BC](v42);
    v97 = MEMORY[0x24BEE0D00];
    v98 = MEMORY[0x24BEAE5B8];
    v95 = v43;
    v96 = v44;
    v45 = v81;
    sub_2460AD088();
    LOBYTE(v41) = sub_2460ACF2C();
    v46 = v82;
    v47 = (uint64_t)v78;
    v48 = v83;
    (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v78, v45, v83);
    v49 = v47 + *(int *)(v76 + 36);
    *(_BYTE *)v49 = v41;
    *(_OWORD *)(v49 + 8) = 0u;
    *(_OWORD *)(v49 + 24) = 0u;
    *(_BYTE *)(v49 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v48);
    v50 = sub_2460ACFF8();
    v52 = v51;
    sub_2460ACFC8();
    v53 = sub_2460ACFD4();
    swift_release();
    v54 = v87;
    sub_2460A5154(v47, v87, &qword_25753FB80);
    v55 = (uint64_t *)(v54 + *(int *)(v86 + 36));
    *v55 = v53;
    v55[1] = v50;
    v55[2] = v52;
    sub_2460A5520(v47, &qword_25753FB80);
    v56 = v91;
    sub_2460A5180((uint64_t)v88, v91, (uint64_t (*)(_QWORD))type metadata accessor for AppSearchResultsView);
    v57 = (uint64_t)v19;
    v58 = v80;
    v88 = v19;
    v59 = MEMORY[0x24BE90A48];
    sub_2460A5180(v57, v80, (uint64_t (*)(_QWORD))MEMORY[0x24BE90A48]);
    v60 = (*(unsigned __int8 *)(v89 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
    v61 = (v90 + *(unsigned __int8 *)(v75 + 80) + v60) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    v62 = swift_allocObject();
    sub_2460A52E0(v56, v62 + v60, (uint64_t (*)(_QWORD))type metadata accessor for AppSearchResultsView);
    sub_2460A52E0(v58, v62 + v61, (uint64_t (*)(_QWORD))v59);
    sub_2460A5374();
    v63 = v84;
    sub_2460ACF80();
    swift_release();
    sub_2460A5520(v54, &qword_25753FB88);
    sub_2460A54E4((uint64_t)v88);
    v64 = v93;
    (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v24, v63, v93);
    v31 = 0;
    v32 = v64;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v24, v31, 1, v32);
  sub_2460A50E4((uint64_t)v101, (uint64_t)v99);
  v65 = v92;
  sub_2460A5154((uint64_t)v24, v92, &qword_25753FBA0);
  v66 = v94;
  sub_2460A50E4((uint64_t)v99, v94);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBA8);
  sub_2460A5154(v65, v66 + *(int *)(v67 + 48), &qword_25753FBA0);
  sub_2460A5520((uint64_t)v24, &qword_25753FBA0);
  sub_2460A5120((uint64_t)v101);
  sub_2460A5520(v65, &qword_25753FBA0);
  return sub_2460A5120((uint64_t)v99);
}

void sub_2460A4E08()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppSearchResultsView();
  sub_2460AD028();
  v6 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_2460A5520((uint64_t)v5, (uint64_t *)&unk_25753FC00);
  }
  else
  {
    sub_2460ACDC4();
    v7 = sub_2460ACD28();
    __swift_storeEnumTagSinglePayload((uint64_t)v3, 0, 1, v7);
    v8 = sub_2460AD064();
    __swift_storeEnumTagSinglePayload((uint64_t)v1, 1, 1, v8);
    sub_2460AD0DC();
    sub_2460A5520((uint64_t)v1, &qword_25753FBF0);
    sub_2460A5520((uint64_t)v3, &qword_25753FBF8);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
}

uint64_t sub_2460A4FC4()
{
  return sub_2460ACFB0();
}

unint64_t sub_2460A4FE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25753FB68;
  if (!qword_25753FB68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FB58);
    sub_2460A54B0(&qword_25753FB70, &qword_25753FB50);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x24954EF98](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25753FB68);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954EF8C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t sub_2460A50E4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AppSearchResultsBridgingView(a2, a1);
  return a2;
}

uint64_t sub_2460A5120(uint64_t a1)
{
  destroy for AppSearchResultsBridgingView(a1);
  return a1;
}

void sub_2460A5154(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_2();
}

void sub_2460A5180(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3);
  OUTLINED_FUNCTION_1(v3);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2460A51A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;
  void (*v17)(unint64_t);

  v1 = type metadata accessor for AppSearchResultsView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2460ACDD0();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FAB0);
  OUTLINED_FUNCTION_0();
  v9(v8);
  v10 = v8 + *(int *)(sub_2460ACDE8() + 20);
  __swift_instantiateConcreteTypeFromMangledName(qword_25753FAB8);
  OUTLINED_FUNCTION_0();
  v11(v10);
  v12 = v8 + *(int *)(v1 + 20);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  v13(v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v15 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
  v15(v0 + v7, v14);
  v15(v0 + v7 + *(int *)(v5 + 20), v14);
  v16 = v0 + v7 + *(int *)(v5 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  OUTLINED_FUNCTION_0();
  v17(v16);
  return swift_deallocObject();
}

void sub_2460A52E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_4(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void sub_2460A5314()
{
  type metadata accessor for AppSearchResultsView();
  sub_2460ACDD0();
  sub_2460A4E08();
}

unint64_t sub_2460A5374()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25753FBC8;
  if (!qword_25753FBC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FB88);
    v2 = sub_2460A53F8();
    sub_2460A54B0(&qword_25753FBE0, &qword_25753FBE8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24954EF98](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25753FBC8);
  }
  return result;
}

unint64_t sub_2460A53F8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25753FBD0;
  if (!qword_25753FBD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FB80);
    sub_2460A547C(&qword_25753FBD8, (void (*)(uint64_t))MEMORY[0x24BEADDA0]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24954EF98](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25753FBD0);
  }
  return result;
}

void sub_2460A547C(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_6();
  }
  OUTLINED_FUNCTION_2();
}

void sub_2460A54B0(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_6();
  }
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2460A54E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2460ACDD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2460A5520(uint64_t a1, uint64_t *a2)
{
  void (*v3)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0();
  v3(a1);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2460A5550()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FB58);
  sub_2460A4FE0();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_2460ACDE8();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_2460AD040();
}

void OUTLINED_FUNCTION_6()
{
  JUMPOUT(0x24954EF98);
}

void sub_2460A5600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_3_0();
  if (qword_25753FAA8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_257540660);
  OUTLINED_FUNCTION_5_0(v2);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_2460A5880()
{
  void *v0;
  void *v1;

  return swift_bridgeObjectRelease();
}

void sub_2460A589C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  unint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  uint64_t v14;

  v5 = OUTLINED_FUNCTION_13();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_0();
  if (qword_25753FAA8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v5, (uint64_t)qword_257540660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v7, v5);
  OUTLINED_FUNCTION_15();
  v8 = sub_2460ACE90();
  v9 = sub_2460AD10C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    v14 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v10 = 136315138;
    if (a2)
    {
      v11 = a2;
    }
    else
    {
      a1 = 7104878;
      v11 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_2460A5E48(a1, v11, &v14);
    sub_2460AD130();
    OUTLINED_FUNCTION_2_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2460A2000, v8, v9, "AppResultsViewFeedbackDelegate.lockupViewEngaged forAdamId: %s", v10, 0xCu);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_2_0();
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  v13 = *(void (**)(uint64_t))(v2
                                       + OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler);
  if (v13)
    v13(v12);
  OUTLINED_FUNCTION_1_0();
}

void sub_2460A5AFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_0();
  if (qword_25753FAA8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v2, (uint64_t)qword_257540660);
  OUTLINED_FUNCTION_5_0(v7);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_15();
  v8 = sub_2460ACE90();
  v9 = sub_2460AD10C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = OUTLINED_FUNCTION_4_0();
    v12 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v10 = 136315394;
    if (a2)
    {
      v11 = a2;
    }
    else
    {
      a1 = 7104878;
      v11 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_2460A5E48(a1, v11, &v12);
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_14();
    *(_WORD *)(v10 + 12) = 2080;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_12(&dword_2460A2000, v8, v9, "AppResultsViewFeedbackDelegate.lockupView forAdamId: %s state: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_1_0();
}

void sub_2460A5D94()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2460A5DCC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppResultsViewFeedbackDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppResultsViewFeedbackDelegate()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2460A5E48(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2460A5F18(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2460A608C((uint64_t)v12, *a3);
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
      sub_2460A608C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2460A5F18(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2460A60C8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2460AD13C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2460A618C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2460AD154();
    if (!v8)
    {
      result = sub_2460AD160();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2460A608C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_2460A60C8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2460AD16C();
  __break(1u);
  return result;
}

uint64_t sub_2460A618C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2460A6220(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2460A63F4(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2460A63F4((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2460A6220(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2460AD100();
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
  v3 = sub_2460A6390(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2460AD148();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2460AD16C();
  __break(1u);
LABEL_14:
  result = sub_2460AD160();
  __break(1u);
  return result;
}

_QWORD *sub_2460A6390(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FCA0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2460A63F4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25753FCA0);
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
    sub_2460A658C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2460A64C8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2460A64C8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2460AD16C();
  __break(1u);
  return result;
}

char *sub_2460A658C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2460AD16C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2460A6610(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void OUTLINED_FUNCTION_0_0()
{
  JUMPOUT(0x24954EFECLL);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, a1, v1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_2460A5E48(v0, v1, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_2460AD130();
}

void OUTLINED_FUNCTION_9()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_2460ACE9C();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_17()
{
  JUMPOUT(0x24954EF14);
}

uint64_t sub_2460A6704()
{
  uint64_t result;

  sub_2460A6764();
  result = sub_2460AD124();
  qword_257540658 = result;
  return result;
}

unint64_t sub_2460A6764()
{
  unint64_t result;

  result = qword_25753FD70;
  if (!qword_25753FD70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25753FD70);
  }
  return result;
}

uint64_t *sub_2460A67A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
    v7 = sub_2460AD040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(sub_2460ACE0C() + 20);
    v13 = &v9[v12];
    v14 = &v10[v12];
    v15 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_2460A6884(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v5 + *(int *)(sub_2460ACE0C() + 20);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_2460A6914(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE0C() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A69CC(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE0C() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A6A84(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE0C() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A6B3C(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE0C() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A6BF4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A6C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_5();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_5_1();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2460A6C60()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A6C6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_5();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_5_1();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for AppDisambiguationView()
{
  uint64_t result;

  result = qword_25753FDD8;
  if (!qword_25753FDD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460A6D0C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460AD040();
  if (v1 <= 0x3F)
  {
    result = sub_2460ACE0C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460A6D90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2460A6DA0()
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
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_1_1();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460A7CD4(v1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  sub_2460A7E30((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE18);
  sub_2460A54B0(&qword_25753FE20, &qword_25753FE18);
  sub_2460AD058();
  sub_2460A54B0(&qword_25753FE28, &qword_25753FE10);
  sub_2460ACFBC();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2460A6F24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = type metadata accessor for AppDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_2460AD0D0();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24954E9F8](v6);
  v16 = MEMORY[0x24BEE0D00];
  v17 = MEMORY[0x24BEAE5B8];
  v14 = v7;
  v15 = v8;
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  sub_2460AD0C4();
  sub_2460A7CD4(a1, (uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  sub_2460A7E30((uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE30);
  sub_2460A7AB4();
  return sub_2460AD0A0();
}

uint64_t sub_2460A7090(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v2 = type metadata accessor for AppDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v10[3] = sub_2460ACE00();
  swift_getKeyPath();
  sub_2460A7CD4(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_2460A7E30((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE50);
  sub_2460A54B0(&qword_25753FE58, &qword_25753FE48);
  sub_2460A547C(&qword_25753FE60, (void (*)(uint64_t))MEMORY[0x24BE909F0]);
  v7 = sub_2460AD0B8();
  sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  return sub_2460ACFEC();
}

uint64_t sub_2460A7244@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  void (*v17)(uint64_t);
  uint64_t v18;
  char *v19;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
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
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v62 = a2;
  v55 = a1;
  v72 = a3;
  v3 = sub_2460ACD88();
  v63 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v64 = v4;
  v67 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AppDisambiguationView();
  v59 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v60 = v6;
  v61 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2460AD0B8();
  v70 = *(_QWORD *)(v7 - 8);
  v71 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE50);
  v66 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v65 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE68);
  MEMORY[0x24BDAC7A8](v57);
  v56 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2460ACD1C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2460ACD4C();
  MEMORY[0x24BDAC7A8](v15);
  v16 = sub_2460AD010();
  v17 = (void (*)(uint64_t))MEMORY[0x24BEADA38];
  v58 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FB78);
  v21 = *(_QWORD *)(v20 - 8);
  v53 = v20;
  v54 = v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460ACD7C();
  sub_2460ACD40();
  swift_bridgeObjectRelease();
  sub_2460AD01C();
  v24 = *MEMORY[0x24BEAAC20];
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
  v48 = v11;
  v52(v14, v24, v11);
  sub_2460A547C(&qword_25753FBB0, v17);
  v26 = v25;
  sub_2460ACF74();
  v51 = *(void (**)(char *, uint64_t))(v12 + 8);
  v51(v14, v11);
  v50 = *(void (**)(char *, uint64_t))(v58 + 8);
  v50(v19, v16);
  v97 = v16;
  v98 = v26;
  swift_getOpaqueTypeConformance2();
  v27 = v53;
  v58 = sub_2460ACF5C();
  v28 = v54;
  v49 = *(void (**)(char *, uint64_t))(v54 + 8);
  v49(v23, v27);
  sub_2460ACD34();
  sub_2460AD01C();
  v29 = v48;
  v52(v14, *MEMORY[0x24BEAAC18], v48);
  sub_2460ACF74();
  v51(v14, v29);
  v50(v19, v16);
  v30 = (uint64_t)v56;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v56, v23, v27);
  *(_QWORD *)(v30 + *(int *)(v57 + 36)) = 0x3FD999999999999ALL;
  v31 = v23;
  v32 = v55;
  v49(v31, v27);
  sub_2460A7C2C();
  v33 = sub_2460ACF5C();
  sub_2460A7EB8(v30, &qword_25753FE68);
  v34 = MEMORY[0x24954E974]();
  v99 = MEMORY[0x24BEE0D00];
  v100 = MEMORY[0x24BEAE5B8];
  v97 = v34;
  v98 = v35;
  v96 = 0;
  v94 = 0u;
  v95 = 0u;
  v93 = 0;
  v91 = 0u;
  v92 = 0u;
  v36 = sub_2460ACD58();
  v57 = v33;
  if ((v36 & 1) != 0)
    v37 = swift_retain();
  else
    v37 = sub_2460ACF5C();
  v89 = MEMORY[0x24BDF4780];
  v90 = MEMORY[0x24BEAD938];
  v87 = 0;
  v88 = v37;
  v85 = 0u;
  v86 = 0u;
  v84 = 0;
  v82 = 0u;
  v83 = 0u;
  v81 = 0;
  v79 = 0u;
  v80 = 0u;
  v78 = 0;
  v76 = 0u;
  v77 = 0u;
  v74 = MEMORY[0x24BDF4780];
  v75 = MEMORY[0x24BEAD938];
  v73 = v58;
  swift_retain();
  v38 = v69;
  sub_2460AD0AC();
  v39 = v61;
  sub_2460A7CD4(v62, v61, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  v40 = MEMORY[0x24BE909F0];
  v41 = v67;
  sub_2460A7CD4(v32, v67, (uint64_t (*)(_QWORD))MEMORY[0x24BE909F0]);
  v42 = (*(unsigned __int8 *)(v59 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  v43 = (v60 + *(unsigned __int8 *)(v63 + 80) + v42) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  v44 = swift_allocObject();
  sub_2460A7E30(v39, v44 + v42, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  sub_2460A7E30(v41, v44 + v43, (uint64_t (*)(_QWORD))v40);
  sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v45 = v65;
  v46 = v71;
  sub_2460ACF80();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v38, v46);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v66 + 32))(v72, v45, v68);
}

void sub_2460A78B0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460AD028();
  v9 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_2460A7EB8((uint64_t)v8, (uint64_t *)&unk_25753FC00);
  }
  else
  {
    sub_2460ACD64();
    v10 = sub_2460ACD28();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v10);
    v11 = sub_2460AD064();
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v11);
    sub_2460AD0DC();
    sub_2460A7EB8((uint64_t)v2, &qword_25753FBF0);
    sub_2460A7EB8((uint64_t)v5, &qword_25753FBF8);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
}

uint64_t sub_2460A7A5C()
{
  return sub_2460A7A78(sub_2460A6F24);
}

uint64_t sub_2460A7A6C()
{
  return sub_2460A7A78(sub_2460A7090);
}

uint64_t sub_2460A7A78(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11_0();
  return a1(v1 + v2);
}

unint64_t sub_2460A7AB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_25753FE38;
  if (!qword_25753FE38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FE30);
    v2 = sub_2460AD0B8();
    sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
    v4[1] = v2;
    v4[2] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24954EF98](MEMORY[0x24BDF4A08], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25753FE38);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_1();
  v0 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_1(v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  OUTLINED_FUNCTION_0_1(v1);
  OUTLINED_FUNCTION_5_1();
  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  OUTLINED_FUNCTION_0_1(v2);
  return swift_deallocObject();
}

uint64_t sub_2460A7BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11_0();
  return sub_2460A7244(a1, v2 + v5, a2);
}

unint64_t sub_2460A7C2C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_25753FE70;
  if (!qword_25753FE70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FE68);
    v2 = sub_2460AD010();
    sub_2460A547C(&qword_25753FBB0, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v4[2] = v2;
    v4[3] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x24954EF98](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25753FE70);
  }
  return result;
}

void sub_2460A7CD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3);
  OUTLINED_FUNCTION_8_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2460A7D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = OUTLINED_FUNCTION_1_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2460ACD88();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(v8);
  v9 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  OUTLINED_FUNCTION_9_0(v9);
  OUTLINED_FUNCTION_5_1();
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FD78);
  OUTLINED_FUNCTION_3_1(v10);
  OUTLINED_FUNCTION_9_0(v0 + v7);
  OUTLINED_FUNCTION_9_0(v0 + v7 + *(int *)(v5 + 20));
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25753FE78);
  OUTLINED_FUNCTION_2_1(v11);
  v12 = v0 + v7 + *(int *)(v5 + 28);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return swift_deallocObject();
}

void sub_2460A7E30(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4(a1, a2, a3);
  OUTLINED_FUNCTION_8_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_2();
}

void sub_2460A7E5C()
{
  OUTLINED_FUNCTION_1_1();
  sub_2460ACD88();
  sub_2460A78B0();
}

void sub_2460A7EB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_1(v2);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2460A7EE0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FE10);
  sub_2460A54B0(&qword_25753FE28, &qword_25753FE10);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return type metadata accessor for AppDisambiguationView();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_2460ACE0C();
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t *sub_2460A7FB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2460AD040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v13 = (int *)sub_2460ACE3C();
    v14 = v13[5];
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    v12(&v9[v13[6]], &v10[v13[6]], v11);
    v18(&v9[v13[7]], &v10[v13[7]], v17);
  }
  return a1;
}

uint64_t sub_2460A80E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t);

  v4 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (int *)sub_2460ACE3C();
  v9 = v5 + v8[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v12(v9, v10);
  v7(v5 + v8[6], v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v5 + v8[7], v10);
}

uint64_t sub_2460A81C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v12 = (int *)sub_2460ACE3C();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t sub_2460A82CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = (int *)sub_2460ACE3C();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t sub_2460A83D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = (int *)sub_2460ACE3C();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t sub_2460A84D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = (int *)sub_2460ACE3C();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t sub_2460A85D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A85E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_6_1();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_2460A863C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A8648(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_4_1();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_6_1();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result;

  result = qword_25753FED8;
  if (!qword_25753FED8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460A86E0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460AD040();
  if (v1 <= 0x3F)
  {
    result = sub_2460ACE3C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460A8764()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2460A8774@<X0>(uint64_t a1@<X8>)
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
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
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v53 = a1;
  v2 = sub_2460AD07C();
  v3 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  v52 = v3;
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_2();
  v50 = v6 - v5;
  v46 = sub_2460AD004();
  v7 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_2_2();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FF10);
  v45 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0_2();
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FF18);
  v49 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_1_2();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v47 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v44 = (char *)&v38 - v19;
  v39 = v1;
  OUTLINED_FUNCTION_5_2();
  v20 = *(unsigned __int8 *)(v12 + 80);
  v43 = ((v20 + 16) & ~v20) + v13;
  v42 = v20 | 7;
  v21 = swift_allocObject();
  OUTLINED_FUNCTION_8_1(v21);
  v55 = v1;
  sub_2460ACFE0();
  v22 = *MEMORY[0x24BEAD978];
  v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
  v23 = v46;
  v41(v10, v22, v46);
  v24 = sub_2460A8E0C();
  OUTLINED_FUNCTION_3_2();
  v40 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v40(v10, v23);
  OUTLINED_FUNCTION_7_0();
  v25 = v39;
  OUTLINED_FUNCTION_5_2();
  v26 = swift_allocObject();
  OUTLINED_FUNCTION_8_1(v26);
  v54 = v25;
  sub_2460ACFE0();
  v41(v10, *MEMORY[0x24BEAD970], v23);
  v27 = v47;
  OUTLINED_FUNCTION_3_2();
  v40(v10, v23);
  OUTLINED_FUNCTION_7_0();
  v59 = v14;
  v60 = v24;
  swift_getOpaqueTypeConformance2();
  v28 = v48;
  v29 = v44;
  v30 = sub_2460ACF5C();
  v31 = MEMORY[0x24BDF4780];
  v32 = MEMORY[0x24BEAD938];
  v61 = MEMORY[0x24BDF4780];
  v62 = MEMORY[0x24BEAD938];
  v59 = v30;
  v33 = sub_2460ACF5C();
  v57 = v31;
  v58 = v32;
  v56 = v33;
  v34 = v50;
  sub_2460AD070();
  sub_2460A8FC4();
  v35 = v51;
  sub_2460ACFBC();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v34, v35);
  v36 = *(void (**)(char *, uint64_t))(v49 + 8);
  v36(v27, v28);
  return ((uint64_t (*)(char *, uint64_t))v36)(v29, v28);
}

uint64_t sub_2460A8B58(uint64_t a1, void (*a2)(void))
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
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_2();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_2();
  v14 = v13 - v12;
  sub_2460AD028();
  v15 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1)
    return sub_2460A9040(v14, (uint64_t *)&unk_25753FC00);
  OUTLINED_FUNCTION_2_2();
  a2();
  v17 = sub_2460ACD28();
  __swift_storeEnumTagSinglePayload(v10, 0, 1, v17);
  v18 = sub_2460AD064();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v18);
  sub_2460AD0DC();
  sub_2460A9040(v6, &qword_25753FBF0);
  sub_2460A9040(v10, &qword_25753FBF8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
}

uint64_t sub_2460A8CE0@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2_2();
  a1();
  sub_2460A9004();
  result = sub_2460ACF50();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_2460A8D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460A8D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460A8DE0()
{
  return sub_2460A8F68(MEMORY[0x24BE90AC8]);
}

uint64_t sub_2460A8DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_2460A8CE0(MEMORY[0x24BE90AC0], a1);
}

unint64_t sub_2460A8E0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25753FF20;
  if (!qword_25753FF20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FF10);
    result = MEMORY[0x24954EF98](MEMORY[0x24BDF43B0], v1);
    atomic_store(result, (unint64_t *)&qword_25753FF20);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_2_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v3 + *(int *)(v1 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (int *)OUTLINED_FUNCTION_6_1();
  v9 = v5 + v8[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v7(v5 + v8[6], v6);
  v11(v5 + v8[7], v10);
  return swift_deallocObject();
}

uint64_t sub_2460A8F5C()
{
  return sub_2460A8F68(MEMORY[0x24BE90AD8]);
}

uint64_t sub_2460A8F68(void (*a1)(void))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_2() - 8) + 80);
  return sub_2460A8B58(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_2460A8FA4@<X0>(uint64_t a1@<X8>)
{
  return sub_2460A8CE0(MEMORY[0x24BE90AD0], a1);
}

unint64_t sub_2460A8FC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25753FF28;
  if (!qword_25753FF28)
  {
    v1 = sub_2460AD07C();
    result = MEMORY[0x24954EF98](MEMORY[0x24BEADCC0], v1);
    atomic_store(result, (unint64_t *)&qword_25753FF28);
  }
  return result;
}

unint64_t sub_2460A9004()
{
  unint64_t result;

  result = qword_25753FF30;
  if (!qword_25753FF30)
  {
    result = MEMORY[0x24954EF98](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25753FF30);
  }
  return result;
}

uint64_t sub_2460A9040(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2460A907C()
{
  sub_2460AD07C();
  sub_2460A8FC4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return type metadata accessor for ConfirmationView();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_2460ACF68();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_2460AD040();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2460A8D54(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_2460ACE3C();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2460A8D9C(v1, a1 + v2);
}

uint64_t *sub_2460A9138(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
    v7 = sub_2460AD040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(sub_2460ACE30() + 20);
    v13 = &v9[v12];
    v14 = &v10[v12];
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_2460A921C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v5 + *(int *)(sub_2460ACE30() + 20);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_2460A92AC(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE30() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A9364(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE30() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A941C(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE30() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A94D4(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(sub_2460ACE30() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460A958C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A9598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_4_1();
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

uint64_t sub_2460A95F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460A95FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_4_1();
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

uint64_t type metadata accessor for ButtonFallbackView()
{
  uint64_t result;

  result = qword_25753FF90;
  if (!qword_25753FF90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460A9694()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460AD040();
  if (v1 <= 0x3F)
  {
    result = sub_2460ACE30();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460A9718()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2460A9728@<X0>(uint64_t a1@<X8>)
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
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v25 = a1;
  v2 = sub_2460AD04C();
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_2();
  v5 = v4 - v3;
  v6 = OUTLINED_FUNCTION_4_2();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FF10);
  v22 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_2();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FFC8);
  v23 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_2();
  v16 = v15 - v14;
  sub_2460A9BEC(v1, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  sub_2460A9CDC((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  v26 = v1;
  sub_2460ACFE0();
  sub_2460ACEC0();
  v19 = sub_2460A8E0C();
  v20 = sub_2460A9D50();
  sub_2460ACFA4();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v9);
  v27 = v9;
  v28 = v2;
  v29 = v19;
  v30 = v20;
  swift_getOpaqueTypeConformance2();
  sub_2460ACFBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v16, v13);
}

uint64_t sub_2460A9958()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460AD028();
  v9 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
    return sub_2460A9DA0((uint64_t)v8, (uint64_t *)&unk_25753FC00);
  type metadata accessor for ButtonFallbackView();
  sub_2460ACE24();
  v11 = sub_2460ACD28();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  v12 = sub_2460AD064();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_2460AD0DC();
  sub_2460A9DA0((uint64_t)v2, &qword_25753FBF0);
  sub_2460A9DA0((uint64_t)v5, &qword_25753FBF8);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_2460A9B04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  type metadata accessor for ButtonFallbackView();
  MEMORY[0x24954EA1C]();
  sub_2460A9004();
  v2 = sub_2460ACF50();
  v4 = v3;
  v6 = v5 & 1;
  sub_2460ACF38();
  v7 = sub_2460ACF44();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_2460A9D90(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_2460A9BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ButtonFallbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460A9C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_2() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  OUTLINED_FUNCTION_0_1(v4);
  OUTLINED_FUNCTION_3_3();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  OUTLINED_FUNCTION_0_1(v5);
  return swift_deallocObject();
}

uint64_t sub_2460A9CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ButtonFallbackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460A9D20()
{
  OUTLINED_FUNCTION_4_2();
  return sub_2460A9958();
}

uint64_t sub_2460A9D48@<X0>(uint64_t a1@<X8>)
{
  return sub_2460A9B04(a1);
}

unint64_t sub_2460A9D50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25753FFD0;
  if (!qword_25753FFD0)
  {
    v1 = sub_2460AD04C();
    result = MEMORY[0x24954EF98](MEMORY[0x24BEADB70], v1);
    atomic_store(result, (unint64_t *)&qword_25753FFD0);
  }
  return result;
}

uint64_t sub_2460A9D90(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_2460A9DA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_1(v3);
  return a1;
}

uint64_t sub_2460A9DCC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FFC8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FF10);
  sub_2460AD04C();
  sub_2460A8E0C();
  sub_2460A9D50();
  OUTLINED_FUNCTION_5_3();
  return OUTLINED_FUNCTION_5_3();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_2460ACE30();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return type metadata accessor for ButtonFallbackView();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_2460A9E6C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id result;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_2460ACE9C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  if (qword_25753FAA8 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v2, (uint64_t)qword_257540660);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v11 = sub_2460ACE90();
  v12 = sub_2460AD10C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2460A2000, v11, v12, "AppSearchResultsBridgingView.makeUIViewController: returning SearchFoundation card for rendering app result view", v13, 2u);
    MEMORY[0x24954EFEC](v13, -1, -1);
  }

  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  v15 = v1[3];
  v16 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v15);
  v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  sub_2460AA56C();
  v18 = (void *)v1[5];
  v19 = v17;
  v20 = v18;
  v21 = sub_2460AA128(v17, (uint64_t)v18);
  if (!v21)
  {
    v10(v6, v9, v2);
    v25 = sub_2460ACE90();
    v26 = sub_2460AD118();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2460A2000, v25, v26, "AppSearchResultsBridgingView.makeNSViewController: did not get back a rendered SearchUICardViewController from SearchUI, failing...", v27, 2u);
      MEMORY[0x24954EFEC](v27, -1, -1);
    }

    v14(v6, v2);
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE85238]), sel_init);
    goto LABEL_11;
  }
  v22 = v21;
  objc_msgSend(v21, sel_setScrollEnabled_, 0);
  result = objc_msgSend(v22, sel_view);
  if (result)
  {
    v24 = result;
    objc_msgSend(result, sel__setOverrideVibrancyTrait_, 0);

    v19 = v24;
LABEL_11:

    return v22;
  }
  __break(1u);
  return result;
}

id sub_2460AA128(void *a1, uint64_t a2)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCard_feedbackListener_, a1, a2);

  swift_unknownObjectRelease();
  return v3;
}

id sub_2460AA184()
{
  id v0;
  void *v2;

  v0 = sub_2460A9E6C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257540070);
  sub_2460ACF20();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

id sub_2460AA1F4()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator()), sel_init);
}

double sub_2460AA214(uint64_t a1, char a2, int a3, int a4, id a5)
{
  double result;
  double v8;

  objc_msgSend(a5, sel_preferredContentSize);
  v8 = *(double *)&a1;
  if ((a2 & 1) != 0)
    v8 = 100.0;
  if (result == 0.0)
    return v8;
  return result;
}

void sub_2460AA28C(void *a1)
{
  id v1;
  id v2;

  if (a1)
  {
    v1 = objc_msgSend(a1, sel_view);
    if (v1)
    {
      v2 = v1;
      objc_msgSend(v1, sel_invalidateIntrinsicContentSize);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_2460AA330()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_2460AA380()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSearchResultsBridgingView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppSearchResultsBridgingView.Coordinator()
{
  return objc_opt_self();
}

uint64_t sub_2460AA3D0()
{
  return MEMORY[0x24BDF5560];
}

id sub_2460AA3E8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_2460AA1F4();
  *a1 = result;
  return result;
}

double sub_2460AA40C(uint64_t a1, char a2, int a3, char a4, void *a5)
{
  return sub_2460AA214(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_2460AA444()
{
  sub_2460AA5B8();
  return sub_2460ACF14();
}

uint64_t sub_2460AA494()
{
  sub_2460AA5B8();
  return sub_2460ACEE4();
}

void sub_2460AA4E4()
{
  sub_2460AA5B8();
  sub_2460ACF08();
  __break(1u);
}

unint64_t sub_2460AA50C()
{
  unint64_t result;

  result = qword_257540068;
  if (!qword_257540068)
  {
    result = MEMORY[0x24954EF98](&unk_2460AD7E0, &type metadata for AppSearchResultsBridgingView);
    atomic_store(result, (unint64_t *)&qword_257540068);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2460AA56C()
{
  unint64_t result;

  result = qword_257540078;
  if (!qword_257540078)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257540078);
  }
  return result;
}

uint64_t sub_2460AA5A8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_2460AA5B8()
{
  unint64_t result;

  result = qword_257540080;
  if (!qword_257540080)
  {
    result = MEMORY[0x24954EF98](&unk_2460AD830, &type metadata for AppSearchResultsBridgingView);
    atomic_store(result, (unint64_t *)&qword_257540080);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppSearchResultsBridgingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AppSearchResultsBridgingView(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);

}

uint64_t initializeWithCopy for AppSearchResultsBridgingView(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  id v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for AppSearchResultsBridgingView(uint64_t *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  id v6;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = (void *)a2[5];
  v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  v6 = v4;

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

uint64_t assignWithTake for AppSearchResultsBridgingView(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSearchResultsBridgingView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSearchResultsBridgingView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSearchResultsBridgingView()
{
  return &type metadata for AppSearchResultsBridgingView;
}

uint64_t *sub_2460AA924(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(sub_2460ACDA0() + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 20);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_2460AD040();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_2460AAA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(sub_2460ACDA0() + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 20);
  v8 = sub_2460AD040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_2460AAAA8(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDA0() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460AAB68(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDA0() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460AAC28(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDA0() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460AACE8(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(sub_2460ACDA0() + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_2460AADA8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460AADB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_5();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2460AAE14()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460AAE20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_1_3();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_5();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for AppOffloadedView()
{
  uint64_t result;

  result = qword_2575400F8;
  if (!qword_2575400F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460AAEC0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460ACDA0();
  if (v1 <= 0x3F)
  {
    result = sub_2460AD040();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460AAF44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2460AAF54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t *boxed_opaque_existential_1;
  unint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t (**v11)();
  id v12;
  uint64_t v14;
  objc_super v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[40];
  id v20;

  v1 = OUTLINED_FUNCTION_2_3();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = OUTLINED_FUNCTION_1_3();
  v5 = MEMORY[0x24BE90A20];
  v17 = v4;
  v18 = MEMORY[0x24BE90A18];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
  sub_2460AB328(v0, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))v5);
  sub_2460AB328(v0, (uint64_t)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AppOffloadedView);
  v7 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v8 = swift_allocObject();
  sub_2460AB424((uint64_t)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  v9 = (objc_class *)type metadata accessor for AppResultsViewFeedbackDelegate();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = (uint64_t (**)())&v10[OBJC_IVAR____TtC24SiriAppLaunchUIFramework30AppResultsViewFeedbackDelegate_lockupViewEngagedHandler];
  *v11 = sub_2460AB468;
  v11[1] = (uint64_t (*)())v8;
  v15.receiver = v10;
  v15.super_class = v9;
  v12 = objc_msgSendSuper2(&v15, sel_init);
  sub_2460AB490(&v16, (uint64_t)v19);
  v20 = v12;
  sub_2460AA50C();
  sub_2460ACFBC();
  return sub_2460A5120((uint64_t)v19);
}

uint64_t sub_2460AB0B4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v21 - v10;
  v12 = sub_2460ACD28();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460ACD94();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    v16 = &qword_25753FBF8;
    v17 = (uint64_t)v11;
    return sub_2460A9DA0(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  type metadata accessor for AppOffloadedView();
  sub_2460AD028();
  v18 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v16 = (uint64_t *)&unk_25753FC00;
    v17 = (uint64_t)v5;
    return sub_2460A9DA0(v17, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  v20 = sub_2460AD064();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v20);
  sub_2460AD0DC();
  sub_2460A9DA0((uint64_t)v2, &qword_25753FBF0);
  sub_2460A9DA0((uint64_t)v9, &qword_25753FBF8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v5, v18);
}

uint64_t sub_2460AB328(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2460AB36C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_3() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540090);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = v2 + *(int *)(OUTLINED_FUNCTION_1_3() + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_257540098);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(v6);
  return swift_deallocObject();
}

uint64_t sub_2460AB424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppOffloadedView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460AB468()
{
  OUTLINED_FUNCTION_2_3();
  return sub_2460AB0B4();
}

uint64_t sub_2460AB490(__int128 *a1, uint64_t a2)
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

uint64_t sub_2460AB4A8()
{
  sub_2460AA50C();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_2460ACDA0();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for AppOffloadedView();
}

void static SnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
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
  uint64_t (*v16)(_QWORD);
  char *v17;

  type metadata accessor for AppOffloadedView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  sub_2460ACDA0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  type metadata accessor for AppSearchResultsView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  sub_2460ACDE8();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  sub_2460ACE3C();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  type metadata accessor for DeviceDisambiguationView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3();
  sub_2460ACE54();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_2();
  type metadata accessor for ButtonFallbackView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_2();
  sub_2460ACE30();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_2();
  type metadata accessor for AppDisambiguationView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_2();
  sub_2460ACE0C();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0_2();
  sub_2460ACE84();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_2();
  sub_2460A7CD4(a1, v15 - v14, v16);
  v17 = (char *)sub_2460AB72C + 4 * byte_2460AD940[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2460AB72C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;

  v4 = MEMORY[0x24BE90A88];
  sub_2460A7E30(v0, v2, (uint64_t (*)(_QWORD))MEMORY[0x24BE90A88]);
  OUTLINED_FUNCTION_5_4(v2, v1 + *(int *)(v3 + 20));
  OUTLINED_FUNCTION_8_2();
  sub_2460AB98C(qword_257540158, (uint64_t (*)(uint64_t))type metadata accessor for AppDisambiguationView, (uint64_t)&unk_2460AD5F8);
  v5 = sub_2460ACF5C();
  sub_2460AB9C8(v1, (uint64_t (*)(_QWORD))type metadata accessor for AppDisambiguationView);
  sub_2460AB9C8(v2, (uint64_t (*)(_QWORD))v4);
  return v5;
}

void sub_2460AB98C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24954EF98](a3, v5), a1);
  }
  OUTLINED_FUNCTION_2();
}

void sub_2460AB9C8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_2();
}

ValueMetadata *type metadata accessor for SnippetProvider()
{
  return &type metadata for SnippetProvider;
}

void OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_2460A7E30(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return 0;
}

void OUTLINED_FUNCTION_5_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_2460A7CD4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_2460AD034();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_2460AD034();
}

uint64_t *sub_2460ABA68(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2460AD040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = sub_2460ACE54();
    *(_QWORD *)&v9[*(int *)(v12 + 20)] = *(_QWORD *)&v10[*(int *)(v12 + 20)];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2460ABB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_2460ACE54();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460ABBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = sub_2460ACE54();
  *(_QWORD *)(v8 + *(int *)(v11 + 20)) = *(_QWORD *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2460ABC38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = sub_2460ACE54();
  *(_QWORD *)(v8 + *(int *)(v11 + 20)) = *(_QWORD *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2460ABCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = sub_2460ACE54();
  *(_QWORD *)(v8 + *(int *)(v11 + 20)) = *(_QWORD *)(v9 + *(int *)(v11 + 20));
  return a1;
}

uint64_t sub_2460ABD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2460AD040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = sub_2460ACE54();
  *(_QWORD *)(v8 + *(int *)(v11 + 20)) = *(_QWORD *)(v9 + *(int *)(v11 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2460ABE0C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460ABE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_5();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_5();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2460ABE78()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2460ABE84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_5();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_5();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for DeviceDisambiguationView()
{
  uint64_t result;

  result = qword_2575401B8;
  if (!qword_2575401B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2460ABF24()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2460AD040();
  if (v1 <= 0x3F)
  {
    result = sub_2460ACE54();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2460ABFA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2460ABFB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_0_4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_2460A7CD4(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_2460A7E30((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575401F0);
  sub_2460A54B0(&qword_2575401F8, &qword_2575401F0);
  return sub_2460AD058();
}

uint64_t sub_2460AC0AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = type metadata accessor for DeviceDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_2460AD0D0();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24954EA4C](v6);
  v16 = MEMORY[0x24BEE0D00];
  v17 = MEMORY[0x24BEAE5B8];
  v14 = v7;
  v15 = v8;
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  sub_2460AD0C4();
  sub_2460A7CD4(a1, (uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  sub_2460A7E30((uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257540200);
  sub_2460AC914();
  return sub_2460AD0A0();
}

uint64_t sub_2460AC218(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = type metadata accessor for DeviceDisambiguationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = a1 + *(int *)(MEMORY[0x24BDAC7A8](v2) + 20);
  v16 = *(_QWORD *)(v5 + *(int *)(sub_2460ACE54() + 20));
  swift_getKeyPath();
  sub_2460A7CD4(a1, (uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_2460A7E30((uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257540210);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257540218);
  sub_2460A54B0(&qword_257540220, &qword_257540210);
  sub_2460A547C(&qword_257540228, (void (*)(uint64_t))MEMORY[0x24BE90B18]);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FE50);
  v9 = sub_2460AD0B8();
  sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v14 = v9;
  v15 = v10;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v14 = v8;
  v15 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  return sub_2460ACFEC();
}

uint64_t sub_2460AC410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v30 = a2;
  v36 = a3;
  v4 = sub_2460ACE78();
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v31 = *(_QWORD *)(v4 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DeviceDisambiguationView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2460AD0B8();
  v33 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FE50);
  v16 = *(_QWORD *)(v15 - 8);
  v34 = v15;
  v35 = v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24954EA70](v17);
  v63 = MEMORY[0x24BEE0D00];
  v64 = MEMORY[0x24BEAE5B8];
  v61 = v20;
  v62 = v21;
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  sub_2460AD0AC();
  sub_2460A7CD4(v30, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  sub_2460A7CD4(a1, (uint64_t)v7, (uint64_t (*)(_QWORD))MEMORY[0x24BE90B18]);
  v22 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v23 = (v10 + *(unsigned __int8 *)(v31 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v24 = swift_allocObject();
  sub_2460A7E30((uint64_t)v11, v24 + v22, (uint64_t (*)(_QWORD))type metadata accessor for DeviceDisambiguationView);
  sub_2460A7E30((uint64_t)v7, v24 + v23, (uint64_t (*)(_QWORD))MEMORY[0x24BE90B18]);
  sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v26 = v25;
  sub_2460ACF80();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
  v61 = v12;
  v62 = v26;
  swift_getOpaqueTypeConformance2();
  v27 = v34;
  sub_2460ACFBC();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v19, v27);
}

void sub_2460AC710()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753FC00);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460AD028();
  v9 = sub_2460AD0E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_2460A7EB8((uint64_t)v8, (uint64_t *)&unk_25753FC00);
  }
  else
  {
    sub_2460ACE60();
    v10 = sub_2460ACD28();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v10);
    v11 = sub_2460AD064();
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v11);
    sub_2460AD0DC();
    sub_2460A7EB8((uint64_t)v2, &qword_25753FBF0);
    sub_2460A7EB8((uint64_t)v5, &qword_25753FBF8);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
}

uint64_t sub_2460AC8BC()
{
  return sub_2460AC8D8(sub_2460AC0AC);
}

uint64_t sub_2460AC8CC()
{
  return sub_2460AC8D8(sub_2460AC218);
}

uint64_t sub_2460AC8D8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_11_0();
  return a1(v1 + v2);
}

unint64_t sub_2460AC914()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_257540208;
  if (!qword_257540208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257540200);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753FE50);
    sub_2460AD0B8();
    sub_2460A547C(&qword_25753FE40, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
    v3[1] = v2;
    v3[2] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24954EF98](MEMORY[0x24BDF4A08], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257540208);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_0_4() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  v3(v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  OUTLINED_FUNCTION_0_1(v4);
  OUTLINED_FUNCTION_3_5();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2460ACA7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_11_0();
  return sub_2460AC410(a1, v2 + v5, a2);
}

uint64_t sub_2460ACAB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  unint64_t v11;
  void (*v12)(unint64_t);

  v1 = OUTLINED_FUNCTION_0_4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2460ACE78();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0();
  v9(v8);
  v10 = v8 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBB8);
  OUTLINED_FUNCTION_9_0(v10);
  OUTLINED_FUNCTION_3_5();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_0(v0 + v7);
  OUTLINED_FUNCTION_9_0(v0 + v7 + *(int *)(v5 + 20));
  v11 = v0 + v7 + *(int *)(v5 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753FBC0);
  OUTLINED_FUNCTION_0();
  v12(v11);
  return swift_deallocObject();
}

void sub_2460ACBC4()
{
  OUTLINED_FUNCTION_0_4();
  sub_2460ACE78();
  sub_2460AC710();
}

void sub_2460ACC20()
{
  sub_2460A54B0(&qword_257540230, &qword_257540238);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return type metadata accessor for DeviceDisambiguationView();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_2460ACE54();
}

uint64_t sub_2460ACC5C()
{
  uint64_t v0;
  id v1;

  v0 = sub_2460ACE9C();
  __swift_allocate_value_buffer(v0, qword_257540660);
  __swift_project_value_buffer(v0, (uint64_t)qword_257540660);
  if (qword_25753FAA0 != -1)
    swift_once();
  v1 = (id)qword_257540658;
  return sub_2460ACEA8();
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

uint64_t sub_2460ACD1C()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_2460ACD28()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_2460ACD34()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_2460ACD40()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_2460ACD4C()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_2460ACD58()
{
  return MEMORY[0x24BE909D0]();
}

uint64_t sub_2460ACD64()
{
  return MEMORY[0x24BE909D8]();
}

uint64_t sub_2460ACD70()
{
  return MEMORY[0x24BE909E0]();
}

uint64_t sub_2460ACD7C()
{
  return MEMORY[0x24BE909E8]();
}

uint64_t sub_2460ACD88()
{
  return MEMORY[0x24BE909F0]();
}

uint64_t sub_2460ACD94()
{
  return MEMORY[0x24BE90A10]();
}

uint64_t sub_2460ACDA0()
{
  return MEMORY[0x24BE90A20]();
}

uint64_t sub_2460ACDAC()
{
  return MEMORY[0x24BE90A30]();
}

uint64_t sub_2460ACDB8()
{
  return MEMORY[0x24BE90A38]();
}

uint64_t sub_2460ACDC4()
{
  return MEMORY[0x24BE90A40]();
}

uint64_t sub_2460ACDD0()
{
  return MEMORY[0x24BE90A48]();
}

uint64_t sub_2460ACDDC()
{
  return MEMORY[0x24BE90A58]();
}

uint64_t sub_2460ACDE8()
{
  return MEMORY[0x24BE90A68]();
}

uint64_t sub_2460ACDF4()
{
  return MEMORY[0x24BE90A78]();
}

uint64_t sub_2460ACE00()
{
  return MEMORY[0x24BE90A80]();
}

uint64_t sub_2460ACE0C()
{
  return MEMORY[0x24BE90A88]();
}

uint64_t sub_2460ACE18()
{
  return MEMORY[0x24BE90A98]();
}

uint64_t sub_2460ACE24()
{
  return MEMORY[0x24BE90AA0]();
}

uint64_t sub_2460ACE30()
{
  return MEMORY[0x24BE90AA8]();
}

uint64_t sub_2460ACE3C()
{
  return MEMORY[0x24BE90AE0]();
}

uint64_t sub_2460ACE48()
{
  return MEMORY[0x24BE90AF0]();
}

uint64_t sub_2460ACE54()
{
  return MEMORY[0x24BE90AF8]();
}

uint64_t sub_2460ACE60()
{
  return MEMORY[0x24BE90B08]();
}

uint64_t sub_2460ACE6C()
{
  return MEMORY[0x24BE90B10]();
}

uint64_t sub_2460ACE78()
{
  return MEMORY[0x24BE90B18]();
}

uint64_t sub_2460ACE84()
{
  return MEMORY[0x24BE90B30]();
}

uint64_t sub_2460ACE90()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2460ACE9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2460ACEA8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2460ACEB4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2460ACEC0()
{
  return MEMORY[0x24BEAD6A0]();
}

uint64_t sub_2460ACECC()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2460ACED8()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2460ACEE4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2460ACEF0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2460ACEFC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2460ACF08()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2460ACF14()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2460ACF20()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_2460ACF2C()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2460ACF38()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2460ACF44()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2460ACF50()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2460ACF5C()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_2460ACF68()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_2460ACF74()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_2460ACF80()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_2460ACF8C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2460ACF98()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2460ACFA4()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_2460ACFB0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2460ACFBC()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_2460ACFC8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2460ACFD4()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_2460ACFE0()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2460ACFEC()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2460ACFF8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2460AD004()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_2460AD010()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_2460AD01C()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2460AD028()
{
  return MEMORY[0x24BEADAD8]();
}

uint64_t sub_2460AD034()
{
  return MEMORY[0x24BEADAF8]();
}

uint64_t sub_2460AD040()
{
  return MEMORY[0x24BEADB08]();
}

uint64_t sub_2460AD04C()
{
  return MEMORY[0x24BEADB88]();
}

uint64_t sub_2460AD058()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_2460AD064()
{
  return MEMORY[0x24BEADCA0]();
}

uint64_t sub_2460AD070()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_2460AD07C()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_2460AD088()
{
  return MEMORY[0x24BEADD88]();
}

uint64_t sub_2460AD094()
{
  return MEMORY[0x24BEADDA0]();
}

uint64_t sub_2460AD0A0()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_2460AD0AC()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_2460AD0B8()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_2460AD0C4()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_2460AD0D0()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_2460AD0DC()
{
  return MEMORY[0x24BEAE088]();
}

uint64_t sub_2460AD0E8()
{
  return MEMORY[0x24BEAE098]();
}

uint64_t sub_2460AD0F4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2460AD100()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2460AD10C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2460AD118()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2460AD124()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2460AD130()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2460AD13C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2460AD148()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2460AD154()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2460AD160()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2460AD16C()
{
  return MEMORY[0x24BEE30B0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

