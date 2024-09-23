void sub_24A346E80(uint64_t *a1@<X8>)
{
  const void *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE __dst[136];

  memcpy(__dst, v1, sizeof(__dst));
  *a1 = sub_24A362BF4();
  a1[1] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF708);
  sub_24A346ED8(__dst, (uint64_t)a1 + *(int *)(v4 + 44));
}

void sub_24A346ED8(const void *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int IsSlow;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD __dst[17];

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7F0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t)&v37 - v7;
  v38 = sub_24A362864();
  v8 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF870);
  v40 = *(_QWORD *)(v43 - 8);
  v11 = MEMORY[0x24BDAC7A8](v43);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v39 = (char *)&v37 - v14;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF808);
  MEMORY[0x24BDAC7A8](v42);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF748);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF810);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v41 = (uint64_t)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v37 - v23;
  IsSlow = DeviceIsSlow();
  v44 = a1;
  if (IsSlow)
  {
    memcpy(__dst, a1, sizeof(__dst));
    sub_24A34737C((uint64_t)v19);
    sub_24A32CB80((uint64_t)v19, (uint64_t)v16, &qword_2544CF748);
    swift_storeEnumTagMultiPayload();
    v26 = sub_24A349AD0();
    __dst[0] = v17;
    __dst[1] = v26;
    swift_getOpaqueTypeConformance2();
    sub_24A362918();
    sub_24A3137C0((uint64_t)v19, &qword_2544CF748);
  }
  else
  {
    memcpy(__dst, a1, sizeof(__dst));
    sub_24A34737C((uint64_t)v19);
    v27 = v38;
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDEE8B0], v38);
    v28 = sub_24A349AD0();
    v37 = v6;
    v29 = v28;
    sub_24A362A44();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
    sub_24A3137C0((uint64_t)v19, &qword_2544CF748);
    v30 = v40;
    v31 = v39;
    v32 = v43;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v39, v13, v43);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v16, v31, v32);
    swift_storeEnumTagMultiPayload();
    __dst[0] = v17;
    __dst[1] = v29;
    swift_getOpaqueTypeConformance2();
    v6 = v37;
    sub_24A362918();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  }
  memcpy(__dst, v44, sizeof(__dst));
  v33 = v45;
  sub_24A3479FC(v45);
  v34 = v41;
  sub_24A32CB80((uint64_t)v24, v41, &qword_2544CF810);
  sub_24A32CB80(v33, (uint64_t)v6, &qword_2544CF7F0);
  v35 = v46;
  sub_24A32CB80(v34, v46, &qword_2544CF810);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF818);
  sub_24A32CB80((uint64_t)v6, v35 + *(int *)(v36 + 48), &qword_2544CF7F0);
  sub_24A3137C0(v33, &qword_2544CF7F0);
  sub_24A3137C0((uint64_t)v24, &qword_2544CF810);
  sub_24A3137C0((uint64_t)v6, &qword_2544CF7F0);
  sub_24A3137C0(v34, &qword_2544CF810);
}

uint64_t sub_24A34737C@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unsigned int *v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  _BYTE v73[136];
  _QWORD v74[17];
  _BYTE __dst[126];
  char v76;
  char v77[9];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF938);
  MEMORY[0x24BDAC7A8](v2);
  v69 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24A362C00();
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF768);
  MEMORY[0x24BDAC7A8](v65);
  v64 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7B0);
  MEMORY[0x24BDAC7A8](v70);
  v71 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF878);
  v57 = *(_QWORD *)(v8 - 8);
  v58 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24A362864();
  v62 = *(_QWORD *)(v10 - 8);
  v63 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF8B0);
  v13 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_24A362A98();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v74, v61, sizeof(v74));
  memcpy(__dst, &v74[2], 0x78uLL);
  sub_24A34A8D0(__dst, &v76);
  sub_24A34A8D0(&v76, v77);
  v59 = v2;
  v60 = a1;
  if (v77[0] == 2)
  {
    v61 = v15;
    v20 = v13;
    v21 = v74[0];
    v22 = v74[1];
    sub_24A349E68((uint64_t)v74);
    sub_24A3468B0(v21, v22);
    v23 = sub_24A349CB0(v21, v22);
    sub_24A346910(v21, v22);
    if ((v23 & 1) != 0)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BDF3C28], v16);
      v24 = sub_24A362B1C();
    }
    else
    {
      v24 = sub_24A362B10();
    }
    v30 = v24;
    v32 = v70;
    v31 = (uint64_t)v71;
    v33 = v72;
    v34 = swift_allocObject();
    memcpy((void *)(v34 + 16), v74, 0x88uLL);
    *(_QWORD *)(v34 + 152) = v30;
    v35 = v20;
  }
  else
  {
    if ((v77[0] & 1) != 0)
    {
      memcpy(v73, v74, sizeof(v73));
      sub_24A347EE0();
      v35 = v13;
      v34 = v36;
      v32 = v70;
      v31 = (uint64_t)v71;
      v33 = v72;
      goto LABEL_13;
    }
    v61 = v15;
    v25 = v13;
    v26 = v74[0];
    v27 = v74[1];
    sub_24A349E68((uint64_t)v74);
    sub_24A3468B0(v26, v27);
    v28 = sub_24A349CB0(v26, v27);
    sub_24A346910(v26, v27);
    if ((v28 & 1) != 0)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BDF3C28], v16);
      v29 = sub_24A362B1C();
    }
    else
    {
      v29 = sub_24A362B10();
    }
    v37 = v29;
    v32 = v70;
    v31 = (uint64_t)v71;
    v33 = v72;
    v35 = v25;
    v34 = swift_allocObject();
    memcpy((void *)(v34 + 16), v74, 0x88uLL);
    *(_QWORD *)(v34 + 152) = v37;
  }
  v15 = v61;
LABEL_13:
  (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v12, *MEMORY[0x24BDEE8B0], v63);
  swift_retain();
  v71 = (char *)v34;
  sub_24A362BB8();
  sub_24A362BA0();
  sub_24A362BAC();
  v38 = sub_24A362930();
  v39 = (uint64_t)v64;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v64, v15, v33);
  v40 = v66;
  *(_DWORD *)(v39 + *(int *)(v65 + 36)) = v38;
  v42 = v67;
  v41 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v40, *MEMORY[0x24BDF5098], v68);
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v31 + *(int *)(v32 + 36), v40, v41);
  sub_24A32CB80(v39, v31, &qword_2544CF768);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  sub_24A3137C0(v39, &qword_2544CF768);
  sub_24A34A8D0(&v76, v73);
  v43 = v35;
  v44 = v72;
  v45 = v73[0];
  v46 = sub_24A362720();
  v47 = (unsigned int *)MEMORY[0x24BDECF10];
  if (v45 != 2)
    v47 = (unsigned int *)MEMORY[0x24BDECF00];
  v48 = (uint64_t)v69;
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v69, *v47, v46);
  sub_24A34A91C();
  result = sub_24A362E88();
  if ((result & 1) != 0)
  {
    sub_24A349BA8();
    sub_24A34AA50(&qword_2544CF930, &qword_2544CF938, MEMORY[0x24BEE30C8]);
    v50 = v43;
    v51 = v56;
    sub_24A362A5C();
    swift_release();
    sub_24A3137C0(v48, &qword_2544CF938);
    sub_24A3137C0(v31, &qword_2544CF7B0);
    v53 = v57;
    v52 = v58;
    v54 = v60;
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v60, v51, v58);
    v55 = v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544CF748) + 36);
    *(_QWORD *)v55 = 0x3FF0000000000000;
    *(_WORD *)(v55 + 8) = 0;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v51, v52);
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v15, v44);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3479FC@<X0>(uint64_t a1@<X8>)
{
  const void *v1;
  const void *v2;
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
  char *v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD __dst[18];

  v2 = v1;
  v46 = a1;
  v3 = sub_24A362C00();
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF768);
  MEMORY[0x24BDAC7A8](v40);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7B0);
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_24A362864();
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v38 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF8B0);
  v41 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A362A98();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, v2, 0x88uLL);
  v16 = __dst[0];
  v17 = __dst[1];
  sub_24A349E68((uint64_t)__dst);
  sub_24A3468B0(v16, v17);
  v18 = sub_24A349CB0(v16, v17);
  sub_24A346910(v16, v17);
  if ((v18 & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDF3C28], v12);
    v19 = sub_24A362B1C();
  }
  else
  {
    v20 = objc_msgSend((id)objc_opt_self(), sel_tertiarySystemFillColor);
    v19 = MEMORY[0x24BD0DAB0](v20);
  }
  v21 = v19;
  sub_24A349EF4((uint64_t)__dst);
  sub_24A349E68((uint64_t)__dst);
  sub_24A3468B0(v16, v17);
  v22 = sub_24A349CB0(v16, v17);
  sub_24A346910(v16, v17);
  if ((v22 & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDF3C28], v12);
    v23 = sub_24A362B1C();
  }
  else
  {
    v24 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemFillColor);
    v23 = MEMORY[0x24BD0DAB0](v24);
  }
  v25 = v23;
  sub_24A349EF4((uint64_t)__dst);
  v26 = (_QWORD *)swift_allocObject();
  memcpy(v26 + 2, __dst, 0x88uLL);
  v26[19] = v25;
  v26[20] = v21;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v38, *MEMORY[0x24BDEE8B0], v37);
  sub_24A349E68((uint64_t)__dst);
  swift_retain();
  swift_retain();
  sub_24A362BB8();
  sub_24A362BA0();
  sub_24A362BAC();
  LODWORD(v26) = sub_24A362924();
  swift_release();
  swift_release();
  v27 = v41;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v6, v11, v9);
  *(_DWORD *)&v6[*(int *)(v40 + 36)] = (_DWORD)v26;
  v29 = v43;
  v28 = v44;
  v30 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDF5098], v45);
  v31 = (uint64_t)v42;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(&v42[*(int *)(v39 + 36)], v29, v30);
  sub_24A32CB80((uint64_t)v6, v31, &qword_2544CF768);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  sub_24A3137C0((uint64_t)v6, &qword_2544CF768);
  v32 = v46;
  sub_24A32CB80(v31, v46, &qword_2544CF7B0);
  v33 = v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7F0) + 36);
  *(_QWORD *)v33 = 0x3FF0000000000000;
  *(_WORD *)(v33 + 8) = 0;
  sub_24A3137C0(v31, &qword_2544CF7B0);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v11, v9);
}

uint64_t (*sub_24A347EE0())(uint64_t a1)
{
  const void *v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v20[17];
  _BYTE v21[126];
  char v22;
  char v23;

  v1 = v0;
  v2 = sub_24A362A98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A3629B4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v20, v1, sizeof(v20));
  memcpy(v21, &v20[2], 0x78uLL);
  sub_24A34A8D0(v21, &v22);
  sub_24A34A8D0(&v22, &v23);
  if (v23 == 2)
    v10 = (unsigned int *)MEMORY[0x24BDF1860];
  else
    v10 = (unsigned int *)MEMORY[0x24BDF18D8];
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *v10, v6);
  sub_24A362984();
  v11 = sub_24A362978();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v12 = v20[0];
  v13 = v20[1];
  sub_24A349E68((uint64_t)v20);
  sub_24A3468B0(v12, v13);
  v14 = sub_24A349CB0(v12, v13);
  sub_24A346910(v12, v13);
  if ((v14 & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3C28], v2);
    v15 = sub_24A362B1C();
  }
  else
  {
    v15 = sub_24A362B10();
  }
  v16 = v15;
  sub_24A349EF4((uint64_t)v20);
  v17 = (_QWORD *)swift_allocObject();
  memcpy(v17 + 2, v20, 0x88uLL);
  v17[19] = v16;
  v17[20] = v11;
  sub_24A349E68((uint64_t)v20);
  return sub_24A34AA18;
}

uint64_t sub_24A3480E4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  _QWORD v69[16];
  _QWORD v70[17];
  _QWORD __dst[15];
  char v72;
  char v73;
  _BYTE v74[9];

  v6 = sub_24A3629B4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, (const void *)(a2 + 16), sizeof(__dst));
  sub_24A34A8D0(__dst, &v72);
  sub_24A34A8D0(&v72, v74);
  if ((v74[0] & 1) != 0)
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
  memcpy(v70, (const void *)a2, sizeof(v70));
  sub_24A3486EC();
  memcpy(v70, (const void *)a2, sizeof(v70));
  sub_24A348798();
  sub_24A34A8D0(&v72, &v73);
  v10 = (unsigned int *)MEMORY[0x24BDF1860];
  if (v73 != 2)
    v10 = (unsigned int *)MEMORY[0x24BDF18D8];
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *v10, v6);
  sub_24A362984();
  sub_24A362978();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v69[3] = *a1;
  v70[0] = __dst[13];
  v70[1] = __dst[14];
  v69[2] = sub_24A2A4EC0();
  swift_bridgeObjectRetain();
  v11 = sub_24A362A14();
  v69[1] = a3;
  v13 = v12;
  v15 = v14 & 1;
  v16 = sub_24A3629D8();
  v18 = v17;
  v20 = v19 & 1;
  sub_24A2A5EB0(v11, v13, v15);
  swift_bridgeObjectRelease();
  swift_retain();
  v21 = sub_24A3629FC();
  v23 = v22;
  v25 = v24;
  swift_release();
  sub_24A2A5EB0(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_24A362C30();
  sub_24A362750();
  sub_24A2A5EB0(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  v70[0] = __dst[9];
  v70[1] = __dst[10];
  swift_bridgeObjectRetain();
  v26 = sub_24A362A14();
  v28 = v27;
  LOBYTE(v16) = v29 & 1;
  v30 = sub_24A3629D8();
  v32 = v31;
  v34 = v33 & 1;
  sub_24A2A5EB0(v26, v28, v16);
  swift_bridgeObjectRelease();
  swift_retain();
  v35 = sub_24A3629FC();
  v37 = v36;
  v39 = v38;
  swift_release();
  sub_24A2A5EB0(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_24A362C3C();
  sub_24A362750();
  sub_24A2A5EB0(v35, v37, v39 & 1);
  swift_bridgeObjectRelease();
  v70[0] = __dst[7];
  v70[1] = __dst[8];
  swift_bridgeObjectRetain();
  v40 = sub_24A362A14();
  v42 = v41;
  LOBYTE(v16) = v43 & 1;
  v44 = sub_24A3629D8();
  v46 = v45;
  v48 = v47 & 1;
  sub_24A2A5EB0(v40, v42, v16);
  swift_bridgeObjectRelease();
  swift_retain();
  v49 = sub_24A3629FC();
  v51 = v50;
  v53 = v52;
  swift_release();
  sub_24A2A5EB0(v44, v46, v48);
  swift_bridgeObjectRelease();
  sub_24A362C0C();
  sub_24A362750();
  sub_24A2A5EB0(v49, v51, v53 & 1);
  swift_bridgeObjectRelease();
  v70[0] = __dst[11];
  v70[1] = __dst[12];
  swift_bridgeObjectRetain();
  v54 = sub_24A362A14();
  v56 = v55;
  LOBYTE(v16) = v57 & 1;
  v58 = sub_24A3629D8();
  v60 = v59;
  v62 = v61 & 1;
  sub_24A2A5EB0(v54, v56, v16);
  swift_bridgeObjectRelease();
  swift_retain();
  v63 = sub_24A3629FC();
  v65 = v64;
  v67 = v66;
  swift_release();
  sub_24A2A5EB0(v58, v60, v62);
  swift_bridgeObjectRelease();
  sub_24A362C18();
  sub_24A362750();
  sub_24A2A5EB0(v63, v65, v67 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A3486EC()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 != 2 && (v1 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
  }
  return sub_24A36272C();
}

uint64_t sub_24A348798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  _BYTE v7[40];
  _BYTE v8[40];
  _BYTE v9[40];

  v0 = sub_24A362780();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_24A362768();
  sub_24A3629C0();
  sub_24A362774();
  sub_24A36275C();
  sub_24A349F90((uint64_t)v7);
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_24A362768();
  sub_24A3629C0();
  sub_24A362774();
  sub_24A36275C();
  sub_24A349F90((uint64_t)v9);
  v4(v3, v0);
  sub_24A362768();
  sub_24A3629C0();
  sub_24A362774();
  sub_24A36275C();
  sub_24A349F90((uint64_t)v8);
  v4(v3, v0);
  return sub_24A362768();
}

uint64_t sub_24A348954(uint64_t a1, uint64_t a2)
{
  _BYTE v4[136];
  _BYTE __dst[126];
  char v6;
  char v7;

  memcpy(__dst, (const void *)(a2 + 16), 0x78uLL);
  sub_24A34A8D0(__dst, &v6);
  sub_24A34A8D0(&v6, &v7);
  if ((v7 & 1) != 0)
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
  memcpy(v4, (const void *)a2, sizeof(v4));
  sub_24A3486EC();
  memcpy(v4, (const void *)a2, sizeof(v4));
  return sub_24A348798();
}

uint64_t sub_24A348A54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  _QWORD v56[17];
  _QWORD __dst[15];
  char v58;
  char v59;
  _BYTE v60[9];

  memcpy(__dst, (const void *)(a2 + 16), sizeof(__dst));
  sub_24A34A8D0(__dst, &v58);
  sub_24A34A8D0(&v58, v60);
  if ((v60[0] & 1) != 0)
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
  memcpy(v56, (const void *)a2, sizeof(v56));
  sub_24A3486EC();
  sub_24A34A8D0(&v58, &v59);
  v56[0] = __dst[13];
  v56[1] = __dst[14];
  sub_24A2A4EC0();
  swift_bridgeObjectRetain();
  v3 = sub_24A362A14();
  v5 = v4;
  v7 = v6 & 1;
  v8 = sub_24A3629D8();
  v10 = v9;
  v12 = v11 & 1;
  sub_24A2A5EB0(v3, v5, v7);
  swift_bridgeObjectRelease();
  v13 = sub_24A3629FC();
  v15 = v14;
  v17 = v16 & 1;
  sub_24A2A5EB0(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_24A362C24();
  sub_24A362750();
  sub_24A2A5EB0(v13, v15, v17);
  swift_bridgeObjectRelease();
  v56[0] = __dst[9];
  v56[1] = __dst[10];
  swift_bridgeObjectRetain();
  v18 = sub_24A362A14();
  v20 = v19;
  LOBYTE(v13) = v21 & 1;
  v22 = sub_24A3629D8();
  v24 = v23;
  LOBYTE(v8) = v25 & 1;
  sub_24A2A5EB0(v18, v20, v13);
  swift_bridgeObjectRelease();
  v26 = sub_24A3629FC();
  v28 = v27;
  LOBYTE(v13) = v29 & 1;
  sub_24A2A5EB0(v22, v24, v8);
  swift_bridgeObjectRelease();
  sub_24A362C24();
  sub_24A362750();
  sub_24A2A5EB0(v26, v28, v13);
  swift_bridgeObjectRelease();
  v56[0] = __dst[7];
  v56[1] = __dst[8];
  swift_bridgeObjectRetain();
  v30 = sub_24A362A14();
  v32 = v31;
  LOBYTE(v13) = v33 & 1;
  v34 = sub_24A3629D8();
  v36 = v35;
  LOBYTE(v8) = v37 & 1;
  sub_24A2A5EB0(v30, v32, v13);
  swift_bridgeObjectRelease();
  v38 = sub_24A3629FC();
  v40 = v39;
  LOBYTE(v13) = v41 & 1;
  sub_24A2A5EB0(v34, v36, v8);
  swift_bridgeObjectRelease();
  sub_24A362C24();
  sub_24A362750();
  sub_24A2A5EB0(v38, v40, v13);
  swift_bridgeObjectRelease();
  v56[0] = __dst[11];
  v56[1] = __dst[12];
  swift_bridgeObjectRetain();
  v42 = sub_24A362A14();
  v44 = v43;
  LOBYTE(v10) = v45 & 1;
  v46 = sub_24A3629D8();
  v48 = v47;
  v50 = v49 & 1;
  sub_24A2A5EB0(v42, v44, v10);
  swift_bridgeObjectRelease();
  v51 = sub_24A3629FC();
  v53 = v52;
  LOBYTE(v10) = v54 & 1;
  sub_24A2A5EB0(v46, v48, v50);
  swift_bridgeObjectRelease();
  sub_24A362C24();
  sub_24A362750();
  sub_24A2A5EB0(v51, v53, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A348F68(double a1, double a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  char *v10;
  int v11;
  double v12;
  uint64_t v13;
  unsigned int v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double *v22;
  double v25;
  unsigned __int8 *v26;
  double v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE __dst[136];
  _BYTE v35[48];

  v33 = a6;
  v32 = a5;
  v31 = sub_24A362780();
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >= a1)
    a2 = a1;
  v26 = a4;
  v11 = a4[16];
  v12 = 0.0;
  if (v11 == 2)
  {
    v28 = 1;
    v13 = 168;
  }
  else
  {
    if ((v11 & 1) != 0)
    {
      v14 = objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
      v28 = 0;
      v12 = 1.0;
      if (v14)
        v12 = 4.0;
    }
    else
    {
      v28 = 1;
    }
    v13 = 108;
  }
  v15 = a2 * 0.5 - v12;
  memcpy(__dst, v26, sizeof(__dst));
  sub_24A3486EC();
  v16 = 0;
  v17 = 0;
  v27 = 360.0 / (double)v13;
  v29 = v13 - 1;
  v25 = v15;
  do
  {
    v18 = v17 % ((unint64_t)v13 >> 2);
    if (v11 == 2)
    {
      if (!v18)
        goto LABEL_28;
LABEL_27:
      swift_retain();
      sub_24A3629C0();
      sub_24A362774();
      sub_24A36275C();
      sub_24A349F90((uint64_t)v35);
      swift_release();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
      goto LABEL_28;
    }
    if ((v28 & 1) != 0)
    {
      if (!v18)
        goto LABEL_28;
      goto LABEL_27;
    }
    if (!v16)
    {
      memcpy(__dst, v26, sizeof(__dst));
      v19 = swift_retain();
      v16 = sub_24A3492B8(v19, v25);
      swift_release();
    }
    v20 = *(_QWORD *)(v16 + 16);
    if (!v20)
      goto LABEL_27;
    v21 = v27 * (double)v17;
    v22 = (double *)(v16 + 40);
    while (*(v22 - 1) > v21 || v21 > *v22)
    {
      v22 += 2;
      if (!--v20)
        goto LABEL_27;
    }
LABEL_28:
    ++v17;
    sub_24A362768();
  }
  while (v17 != v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A3492B8(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  void (*v15)(char *, _QWORD, uint64_t);
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
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
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  double v65;
  double v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  double v73;
  double v74;
  double v75;
  double v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v106 = a1;
  v4 = sub_24A3629B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(unsigned __int8 *)(v2 + 16);
  v9 = *(_QWORD *)(v2 + 72);
  v10 = *(_QWORD *)(v2 + 80);
  v11 = *(_QWORD *)(v2 + 88);
  v100 = *(_QWORD *)(v2 + 96);
  v101 = v11;
  v12 = *(_QWORD *)(v2 + 104);
  v102 = *(_QWORD *)(v2 + 112);
  v103 = v12;
  v13 = *(_QWORD *)(v2 + 120);
  v104 = *(_QWORD *)(v2 + 128);
  v105 = v13;
  v14 = (unsigned int *)MEMORY[0x24BDF1860];
  v15 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  HIDWORD(v98) = v8;
  if (v8 != 2)
    v14 = (unsigned int *)MEMORY[0x24BDF18D8];
  v15(v7, *v14, v4);
  sub_24A362984();
  v16 = sub_24A362978();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF948);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A363D40;
  v109 = v9;
  v110 = v10;
  v107 = sub_24A2A4EC0();
  swift_bridgeObjectRetain();
  v18 = sub_24A362A14();
  v20 = v19;
  v22 = v21 & 1;
  swift_retain();
  v23 = sub_24A3629FC();
  v25 = v24;
  v27 = v26;
  v99 = v28;
  swift_release();
  sub_24A2A5EB0(v18, v20, v22);
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 32) = v23;
  *(_QWORD *)(inited + 40) = v25;
  *(_BYTE *)(inited + 48) = v27 & 1;
  v29 = v100;
  *(_QWORD *)(inited + 56) = v99;
  *(_QWORD *)(inited + 64) = 0x4070E00000000000;
  v109 = v101;
  v110 = v29;
  swift_bridgeObjectRetain();
  v30 = sub_24A362A14();
  v32 = v31;
  LOBYTE(v23) = v33 & 1;
  swift_retain();
  v100 = sub_24A3629FC();
  v101 = v34;
  v36 = v35;
  v38 = v37;
  swift_release();
  sub_24A2A5EB0(v30, v32, v23);
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 72) = v100;
  *(_QWORD *)(inited + 80) = v36;
  *(_BYTE *)(inited + 88) = v38 & 1;
  v39 = v102;
  *(_QWORD *)(inited + 96) = v101;
  *(_QWORD *)(inited + 104) = 0;
  v109 = v103;
  v110 = v39;
  swift_bridgeObjectRetain();
  v40 = sub_24A362A14();
  v42 = v41;
  LOBYTE(v23) = v43 & 1;
  swift_retain();
  v44 = sub_24A3629FC();
  v46 = v45;
  v48 = v47;
  v103 = v49;
  swift_release();
  sub_24A2A5EB0(v40, v42, v23);
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 112) = v44;
  *(_QWORD *)(inited + 120) = v46;
  *(_BYTE *)(inited + 128) = v48 & 1;
  v50 = v104;
  *(_QWORD *)(inited + 136) = v103;
  *(_QWORD *)(inited + 144) = 0x4056800000000000;
  v109 = v105;
  v110 = v50;
  swift_bridgeObjectRetain();
  v51 = sub_24A362A14();
  v53 = v52;
  LOBYTE(v23) = v54 & 1;
  swift_retain();
  v55 = sub_24A3629FC();
  v57 = v56;
  v59 = v58;
  v107 = v60;
  v105 = v16;
  swift_release();
  sub_24A2A5EB0(v51, v53, v23);
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 152) = v55;
  *(_QWORD *)(inited + 160) = v57;
  *(_BYTE *)(inited + 168) = v59 & 1;
  v61 = v106;
  *(_QWORD *)(inited + 176) = v107;
  *(_QWORD *)(inited + 184) = 0x4066800000000000;
  swift_retain();
  v62 = sub_24A346C8C(inited, v61);
  v63 = sub_24A349A80(v62);
  if ((v64 & 1) != 0)
  {
    swift_setDeallocating();
    sub_24A34A210();
    if (qword_257922CA8 != -1)
      goto LABEL_32;
    goto LABEL_25;
  }
  v65 = *(double *)&v63;
  swift_bridgeObjectRelease();
  v66 = 9.0;
  if (HIDWORD(v98) == 2)
    v66 = 7.0;
  v67 = 0;
  v68 = acos(((a2 - v66) * (a2 - v66) + (a2 - v66) * (a2 - v66) - v65 * v65) / ((a2 - v66) * (a2 - v66 + a2 - v66)))
      * 57.2957795
      * 0.5;
  v69 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v70 = *(_QWORD *)(inited + v67 + 32);
    v71 = *(_QWORD *)(inited + v67 + 40);
    v72 = *(_BYTE *)(inited + v67 + 48);
    v73 = *(double *)(inited + v67 + 64);
    v74 = v68 + v73;
    v75 = fmod(v73 - v68 + 360.0, 360.0);
    v76 = fmod(v74 + 360.0, 360.0);
    if (v76 >= v75)
    {
      sub_24A34A884(v70, v71, v72);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A330A84();
        v69 = v85;
      }
      v82 = *(_QWORD *)(v69 + 16);
      if (v82 >= *(_QWORD *)(v69 + 24) >> 1)
      {
        sub_24A330A84();
        v69 = v86;
      }
      *(_QWORD *)(v69 + 16) = v82 + 1;
      v81 = v69 + 16 * v82;
      *(double *)(v81 + 32) = v75;
      goto LABEL_22;
    }
    if (v75 > 360.0)
      break;
    sub_24A34A884(v70, v71, v72);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24A330A84();
      v69 = v83;
    }
    v77 = *(_QWORD *)(v69 + 16);
    v78 = v77 + 1;
    if (v77 >= *(_QWORD *)(v69 + 24) >> 1)
    {
      sub_24A330A84();
      v69 = v84;
    }
    *(_QWORD *)(v69 + 16) = v78;
    v79 = v69 + 16 * v77;
    *(double *)(v79 + 32) = v75;
    *(_QWORD *)(v79 + 40) = 0x4076800000000000;
    if (v76 < 0.0)
      goto LABEL_31;
    v80 = v77 + 2;
    if (v80 > *(_QWORD *)(v69 + 24) >> 1)
    {
      sub_24A330A84();
      v69 = v87;
    }
    *(_QWORD *)(v69 + 16) = v80;
    v81 = v69 + 16 * v78;
    *(_QWORD *)(v81 + 32) = 0;
LABEL_22:
    *(double *)(v81 + 40) = v76;
    sub_24A2A5EB0(v70, v71, v72);
    swift_bridgeObjectRelease();
    v67 += 40;
    if (v67 == 160)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v69;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  __break(1u);
LABEL_32:
  swift_once();
LABEL_25:
  v88 = sub_24A362534();
  __swift_project_value_buffer(v88, (uint64_t)&unk_257924670);
  swift_bridgeObjectRetain();
  v89 = sub_24A36251C();
  v90 = sub_24A363104();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    v92 = swift_slowAlloc();
    v109 = v92;
    *(_DWORD *)v91 = 136446210;
    v93 = swift_bridgeObjectRetain();
    v94 = MEMORY[0x24BD0DF00](v93, MEMORY[0x24BEE50B0]);
    v96 = v95;
    swift_bridgeObjectRelease();
    v108 = sub_24A34A260(v94, v96, &v109);
    sub_24A363200();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A2A1000, v89, v90, "Failed to find max amount to knockout when drawing wind compass; knockoutAmounts=%{public}s",
      v91,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0E788](v92, -1, -1);
    MEMORY[0x24BD0E788](v91, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_release();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_24A349A80(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  double *v4;
  double v5;
  double v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(double *)(a1 + 32);
  v3 = v1 - 1;
  if (v1 != 1)
  {
    v4 = (double *)(a1 + 40);
    do
    {
      v5 = *v4++;
      v6 = v5;
      if (v2 < v5)
        v2 = v6;
      --v3;
    }
    while (v3);
  }
  return *(_QWORD *)&v2;
}

unint64_t sub_24A349AD0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  result = qword_2544CF740;
  if (!qword_2544CF740)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF748);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF7B0);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF938);
    v4 = sub_24A349BA8();
    sub_24A34AA50(&qword_2544CF930, &qword_2544CF938, MEMORY[0x24BEE30C8]);
    v6[2] = v2;
    v6[3] = v3;
    v6[4] = v4;
    v6[5] = v5;
    v6[0] = swift_getOpaqueTypeConformance2();
    v6[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2544CF740);
  }
  return result;
}

unint64_t sub_24A349BA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2544CF7A8;
  if (!qword_2544CF7A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF7B0);
    v2[0] = sub_24A349C14();
    v2[1] = MEMORY[0x24BDEDB58];
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2544CF7A8);
  }
  return result;
}

unint64_t sub_24A349C14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2544CF760;
  if (!qword_2544CF760)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF768);
    sub_24A34AA50(&qword_2544CF8A8, &qword_2544CF8B0, MEMORY[0x24BDF4400]);
    v3 = v2;
    sub_24A34AA50(&qword_2544CF820, &qword_2544CF828, MEMORY[0x24BDF0710]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2544CF760);
  }
  return result;
}

uint64_t sub_24A349CB0(uint64_t a1, char a2)
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

  v4 = sub_24A362858();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_24A363110();
  v9 = sub_24A362960();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_24A34A260(1819242306, 0xE400000000000000, &v15);
    sub_24A363200();
    _os_log_impl(&dword_24A2A1000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD0E788](v12, -1, -1);
    MEMORY[0x24BD0E788](v11, -1, -1);
  }

  sub_24A36284C();
  swift_getAtKeyPath();
  sub_24A346910(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_24A349E68(uint64_t a1)
{
  sub_24A3468B0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24A349EF4(uint64_t a1)
{
  sub_24A346910(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24A349F84(uint64_t a1, double a2, double a3)
{
  uint64_t v3;

  return sub_24A348F68(a2, a3, a1, (unsigned __int8 *)(v3 + 16), *(_QWORD *)(v3 + 152), *(_QWORD *)(v3 + 160));
}

uint64_t sub_24A349F90(uint64_t a1)
{
  sub_24A349FC4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_24A349FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

uint64_t sub_24A349FDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = sub_24A362858();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A32CB80(v2, (uint64_t)v10, &qword_2544CF6E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_24A362798();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_24A363110();
    v14 = sub_24A362960();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v18[1] = a1;
      v19 = v17;
      *(_DWORD *)v16 = 136315138;
      v18[2] = sub_24A34A260(0x694474756F79614CLL, 0xEF6E6F6974636572, &v19);
      sub_24A363200();
      _os_log_impl(&dword_24A2A1000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_1();
    }

    sub_24A36284C();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24A34A210()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257925100);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24A34A260(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_24A34A330(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24A34A894((uint64_t)v12, *a3);
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
      sub_24A34A894((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24A34A330(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_24A34A484((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24A36320C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_24A34A548(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_24A363284();
    if (!v8)
    {
      result = sub_24A3632A8();
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

void *sub_24A34A484(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_24A3632B4();
  __break(1u);
  return result;
}

uint64_t sub_24A34A548(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24A34A5DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24A34A7B0(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24A34A7B0((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A34A5DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_24A362F0C();
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
  v3 = sub_24A34A74C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_24A363260();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_24A3632B4();
  __break(1u);
LABEL_14:
  result = sub_24A3632A8();
  __break(1u);
  return result;
}

_QWORD *sub_24A34A74C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579250F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24A34A7B0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579250F8);
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
    sub_24A345BC8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A345FAC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A34A884(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_24A34A894(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_BYTE *sub_24A34A8D0(_BYTE *a1, _BYTE *a2)
{
  __swift_memcpy1_1(a2, a1);
  return a2;
}

uint64_t sub_24A34A910(uint64_t a1)
{
  uint64_t v1;

  return sub_24A348954(a1, v1 + 16);
}

unint64_t sub_24A34A91C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544CF710;
  if (!qword_2544CF710)
  {
    v1 = sub_24A362720();
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDECF78], v1);
    atomic_store(result, (unint64_t *)&qword_2544CF710);
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  OUTLINED_FUNCTION_0_31();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A34A9B0(_QWORD *a1)
{
  uint64_t v1;

  return sub_24A3480E4(a1, v1 + 16, *(_QWORD *)(v1 + 152));
}

uint64_t objectdestroyTm()
{
  OUTLINED_FUNCTION_0_31();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A34AA18(uint64_t a1)
{
  uint64_t v1;

  return sub_24A348A54(a1, v1 + 16);
}

void sub_24A34AA24()
{
  sub_24A34AA50(&qword_2544CF8D8, &qword_2544CF8E0, MEMORY[0x24BDF4750]);
}

void sub_24A34AA50(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24BD0E6E0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_23();
}

uint64_t OUTLINED_FUNCTION_0_31()
{
  uint64_t v0;

  sub_24A346910(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t WindComponentCompassViewStyle.maxDynamicTypeSizeRange.getter@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  int v3;
  uint64_t v4;
  unsigned int *v5;

  v3 = *v1;
  v4 = sub_24A362720();
  v5 = (unsigned int *)MEMORY[0x24BDECF10];
  if (v3 != 2)
    v5 = (unsigned int *)MEMORY[0x24BDECF00];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, *v5, v4);
}

uint64_t WindComponentCompassViewStyle.compassDirectionFont.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_24A3629B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v0 == 2)
    v5 = (unsigned int *)MEMORY[0x24BDF1860];
  else
    v5 = (unsigned int *)MEMORY[0x24BDF18D8];
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *v5, v1);
  sub_24A362984();
  v6 = sub_24A362978();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

double WindComponentCompassViewStyle.tickMarkHeight.getter()
{
  _BYTE *v0;
  double result;

  result = 9.0;
  if (*v0 == 2)
    return 7.0;
  return result;
}

double WindComponentCompassViewStyle.directionPadding.getter()
{
  return 2.0;
}

uint64_t WindComponentCompassViewStyle.numberOfTicks.getter()
{
  _BYTE *v0;

  if (*v0 == 2)
    return 168;
  else
    return 108;
}

double WindComponentCompassViewStyle.tickMarkWidth.getter()
{
  return 1.0;
}

double WindComponentCompassViewStyle.thinTickMarkWidth.getter()
{
  return 0.5;
}

double WindComponentCompassViewStyle.circlePadding.getter()
{
  _BYTE *v0;
  double result;
  unsigned int v2;

  result = 0.0;
  if ((*v0 & 1) != 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
    result = 1.0;
    if (v2)
      return 4.0;
  }
  return result;
}

uint64_t static WindComponentCompassViewStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  char v3;
  int v4;

  v2 = *a1;
  v3 = v2 == 2;
  v4 = *a2;
  if (v4 != 2)
    v3 = 0;
  if (v2 != 2 && v4 != 2)
    v3 = ((v2 & 1) == 0) ^ v4;
  return v3 & 1;
}

BOOL WindComponentCompassViewStyle.showWindCompassNorthTriangle.getter()
{
  _BYTE *v0;

  return (*v0 & 1) == 0;
}

double WindComponentCompassViewStyle.windCompassNorthTriangleSize.getter()
{
  _BYTE *v0;
  double result;

  result = 10.1818182;
  if (*v0 == 2)
    return 8.0;
  return result;
}

BOOL WindComponentCompassViewStyle.canPrimaryLabelShowWindDirection.getter()
{
  unsigned __int8 *v0;

  return *v0 == 2;
}

uint64_t getEnumTagSinglePayload for WindComponentCompassViewStyle(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24A34AD0C + 4 * byte_24A3682E0[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for WindComponentCompassViewStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_24A34ADC4 + 4 * byte_24A3682EA[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A34ADF8 + 4 * byte_24A3682E5[v5]))();
}

uint64_t sub_24A34ADF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A34AE00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A34AE08);
  return result;
}

uint64_t sub_24A34AE14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A34AE1CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A34AE20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A34AE28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A34AE34(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_24A34AE50(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for WindComponentCompassViewStyle()
{
  return &type metadata for WindComponentCompassViewStyle;
}

__n128 WindComponentCompassContainerView.init(model:showCircleOutline:primaryLabelFont:secondaryLabelFont:)@<Q0>(__n128 *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  unsigned __int8 v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  uint64_t *v13;
  __n128 *v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;

  v9 = a1->n128_u8[0];
  v10 = a1->n128_u64[1];
  v20 = a1[2];
  v21 = a1[1];
  v18 = a1[4];
  v19 = a1[3];
  v16 = a1[6];
  v17 = a1[5];
  v11 = a1[7].n128_u64[0];
  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
  swift_storeEnumTagMultiPayload();
  v12 = (int *)type metadata accessor for WindComponentCompassContainerView();
  v13 = (uint64_t *)((char *)a5 + v12[5]);
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
  swift_storeEnumTagMultiPayload();
  v14 = (__n128 *)((char *)a5 + v12[6]);
  v14->n128_u8[0] = v9;
  v14->n128_u64[1] = v10;
  v14[1] = v21;
  v14[2] = v20;
  v14[3] = v19;
  v14[4] = v18;
  result = v16;
  v14[5] = v17;
  v14[6] = v16;
  v14[7].n128_u64[0] = v11;
  *((_BYTE *)a5 + v12[7]) = a2;
  *(uint64_t *)((char *)a5 + v12[8]) = a3;
  *(uint64_t *)((char *)a5 + v12[9]) = a4;
  return result;
}

double sub_24A34AFB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  double v5;
  int v6;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_24A362798();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(double *)(v0 + *(int *)(type metadata accessor for WindComponentCompassContainerView() + 24) + 8)
     * 0.0174532925;
  sub_24A349FDC((uint64_t)v4);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v6 != *MEMORY[0x24BDED100])
  {
    if (v6 == *MEMORY[0x24BDED118])
    {
      v9 = 0x401921FB54442D18;
      sub_24A362A80();
      sub_24A362A80();
      sub_24A362A8C();
      return *(double *)&v9;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
  }
  return v5;
}

void WindComponentCompassContainerView.body.getter(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *a1 = sub_24A362BF4();
  a1[1] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6F8);
  sub_24A34B110(v1, (char *)a1 + *(int *)(v4 + 44));
  OUTLINED_FUNCTION_23();
}

void sub_24A34B110(uint64_t a1@<X0>, void *a2@<X8>)
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
  char *v16;
  char v17;
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
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE v64[168];
  _QWORD v65[18];
  _BYTE v66[168];
  _BYTE v67[136];
  uint64_t v68;
  _QWORD v69[2];
  char v70;
  _BYTE v71[128];
  uint64_t v72;
  char v73;
  char v74;
  _BYTE v75[168];
  _QWORD v76[17];
  _BYTE __dst[136];

  v61 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF8B8);
  MEMORY[0x24BDAC7A8](v3);
  v57 = (uint64_t *)((char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF770);
  v5 = MEMORY[0x24BDAC7A8](v56);
  v62 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v60 = (uint64_t)&v47 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF8D0);
  MEMORY[0x24BDAC7A8](v8);
  v54 = (uint64_t *)((char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF780);
  MEMORY[0x24BDAC7A8](v10);
  v53 = (uint64_t)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7C0);
  v12 = MEMORY[0x24BDAC7A8](v52);
  v59 = (uint64_t)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v58 = (uint64_t)&v47 - v14;
  v15 = *(int *)(type metadata accessor for WindComponentCompassContainerView() + 24);
  v55 = a1;
  v16 = (char *)(a1 + v15);
  v17 = *v16;
  v18 = *((_QWORD *)v16 + 1);
  v19 = *((_QWORD *)v16 + 2);
  v63 = *((_QWORD *)v16 + 3);
  v20 = *((_QWORD *)v16 + 5);
  v50 = *((_QWORD *)v16 + 4);
  v51 = v19;
  v21 = *((_QWORD *)v16 + 6);
  v22 = *((_QWORD *)v16 + 8);
  v48 = *((_QWORD *)v16 + 7);
  v49 = v21;
  v24 = *((_QWORD *)v16 + 9);
  v23 = *((_QWORD *)v16 + 10);
  v26 = *((_QWORD *)v16 + 11);
  v25 = *((_QWORD *)v16 + 12);
  v28 = *((_QWORD *)v16 + 13);
  v27 = *((_QWORD *)v16 + 14);
  v76[0] = swift_getKeyPath();
  LOBYTE(v76[1]) = 0;
  LOBYTE(v76[2]) = v17;
  v76[3] = v18;
  v76[4] = v51;
  v76[5] = v63;
  v76[6] = v50;
  v51 = v20;
  v76[7] = v20;
  v76[8] = v49;
  v76[9] = v48;
  v76[10] = v22;
  v76[11] = v24;
  v76[12] = v23;
  v76[13] = v26;
  v76[14] = v25;
  v76[15] = v28;
  v76[16] = v27;
  memcpy(__dst, v76, sizeof(__dst));
  if ((v17 & 1) != 0)
  {
    sub_24A34D5A0(v69);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24A2B67C4((uint64_t)v69, (uint64_t)v75, &qword_2544CF778);
    v30 = v55;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29 = sub_24A362894();
    v30 = v55;
    sub_24A34B744((uint64_t)v64);
    LOBYTE(v65[0]) = 0;
    memcpy(&v66[7], v64, 0x79uLL);
    v67[0] = 0;
    v69[0] = v29;
    v69[1] = 0;
    v70 = 0;
    memcpy(v71, v66, sizeof(v71));
    v72 = 0x3FF0000000000000;
    v73 = 0;
    v74 = 1;
    nullsub_1(v69);
    sub_24A2B67C4((uint64_t)v69, (uint64_t)v75, &qword_2544CF778);
  }
  v31 = sub_24A362BF4();
  v32 = (uint64_t)v54;
  *v54 = v31;
  *(_QWORD *)(v32 + 8) = v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF700);
  sub_24A34B8F4(v30, v32 + *(int *)(v34 + 44));
  v35 = v53;
  sub_24A2B67F0(v32, v53, &qword_2544CF8D0);
  sub_24A3137C0(v32, &qword_2544CF8D0);
  v36 = v59;
  sub_24A2B67F0(v35, v59, &qword_2544CF780);
  v37 = v36 + *(int *)(v52 + 36);
  *(_QWORD *)v37 = 0x3FF0000000000000;
  *(_WORD *)(v37 + 8) = 256;
  sub_24A3137C0(v35, &qword_2544CF780);
  v38 = v58;
  sub_24A2B67C4(v36, v58, &qword_2544CF7C0);
  v39 = sub_24A362894();
  v40 = (uint64_t)v57;
  *v57 = v39;
  *(_QWORD *)(v40 + 8) = 0;
  *(_BYTE *)(v40 + 16) = 0;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6F0);
  sub_24A34BCAC(v30, (char *)(v40 + *(int *)(v41 + 44)));
  v42 = v62;
  sub_24A2B67F0(v40, v62, &qword_2544CF8B8);
  v43 = v42 + *(int *)(v56 + 36);
  *(_QWORD *)v43 = 0x3FD999999999999ALL;
  *(_WORD *)(v43 + 8) = 0;
  sub_24A3137C0(v40, &qword_2544CF8B8);
  v44 = v60;
  sub_24A2B67C4(v42, v60, &qword_2544CF770);
  sub_24A2B67C4((uint64_t)v75, (uint64_t)v64, &qword_2544CF778);
  sub_24A2B67F0(v38, v36, &qword_2544CF7C0);
  sub_24A2B67F0(v44, v42, &qword_2544CF770);
  memcpy(v65, __dst, 0x88uLL);
  v65[17] = 0x3FF0000000000000;
  v45 = v61;
  memcpy(v61, v65, 0x90uLL);
  sub_24A2B67C4((uint64_t)v64, (uint64_t)v66, &qword_2544CF778);
  sub_24A2B67C4((uint64_t)v66, (uint64_t)v45 + 144, &qword_2544CF778);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF718);
  sub_24A2B67F0(v36, (uint64_t)v45 + *(int *)(v46 + 64), &qword_2544CF7C0);
  sub_24A2B67F0(v42, (uint64_t)v45 + *(int *)(v46 + 80), &qword_2544CF770);
  sub_24A34D444((uint64_t)v65);
  sub_24A34D4A0((uint64_t)v66, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_24A34D40C);
  sub_24A34D444((uint64_t)v76);
  sub_24A3137C0(v44, &qword_2544CF770);
  sub_24A3137C0(v38, &qword_2544CF7C0);
  sub_24A34D544((uint64_t)v76);
  sub_24A3137C0(v42, &qword_2544CF770);
  sub_24A3137C0(v36, &qword_2544CF7C0);
  sub_24A2B67C4((uint64_t)v64, (uint64_t)v69, &qword_2544CF778);
  sub_24A34D4A0((uint64_t)v69, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_24A34D50C);
  memcpy(v67, __dst, sizeof(v67));
  v68 = 0x3FF0000000000000;
  sub_24A34D544((uint64_t)v67);
}

double sub_24A34B744@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  int v15;
  double result;
  _BYTE v17[8];
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_24A362B64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24A362B34();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v6 = sub_24A362B94();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for WindComponentCompassContainerView();
  sub_24A362BF4();
  sub_24A362708();
  v7 = v18;
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v11 = v22;
  v12 = v23;
  v13 = sub_24A362B10();
  KeyPath = swift_getKeyPath();
  v15 = sub_24A362930();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = KeyPath;
  *(_QWORD *)(a1 + 80) = v13;
  *(_DWORD *)(a1 + 88) = v15;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = xmmword_24A368360;
  *(_QWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 120) = 1;
  return result;
}

uint64_t sub_24A34B8F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  double v18;
  uint64_t v19;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = sub_24A3627A4();
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A362C00();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7B8);
  v10 = MEMORY[0x24BDAC7A8](v41);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v43 = (uint64_t)&v40 - v13;
  v14 = sub_24A362B64();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A362B40();
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BDF3FD0], v14);
  v42 = sub_24A362B94();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v18 = sub_24A34AFB4();
  sub_24A362C24();
  v20 = v19;
  v22 = v21;
  v23 = type metadata accessor for WindComponentCompassContainerView();
  if ((*(_BYTE *)(a1 + *(int *)(v23 + 24)) & 1) != 0)
    objc_msgSend((id)objc_opt_self(), sel_wu_systemUsesExuberatedLineHeight);
  v24 = sub_24A36296C();
  sub_24A3626E4();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  if ((*(_BYTE *)(a1 + *(int *)(v23 + 28)) & 1) != 0)
  {
    sub_24A362AD4();
    v33 = sub_24A362B04();
    swift_release();
    v34 = 0x4018000000000000;
    v35 = 0x3FE0000000000000;
  }
  else
  {
    v35 = 0;
    v33 = 0;
    v34 = 0;
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF50A0], v6);
  v36 = (uint64_t)v40;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v40, v9, v6);
  sub_24A34DB08(v36, (uint64_t)&v12[*(int *)(v41 + 36)]);
  *(_QWORD *)v12 = 0x3FE051EB851EB852;
  *((_WORD *)v12 + 4) = 0;
  sub_24A34DB4C(v36);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v37 = v43;
  sub_24A2B67C4((uint64_t)v12, v43, &qword_2544CF7B8);
  sub_24A2B67F0(v37, (uint64_t)v12, &qword_2544CF7B8);
  *(_QWORD *)a2 = v42;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(double *)(a2 + 24) = v18;
  *(_QWORD *)(a2 + 32) = v20;
  *(_QWORD *)(a2 + 40) = v22;
  *(_BYTE *)(a2 + 48) = v24;
  *(_QWORD *)(a2 + 56) = v26;
  *(_QWORD *)(a2 + 64) = v28;
  *(_QWORD *)(a2 + 72) = v30;
  *(_QWORD *)(a2 + 80) = v32;
  *(_BYTE *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = v35;
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = v33;
  *(_QWORD *)(a2 + 120) = v34;
  *(_QWORD *)(a2 + 128) = 0;
  *(_QWORD *)(a2 + 136) = 0;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7E8);
  sub_24A2B67F0((uint64_t)v12, a2 + *(int *)(v38 + 64), &qword_2544CF7B8);
  swift_retain();
  swift_retain();
  sub_24A3137C0(v37, &qword_2544CF7B8);
  sub_24A3137C0((uint64_t)v12, &qword_2544CF7B8);
  swift_release();
  return swift_release();
}

uint64_t sub_24A34BCAC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  unint64_t v46;
  uint64_t result;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  uint64_t v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  _QWORD v84[2];
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  void (*v98)(uint64_t, uint64_t, uint64_t);
  _QWORD *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  _QWORD *v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;

  v93 = a2;
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF880);
  v86 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v85 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF888);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v92 = (uint64_t)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v91 = (char *)v84 - v7;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF938);
  MEMORY[0x24BDAC7A8](v100);
  v106 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_24A362954();
  v97 = *(char **)(v105 - 8);
  MEMORY[0x24BDAC7A8](v105);
  v10 = (char *)v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_2544CF8A0);
  v98 = (void (*)(uint64_t, uint64_t, uint64_t))*(v99 - 1);
  MEMORY[0x24BDAC7A8](v99);
  v12 = (char *)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF758);
  MEMORY[0x24BDAC7A8](v95);
  v96 = (char *)v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF890);
  v102 = *(_QWORD *)(v104 - 8);
  v14 = MEMORY[0x24BDAC7A8](v104);
  v103 = (char *)v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v101 = (char *)v84 - v16;
  v17 = type metadata accessor for WindComponentCompassContainerView();
  v18 = (_QWORD *)(a1 + *(int *)(v17 + 24));
  v19 = v18[3];
  v107 = v18[2];
  v108 = v19;
  v20 = sub_24A2A4EC0();
  swift_bridgeObjectRetain();
  v87 = v20;
  v21 = sub_24A362A14();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  KeyPath = swift_getKeyPath();
  v88 = v17;
  v29 = *(int *)(v17 + 32);
  v89 = a1;
  v30 = *(_QWORD *)(a1 + v29);
  v31 = swift_getKeyPath();
  v94 = v18;
  v32 = v18[6];
  v33 = swift_getKeyPath();
  v107 = v21;
  v108 = v23;
  v109 = v25 & 1;
  v110 = v27;
  *(_QWORD *)&v111 = KeyPath;
  *((_QWORD *)&v111 + 1) = 0x3FE0000000000000;
  v112 = v31;
  v113 = v30;
  v114 = v33;
  v115 = v32;
  v116 = 0;
  swift_retain();
  sub_24A362948();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF7E0);
  sub_24A34D9A4(&qword_2544CF7D8, &qword_2544CF7E0);
  sub_24A362A74();
  v34 = (void (*)(char *, uint64_t))*((_QWORD *)v97 + 1);
  v97 = v10;
  v35 = v10;
  v36 = v95;
  v34(v35, v105);
  sub_24A2A5EB0(v107, v108, v109);
  swift_release();
  v37 = (uint64_t)v96;
  v38 = (uint64_t)v106;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v39 = swift_getKeyPath();
  v40 = v98;
  v41 = v99;
  (*((void (**)(uint64_t, char *, _QWORD *))v98 + 2))(v37, v12, v99);
  v42 = v37 + *(int *)(v36 + 36);
  *(_QWORD *)v42 = v39;
  *(_BYTE *)(v42 + 8) = 1;
  (*((void (**)(char *, _QWORD *))v40 + 1))(v12, v41);
  v43 = *MEMORY[0x24BDECF00];
  v44 = sub_24A362720();
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 104);
  v45(v38, v43, v44);
  v46 = sub_24A34A91C();
  result = sub_24A362E88();
  if ((result & 1) != 0)
  {
    v84[1] = v46;
    v98 = v45;
    v99 = v34;
    sub_24A34D808();
    sub_24A34D8D4(&qword_2544CF930, &qword_2544CF938);
    v48 = v103;
    v95 = v49;
    sub_24A362A5C();
    sub_24A3137C0(v38, &qword_2544CF938);
    sub_24A3137C0(v37, &qword_2544CF758);
    v51 = v101;
    v50 = v102;
    v52 = v104;
    (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v101, v48, v104);
    v53 = v94[5];
    v54 = 1;
    if (!v53)
    {
      v77 = (uint64_t)v91;
      v78 = v90;
      goto LABEL_6;
    }
    v107 = v94[4];
    v108 = v53;
    swift_bridgeObjectRetain();
    v55 = sub_24A362A14();
    v57 = v56;
    v59 = v58 & 1;
    v60 = sub_24A3629FC();
    v62 = v61;
    LODWORD(v96) = v43;
    v64 = v63 & 1;
    sub_24A2A5EB0(v55, v57, v59);
    swift_bridgeObjectRelease();
    v65 = v97;
    sub_24A362948();
    v66 = sub_24A3629F0();
    v68 = v67;
    v70 = v69;
    v94 = v71;
    sub_24A2A5EB0(v60, v62, v64);
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v99)(v65, v105);
    v72 = swift_getKeyPath();
    v73 = swift_getKeyPath();
    v74 = swift_getKeyPath();
    v107 = v66;
    v108 = v68;
    v75 = (uint64_t)v106;
    v109 = v70 & 1;
    v110 = v94;
    v111 = xmmword_24A368370;
    v112 = v72;
    LOBYTE(v113) = 1;
    v114 = v73;
    v115 = 2;
    v116 = 0;
    v117 = v74;
    v118 = 0x3FE0000000000000;
    v98((uint64_t)v106, v96, v44);
    result = sub_24A362E88();
    if ((result & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF800);
      sub_24A34D908();
      v76 = v85;
      sub_24A362A5C();
      sub_24A3137C0(v75, &qword_2544CF938);
      sub_24A2A5EB0(v107, v108, v109);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      v77 = (uint64_t)v91;
      v78 = v90;
      (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v91, v76, v90);
      v54 = 0;
      v48 = v103;
      v52 = v104;
      v51 = v101;
      v50 = v102;
LABEL_6:
      __swift_storeEnumTagSinglePayload(v77, v54, 1, v78);
      v79 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
      v79(v48, v51, v52);
      v80 = v92;
      sub_24A2B67F0(v77, v92, &qword_2544CF888);
      v81 = v93;
      v79(v93, v48, v52);
      v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF898);
      sub_24A2B67F0(v80, (uint64_t)&v81[*(int *)(v82 + 48)], &qword_2544CF888);
      sub_24A3137C0(v77, &qword_2544CF888);
      v83 = *(void (**)(char *, uint64_t))(v50 + 8);
      v83(v51, v52);
      sub_24A3137C0(v80, &qword_2544CF888);
      return ((uint64_t (*)(char *, uint64_t))v83)(v48, v52);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_24A34C568()
{
  sub_24A3627B0();
  OUTLINED_FUNCTION_23();
}

void sub_24A34C584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24A34C5FC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], MEMORY[0x24BDEDF98]);
}

uint64_t type metadata accessor for WindComponentCompassContainerView()
{
  uint64_t result;

  result = qword_2544CF2B8;
  if (!qword_2544CF2B8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24A34C5E0()
{
  sub_24A3627D4();
  OUTLINED_FUNCTION_23();
}

void sub_24A34C5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_71_0();
}

void sub_24A34C670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24A34C5FC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

uint64_t sub_24A34C694()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for WindComponentCompassContainerView(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24A362888();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (_QWORD *)((char *)v4 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24A362798();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = a3[7];
    v15 = (char *)v4 + v13;
    v16 = (char *)a2 + v13;
    *v15 = *v16;
    *(_OWORD *)(v15 + 8) = *(_OWORD *)(v16 + 8);
    v17 = *((_QWORD *)v16 + 4);
    *((_QWORD *)v15 + 3) = *((_QWORD *)v16 + 3);
    *((_QWORD *)v15 + 4) = v17;
    v18 = *((_QWORD *)v16 + 9);
    *((_QWORD *)v15 + 8) = *((_QWORD *)v16 + 8);
    *((_QWORD *)v15 + 9) = v18;
    v19 = *((_QWORD *)v16 + 11);
    *((_QWORD *)v15 + 10) = *((_QWORD *)v16 + 10);
    *((_QWORD *)v15 + 11) = v19;
    v20 = *((_QWORD *)v16 + 13);
    *((_QWORD *)v15 + 12) = *((_QWORD *)v16 + 12);
    *((_QWORD *)v15 + 13) = v20;
    *((_QWORD *)v15 + 5) = *((_QWORD *)v16 + 5);
    *((_OWORD *)v15 + 3) = *((_OWORD *)v16 + 3);
    *((_QWORD *)v15 + 14) = *((_QWORD *)v16 + 14);
    *((_BYTE *)v4 + v14) = *((_BYTE *)a2 + v14);
    v21 = a3[9];
    *(_QWORD *)((char *)v4 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
    *(_QWORD *)((char *)v4 + v21) = *(_QWORD *)((char *)a2 + v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WindComponentCompassContainerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24A362888();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24A362798();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for WindComponentCompassContainerView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24A362888();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_24A362798();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *v13 = *v14;
  *(_OWORD *)(v13 + 8) = *(_OWORD *)(v14 + 8);
  v15 = *((_QWORD *)v14 + 4);
  *((_QWORD *)v13 + 3) = *((_QWORD *)v14 + 3);
  *((_QWORD *)v13 + 4) = v15;
  v16 = *((_QWORD *)v14 + 9);
  *((_QWORD *)v13 + 8) = *((_QWORD *)v14 + 8);
  *((_QWORD *)v13 + 9) = v16;
  v17 = *((_QWORD *)v14 + 11);
  *((_QWORD *)v13 + 10) = *((_QWORD *)v14 + 10);
  *((_QWORD *)v13 + 11) = v17;
  v18 = *((_QWORD *)v14 + 13);
  *((_QWORD *)v13 + 12) = *((_QWORD *)v14 + 12);
  *((_QWORD *)v13 + 13) = v18;
  *((_QWORD *)v13 + 5) = *((_QWORD *)v14 + 5);
  *((_OWORD *)v13 + 3) = *((_OWORD *)v14 + 3);
  *((_QWORD *)v13 + 14) = *((_QWORD *)v14 + 14);
  *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
  v19 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for WindComponentCompassContainerView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;

  if (a1 != a2)
  {
    sub_24A3137C0((uint64_t)a1, &qword_2544CF6D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_24A362888();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = a3[5];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_24A3137C0((uint64_t)a1 + v7, &qword_2544CF6E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_24A362798();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *((_BYTE *)a2 + v11);
  *((_QWORD *)v12 + 1) = *(_QWORD *)((char *)a2 + v11 + 8);
  *((_QWORD *)v12 + 2) = *(_QWORD *)((char *)a2 + v11 + 16);
  *((_QWORD *)v12 + 3) = *(_QWORD *)((char *)a2 + v11 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 4) = v13[4];
  *((_QWORD *)v12 + 5) = v13[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 6) = v13[6];
  *((_QWORD *)v12 + 7) = v13[7];
  *((_QWORD *)v12 + 8) = v13[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 9) = v13[9];
  *((_QWORD *)v12 + 10) = v13[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 11) = v13[11];
  *((_QWORD *)v12 + 12) = v13[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v12 + 13) = v13[13];
  *((_QWORD *)v12 + 14) = v13[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for WindComponentCompassContainerView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_24A362888();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_24A362798();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  memcpy(&a1[a3[6]], &a2[a3[6]], 0x78uLL);
  v13 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  return a1;
}

char *assignWithTake for WindComponentCompassContainerView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 != a2)
  {
    sub_24A3137C0((uint64_t)a1, &qword_2544CF6D0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24A362888();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_24A3137C0((uint64_t)&a1[v8], &qword_2544CF6E0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF6E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24A362798();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *v14 = a2[v13];
  *((_QWORD *)v14 + 1) = *(_QWORD *)&a2[v13 + 8];
  v16 = *(_QWORD *)&a2[v13 + 24];
  *((_QWORD *)v14 + 2) = *(_QWORD *)&a2[v13 + 16];
  *((_QWORD *)v14 + 3) = v16;
  swift_bridgeObjectRelease();
  v17 = *((_QWORD *)v15 + 5);
  *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
  *((_QWORD *)v14 + 5) = v17;
  swift_bridgeObjectRelease();
  *((_OWORD *)v14 + 3) = *((_OWORD *)v15 + 3);
  *((_QWORD *)v14 + 8) = *((_QWORD *)v15 + 8);
  swift_bridgeObjectRelease();
  v18 = *((_QWORD *)v15 + 10);
  *((_QWORD *)v14 + 9) = *((_QWORD *)v15 + 9);
  *((_QWORD *)v14 + 10) = v18;
  swift_bridgeObjectRelease();
  v19 = *((_QWORD *)v15 + 12);
  *((_QWORD *)v14 + 11) = *((_QWORD *)v15 + 11);
  *((_QWORD *)v14 + 12) = v19;
  swift_bridgeObjectRelease();
  v20 = *((_QWORD *)v15 + 14);
  *((_QWORD *)v14 + 13) = *((_QWORD *)v15 + 13);
  *((_QWORD *)v14 + 14) = v20;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
  swift_release();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WindComponentCompassContainerView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A34D150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925108);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925110);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for WindComponentCompassContainerView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24A34D208(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925108);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
LABEL_5:
    __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
    return;
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925110);
  if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
  {
    v9 = v11;
    v10 = a1 + *(int *)(a4 + 20);
    goto LABEL_5;
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  OUTLINED_FUNCTION_71_0();
}

void sub_24A34D2A8()
{
  unint64_t v0;
  unint64_t v1;

  sub_24A34D370(319, &qword_2544CF6D8, (void (*)(uint64_t))MEMORY[0x24BDEEEA0]);
  if (v0 <= 0x3F)
  {
    sub_24A34D370(319, &qword_2544CF6E8, (void (*)(uint64_t))MEMORY[0x24BDED130]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24A34D370(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_24A3626F0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_24A34D3BC()
{
  sub_24A34D8D4(&qword_2544CF8C0, &qword_2544CF8C8);
}

void sub_24A34D3E8()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_3_36();
  *v0 = sub_24A362810() & 1;
  OUTLINED_FUNCTION_23();
}

uint64_t sub_24A34D40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void sub_24A34D444(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_1_37(a1);
  sub_24A3468B0(v1, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_22();
}

uint64_t sub_24A34D4A0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))
{
  __int16 v4;

  v4 = *(_WORD *)(a1 + 160);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_24A34D50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_24A34D544(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_1_37(a1);
  sub_24A346910(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_22();
}

void sub_24A34D5A0(void *a1)
{
  bzero(a1, 0xA2uLL);
}

uint64_t sub_24A34D5A8()
{
  swift_retain();
  return sub_24A3627C8();
}

void sub_24A34D5D0()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_3_36();
  sub_24A3627E0();
  *v0 = v1;
  OUTLINED_FUNCTION_23();
}

void sub_24A34D5F0()
{
  sub_24A3627EC();
  OUTLINED_FUNCTION_23();
}

void sub_24A34D610()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_3_36();
  *v0 = sub_24A36281C();
  OUTLINED_FUNCTION_23();
}

uint64_t sub_24A34D630()
{
  swift_retain();
  return sub_24A362828();
}

uint64_t sub_24A34D65C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24A362834();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24A34D690()
{
  return sub_24A362840();
}

unint64_t sub_24A34D6C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2544CF798;
  if (!qword_2544CF798)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF7A0);
    v2 = sub_24A34D744();
    sub_24A34D8D4(&qword_2544CF850, &qword_2544CF858);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2544CF798);
  }
  return result;
}

unint64_t sub_24A34D744()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2544CF730;
  if (!qword_2544CF730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF738);
    sub_24A34D8D4(&qword_2544CF830, &qword_2544CF838);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2544CF730);
  }
  return result;
}

void sub_24A34D7C8()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_3_36();
  *v0 = sub_24A3627F8();
  OUTLINED_FUNCTION_23();
}

void sub_24A34D7E8()
{
  sub_24A362804();
  OUTLINED_FUNCTION_23();
}

unint64_t sub_24A34D808()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_2544CF750;
  if (!qword_2544CF750)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF758);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF7E0);
    v4[3] = sub_24A34D9A4(&qword_2544CF7D8, &qword_2544CF7E0);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_24A34D8D4(&qword_2544CF840, &qword_2544CF848);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2544CF750);
  }
  return result;
}

void sub_24A34D8D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;

  if (!*a1)
  {
    v4 = OUTLINED_FUNCTION_7_28(0, a2);
    atomic_store(MEMORY[0x24BD0E6E0](v2, v4), a1);
  }
  OUTLINED_FUNCTION_23();
}

unint64_t sub_24A34D908()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2544CF7F8;
  if (!qword_2544CF7F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF800);
    v2 = sub_24A34D9A4(&qword_2544CF7C8, &qword_2544CF7D0);
    sub_24A34D8D4(&qword_2544CF830, &qword_2544CF838);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2544CF7F8);
  }
  return result;
}

uint64_t sub_24A34D9A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_7_28(0, a2);
    v6 = v2();
    sub_24A34D8D4(&qword_2544CF860, &qword_2544CF868);
    v8[0] = v6;
    v8[1] = v7;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v5, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A34DA20()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2544CF788;
  if (!qword_2544CF788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF790);
    v2 = sub_24A34DAA4();
    sub_24A34D8D4(&qword_2544CF840, &qword_2544CF848);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2544CF788);
  }
  return result;
}

unint64_t sub_24A34DAA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2544CF720;
  if (!qword_2544CF720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF728);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2544CF720);
  }
  return result;
}

uint64_t sub_24A34DB08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24A3627A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A34DB4C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24A3627A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24A34DB88()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_3_36();
  *v0 = sub_24A3627BC();
  OUTLINED_FUNCTION_23();
}

uint64_t OUTLINED_FUNCTION_1_37(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_7_28(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

void WindComponentCompassViewModel.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

double WindComponentCompassViewModel.angle.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void WindComponentCompassViewModel.primaryLabel.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void WindComponentCompassViewModel.secondaryLabel.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

uint64_t WindComponentCompassViewModel.primaryLabelLineLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

void WindComponentCompassViewModel.northString.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void WindComponentCompassViewModel.eastString.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void WindComponentCompassViewModel.southString.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void WindComponentCompassViewModel.westString.getter()
{
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

_BYTE *WindComponentCompassViewModel.init(style:angle:primaryLabel:secondaryLabel:primaryLabelLineLimit:northString:eastString:southString:westString:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, __int128 a11, __int128 a12, uint64_t a13, uint64_t a14)
{
  *(_BYTE *)a9 = *result;
  *(double *)(a9 + 8) = a10;
  *(_QWORD *)(a9 + 16) = a2;
  *(_QWORD *)(a9 + 24) = a3;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  *(_OWORD *)(a9 + 72) = a11;
  *(_OWORD *)(a9 + 88) = a12;
  *(_QWORD *)(a9 + 104) = a13;
  *(_QWORD *)(a9 + 112) = a14;
  return result;
}

uint64_t static WindComponentCompassViewModel.== infix(_:_:)(double *a1, double *a2)
{
  int v3;
  double v4;
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
  int v18;
  double v19;
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
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v45;
  BOOL v46;
  char v47;
  BOOL v48;
  char v49;
  BOOL v50;
  char v51;
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

  v3 = *(unsigned __int8 *)a1;
  v4 = a1[1];
  v6 = *((_QWORD *)a1 + 2);
  v5 = *((_QWORD *)a1 + 3);
  v8 = *((_QWORD *)a1 + 4);
  v7 = *((_QWORD *)a1 + 5);
  v9 = *((_QWORD *)a1 + 6);
  v10 = *((_QWORD *)a1 + 7);
  v11 = *((_QWORD *)a1 + 8);
  v12 = *((_QWORD *)a1 + 9);
  v14 = *((_QWORD *)a1 + 10);
  v13 = *((_QWORD *)a1 + 11);
  v16 = *((_QWORD *)a1 + 12);
  v15 = *((_QWORD *)a1 + 13);
  v17 = *((_QWORD *)a1 + 14);
  v18 = *(unsigned __int8 *)a2;
  v19 = a2[1];
  v20 = *((_QWORD *)a2 + 5);
  v71 = *((_QWORD *)a2 + 4);
  v21 = *((_QWORD *)a2 + 6);
  v22 = *((_QWORD *)a2 + 7);
  v24 = *((_QWORD *)a2 + 8);
  v23 = *((_QWORD *)a2 + 9);
  v25 = *((_QWORD *)a2 + 10);
  v26 = *((_QWORD *)a2 + 11);
  v28 = *((_QWORD *)a2 + 12);
  v27 = *((_QWORD *)a2 + 13);
  v29 = *((_QWORD *)a2 + 14);
  if (v3 == 2)
  {
    if (v18 != 2 || v4 != v19)
      return 0;
  }
  else
  {
    result = 0;
    if (v18 == 2 || ((((v3 & 1) == 0) ^ v18) & 1) == 0 || v4 != v19)
      return result;
  }
  if (v6 == *((_QWORD *)a2 + 2) && v5 == *((_QWORD *)a2 + 3))
    goto LABEL_15;
  v65 = v9;
  v67 = *((_QWORD *)a2 + 12);
  v69 = v14;
  v60 = v16;
  v62 = *((_QWORD *)a2 + 11);
  v56 = *((_QWORD *)a2 + 14);
  v58 = v13;
  v54 = v17;
  v55 = *((_QWORD *)a2 + 13);
  v33 = v15;
  v34 = *((_QWORD *)a2 + 9);
  v53 = v10;
  v35 = *((_QWORD *)a2 + 10);
  v36 = v11;
  v37 = *((_QWORD *)a2 + 7);
  v38 = *((_QWORD *)a2 + 8);
  v39 = v7;
  v40 = *((_QWORD *)a2 + 6);
  v41 = v8;
  v42 = sub_24A363350();
  v8 = v41;
  v21 = v40;
  v7 = v39;
  v24 = v38;
  v22 = v37;
  v11 = v36;
  v25 = v35;
  v23 = v34;
  v15 = v33;
  v10 = v53;
  v17 = v54;
  v27 = v55;
  v29 = v56;
  v13 = v58;
  v16 = v60;
  v26 = v62;
  v9 = v65;
  v28 = v67;
  v14 = v69;
  v43 = v42;
  result = 0;
  if ((v43 & 1) != 0)
  {
LABEL_15:
    if (!v7)
    {
      result = 0;
      if (v20 || v9 != v21)
        return result;
      goto LABEL_28;
    }
    if (v20)
    {
      if (v8 != v71 || v7 != v20)
      {
        v57 = v21;
        v59 = v24;
        v64 = v25;
        v66 = v9;
        v61 = v22;
        v63 = v11;
        v68 = v23;
        v70 = v15;
        sub_24A363350();
        result = OUTLINED_FUNCTION_8_12();
        if ((v45 & 1) == 0)
          return result;
        v23 = v68;
        v24 = v59;
        v15 = v70;
        v11 = v63;
        v25 = v64;
        v22 = v61;
        if (v66 != v57)
          return result;
        goto LABEL_28;
      }
      if (v9 == v21)
      {
LABEL_28:
        v46 = v10 == v22 && v11 == v24;
        if (v46 || (sub_24A363350(), result = OUTLINED_FUNCTION_8_12(), (v47 & 1) != 0))
        {
          v48 = v12 == v23 && v14 == v25;
          if (v48 || (sub_24A363350(), result = OUTLINED_FUNCTION_8_12(), (v49 & 1) != 0))
          {
            v50 = v13 == v26 && v16 == v28;
            if (v50 || (sub_24A363350(), result = OUTLINED_FUNCTION_8_12(), (v51 & 1) != 0))
            {
              if (v15 == v27 && v17 == v29)
                return 1;
              else
                return sub_24A363350();
            }
          }
        }
        return result;
      }
    }
    return 0;
  }
  return result;
}

uint64_t static WindComponentCompassViewModel.mock(style:northString:eastString:southString:westString:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  *(_BYTE *)a9 = *a1;
  *(_QWORD *)(a9 + 8) = 0x4066800000000000;
  *(_QWORD *)(a9 + 16) = 12849;
  *(_QWORD *)(a9 + 24) = 0xE200000000000000;
  *(_OWORD *)(a9 + 32) = xmmword_24A3685C0;
  *(_QWORD *)(a9 + 48) = 1;
  *(_QWORD *)(a9 + 56) = a2;
  *(_QWORD *)(a9 + 64) = a3;
  *(_QWORD *)(a9 + 72) = a4;
  *(_QWORD *)(a9 + 80) = a5;
  *(_QWORD *)(a9 + 88) = a6;
  *(_QWORD *)(a9 + 96) = a7;
  *(_QWORD *)(a9 + 104) = a8;
  *(_QWORD *)(a9 + 112) = a10;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_17();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for WindComponentCompassViewModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WindComponentCompassViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v4;
  v5 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WindComponentCompassViewModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for WindComponentCompassViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WindComponentCompassViewModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WindComponentCompassViewModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WindComponentCompassViewModel()
{
  return &type metadata for WindComponentCompassViewModel;
}

ValueMetadata *type metadata accessor for ConditionsFeelsLikeStringBuilder()
{
  return &type metadata for ConditionsFeelsLikeStringBuilder;
}

uint64_t sub_24A34E3F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X4>, uint64_t a4@<X8>)
{
  void *v4;
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
  uint64_t EnumTagSinglePayload;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  _BOOL4 v28;
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
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(unint64_t, uint64_t, uint64_t);
  unint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  _QWORD v48[2];
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

  v54 = a2;
  v50 = a1;
  v56 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_50();
  v51 = v7;
  v55 = OUTLINED_FUNCTION_24_13();
  v53 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10();
  v52 = v9;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  v49 = (uint64_t)v48 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v12);
  v13 = OUTLINED_FUNCTION_5_33();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3();
  v17 = v16 - v15;
  v19 = *a3;
  v18 = a3[1];
  v20 = a3[2];
  v21 = a3[3];
  v22 = a3[4];
  v23 = a3[5];
  sub_24A2A427C(v54, (uint64_t)v4);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v13);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    v25 = v55;
    OUTLINED_FUNCTION_25_13(EnumTagSinglePayload, &qword_257922CC8);
    if (qword_257922C90 != -1)
      swift_once();
    v26 = OUTLINED_FUNCTION_32_5();
    __swift_project_value_buffer(v26, (uint64_t)&unk_257924628);
    sub_24A36251C();
    v27 = OUTLINED_FUNCTION_30_7();
    v28 = OUTLINED_FUNCTION_9_3(v27);
    v29 = v56;
    if (v28)
    {
      *(_WORD *)OUTLINED_FUNCTION_14_1() = 0;
      OUTLINED_FUNCTION_13_23(&dword_24A2A1000, v30, v31, "Failed to create platter string for Feels Like due to missing extrema values");
      OUTLINED_FUNCTION_10_1();
    }

    v32 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v14 + 32))(v17, v4, v13);
    sub_24A36248C();
    sub_24A362480();
    v57 = v19;
    v58 = v18;
    v59 = v20;
    v60 = v21;
    v61 = v22;
    v62 = v23;
    v33 = v49;
    sub_24A34E7F0((uint64_t)&v57, v49);
    v57 = v19;
    v58 = v18;
    v59 = v20;
    v60 = v21;
    v61 = v22;
    v62 = v23;
    v34 = v51;
    sub_24A34EEA0(v50, (uint64_t)&v57, v51);
    v25 = v55;
    if (__swift_getEnumTagSinglePayload(v34, 1, v55) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
      sub_24A2AC1CC(v34, &qword_2579230C8);
      v29 = v56;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v56, v33, v25);
    }
    else
    {
      v50 = v14;
      v54 = v13;
      v35 = v33;
      v36 = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v52, v34, v25);
      if (qword_2544CF228 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_38();
      v51 = sub_24A361A84();
      v48[1] = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
      v38 = *(_QWORD *)(OUTLINED_FUNCTION_6_22() - 8);
      v39 = *(_QWORD *)(v38 + 72);
      v40 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      v41 = OUTLINED_FUNCTION_9_22();
      *(_OWORD *)(v41 + 16) = xmmword_24A363910;
      v42 = v41 + v40;
      v43 = *(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 16);
      v43(v42, v33, v25);
      OUTLINED_FUNCTION_14_23();
      v44 = v42 + v39;
      v45 = v52;
      v43(v44, v52, v25);
      OUTLINED_FUNCTION_14_23();
      v29 = v56;
      sub_24A362C84();
      v46 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v46(v45, v25);
      v46(v35, v25);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v17, v54);
    }
    v32 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v29, v32, 1, v25);
}

uint64_t sub_24A34E7F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  void (*v32)(char *);
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char *v41;
  double v42;
  double v43;
  void (*v44)(char *, uint64_t);
  double v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  double v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  void (*v55)(char *);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void (**v61)(char *);
  void (*v62)(char *);
  void (*v63)(void);
  uint64_t *v64;
  uint64_t v65;
  _QWORD v67[2];
  unsigned int v68;
  void (*v69)(char *);
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  char *v76;
  id v77;
  uint64_t v78;
  void (*v79)(char *);
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;

  v83 = a2;
  v3 = sub_24A362D2C();
  v4 = *(_QWORD *)(v3 - 8);
  v67[0] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_24A36317C();
  v79 = *(void (**)(char *))(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v8 = (char *)v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  v78 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v80 = (char *)v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v76 = (char *)v67 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v84 = (char *)v67 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v86 = (char *)v67 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v67 - v18;
  v20 = *(void **)a1;
  v21 = *(void **)(a1 + 16);
  v72 = *(id *)(a1 + 8);
  v73 = v21;
  v22 = *(void **)(a1 + 32);
  v74 = *(id *)(a1 + 24);
  v75 = v22;
  v77 = *(id *)(a1 + 40);
  sub_24A2E6148();
  v23 = v20;
  v85 = v19;
  sub_24A361934();
  v70 = v23;
  sub_24A361934();
  sub_24A362CF0();
  v68 = *MEMORY[0x24BEC2510];
  v69 = *(void (**)(char *))(v4 + 104);
  v24 = v6;
  v69(v6);
  sub_24A362384();
  sub_24A362360();
  v67[1] = sub_24A2AC148();
  v25 = v71;
  v81 = sub_24A361970();
  v82 = v26;
  swift_release();
  v27 = *(void (**)(char *, uint64_t))(v4 + 8);
  v28 = v6;
  v29 = v67[0];
  v27(v28, v67[0]);
  v30 = (void (*)(char *, uint64_t))*((_QWORD *)v79 + 1);
  v30(v8, v25);
  sub_24A362CF0();
  ((void (*)(char *, _QWORD, uint64_t))v69)(v24, v68, v29);
  sub_24A362360();
  v31 = v86;
  v69 = (void (*)(char *))sub_24A361970();
  v79 = v32;
  swift_release();
  v27(v24, v29);
  v30(v8, v25);
  v33 = v78;
  v34 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  v34(v84, v85, v9);
  v35 = v76;
  v34(v76, v31, v9);
  v36 = v70;
  v72 = v72;
  v37 = v73;
  v38 = v74;
  v39 = v75;
  v40 = v77;
  v41 = v80;
  sub_24A3619D0();
  sub_24A361940();
  v43 = v42;
  v44 = *(void (**)(char *, uint64_t))(v33 + 8);
  v44(v41, v9);
  v45 = round(v43);
  sub_24A3619D0();

  v46 = v9;
  v47 = v44;

  sub_24A361940();
  v49 = v48;
  v44(v41, v9);
  v44(v35, v9);
  v44(v84, v9);
  if (v45 == round(v49))
  {
    swift_bridgeObjectRelease();
    if (qword_2544CF228 != -1)
      swift_once();
    sub_24A361A84();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
    v50 = *(_QWORD *)(sub_24A362CA8() - 8);
    v51 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_24A3638F0;
    v53 = (uint64_t *)(v52 + v51);
    v54 = v82;
    *v53 = v81;
    v53[1] = v54;
    (*(void (**)(void))(v50 + 104))();
  }
  else
  {
    v55 = v69;
    if (qword_2544CF228 != -1)
      swift_once();
    sub_24A361A84();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
    v56 = sub_24A362CA8();
    v57 = *(_QWORD *)(v56 - 8);
    v58 = *(_QWORD *)(v57 + 72);
    v59 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
    v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_24A363910;
    v61 = (void (**)(char *))(v60 + v59);
    v62 = v79;
    *v61 = v55;
    v61[1] = v62;
    v63 = *(void (**)(void))(v57 + 104);
    ((void (*)(void (**)(char *), _QWORD, uint64_t))v63)(v61, *MEMORY[0x24BEC2470], v56);
    v64 = (uint64_t *)((char *)v61 + v58);
    v65 = v82;
    *v64 = v81;
    v64[1] = v65;
    v63();
  }
  sub_24A362C84();
  v47(v86, v46);
  return ((uint64_t (*)(char *, uint64_t))v47)(v85, v46);
}

void sub_24A34EEA0(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  _QWORD v49[7];
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[7];

  v63 = a1;
  v59 = a3;
  v53 = sub_24A361CD0();
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_24A361CE8();
  v49[6] = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v49[5] = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  v64 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v49[3] = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v49[4] = (char *)v49 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v49[2] = (char *)v49 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v49[1] = (char *)v49 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v58 = (char *)v49 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v57 = (char *)v49 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v49 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v49 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)v49 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v49 - v28;
  v30 = *(void **)a2;
  v31 = *(void **)(a2 + 8);
  v32 = *(void **)(a2 + 16);
  v33 = *(void **)(a2 + 32);
  v54 = *(void **)(a2 + 24);
  v55 = v33;
  v56 = *(void **)(a2 + 40);
  sub_24A362480();
  sub_24A2E6148();
  v34 = v30;
  sub_24A361934();
  sub_24A36248C();
  v35 = v34;
  v61 = v27;
  sub_24A361934();
  sub_24A361E08();
  v62 = v21;
  sub_24A361DF0();
  v36 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v37 = (uint64_t)v57;
  v36(v57, v29, v6);
  v38 = (uint64_t)v58;
  v60 = v24;
  v63 = v6;
  v36(v58, v24, v6);
  v65[0] = v35;
  v65[1] = v31;
  v39 = v54;
  v40 = v55;
  v65[2] = v32;
  v65[3] = v54;
  v41 = v56;
  v65[4] = v55;
  v65[5] = v56;
  v42 = v35;
  v43 = v31;
  v44 = v32;
  v45 = v39;
  v46 = v40;
  v47 = v41;
  v48 = (char *)sub_24A34F1DC + 4 * byte_24A368650[sub_24A3516AC(v37, v38, (uint64_t)v65)];
  __asm { BR              X10 }
}

uint64_t sub_24A34F1DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  v2 = *(_QWORD *)(v1 - 176);
  if (qword_2544CF228 != -1)
    swift_once();
  sub_24A361A84();
  v3 = *(_QWORD *)(v1 - 208);
  sub_24A362C78();
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 168) + 8);
  v4(*(_QWORD *)(v1 - 184), v2);
  v4(*(_QWORD *)(v1 - 200), v2);
  v4(*(_QWORD *)(v1 - 192), v2);
  v4(v0, v2);
  v5 = sub_24A362CB4();
  return __swift_storeEnumTagSinglePayload(v3, 0, 1, v5);
}

void sub_24A34FAB4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  void *v4;
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
  uint64_t EnumTagSinglePayload;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
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
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(unint64_t, uint64_t, uint64_t);
  unint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
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

  v54 = a2;
  v50 = a1;
  v56 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_50();
  v51 = v7;
  v55 = OUTLINED_FUNCTION_24_13();
  v53 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10();
  v52 = v9;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  v49 = (uint64_t)&v47 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v12);
  v13 = OUTLINED_FUNCTION_5_33();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3();
  v17 = v16 - v15;
  v19 = *a3;
  v18 = a3[1];
  v20 = a3[2];
  v21 = a3[3];
  v22 = a3[4];
  v23 = a3[5];
  sub_24A2A427C(v54, (uint64_t)v4);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v13);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    v25 = v55;
    OUTLINED_FUNCTION_25_13(EnumTagSinglePayload, &qword_257922CC8);
    if (qword_257922C90 != -1)
      swift_once();
    v26 = OUTLINED_FUNCTION_32_5();
    __swift_project_value_buffer(v26, (uint64_t)&unk_257924628);
    sub_24A36251C();
    v27 = OUTLINED_FUNCTION_30_7();
    if (OUTLINED_FUNCTION_9_3(v27))
    {
      *(_WORD *)OUTLINED_FUNCTION_14_1() = 0;
      OUTLINED_FUNCTION_13_23(&dword_24A2A1000, v28, v29, "Failed to create platter string for Feels Like due to missing extrema values");
      OUTLINED_FUNCTION_10_1();
    }

    v30 = 1;
    v31 = v56;
  }
  else
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v14 + 32))(v17, v4, v13);
    v32 = v19;
    v57 = v19;
    v58 = v18;
    v59 = v20;
    v60 = v21;
    v61 = v22;
    v62 = v23;
    v33 = v49;
    sub_24A34FE80((uint64_t)&v57, v49);
    v57 = v32;
    v58 = v18;
    v59 = v20;
    v60 = v21;
    v61 = v22;
    v62 = v23;
    v34 = v51;
    sub_24A350554(v50, (uint64_t)&v57, v51);
    v25 = v55;
    if (__swift_getEnumTagSinglePayload(v34, 1, v55) == 1)
    {
      v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
      OUTLINED_FUNCTION_25_13(v35, &qword_2579230C8);
      v31 = v56;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v56, v33, v25);
    }
    else
    {
      v48 = v17;
      v50 = v14;
      v54 = v13;
      v36 = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v52, v34, v25);
      if (qword_2544CF228 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_38();
      v51 = sub_24A361A84();
      v47 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
      v38 = *(_QWORD *)(OUTLINED_FUNCTION_6_22() - 8);
      v39 = *(_QWORD *)(v38 + 72);
      v40 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      v41 = OUTLINED_FUNCTION_9_22();
      *(_OWORD *)(v41 + 16) = xmmword_24A363910;
      v42 = v41 + v40;
      v43 = *(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 16);
      v43(v42, v33, v25);
      OUTLINED_FUNCTION_15_20();
      v44 = v42 + v39;
      v45 = v52;
      v43(v44, v52, v25);
      OUTLINED_FUNCTION_15_20();
      v31 = v56;
      sub_24A362C84();
      v46 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v46(v45, v25);
      v46(v33, v25);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v48, v54);
    }
    v30 = 0;
  }
  __swift_storeEnumTagSinglePayload(v31, v30, 1, v25);
  OUTLINED_FUNCTION_67();
}

uint64_t sub_24A34FE80@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char *v40;
  double v41;
  double v42;
  void (*v43)(char *, uint64_t);
  double v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  double v47;
  double v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  void (*v62)(void);
  uint64_t *v63;
  uint64_t v64;
  unint64_t v66;
  void (*v67)(char *);
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  char *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;

  v83 = a2;
  v70 = sub_24A362D2C();
  v3 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_24A36317C();
  v79 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  v78 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v80 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v76 = (char *)&v66 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v66 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v85 = (char *)&v66 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v86 = (char *)&v66 - v17;
  v18 = *(void **)a1;
  v19 = *(void **)(a1 + 16);
  v72 = *(id *)(a1 + 8);
  v73 = v19;
  v20 = *(void **)(a1 + 32);
  v74 = *(id *)(a1 + 24);
  v75 = v20;
  v77 = *(id *)(a1 + 40);
  sub_24A362480();
  sub_24A2E6148();
  v21 = v18;
  sub_24A361934();
  sub_24A36248C();
  v69 = v21;
  sub_24A361934();
  v22 = v7;
  sub_24A362CF0();
  LODWORD(v68) = *MEMORY[0x24BEC2510];
  v23 = v3;
  v67 = *(void (**)(char *))(v3 + 104);
  v24 = v70;
  v67(v5);
  sub_24A362384();
  sub_24A362360();
  v66 = sub_24A2AC148();
  v25 = v5;
  v26 = v71;
  v81 = sub_24A361970();
  v82 = v27;
  swift_release();
  v28 = *(void (**)(char *, uint64_t))(v23 + 8);
  v28(v25, v24);
  v29 = *(void (**)(char *, uint64_t))(v79 + 8);
  v29(v22, v26);
  sub_24A362CF0();
  ((void (*)(char *, _QWORD, uint64_t))v67)(v25, v68, v24);
  sub_24A362360();
  v30 = v85;
  v68 = sub_24A361970();
  v79 = v31;
  swift_release();
  v28(v25, v24);
  v29(v22, v26);
  v32 = v78;
  v33 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  v33(v84, v86, v8);
  v34 = v76;
  v33(v76, v30, v8);
  v35 = v69;
  v72 = v72;
  v36 = v73;
  v37 = v74;
  v38 = v75;
  v39 = v77;
  v40 = v80;
  sub_24A3619D0();
  sub_24A361940();
  v42 = v41;
  v43 = *(void (**)(char *, uint64_t))(v32 + 8);
  v43(v40, v8);
  v44 = round(v42);
  sub_24A3619D0();

  v45 = v8;
  v46 = v43;

  sub_24A361940();
  v48 = v47;
  v43(v40, v8);
  v43(v34, v8);
  v43(v84, v8);
  if (v44 == round(v48))
  {
    swift_bridgeObjectRelease();
    if (qword_2544CF228 != -1)
      swift_once();
    sub_24A361A84();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
    v49 = *(_QWORD *)(sub_24A362CA8() - 8);
    v50 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_24A3638F0;
    v52 = (uint64_t *)(v51 + v50);
    v53 = v82;
    *v52 = v81;
    v52[1] = v53;
    (*(void (**)(void))(v49 + 104))();
  }
  else
  {
    v54 = v68;
    if (qword_2544CF228 != -1)
      swift_once();
    sub_24A361A84();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
    v55 = sub_24A362CA8();
    v56 = *(_QWORD *)(v55 - 8);
    v57 = *(_QWORD *)(v56 + 72);
    v58 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_24A363910;
    v60 = (uint64_t *)(v59 + v58);
    v61 = v79;
    *v60 = v54;
    v60[1] = v61;
    v62 = *(void (**)(void))(v56 + 104);
    ((void (*)(uint64_t *, _QWORD, uint64_t))v62)(v60, *MEMORY[0x24BEC2470], v55);
    v63 = (uint64_t *)((char *)v60 + v57);
    v64 = v82;
    *v63 = v81;
    v63[1] = v64;
    v62();
  }
  sub_24A362C84();
  v46(v85, v45);
  return ((uint64_t (*)(char *, uint64_t))v46)(v86, v45);
}

void sub_24A350554(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  _QWORD v49[7];
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[7];

  v63 = a1;
  v59 = a3;
  v53 = sub_24A361CD0();
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_24A361CE8();
  v49[6] = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v49[5] = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  v64 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v49[3] = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v49[4] = (char *)v49 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v49[2] = (char *)v49 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v49[1] = (char *)v49 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v58 = (char *)v49 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v57 = (char *)v49 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v49 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v49 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)v49 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v49 - v28;
  v30 = *(void **)a2;
  v31 = *(void **)(a2 + 8);
  v32 = *(void **)(a2 + 16);
  v33 = *(void **)(a2 + 32);
  v54 = *(void **)(a2 + 24);
  v55 = v33;
  v56 = *(void **)(a2 + 40);
  sub_24A362480();
  sub_24A2E6148();
  v34 = v30;
  sub_24A361934();
  sub_24A36248C();
  v35 = v34;
  v61 = v27;
  sub_24A361934();
  sub_24A361E08();
  v62 = v21;
  sub_24A361DF0();
  v36 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v37 = (uint64_t)v57;
  v36(v57, v29, v6);
  v38 = (uint64_t)v58;
  v60 = v24;
  v63 = v6;
  v36(v58, v24, v6);
  v65[0] = v35;
  v65[1] = v31;
  v39 = v54;
  v40 = v55;
  v65[2] = v32;
  v65[3] = v54;
  v41 = v56;
  v65[4] = v55;
  v65[5] = v56;
  v42 = v35;
  v43 = v31;
  v44 = v32;
  v45 = v39;
  v46 = v40;
  v47 = v41;
  v48 = (char *)sub_24A350890 + 4 * byte_24A368656[sub_24A3516AC(v37, v38, (uint64_t)v65)];
  __asm { BR              X10 }
}

uint64_t sub_24A350890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  v2 = *(_QWORD *)(v1 - 176);
  if (qword_2544CF228 != -1)
    swift_once();
  sub_24A361A84();
  v3 = *(_QWORD *)(v1 - 208);
  sub_24A362C78();
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 168) + 8);
  v4(*(_QWORD *)(v1 - 184), v2);
  v4(*(_QWORD *)(v1 - 200), v2);
  v4(*(_QWORD *)(v1 - 192), v2);
  v4(v0, v2);
  v5 = sub_24A362CB4();
  return __swift_storeEnumTagSinglePayload(v3, 0, 1, v5);
}

void sub_24A351164(uint64_t a1@<X2>, uint64_t a2@<X8>)
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
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (*v29)(os_log_t, char *, uint64_t);
  os_log_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  os_log_t v80;
  NSObject *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  _QWORD v88[7];

  v85 = a2;
  v3 = sub_24A362D2C();
  v75 = *(_QWORD *)(v3 - 8);
  v76 = v3;
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_50();
  v74 = v5;
  v73 = sub_24A36317C();
  v72 = *(_QWORD *)(v73 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_50();
  v71 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10();
  v78 = v10;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  v77 = ((char *)&v69 - v12);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  v81 = ((char *)&v69 - v14);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v15);
  v80 = (os_log_t)((char *)&v69 - v16);
  OUTLINED_FUNCTION_9_0();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v69 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v69 - v21;
  v24 = *(void **)a1;
  v23 = *(void **)(a1 + 8);
  v25 = *(void **)(a1 + 16);
  v26 = *(void **)(a1 + 24);
  v27 = *(void **)(a1 + 32);
  v28 = *(void **)(a1 + 40);
  v79 = v27;
  sub_24A361F94();
  sub_24A361F7C();
  v82 = v9;
  v29 = *(void (**)(os_log_t, char *, uint64_t))(v9 + 16);
  v30 = v80;
  v86 = v22;
  v29(v80, v22, v8);
  v31 = (uint64_t)v81;
  v83 = v20;
  v84 = v8;
  v29(v81, v20, v8);
  v88[0] = v24;
  v88[1] = v23;
  v88[2] = v25;
  v88[3] = v26;
  v32 = v79;
  v88[4] = v79;
  v88[5] = v28;
  v33 = v24;
  v34 = v23;
  v35 = v25;
  v36 = v26;
  v37 = v32;
  v38 = v28;
  v39 = sub_24A3516AC((uint64_t)v30, v31, (uint64_t)v88);
  if (v39 == 5)
  {
    if (qword_257922C90 != -1)
      swift_once();
    v40 = OUTLINED_FUNCTION_32_5();
    v41 = __swift_project_value_buffer(v40, (uint64_t)&unk_257924628);
    v42 = (uint64_t)v77;
    v43 = v84;
    v29(v77, v86, v84);
    v44 = v78;
    v45 = (uint64_t)v83;
    v29((os_log_t)v78, v83, v43);
    sub_24A36251C();
    v46 = OUTLINED_FUNCTION_30_7();
    if (OUTLINED_FUNCTION_9_3(v46))
    {
      v47 = OUTLINED_FUNCTION_14_1();
      v81 = OUTLINED_FUNCTION_14_1();
      v88[0] = v81;
      *(_DWORD *)v47 = 136446466;
      sub_24A351F08(&qword_257925148, MEMORY[0x24BDCB5E0]);
      v80 = v41;
      LODWORD(v79) = (_DWORD)v41;
      v48 = OUTLINED_FUNCTION_27_12();
      v87 = OUTLINED_FUNCTION_28_11(v48, v49);
      OUTLINED_FUNCTION_18_21();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_38_0(v42);
      *(_WORD *)(v47 + 12) = 2082;
      v50 = OUTLINED_FUNCTION_27_12();
      v87 = OUTLINED_FUNCTION_28_11(v50, v51);
      OUTLINED_FUNCTION_18_21();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_38_0(v44);
      _os_log_impl(&dword_24A2A1000, v80, (os_log_type_t)v79, "Failed to make today Feels Like sentence due to unhandled case with apparentTemperature:%{public}s, actualTemperature:%{public}s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_10_1();
    }
    OUTLINED_FUNCTION_38_0(v42);
    OUTLINED_FUNCTION_38_0(v44);

    v67 = 1;
    v66 = v85;
  }
  else
  {
    sub_24A3519E4(v39);
    if (v53)
    {
      v80 = v53;
      v81 = v52;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579230C0);
      v54 = sub_24A362CA8();
      v78 = *(_QWORD *)(v54 - 8);
      v79 = (void *)v54;
      v55 = (*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
      v56 = swift_allocObject();
      v77 = v56;
      *(_OWORD *)(v56 + 16) = xmmword_24A3638F0;
      v70 = (uint64_t *)(v56 + v55);
      v57 = v71;
      sub_24A362CF0();
      v59 = v74;
      v58 = v75;
      v60 = v76;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v75 + 104))(v74, *MEMORY[0x24BEC2510], v76);
      sub_24A362384();
      sub_24A362360();
      sub_24A2AC148();
      v61 = v73;
      v62 = sub_24A361970();
      v64 = v63;
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v59, v60);
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v57, v61);
      v65 = v70;
      *v70 = v62;
      v65[1] = v64;
      (*(void (**)(void))(v78 + 104))();
      v66 = v85;
      sub_24A362C84();
      v67 = 0;
      v45 = (uint64_t)v83;
    }
    else
    {
      v45 = (uint64_t)v83;
      v67 = 1;
      v66 = v85;
    }
  }
  OUTLINED_FUNCTION_38_0(v45);
  OUTLINED_FUNCTION_38_0((uint64_t)v86);
  v68 = OUTLINED_FUNCTION_24_13();
  __swift_storeEnumTagSinglePayload(v66, v67, 1, v68);
  OUTLINED_FUNCTION_67();
}

uint64_t sub_24A3516AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v20;
  void *v21;
  void *v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3();
  v9 = v8 - v7;
  v10 = *(void **)a3;
  v11 = *(void **)(a3 + 24);
  v21 = *(void **)(a3 + 16);
  v22 = *(void **)(a3 + 8);
  v13 = *(void **)(a3 + 32);
  v12 = *(void **)(a3 + 40);
  sub_24A3619D0();
  OUTLINED_FUNCTION_26_12();
  v15 = v14;
  OUTLINED_FUNCTION_14_7(v9);
  v16 = round(v15);
  sub_24A3619D0();

  OUTLINED_FUNCTION_26_12();
  v18 = v17;
  OUTLINED_FUNCTION_14_7(v9);
  if (v16 == round(v18))
  {
    OUTLINED_FUNCTION_14_7(a2);
    OUTLINED_FUNCTION_14_7(a1);
    return 0;
  }
  sub_24A351F08(&qword_257925150, MEMORY[0x24BDCB5C0]);
  if ((OUTLINED_FUNCTION_2_33() & 1) == 0)
    goto LABEL_27;
  if (qword_257922CB0 != -1)
    swift_once();
  __swift_project_value_buffer(v6, (uint64_t)qword_257925118);
  if ((OUTLINED_FUNCTION_2_33() & 1) == 0)
  {
    OUTLINED_FUNCTION_14_7(a2);
    OUTLINED_FUNCTION_14_7(a1);
    return 1;
  }
  else
  {
LABEL_27:
    if ((OUTLINED_FUNCTION_2_33() & 1) != 0)
    {
      if (qword_257922CB0 != -1)
        swift_once();
      __swift_project_value_buffer(v6, (uint64_t)qword_257925118);
      OUTLINED_FUNCTION_21_16();
      if ((sub_24A361910() & 1) != 0)
      {
        OUTLINED_FUNCTION_14_7(a2);
        OUTLINED_FUNCTION_14_7(a1);
        return 2;
      }
    }
    sub_24A2E6148();
    if ((OUTLINED_FUNCTION_4_32() & 1) == 0)
      goto LABEL_16;
    if (qword_257922CB8 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_257925130);
    if ((OUTLINED_FUNCTION_2_33() & 1) == 0)
    {
      OUTLINED_FUNCTION_14_7(a2);
      OUTLINED_FUNCTION_14_7(a1);
      return 3;
    }
    else
    {
LABEL_16:
      if ((OUTLINED_FUNCTION_4_32() & 1) != 0)
      {
        if (qword_257922CB8 != -1)
          swift_once();
        __swift_project_value_buffer(v6, (uint64_t)qword_257925130);
        v20 = OUTLINED_FUNCTION_4_32();
        OUTLINED_FUNCTION_14_7(a2);
        OUTLINED_FUNCTION_14_7(a1);
        if ((v20 & 1) != 0)
          return 4;
      }
      else
      {
        OUTLINED_FUNCTION_14_7(a2);
        OUTLINED_FUNCTION_14_7(a1);
      }
      return 5;
    }
  }
}

void sub_24A3519E4(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_24A361CD0();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_24A361CE8();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X9 }
}

uint64_t sub_24A351A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  sub_24A361CAC();
  sub_24A361CDC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  v6 = sub_24A361CC4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v0);
  if ((v6 & 1) != 0)
  {
    if (qword_2544CF228 != -1)
      swift_once();
  }
  else if (qword_2544CF228 != -1)
  {
    swift_once();
  }
  return sub_24A361A84();
}

uint64_t sub_24A351E58(uint64_t a1)
{
  return sub_24A351E80(a1, qword_257925118);
}

uint64_t sub_24A351E6C(uint64_t a1)
{
  return sub_24A351E80(a1, qword_257925130);
}

uint64_t sub_24A351E80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5B8);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  v4 = objc_msgSend((id)objc_opt_self(), sel_fahrenheit);
  OUTLINED_FUNCTION_21_16();
  return sub_24A361934();
}

uint64_t sub_24A351F08(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF5B8);
    result = MEMORY[0x24BD0E6E0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_38()
{
  return 0x4025204025;
}

uint64_t OUTLINED_FUNCTION_2_33()
{
  return sub_24A362E64();
}

uint64_t OUTLINED_FUNCTION_4_32()
{
  return sub_24A361910();
}

uint64_t OUTLINED_FUNCTION_5_33()
{
  return sub_24A362498();
}

void OUTLINED_FUNCTION_13_23(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_14_23()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_15_20()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_18_21()
{
  return sub_24A363200();
}

unint64_t OUTLINED_FUNCTION_21_16()
{
  return sub_24A2E6148();
}

uint64_t OUTLINED_FUNCTION_24_13()
{
  return sub_24A362CB4();
}

uint64_t OUTLINED_FUNCTION_25_13(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_24A2AC1CC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_26_12()
{
  return sub_24A361940();
}

uint64_t OUTLINED_FUNCTION_27_12()
{
  return sub_24A36332C();
}

uint64_t OUTLINED_FUNCTION_28_11(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_24A34A260(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t ChartPastDataTreatment.hash(into:)()
{
  return sub_24A363380();
}

BOOL static ChartPastDataTreatment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChartPastDataTreatment.hashValue.getter()
{
  sub_24A363374();
  sub_24A363380();
  return sub_24A3633A4();
}

unint64_t sub_24A3520CC()
{
  unint64_t result;

  result = qword_257925158;
  if (!qword_257925158)
  {
    result = MEMORY[0x24BD0E6E0](&protocol conformance descriptor for ChartPastDataTreatment, &type metadata for ChartPastDataTreatment);
    atomic_store(result, (unint64_t *)&qword_257925158);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ChartPastDataTreatment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A352158 + 4 * byte_24A3686E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A35218C + 4 * byte_24A3686E0[v4]))();
}

uint64_t sub_24A35218C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A352194(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A35219CLL);
  return result;
}

uint64_t sub_24A3521A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A3521B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A3521B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A3521BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChartPastDataTreatment()
{
  return &type metadata for ChartPastDataTreatment;
}

__n128 ChartLineMark.init(chartData:dateExtrema:xAxisRange:yAxisRange:lineStyle:colorSchemeContrast:shadow:useSecondValue:showAccessibilityLabels:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>)
{
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
  uint64_t v32;
  int *v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __n128 result;
  __n128 v39;

  v19 = *a2;
  v20 = *((_BYTE *)a2 + 8);
  v21 = a2[2];
  v22 = *((_BYTE *)a2 + 24);
  v23 = a2[4];
  v24 = *((_BYTE *)a2 + 40);
  v25 = a2[6];
  v26 = *((_BYTE *)a2 + 56);
  v27 = a2[8];
  v28 = *((_BYTE *)a2 + 72);
  v29 = a2[10];
  v30 = *((_BYTE *)a2 + 88);
  v31 = *a6;
  v39 = *(__n128 *)(a6 + 1);
  v32 = a6[3];
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = v19;
  *(_BYTE *)(a9 + 16) = v20;
  *(_QWORD *)(a9 + 24) = v21;
  *(_BYTE *)(a9 + 32) = v22;
  *(_QWORD *)(a9 + 40) = v23;
  *(_BYTE *)(a9 + 48) = v24;
  *(_QWORD *)(a9 + 56) = v25;
  *(_BYTE *)(a9 + 64) = v26;
  *(_QWORD *)(a9 + 72) = v27;
  *(_BYTE *)(a9 + 80) = v28;
  *(_QWORD *)(a9 + 88) = v29;
  *(_BYTE *)(a9 + 96) = v30;
  v33 = (int *)type metadata accessor for ChartLineMark(0);
  v34 = (double *)(a9 + v33[7]);
  *v34 = a10;
  v34[1] = a11;
  sub_24A3172BC(a3, a9 + v33[6]);
  sub_24A3362C0(a4, a9 + v33[8], type metadata accessor for ChartLineStyle);
  v35 = a9 + v33[11];
  v36 = OUTLINED_FUNCTION_1_39();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v35, a5, v36);
  v37 = a9 + v33[12];
  *(_QWORD *)v37 = v31;
  result = v39;
  *(__n128 *)(v37 + 8) = v39;
  *(_QWORD *)(v37 + 24) = v32;
  *(_BYTE *)(a9 + v33[9]) = a7;
  *(_BYTE *)(a9 + v33[10]) = a8;
  return result;
}

uint64_t type metadata accessor for ChartLineMark(uint64_t a1)
{
  return sub_24A2AE36C(a1, qword_2579251D8);
}

void ChartLineMark.body.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int *v31;
  int EnumCaseMultiPayload;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  __n128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, char *, uint64_t);
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, char *, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  int *v107;
  char v108;
  uint64_t v109;
  char v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
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
  void (*v130)(uint64_t, uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  int v138;
  int v139;
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
  uint64_t v159[2];
  __int128 v160;
  __int128 v161;
  uint64_t v162;

  v156 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257925160);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_50();
  v151 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257925168);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_50();
  v153 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257924BE8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_7();
  v9 = v7 - v8;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v130 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v150 = (uint64_t)&v130 - v14;
  v154 = OUTLINED_FUNCTION_29_11();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_7_7();
  v18 = v16 - v17;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v130 - v20;
  v22 = sub_24A361C94();
  v157 = *(_QWORD *)(v22 - 8);
  v158 = v22;
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_7_7();
  v152 = v23 - v24;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v130 - v26;
  type metadata accessor for ChartLineStrokeStyle(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v130 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = (int *)type metadata accessor for ChartLineMark(0);
  v155 = (uint64_t)v1 + v31[8];
  sub_24A333B08(v155, (uint64_t)v30, type metadata accessor for ChartLineStrokeStyle);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v34 = v157;
      v33 = v158;
      v35 = v152;
      (*(void (**)(uint64_t, char *, uint64_t))(v157 + 32))(v152, v30, v158);
      v36 = (uint64_t)v1 + v31[6];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
      v37 = sub_24A361BEC();
      v38 = (int *)v154;
      if ((v37 & 1) != 0)
      {
        v39 = *v1;
        v151 = v1[1];
        LODWORD(v150) = *((unsigned __int8 *)v1 + 16);
        v149 = v1[3];
        LODWORD(v148) = *((unsigned __int8 *)v1 + 32);
        v147 = v1[5];
        LODWORD(v146) = *((unsigned __int8 *)v1 + 48);
        v145 = v1[7];
        LODWORD(v144) = *((unsigned __int8 *)v1 + 64);
        v143 = v1[9];
        LODWORD(v142) = *((unsigned __int8 *)v1 + 80);
        v141 = v1[11];
        v40 = v9 + *(int *)(v154 + 24);
        LODWORD(v140) = *((unsigned __int8 *)v1 + 96);
        sub_24A313724(v36, v40, &qword_2544CF218);
        OUTLINED_FUNCTION_11_22();
        v42 = *((_BYTE *)v1 + v41);
        OUTLINED_FUNCTION_25_14(v43, v9 + v38[10], type metadata accessor for ChartLineStyle);
        OUTLINED_FUNCTION_7_8();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_0_32();
        v44 = *((_BYTE *)v1 + v31[10]);
        v45 = (uint64_t)v1 + v31[11];
        OUTLINED_FUNCTION_1_39();
        v46 = OUTLINED_FUNCTION_14_24();
        v33 = v158;
        v47(v46, v45);
        v48 = OUTLINED_FUNCTION_9_26();
        v50 = v9 + v49;
        (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v157 + 16))(v9 + v49, v35, v33, v48);
        __swift_storeEnumTagSinglePayload(v50, 0, 1, v33);
        OUTLINED_FUNCTION_22_12();
        __swift_storeEnumTagSinglePayload(v51, v52, v53, v33);
        v54 = v151;
        *(_QWORD *)v9 = v39;
        *(_QWORD *)(v9 + 8) = v54;
        *(_BYTE *)(v9 + 16) = v150;
        *(_QWORD *)(v9 + 24) = v149;
        *(_BYTE *)(v9 + 32) = v148;
        *(_QWORD *)(v9 + 40) = v147;
        *(_BYTE *)(v9 + 48) = v146;
        *(_QWORD *)(v9 + 56) = v145;
        *(_BYTE *)(v9 + 64) = v144;
        *(_QWORD *)(v9 + 72) = v143;
        *(_BYTE *)(v9 + 80) = v142;
        *(_QWORD *)(v9 + 88) = v141;
        *(_BYTE *)(v9 + 96) = v140;
        v34 = v157;
        OUTLINED_FUNCTION_31_11((_QWORD *)(v9 + v38[7]));
        OUTLINED_FUNCTION_24_14((_QWORD *)(v9 + v55));
        *(_BYTE *)(v9 + v56) = v42;
        OUTLINED_FUNCTION_4_33(v9 + v38[11]);
        *(_BYTE *)(v9 + v57) = v44;
        OUTLINED_FUNCTION_19_19(v9 + v38[16]);
        OUTLINED_FUNCTION_18_22(v9);
      }
      else
      {
        OUTLINED_FUNCTION_23_13(v9);
      }
      v126 = v35;
      v127 = v153;
      sub_24A313724(v9, v153, &qword_257924BE8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257925178);
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_34_9(v127);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257925170);
      OUTLINED_FUNCTION_26_13();
      OUTLINED_FUNCTION_32_9(v127);
      sub_24A3365B0(v9, &qword_257924BE8);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v126, v33);
    }
    else
    {
      v106 = *v1;
      v157 = v1[1];
      LODWORD(v153) = *((unsigned __int8 *)v1 + 16);
      v152 = v1[3];
      LODWORD(v151) = *((unsigned __int8 *)v1 + 32);
      v150 = v1[5];
      LODWORD(v149) = *((unsigned __int8 *)v1 + 48);
      v148 = v1[7];
      LODWORD(v147) = *((unsigned __int8 *)v1 + 64);
      v146 = v1[9];
      LODWORD(v145) = *((unsigned __int8 *)v1 + 80);
      v144 = v1[11];
      v107 = (int *)v154;
      v108 = *((_BYTE *)v1 + 96);
      sub_24A313724((uint64_t)v1 + v31[6], v18 + *(int *)(v154 + 24), &qword_2544CF218);
      OUTLINED_FUNCTION_11_22();
      v110 = *((_BYTE *)v1 + v109);
      sub_24A333B08(v155, v18 + v107[10], type metadata accessor for ChartLineStyle);
      OUTLINED_FUNCTION_7_8();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_0_32();
      v111 = *((_BYTE *)v1 + v31[10]);
      v112 = (uint64_t)v1 + v31[11];
      OUTLINED_FUNCTION_1_39();
      v113 = OUTLINED_FUNCTION_14_24();
      v114(v113, v112);
      OUTLINED_FUNCTION_9_26();
      OUTLINED_FUNCTION_22_12();
      v115 = v158;
      __swift_storeEnumTagSinglePayload(v116, v117, v118, v158);
      OUTLINED_FUNCTION_22_12();
      __swift_storeEnumTagSinglePayload(v119, v120, v121, v115);
      v122 = v157;
      *(_QWORD *)v18 = v106;
      *(_QWORD *)(v18 + 8) = v122;
      *(_BYTE *)(v18 + 16) = v153;
      *(_QWORD *)(v18 + 24) = v152;
      *(_BYTE *)(v18 + 32) = v151;
      *(_QWORD *)(v18 + 40) = v150;
      *(_BYTE *)(v18 + 48) = v149;
      *(_QWORD *)(v18 + 56) = v148;
      *(_BYTE *)(v18 + 64) = v147;
      *(_QWORD *)(v18 + 72) = v146;
      *(_BYTE *)(v18 + 80) = v145;
      *(_QWORD *)(v18 + 88) = v144;
      *(_BYTE *)(v18 + 96) = v108;
      OUTLINED_FUNCTION_31_11((_QWORD *)(v18 + v107[7]));
      OUTLINED_FUNCTION_24_14((_QWORD *)(v18 + v123));
      *(_BYTE *)(v18 + v124) = v110;
      OUTLINED_FUNCTION_4_33(v18 + v107[11]);
      *(_BYTE *)(v18 + v125) = v111;
      OUTLINED_FUNCTION_19_19(v18 + v107[16]);
      sub_24A333B08(v18, v156, type metadata accessor for StyledLineMark);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257925170);
      swift_storeEnumTagMultiPayload();
      swift_retain();
      OUTLINED_FUNCTION_28_12();
    }
  }
  else
  {
    v137 = v13;
    v58 = *(void (**)(char *, char *, uint64_t))(v157 + 32);
    v135 = v27;
    v59 = v30;
    v60 = v158;
    v58(v27, v59, v158);
    v61 = *v1;
    v152 = v1[1];
    LODWORD(v149) = *((unsigned __int8 *)v1 + 16);
    v148 = v1[3];
    LODWORD(v147) = *((unsigned __int8 *)v1 + 32);
    v146 = v1[5];
    LODWORD(v145) = *((unsigned __int8 *)v1 + 48);
    v144 = v1[7];
    LODWORD(v143) = *((unsigned __int8 *)v1 + 64);
    v142 = v1[9];
    LODWORD(v141) = *((unsigned __int8 *)v1 + 80);
    v140 = v1[11];
    v136 = (uint64_t)v1 + v31[6];
    v62 = (int *)v154;
    v63 = (uint64_t)&v21[*(int *)(v154 + 24)];
    v139 = *((unsigned __int8 *)v1 + 96);
    sub_24A313724(v136, v63, &qword_2544CF218);
    OUTLINED_FUNCTION_11_22();
    v138 = *((unsigned __int8 *)v1 + v64);
    OUTLINED_FUNCTION_25_14(v65, (uint64_t)&v21[v62[10]], type metadata accessor for ChartLineStyle);
    OUTLINED_FUNCTION_7_8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24A3626FC();
    v66 = *((unsigned __int8 *)v1 + v31[10]);
    v67 = (uint64_t)v1 + v31[11];
    OUTLINED_FUNCTION_1_39();
    v68 = OUTLINED_FUNCTION_14_24();
    v132 = v67;
    v131 = v69;
    v130 = v70;
    ((void (*)(uint64_t, uint64_t))v70)(v68, v67);
    v71 = (uint64_t *)((char *)v1 + v31[12]);
    v72 = *v71;
    v73 = v71[1];
    v74 = v71[2];
    v75 = v71[3];
    OUTLINED_FUNCTION_22_12();
    __swift_storeEnumTagSinglePayload(v76, v77, v78, v60);
    v79 = (uint64_t)&v21[v62[13]];
    v80 = *(void (**)(uint64_t, char *, uint64_t))(v157 + 16);
    v81 = v135;
    v80(v79, v135, v60);
    __swift_storeEnumTagSinglePayload(v79, 0, 1, v60);
    v134 = v61;
    v82 = v152;
    *(_QWORD *)v21 = v61;
    *((_QWORD *)v21 + 1) = v82;
    v21[16] = v149;
    *((_QWORD *)v21 + 3) = v148;
    v21[32] = v147;
    *((_QWORD *)v21 + 5) = v146;
    v21[48] = v145;
    *((_QWORD *)v21 + 7) = v144;
    v21[64] = v143;
    *((_QWORD *)v21 + 9) = v142;
    v21[80] = v141;
    *((_QWORD *)v21 + 11) = v140;
    v21[96] = v139;
    OUTLINED_FUNCTION_31_11(&v21[v62[7]]);
    OUTLINED_FUNCTION_24_14(&v21[v83]);
    v21[v84] = v138;
    v85 = &v21[v62[11]];
    v86 = v161;
    *(_OWORD *)v85 = v160;
    *((_OWORD *)v85 + 1) = v86;
    *((_QWORD *)v85 + 4) = v162;
    v87 = v62[14];
    v133 = v66;
    v21[v87] = v66;
    v88 = v136;
    v89 = &v21[v62[16]];
    *(_QWORD *)v89 = v72;
    *((_QWORD *)v89 + 1) = v73;
    *((_QWORD *)v89 + 2) = v74;
    *((_QWORD *)v89 + 3) = v75;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    swift_retain();
    v90 = sub_24A361BEC();
    v91 = v151;
    v92 = v81;
    v93 = v150;
    if ((v90 & 1) != 0)
    {
      sub_24A313724(v88, v150 + v62[6], &qword_2544CF218);
      sub_24A333B08(v155, v93 + v62[10], type metadata accessor for ChartLineStyle);
      v94 = v134;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_0_32();
      v130(v93 + v62[15], v132, v131);
      v95 = v93 + v62[12];
      v96 = v80;
      v97 = v158;
      v96(v95, v92, v158);
      __swift_storeEnumTagSinglePayload(v95, 0, 1, v97);
      OUTLINED_FUNCTION_22_12();
      __swift_storeEnumTagSinglePayload(v98, v99, v100, v97);
      v101 = v152;
      *(_QWORD *)v93 = v94;
      *(_QWORD *)(v93 + 8) = v101;
      *(_BYTE *)(v93 + 16) = v149;
      *(_QWORD *)(v93 + 24) = v148;
      *(_BYTE *)(v93 + 32) = v147;
      *(_QWORD *)(v93 + 40) = v146;
      *(_BYTE *)(v93 + 48) = v145;
      *(_QWORD *)(v93 + 56) = v144;
      *(_BYTE *)(v93 + 64) = v143;
      *(_QWORD *)(v93 + 72) = v142;
      *(_BYTE *)(v93 + 80) = v141;
      *(_QWORD *)(v93 + 88) = v140;
      *(_BYTE *)(v93 + 96) = v139;
      OUTLINED_FUNCTION_31_11((_QWORD *)(v93 + v62[7]));
      v103 = (_QWORD *)(v93 + v102);
      *v103 = 0x694C646568736144;
      v103[1] = 0xEA0000000000656ELL;
      *(_BYTE *)(v93 + v62[9]) = v138;
      OUTLINED_FUNCTION_4_33(v93 + v62[11]);
      *(_BYTE *)(v93 + v104) = v133;
      v105 = (_QWORD *)(v93 + v62[16]);
      *v105 = v72;
      v105[1] = v73;
      v105[2] = v74;
      v105[3] = v75;
      OUTLINED_FUNCTION_18_22(v93);
    }
    else
    {
      OUTLINED_FUNCTION_23_13(v150);
    }
    sub_24A333B08((uint64_t)v21, v18, type metadata accessor for StyledLineMark);
    v159[0] = v18;
    v128 = (uint64_t)v137;
    OUTLINED_FUNCTION_34_9(v93);
    v159[1] = v128;
    sub_24A333C74(v159, v91);
    OUTLINED_FUNCTION_32_9(v128);
    OUTLINED_FUNCTION_28_12();
    v129 = v153;
    sub_24A313724(v91, v153, &qword_257925160);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257925178);
    swift_storeEnumTagMultiPayload();
    sub_24A3365B0(v91, &qword_257925160);
    sub_24A313724(v129, v156, &qword_257925168);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257925170);
    OUTLINED_FUNCTION_26_13();
    sub_24A3365B0(v129, &qword_257925168);
    OUTLINED_FUNCTION_32_9(v93);
    sub_24A333C3C((uint64_t)v21, type metadata accessor for StyledLineMark);
    (*(void (**)(char *, uint64_t))(v157 + 8))(v92, v158);
  }
}

uint64_t type metadata accessor for StyledLineMark(uint64_t a1)
{
  return sub_24A2AE36C(a1, (uint64_t *)&unk_2579252A8);
}

uint64_t sub_24A3530C8()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ChartLineMark(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  int *v42;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    memcpy(a1 + 1, a2 + 1, 0x59uLL);
    v8 = a3[6];
    v9 = (char *)v7 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_24A361C94();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    v12(&v9[*(int *)(v13 + 36)], &v10[*(int *)(v13 + 36)], v11);
    v14 = a3[8];
    *(_OWORD *)((char *)v7 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    v15 = (char *)v7 + v14;
    v16 = (char *)a2 + v14;
    v17 = type metadata accessor for ChartLineStrokeStyle(0);
    v42 = a3;
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v12(v15, v16, v11);
      swift_storeEnumTagMultiPayload();
    }
    v18 = (int *)type metadata accessor for ChartLineStyle(0);
    *(_QWORD *)&v15[v18[5]] = *(_QWORD *)&v16[v18[5]];
    v19 = v18[6];
    v20 = &v15[v19];
    v21 = &v16[v19];
    v22 = *(_QWORD *)v21;
    v23 = *((_QWORD *)v21 + 1);
    v24 = *((_QWORD *)v21 + 2);
    v25 = v21[24];
    sub_24A2D7D74(*(_QWORD *)v21, v23, v24, v25);
    *(_QWORD *)v20 = v22;
    *((_QWORD *)v20 + 1) = v23;
    *((_QWORD *)v20 + 2) = v24;
    v20[24] = v25;
    *(_QWORD *)&v15[v18[7]] = *(_QWORD *)&v16[v18[7]];
    v26 = v18[8];
    v27 = &v15[v26];
    v28 = &v16[v26];
    *(_QWORD *)v27 = *(_QWORD *)v28;
    *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
    *((_QWORD *)v27 + 3) = *((_QWORD *)v28 + 3);
    *(_QWORD *)&v15[v18[9]] = *(_QWORD *)&v16[v18[9]];
    v29 = v18[10];
    v30 = &v15[v29];
    v31 = &v16[v29];
    *(_QWORD *)v30 = *(_QWORD *)v31;
    v30[8] = v31[8];
    v32 = v42[10];
    *((_BYTE *)v7 + v42[9]) = *((_BYTE *)a2 + v42[9]);
    *((_BYTE *)v7 + v32) = *((_BYTE *)a2 + v32);
    v33 = v42[11];
    v34 = (char *)v7 + v33;
    v35 = (char *)a2 + v33;
    v36 = sub_24A36287C();
    v37 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37(v34, v35, v36);
    v38 = v42[12];
    v39 = (char *)v7 + v38;
    v40 = (char *)a2 + v38;
    *(_QWORD *)v39 = *(_QWORD *)v40;
    *(_OWORD *)(v39 + 8) = *(_OWORD *)(v40 + 8);
    *((_QWORD *)v39 + 3) = *((_QWORD *)v40 + 3);
  }
  swift_retain();
  return v7;
}

uint64_t destroy for ChartLineMark(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_24A361C94();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v6(v4 + *(int *)(v7 + 36), v5);
  v8 = a1 + a2[8];
  type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() <= 1)
    v6(v8, v5);
  v9 = type metadata accessor for ChartLineStyle(0);
  sub_24A2D7DDC(*(_QWORD *)(v8 + *(int *)(v9 + 24)), *(_QWORD *)(v8 + *(int *)(v9 + 24) + 8), *(_QWORD *)(v8 + *(int *)(v9 + 24) + 16), *(_BYTE *)(v8 + *(int *)(v9 + 24) + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = a1 + a2[11];
  v11 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  return swift_release();
}

_QWORD *initializeWithCopy for ChartLineMark(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  int *v40;

  *a1 = *a2;
  memcpy(a1 + 1, a2 + 1, 0x59uLL);
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24A361C94();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v10(&v7[*(int *)(v11 + 36)], &v8[*(int *)(v11 + 36)], v9);
  v12 = a3[8];
  v40 = a3;
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v10(v13, v14, v9);
    swift_storeEnumTagMultiPayload();
  }
  v16 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v13[v16[5]] = *(_QWORD *)&v14[v16[5]];
  v17 = v16[6];
  v18 = &v13[v17];
  v19 = &v14[v17];
  v20 = *(_QWORD *)v19;
  v21 = *((_QWORD *)v19 + 1);
  v22 = *((_QWORD *)v19 + 2);
  v23 = v19[24];
  sub_24A2D7D74(*(_QWORD *)v19, v21, v22, v23);
  *(_QWORD *)v18 = v20;
  *((_QWORD *)v18 + 1) = v21;
  *((_QWORD *)v18 + 2) = v22;
  v18[24] = v23;
  *(_QWORD *)&v13[v16[7]] = *(_QWORD *)&v14[v16[7]];
  v24 = v16[8];
  v25 = &v13[v24];
  v26 = &v14[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
  *((_QWORD *)v25 + 3) = *((_QWORD *)v26 + 3);
  *(_QWORD *)&v13[v16[9]] = *(_QWORD *)&v14[v16[9]];
  v27 = v16[10];
  v28 = &v13[v27];
  v29 = &v14[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  v28[8] = v29[8];
  v30 = v40[10];
  *((_BYTE *)a1 + v40[9]) = *((_BYTE *)a2 + v40[9]);
  *((_BYTE *)a1 + v30) = *((_BYTE *)a2 + v30);
  v31 = v40[11];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  v34 = sub_24A36287C();
  v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v35(v32, v33, v34);
  v36 = v40[12];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *(_OWORD *)(v37 + 8) = *(_OWORD *)(v38 + 8);
  *((_QWORD *)v37 + 3) = *((_QWORD *)v38 + 3);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ChartLineMark(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  int *v53;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v10;
  v11 = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v11;
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_24A361C94();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 24);
  v17(v13, v14, v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v17(v13 + *(int *)(v18 + 36), v14 + *(int *)(v18 + 36), v15);
  v19 = a3[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  v53 = a3;
  v22 = a3[8];
  v23 = (char *)(a1 + v22);
  v24 = (char *)(a2 + v22);
  if (a1 != a2)
  {
    sub_24A333C3C(a1 + v22, type metadata accessor for ChartLineStrokeStyle);
    v25 = type metadata accessor for ChartLineStrokeStyle(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v23, v24, v15);
      swift_storeEnumTagMultiPayload();
    }
  }
  v26 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v23[v26[5]] = *(_QWORD *)&v24[v26[5]];
  v27 = v26[6];
  v28 = &v23[v27];
  v29 = &v24[v27];
  v30 = *(_QWORD *)v29;
  v31 = *((_QWORD *)v29 + 1);
  v32 = *((_QWORD *)v29 + 2);
  v33 = v29[24];
  sub_24A2D7D74(*(_QWORD *)v29, v31, v32, v33);
  v34 = *(_QWORD *)v28;
  v35 = *((_QWORD *)v28 + 1);
  v36 = *((_QWORD *)v28 + 2);
  v37 = v28[24];
  *(_QWORD *)v28 = v30;
  *((_QWORD *)v28 + 1) = v31;
  *((_QWORD *)v28 + 2) = v32;
  v28[24] = v33;
  sub_24A2D7DDC(v34, v35, v36, v37);
  *(_QWORD *)&v23[v26[7]] = *(_QWORD *)&v24[v26[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v38 = v26[8];
  v39 = &v23[v38];
  v40 = &v24[v38];
  *(_QWORD *)&v23[v38] = *(_QWORD *)&v24[v38];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  *((_QWORD *)v39 + 2) = *((_QWORD *)v40 + 2);
  *((_QWORD *)v39 + 3) = *((_QWORD *)v40 + 3);
  *(_QWORD *)&v23[v26[9]] = *(_QWORD *)&v24[v26[9]];
  v41 = v26[10];
  v42 = &v23[v41];
  v43 = &v24[v41];
  v44 = *(_QWORD *)v43;
  v42[8] = v43[8];
  *(_QWORD *)v42 = v44;
  *(_BYTE *)(a1 + v53[9]) = *(_BYTE *)(a2 + v53[9]);
  *(_BYTE *)(a1 + v53[10]) = *(_BYTE *)(a2 + v53[10]);
  v45 = v53[11];
  v46 = a1 + v45;
  v47 = a2 + v45;
  v48 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 24))(v46, v47, v48);
  v49 = v53[12];
  v50 = (_QWORD *)(a1 + v49);
  v51 = (_QWORD *)(a2 + v49);
  *(_QWORD *)(a1 + v49) = *(_QWORD *)(a2 + v49);
  swift_retain();
  swift_release();
  v50[1] = v51[1];
  v50[2] = v51[2];
  v50[3] = v51[3];
  return a1;
}

_QWORD *initializeWithTake for ChartLineMark(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  __int128 v35;

  *a1 = *a2;
  memcpy(a1 + 1, a2 + 1, 0x59uLL);
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24A361C94();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v10(&v7[*(int *)(v11 + 36)], &v8[*(int *)(v11 + 36)], v9);
  v12 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v10(v13, v14, v9);
    swift_storeEnumTagMultiPayload();
  }
  v16 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v13[v16[5]] = *(_QWORD *)&v14[v16[5]];
  v17 = v16[6];
  v18 = &v13[v17];
  v19 = &v14[v17];
  *(_OWORD *)(v18 + 9) = *(_OWORD *)(v19 + 9);
  *(_OWORD *)v18 = *(_OWORD *)v19;
  *(_QWORD *)&v13[v16[7]] = *(_QWORD *)&v14[v16[7]];
  v20 = v16[8];
  v21 = &v13[v20];
  v22 = &v14[v20];
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  *(_QWORD *)&v13[v16[9]] = *(_QWORD *)&v14[v16[9]];
  v24 = v16[10];
  v25 = &v13[v24];
  v26 = &v14[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v25[8] = v26[8];
  v27 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v27) = *((_BYTE *)a2 + v27);
  v28 = a3[11];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_24A36287C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  v32 = a3[12];
  v33 = (_OWORD *)((char *)a1 + v32);
  v34 = (_OWORD *)((char *)a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  return a1;
}

uint64_t assignWithTake for ChartLineMark(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v6;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24A361C94();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v12(v8 + *(int *)(v13 + 36), v9 + *(int *)(v13 + 36), v10);
  v14 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v15 = (char *)(a1 + v14);
  v16 = (char *)(a2 + v14);
  if (a1 != a2)
  {
    sub_24A333C3C(a1 + v14, type metadata accessor for ChartLineStrokeStyle);
    v17 = type metadata accessor for ChartLineStrokeStyle(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v16, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  v18 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v15[v18[5]] = *(_QWORD *)&v16[v18[5]];
  v19 = v18[6];
  v20 = &v15[v19];
  v21 = &v16[v19];
  v22 = *((_QWORD *)v21 + 2);
  v23 = v21[24];
  v24 = *(_QWORD *)v20;
  v25 = *((_QWORD *)v20 + 1);
  v26 = *((_QWORD *)v20 + 2);
  v27 = v20[24];
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *((_QWORD *)v20 + 2) = v22;
  v20[24] = v23;
  sub_24A2D7DDC(v24, v25, v26, v27);
  *(_QWORD *)&v15[v18[7]] = *(_QWORD *)&v16[v18[7]];
  swift_bridgeObjectRelease();
  v28 = v18[8];
  v29 = &v15[v28];
  v30 = &v16[v28];
  *(_QWORD *)&v15[v28] = *(_QWORD *)&v16[v28];
  swift_bridgeObjectRelease();
  *(_OWORD *)(v29 + 8) = *(_OWORD *)(v30 + 8);
  *((_QWORD *)v29 + 3) = *((_QWORD *)v30 + 3);
  *(_QWORD *)&v15[v18[9]] = *(_QWORD *)&v16[v18[9]];
  v31 = v18[10];
  v32 = &v15[v31];
  v33 = &v16[v31];
  v32[8] = v33[8];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  v34 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v34) = *(_BYTE *)(a2 + v34);
  v35 = a3[11];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 40))(v36, v37, v38);
  v39 = a3[12];
  v40 = a1 + v39;
  v41 = a2 + v39;
  *(_QWORD *)(a1 + v39) = *(_QWORD *)v41;
  swift_release();
  *(_OWORD *)(v40 + 8) = *(_OWORD *)(v41 + 8);
  *(_QWORD *)(v40 + 24) = *(_QWORD *)(v41 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChartLineMark()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_24A353F20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_27_13();
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    OUTLINED_FUNCTION_3_8();
    if (v9)
    {
      v7 = v6;
      v8 = a3[6];
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_3_8();
      if (v9)
      {
        v7 = v10;
        v8 = a3[8];
      }
      else
      {
        v7 = OUTLINED_FUNCTION_1_39();
        v8 = a3[11];
      }
    }
    OUTLINED_FUNCTION_13_24(a1 + v8, a2, v7);
  }
}

uint64_t storeEnumTagSinglePayload for ChartLineMark()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24A353FB4()
{
  uint64_t v0;
  _QWORD *v1;
  int *v2;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  OUTLINED_FUNCTION_33_9();
  if (v4)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    OUTLINED_FUNCTION_4_10();
    if (v4)
    {
      v6 = v5;
      v7 = v3[6];
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_4_10();
      if (v8)
      {
        v6 = v9;
        v7 = v3[8];
      }
      else
      {
        v6 = OUTLINED_FUNCTION_1_39();
        v7 = v3[11];
      }
    }
    OUTLINED_FUNCTION_11_6((uint64_t)v1 + v7, v0, v0, v6);
  }
}

void sub_24A35403C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_24A32E3E0();
  if (v0 <= 0x3F)
  {
    type metadata accessor for ChartLineStyle(319);
    if (v1 <= 0x3F)
    {
      sub_24A36287C();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

unint64_t sub_24A354114()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_257925230;
  if (!qword_257925230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925238);
    v2 = sub_24A354198();
    sub_24A2A5768(&qword_257924BE0, type metadata accessor for StyledLineMark, (uint64_t)&unk_24A368890);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDB7FA8], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257925230);
  }
  return result;
}

unint64_t sub_24A354198()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257925240;
  if (!qword_257925240)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925168);
    v2[0] = sub_24A354204();
    v2[1] = sub_24A3365D8();
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDB7FA8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257925240);
  }
  return result;
}

unint64_t sub_24A354204()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[2];

  result = qword_257925248;
  if (!qword_257925248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925160);
    sub_24A2A5768(&qword_257924BE0, type metadata accessor for StyledLineMark, (uint64_t)&unk_24A368890);
    v4[0] = v2;
    v4[1] = sub_24A3365D8();
    v3 = v4;
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDB7B80], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_257925248);
  }
  return result;
}

_QWORD *sub_24A354290(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  int *v59;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    memcpy(a1 + 1, a2 + 1, 0x59uLL);
    v8 = a3[6];
    v9 = (char *)v7 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_24A361C94();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    v12(&v9[*(int *)(v13 + 36)], &v10[*(int *)(v13 + 36)], v11);
    v14 = a3[8];
    *(_OWORD *)((char *)v7 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    v15 = (_QWORD *)((char *)v7 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = a3[10];
    *((_BYTE *)v7 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    v19 = (char *)v7 + v18;
    v20 = (char *)a2 + v18;
    v21 = type metadata accessor for ChartLineStrokeStyle(0);
    swift_bridgeObjectRetain();
    v58 = v12;
    v59 = a3;
    v57 = v11;
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v12(v19, v20, v11);
      swift_storeEnumTagMultiPayload();
    }
    v22 = (int *)type metadata accessor for ChartLineStyle(0);
    *(_QWORD *)&v19[v22[5]] = *(_QWORD *)&v20[v22[5]];
    v23 = v22[6];
    v24 = &v19[v23];
    v25 = &v20[v23];
    v26 = *(_QWORD *)v25;
    v27 = *((_QWORD *)v25 + 1);
    v28 = *((_QWORD *)v25 + 2);
    v29 = v25[24];
    sub_24A2D7D74(*(_QWORD *)v25, v27, v28, v29);
    *(_QWORD *)v24 = v26;
    *((_QWORD *)v24 + 1) = v27;
    *((_QWORD *)v24 + 2) = v28;
    v24[24] = v29;
    *(_QWORD *)&v19[v22[7]] = *(_QWORD *)&v20[v22[7]];
    v30 = v22[8];
    v31 = &v19[v30];
    v32 = &v20[v30];
    *(_QWORD *)v31 = *(_QWORD *)v32;
    *(_OWORD *)(v31 + 8) = *(_OWORD *)(v32 + 8);
    *((_QWORD *)v31 + 3) = *((_QWORD *)v32 + 3);
    *(_QWORD *)&v19[v22[9]] = *(_QWORD *)&v20[v22[9]];
    v33 = v22[10];
    v34 = &v19[v33];
    v35 = &v20[v33];
    *(_QWORD *)v34 = *(_QWORD *)v35;
    v34[8] = v35[8];
    v36 = v59[11];
    v37 = v59[12];
    v38 = (_QWORD *)((char *)v7 + v36);
    v39 = (_QWORD *)((char *)a2 + v36);
    *v38 = *v39;
    v38[1] = v39[1];
    v40 = v39[3];
    v38[2] = v39[2];
    v38[3] = v40;
    v38[4] = v39[4];
    v41 = (char *)v7 + v37;
    v42 = (char *)a2 + v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v42, 1, v57))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
      v44 = v58;
    }
    else
    {
      v44 = v58;
      v58(v41, v42, v57);
      __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v57);
    }
    v45 = v59[13];
    v46 = (char *)v7 + v45;
    v47 = (char *)a2 + v45;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v45, 1, v57))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
      memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v44(v46, v47, v57);
      __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v57);
    }
    v49 = v59[15];
    *((_BYTE *)v7 + v59[14]) = *((_BYTE *)a2 + v59[14]);
    v50 = (char *)v7 + v49;
    v51 = (char *)a2 + v49;
    v52 = sub_24A36287C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v50, v51, v52);
    v53 = v59[16];
    v54 = (char *)v7 + v53;
    v55 = (char *)a2 + v53;
    *(_QWORD *)v54 = *(_QWORD *)v55;
    *(_OWORD *)(v54 + 8) = *(_OWORD *)(v55 + 8);
    *((_QWORD *)v54 + 3) = *((_QWORD *)v55 + 3);
  }
  swift_retain();
  return v7;
}

uint64_t sub_24A354650(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_24A361C94();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v6(v4 + *(int *)(v7 + 36), v5);
  swift_bridgeObjectRelease();
  v8 = a1 + a2[10];
  type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() <= 1)
    v6(v8, v5);
  v9 = type metadata accessor for ChartLineStyle(0);
  sub_24A2D7DDC(*(_QWORD *)(v8 + *(int *)(v9 + 24)), *(_QWORD *)(v8 + *(int *)(v9 + 24) + 8), *(_QWORD *)(v8 + *(int *)(v9 + 24) + 16), *(_BYTE *)(v8 + *(int *)(v9 + 24) + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = a1 + a2[12];
  if (!__swift_getEnumTagSinglePayload(v10, 1, v5))
    v6(v10, v5);
  v11 = a1 + a2[13];
  if (!__swift_getEnumTagSinglePayload(v11, 1, v5))
    v6(v11, v5);
  v12 = a1 + a2[15];
  v13 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return swift_release();
}

_QWORD *sub_24A3547D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  int *v57;

  *a1 = *a2;
  memcpy(a1 + 1, a2 + 1, 0x59uLL);
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24A361C94();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v10(&v7[*(int *)(v11 + 36)], &v8[*(int *)(v11 + 36)], v9);
  v12 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for ChartLineStrokeStyle(0);
  swift_bridgeObjectRetain();
  v56 = v10;
  v57 = a3;
  v55 = v9;
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v10(v17, v18, v9);
    swift_storeEnumTagMultiPayload();
  }
  v20 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v17[v20[5]] = *(_QWORD *)&v18[v20[5]];
  v21 = v20[6];
  v22 = &v17[v21];
  v23 = &v18[v21];
  v24 = *(_QWORD *)v23;
  v25 = *((_QWORD *)v23 + 1);
  v26 = *((_QWORD *)v23 + 2);
  v27 = v23[24];
  sub_24A2D7D74(*(_QWORD *)v23, v25, v26, v27);
  *(_QWORD *)v22 = v24;
  *((_QWORD *)v22 + 1) = v25;
  *((_QWORD *)v22 + 2) = v26;
  v22[24] = v27;
  *(_QWORD *)&v17[v20[7]] = *(_QWORD *)&v18[v20[7]];
  v28 = v20[8];
  v29 = &v17[v28];
  v30 = &v18[v28];
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_OWORD *)(v29 + 8) = *(_OWORD *)(v30 + 8);
  *((_QWORD *)v29 + 3) = *((_QWORD *)v30 + 3);
  *(_QWORD *)&v17[v20[9]] = *(_QWORD *)&v18[v20[9]];
  v31 = v20[10];
  v32 = &v17[v31];
  v33 = &v18[v31];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  v32[8] = v33[8];
  v34 = v57[11];
  v35 = v57[12];
  v36 = (_QWORD *)((char *)a1 + v34);
  v37 = (_QWORD *)((char *)a2 + v34);
  *v36 = *v37;
  v36[1] = v37[1];
  v38 = v37[3];
  v36[2] = v37[2];
  v36[3] = v38;
  v36[4] = v37[4];
  v39 = (char *)a1 + v35;
  v40 = (char *)a2 + v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v55))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    v42 = v56;
  }
  else
  {
    v42 = v56;
    v56(v39, v40, v55);
    __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v55);
  }
  v43 = v57[13];
  v44 = (char *)a1 + v43;
  v45 = (char *)a2 + v43;
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v43, 1, v55))
  {
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
  }
  else
  {
    v42(v44, v45, v55);
    __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v55);
  }
  v47 = v57[15];
  *((_BYTE *)a1 + v57[14]) = *((_BYTE *)a2 + v57[14]);
  v48 = (char *)a1 + v47;
  v49 = (char *)a2 + v47;
  v50 = sub_24A36287C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
  v51 = v57[16];
  v52 = (char *)a1 + v51;
  v53 = (char *)a2 + v51;
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *(_OWORD *)(v52 + 8) = *(_OWORD *)(v53 + 8);
  *((_QWORD *)v52 + 3) = *((_QWORD *)v53 + 3);
  swift_retain();
  return a1;
}

uint64_t sub_24A354B68(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const void *v53;
  int EnumTagSinglePayload;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const void *v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  void (*v72)(void *, const void *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  int *v75;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v10;
  v11 = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v11;
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_24A361C94();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 24);
  v17(v13, v14, v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v72 = (void (*)(void *, const void *, uint64_t))v17;
  v17(v13 + *(int *)(v18 + 36), v14 + *(int *)(v18 + 36), v15);
  v19 = a3[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v75 = a3;
  v25 = a3[10];
  v26 = (char *)(a1 + v25);
  v27 = (char *)(a2 + v25);
  if (a1 != a2)
  {
    sub_24A333C3C(a1 + v25, type metadata accessor for ChartLineStrokeStyle);
    v28 = type metadata accessor for ChartLineStrokeStyle(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v26, v27, v15);
      swift_storeEnumTagMultiPayload();
    }
  }
  v73 = v16;
  v29 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v26[v29[5]] = *(_QWORD *)&v27[v29[5]];
  v30 = v29[6];
  v74 = v15;
  v31 = &v26[v30];
  v32 = &v27[v30];
  v33 = *(_QWORD *)v32;
  v34 = *((_QWORD *)v32 + 1);
  v35 = *((_QWORD *)v32 + 2);
  v36 = v32[24];
  sub_24A2D7D74(*(_QWORD *)v32, v34, v35, v36);
  v37 = *(_QWORD *)v31;
  v38 = *((_QWORD *)v31 + 1);
  v39 = *((_QWORD *)v31 + 2);
  v40 = v31[24];
  *(_QWORD *)v31 = v33;
  *((_QWORD *)v31 + 1) = v34;
  *((_QWORD *)v31 + 2) = v35;
  v31[24] = v36;
  sub_24A2D7DDC(v37, v38, v39, v40);
  *(_QWORD *)&v26[v29[7]] = *(_QWORD *)&v27[v29[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = v29[8];
  v42 = &v26[v41];
  v43 = &v27[v41];
  *(_QWORD *)&v26[v41] = *(_QWORD *)&v27[v41];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
  *((_QWORD *)v42 + 2) = *((_QWORD *)v43 + 2);
  *((_QWORD *)v42 + 3) = *((_QWORD *)v43 + 3);
  *(_QWORD *)&v26[v29[9]] = *(_QWORD *)&v27[v29[9]];
  v44 = v29[10];
  v45 = &v26[v44];
  v46 = &v27[v44];
  v47 = *(_QWORD *)v46;
  v45[8] = v46[8];
  *(_QWORD *)v45 = v47;
  v48 = v75[11];
  v49 = a1 + v48;
  v50 = a2 + v48;
  *(_QWORD *)v49 = *(_QWORD *)(a2 + v48);
  *(_DWORD *)(v49 + 8) = *(_DWORD *)(a2 + v48 + 8);
  *(_DWORD *)(v49 + 12) = *(_DWORD *)(a2 + v48 + 12);
  *(_QWORD *)(v49 + 16) = *(_QWORD *)(a2 + v48 + 16);
  *(_QWORD *)(v49 + 24) = *(_QWORD *)(a2 + v48 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v49 + 32) = *(_QWORD *)(v50 + 32);
  v51 = v75[12];
  v52 = (void *)(a1 + v51);
  v53 = (const void *)(a2 + v51);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1 + v51, 1, v74);
  v55 = __swift_getEnumTagSinglePayload((uint64_t)v53, 1, v74);
  if (EnumTagSinglePayload)
  {
    v56 = v73;
    if (!v55)
    {
      (*(void (**)(void *, const void *, uint64_t))(v73 + 16))(v52, v53, v74);
      __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v74);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v56 = v73;
  if (v55)
  {
    (*(void (**)(void *, uint64_t))(v73 + 8))(v52, v74);
LABEL_10:
    v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
    goto LABEL_11;
  }
  v72(v52, v53, v74);
LABEL_11:
  v58 = v75[13];
  v59 = (void *)(a1 + v58);
  v60 = (const void *)(a2 + v58);
  v61 = __swift_getEnumTagSinglePayload(a1 + v58, 1, v74);
  v62 = __swift_getEnumTagSinglePayload((uint64_t)v60, 1, v74);
  if (!v61)
  {
    if (!v62)
    {
      v72(v59, v60, v74);
      goto LABEL_17;
    }
    (*(void (**)(void *, uint64_t))(v56 + 8))(v59, v74);
    goto LABEL_16;
  }
  if (v62)
  {
LABEL_16:
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(void *, const void *, uint64_t))(v56 + 16))(v59, v60, v74);
  __swift_storeEnumTagSinglePayload((uint64_t)v59, 0, 1, v74);
LABEL_17:
  *(_BYTE *)(a1 + v75[14]) = *(_BYTE *)(a2 + v75[14]);
  v64 = v75[15];
  v65 = a1 + v64;
  v66 = a2 + v64;
  v67 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
  v68 = v75[16];
  v69 = (_QWORD *)(a1 + v68);
  v70 = (_QWORD *)(a2 + v68);
  *(_QWORD *)(a1 + v68) = *(_QWORD *)(a2 + v68);
  swift_retain();
  swift_release();
  v69[1] = v70[1];
  v69[2] = v70[2];
  v69[3] = v70[3];
  return a1;
}

_QWORD *sub_24A35509C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  __int128 v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  _OWORD *v46;
  __int128 v47;

  *a1 = *a2;
  memcpy(a1 + 1, a2 + 1, 0x59uLL);
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24A361C94();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v10(&v7[*(int *)(v11 + 36)], &v8[*(int *)(v11 + 36)], v9);
  v12 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  v13 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v10(v14, v15, v9);
    swift_storeEnumTagMultiPayload();
  }
  v17 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v14[v17[5]] = *(_QWORD *)&v15[v17[5]];
  v18 = v17[6];
  v19 = &v14[v18];
  v20 = &v15[v18];
  *(_OWORD *)(v19 + 9) = *(_OWORD *)(v20 + 9);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_QWORD *)&v14[v17[7]] = *(_QWORD *)&v15[v17[7]];
  v21 = v17[8];
  v22 = &v14[v21];
  v23 = &v15[v21];
  v24 = *((_OWORD *)v23 + 1);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v24;
  *(_QWORD *)&v14[v17[9]] = *(_QWORD *)&v15[v17[9]];
  v25 = v17[10];
  v26 = &v14[v25];
  v27 = &v15[v25];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v28 = a3[11];
  v29 = a3[12];
  v30 = (char *)a1 + v28;
  v31 = (char *)a2 + v28;
  *((_QWORD *)v30 + 4) = *((_QWORD *)v31 + 4);
  v32 = *((_OWORD *)v31 + 1);
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *((_OWORD *)v30 + 1) = v32;
  v33 = (char *)a1 + v29;
  v34 = (char *)a2 + v29;
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v29, 1, v9))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v10(v33, v34, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v9);
  }
  v36 = a3[13];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v36, 1, v9))
  {
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    v10(v37, v38, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v9);
  }
  v40 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = sub_24A36287C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
  v44 = a3[16];
  v45 = (_OWORD *)((char *)a1 + v44);
  v46 = (_OWORD *)((char *)a2 + v44);
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  return a1;
}

uint64_t sub_24A355388(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const void *v45;
  int EnumTagSinglePayload;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const void *v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v62)(void *, const void *, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24A361C94();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v62 = (void (*)(void *, const void *, uint64_t))v12;
  v12(v8 + *(int *)(v13 + 36), v9 + *(int *)(v13 + 36), v10);
  v14 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v18 = *v16;
  v17 = v16[1];
  *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  v19 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v20 = (char *)(a1 + v19);
  v21 = (char *)(a2 + v19);
  if (a1 != a2)
  {
    sub_24A333C3C(a1 + v19, type metadata accessor for ChartLineStrokeStyle);
    v22 = type metadata accessor for ChartLineStrokeStyle(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v20, v21, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  v23 = (int *)type metadata accessor for ChartLineStyle(0);
  *(_QWORD *)&v20[v23[5]] = *(_QWORD *)&v21[v23[5]];
  v24 = v23[6];
  v25 = &v20[v24];
  v26 = &v21[v24];
  v27 = *((_QWORD *)v26 + 2);
  v28 = v26[24];
  v29 = *(_QWORD *)v25;
  v30 = *((_QWORD *)v25 + 1);
  v31 = *((_QWORD *)v25 + 2);
  v32 = v25[24];
  *(_OWORD *)v25 = *(_OWORD *)v26;
  *((_QWORD *)v25 + 2) = v27;
  v25[24] = v28;
  sub_24A2D7DDC(v29, v30, v31, v32);
  *(_QWORD *)&v20[v23[7]] = *(_QWORD *)&v21[v23[7]];
  swift_bridgeObjectRelease();
  v33 = v23[8];
  v34 = &v20[v33];
  v35 = &v21[v33];
  *(_QWORD *)&v20[v33] = *(_QWORD *)&v21[v33];
  swift_bridgeObjectRelease();
  *(_OWORD *)(v34 + 8) = *(_OWORD *)(v35 + 8);
  *((_QWORD *)v34 + 3) = *((_QWORD *)v35 + 3);
  *(_QWORD *)&v20[v23[9]] = *(_QWORD *)&v21[v23[9]];
  v36 = v23[10];
  v37 = &v20[v36];
  v38 = &v21[v36];
  v37[8] = v38[8];
  *(_QWORD *)v37 = *(_QWORD *)v38;
  v39 = a3[11];
  v40 = (_QWORD *)(a1 + v39);
  v41 = a2 + v39;
  v42 = *(_QWORD *)(a2 + v39 + 8);
  *v40 = *(_QWORD *)(a2 + v39);
  v40[1] = v42;
  v40[2] = *(_QWORD *)(a2 + v39 + 16);
  v40[3] = *(_QWORD *)(a2 + v39 + 24);
  swift_bridgeObjectRelease();
  v40[4] = *(_QWORD *)(v41 + 32);
  v43 = a3[12];
  v44 = (void *)(a1 + v43);
  v45 = (const void *)(a2 + v43);
  LODWORD(v23) = __swift_getEnumTagSinglePayload(a1 + v43, 1, v10);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v10);
  if ((_DWORD)v23)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v44, v45, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v10);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (EnumTagSinglePayload)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v44, v10);
LABEL_10:
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    goto LABEL_11;
  }
  v62(v44, v45, v10);
LABEL_11:
  v48 = a3[13];
  v49 = (void *)(a1 + v48);
  v50 = (const void *)(a2 + v48);
  v51 = __swift_getEnumTagSinglePayload(a1 + v48, 1, v10);
  v52 = __swift_getEnumTagSinglePayload((uint64_t)v50, 1, v10);
  if (!v51)
  {
    if (!v52)
    {
      v62(v49, v50, v10);
      goto LABEL_17;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v49, v10);
    goto LABEL_16;
  }
  if (v52)
  {
LABEL_16:
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v49, v50, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v10);
LABEL_17:
  v54 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v55 = a1 + v54;
  v56 = a2 + v54;
  v57 = sub_24A36287C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 40))(v55, v56, v57);
  v58 = a3[16];
  v59 = a1 + v58;
  v60 = a2 + v58;
  *(_QWORD *)(a1 + v58) = *(_QWORD *)v60;
  swift_release();
  *(_OWORD *)(v59 + 8) = *(_OWORD *)(v60 + 8);
  *(_QWORD *)(v59 + 24) = *(_QWORD *)(v60 + 24);
  return a1;
}

uint64_t sub_24A355818()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_24A355824(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_27_13();
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    OUTLINED_FUNCTION_3_8();
    if (v9)
    {
      v7 = v6;
      v8 = a3[6];
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_3_8();
      if (v9)
      {
        v7 = v10;
        v8 = a3[10];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
        OUTLINED_FUNCTION_3_8();
        if (v11)
        {
          v7 = v12;
          v8 = a3[12];
        }
        else
        {
          v7 = OUTLINED_FUNCTION_1_39();
          v8 = a3[15];
        }
      }
    }
    OUTLINED_FUNCTION_13_24(a1 + v8, a2, v7);
  }
}

uint64_t sub_24A3558CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24A3558D8()
{
  uint64_t v0;
  _QWORD *v1;
  int *v2;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_33_9();
  if (v4)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_71_0();
  }
  else
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
    OUTLINED_FUNCTION_4_10();
    if (v4)
    {
      v6 = v5;
      v7 = v3[6];
    }
    else
    {
      OUTLINED_FUNCTION_7_8();
      OUTLINED_FUNCTION_4_10();
      if (v8)
      {
        v6 = v9;
        v7 = v3[10];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
        OUTLINED_FUNCTION_4_10();
        if (v10)
        {
          v6 = v11;
          v7 = v3[12];
        }
        else
        {
          v6 = OUTLINED_FUNCTION_1_39();
          v7 = v3[15];
        }
      }
    }
    OUTLINED_FUNCTION_11_6((uint64_t)v1 + v7, v0, v0, v6);
  }
}

void sub_24A355980()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_24A32E3E0();
  if (v0 <= 0x3F)
  {
    type metadata accessor for ChartLineStyle(319);
    if (v1 <= 0x3F)
    {
      sub_24A355A84();
      if (v2 <= 0x3F)
      {
        sub_24A36287C();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_24A355A84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2579252B8[0])
  {
    sub_24A361C94();
    v0 = sub_24A3631F4();
    if (!v1)
      atomic_store(v0, qword_2579252B8);
  }
}

uint64_t sub_24A355AD8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_24A355AE8(uint64_t *a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v1 + *(int *)(type metadata accessor for StyledLineMark(0) + 40);
  v4 = v3 + *(int *)(type metadata accessor for ChartLineStyle(0) + 24);
  v6 = *(_QWORD *)v4;
  v5 = *(_QWORD *)(v4 + 8);
  v7 = *(_QWORD *)(v4 + 16);
  if ((*(_BYTE *)(v4 + 24) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257925358);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_24A3638F0;
    *(_QWORD *)(v8 + 32) = v6;
    v15 = v8;
    sub_24A362F84();
    sub_24A2D7D74(v6, v5, v7, 1);
    swift_retain();
    MEMORY[0x24BD0DB70](v15);
    sub_24A362C18();
    sub_24A362C0C();
    sub_24A362714();
    v9 = v15;
    v10 = v16;
    v11 = v17;
    v12 = v18;
    v13 = v19;
    sub_24A2D7DDC(v6, v5, v7, 1);
  }
  else
  {
    v14[0] = *(_QWORD *)v4;
    v14[1] = v5;
    v14[2] = v7;
    sub_24A355C38(v14, (uint64_t)&v15);
    v9 = v15;
    v10 = v16;
    v11 = v17;
    v12 = v18;
    v13 = v19;
  }
  *a1 = v9;
  a1[1] = v10;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
}

double sub_24A355C38@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  int v24;
  double v25;
  char v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  double result;
  __int128 v32;
  _QWORD v33[3];
  _OWORD v34[2];
  uint64_t v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257924790);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for StyledLineMark(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v33 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v33 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)v33 - v18;
  v20 = *a1;
  v21 = a1[1];
  v22 = a1[2];
  if (*(_BYTE *)(v2 + *(int *)(v16 + 36)) == 1)
  {
    v23 = *(double *)(v2 + 40);
    v24 = *(unsigned __int8 *)(v2 + 48);
    sub_24A333B08(v2, (uint64_t)v33 - v18, type metadata accessor for StyledLineMark);
    if (v24 == 1)
      v23 = *(double *)&v19[*(int *)(v8 + 28)];
    sub_24A333C3C((uint64_t)v19, type metadata accessor for StyledLineMark);
    v25 = *(double *)(v2 + 56);
    v26 = *(_BYTE *)(v2 + 64);
    sub_24A333B08(v2, (uint64_t)v15, type metadata accessor for StyledLineMark);
    if ((v26 & 1) == 0)
      goto LABEL_10;
LABEL_9:
    v25 = *(double *)&v15[*(int *)(v8 + 28) + 8];
    goto LABEL_10;
  }
  v15 = v17;
  v23 = *(double *)(v2 + 8);
  v27 = *(unsigned __int8 *)(v2 + 16);
  sub_24A333B08(v2, (uint64_t)v12, type metadata accessor for StyledLineMark);
  if (v27 == 1)
    v23 = *(double *)&v12[*(int *)(v8 + 28)];
  sub_24A333C3C((uint64_t)v12, type metadata accessor for StyledLineMark);
  v25 = *(double *)(v2 + 24);
  v28 = *(unsigned __int8 *)(v2 + 32);
  sub_24A333B08(v2, (uint64_t)v15, type metadata accessor for StyledLineMark);
  if (v28 == 1)
    goto LABEL_9;
LABEL_10:
  sub_24A333C3C((uint64_t)v15, type metadata accessor for StyledLineMark);
  v33[0] = v20;
  v33[1] = v21;
  v33[2] = v22;
  v29 = v2 + *(int *)(v8 + 60);
  v30 = sub_24A36287C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v7, v29, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v30);
  DetailChartGradientModel.linearGradient(minValue:maxValue:colorSchemeContrast:)((uint64_t)v34, v23, v25);
  sub_24A3365B0((uint64_t)v7, &qword_257924790);
  result = *(double *)v34;
  v32 = v34[1];
  *(_OWORD *)a2 = v34[0];
  *(_OWORD *)(a2 + 16) = v32;
  *(_QWORD *)(a2 + 32) = v35;
  return result;
}

uint64_t sub_24A355ED0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  __int128 v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v46;
  char *v47;
  uint64_t KeyPath;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _OWORD v78[2];
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v69 = a1;
  v2 = type metadata accessor for StyledLineMark(0);
  v51 = *(_QWORD *)(v2 - 8);
  v52 = *(_QWORD *)(v51 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925318);
  v58 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v54 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925320);
  v61 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v55 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925328);
  v63 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v56 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925330);
  v68 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v59 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925338);
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v64 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925340);
  v49 = *(_QWORD *)(v71 - 8);
  v10 = *(_QWORD *)(v49 + 64);
  v11 = MEMORY[0x24BDAC7A8](v71);
  v47 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v46 - v12;
  sub_24A362870();
  v50 = v2;
  v14 = *(int *)(v2 + 32);
  v70 = v1;
  v15 = (_QWORD *)((char *)v1 + v14);
  v16 = v15[1];
  *(_QWORD *)&v80 = *v15;
  *((_QWORD *)&v80 + 1) = v16;
  swift_bridgeObjectRetain();
  sub_24A362F00();
  swift_bridgeObjectRelease();
  v53 = v13;
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = (uint64_t)v70;
  *(_QWORD *)&v78[0] = *v70;
  KeyPath = swift_getKeyPath();
  sub_24A333B08(v17, (uint64_t)v4, type metadata accessor for StyledLineMark);
  v18 = v49;
  v19 = v47;
  v20 = v13;
  v21 = v71;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v47, v20, v71);
  v22 = (*(unsigned __int8 *)(v51 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
  v23 = (v52 + *(unsigned __int8 *)(v18 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v24 = swift_allocObject();
  sub_24A3362C0((uint64_t)v4, v24 + v22, type metadata accessor for StyledLineMark);
  (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v24 + v23, v19, v21);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579246A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257925348);
  sub_24A32D7B4();
  *(_QWORD *)&v80 = sub_24A3626C0();
  *((_QWORD *)&v80 + 1) = MEMORY[0x24BDB8230];
  swift_getOpaqueTypeConformance2();
  v25 = v54;
  sub_24A362BC4();
  v26 = v70;
  v27 = (char *)v70 + *(int *)(v50 + 44);
  v28 = *((_OWORD *)v27 + 1);
  v80 = *(_OWORD *)v27;
  v81 = v28;
  v82 = *((_QWORD *)v27 + 4);
  v29 = sub_24A357270();
  v30 = v55;
  v31 = v57;
  sub_24A3625E8();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v25, v31);
  sub_24A355AE8((uint64_t *)v78);
  v75 = v78[0];
  v76 = v78[1];
  v77 = v79;
  v73 = v31;
  v74 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v33 = MEMORY[0x24BDEC7D0];
  v34 = MEMORY[0x24BDEC7B8];
  v35 = v56;
  v36 = v60;
  sub_24A362588();
  sub_24A32D854((uint64_t)v78);
  v37 = v30;
  v38 = v36;
  (*(void (**)(char *, uint64_t))(v61 + 8))(v37, v36);
  v39 = v26;
  ChartLineStyle.opacity(for:)();
  *(_QWORD *)&v75 = v38;
  *((_QWORD *)&v75 + 1) = v33;
  *(_QWORD *)&v76 = OpaqueTypeConformance2;
  *((_QWORD *)&v76 + 1) = v34;
  v40 = swift_getOpaqueTypeConformance2();
  v41 = v59;
  v42 = v62;
  sub_24A3625DC();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v42);
  v72 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579246C8);
  *(_QWORD *)&v75 = v42;
  *((_QWORD *)&v75 + 1) = v40;
  swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v75 = sub_24A362600();
  *((_QWORD *)&v75 + 1) = MEMORY[0x24BDB7D80];
  swift_getOpaqueTypeConformance2();
  v43 = v64;
  v44 = v65;
  sub_24A3625AC();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v41, v44);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v53, v71);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v66 + 32))(v69, v43, v67);
}

double sub_24A356644()
{
  double v0;

  sub_24A361BF8();
  return -v0;
}

uint64_t sub_24A356660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v23[2];
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a3;
  v34 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925340);
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257924780);
  MEMORY[0x24BDAC7A8](v8);
  v25 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257924788);
  MEMORY[0x24BDAC7A8](v10);
  v23[1] = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A3626C0();
  v13 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  v29 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925348);
  v26 = *(_QWORD *)(v16 - 8);
  v27 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v24 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A362870();
  sub_24A361C94();
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A362870();
  LODWORD(a2) = *(unsigned __int8 *)(a2 + *(int *)(type metadata accessor for StyledLineMark(0) + 36));
  v18 = type metadata accessor for DetailChartDataElement(0);
  v19 = 20;
  if ((_DWORD)a2)
    v19 = 24;
  v35 = *(_QWORD *)(a1 + *(int *)(v18 + v19));
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v33, v32);
  sub_24A3626B4();
  v20 = v24;
  v21 = v28;
  sub_24A3625C4();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v21);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v34, v20, v27);
}

uint64_t sub_24A35699C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;

  v57 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257924780);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v55 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)&v43 - v6;
  v7 = (int *)type metadata accessor for StyledLineMark(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v46 = (uint64_t)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v43 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF068);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v44 = (uint64_t)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v43 - v15;
  v17 = sub_24A361C94();
  v59 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v45 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v43 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257924788);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v47 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v58 = (char *)&v43 - v25;
  v26 = sub_24A362600();
  v52 = *(_QWORD *)(v26 - 8);
  v53 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v51 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579246C8);
  v49 = *(_QWORD *)(v28 - 8);
  v50 = v28;
  MEMORY[0x24BDAC7A8](v28);
  v48 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A362870();
  sub_24A313724(a1 + v7[12], (uint64_t)v16, &qword_2544CF068);
  v56 = a1;
  sub_24A333B08(a1, (uint64_t)v11, type metadata accessor for StyledLineMark);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v21, &v11[v7[6]], v17);
    sub_24A333C3C((uint64_t)v11, type metadata accessor for StyledLineMark);
    sub_24A3365B0((uint64_t)v16, &qword_2544CF068);
  }
  else
  {
    sub_24A333C3C((uint64_t)v11, type metadata accessor for StyledLineMark);
    (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v21, v16, v17);
  }
  v30 = v7;
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = *(void (**)(char *, uint64_t))(v59 + 8);
  v31(v21, v17);
  v43 = sub_24A362870();
  v32 = v56;
  v33 = v44;
  sub_24A313724(v56 + v7[13], v44, &qword_2544CF068);
  v34 = v46;
  sub_24A333B08(v32, v46, type metadata accessor for StyledLineMark);
  if (__swift_getEnumTagSinglePayload(v33, 1, v17) == 1)
  {
    v35 = v30[6];
    v36 = v34 + v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218) + 36);
    v37 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v45, v36, v17);
    sub_24A333C3C(v34, type metadata accessor for StyledLineMark);
    sub_24A3365B0(v33, &qword_2544CF068);
  }
  else
  {
    sub_24A333C3C(v34, type metadata accessor for StyledLineMark);
    v37 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v45, v33, v17);
  }
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31(v37, v17);
  sub_24A362870();
  v38 = (uint64_t *)(v32 + v30[7]);
  v60 = *v38;
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A362870();
  v60 = v38[1];
  sub_24A36260C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v39 = v51;
  sub_24A3625F4();
  type metadata accessor for ChartLineStyle(0);
  v40 = v48;
  v41 = v53;
  sub_24A3625B8();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v41);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v49 + 32))(v57, v40, v50);
}

void sub_24A357000(double *a1@<X8>)
{
  *a1 = sub_24A35665C();
}

uint64_t sub_24A357028()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, uint64_t);
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = (int *)OUTLINED_FUNCTION_29_11();
  v2 = *((_QWORD *)v1 - 1);
  v14 = *(_QWORD *)(v2 + 64);
  v15 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925340);
  v3 = *(_QWORD *)(v16 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  swift_bridgeObjectRelease();
  v5 = v0 + v15 + v1[6];
  v6 = sub_24A361C94();
  v7 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  OUTLINED_FUNCTION_8_32();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  v7(v5 + *(int *)(v8 + 36), v6);
  swift_bridgeObjectRelease();
  v9 = v0 + v15 + v1[10];
  type metadata accessor for ChartLineStrokeStyle(0);
  if (swift_getEnumCaseMultiPayload() <= 1)
    OUTLINED_FUNCTION_8_32();
  v10 = OUTLINED_FUNCTION_7_8();
  sub_24A2D7DDC(*(_QWORD *)(v9 + *(int *)(v10 + 24)), *(_QWORD *)(v9 + *(int *)(v10 + 24) + 8), *(_QWORD *)(v9 + *(int *)(v10 + 24) + 16), *(_BYTE *)(v9 + *(int *)(v10 + 24) + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!OUTLINED_FUNCTION_16_17(v1[12]))
    OUTLINED_FUNCTION_8_32();
  if (!OUTLINED_FUNCTION_16_17(v1[13]))
    OUTLINED_FUNCTION_8_32();
  v11 = v0 + v15 + v1[15];
  v12 = OUTLINED_FUNCTION_1_39();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + ((v15 + v14 + v4) & ~v4), v16);
  return swift_deallocObject();
}

uint64_t sub_24A3571F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(OUTLINED_FUNCTION_29_11() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v6 + *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257925340) - 8) + 80);
  return sub_24A356660(a1, v2 + v6, v2 + ((v7 + v8) & ~v8), a2);
}

unint64_t sub_24A357270()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_257925350;
  if (!qword_257925350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925318);
    v2[1] = sub_24A3626C0();
    v2[2] = MEMORY[0x24BDB8230];
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BDB8490], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257925350);
  }
  return result;
}

uint64_t sub_24A3572F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24A35699C(*(_QWORD *)(v1 + 16), a1);
}

void sub_24A357300(double *a1@<X8>)
{
  *a1 = sub_24A356644();
}

uint64_t sub_24A357328()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925330);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579246C8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925328);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925320);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257925318);
  sub_24A357270();
  OUTLINED_FUNCTION_2_34();
  OUTLINED_FUNCTION_2_34();
  OUTLINED_FUNCTION_2_34();
  sub_24A362600();
  OUTLINED_FUNCTION_2_34();
  return OUTLINED_FUNCTION_2_34();
}

uint64_t OUTLINED_FUNCTION_0_32()
{
  return sub_24A3626FC();
}

uint64_t OUTLINED_FUNCTION_1_39()
{
  return sub_24A36287C();
}

uint64_t OUTLINED_FUNCTION_2_34()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 OUTLINED_FUNCTION_4_33@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 - 176);
  v3 = *(_OWORD *)(v1 - 160);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(v1 - 144);
  return result;
}

uint64_t OUTLINED_FUNCTION_8_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

__n128 OUTLINED_FUNCTION_9_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v0 + *(int *)(v1 + 48) + 8);
  *(__n128 *)(v2 - 272) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_14_24()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_16_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return __swift_getEnumTagSinglePayload(v2 + a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_18_22(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
  return swift_retain();
}

__n128 OUTLINED_FUNCTION_19_19@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;

  *(_QWORD *)a1 = v1;
  result = *(__n128 *)(v2 - 272);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_23_13(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_24_14(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

void OUTLINED_FUNCTION_25_14(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_24A333B08(*(_QWORD *)(v3 - 272), a2, a3);
}

uint64_t OUTLINED_FUNCTION_26_13()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_27_13()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if ((unint64_t)*v0 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

void OUTLINED_FUNCTION_28_12()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_24A333C3C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_29_11()
{
  return type metadata accessor for StyledLineMark(0);
}

void OUTLINED_FUNCTION_31_11(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2;
}

void OUTLINED_FUNCTION_32_9(uint64_t a1)
{
  uint64_t *v1;

  sub_24A3365B0(a1, v1);
}

void OUTLINED_FUNCTION_34_9(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_24A313724(a1, v2, v1);
}

uint64_t DetailChartCondition.shouldInterpolateLollipop.getter()
{
  _BYTE *v0;

  return (*v0 < 8u) & (0xFBu >> *v0);
}

uint64_t static DetailChartDataElement.ValueLabel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double *v2;
  uint64_t *v3;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  int EnumCaseMultiPayload;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  char v38;
  uint64_t v39;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int EnumTagSinglePayload;
  uint64_t v54;
  char v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;

  v63 = (char *)a1;
  v64 = a2;
  v5 = sub_24A362B88();
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_50();
  v62 = v6;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925360);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_50();
  v60 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
  OUTLINED_FUNCTION_0_1();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v57 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v57 - v16;
  type metadata accessor for DetailChartDataElement.ValueLabel(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (uint64_t *)((char *)&v57 - v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257925368);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_8_22();
  v25 = (double *)(v4 + *(int *)(v24 + 48));
  sub_24A2C2BB8((uint64_t)v63, v4, type metadata accessor for DetailChartDataElement.ValueLabel);
  sub_24A2C2BB8(v64, (uint64_t)v25, type metadata accessor for DetailChartDataElement.ValueLabel);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v63 = v12;
    v64 = v4;
    sub_24A2C2BB8(v4, (uint64_t)v22, type metadata accessor for DetailChartDataElement.ValueLabel);
    v30 = *v22;
    v29 = v22[1];
    v31 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v32 = (char *)v22 + v31;
    if (!OUTLINED_FUNCTION_8_28())
    {
      v42 = *v25;
      v41 = *((_QWORD *)v25 + 1);
      v43 = (uint64_t)v32;
      v44 = (uint64_t)v17;
      sub_24A2EC174(v43, (uint64_t)v17);
      sub_24A2EC174((uint64_t)v25 + v31, (uint64_t)v15);
      if (v30 == *(_QWORD *)&v42 && v29 == v41)
      {
        OUTLINED_FUNCTION_36_7();
        v47 = v61;
        v48 = v62;
      }
      else
      {
        v46 = OUTLINED_FUNCTION_0_10();
        OUTLINED_FUNCTION_43_6();
        OUTLINED_FUNCTION_9();
        v47 = v61;
        v48 = v62;
        if ((v46 & 1) == 0)
        {
          OUTLINED_FUNCTION_32_9((uint64_t)v15);
          OUTLINED_FUNCTION_32_9((uint64_t)v17);
          v39 = v64;
          goto LABEL_35;
        }
      }
      v49 = v60;
      v50 = v60 + *(int *)(v47 + 48);
      sub_24A357B04((uint64_t)v17, v60);
      sub_24A357B04((uint64_t)v15, v50);
      v51 = v59;
      if (__swift_getEnumTagSinglePayload(v49, 1, v59) == 1)
      {
        OUTLINED_FUNCTION_25_15((uint64_t)v15);
        OUTLINED_FUNCTION_25_15((uint64_t)v17);
        if (__swift_getEnumTagSinglePayload(v50, 1, v51) == 1)
        {
          sub_24A3365B0(v49, &qword_257923910);
          v39 = v64;
          goto LABEL_34;
        }
      }
      else
      {
        v52 = (uint64_t)v63;
        sub_24A357B04(v49, (uint64_t)v63);
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v50, 1, v51);
        v54 = v58;
        if (EnumTagSinglePayload != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v48, v50, v51);
          sub_24A2A5768(&qword_257925370, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4070], MEMORY[0x24BDF4088]);
          v55 = sub_24A362E88();
          v56 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
          v56(v48, v51);
          OUTLINED_FUNCTION_25_15((uint64_t)v15);
          OUTLINED_FUNCTION_25_15(v44);
          v56(v52, v51);
          OUTLINED_FUNCTION_25_15(v49);
          v39 = v64;
          if ((v55 & 1) == 0)
            goto LABEL_35;
          goto LABEL_34;
        }
        OUTLINED_FUNCTION_32_9((uint64_t)v15);
        OUTLINED_FUNCTION_32_9(v44);
        (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v51);
      }
      sub_24A3365B0(v49, &qword_257925360);
      v39 = v64;
      goto LABEL_35;
    }
    sub_24A3365B0((uint64_t)v22 + v31, &qword_257923910);
    v4 = v64;
LABEL_14:
    OUTLINED_FUNCTION_9();
    goto LABEL_15;
  }
  if (EnumCaseMultiPayload != 1)
  {
    sub_24A2C2BB8(v4, (uint64_t)v3, type metadata accessor for DetailChartDataElement.ValueLabel);
    v34 = *v3;
    v33 = v3[1];
    if (OUTLINED_FUNCTION_8_28() == 2)
    {
      v35 = *v25;
      v36 = *((_QWORD *)v25 + 1);
      if (v34 == *(_QWORD *)&v35 && v33 == v36)
      {
        OUTLINED_FUNCTION_36_7();
      }
      else
      {
        v38 = OUTLINED_FUNCTION_0_10();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_9();
        if ((v38 & 1) == 0)
        {
          v39 = v4;
LABEL_35:
          sub_24A333C3C(v39, type metadata accessor for DetailChartDataElement.ValueLabel);
          return 0;
        }
      }
      v39 = v4;
LABEL_34:
      sub_24A333C3C(v39, type metadata accessor for DetailChartDataElement.ValueLabel);
      return 1;
    }
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_18_23(v4, v27, type metadata accessor for DetailChartDataElement.ValueLabel);
  if (OUTLINED_FUNCTION_8_28() != 1)
  {
LABEL_15:
    sub_24A3365B0(v4, &qword_257925368);
    return 0;
  }
  v28 = *v2 == *v25;
  sub_24A333C3C(v4, type metadata accessor for DetailChartDataElement.ValueLabel);
  return v28;
}

uint64_t type metadata accessor for DetailChartDataElement.ValueLabel(uint64_t a1)
{
  return sub_24A2AE36C(a1, (uint64_t *)&unk_2544CF118);
}

uint64_t sub_24A357B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void DetailChartDataElement.ValueLabel.hash(into:)()
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
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_24A362B88();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - v9;
  type metadata accessor for DetailChartDataElement.ValueLabel(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_22();
  sub_24A2C2BB8(v0, v2, v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_24A363380();
      sub_24A363398();
    }
    else
    {
      sub_24A363380();
      sub_24A362EE8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(qword_257923918);
    sub_24A2EC174(v2 + *(int *)(v14 + 48), (uint64_t)v10);
    sub_24A363380();
    sub_24A362EE8();
    swift_bridgeObjectRelease();
    sub_24A357B04((uint64_t)v10, v1);
    if (__swift_getEnumTagSinglePayload(v1, 1, v3) == 1)
    {
      sub_24A36338C();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v6, v1, v3);
      sub_24A36338C();
      sub_24A2A5768(&qword_257925378, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4070], MEMORY[0x24BDF4080]);
      sub_24A362E40();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    sub_24A3365B0((uint64_t)v10, &qword_257923910);
  }
}

void DetailChartDataElement.ValueLabel.hashValue.getter()
{
  sub_24A358384((void (*)(_BYTE *))DetailChartDataElement.ValueLabel.hash(into:));
}

void sub_24A357D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24A3583D8(a1, a2, a3, (void (*)(_BYTE *))DetailChartDataElement.ValueLabel.hash(into:));
}

double DetailChartDataElement.value.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for DetailChartDataElement(0) + 20));
}

uint64_t type metadata accessor for DetailChartDataElement(uint64_t a1)
{
  return sub_24A2AE36C(a1, (uint64_t *)&unk_2544CE890);
}

double DetailChartDataElement.secondValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(OUTLINED_FUNCTION_14_25() + 24));
}

uint64_t DetailChartDataElement.thirdValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_14_25() + 28));
}

void DetailChartDataElement.valueLabel.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14_25();
  sub_24A2C2BB8(v1 + *(int *)(v3 + 32), a1, type metadata accessor for DetailChartDataElement.ValueLabel);
}

void DetailChartDataElement.dateLabel.getter()
{
  OUTLINED_FUNCTION_14_25();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

uint64_t DetailChartDataElement.color.getter()
{
  OUTLINED_FUNCTION_14_25();
  return swift_retain();
}

uint64_t DetailChartDataElement.textColor.getter()
{
  OUTLINED_FUNCTION_14_25();
  return swift_retain();
}

void DetailChartDataElement.accessibilityDateString.getter()
{
  OUTLINED_FUNCTION_14_25();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void DetailChartDataElement.accessibilityValueDescription.getter()
{
  OUTLINED_FUNCTION_14_25();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_23();
}

void DetailChartDataElement.init(date:value:secondValue:thirdValue:valueLabel:dateLabel:accessibilityDateString:accessibilityValueDescription:color:textColor:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v24;
  int *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;

  v24 = OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(a9, a1, v24);
  v25 = (int *)OUTLINED_FUNCTION_14_25();
  *(double *)(a9 + v25[5]) = a10;
  *(double *)(a9 + v25[6]) = a11;
  v26 = a9 + v25[7];
  *(_QWORD *)v26 = a2;
  *(_BYTE *)(v26 + 8) = a3 & 1;
  sub_24A2C2BE4(a4, a9 + v25[8], type metadata accessor for DetailChartDataElement.ValueLabel);
  v27 = (_QWORD *)(a9 + v25[9]);
  *v27 = a5;
  v27[1] = a6;
  v28 = (_QWORD *)(a9 + v25[12]);
  *v28 = a7;
  v28[1] = a8;
  v29 = (_QWORD *)(a9 + v25[13]);
  *v29 = a12;
  v29[1] = a13;
  *(_QWORD *)(a9 + v25[10]) = a14;
  *(_QWORD *)(a9 + v25[11]) = a15;
}

uint64_t _s17WeatherAppSupport22DetailChartDataElementV4date10Foundation4DateVvg_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_16();
  v0 = OUTLINED_FUNCTION_0_14();
  return v1(v0);
}

uint64_t static DetailChartDataElement.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int *v4;
  int *v5;
  uint64_t v6;
  double *v7;
  char v8;
  double *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  if ((sub_24A361C04() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for DetailChartDataElement(0);
  if (*(double *)(a1 + v4[5]) != *(double *)(a2 + v4[5]))
    return 0;
  v5 = v4;
  if (*(double *)(a1 + v4[6]) != *(double *)(a2 + v4[6]))
    return 0;
  v6 = v4[7];
  v7 = (double *)(a1 + v6);
  v8 = *(_BYTE *)(a1 + v6 + 8);
  v9 = (double *)(a2 + v6);
  v10 = *(unsigned __int8 *)(a2 + v6 + 8);
  if ((v8 & 1) != 0)
  {
    if (!v10)
      return 0;
  }
  else
  {
    if (*v7 != *v9)
      LOBYTE(v10) = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  if ((static DetailChartDataElement.ValueLabel.== infix(_:_:)(a1 + v4[8], a2 + v4[8]) & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_17_15(v5[9]);
  v13 = v13 && v11 == v12;
  if (!v13)
  {
    v14 = OUTLINED_FUNCTION_0_10();
    result = 0;
    if ((v14 & 1) == 0)
      return result;
  }
  v16 = v5[10];
  v17 = *(_QWORD *)(a2 + v16);
  if (*(_QWORD *)(a1 + v16))
  {
    if (!v17)
      return 0;
    swift_retain();
    OUTLINED_FUNCTION_32_10();
    v18 = sub_24A362AA4();
    OUTLINED_FUNCTION_51_3();
    swift_release();
    if ((v18 & 1) == 0)
      return 0;
  }
  else if (v17)
  {
    return 0;
  }
  v19 = v5[11];
  v20 = *(_QWORD *)(a2 + v19);
  if (*(_QWORD *)(a1 + v19))
  {
    if (!v20)
      return 0;
    swift_retain();
    OUTLINED_FUNCTION_32_10();
    v21 = sub_24A362AA4();
    OUTLINED_FUNCTION_51_3();
    swift_release();
    if ((v21 & 1) == 0)
      return 0;
    goto LABEL_24;
  }
  if (v20)
    return 0;
LABEL_24:
  OUTLINED_FUNCTION_17_15(v5[12]);
  v24 = v13 && v22 == v23;
  if (v24 || (v25 = OUTLINED_FUNCTION_0_10(), result = 0, (v25 & 1) != 0))
  {
    OUTLINED_FUNCTION_17_15(v5[13]);
    if (v13 && v26 == v27)
      return 1;
    else
      return sub_24A363350();
  }
  return result;
}

uint64_t DetailChartDataElement.hash(into:)()
{
  uint64_t v0;
  int *v1;

  OUTLINED_FUNCTION_16();
  sub_24A2A5768(&qword_257922E20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_24A362E40();
  v1 = (int *)OUTLINED_FUNCTION_14_25();
  sub_24A363398();
  sub_24A363398();
  if (*(_BYTE *)(v0 + v1[7] + 8) == 1)
  {
    OUTLINED_FUNCTION_19_20();
  }
  else
  {
    OUTLINED_FUNCTION_19_20();
    sub_24A363398();
  }
  DetailChartDataElement.ValueLabel.hash(into:)();
  OUTLINED_FUNCTION_26_14();
  OUTLINED_FUNCTION_31_12();
  OUTLINED_FUNCTION_43_6();
  if (*(_QWORD *)(v0 + v1[10]))
  {
    OUTLINED_FUNCTION_19_20();
    OUTLINED_FUNCTION_32_10();
    OUTLINED_FUNCTION_40_6();
    OUTLINED_FUNCTION_51_3();
  }
  else
  {
    OUTLINED_FUNCTION_19_20();
  }
  if (*(_QWORD *)(v0 + v1[11]))
  {
    OUTLINED_FUNCTION_19_20();
    OUTLINED_FUNCTION_32_10();
    OUTLINED_FUNCTION_40_6();
    OUTLINED_FUNCTION_51_3();
  }
  else
  {
    OUTLINED_FUNCTION_19_20();
  }
  OUTLINED_FUNCTION_26_14();
  OUTLINED_FUNCTION_31_12();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_0_14();
  sub_24A362EE8();
  return swift_bridgeObjectRelease();
}

void DetailChartDataElement.hashValue.getter()
{
  sub_24A358384((void (*)(_BYTE *))DetailChartDataElement.hash(into:));
}

void sub_24A358384(void (*a1)(_BYTE *))
{
  _BYTE v2[72];

  sub_24A363374();
  a1(v2);
  sub_24A3633A4();
  OUTLINED_FUNCTION_9_9();
}

void sub_24A3583CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24A3583D8(a1, a2, a3, (void (*)(_BYTE *))DetailChartDataElement.hash(into:));
}

void sub_24A3583D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v5[72];

  sub_24A363374();
  a4(v5);
  sub_24A3633A4();
  OUTLINED_FUNCTION_9_9();
}

void Array<A>.maxValue.getter()
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
  char v9;

  OUTLINED_FUNCTION_9_27();
  v4 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_29();
  if (v3)
  {
    v7 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v7, v8, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v3 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        if (*(double *)(v1 + *(int *)(v0 + 20)) >= *(double *)(v2 + *(int *)(v0 + 20)))
        {
          OUTLINED_FUNCTION_10_24(v2);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v1);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v9);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_35_7();
  OUTLINED_FUNCTION_9_17();
}

void Array<A>.minValue.getter()
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
  char v9;

  OUTLINED_FUNCTION_9_27();
  v4 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_29();
  if (v3)
  {
    v7 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v7, v8, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v3 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        if (*(double *)(v2 + *(int *)(v0 + 20)) >= *(double *)(v1 + *(int *)(v0 + 20)))
        {
          OUTLINED_FUNCTION_10_24(v2);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v1);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v9);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_35_7();
  OUTLINED_FUNCTION_9_17();
}

void Array<A>.maxSecondValue.getter()
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
  char v9;

  OUTLINED_FUNCTION_9_27();
  v4 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_29();
  if (v3)
  {
    v7 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v7, v8, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v3 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        if (*(double *)(v1 + *(int *)(v0 + 24)) >= *(double *)(v2 + *(int *)(v0 + 24)))
        {
          OUTLINED_FUNCTION_10_24(v2);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v1);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v9);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_35_7();
  OUTLINED_FUNCTION_9_17();
}

void Array<A>.maxThirdValue.getter()
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
  double v9;
  double v10;
  char v11;
  uint64_t v12;

  OUTLINED_FUNCTION_9_27();
  v3 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_29();
  if (v2)
  {
    v6 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v6, v7, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v2 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        v9 = OUTLINED_FUNCTION_42_6();
        if (!v11)
          v9 = v10;
        v12 = v1 + v8;
        if (!*(_BYTE *)(v12 + 8))
          v10 = *(double *)v12;
        if (v9 >= v10)
        {
          OUTLINED_FUNCTION_10_24(v1);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v0);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v11);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_9_17();
}

void Array<A>.minSecondValue.getter()
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
  char v9;

  OUTLINED_FUNCTION_9_27();
  v4 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_29();
  if (v3)
  {
    v7 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v7, v8, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v3 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        if (*(double *)(v2 + *(int *)(v0 + 24)) >= *(double *)(v1 + *(int *)(v0 + 24)))
        {
          OUTLINED_FUNCTION_10_24(v2);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v1);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v9);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_35_7();
  OUTLINED_FUNCTION_9_17();
}

void Array<A>.minThirdValue.getter()
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
  double v9;
  double v10;
  char v11;
  uint64_t v12;
  double v13;

  OUTLINED_FUNCTION_9_27();
  v3 = OUTLINED_FUNCTION_2_35();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_20_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_37();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_29();
  if (v2)
  {
    v6 = OUTLINED_FUNCTION_8_33();
    OUTLINED_FUNCTION_18_23(v6, v7, type metadata accessor for DetailChartDataElement);
    OUTLINED_FUNCTION_1_17();
    if (v2 != 1)
    {
      OUTLINED_FUNCTION_12_25();
      do
      {
        OUTLINED_FUNCTION_5_34();
        v9 = OUTLINED_FUNCTION_42_6();
        if (!v11)
          v9 = v10;
        v12 = v0 + v8;
        if ((*(_BYTE *)(v12 + 8) & 1) != 0)
          v13 = 1.79769313e308;
        else
          v13 = *(double *)v12;
        if (v9 >= v13)
        {
          OUTLINED_FUNCTION_10_24(v1);
        }
        else
        {
          OUTLINED_FUNCTION_10_24(v0);
          OUTLINED_FUNCTION_6_26();
        }
        OUTLINED_FUNCTION_20_18();
      }
      while (!v11);
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_4_34();
    OUTLINED_FUNCTION_11_23();
  }
  OUTLINED_FUNCTION_9_17();
}

void sub_24A3589A8()
{
  sub_24A2A5768(&qword_257925380, type metadata accessor for DetailChartDataElement.ValueLabel, (uint64_t)&protocol conformance descriptor for DetailChartDataElement.ValueLabel);
}

void sub_24A3589D4()
{
  sub_24A2A5768(&qword_257922E20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
}

void sub_24A358A00()
{
  sub_24A2A5768(&qword_257925388, type metadata accessor for DetailChartDataElement, (uint64_t)&protocol conformance descriptor for DetailChartDataElement);
}

uint64_t *initializeBufferWithCopyOfBuffer for DetailChartDataElement(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = sub_24A361C94();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    v9 = a3[7];
    v10 = a3[8];
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    *(_QWORD *)v11 = *(_QWORD *)v12;
    v11[8] = v12[8];
    v13 = (uint64_t *)((char *)a1 + v10);
    v14 = (uint64_t *)((char *)a2 + v10);
    v15 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v24 = v14[1];
      *v13 = *v14;
      v13[1] = v24;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
LABEL_11:
        v25 = a3[9];
        v26 = a3[10];
        v27 = (uint64_t *)((char *)a1 + v25);
        v28 = (uint64_t *)((char *)a2 + v25);
        v29 = v28[1];
        *v27 = *v28;
        v27[1] = v29;
        *(uint64_t *)((char *)a1 + v26) = *(uint64_t *)((char *)a2 + v26);
        v30 = a3[12];
        *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
        v31 = (uint64_t *)((char *)a1 + v30);
        v32 = (uint64_t *)((char *)a2 + v30);
        v33 = v32[1];
        *v31 = *v32;
        v31[1] = v33;
        v34 = a3[13];
        v35 = (uint64_t *)((char *)a1 + v34);
        v36 = (uint64_t *)((char *)a2 + v34);
        v37 = v36[1];
        *v35 = *v36;
        v35[1] = v37;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return a1;
      }
      v17 = v14[1];
      *v13 = *v14;
      v13[1] = v17;
      swift_bridgeObjectRetain();
      v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v19 = (char *)v13 + v18;
      v20 = (char *)v14 + v18;
      v21 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
        __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
      }
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_11;
  }
  v23 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t destroy for DetailChartDataElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_24A361C94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 32);
  type metadata accessor for DetailChartDataElement.ValueLabel(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease();
    v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v8 = sub_24A362B88();
    if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DetailChartDataElement(uint64_t a1, uint64_t a2, int *a3)
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
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;

  v6 = sub_24A361C94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = (_QWORD *)(a1 + v9);
  v13 = (_QWORD *)(a2 + v9);
  v14 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v22 = v13[1];
    *v12 = *v13;
    v12[1] = v22;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_storeEnumTagMultiPayload();
    goto LABEL_9;
  }
  if (!EnumCaseMultiPayload)
  {
    v16 = v13[1];
    *v12 = *v13;
    v12[1] = v16;
    swift_bridgeObjectRetain();
    v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v18 = (char *)v12 + v17;
    v19 = (char *)v13 + v17;
    v20 = sub_24A362B88();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    goto LABEL_8;
  }
  memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
LABEL_9:
  v23 = a3[9];
  v24 = a3[10];
  v25 = (_QWORD *)(a1 + v23);
  v26 = (_QWORD *)(a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  *(_QWORD *)(a1 + v24) = *(_QWORD *)(a2 + v24);
  v28 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)(a2 + v28);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = a3[13];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DetailChartDataElement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  v6 = sub_24A361C94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = v10;
  if (a1 != a2)
  {
    v11 = a3[8];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    sub_24A333C3C(a1 + v11, type metadata accessor for DetailChartDataElement.ValueLabel);
    v14 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
LABEL_9:
      swift_storeEnumTagMultiPayload();
      goto LABEL_10;
    }
    if (!EnumCaseMultiPayload)
    {
      *v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
      v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v17 = (char *)v12 + v16;
      v18 = (char *)v13 + v16;
      v19 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
        __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
      }
      goto LABEL_9;
    }
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
LABEL_10:
  v21 = a3[9];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_retain();
  swift_release();
  v24 = a3[12];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[13];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DetailChartDataElement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_24A361C94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = (_OWORD *)(a1 + v9);
  v13 = (_OWORD *)(a2 + v9);
  v14 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v16 = (char *)v12 + v15;
    v17 = (char *)v13 + v15;
    v18 = sub_24A362B88();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v21 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for DetailChartDataElement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v6 = sub_24A361C94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  if (a1 != a2)
  {
    v11 = a3[8];
    v12 = (_OWORD *)(a1 + v11);
    v13 = (_OWORD *)(a2 + v11);
    sub_24A333C3C(a1 + v11, type metadata accessor for DetailChartDataElement.ValueLabel);
    v14 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      *v12 = *v13;
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v16 = (char *)v12 + v15;
      v17 = (char *)v13 + v15;
      v18 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  v20 = a3[9];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_release();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_release();
  v25 = a3[12];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  v30 = a3[13];
  v31 = (_QWORD *)(a1 + v30);
  v32 = (uint64_t *)(a2 + v30);
  v34 = *v32;
  v33 = v32[1];
  *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DetailChartDataElement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A35959C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = OUTLINED_FUNCTION_16();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = type metadata accessor for DetailChartDataElement.ValueLabel(0);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for DetailChartDataElement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A359648(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_16();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = type metadata accessor for DetailChartDataElement.ValueLabel(0);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 32);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_24A3596E4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24A361C94();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for DetailChartDataElement.ValueLabel(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DetailChartDataElement.ValueLabel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for DetailChartDataElement.ValueLabel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v4 = sub_24A362B88();
    result = __swift_getEnumTagSinglePayload(v3, 1, v4);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return result;
}

_QWORD *initializeWithCopy for DetailChartDataElement.ValueLabel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_24A362B88();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for DetailChartDataElement.ValueLabel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_24A333C3C((uint64_t)a1, type metadata accessor for DetailChartDataElement.ValueLabel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *initializeWithTake for DetailChartDataElement.ValueLabel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_24A362B88();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for DetailChartDataElement.ValueLabel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_24A333C3C((uint64_t)a1, type metadata accessor for DetailChartDataElement.ValueLabel);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_257923918) + 48);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_24A362B88();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257923910);
        memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void sub_24A359E0C()
{
  unint64_t v0;
  char v1;
  char *v2;
  uint64_t v3;
  void *v4;

  sub_24A359EA0();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2 = &v1;
    v3 = MEMORY[0x24BEE0178] + 64;
    v4 = &unk_24A368AD0;
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_24A359EA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544CF210)
  {
    sub_24A362B88();
    v0 = sub_24A3631F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544CF210);
  }
}

uint64_t OUTLINED_FUNCTION_2_35()
{
  return type metadata accessor for DetailChartDataElement(0);
}

void OUTLINED_FUNCTION_4_34()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;
  uint64_t v2;

  sub_24A2C2BE4(v2, v1, v0);
}

void OUTLINED_FUNCTION_5_34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_24A2C2BB8(v1, v0, v2);
}

void OUTLINED_FUNCTION_6_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_24A2C2BE4(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_8_33()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
}

void OUTLINED_FUNCTION_10_24(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_24A333C3C(a1, v1);
}

void OUTLINED_FUNCTION_11_23()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_24A333C3C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_14_25()
{
  return type metadata accessor for DetailChartDataElement(0);
}

uint64_t OUTLINED_FUNCTION_17_15@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

void OUTLINED_FUNCTION_18_23(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_24A2C2BB8(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_19_20()
{
  return sub_24A36338C();
}

void OUTLINED_FUNCTION_25_15(uint64_t a1)
{
  uint64_t *v1;

  sub_24A3365B0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26_14()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_31_12()
{
  return sub_24A362EE8();
}

uint64_t OUTLINED_FUNCTION_32_10()
{
  return swift_retain();
}

double OUTLINED_FUNCTION_35_7()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36_7()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_40_6()
{
  return sub_24A362AC8();
}

double OUTLINED_FUNCTION_42_6()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t OUTLINED_FUNCTION_43_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t AirQualityDetailStringBuilder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AirQualityDetailStringBuilder.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t AirQualityDetailStringBuilder.attributionDescription(for:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925390);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A362108();
  v3 = sub_24A362198();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_24A35A290((uint64_t)v2);
    return 0;
  }
  else
  {
    v5 = sub_24A36218C();
    v7 = v6;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
    if (qword_2544CF228 != -1)
      swift_once();
    sub_24A361A84();
    sub_24A2B039C(0, (unint64_t *)&qword_257922E68);
    sub_24A35A4DC();
    v8 = sub_24A35A2D0(v5, v7);
    swift_bridgeObjectRelease();
    sub_24A2B039C(0, &qword_257925398);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579253A0);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_24A368B20;
    *(_QWORD *)(v9 + 32) = v8;
    v10[1] = v9;
    sub_24A362F84();
    return sub_24A3631A0();
  }
}

uint64_t sub_24A35A290(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257925390);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24A35A2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t inited;
  void **v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[112];
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = sub_24A361B2C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = sub_24A362EDC();
  v27 = v8;
  v24 = 0x656D6F7A65657262;
  v25 = 0xEB00000000726574;
  sub_24A2A4EC0();
  v9 = MEMORY[0x24BEE0D00];
  v10 = sub_24A363224();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    sub_24A2B039C(0, &qword_257925398);
    swift_bridgeObjectRetain();
    return sub_24A35A4DC();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257925440);
    inited = swift_initStackObject();
    v13 = (void **)MEMORY[0x24BEBB440];
    *(_OWORD *)(inited + 16) = xmmword_24A363910;
    v14 = *v13;
    v15 = MEMORY[0x24BEE1768];
    *(_QWORD *)(inited + 32) = v14;
    *(_QWORD *)(inited + 40) = 1;
    v16 = (void *)*MEMORY[0x24BEBB388];
    *(_QWORD *)(inited + 64) = v15;
    *(_QWORD *)(inited + 72) = v16;
    v17 = v14;
    v18 = v16;
    sub_24A3620FC();
    v19 = sub_24A361B14();
    v21 = v20;
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    *(_QWORD *)(inited + 104) = v9;
    *(_QWORD *)(inited + 80) = v19;
    *(_QWORD *)(inited + 88) = v21;
    type metadata accessor for Key();
    sub_24A35A5B4();
    v22 = sub_24A362E28();
    objc_allocWithZone(MEMORY[0x24BDD1688]);
    swift_bridgeObjectRetain();
    return sub_24A35A5F4(a1, a2, v22);
  }
}

id sub_24A35A4DC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_24A362E94();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

uint64_t AirQualityDetailStringBuilder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AirQualityDetailStringBuilder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24A35A564()
{
  return AirQualityDetailStringBuilder.attributionDescription(for:)();
}

uint64_t dispatch thunk of AirQualityDetailStringBuilderType.attributionDescription(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for AirQualityDetailStringBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for AirQualityDetailStringBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AirQualityDetailStringBuilder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_24A35A5B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257922E50;
  if (!qword_257922E50)
  {
    type metadata accessor for Key();
    result = MEMORY[0x24BD0E6E0](&unk_24A363B50, v1);
    atomic_store(result, (unint64_t *)&qword_257922E50);
  }
  return result;
}

id sub_24A35A5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_24A362E94();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key();
    sub_24A35A5B4();
    v6 = (void *)sub_24A362E1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

uint64_t sub_24A35A698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v21;
  BOOL v23;
  _BYTE v26[12];
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;

  v4 = sub_24A3620F0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v49 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v26[-v8];
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  v40 = a2;
  v50 = MEMORY[0x24BEE4AF8];
  sub_24A346194(0, v10, 0);
  v11 = *(_QWORD *)(sub_24A361E68() - 8);
  v12 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v48 = *(_QWORD *)(v11 + 72);
  v47 = *MEMORY[0x24BDFA5A0];
  v46 = *MEMORY[0x24BDFA4C8];
  v45 = *MEMORY[0x24BDFA598];
  v44 = *MEMORY[0x24BDFA5A8];
  v43 = *MEMORY[0x24BDFA518];
  v42 = *MEMORY[0x24BDFA4E8];
  v41 = *MEMORY[0x24BDFA538];
  v39 = *MEMORY[0x24BDFA5B0];
  v38 = *MEMORY[0x24BDFA5B8];
  v37 = *MEMORY[0x24BDFA5C0];
  v36 = *MEMORY[0x24BDFA548];
  v35 = *MEMORY[0x24BDFA528];
  v34 = *MEMORY[0x24BDFA568];
  v33 = *MEMORY[0x24BDFA550];
  v32 = *MEMORY[0x24BDFA500];
  v31 = *MEMORY[0x24BDFA4E0];
  v30 = *MEMORY[0x24BDFA4B8];
  v29 = *MEMORY[0x24BDFA508];
  v28 = *MEMORY[0x24BDFA510];
  v27 = *MEMORY[0x24BDFA5C8];
  do
  {
    sub_24A361E5C();
    v13 = v49;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v49, v9, v4);
    v14 = (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 88))(v13, v4);
    if (v14 == v47 || v14 == v46)
    {
LABEL_8:
      v16 = 2;
      goto LABEL_11;
    }
    if (v14 == v45)
      goto LABEL_10;
    if (v14 == v44)
      goto LABEL_8;
    if (v14 == v43 || v14 == v42)
    {
LABEL_10:
      v16 = 3;
      goto LABEL_11;
    }
    if (v14 == v41)
      goto LABEL_23;
    if (v14 == v39)
      goto LABEL_10;
    if (v14 == v38)
      goto LABEL_8;
    v21 = v14 == v37 || v14 == v36;
    if (v21 || v14 == v35)
      goto LABEL_10;
    if (v14 == v34)
    {
      v16 = 4;
    }
    else
    {
      if (v14 == v33)
        goto LABEL_8;
      if (v14 == v32)
        goto LABEL_10;
      if (v14 == v31)
        goto LABEL_8;
      v23 = v14 == v30 || v14 == v29;
      if (v23 || v14 == v28)
        goto LABEL_10;
      if (v14 != v27)
      {
        (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v49, v4);
LABEL_23:
        v16 = 5;
        goto LABEL_11;
      }
      v16 = 1;
    }
LABEL_11:
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v9, v4);
    v17 = v50;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24A346194(0, *(_QWORD *)(v17 + 16) + 1, 1);
      v17 = v50;
    }
    v19 = *(_QWORD *)(v17 + 16);
    v18 = *(_QWORD *)(v17 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_24A346194((char *)(v18 > 1), v19 + 1, 1);
      v17 = v50;
    }
    *(_QWORD *)(v17 + 16) = v19 + 1;
    *(_BYTE *)(v17 + v19 + 32) = v16;
    v12 += v48;
    --v10;
  }
  while (v10);
  swift_release();
  return v17;
}

uint64_t PrecipitationCalculator.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  type metadata accessor for IsSameDayCache();
  v2 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF5D8);
  swift_allocObject();
  result = sub_24A362438();
  *(_QWORD *)(v2 + 16) = result;
  *a1 = v2;
  return result;
}

void PrecipitationCalculator.findUniquePrecipitation(currentWeather:dailyForecast:)(_BYTE *a1@<X8>)
{
  uint64_t *v1;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  char v24;
  int v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;

  v39 = a1;
  v38 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12_26(v4, v37);
  v5 = sub_24A3621E0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_13_15();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v37 - v10;
  type metadata accessor for PresentativePastHourRange(0);
  OUTLINED_FUNCTION_4();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - v16;
  v18 = *v1;
  sub_24A361FD0();
  sub_24A361FDC();
  sub_24A361FF4();
  PrecipitationCalculator.findPresentativePastHourRange(pastHourAmounts:past6HourAmounts:past24HourAmounts:)((uint64_t)v11, (uint64_t)v9, v2, (uint64_t)v17);
  OUTLINED_FUNCTION_7_16(v2);
  OUTLINED_FUNCTION_7_16((uint64_t)v9);
  OUTLINED_FUNCTION_7_16((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF0C8);
  v19 = sub_24A3622E8();
  swift_retain();
  v20 = sub_24A35A698(v19, v18);
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v22 = (unsigned __int8 *)(v20 + 32);
    v23 = MEMORY[0x24BEE4AF8];
    do
    {
      v25 = *v22++;
      v24 = v25;
      if (v25)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v40 = v23;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24A346194(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v40;
        }
        v28 = *(_QWORD *)(v23 + 16);
        v27 = *(_QWORD *)(v23 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_24A346194((char *)(v27 > 1), v28 + 1, 1);
          v23 = v40;
        }
        *(_QWORD *)(v23 + 16) = v28 + 1;
        *(_BYTE *)(v23 + v28 + 32) = v24;
      }
      --v21;
    }
    while (v21);
  }
  else
  {
    v23 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v29 = sub_24A2BC3E0(v23);
  v30 = sub_24A35D1B0(v29);
  if ((v32 & 1) == 0)
  {
    if (*(_DWORD *)(v29 + 36) == v31)
    {
      if (v30 == 1 << *(_BYTE *)(v29 + 32)
        || (sub_24A35D158(v30, v31, v29, &v40),
            v33 = v40,
            sub_24A317234((uint64_t)v17, (uint64_t)v15),
            v34 = v37,
            sub_24A35D230((uint64_t)v15, v37),
            v35 = *(unsigned __int8 *)(v34 + *(int *)(v38 + 24)),
            sub_24A333C3C(v34, type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext),
            v33 != v35))
      {
        sub_24A333C3C((uint64_t)v17, type metadata accessor for PresentativePastHourRange);
        swift_bridgeObjectRelease();
      }
      else
      {
        v36 = *(_QWORD *)(v29 + 16);
        swift_bridgeObjectRelease();
        sub_24A333C3C((uint64_t)v17, type metadata accessor for PresentativePastHourRange);
        if (v36 == 1)
          goto LABEL_20;
      }
      LOBYTE(v33) = 0;
LABEL_20:
      *v39 = v33;
      OUTLINED_FUNCTION_67();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t PrecipitationCalculator.findPresentativePastHourRange(pastHourAmounts:past6HourAmounts:past24HourAmounts:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  void (*v47)(void *, uint64_t);
  id v48;
  double v49;
  double v50;
  id v51;
  id v52;
  double v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  double v58;
  id v59;
  double v60;
  double v61;
  char v62;
  char v63;
  void *v64;
  void (*v65)(uint64_t, char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  _QWORD v69[2];
  void *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v81 = a4;
  v82 = a3;
  v84 = sub_24A362180();
  v78 = *(_QWORD *)(v84 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10();
  v70 = v8;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12_0();
  v69[1] = v10;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_12_0();
  v80 = v12;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  v73 = (char *)v69 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_10();
  v76 = v17;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_12_0();
  v71 = v19;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_12_0();
  v75 = v21;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_12_0();
  v74 = v23;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_12_0();
  v72 = v25;
  OUTLINED_FUNCTION_9_0();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v69 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v69 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)v69 - v33;
  v83 = a1;
  sub_24A3621B0();
  v35 = (void *)objc_opt_self();
  v36 = OUTLINED_FUNCTION_31_13(v35);
  OUTLINED_FUNCTION_6_27();

  v79 = v16;
  OUTLINED_FUNCTION_3_38((uint64_t)v32);
  OUTLINED_FUNCTION_1_40();
  v38 = v37;
  OUTLINED_FUNCTION_0_33();
  v77 = a2;
  OUTLINED_FUNCTION_29_12();
  v39 = OUTLINED_FUNCTION_4_35();
  OUTLINED_FUNCTION_6_27();

  OUTLINED_FUNCTION_3_38((uint64_t)v32);
  OUTLINED_FUNCTION_1_40();
  v41 = v40;
  OUTLINED_FUNCTION_0_33();
  sub_24A3621B0();
  v42 = OUTLINED_FUNCTION_4_35();
  OUTLINED_FUNCTION_6_27();

  OUTLINED_FUNCTION_3_38((uint64_t)v32);
  OUTLINED_FUNCTION_1_40();
  v44 = v43;
  OUTLINED_FUNCTION_0_33();
  if (v44 - v38 >= v38)
  {
    v47 = (void (*)(void *, uint64_t))v78;
    if (v44 - v41 >= v41)
    {
      v29 = v71;
      OUTLINED_FUNCTION_29_12();
      v56 = v70;
      OUTLINED_FUNCTION_36_8();
      OUTLINED_FUNCTION_30_11();
      OUTLINED_FUNCTION_26_15();
      v57 = OUTLINED_FUNCTION_4_35();
      OUTLINED_FUNCTION_19_21();

      OUTLINED_FUNCTION_1_40();
      v50 = v58;
      OUTLINED_FUNCTION_0_33();
      v59 = OUTLINED_FUNCTION_4_35();
      OUTLINED_FUNCTION_27_14();
      v46 = v76;
      OUTLINED_FUNCTION_37_7();
      v55 = v82;
    }
    else
    {
      sub_24A3621B0();
      OUTLINED_FUNCTION_36_8();
      OUTLINED_FUNCTION_30_11();
      OUTLINED_FUNCTION_26_15();
      v52 = OUTLINED_FUNCTION_4_35();
      v29 = v74;
      sub_24A3619D0();

      OUTLINED_FUNCTION_1_40();
      v50 = v53;
      OUTLINED_FUNCTION_0_33();
      v54 = OUTLINED_FUNCTION_4_35();
      OUTLINED_FUNCTION_27_14();
      v46 = v75;
      OUTLINED_FUNCTION_37_7();
      v55 = v77;
    }
    v83 = v55;
  }
  else
  {
    sub_24A3621B0();
    v45 = v73;
    OUTLINED_FUNCTION_36_8();
    v46 = v72;
    OUTLINED_FUNCTION_30_11();
    v47 = *(void (**)(void *, uint64_t))(v78 + 8);
    v47(v45, v84);
    v48 = objc_msgSend(v35, sel_centimeters);
    OUTLINED_FUNCTION_19_21();

    OUTLINED_FUNCTION_1_40();
    v50 = v49;
    OUTLINED_FUNCTION_0_33();
    v51 = objc_msgSend(v35, sel_centimeters);
    OUTLINED_FUNCTION_27_14();
    OUTLINED_FUNCTION_37_7();
  }

  OUTLINED_FUNCTION_1_40();
  v61 = v60;
  OUTLINED_FUNCTION_0_33();
  if (v50 <= 0.0)
    v62 = 0;
  else
    v62 = 5;
  if (v61 <= 0.0)
    v63 = v62;
  else
    v63 = 2;
  OUTLINED_FUNCTION_3_38(v46);
  OUTLINED_FUNCTION_3_38((uint64_t)v29);
  sub_24A3621B0();
  v64 = v80;
  sub_24A3621A4();
  sub_24A36215C();
  v47(v64, v84);
  v65 = *(void (**)(uint64_t, char *, uint64_t))(v79 + 32);
  v66 = v81;
  v65(v81, v34, v15);
  v67 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  v65(v66 + *(int *)(v67 + 20), v32, v15);
  *(_BYTE *)(v66 + *(int *)(v67 + 24)) = v63;
  type metadata accessor for PresentativePastHourRange(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t PrecipitationCalculator.dominantPrecipitationType(dayWeather:)@<X0>(char *a1@<X8>)
{
  return sub_24A35B3F8((void (*)(void))MEMORY[0x24BDFA238], a1);
}

void PrecipitationCalculator.dominantPrecipitationType(precipitation:snowfall:)()
{
  uint64_t v0;
  char *v1;
  char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  char v11;

  OUTLINED_FUNCTION_9_27();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_41_0();
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_31_13(v4);
  sub_24A3619D0();

  OUTLINED_FUNCTION_3_2();
  v7 = v6;
  OUTLINED_FUNCTION_4_2();
  v8 = objc_msgSend(v4, *(SEL *)(v0 + 3600));
  sub_24A3619D0();

  OUTLINED_FUNCTION_3_2();
  v10 = v9;
  OUTLINED_FUNCTION_4_2();
  if (v7 <= 0.0)
    v11 = 0;
  else
    v11 = 5;
  if (v10 > 0.0)
    v11 = 2;
  *v2 = v11;
  OUTLINED_FUNCTION_9_17();
}

uint64_t PrecipitationCalculator.dominantPrecipitationType(currentWeather:)@<X0>(char *a1@<X8>)
{
  return sub_24A35B3F8((void (*)(void))MEMORY[0x24BDFA3E0], a1);
}

uint64_t sub_24A35B3F8@<X0>(void (*a1)(void)@<X1>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  char v9;

  v5 = sub_24A3620F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_41_0();
  a1();
  WeatherCondition.dominantPrecipitation.getter(&v9);
  result = OUTLINED_FUNCTION_60_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  v8 = v9;
  if (v9 == 6)
    v8 = 5;
  *a2 = v8;
  return result;
}

void PrecipitationCalculator.precipitationAmountForDisplay(precipitation:snowfall:precipitationType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_24A35B4C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v2 = OUTLINED_FUNCTION_39_6();
  return v3(v2, a1);
}

BOOL PrecipitationCalculator.hasPrecipitation(in:)()
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
  double v9;
  double v10;
  uint64_t v12;

  OUTLINED_FUNCTION_9_27();
  v12 = sub_24A3621E0();
  v3 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_41_0();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_23_10();
  v6 = sub_24A3620F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_20_19();
  sub_24A361E5C();
  v8 = sub_24A3620D8();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
  if ((v8 & 1) == 0)
    return 0;
  sub_24A361E2C();
  sub_24A3621B0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v12);
  sub_24A361940();
  v10 = v9;
  OUTLINED_FUNCTION_60_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return v10 > 0.0;
}

void PrecipitationCalculator.precipitationAmountForDisplay(from:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 *v31;
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
  char v42;
  uint64_t v43;

  v41 = a2;
  v39 = sub_24A361D90();
  v37 = *(_QWORD *)(v39 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3();
  v9 = v8 - v7;
  v38 = sub_24A361C94();
  v36 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_13_15();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF098);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  v17 = v16 - v15;
  v18 = sub_24A361E68();
  v40 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_20_19();
  v20 = *v2;
  v21 = (int *)type metadata accessor for WeatherValueCalculationContext();
  sub_24A32CB80(a1 + v21[5], v17, &qword_2544CF098);
  if (__swift_getEnumTagSinglePayload(v17, 1, v18) == 1)
  {
    sub_24A3365B0(v17, &qword_2544CF098);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v3, v17, v18);
    sub_24A361EEC();
    sub_24A361E50();
    v34 = a1 + v21[9];
    sub_24A361D00();
    v35 = v20;
    v22 = IsSameDayCache.isSameDay(_:_:calendar:)((uint64_t)v13, v4, v9);
    v37 = *(_QWORD *)(v37 + 8);
    ((void (*)(uint64_t, uint64_t))v37)(v9, v39);
    OUTLINED_FUNCTION_25_1(v4);
    OUTLINED_FUNCTION_25_1((uint64_t)v13);
    if ((v22 & 1) != 0)
    {
      sub_24A362000();
      sub_24A361EEC();
      sub_24A361D00();
      v23 = IsSameDayCache.isSameDay(_:_:calendar:)((uint64_t)v13, v4, v9);
      ((void (*)(uint64_t, uint64_t))v37)(v9, v39);
      OUTLINED_FUNCTION_25_1(v4);
      OUTLINED_FUNCTION_25_1((uint64_t)v13);
      v24 = v40;
      if ((v23 & 1) == 0)
      {
        v43 = v35;
        v29 = v21[7];
        v42 = *(_BYTE *)(a1 + v21[6]);
        OUTLINED_FUNCTION_33_10(a1 + v29);
        v30 = OUTLINED_FUNCTION_23_14();
        sub_24A35B96C(v30, v31, v32, v3, v33);
        OUTLINED_FUNCTION_18_24(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
        goto LABEL_7;
      }
    }
    OUTLINED_FUNCTION_18_24(*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
    v20 = v35;
  }
  v43 = v20;
  OUTLINED_FUNCTION_33_10(a1 + v21[7]);
  v25 = OUTLINED_FUNCTION_23_14();
  sub_24A35BC00(v25, v26, v27, v28);
LABEL_7:
  OUTLINED_FUNCTION_67();
}

uint64_t sub_24A35B96C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  char v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  __int128 v43;
  _OWORD v44[3];
  _QWORD *v45;

  v41 = a5;
  v40 = a4;
  v38 = a3;
  v39 = sub_24A361C94();
  v37 = *(_QWORD *)(v39 - 8);
  v7 = MEMORY[0x24BDAC7A8](v39);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v31 - v10;
  v12 = sub_24A3620F0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *a2;
  v35 = a2[1];
  v36 = v20;
  v43 = a2[2];
  v21 = a1;
  v42 = (_QWORD *)*v42;
  sub_24A2B3A34();
  v22 = (id)v43;
  sub_24A361934();
  sub_24A361F34();
  LOBYTE(a1) = sub_24A3620D8();
  v23 = *(void (**)(char *, uint64_t))(v13 + 8);
  v23(v15, v12);
  if ((a1 & 1) == 0)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v41, v19, v16);
  v32 = v12;
  v33 = v17;
  v34 = v16;
  sub_24A361E50();
  v24 = v21;
  sub_24A361EEC();
  v25 = sub_24A361C70();
  v26 = *(void (**)(char *, uint64_t))(v37 + 8);
  v27 = v9;
  v28 = v39;
  v26(v27, v39);
  v26(v11, v28);
  if ((v25 & 1) != 0)
  {
    sub_24A361E5C();
    v29 = sub_24A3620D8();
    v23(v15, v32);
    if ((v29 & 1) == 0)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v41, v19, v34);
  }
  v45 = v42;
  v44[0] = v36;
  v44[1] = v35;
  v44[2] = v43;
  sub_24A35CE98(v24, (uint64_t)v44, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v19, v34);
}

uint64_t sub_24A35BC00@<X0>(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t *v4;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  char *v42;
  char *v43;
  char v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  _OWORD v71[3];
  uint64_t v72;

  v67 = a3;
  v68 = a1;
  v69 = a4;
  v57 = sub_24A361C94();
  v56 = *(_QWORD *)(v57 - 8);
  v6 = MEMORY[0x24BDAC7A8](v57);
  v55 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v54 = (char *)&v52 - v8;
  v9 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  MEMORY[0x24BDAC7A8](v9);
  v58 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A3621E0();
  v65 = *(_QWORD *)(v11 - 8);
  v66 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v64 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v52 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v52 - v17;
  v62 = type metadata accessor for PresentativePastHourRange(0);
  MEMORY[0x24BDAC7A8](v62);
  v63 = (uint64_t)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_24A3620F0();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *a2;
  v60 = a2[1];
  v61 = v28;
  v70 = a2[2];
  v59 = *v4;
  sub_24A2B3A34();
  v29 = (id)v70;
  sub_24A361934();
  v30 = v68;
  sub_24A361F34();
  v31 = sub_24A3620D8();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  if ((v31 & 1) != 0)
  {
    v52 = v27;
    v53 = v25;
    v32 = v24;
    v33 = v69;
    sub_24A361FD0();
    sub_24A361FDC();
    v34 = (uint64_t)v64;
    sub_24A361FF4();
    v35 = v63;
    PrecipitationCalculator.findPresentativePastHourRange(pastHourAmounts:past6HourAmounts:past24HourAmounts:)((uint64_t)v18, (uint64_t)v16, v34, v63);
    v36 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
    v37 = v34;
    v38 = v66;
    v36(v37, v66);
    v36((uint64_t)v16, v38);
    v36((uint64_t)v18, v38);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v39 = v58;
      sub_24A35D230(v35, v58);
      v40 = v32;
      sub_24A361940();
      if (v41 == 0.0)
      {
        v42 = v54;
        sub_24A361EEC();
        v43 = v55;
        sub_24A362000();
        v44 = sub_24A361BEC();
        v45 = *(void (**)(char *, uint64_t))(v56 + 8);
        v46 = v43;
        v47 = v57;
        v45(v46, v57);
        v45(v42, v47);
        sub_24A333C3C(v39, type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext);
        v48 = v33;
        v49 = v53;
        v50 = v52;
        if ((v44 & 1) != 0)
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v53 + 32))(v48, v52, v32);
        goto LABEL_11;
      }
      sub_24A333C3C(v39, type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext);
      v48 = v33;
    }
    else
    {
      sub_24A333C3C(v35, type metadata accessor for PresentativePastHourRange);
      v48 = v33;
      v40 = v32;
    }
    v49 = v53;
    v50 = v52;
LABEL_11:
    v72 = v59;
    v71[0] = v61;
    v71[1] = v60;
    v71[2] = v70;
    sub_24A35CE98(v30, (uint64_t)v71, v48);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v50, v40);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v69, v27, v24);
}

void PrecipitationCalculator.apparentPrecipitationIntensityForDisplay(from:)()
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
  void (*v36)(uint64_t, _QWORD, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int EnumTagSinglePayload;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
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
  uint64_t v83;
  uint64_t v84;
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
  uint64_t v99;
  uint64_t v100;

  OUTLINED_FUNCTION_9_27();
  v99 = v3;
  v100 = v2;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v81 = *(_QWORD *)(v80 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_50();
  v79 = v5;
  v6 = sub_24A3621E0();
  v82 = *(_QWORD *)(v6 - 8);
  v83 = v6;
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_50();
  v78 = v8;
  v9 = sub_24A361C94();
  v10 = *(_QWORD *)(v9 - 8);
  v96 = v9;
  v97 = v10;
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_10();
  v89 = v12;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  v88 = (char *)&v74 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF098);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_50();
  v94 = v16;
  v93 = sub_24A361E68();
  v90 = *(_QWORD *)(v93 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_50();
  v87 = v18;
  v19 = sub_24A361D90();
  v20 = *(_QWORD *)(v19 - 8);
  v91 = v19;
  v92 = v20;
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_12_26(v22, v74);
  v23 = sub_24A3620F0();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_23_10();
  v25 = sub_24A362234();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_3();
  v29 = v28 - v27;
  v30 = sub_24A362210();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_3();
  v34 = v33 - v32;
  v35 = *v0;
  v36 = *(void (**)(uint64_t, _QWORD, uint64_t))(v26 + 104);
  v37 = v100;
  v38 = v25;
  v39 = v34;
  v36(v29, *MEMORY[0x24BDFA7B8], v38);
  sub_24A3621F8();
  sub_24A361F34();
  v40 = sub_24A3620D8();
  v41 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  OUTLINED_FUNCTION_34_10(v1);
  if ((v40 & 1) != 0)
  {
    v84 = v35;
    v85 = v31;
    v77 = v39;
    v86 = v30;
    v42 = type metadata accessor for WeatherValueCalculationContext();
    v43 = v98;
    sub_24A361D00();
    v95 = swift_allocObject();
    *(_BYTE *)(v95 + 16) = 2;
    v44 = v94;
    sub_24A32CB80(v37 + *(int *)(v42 + 20), v94, &qword_2544CF098);
    v45 = v93;
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v44, 1, v93);
    v76 = v42;
    if (EnumTagSinglePayload == 1)
    {
      sub_24A3365B0(v44, &qword_2544CF098);
      v47 = v43;
    }
    else
    {
      v75 = v23;
      v48 = v87;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 32))(v87, v44, v45);
      v49 = (uint64_t)v88;
      sub_24A361EEC();
      v50 = v89;
      sub_24A361E50();
      v51 = v84;
      v52 = IsSameDayCache.isSameDay(_:_:calendar:)(v49, v50, v43);
      v53 = v45;
      v54 = v52;
      v55 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
      v56 = v50;
      v57 = v96;
      v55(v56, v96);
      v55(v49, v57);
      if ((v54 & 1) != 0)
      {
        v58 = v53;
        v59 = v98;
        if ((sub_24A35C604(v95, v51, v37, v98) & 1) == 0)
        {
          v72 = v87;
          sub_24A361E5C();
          v73 = sub_24A3620D8();
          v41(v1, v75);
          (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v72, v58);
          v47 = v59;
          v60 = v85;
          v66 = v86;
          if ((v73 & 1) == 0)
            goto LABEL_15;
          goto LABEL_10;
        }
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v87, v53);
        v47 = v59;
      }
      else
      {
        OUTLINED_FUNCTION_60_0(v48, *(uint64_t (**)(uint64_t, uint64_t))(v90 + 8));
        v47 = v98;
      }
    }
    v60 = v85;
LABEL_10:
    if ((sub_24A35C604(v95, v84, v37, v47) & 1) == 0)
      goto LABEL_13;
    v61 = v88;
    sub_24A361EEC();
    v62 = v89;
    sub_24A362000();
    v63 = sub_24A361BEC();
    v64 = v62;
    v60 = v85;
    OUTLINED_FUNCTION_34_10(v64);
    v65 = (uint64_t)v61;
    v66 = v86;
    OUTLINED_FUNCTION_34_10(v65);
    if ((v63 & 1) == 0)
      goto LABEL_13;
    v67 = v78;
    sub_24A361FF4();
    v68 = v79;
    OUTLINED_FUNCTION_29_12();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v67, v83);
    v69 = v80;
    sub_24A361940();
    v71 = v70;
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v68, v69);
    if (v71 != 0.0)
    {
LABEL_13:
      sub_24A361EE0();
      OUTLINED_FUNCTION_25_16();
      OUTLINED_FUNCTION_60_0(v77, *(uint64_t (**)(uint64_t, uint64_t))(v60 + 8));
LABEL_16:
      swift_release();
      goto LABEL_17;
    }
LABEL_15:
    OUTLINED_FUNCTION_25_16();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v99, v77, v66);
    goto LABEL_16;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v99, v39, v30);
LABEL_17:
  OUTLINED_FUNCTION_9_17();
}

uint64_t sub_24A35C604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  _BYTE *v14;
  int v15;
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v6 = sub_24A361C94();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19 - v11;
  v15 = *(unsigned __int8 *)(a1 + 16);
  v14 = (_BYTE *)(a1 + 16);
  v13 = v15;
  if (v15 == 2)
  {
    type metadata accessor for WeatherValueCalculationContext();
    sub_24A362000();
    sub_24A361EEC();
    v16 = IsSameDayCache.isSameDay(_:_:calendar:)((uint64_t)v12, (uint64_t)v10, a4);
    v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
    swift_beginAccess();
    *v14 = v16 & 1;
  }
  else
  {
    v16 = v13 & 1;
  }
  return v16 & 1;
}

BOOL PrecipitationCalculator.hasPrecipitationOccurred(within:hourlyForecast:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD v4[6];

  v2 = *v1;
  v4[2] = a1;
  v4[3] = v2;
  return sub_24A35CBD4((uint64_t (*)(char *))sub_24A35D284, (uint64_t)v4);
}

uint64_t sub_24A35C784(uint64_t a1, uint64_t a2)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char *v31;
  char v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  _QWORD v37[6];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char v46;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v37[4] = *(_QWORD *)(v4 - 8);
  v37[5] = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v37[2] = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v37[1] = (char *)v37 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v37[3] = (char *)v37 - v9;
  v10 = sub_24A3620F0();
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v37[0] = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v38 = (char *)v37 - v13;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF218);
  MEMORY[0x24BDAC7A8](v43);
  v44 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24A361F40();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_24A361C94();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A361EEC();
  v42 = sub_24A2E6184();
  v23 = sub_24A362E64();
  v24 = *(void (**)(char *, uint64_t))(v20 + 8);
  v24(v22, v19);
  v45 = v16;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v41 = a1;
  v26 = a1;
  v27 = v15;
  v28 = v15;
  v29 = (uint64_t)v44;
  v25(v18, v26, v28);
  sub_24A32CB80(a2, v29, &qword_2544CF218);
  if ((v23 & 1) != 0)
  {
    sub_24A3365B0(v29, &qword_2544CF218);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v27);
  }
  else
  {
    sub_24A361EEC();
    v30 = sub_24A362E64();
    v24(v22, v19);
    sub_24A3365B0(v29, &qword_2544CF218);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v27);
    if ((v30 & 1) == 0)
    {
      v31 = v38;
      sub_24A361F34();
      v32 = sub_24A3620D8();
      v33 = v40;
      v34 = *(void (**)(char *, uint64_t))(v39 + 8);
      v34(v31, v40);
      if ((v32 & 1) != 0)
      {
        sub_24A361EBC();
        sub_24A361EA4();
        v35 = (char *)v37[0];
        sub_24A361F34();
        WeatherCondition.dominantPrecipitation.getter(&v46);
        v34(v35, v33);
        __asm { BR              X10 }
      }
    }
  }
  return 0;
}

void sub_24A35CB64()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_centimeters);
  sub_24A2B3A34();
  sub_24A361934();
  JUMPOUT(0x24A35CAF4);
}

void sub_24A35CBA8()
{
  JUMPOUT(0x24A35CAECLL);
}

BOOL sub_24A35CBD4(uint64_t (*a1)(char *), uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(uint64_t *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[4];
  uint64_t v44;

  v39 = a1;
  v40 = a2;
  v3 = sub_24A361F40();
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)&v31 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF0E8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF240);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v9;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v33(v11, v2, v8);
  sub_24A35D300(&qword_2544CF0D8, MEMORY[0x24BDFA870]);
  v34 = v11;
  sub_24A362F30();
  v15 = &v14[*(int *)(v12 + 36)];
  sub_24A35D300((unint64_t *)&qword_2544CF0E0, MEMORY[0x24BDFA878]);
  v32 = v14;
  v16 = v36;
  while (1)
  {
    v17 = *(_QWORD *)v15;
    sub_24A363074();
    v41 = v43[0];
    v42 = v17;
    if (v17 == v43[0])
    {
LABEL_5:
      v29 = (uint64_t)v14;
      goto LABEL_7;
    }
    v18 = (void (*)(uint64_t *, _QWORD))sub_24A36308C();
    v19 = v37;
    v20 = v8;
    v21 = v15;
    v22 = v14;
    v23 = v38;
    (*(void (**)(char *))(v37 + 16))(v16);
    v18(v43, 0);
    v24 = v34;
    v25 = v22;
    v15 = v21;
    v8 = v20;
    v33(v34, (uint64_t)v25, v20);
    sub_24A363080();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v20);
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v6, v16, v23);
    v26 = v44;
    v27 = v39(v6);
    v44 = v26;
    if (v26)
      break;
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v23);
    v14 = v32;
    if ((v28 & 1) != 0)
      goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v23);
  v29 = (uint64_t)v32;
LABEL_7:
  sub_24A3365B0(v29, &qword_2544CF240);
  return v42 != v41;
}

uint64_t sub_24A35CE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a3;
  v28 = a1;
  v4 = sub_24A36212C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A3620F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v25 = *(_QWORD *)(v12 - 8);
  v26 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  v18 = *(void **)(a2 + 32);
  sub_24A2B3A34();
  v19 = v18;
  sub_24A361934();
  sub_24A361F34();
  LOBYTE(a2) = sub_24A3620D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if ((a2 & 1) != 0)
  {
    sub_24A361E8C();
    v20 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
    if (v20 == *MEMORY[0x24BDFA650])
    {
      v22 = v25;
      v21 = v26;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v15, v17, v26);
      v23 = v27;
    }
    else
    {
      v21 = v26;
      v23 = v27;
      v22 = v25;
      if (v20 == *MEMORY[0x24BDFA668])
      {
        sub_24A361EA4();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v21);
      }
      else
      {
        sub_24A361EBC();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v21);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
    }
  }
  else
  {
    v15 = v17;
    v21 = v26;
    v23 = v27;
    v22 = v25;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v23, v15, v21);
}

void sub_24A35D0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  PrecipitationCalculator.precipitationAmountForDisplay(precipitation:snowfall:precipitationType:)(a1, a2, a3);
}

uint64_t sub_24A35D0E0@<X0>(char *a1@<X8>)
{
  return PrecipitationCalculator.dominantPrecipitationType(dayWeather:)(a1);
}

uint64_t sub_24A35D0F4@<X0>(char *a1@<X8>)
{
  return PrecipitationCalculator.dominantPrecipitationType(currentWeather:)(a1);
}

void sub_24A35D108()
{
  PrecipitationCalculator.dominantPrecipitationType(precipitation:snowfall:)();
}

uint64_t sub_24A35D11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return PrecipitationCalculator.findPresentativePastHourRange(pastHourAmounts:past6HourAmounts:past24HourAmounts:)(a1, a2, a3, a4);
}

BOOL sub_24A35D134()
{
  return PrecipitationCalculator.hasPrecipitation(in:)();
}

uint64_t sub_24A35D158@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, _BYTE *a4@<X8>)
{
  if (result < 0 || 1 << *(_BYTE *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a3 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    *a4 = *(_BYTE *)(*(_QWORD *)(a3 + 48) + result);
    return result;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_24A35D1B0(uint64_t a1)
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

uint64_t sub_24A35D230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A35D274()
{
  return swift_deallocObject();
}

uint64_t sub_24A35D284(uint64_t a1)
{
  uint64_t v1;

  return sub_24A35C784(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t dispatch thunk of PrecipitationCalculatorType.precipitationAmountForDisplay(precipitation:snowfall:precipitationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.dominantPrecipitationType(dayWeather:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.dominantPrecipitationType(currentWeather:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.dominantPrecipitationType(precipitation:snowfall:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.findPresentativePastHourRange(pastHourAmounts:past6HourAmounts:past24HourAmounts:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.findUniquePrecipitation(currentWeather:dailyForecast:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.hasPrecipitation(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.precipitationAmountForDisplay(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.apparentPrecipitationIntensityForDisplay(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of PrecipitationCalculatorType.hasPrecipitationOccurred(within:hourlyForecast:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

ValueMetadata *type metadata accessor for PrecipitationCalculator()
{
  return &type metadata for PrecipitationCalculator;
}

void sub_24A35D300(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CF0E8);
    atomic_store(MEMORY[0x24BD0E6E0](a2, v4), a1);
  }
  OUTLINED_FUNCTION_23();
}

uint64_t OUTLINED_FUNCTION_0_33()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_40()
{
  return sub_24A361940();
}

uint64_t OUTLINED_FUNCTION_3_38(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

id OUTLINED_FUNCTION_4_35()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 3600));
}

uint64_t OUTLINED_FUNCTION_6_27()
{
  return sub_24A3619D0();
}

uint64_t OUTLINED_FUNCTION_12_26@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_24@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_19_21()
{
  return sub_24A3619D0();
}

uint64_t OUTLINED_FUNCTION_23_14()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_25_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_26_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_29_12()
{
  return sub_24A3621B0();
}

uint64_t OUTLINED_FUNCTION_30_11()
{
  return sub_24A36215C();
}

id OUTLINED_FUNCTION_31_13(void *a1)
{
  return objc_msgSend(a1, sel_centimeters);
}

__n128 OUTLINED_FUNCTION_33_10@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 - 144) = *(_OWORD *)a1;
  *(_OWORD *)(v1 - 128) = v2;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 - 112) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_34_10(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_36_8()
{
  return sub_24A3621A4();
}

uint64_t OUTLINED_FUNCTION_37_7()
{
  return sub_24A3619D0();
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  uint64_t v0;

  return v0;
}

void static LinearGradient.fallback.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  sub_24A362C0C();
  sub_24A362C18();
  MEMORY[0x24BD0DB70](MEMORY[0x24BEE4AF8]);
  v0 = sub_24A362714();
  OUTLINED_FUNCTION_0_34(v0, v1, v2, v3, v4, v5, v6, v7, v9, v8, v10, v11);
}

double LinearGradient.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  double result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v0 = sub_24A362714();
  *(_QWORD *)&result = OUTLINED_FUNCTION_0_34(v0, v1, v2, v3, v4, v5, v6, v7, v10, v8, v11, v12).n128_u64[0];
  return result;
}

__n128 OUTLINED_FUNCTION_0_34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 a10, __int128 a11, uint64_t a12)
{
  uint64_t v12;
  __n128 result;

  result = a10;
  *(__n128 *)v12 = a10;
  *(_OWORD *)(v12 + 16) = a11;
  *(_QWORD *)(v12 + 32) = a12;
  return result;
}

void static DetailChartCondition.read(from:)(_BYTE *a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;
  uint64_t v4;
  unsigned __int8 v5;

  OUTLINED_FUNCTION_2_36();
  if (!v1)
  {
    v3 = v5 - 1;
    if (v3 >= 9)
    {
      OUTLINED_FUNCTION_6_28();
      OUTLINED_FUNCTION_4_36();
      OUTLINED_FUNCTION_0_35();
      OUTLINED_FUNCTION_1_41(v4, *MEMORY[0x24BEB43B8]);
      OUTLINED_FUNCTION_5_35();
    }
    else
    {
      *a1 = v3;
    }
  }
  OUTLINED_FUNCTION_3_39();
}

unint64_t sub_24A35D5C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257925448;
  if (!qword_257925448)
  {
    v1 = sub_24A3623F0();
    result = MEMORY[0x24BD0E6E0](MEMORY[0x24BEB43C8], v1);
    atomic_store(result, (unint64_t *)&qword_257925448);
  }
  return result;
}

void DetailChartCondition.write(to:)()
{
  __asm { BR              X10 }
}

uint64_t sub_24A35D634()
{
  return sub_24A36242C();
}

uint64_t static DetailCondition.read(from:)@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char v4;
  uint64_t v5;
  char v6;
  char v7;

  result = OUTLINED_FUNCTION_2_36();
  if (!v1)
  {
    v4 = 2;
    switch(v7)
    {
      case 1:
        goto LABEL_6;
      case 2:
        v4 = 3;
        goto LABEL_6;
      case 3:
        v4 = 4;
        goto LABEL_6;
      case 4:
        result = sub_24A362420();
        if (v6 == 2)
        {
          v4 = 1;
          goto LABEL_6;
        }
        if (v6 == 1)
        {
          v4 = 0;
LABEL_6:
          *a1 = v4;
          return result;
        }
LABEL_11:
        OUTLINED_FUNCTION_6_28();
        OUTLINED_FUNCTION_4_36();
        OUTLINED_FUNCTION_0_35();
        OUTLINED_FUNCTION_1_41(v5, *MEMORY[0x24BEB43B8]);
        result = OUTLINED_FUNCTION_5_35();
        break;
      case 5:
      case 6:
      case 7:
        v4 = v7;
        goto LABEL_6;
      default:
        goto LABEL_11;
    }
  }
  return result;
}

uint64_t DetailCondition.write(to:)()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t result;

  switch(*v0)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      return sub_24A36242C();
    default:
      result = sub_24A36242C();
      if (!v1)
        return sub_24A36242C();
      return result;
  }
}

void static TemperatureChartKind.read(from:)(char *a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_2_36();
  if (!v1)
  {
    if (v5 == 1)
    {
      v3 = 0;
    }
    else
    {
      if (v5 != 2)
      {
        OUTLINED_FUNCTION_6_28();
        OUTLINED_FUNCTION_4_36();
        OUTLINED_FUNCTION_0_35();
        OUTLINED_FUNCTION_1_41(v4, *MEMORY[0x24BEB43B8]);
        OUTLINED_FUNCTION_5_35();
        goto LABEL_8;
      }
      v3 = 1;
    }
    *a1 = v3;
  }
LABEL_8:
  OUTLINED_FUNCTION_3_39();
}

uint64_t TemperatureChartKind.write(to:)()
{
  return sub_24A36242C();
}

uint64_t OUTLINED_FUNCTION_0_35()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_1_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_36()
{
  return sub_24A362420();
}

unint64_t OUTLINED_FUNCTION_4_36()
{
  return sub_24A35D5C8();
}

uint64_t OUTLINED_FUNCTION_5_35()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_6_28()
{
  return sub_24A3623F0();
}

uint64_t PresentativePastHourRange.dominantPrecipitation.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t result;
  uint64_t v11;

  v3 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PresentativePastHourRange(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A317234(v1, (uint64_t)v8);
  sub_24A35D230((uint64_t)v8, (uint64_t)v5);
  v9 = v5[*(int *)(v3 + 24)];
  result = sub_24A2C7330((uint64_t)v5, type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext);
  *a1 = v9;
  return result;
}

uint64_t type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1)
{
  return sub_24A2AE36C(a1, (uint64_t *)&unk_2544CF138);
}

uint64_t type metadata accessor for PresentativePastHourRange(uint64_t a1)
{
  return sub_24A2AE36C(a1, (uint64_t *)&unk_2544CF148);
}

_QWORD *initializeBufferWithCopyOfBuffer for PresentativePastHourRange(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  void (*v7)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
    v7 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
    v7(a1, a2, v6);
    v8 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
    v7((_QWORD *)((char *)a1 + *(int *)(v8 + 20)), (_QWORD *)((char *)a2 + *(int *)(v8 + 20)), v6);
    *((_BYTE *)a1 + *(int *)(v8 + 24)) = *((_BYTE *)a2 + *(int *)(v8 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PresentativePastHourRange(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
    v5(a1, v3);
    v4 = a1 + *(int *)(type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0) + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v5)(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for PresentativePastHourRange(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  swift_getEnumCaseMultiPayload();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  *(_BYTE *)(a1 + *(int *)(v6 + 24)) = *(_BYTE *)(a2 + *(int *)(v6 + 24));
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PresentativePastHourRange(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (a1 != a2)
  {
    sub_24A2C7330(a1, type metadata accessor for PresentativePastHourRange);
    swift_getEnumCaseMultiPayload();
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    v6 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    *(_BYTE *)(a1 + *(int *)(v6 + 24)) = *(_BYTE *)(a2 + *(int *)(v6 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for PresentativePastHourRange(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  swift_getEnumCaseMultiPayload();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  *(_BYTE *)(a1 + *(int *)(v6 + 24)) = *(_BYTE *)(a2 + *(int *)(v6 + 24));
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for PresentativePastHourRange(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  if (a1 != a2)
  {
    sub_24A2C7330(a1, type metadata accessor for PresentativePastHourRange);
    swift_getEnumCaseMultiPayload();
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    v6 = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(0);
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    *(_BYTE *)(a1 + *(int *)(v6 + 24)) = *(_BYTE *)(a2 + *(int *)(v6 + 24));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24A35E1A0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PresentativePastHourRange.PresentativePastHourRangeContext(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for PresentativePastHourRange.PresentativePastHourRangeContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((_QWORD *)((char *)a1 + *(int *)(a3 + 20)), (_QWORD *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for PresentativePastHourRange.PresentativePastHourRangeContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for PresentativePastHourRange.PresentativePastHourRangeContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A35E52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v8 >= 6)
    return v8 - 5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PresentativePastHourRange.PresentativePastHourRangeContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24A35E5B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 5;
  return result;
}

void sub_24A35E628()
{
  unint64_t v0;

  sub_24A2B151C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void WeatherCondition.dominantPrecipitation.getter(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v6;
  BOOL v8;
  uint64_t v10;

  sub_24A3620F0();
  OUTLINED_FUNCTION_7_30();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_36(v3, v10);
  v4 = OUTLINED_FUNCTION_5_36();
  if (v4 == *MEMORY[0x24BDFA5A0] || v4 == *MEMORY[0x24BDFA4C8])
    goto LABEL_7;
  if (v4 == *MEMORY[0x24BDFA598])
    goto LABEL_19;
  if (v4 == *MEMORY[0x24BDFA5A8])
  {
LABEL_7:
    v6 = 2;
    goto LABEL_20;
  }
  if (v4 == *MEMORY[0x24BDFA518] || v4 == *MEMORY[0x24BDFA4E8])
    goto LABEL_19;
  if (v4 == *MEMORY[0x24BDFA538])
  {
    v6 = 5;
    goto LABEL_20;
  }
  if (v4 == *MEMORY[0x24BDFA5B0])
    goto LABEL_19;
  if (v4 == *MEMORY[0x24BDFA5B8])
    goto LABEL_7;
  if (v4 == *MEMORY[0x24BDFA5C0] || v4 == *MEMORY[0x24BDFA548] || v4 == *MEMORY[0x24BDFA528])
    goto LABEL_19;
  if (v4 == *MEMORY[0x24BDFA568])
  {
    v6 = 4;
    goto LABEL_20;
  }
  if (v4 == *MEMORY[0x24BDFA550])
    goto LABEL_7;
  if (v4 == *MEMORY[0x24BDFA500])
    goto LABEL_19;
  if (v4 == *MEMORY[0x24BDFA4E0])
    goto LABEL_7;
  v8 = v4 == *MEMORY[0x24BDFA4B8] || v4 == *MEMORY[0x24BDFA508];
  if (v8 || v4 == *MEMORY[0x24BDFA510])
  {
LABEL_19:
    v6 = 3;
    goto LABEL_20;
  }
  if (v4 != *MEMORY[0x24BDFA5C8])
  {
    OUTLINED_FUNCTION_3_40(6);
    goto LABEL_21;
  }
  v6 = 1;
LABEL_20:
  *a1 = v6;
LABEL_21:
  OUTLINED_FUNCTION_15_1();
}

BOOL static DominantPrecipitation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void DominantPrecipitation.title.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_24A35E8D4()
{
  if (qword_2544CF228 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_13_1();
  return sub_24A361A84();
}

uint64_t DominantPrecipitation.hash(into:)()
{
  return sub_24A363380();
}

void DominantPrecipitation.hashValue.getter()
{
  sub_24A363374();
  OUTLINED_FUNCTION_7_21();
  sub_24A3633A4();
  OUTLINED_FUNCTION_9_9();
}

uint64_t Measurement<>.formattedWithoutScaling(precipitationType:)(_BYTE *a1)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_24A362D2C();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3();
  v28 = v4 - v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF070);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3();
  v8 = v7 - v6;
  v9 = sub_24A362D20();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  v13 = v12 - v11;
  v14 = sub_24A3630EC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  v18 = v17 - v16;
  v19 = sub_24A3630E0();
  v27 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3();
  v22 = v21 - v20;
  if (*a1 == 2)
    v23 = (unsigned int *)MEMORY[0x24BEC2688];
  else
    v23 = (unsigned int *)MEMORY[0x24BEC2680];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v18, *v23, v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x24BEC24F8], v9);
  v24 = sub_24A361CE8();
  __swift_storeEnumTagSinglePayload(v8, 1, 1, v24);
  sub_24A362FFC();
  sub_24A362CCC();
  swift_bridgeObjectRelease();
  sub_24A35EDC8(v8);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v29 + 104))(v28, *MEMORY[0x24BEC2510], v30);
  sub_24A362384();
  sub_24A362360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  sub_24A302924();
  v25 = sub_24A361970();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v22, v19);
  return v25;
}

uint64_t sub_24A35EDC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF070);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void Precipitation.dominantPrecipitation.getter(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;

  sub_24A36212C();
  OUTLINED_FUNCTION_7_30();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_36(v3, v6);
  v4 = OUTLINED_FUNCTION_5_36();
  if (v4 == *MEMORY[0x24BDFA658])
  {
    *a1 = 0;
  }
  else
  {
    if (v4 == *MEMORY[0x24BDFA670])
    {
      v5 = 1;
    }
    else if (v4 == *MEMORY[0x24BDFA660])
    {
      v5 = 3;
    }
    else if (v4 == *MEMORY[0x24BDFA678])
    {
      v5 = 4;
    }
    else
    {
      if (v4 != *MEMORY[0x24BDFA668])
      {
        OUTLINED_FUNCTION_3_40(5);
        goto LABEL_12;
      }
      v5 = 2;
    }
    *a1 = v5;
  }
LABEL_12:
  OUTLINED_FUNCTION_15_1();
}

unint64_t sub_24A35EEEC()
{
  unint64_t result;

  result = qword_2544CF110;
  if (!qword_2544CF110)
  {
    result = MEMORY[0x24BD0E6E0](&protocol conformance descriptor for DominantPrecipitation, &type metadata for DominantPrecipitation);
    atomic_store(result, (unint64_t *)&qword_2544CF110);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DominantPrecipitation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_24A35EF74 + 4 * byte_24A368C8B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24A35EFA8 + 4 * byte_24A368C86[v4]))();
}

uint64_t sub_24A35EFA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A35EFB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A35EFB8);
  return result;
}

uint64_t sub_24A35EFC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A35EFCCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24A35EFD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A35EFD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DominantPrecipitation()
{
  return &type metadata for DominantPrecipitation;
}

uint64_t OUTLINED_FUNCTION_0_36@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3, v2);
}

uint64_t OUTLINED_FUNCTION_3_40@<X0>(char a1@<W8>)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *v1 = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
}

uint64_t OUTLINED_FUNCTION_5_36()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v0);
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeSummaryString(currentWeather:extrema:date:calendar:timeZone:units:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeTodayString(from:extrema:units:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeFutureDayString(for:extrema:timeZone:units:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeYesterdayString(extrema:units:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of VisibilityPlatterStringBuilderType.makeVisibilityWithUnitString(visibility:units:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

ValueMetadata *type metadata accessor for VisibilityPlatterStringBuilder()
{
  return &type metadata for VisibilityPlatterStringBuilder;
}

void sub_24A35F08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v10;
  _BYTE v12[48];

  if ((sub_24A361D0C() & 1) != 0)
  {
    OUTLINED_FUNCTION_44_6();
    sub_24A35F150(v10, a2, v12);
  }
  else if ((sub_24A361D24() & 1) != 0)
  {
    OUTLINED_FUNCTION_44_6();
    sub_24A35F550(a2, v12);
  }
  else
  {
    OUTLINED_FUNCTION_44_6();
    sub_24A35F958(a3, a2, a5, (uint64_t)v12, a7);
  }
}

void sub_24A35F150(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  unint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_13_25(v10, v24);
  v11 = OUTLINED_FUNCTION_46_2();
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v17 = a3;
  OUTLINED_FUNCTION_37_8();
  if (v25 >> 3 != 0xFFFFFFFF)
  {
    OUTLINED_FUNCTION_65_2();
    __asm { BR              X10 }
  }
  if (qword_257922C90 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_28_6(v18, (uint64_t)&unk_257924628);
  v19 = OUTLINED_FUNCTION_30_7();
  if (OUTLINED_FUNCTION_9_3(v19))
  {
    v20 = (_WORD *)OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_56_1(v20);
    OUTLINED_FUNCTION_2_21(&dword_24A2A1000, v21, v22, "Failed to create Visibility summary (today) due to missing extrema values");
    OUTLINED_FUNCTION_12_3();
  }

  OUTLINED_FUNCTION_67();
}

void sub_24A35F550(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  os_log_type_t v18;
  _WORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_13_25(v9, v23);
  v10 = OUTLINED_FUNCTION_46_2();
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = a2;
  OUTLINED_FUNCTION_37_8();
  if (v24 >> 3 != 0xFFFFFFFF)
  {
    OUTLINED_FUNCTION_65_2();
    __asm { BR              X10 }
  }
  if (qword_257922C90 != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_28_6(v17, (uint64_t)&unk_257924628);
  v18 = OUTLINED_FUNCTION_30_7();
  if (OUTLINED_FUNCTION_9_3(v18))
  {
    v19 = (_WORD *)OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_56_1(v19);
    OUTLINED_FUNCTION_2_21(&dword_24A2A1000, v20, v21, "Failed to create Visibility summary (yesterday) due to missing extrema values");
    OUTLINED_FUNCTION_12_3();
  }

  OUTLINED_FUNCTION_67();
}

void sub_24A35F958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  _WORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  unint64_t v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41_0();
  v10 = *(void **)a4;
  v11 = *(void **)(a4 + 8);
  v12 = *(void **)(a4 + 16);
  v13 = *(void **)(a4 + 24);
  v14 = *(void **)(a4 + 32);
  v15 = *(void **)(a4 + 40);
  sub_24A2A427C(a2, v5);
  v29[0] = v10;
  v29[1] = v11;
  v29[2] = v12;
  v29[3] = v13;
  v29[4] = v14;
  v29[5] = v15;
  v16 = a5;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v22 = v15;
  sub_24A360724(v5, (uint64_t)v29, v16, &v30);
  v23 = v30;
  if (v30 >> 3 != 0xFFFFFFFF)
  {
    sub_24A361C64();
    __asm { BR              X10 }
  }
  if (qword_257922C90 != -1)
    swift_once();
  v24 = OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_28_6(v24, (uint64_t)&unk_257924628);
  v25 = OUTLINED_FUNCTION_30_7();
  if (OUTLINED_FUNCTION_9_3(v25))
  {
    v26 = (_WORD *)OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_56_1(v26);
    OUTLINED_FUNCTION_2_21(&dword_24A2A1000, v27, v28, "Failed to create Visibility summary (future) due to missing extrema values");
    OUTLINED_FUNCTION_12_3();
  }

  OUTLINED_FUNCTION_67();
}

void sub_24A360724(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  os_log_type_t v40;
  _WORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  uint64_t v46;
  id v47;
  id v48;
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
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  double v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  char v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  char *v101;
  char *v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t);
  int v109;
  uint64_t v110;
  void (*v111)(uint64_t);
  int v112;
  void (*v113)(uint64_t);
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
  unint64_t *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  unsigned __int8 v136;
  unsigned __int8 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;

  v134 = a3;
  v127 = a4;
  v133 = sub_24A362D2C();
  v117 = *(_QWORD *)(v133 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_50();
  v123 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF070);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_50();
  v120 = v10;
  v130 = sub_24A362D20();
  v115 = *(_QWORD *)(v130 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_50();
  v119 = v12;
  v129 = sub_24A3630EC();
  v114 = *(_QWORD *)(v129 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_50();
  v118 = v14;
  v122 = sub_24A3630E0();
  v116 = *(_QWORD *)(v122 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_50();
  v121 = v16;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v105 = *(_QWORD *)(v131 - 8);
  OUTLINED_FUNCTION_4();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v135 = (uint64_t)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v132 = (uint64_t)&v96 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v96 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v96 - v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257922CC8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_41_0();
  v124 = *(_QWORD *)(sub_24A362498() - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_50();
  v125 = v29;
  v126 = a1;
  v30 = *(void **)(a2 + 8);
  v128 = *(id *)a2;
  v32 = *(void **)(a2 + 16);
  v31 = *(void **)(a2 + 24);
  v34 = *(void **)(a2 + 32);
  v33 = *(void **)(a2 + 40);
  v35 = a1;
  v37 = v36;
  sub_24A2A427C(v35, v4);
  if (__swift_getEnumTagSinglePayload(v4, 1, (uint64_t)v37) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, void *))(v124 + 32))(v125, v4, v37);
    v46 = sub_24A362480();
    OUTLINED_FUNCTION_28_1(v46, (unint64_t *)&qword_2544CF220);
    v47 = v33;
    OUTLINED_FUNCTION_63_1();
    sub_24A36248C();
    v48 = v47;
    OUTLINED_FUNCTION_63_1();

    v101 = v26;
    static VisibilityCondition.condition(for:)((char *)&v137);
    v103 = v137;
    v102 = v24;
    static VisibilityCondition.condition(for:)((char *)&v136);
    v97 = v136;
    sub_24A362DB0();
    sub_24A362DB0();
    LODWORD(v128) = *MEMORY[0x24BEC2678];
    v49 = v114;
    v113 = *(void (**)(uint64_t))(v114 + 104);
    v50 = v118;
    v51 = v129;
    v113(v118);
    v112 = *MEMORY[0x24BEC24F8];
    v52 = v115;
    v111 = *(void (**)(uint64_t))(v115 + 104);
    v53 = v119;
    v54 = v130;
    v111(v119);
    v110 = sub_24A361CE8();
    v55 = v120;
    __swift_storeEnumTagSinglePayload(v120, 1, 1, v110);
    sub_24A362FFC();
    v56 = v121;
    OUTLINED_FUNCTION_20_20();
    OUTLINED_FUNCTION_9();
    sub_24A2AC1CC(v55, &qword_2544CF070);
    v115 = *(_QWORD *)(v52 + 8);
    ((void (*)(uint64_t, uint64_t))v115)(v53, v54);
    v114 = *(_QWORD *)(v49 + 8);
    ((void (*)(uint64_t, uint64_t))v114)(v50, v51);
    v109 = *MEMORY[0x24BEC2510];
    v57 = v117;
    v108 = *(void (**)(uint64_t))(v117 + 104);
    v58 = v123;
    v59 = v133;
    v108(v123);
    v107 = sub_24A362384();
    sub_24A362360();
    v106 = sub_24A302924();
    v104 = v37;
    v60 = v122;
    v99 = sub_24A361970();
    OUTLINED_FUNCTION_55_4(v61, (uint64_t)&v130);
    v100 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v100(v58, v59);
    v117 = *(_QWORD *)(v116 + 8);
    ((void (*)(uint64_t, uint64_t))v117)(v56, v60);
    sub_24A363014();
    OUTLINED_FUNCTION_70((uint64_t)&v140);
    OUTLINED_FUNCTION_70((uint64_t)&v139);
    OUTLINED_FUNCTION_33_11();
    OUTLINED_FUNCTION_20_20();
    OUTLINED_FUNCTION_9();
    sub_24A2AC1CC(v55, &qword_2544CF070);
    OUTLINED_FUNCTION_70((uint64_t)&v142);
    OUTLINED_FUNCTION_70((uint64_t)&v141);
    v62 = v133;
    OUTLINED_FUNCTION_70((uint64_t)&v138);
    OUTLINED_FUNCTION_62_2();
    v96 = OUTLINED_FUNCTION_40_7();
    OUTLINED_FUNCTION_55_4(v63, (uint64_t)&v143);
    v64 = v100;
    v100(v58, v62);
    OUTLINED_FUNCTION_70((uint64_t)&v144);
    OUTLINED_FUNCTION_70((uint64_t)&v140);
    OUTLINED_FUNCTION_70((uint64_t)&v139);
    OUTLINED_FUNCTION_33_11();
    sub_24A362FFC();
    OUTLINED_FUNCTION_20_20();
    OUTLINED_FUNCTION_9();
    sub_24A2AC1CC(v55, &qword_2544CF070);
    OUTLINED_FUNCTION_70((uint64_t)&v142);
    OUTLINED_FUNCTION_70((uint64_t)&v141);
    v65 = v133;
    OUTLINED_FUNCTION_70((uint64_t)&v138);
    OUTLINED_FUNCTION_62_2();
    v130 = OUTLINED_FUNCTION_40_7();
    v66 = v104;
    v68 = v67;
    swift_release();
    v64(v58, v65);
    OUTLINED_FUNCTION_70((uint64_t)&v144);
    v69 = (uint64_t)v101;
    sub_24A361940();
    v71 = v70;
    v72 = (uint64_t)v102;
    v73 = OUTLINED_FUNCTION_64_2();
    v74 = v134;
    if (v71 == v75)
    {

      swift_bridgeObjectRelease();
      v76 = OUTLINED_FUNCTION_53_4();
      OUTLINED_FUNCTION_38_4(v76, &qword_257922CC8);
      OUTLINED_FUNCTION_11_4(v135);
      OUTLINED_FUNCTION_11_4(v132);
      OUTLINED_FUNCTION_11_4(v72);
      OUTLINED_FUNCTION_11_4(v69);
      (*(void (**)(uint64_t, void *))(v124 + 8))(v125, v66);
      v77 = v103;
      v78 = v99;
      v79 = v98;
      v80 = 0;
      v81 = 0;
LABEL_9:
      v82 = 0;
      v83 = v127;
LABEL_18:
      *v83 = v77;
      v83[1] = v78;
      v83[2] = v79;
      v83[3] = v80;
      v83[4] = v81;
      v83[5] = v82;
      return;
    }
    v133 = v68;
    v84 = v135;
    v85 = v132;
    v86 = v97;
    if ((_DWORD)v103 == (_DWORD)v97)
    {
      OUTLINED_FUNCTION_28_1(v73, (unint64_t *)&qword_257923128);
      v87 = (void *)sub_24A361928();
      v88 = (void *)sub_24A361928();
      v89 = sub_24A3631D0();

      v79 = v116;
      if ((v89 & 1) != 0)
      {
        OUTLINED_FUNCTION_64_2();
        OUTLINED_FUNCTION_49_5();
        if (v71 != v90)
        {

          v95 = swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_38_4(v95, &qword_257922CC8);
          OUTLINED_FUNCTION_11_4(v84);
          OUTLINED_FUNCTION_11_4(v85);
          OUTLINED_FUNCTION_11_4((uint64_t)v102);
          OUTLINED_FUNCTION_11_4((uint64_t)v101);
          OUTLINED_FUNCTION_19_22();
          OUTLINED_FUNCTION_61_3();
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_64_2();
      OUTLINED_FUNCTION_49_5();
      v92 = v91;

      OUTLINED_FUNCTION_38_4(v93, &qword_257922CC8);
      OUTLINED_FUNCTION_7_16(v84);
      OUTLINED_FUNCTION_7_16(v85);
      OUTLINED_FUNCTION_7_16((uint64_t)v102);
      OUTLINED_FUNCTION_7_16((uint64_t)v101);
      OUTLINED_FUNCTION_19_22();
      v80 = v103;
      if (v71 != v92)
      {
        OUTLINED_FUNCTION_61_3();
        v82 = 0;
        v83 = v127;
LABEL_17:
        v79 = v133;
        v78 = v130;
        goto LABEL_18;
      }
    }
    else
    {

      v94 = OUTLINED_FUNCTION_53_4();
      OUTLINED_FUNCTION_38_4(v94, &qword_257922CC8);
      OUTLINED_FUNCTION_7_16(v84);
      OUTLINED_FUNCTION_7_16(v85);
      OUTLINED_FUNCTION_7_16(v72);
      OUTLINED_FUNCTION_7_16(v69);
      OUTLINED_FUNCTION_19_22();
      v80 = v103;
    }
    v77 = v86 | 0xC000000000000000;
    v83 = v127;
    v81 = v99;
    v82 = v98;
    goto LABEL_17;
  }
  v38 = v134;

  sub_24A2AC1CC(v4, &qword_257922CC8);
  if (qword_257922C90 != -1)
    swift_once();
  v39 = OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_28_6(v39, (uint64_t)&unk_257924628);
  v40 = OUTLINED_FUNCTION_30_7();
  if (OUTLINED_FUNCTION_9_3(v40))
  {
    v41 = (_WORD *)OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_56_1(v41);
    OUTLINED_FUNCTION_2_21(&dword_24A2A1000, v42, v43, "Failed to determine the sentence kind for Visibility due to missing extrema values");
    OUTLINED_FUNCTION_12_3();
  }

  OUTLINED_FUNCTION_38_4(v44, &qword_257922CC8);
  v45 = v127;
  *v127 = 0x7FFFFFFF8;
  *(_OWORD *)(v45 + 1) = 0u;
  *(_OWORD *)(v45 + 3) = 0u;
  v45[5] = 0;
}

uint64_t sub_24A3611C8(uint64_t a1, uint64_t a2)
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
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v45 = a2;
  v3 = sub_24A362D2C();
  v51 = *(_QWORD *)(v3 - 8);
  v52 = v3;
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_50();
  v50 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF070);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3();
  v9 = v8 - v7;
  v43 = sub_24A362D20();
  v10 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_3();
  v13 = v12 - v11;
  v14 = sub_24A3630EC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  v18 = v17 - v16;
  v47 = sub_24A3630E0();
  v49 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_50();
  v41 = v20;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CF048);
  v48 = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_4();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v42 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v44 = (char *)&v41 - v25;
  v26 = *(void **)(a1 + 40);
  OUTLINED_FUNCTION_28_1(v24, (unint64_t *)&qword_2544CF220);
  v27 = v26;
  sub_24A361934();
  sub_24A362DB0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v18, *MEMORY[0x24BEC2678], v14);
  v28 = v43;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x24BEC24F0], v43);
  v29 = sub_24A361CE8();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v29);
  sub_24A362FFC();
  v30 = v41;
  sub_24A362CCC();
  OUTLINED_FUNCTION_9();
  sub_24A2AC1CC(v9, &qword_2544CF070);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v28);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  v32 = v50;
  v31 = v51;
  v33 = v52;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v51 + 104))(v50, *MEMORY[0x24BEC2510], v52);
  sub_24A362384();
  sub_24A362360();
  sub_24A302924();
  v34 = v30;
  v35 = v46;
  v36 = v47;
  v37 = v42;
  v38 = sub_24A361970();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v34, v36);
  v39 = *(void (**)(char *, uint64_t))(v48 + 8);
  v39(v37, v35);
  v39(v44, v35);
  return v38;
}

void sub_24A361520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void **v6;

  sub_24A35F08C(a1, a2, a3, a4, a5, a6, *v6);
}

void sub_24A361528(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24A35F150(a1, a2, a3);
}

void sub_24A361530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void **v4;

  sub_24A35F958(a1, a2, a3, a4, *v4);
}

void sub_24A361538(uint64_t a1, void *a2)
{
  sub_24A35F550(a1, a2);
}

uint64_t sub_24A361540(uint64_t a1)
{
  uint64_t *v1;

  return sub_24A3611C8(a1, *v1);
}

unint64_t sub_24A361548(unint64_t a1)
{
  if (a1 >> 3 != 0xFFFFFFFF)
    return sub_24A36155C(a1);
  return a1;
}

uint64_t sub_24A36155C(unint64_t a1)
{
  if ((a1 >> 62) - 1 < 2 || a1 >> 62)
    swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A3615A0(unint64_t a1)
{
  if ((a1 >> 62) - 1 < 2 || a1 >> 62)
    swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_37()
{
  unint64_t v0;

  return sub_24A3615A0(v0);
}

uint64_t OUTLINED_FUNCTION_3_41()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_37()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_7_31(__n128 *a1, __n128 a2)
{
  char v2;
  uint64_t v3;

  a1[1] = a2;
  *(_BYTE *)(v3 - 128) = v2;
  VisibilityCondition.shortDescription.getter();
}

void OUTLINED_FUNCTION_11_24()
{
  VisibilityCondition.shortDescription.getter();
}

uint64_t OUTLINED_FUNCTION_12_27(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v7[4] = v1;
  v7[5] = v6;
  v7[12] = v3;
  v7[13] = a1;
  v7[8] = a1;
  v7[9] = v5;
  v7[10] = v4;
  v7[17] = v3;
  v7[18] = a1;
  v7[14] = *(_QWORD *)(v8 - 192);
  v7[15] = v2;
  return sub_24A362EA0();
}

uint64_t OUTLINED_FUNCTION_13_25@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  return sub_24A2A427C(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t OUTLINED_FUNCTION_18_25(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[17] = v5;
  v2[18] = v4;
  v2[14] = a1;
  v2[15] = a2;
  v2[22] = v5;
  v2[23] = v4;
  v7 = *(_QWORD *)(v6 - 184);
  v2[19] = v3;
  v2[20] = v7;
  return sub_24A362EA0();
}

uint64_t OUTLINED_FUNCTION_19_22()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 208) + 8))(*(_QWORD *)(v0 - 200), *(_QWORD *)(v0 - 368));
}

uint64_t OUTLINED_FUNCTION_20_20()
{
  return sub_24A362CCC();
}

uint64_t OUTLINED_FUNCTION_21_17()
{
  return sub_24A362EA0();
}

uint64_t OUTLINED_FUNCTION_24_15()
{
  unint64_t v0;

  return sub_24A3615A0(v0);
}

uint64_t OUTLINED_FUNCTION_25_17()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_30_12()
{
  return 0xD00000000000002CLL;
}

unint64_t OUTLINED_FUNCTION_32_11()
{
  return 0xD000000000000054;
}

uint64_t OUTLINED_FUNCTION_33_11()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, *(_QWORD *)(v1 - 320));
}

uint64_t OUTLINED_FUNCTION_34_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_36_9()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_37_8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  sub_24A360724(v1, v2 - 176, v0, (unint64_t *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_38_4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_24A2AC1CC(*(_QWORD *)(v2 - 192), a2);
}

unint64_t OUTLINED_FUNCTION_39_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return sub_24A2A4D94();
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_24A361970();
}

unint64_t OUTLINED_FUNCTION_42_7()
{
  return 0xD000000000000034;
}

unint64_t OUTLINED_FUNCTION_43_7()
{
  return 0xD000000000000034;
}

id OUTLINED_FUNCTION_46_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 - 176) = v2;
  *(_QWORD *)(v7 - 168) = v3;
  *(_QWORD *)(v7 - 160) = v4;
  *(_QWORD *)(v7 - 152) = v5;
  *(_QWORD *)(v7 - 144) = v6;
  *(_QWORD *)(v7 - 136) = v1;
  return v0;
}

uint64_t OUTLINED_FUNCTION_49_5()
{
  return sub_24A361940();
}

uint64_t OUTLINED_FUNCTION_53_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55_4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = a1;
  return swift_release();
}

unint64_t OUTLINED_FUNCTION_57_3()
{
  return 0xD000000000000056;
}

unint64_t OUTLINED_FUNCTION_58_3()
{
  return 0xD00000000000002ELL;
}

uint64_t OUTLINED_FUNCTION_59_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_60_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return sub_24A362360();
}

uint64_t OUTLINED_FUNCTION_63_1()
{
  return sub_24A361934();
}

uint64_t OUTLINED_FUNCTION_64_2()
{
  return sub_24A361940();
}

uint64_t sub_24A3618F8()
{
  return MEMORY[0x24BEC1F08]();
}

uint64_t sub_24A361904()
{
  return MEMORY[0x24BEC1F10]();
}

uint64_t sub_24A361910()
{
  return MEMORY[0x24BDCB438]();
}

uint64_t sub_24A36191C()
{
  return MEMORY[0x24BDCB458]();
}

uint64_t sub_24A361928()
{
  return MEMORY[0x24BDCB470]();
}

uint64_t sub_24A361934()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_24A361940()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t sub_24A36194C()
{
  return MEMORY[0x24BEC2310]();
}

uint64_t sub_24A361958()
{
  return MEMORY[0x24BEC2318]();
}

uint64_t sub_24A361964()
{
  return MEMORY[0x24BEC2320]();
}

uint64_t sub_24A361970()
{
  return MEMORY[0x24BEC2328]();
}

uint64_t sub_24A36197C()
{
  return MEMORY[0x24BEC2330]();
}

uint64_t sub_24A361988()
{
  return MEMORY[0x24BEC2338]();
}

uint64_t sub_24A361994()
{
  return MEMORY[0x24BEC2340]();
}

uint64_t sub_24A3619A0()
{
  return MEMORY[0x24BEC2348]();
}

uint64_t sub_24A3619AC()
{
  return MEMORY[0x24BEC2350]();
}

uint64_t sub_24A3619B8()
{
  return MEMORY[0x24BEC2358]();
}

uint64_t sub_24A3619C4()
{
  return MEMORY[0x24BDCB548]();
}

uint64_t sub_24A3619D0()
{
  return MEMORY[0x24BDCB568]();
}

uint64_t sub_24A3619DC()
{
  return MEMORY[0x24BDCB588]();
}

uint64_t sub_24A3619E8()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_24A3619F4()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_24A361A00()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_24A361A0C()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_24A361A18()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_24A361A24()
{
  return MEMORY[0x24BDEAD68]();
}

uint64_t sub_24A361A30()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_24A361A3C()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_24A361A48()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_24A361A54()
{
  return MEMORY[0x24BDCC3F8]();
}

uint64_t sub_24A361A60()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_24A361A6C()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_24A361A78()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_24A361A84()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_24A361A90()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_24A361A9C()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_24A361AA8()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_24A361AB4()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_24A361AC0()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_24A361ACC()
{
  return MEMORY[0x24BDCD438]();
}

uint64_t sub_24A361AD8()
{
  return MEMORY[0x24BDCD450]();
}

uint64_t sub_24A361AE4()
{
  return MEMORY[0x24BDCD650]();
}

uint64_t sub_24A361AF0()
{
  return MEMORY[0x24BDCD678]();
}

uint64_t sub_24A361AFC()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_24A361B08()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_24A361B14()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24A361B20()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24A361B2C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24A361B38()
{
  return MEMORY[0x24BEB42C8]();
}

uint64_t sub_24A361B44()
{
  return MEMORY[0x24BEB42D0]();
}

uint64_t sub_24A361B50()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_24A361B5C()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_24A361B68()
{
  return MEMORY[0x24BEC1F20]();
}

uint64_t sub_24A361B74()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_24A361B80()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_24A361B8C()
{
  return MEMORY[0x24BEC1F28]();
}

uint64_t sub_24A361B98()
{
  return MEMORY[0x24BEC1F30]();
}

uint64_t sub_24A361BA4()
{
  return MEMORY[0x24BEC1F38]();
}

uint64_t sub_24A361BB0()
{
  return MEMORY[0x24BEC1F40]();
}

uint64_t sub_24A361BBC()
{
  return MEMORY[0x24BEC1F48]();
}

uint64_t sub_24A361BC8()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_24A361BD4()
{
  return MEMORY[0x24BEC2038]();
}

uint64_t sub_24A361BE0()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24A361BEC()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_24A361BF8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_24A361C04()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_24A361C10()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_24A361C1C()
{
  return MEMORY[0x24BEC2360]();
}

uint64_t sub_24A361C28()
{
  return MEMORY[0x24BEC2368]();
}

uint64_t sub_24A361C34()
{
  return MEMORY[0x24BEC2370]();
}

uint64_t sub_24A361C40()
{
  return MEMORY[0x24BEC2378]();
}

uint64_t sub_24A361C4C()
{
  return MEMORY[0x24BEC2380]();
}

uint64_t sub_24A361C58()
{
  return MEMORY[0x24BEC2388]();
}

uint64_t sub_24A361C64()
{
  return MEMORY[0x24BEC2390]();
}

uint64_t sub_24A361C70()
{
  return MEMORY[0x24BEC2398]();
}

uint64_t sub_24A361C7C()
{
  return MEMORY[0x24BEC23A0]();
}

uint64_t sub_24A361C88()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_24A361C94()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24A361CA0()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_24A361CAC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_24A361CB8()
{
  return MEMORY[0x24BEC1F50]();
}

uint64_t sub_24A361CC4()
{
  return MEMORY[0x24BEC1F58]();
}

uint64_t sub_24A361CD0()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_24A361CDC()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_24A361CE8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24A361CF4()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_24A361D00()
{
  return MEMORY[0x24BEC2040]();
}

uint64_t sub_24A361D0C()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_24A361D18()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_24A361D24()
{
  return MEMORY[0x24BDCF0A0]();
}

uint64_t sub_24A361D30()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_24A361D3C()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_24A361D48()
{
  return MEMORY[0x24BDCF188]();
}

uint64_t sub_24A361D54()
{
  return MEMORY[0x24BDCF190]();
}

uint64_t sub_24A361D60()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_24A361D6C()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t sub_24A361D78()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_24A361D84()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_24A361D90()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24A361D9C()
{
  return MEMORY[0x24BDCF4A0]();
}

uint64_t sub_24A361DA8()
{
  return MEMORY[0x24BDCF4A8]();
}

uint64_t sub_24A361DB4()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_24A361DC0()
{
  return MEMORY[0x24BDCF4E8]();
}

uint64_t sub_24A361DCC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_24A361DD8()
{
  return MEMORY[0x24BEC23A8]();
}

uint64_t sub_24A361DE4()
{
  return MEMORY[0x24BEC23B0]();
}

uint64_t sub_24A361DF0()
{
  return MEMORY[0x24BDFA1D0]();
}

uint64_t sub_24A361DFC()
{
  return MEMORY[0x24BDFA1E0]();
}

uint64_t sub_24A361E08()
{
  return MEMORY[0x24BDFA1E8]();
}

uint64_t sub_24A361E14()
{
  return MEMORY[0x24BDFA1F0]();
}

uint64_t sub_24A361E20()
{
  return MEMORY[0x24BDFA1F8]();
}

uint64_t sub_24A361E2C()
{
  return MEMORY[0x24BDFA208]();
}

uint64_t sub_24A361E38()
{
  return MEMORY[0x24BDFA210]();
}

uint64_t sub_24A361E44()
{
  return MEMORY[0x24BDFA218]();
}

uint64_t sub_24A361E50()
{
  return MEMORY[0x24BDFA220]();
}

uint64_t sub_24A361E5C()
{
  return MEMORY[0x24BDFA238]();
}

uint64_t sub_24A361E68()
{
  return MEMORY[0x24BDFA240]();
}

uint64_t sub_24A361E74()
{
  return MEMORY[0x24BDFA268]();
}

uint64_t sub_24A361E80()
{
  return MEMORY[0x24BDFA270]();
}

uint64_t sub_24A361E8C()
{
  return MEMORY[0x24BDFA278]();
}

uint64_t sub_24A361E98()
{
  return MEMORY[0x24BDFA280]();
}

uint64_t sub_24A361EA4()
{
  return MEMORY[0x24BDFA288]();
}

uint64_t sub_24A361EB0()
{
  return MEMORY[0x24BDFA290]();
}

uint64_t sub_24A361EBC()
{
  return MEMORY[0x24BDFA298]();
}

uint64_t sub_24A361EC8()
{
  return MEMORY[0x24BDFA2A0]();
}

uint64_t sub_24A361ED4()
{
  return MEMORY[0x24BDFA2A8]();
}

uint64_t sub_24A361EE0()
{
  return MEMORY[0x24BDFA2B0]();
}

uint64_t sub_24A361EEC()
{
  return MEMORY[0x24BDFA2B8]();
}

uint64_t sub_24A361EF8()
{
  return MEMORY[0x24BDFA2C0]();
}

uint64_t sub_24A361F04()
{
  return MEMORY[0x24BDFA2C8]();
}

uint64_t sub_24A361F10()
{
  return MEMORY[0x24BDFA2D0]();
}

uint64_t sub_24A361F1C()
{
  return MEMORY[0x24BDFA2D8]();
}

uint64_t sub_24A361F28()
{
  return MEMORY[0x24BDFA2E0]();
}

uint64_t sub_24A361F34()
{
  return MEMORY[0x24BDFA2E8]();
}

uint64_t sub_24A361F40()
{
  return MEMORY[0x24BDFA2F0]();
}

uint64_t sub_24A361F4C()
{
  return MEMORY[0x24BDFA318]();
}

uint64_t sub_24A361F58()
{
  return MEMORY[0x24BDFA328]();
}

uint64_t sub_24A361F64()
{
  return MEMORY[0x24BDFA338]();
}

uint64_t sub_24A361F70()
{
  return MEMORY[0x24BDFA340]();
}

uint64_t sub_24A361F7C()
{
  return MEMORY[0x24BDFA348]();
}

uint64_t sub_24A361F88()
{
  return MEMORY[0x24BDFA350]();
}

uint64_t sub_24A361F94()
{
  return MEMORY[0x24BDFA360]();
}

uint64_t sub_24A361FA0()
{
  return MEMORY[0x24BDFA368]();
}

uint64_t sub_24A361FAC()
{
  return MEMORY[0x24BDFA370]();
}

uint64_t sub_24A361FB8()
{
  return MEMORY[0x24BDFA378]();
}

uint64_t sub_24A361FC4()
{
  return MEMORY[0x24BDFA380]();
}

uint64_t sub_24A361FD0()
{
  return MEMORY[0x24BDFA388]();
}

uint64_t sub_24A361FDC()
{
  return MEMORY[0x24BDFA390]();
}

uint64_t sub_24A361FE8()
{
  return MEMORY[0x24BDFA398]();
}

uint64_t sub_24A361FF4()
{
  return MEMORY[0x24BDFA3A0]();
}

uint64_t sub_24A362000()
{
  return MEMORY[0x24BDFA3A8]();
}

uint64_t sub_24A36200C()
{
  return MEMORY[0x24BDFA3B0]();
}

uint64_t sub_24A362018()
{
  return MEMORY[0x24BDFA3B8]();
}

uint64_t sub_24A362024()
{
  return MEMORY[0x24BDFA3C0]();
}

uint64_t sub_24A362030()
{
  return MEMORY[0x24BDFA3C8]();
}

uint64_t sub_24A36203C()
{
  return MEMORY[0x24BDFA3D8]();
}

uint64_t sub_24A362048()
{
  return MEMORY[0x24BDFA3E0]();
}

uint64_t sub_24A362054()
{
  return MEMORY[0x24BDFA3E8]();
}

uint64_t sub_24A362060()
{
  return MEMORY[0x24BEC23B8]();
}

uint64_t sub_24A36206C()
{
  return MEMORY[0x24BEC23C8]();
}

uint64_t sub_24A362078()
{
  return MEMORY[0x24BEC23D0]();
}

uint64_t sub_24A362084()
{
  return MEMORY[0x24BDFA3F8]();
}

uint64_t sub_24A362090()
{
  return MEMORY[0x24BDFA400]();
}

uint64_t sub_24A36209C()
{
  return MEMORY[0x24BDFA408]();
}

uint64_t sub_24A3620A8()
{
  return MEMORY[0x24BDFA410]();
}

uint64_t sub_24A3620B4()
{
  return MEMORY[0x24BDFA418]();
}

uint64_t sub_24A3620C0()
{
  return MEMORY[0x24BDFA420]();
}

uint64_t sub_24A3620CC()
{
  return MEMORY[0x24BEC23D8]();
}

uint64_t sub_24A3620D8()
{
  return MEMORY[0x24BEC23E0]();
}

uint64_t sub_24A3620E4()
{
  return MEMORY[0x24BDFA4D0]();
}

uint64_t sub_24A3620F0()
{
  return MEMORY[0x24BDFA5D0]();
}

uint64_t sub_24A3620FC()
{
  return MEMORY[0x24BDFA5F8]();
}

uint64_t sub_24A362108()
{
  return MEMORY[0x24BDFA600]();
}

uint64_t sub_24A362114()
{
  return MEMORY[0x24BDFA640]();
}

uint64_t sub_24A362120()
{
  return MEMORY[0x24BDFA648]();
}

uint64_t sub_24A36212C()
{
  return MEMORY[0x24BDFA680]();
}

uint64_t sub_24A362138()
{
  return MEMORY[0x24BDFA6A0]();
}

uint64_t sub_24A362144()
{
  return MEMORY[0x24BDFA6A8]();
}

uint64_t sub_24A362150()
{
  return MEMORY[0x24BDFA6C8]();
}

uint64_t sub_24A36215C()
{
  return MEMORY[0x24BDFA6F0]();
}

uint64_t sub_24A362168()
{
  return MEMORY[0x24BDFA6F8]();
}

uint64_t sub_24A362174()
{
  return MEMORY[0x24BDFA700]();
}

uint64_t sub_24A362180()
{
  return MEMORY[0x24BDFA708]();
}

uint64_t sub_24A36218C()
{
  return MEMORY[0x24BDFA720]();
}

uint64_t sub_24A362198()
{
  return MEMORY[0x24BDFA728]();
}

uint64_t sub_24A3621A4()
{
  return MEMORY[0x24BDFA760]();
}

uint64_t sub_24A3621B0()
{
  return MEMORY[0x24BDFA768]();
}

uint64_t sub_24A3621BC()
{
  return MEMORY[0x24BDFA770]();
}

uint64_t sub_24A3621C8()
{
  return MEMORY[0x24BDFA778]();
}

uint64_t sub_24A3621D4()
{
  return MEMORY[0x24BDFA780]();
}

uint64_t sub_24A3621E0()
{
  return MEMORY[0x24BDFA788]();
}

uint64_t sub_24A3621EC()
{
  return MEMORY[0x24BEC23E8]();
}

uint64_t sub_24A3621F8()
{
  return MEMORY[0x24BDFA798]();
}

uint64_t sub_24A362204()
{
  return MEMORY[0x24BDFA7A0]();
}

uint64_t sub_24A362210()
{
  return MEMORY[0x24BDFA7A8]();
}

uint64_t sub_24A36221C()
{
  return MEMORY[0x24BDFA7B0]();
}

uint64_t sub_24A362228()
{
  return MEMORY[0x24BDFA7C0]();
}

uint64_t sub_24A362234()
{
  return MEMORY[0x24BDFA7C8]();
}

uint64_t sub_24A362240()
{
  return MEMORY[0x24BDFA7D8]();
}

uint64_t sub_24A36224C()
{
  return MEMORY[0x24BDFA7E0]();
}

uint64_t sub_24A362258()
{
  return MEMORY[0x24BDFA7E8]();
}

uint64_t sub_24A362264()
{
  return MEMORY[0x24BDFA7F0]();
}

uint64_t sub_24A362270()
{
  return MEMORY[0x24BDFA7F8]();
}

uint64_t sub_24A36227C()
{
  return MEMORY[0x24BDFA800]();
}

uint64_t sub_24A362288()
{
  return MEMORY[0x24BDFA810]();
}

uint64_t sub_24A362294()
{
  return MEMORY[0x24BDFA818]();
}

uint64_t sub_24A3622A0()
{
  return MEMORY[0x24BDFA820]();
}

uint64_t sub_24A3622AC()
{
  return MEMORY[0x24BDFA828]();
}

uint64_t sub_24A3622B8()
{
  return MEMORY[0x24BDFA830]();
}

uint64_t sub_24A3622C4()
{
  return MEMORY[0x24BDFA838]();
}

uint64_t sub_24A3622D0()
{
  return MEMORY[0x24BDFA840]();
}

uint64_t sub_24A3622DC()
{
  return MEMORY[0x24BDFA850]();
}

uint64_t sub_24A3622E8()
{
  return MEMORY[0x24BDFA858]();
}

uint64_t sub_24A3622F4()
{
  return MEMORY[0x24BDFA860]();
}

uint64_t sub_24A362300()
{
  return MEMORY[0x24BDFA880]();
}

uint64_t sub_24A36230C()
{
  return MEMORY[0x24BDFA888]();
}

uint64_t sub_24A362318()
{
  return MEMORY[0x24BDFA898]();
}

uint64_t sub_24A362324()
{
  return MEMORY[0x24BEC1F60]();
}

uint64_t sub_24A362330()
{
  return MEMORY[0x24BEC1F68]();
}

uint64_t sub_24A36233C()
{
  return MEMORY[0x24BEC1F70]();
}

uint64_t sub_24A362348()
{
  return MEMORY[0x24BEC1F78]();
}

uint64_t sub_24A362354()
{
  return MEMORY[0x24BEC1F80]();
}

uint64_t sub_24A362360()
{
  return MEMORY[0x24BEC1F88]();
}

uint64_t sub_24A36236C()
{
  return MEMORY[0x24BEC1F90]();
}

uint64_t sub_24A362378()
{
  return MEMORY[0x24BEC1F98]();
}

uint64_t sub_24A362384()
{
  return MEMORY[0x24BEC1FA8]();
}

uint64_t sub_24A362390()
{
  return MEMORY[0x24BEC1FE8]();
}

uint64_t sub_24A36239C()
{
  return MEMORY[0x24BEC1FF0]();
}

uint64_t sub_24A3623A8()
{
  return MEMORY[0x24BEC1FF8]();
}

uint64_t sub_24A3623B4()
{
  return MEMORY[0x24BEC2000]();
}

uint64_t sub_24A3623C0()
{
  return MEMORY[0x24BEC2008]();
}

uint64_t sub_24A3623CC()
{
  return MEMORY[0x24BEC2010]();
}

uint64_t sub_24A3623D8()
{
  return MEMORY[0x24BEB43A8]();
}

uint64_t sub_24A3623E4()
{
  return MEMORY[0x24BEB43B0]();
}

uint64_t sub_24A3623F0()
{
  return MEMORY[0x24BEB43C0]();
}

uint64_t sub_24A3623FC()
{
  return MEMORY[0x24BEB4430]();
}

uint64_t sub_24A362408()
{
  return MEMORY[0x24BEB4560]();
}

uint64_t sub_24A362414()
{
  return MEMORY[0x24BEB4568]();
}

uint64_t sub_24A362420()
{
  return MEMORY[0x24BEB45B0]();
}

uint64_t sub_24A36242C()
{
  return MEMORY[0x24BEB45B8]();
}

uint64_t sub_24A362438()
{
  return MEMORY[0x24BEB4638]();
}

uint64_t sub_24A362444()
{
  return MEMORY[0x24BEB4648]();
}

uint64_t sub_24A362450()
{
  return MEMORY[0x24BEB4650]();
}

uint64_t sub_24A36245C()
{
  return MEMORY[0x24BEC2048]();
}

uint64_t sub_24A362468()
{
  return MEMORY[0x24BEC2068]();
}

uint64_t sub_24A362474()
{
  return MEMORY[0x24BEC2070]();
}

uint64_t sub_24A362480()
{
  return MEMORY[0x24BEC2078]();
}

uint64_t sub_24A36248C()
{
  return MEMORY[0x24BEC2080]();
}

uint64_t sub_24A362498()
{
  return MEMORY[0x24BEC2088]();
}

uint64_t sub_24A3624A4()
{
  return MEMORY[0x24BEC20C0]();
}

uint64_t sub_24A3624B0()
{
  return MEMORY[0x24BEC20C8]();
}

uint64_t sub_24A3624BC()
{
  return MEMORY[0x24BEC20D0]();
}

uint64_t sub_24A3624C8()
{
  return MEMORY[0x24BEC20F0]();
}

uint64_t sub_24A3624D4()
{
  return MEMORY[0x24BEC2108]();
}

uint64_t sub_24A3624E0()
{
  return MEMORY[0x24BEC2110]();
}

uint64_t sub_24A3624EC()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_24A3624F8()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_24A362504()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_24A362510()
{
  return MEMORY[0x24BEC2018]();
}

uint64_t sub_24A36251C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24A362528()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24A362534()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24A362540()
{
  return MEMORY[0x24BDB7B90]();
}

uint64_t sub_24A36254C()
{
  return MEMORY[0x24BDB7B98]();
}

uint64_t sub_24A362558()
{
  return MEMORY[0x24BDB7BA0]();
}

uint64_t sub_24A362564()
{
  return MEMORY[0x24BDB7BA8]();
}

uint64_t sub_24A362570()
{
  return MEMORY[0x24BDB7BB0]();
}

uint64_t sub_24A36257C()
{
  return MEMORY[0x24BDB7BE0]();
}

uint64_t sub_24A362588()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_24A362594()
{
  return MEMORY[0x24BDB7C30]();
}

uint64_t sub_24A3625A0()
{
  return MEMORY[0x24BDB7C80]();
}

uint64_t sub_24A3625AC()
{
  return MEMORY[0x24BDB7CD0]();
}

uint64_t sub_24A3625B8()
{
  return MEMORY[0x24BDB7CF0]();
}

uint64_t sub_24A3625C4()
{
  return MEMORY[0x24BDB7D10]();
}

uint64_t sub_24A3625D0()
{
  return MEMORY[0x24BDB7D30]();
}

uint64_t sub_24A3625DC()
{
  return MEMORY[0x24BDB7D50]();
}

uint64_t sub_24A3625E8()
{
  return MEMORY[0x24BDB7D60]();
}

uint64_t sub_24A3625F4()
{
  return MEMORY[0x24BDB7D78]();
}

uint64_t sub_24A362600()
{
  return MEMORY[0x24BDB7D88]();
}

uint64_t sub_24A36260C()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_24A362618()
{
  return MEMORY[0x24BDB7F28]();
}

uint64_t sub_24A362624()
{
  return MEMORY[0x24BDB7F40]();
}

uint64_t sub_24A362630()
{
  return MEMORY[0x24BDB7F70]();
}

uint64_t sub_24A36263C()
{
  return MEMORY[0x24BDB8008]();
}

uint64_t sub_24A362648()
{
  return MEMORY[0x24BDB8020]();
}

uint64_t sub_24A362654()
{
  return MEMORY[0x24BDB8078]();
}

uint64_t sub_24A362660()
{
  return MEMORY[0x24BDB8080]();
}

uint64_t sub_24A36266C()
{
  return MEMORY[0x24BDB8090]();
}

uint64_t sub_24A362678()
{
  return MEMORY[0x24BDB8098]();
}

uint64_t sub_24A362684()
{
  return MEMORY[0x24BDB80A8]();
}

uint64_t sub_24A362690()
{
  return MEMORY[0x24BDB80B8]();
}

uint64_t sub_24A36269C()
{
  return MEMORY[0x24BDB8190]();
}

uint64_t sub_24A3626A8()
{
  return MEMORY[0x24BDB81A0]();
}

uint64_t sub_24A3626B4()
{
  return MEMORY[0x24BDB8220]();
}

uint64_t sub_24A3626C0()
{
  return MEMORY[0x24BDB8238]();
}

uint64_t sub_24A3626CC()
{
  return MEMORY[0x24BDB8318]();
}

uint64_t sub_24A3626D8()
{
  return MEMORY[0x24BDB8328]();
}

uint64_t sub_24A3626E4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_24A3626F0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_24A3626FC()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_24A362708()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_24A362714()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_24A362720()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_24A36272C()
{
  return MEMORY[0x24BDECFB8]();
}

uint64_t sub_24A362738()
{
  return MEMORY[0x24BDECFC0]();
}

uint64_t sub_24A362744()
{
  return MEMORY[0x24BDECFD0]();
}

uint64_t sub_24A362750()
{
  return MEMORY[0x24BDED000]();
}

uint64_t sub_24A36275C()
{
  return MEMORY[0x24BDED030]();
}

uint64_t sub_24A362768()
{
  return MEMORY[0x24BDED058]();
}

uint64_t sub_24A362774()
{
  return MEMORY[0x24BDED070]();
}

uint64_t sub_24A362780()
{
  return MEMORY[0x24BDED080]();
}

uint64_t sub_24A36278C()
{
  return MEMORY[0x24BDED098]();
}

uint64_t sub_24A362798()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_24A3627A4()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_24A3627B0()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_24A3627BC()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_24A3627C8()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_24A3627D4()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_24A3627E0()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_24A3627EC()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_24A3627F8()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_24A362804()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_24A362810()
{
  return MEMORY[0x24BDEE2D8]();
}

uint64_t sub_24A36281C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_24A362828()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_24A362834()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_24A362840()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_24A36284C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_24A362858()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_24A362864()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_24A362870()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_24A36287C()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_24A362888()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_24A362894()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_24A3628A0()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_24A3628AC()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_24A3628B8()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_24A3628C4()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_24A3628D0()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_24A3628DC()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_24A3628E8()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_24A3628F4()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_24A362900()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_24A36290C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_24A362918()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_24A362924()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_24A362930()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_24A36293C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_24A362948()
{
  return MEMORY[0x24BDF13E0]();
}

uint64_t sub_24A362954()
{
  return MEMORY[0x24BDF13E8]();
}

uint64_t sub_24A362960()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_24A36296C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_24A362978()
{
  return MEMORY[0x24BEC23F0]();
}

uint64_t sub_24A362984()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_24A362990()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_24A36299C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_24A3629A8()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_24A3629B4()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_24A3629C0()
{
  return MEMORY[0x24BDF1BC0]();
}

uint64_t sub_24A3629CC()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_24A3629D8()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_24A3629E4()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_24A3629F0()
{
  return MEMORY[0x24BDF1D88]();
}

uint64_t sub_24A3629FC()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_24A362A08()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_24A362A14()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24A362A20()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_24A362A2C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24A362A38()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24A362A44()
{
  return MEMORY[0x24BDF24D0]();
}

uint64_t sub_24A362A50()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24A362A5C()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_24A362A68()
{
  return MEMORY[0x24BDF2B68]();
}

uint64_t sub_24A362A74()
{
  return MEMORY[0x24BDF3458]();
}

uint64_t sub_24A362A80()
{
  return MEMORY[0x24BDF3B90]();
}

uint64_t sub_24A362A8C()
{
  return MEMORY[0x24BDF3B98]();
}

uint64_t sub_24A362A98()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_24A362AA4()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_24A362AB0()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_24A362ABC()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_24A362AC8()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_24A362AD4()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_24A362AE0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_24A362AEC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_24A362AF8()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_24A362B04()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_24A362B10()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_24A362B1C()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_24A362B28()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_24A362B34()
{
  return MEMORY[0x24BEC23F8]();
}

uint64_t sub_24A362B40()
{
  return MEMORY[0x24BEC2400]();
}

uint64_t sub_24A362B4C()
{
  return MEMORY[0x24BEC2408]();
}

uint64_t sub_24A362B58()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_24A362B64()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_24A362B70()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_24A362B7C()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_24A362B88()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_24A362B94()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_24A362BA0()
{
  return MEMORY[0x24BDF43D0]();
}

uint64_t sub_24A362BAC()
{
  return MEMORY[0x24BDF43D8]();
}

uint64_t sub_24A362BB8()
{
  return MEMORY[0x24BDF43E8]();
}

uint64_t sub_24A362BC4()
{
  return MEMORY[0x24BDB8488]();
}

uint64_t sub_24A362BD0()
{
  return MEMORY[0x24BEC2410]();
}

uint64_t sub_24A362BDC()
{
  return MEMORY[0x24BDF4CD8]();
}

uint64_t sub_24A362BE8()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_24A362BF4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_24A362C00()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_24A362C0C()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_24A362C18()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_24A362C24()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_24A362C30()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_24A362C3C()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_24A362C48()
{
  return MEMORY[0x24BEC2418]();
}

uint64_t sub_24A362C54()
{
  return MEMORY[0x24BEC2420]();
}

uint64_t sub_24A362C60()
{
  return MEMORY[0x24BEC2428]();
}

uint64_t sub_24A362C6C()
{
  return MEMORY[0x24BEC2430]();
}

uint64_t sub_24A362C78()
{
  return MEMORY[0x24BEC2440]();
}

uint64_t sub_24A362C84()
{
  return MEMORY[0x24BEC2448]();
}

uint64_t sub_24A362C90()
{
  return MEMORY[0x24BEC2450]();
}

uint64_t sub_24A362C9C()
{
  return MEMORY[0x24BEC2458]();
}

uint64_t sub_24A362CA8()
{
  return MEMORY[0x24BEC2490]();
}

uint64_t sub_24A362CB4()
{
  return MEMORY[0x24BEC24A0]();
}

uint64_t sub_24A362CC0()
{
  return MEMORY[0x24BEC24B0]();
}

uint64_t sub_24A362CCC()
{
  return MEMORY[0x24BEC24B8]();
}

uint64_t sub_24A362CD8()
{
  return MEMORY[0x24BEC24C0]();
}

uint64_t sub_24A362CE4()
{
  return MEMORY[0x24BEC24C8]();
}

uint64_t sub_24A362CF0()
{
  return MEMORY[0x24BEC24D0]();
}

uint64_t sub_24A362CFC()
{
  return MEMORY[0x24BEC24D8]();
}

uint64_t sub_24A362D08()
{
  return MEMORY[0x24BEC24E0]();
}

uint64_t sub_24A362D14()
{
  return MEMORY[0x24BEC24E8]();
}

uint64_t sub_24A362D20()
{
  return MEMORY[0x24BEC2508]();
}

uint64_t sub_24A362D2C()
{
  return MEMORY[0x24BEC2518]();
}

uint64_t sub_24A362D38()
{
  return MEMORY[0x24BEC2520]();
}

uint64_t sub_24A362D44()
{
  return MEMORY[0x24BEC2528]();
}

uint64_t sub_24A362D50()
{
  return MEMORY[0x24BEC2530]();
}

uint64_t sub_24A362D5C()
{
  return MEMORY[0x24BEC2540]();
}

uint64_t sub_24A362D68()
{
  return MEMORY[0x24BEC2548]();
}

uint64_t sub_24A362D74()
{
  return MEMORY[0x24BEC2550]();
}

uint64_t sub_24A362D80()
{
  return MEMORY[0x24BEC2558]();
}

uint64_t sub_24A362D8C()
{
  return MEMORY[0x24BEC2568]();
}

uint64_t sub_24A362D98()
{
  return MEMORY[0x24BEC2570]();
}

uint64_t sub_24A362DA4()
{
  return MEMORY[0x24BEC2578]();
}

uint64_t sub_24A362DB0()
{
  return MEMORY[0x24BEC2580]();
}

uint64_t sub_24A362DBC()
{
  return MEMORY[0x24BEC2588]();
}

uint64_t sub_24A362DC8()
{
  return MEMORY[0x24BEC2598]();
}

uint64_t sub_24A362DD4()
{
  return MEMORY[0x24BEC25A0]();
}

uint64_t sub_24A362DE0()
{
  return MEMORY[0x24BEC25A8]();
}

uint64_t sub_24A362DEC()
{
  return MEMORY[0x24BEC25B0]();
}

uint64_t sub_24A362DF8()
{
  return MEMORY[0x24BEC25B8]();
}

uint64_t sub_24A362E04()
{
  return MEMORY[0x24BEC25C8]();
}

uint64_t sub_24A362E10()
{
  return MEMORY[0x24BDCF7F0]();
}

uint64_t sub_24A362E1C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24A362E28()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_24A362E34()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24A362E40()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24A362E4C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_24A362E58()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24A362E64()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24A362E70()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_24A362E7C()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_24A362E88()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24A362E94()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A362EA0()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_24A362EAC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24A362EB8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24A362EC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A362ED0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24A362EDC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_24A362EE8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24A362EF4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24A362F00()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24A362F0C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24A362F18()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_24A362F24()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_24A362F30()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_24A362F3C()
{
  return MEMORY[0x24BEB4770]();
}

uint64_t sub_24A362F48()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_24A362F54()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24A362F60()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_24A362F6C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_24A362F78()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24A362F84()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24A362F90()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24A362F9C()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_24A362FA8()
{
  return MEMORY[0x24BEC2130]();
}

uint64_t sub_24A362FB4()
{
  return MEMORY[0x24BEC25D0]();
}

uint64_t sub_24A362FC0()
{
  return MEMORY[0x24BEC25D8]();
}

uint64_t sub_24A362FCC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_24A362FD8()
{
  return MEMORY[0x24BEC25E0]();
}

uint64_t sub_24A362FE4()
{
  return MEMORY[0x24BEC25E8]();
}

uint64_t sub_24A362FF0()
{
  return MEMORY[0x24BEC25F0]();
}

uint64_t sub_24A362FFC()
{
  return MEMORY[0x24BEC25F8]();
}

uint64_t sub_24A363008()
{
  return MEMORY[0x24BEC2600]();
}

uint64_t sub_24A363014()
{
  return MEMORY[0x24BEC2608]();
}

uint64_t sub_24A363020()
{
  return MEMORY[0x24BEC2610]();
}

uint64_t sub_24A36302C()
{
  return MEMORY[0x24BEC2618]();
}

uint64_t sub_24A363038()
{
  return MEMORY[0x24BEC2620]();
}

uint64_t sub_24A363044()
{
  return MEMORY[0x24BEC2628]();
}

uint64_t sub_24A363050()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24A36305C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_24A363068()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_24A363074()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_24A363080()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24A36308C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24A363098()
{
  return MEMORY[0x24BEC2020]();
}

uint64_t sub_24A3630A4()
{
  return MEMORY[0x24BEC2630]();
}

uint64_t sub_24A3630B0()
{
  return MEMORY[0x24BEC2640]();
}

uint64_t sub_24A3630BC()
{
  return MEMORY[0x24BEC2658]();
}

uint64_t sub_24A3630C8()
{
  return MEMORY[0x24BEC2028]();
}

uint64_t sub_24A3630D4()
{
  return MEMORY[0x24BEC2660]();
}

uint64_t sub_24A3630E0()
{
  return MEMORY[0x24BEC2670]();
}

uint64_t sub_24A3630EC()
{
  return MEMORY[0x24BEC2690]();
}

uint64_t sub_24A3630F8()
{
  return MEMORY[0x24BEC2698]();
}

uint64_t sub_24A363104()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24A363110()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24A36311C()
{
  return MEMORY[0x24BEC26B0]();
}

uint64_t sub_24A363128()
{
  return MEMORY[0x24BEC26C0]();
}

uint64_t sub_24A363134()
{
  return MEMORY[0x24BEC26C8]();
}

uint64_t sub_24A363140()
{
  return MEMORY[0x24BEC26D0]();
}

uint64_t sub_24A36314C()
{
  return MEMORY[0x24BEC26E0]();
}

uint64_t sub_24A363158()
{
  return MEMORY[0x24BEC26E8]();
}

uint64_t sub_24A363164()
{
  return MEMORY[0x24BEC26F0]();
}

uint64_t sub_24A363170()
{
  return MEMORY[0x24BEC26F8]();
}

uint64_t sub_24A36317C()
{
  return MEMORY[0x24BEC2708]();
}

uint64_t sub_24A363188()
{
  return MEMORY[0x24BEE5740]();
}

uint64_t sub_24A363194()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t sub_24A3631A0()
{
  return MEMORY[0x24BEB4780]();
}

uint64_t sub_24A3631AC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_24A3631B8()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_24A3631C4()
{
  return MEMORY[0x24BEC2710]();
}

uint64_t sub_24A3631D0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24A3631DC()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_24A3631E8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_24A3631F4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24A363200()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24A36320C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24A363218()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_24A363224()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24A363230()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24A36323C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24A363248()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24A363254()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24A363260()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24A36326C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_24A363278()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_24A363284()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24A363290()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24A36329C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_24A3632A8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24A3632B4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24A3632C0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24A3632CC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24A3632D8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_24A3632E4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_24A3632F0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24A3632FC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_24A363308()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_24A363314()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24A363320()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24A36332C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24A363338()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_24A363344()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_24A363350()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24A36335C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24A363368()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24A363374()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A363380()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A36338C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24A363398()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_24A3633A4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24A3633B0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24A3633BC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24A3633C8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24A3633D4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t DeviceIsSlow()
{
  return MEMORY[0x24BEC2718]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

